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
#include "shared_header.h"

#define DEFAULT_TIMEOUT 2000000U

static enum action_result initialize (void)
{
	debug_printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

	reset_the_dut();
	lane_reset_conf();

	CONF_PARAMETER_SET_IN_PLACE(LANESTART, 1, *CONFIGURATOR_PARAMETER_PTR);

	return
		wait_for_state
		(
			CONFIGURATOR_STATUS_PTR,
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
				CONFIGURATOR_STATUS_PTR,
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

enum action_result wait_test_end (const uint32_t channel_count)
{
	unsigned int timer = 0;

	for (;;)
	{
		bool completed = true;

		for (uint32_t i = 0; i < channel_count; ++i)
		{
			if
			(
				!GEN_STATUS_GET(TEST_END, *GENERATOR_X_STATUS_PTR(i))
				|| !ANA_STATUS_GET(TEST_END, *ANALYZER_X_STATUS_PTR(i))
			)
			{
				completed = false;

				break;
			}
		}

		if (completed)
		{
			return OK;
		}

		if (timer >= 20000)
		{
			debug_printf("\r\n wait_end_test timeout\r\n");

			for (uint32_t i = 0; i < channel_count; ++i)
			{
				if (!GEN_STATUS_GET(TEST_END, *GENERATOR_X_STATUS_PTR(i)))
				{
					debug_printf("\r\n Generator channel %d not ended\r\n", i);
				}

				if (!ANA_STATUS_GET(TEST_END, *ANALYZER_X_STATUS_PTR(i)))
				{
					debug_printf("\r\n Analyzer channel %d not ended\r\n", i);
				}
			}

			return TIMEOUT;
		}
	}
}

void start_test (const uint32_t channel_count)
{
	for (uint32_t i = 0; i < channel_count; ++i)
	{
		ANA_CONTROL_SET_IN_PLACE(MODEL_START, 1, *ANALYZER_X_CONTROL_PTR(i));
		GEN_CONTROL_SET_IN_PLACE(MODEL_START, 1, *GENERATOR_X_CONTROL_PTR(i));
	}
}

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test[const static test_count],
	const uint32_t channel_count
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
		const bool expect_errors = test[i].expect_errors;

		// Only one generator & analyzer here.
		for (uint32_t j = 0; j < channel_count; ++j)
		{
			*((volatile uint32_t *) (ANALYZER_X_CONFIGURATION_PTR(j))) =
				ANA_CONFIGURATION_TO_UINT32_T(test[i].ana_conf[j]);

			*((volatile uint32_t *) (GENERATOR_X_CONFIGURATION_PTR(j))) =
				GEN_CONFIGURATION_TO_UINT32_T(test[i].gen_conf[j]);

			*((volatile uint32_t *) (ANALYZER_X_INITIAL_VALUE_PTR(j))) =
				test[i].ana_init[j];

			*((volatile uint32_t *) (GENERATOR_X_INITIAL_VALUE_PTR(j))) =
				test[i].gen_init[j];
		}

		start_test(channel_count);

		if (wait_test_end(channel_count) == OK)
		{
			uint32_t total_errors_count = 0;

			for (uint32_t j = 0; j < channel_count; ++j)
			{
				uint32_t local_errors_count =
					ANA_STATUS_GET(ERROR_COUNTER, *ANALYZER_X_STATUS_PTR(j));

				if
				(
					((local_errors_count > 0) && !expect_errors)
					|| ((local_errors_count == 0) && expect_errors)
				)
				{
					debug_printf
					(
						"\r\n Issue: test %d completed with %d errors out on channel %d (%s).\r\n",
						i,
						local_errors_count,
						j,
						(expect_errors ? "errors expected" : "no errors expected")
					);
				}

				total_errors_count += local_errors_count;
			}

			if
			(
				((total_errors_count == 0) && !expect_errors)
				|| ((total_errors_count > 0) && expect_errors)
			)
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

