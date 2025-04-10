// Standard headers
#include <stddef.h>
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

	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	return
		wait_for_state
		(
			DL_CONFIGURATOR_LANE_STATUS_PTR,
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
				DL_CONFIGURATOR_LANE_STATUS_PTR,
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

static enum action_result wait_test_end
(
	const struct test_config test [const static 1]
)
{
	unsigned int timer = 0;

	for (;;)
	{
		bool completed = true;

		for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
		{
			if (!(test->enable_mask & (1 << i)))
			{
				continue;
			}

			if
			(
				!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i))
				|| !DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i))
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

			for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
			{
				if (!(test->enable_mask & (1 << i)))
				{
					continue;
				}

				if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
				{
					debug_printf("\r\n Generator channel %d not ended\r\n", i);
				}

				if (!DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i)))
				{
					debug_printf("\r\n Analyzer channel %d not ended\r\n", i);
				}
			}

			return TIMEOUT;
		}
	}
}

void initiate_test (const struct test_config test [const static 1])
{
	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{
			*DL_ANALYZER_X_CONFIGURATION_PTR(i) =
				DL_ANALYZER_CONFIGURATION_TO_UINT32_T(test[i].ana_conf[i]);

			*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
				DL_GENERATOR_CONFIGURATION_TO_UINT32_T(test[i].gen_conf[i]);

			*DL_ANALYZER_X_INITIAL_VALUE_PTR(i) = test[i].ana_init[i];

			*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = test[i].gen_init[i];
		}
	}

	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{
			DL_ANALYZER_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_ANALYZER_X_CONTROL_PTR(i));
			DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));
		}
	}
}

enum action_result finalize_test
(
	const struct test_config test [const static 1]
)
{
	uint32_t error_counter = 0;

	if (wait_test_end(test) == OK)
	{
		const bool expect_errors = test->expect_errors;

		for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
		{
			if (!(test->enable_mask & (1 << i)))
			{
				continue;
			}

			uint32_t local_errors_count =
				DL_ANALYZER_STATUS_GET(ERROR_COUNTER, *DL_ANALYZER_X_STATUS_PTR(i));

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
					i,
					(expect_errors ? "errors expected" : "no errors expected")
				);
			}

			error_counter += local_errors_count;
		}

		if
		(
			((error_counter == 0) && !expect_errors)
			|| ((error_counter > 0) && expect_errors)
		)
		{
			return OK;
		}
	}

	return TIMEOUT;
}

enum action_result run_test (const struct test_config test [const static 1])
{
	initiate_test(test);

	return finalize_test(test);
}

enum action_result initialization_sequence (void)
{
	if
	(
		(initialize() != OK)
		|| (_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	return OK;
}

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
)
{
	unsigned int successes = 0;

	for (unsigned int i = 0; i < test_count; ++i)
	{
		switch (run_test(test + i))
		{
			case OK:
				successes++;
				break;

			case TIMEOUT:
				debug_printf("\r\nTest %d timed out.\r\n", i);
				break;

			case FAILURE:
				debug_printf("\r\nTest %d failed.\r\n", i);
				break;
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

enum action_result init_and_run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
)
{
	if (initialization_sequence() != OK)
	{
		return TIMEOUT;
	}

	return run_tests(test_count, test);
}
