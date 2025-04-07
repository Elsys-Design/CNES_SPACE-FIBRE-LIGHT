//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : configuration_1_scenario_loopback.py
//## PROJECT       : SPACE FIBRE LIGHT
//##########################################################################
//## AUTHOR        : Elsys-Design (Yvan DAURIAC)
//## CREATED       : 05/12/2024
//##########################################################################
//## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
//##                 loopback in configuration 1
//##########################################################################
//## History       :	V1.0: Creation of the file
//##########################################################################

// Standard headers
#include <stdint.h>
// Driver
#include "gpio.h"
#include "uart_tx.h"
#include "models.h"
// Private
#include "lib_print.h"
#include "config.h"
#include "configuration1_scenario_loopback.h"
// Common
#include "common.h"

#define DEFAULT_TIMEOUT 2000000U

/* These could be macro constants, if space is an issue. */
static volatile uint32_t * const CONF_PHY_PARAMETERS_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_CONFIGURATOR_ADDR + MOD_CONF_PARAM_PHY_REG_OFFSET
	);

static volatile uint32_t * const CONF_PARAMETERS_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_CONFIGURATOR_ADDR + MOD_CONF_PARAM_LANE_REG_OFFSET
	);

static volatile uint32_t * const CONF_STATUS_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_CONFIGURATOR_ADDR + MOD_CONF_STATUS_LANE_REG_OFFSET
	);

static volatile uint32_t * const ANA_STATUS_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_ANALYZER_ADDR + MOD_ANA_STATUS_REG_OFFSET
	);

static volatile uint32_t * const GEN_STATUS_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_GENERATOR_ADDR + MOD_GEN_STATUS_REG_OFFSET
	);

static volatile uint32_t * const ANA_CONTROL_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_ANALYZER_ADDR + MOD_ANA_CONTROL_REG_OFFSET
	);

static volatile uint32_t * const GEN_CONTROL_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_GENERATOR_ADDR + MOD_GEN_CONTROL_REG_OFFSET
	);

static volatile uint32_t * const ANA_CONFIGURATION_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_ANALYZER_ADDR + MOD_ANA_CONFIG_REG_OFFSET
	);

static volatile uint32_t * const GEN_CONFIGURATION_REGISTER =
	(volatile uint32_t *)
	(
		MODEL_GENERATOR_ADDR + MOD_GEN_CONFIG_REG_OFFSET
	);

static enum action_result initialize (void)
{
	debug_printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

	reset_the_dut();
	lane_reset_conf();

	CONF_PARAMETER_SET_IN_PLACE(LANESTART, 1, *CONF_PARAMETERS_REGISTER);

	return
		wait_for_state
		(
			CONF_STATUS_REGISTER,
			LANE_STATE_STARTED,
			DEFAULT_TIMEOUT
		);
}

// _ prefix to avoid name collision
static enum action_result _wait_for_started_to_active (void)
{
	// The order matters.
	const enum lane_state valid_states[3] =
		{LANE_STATE_ACTIVE, LANE_STATE_CONNECTED, LANE_STATE_CONNECTING};

	wait(1023);

	// The set of allowed states shrinks at each iteration.
	for (int i = 3; i >= 1; i--)
	{
		if
		(
			wait_for_states
			(
				CONF_STATUS_REGISTER,
				i,
				valid_states,
				5000
			)
			!= OK
		)
		{
			return TIMEOUT;
		}
	}

	return OK;
}

// _ prefix to avoid name collision
static uint32_t _wait_end_test (void)
{
	unsigned int timer = 0;

	for (;;)
	{
		if
		(
			GEN_STATUS_GET(TEST_END, *GEN_STATUS_REGISTER)
			&& ANA_STATUS_GET(TEST_END, *ANA_STATUS_REGISTER)
		)
		{
			return OK;
		}

		if (timer >= 20000)
		{
			debug_printf("\r\n wait_end_test timeout\r\n");

			if (!GEN_STATUS_GET(TEST_END, *GEN_STATUS_REGISTER))
			{
				debug_printf("\r\n Generator not ended\r\n");
			}

			if (!ANA_STATUS_GET(TEST_END, *ANA_STATUS_REGISTER))
			{
				debug_printf("\r\n Generator not ended\r\n");
			}

			return TIMEOUT;
		}
	}
}

#define SETTINGS_COUNT 4

const uint32_t address_and_offset[SETTINGS_COUNT][2] =
	{
		{MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET},
		{MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET},
		{MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET},
		{MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET}
	};

// Yes, it's weird. But it's convenient.
#define EIGHT_ENTRIES_OF(...) \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__, \
	__VA_ARGS__, __VA_ARGS__, __VA_ARGS__, __VA_ARGS__

#define EIGHT_VARIANTS_OF(x) \
	(x), (x + 32), (x + 64), (x + 128), \
	(x + 256), (x + 512), (x + 1024), (x + 2048)

#define NINTH_VARIANT_OF(x) (x + 4096)

#define BASIC_CONFIG(init, ...) \
	{ \
		.gen_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.ana_conf = {EIGHT_ENTRIES_OF(__VA_ARGS__)}, \
		.gen_init = {EIGHT_VARIANTS_OF(init)}, \
		.ana_init = {EIGHT_VARIANTS_OF(init)}, \
		.broadcast_gen_conf = __VA_ARGS__, \
		.broadcast_ana_conf = __VA_ARGS__, \
		.broardcast_gen_init = NINTH_VARIANT_OF(init), \
		.broardcast_ana_init = NINTH_VARIANT_OF(init) \
	}

struct test_config
{
	struct generator_configuration gen_conf[8];
	struct analyzer_configuration ana_conf[8];
	struct generator_configuration broadcast_gen_conf;
	struct analyzer_configuration broadcast_ana_conf;
	uint32_t gen_init[8];
	uint32_t ana_init[8];
	uint32_t broardcast_gen_init;
	uint32_t broardcast_ana_init;
};

#define STEP1_TESTS_COUNT 5
const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		// Test 1
		BASIC_CONFIG(0x34000000, {.packet_number = 4, .packet_size = 4}),
		// Test 2
		BASIC_CONFIG
		(
			0x00FF0000,
			{
				.packet_number = 31,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 3
		BASIC_CONFIG
		(
			0x00000001,
			{
				.packet_number = 0x1F,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 4
		BASIC_CONFIG
		(
			0x02000000,
			{
				.packet_number = 2,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 5
		BASIC_CONFIG
		(
			0x03000000,
			{
				.packet_number = 1,
				.packet_size = 69,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
	};

#define STEP2_TESTS_COUNT 5
const struct test_config step2_test[STEP2_TESTS_COUNT] =
	{
		// Test 1
		BASIC_CONFIG(0x00000000, {.packet_number = 4, .packet_size = 260}),
		// Test 2
		BASIC_CONFIG
		(
			0x00000000,
			{
				.packet_number = 31,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 3
		BASIC_CONFIG
		(
			0x00000001,
			{
				.packet_number = 31,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 4
		BASIC_CONFIG
		(
			0x02000000,
			{
				.packet_number = 4,
				.packet_size = 260,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
		// Test 5
		BASIC_CONFIG
		(
			0x03000000,
			{
				.packet_number = 1,
				.packet_size = 69,
				.generation_data = GENERATION_DATA_PRBS
			}
		)
	};

static void start_test ()
{
	ANA_CONTROL_SET_IN_PLACE(MODEL_START, 1, *ANA_CONTROL_REGISTER);
	GEN_CONTROL_SET_IN_PLACE(MODEL_START, 1, *GEN_CONTROL_REGISTER);
}

static enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test[const static test_count]
)
{
	unsigned int successes = 0;

	if
	(
		(initialize() != OK)
		|| (_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	for (unsigned int i = 0; i < test_count; ++i)
	{
		// Only one generator & analyzer here.
		for (int j = 0; j < 1; ++j)
		{
			ANA_CONFIGURATION_REGISTER[j] =
				ANA_CONFIGURATION_TO_UINT32_T(test[i].ana_conf[j]);

			GEN_CONFIGURATION_REGISTER[j] =
				GEN_CONFIGURATION_TO_UINT32_T(test[i].gen_conf[j]);
		}
		start_test();

		if (_wait_end_test() == OK)
		{
			int errors = ANA_STATUS_GET(ERROR_COUNTER, *ANA_STATUS_REGISTER);

			debug_printf
			(
				"\r\n Test %d completed with %d errors out.\r\n",
				errors
			);

			if (errors == 0)
			{
				successes++;
			}
		}
		else
		{
			debug_printf("\r\nTest %d timed out.\r\n", i);
		}
	}

	debug_printf
	(
		"\r\nTest suite: %d out of %d tests succeeded.\r\n",
		successes,
		test_count
	);

	return OK;
}

void alt_scenario_loopback_step_1 (void)
{
	debug_printf("\r\n Start scenario loopback\r\n");
	debug_printf("\r\n Step 1: Parallel loopback START \r\n");

	CONF_PARAMETER_SET_IN_PLACE
	(
		PARALLEL_LOOPBACK_ENABLES,
		1,
		*CONF_PARAMETERS_REGISTER
	);

	run_tests(STEP1_TESTS_COUNT, step1_test);

	// Disable parallel loopback
	CONF_PARAMETER_SET_IN_PLACE
	(
		PARALLEL_LOOPBACK_ENABLES,
		0,
		*CONF_PARAMETERS_REGISTER
	);

	debug_printf("\r\n Step 1: Parallel loopback END \r\n");
}

void alt_scenario_loopback_step_2 (void)
{
	debug_printf("\r\n Step 2 START \r\n");

	CONF_PHY_PARAMETER_SET_IN_PLACE
	(
		NEAR_END_SERIAL_LOOPBACK,
		1,
		*CONF_PHY_PARAMETERS_REGISTER
	);

	run_tests(STEP2_TESTS_COUNT, step2_test);

	CONF_PHY_PARAMETER_SET_IN_PLACE
	(
		NEAR_END_SERIAL_LOOPBACK,
		0,
		*CONF_PHY_PARAMETERS_REGISTER
	);

	debug_printf("\r\n Step 2 END \r\n");
}
