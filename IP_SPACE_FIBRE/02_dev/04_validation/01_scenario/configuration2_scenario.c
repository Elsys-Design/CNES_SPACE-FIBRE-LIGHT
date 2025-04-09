//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : configuration_2_scenario.c
//## PROJECT       : SPACE FIBRE LIGHT
//##########################################################################

// Standard headers
#include <stdint.h>
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

#define STEP1_TESTS_COUNT 5
static const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		// Test 1: Sanity check, no broadcast
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1, /* First packet? */
				.packet_size = 64 /* words */
			}
		),
		// Test 2: Invalid message detection, no broadcast
		INVALID_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1, /* First packet? */
				.packet_size = 64 /* words */
			}
		),
		// Test 3: Don't know how to generate a frame.
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00000001,
			{
				.packet_number = 31,
				.packet_size = 260
			}
		),
		// Test 4: Broadcast test for a frame.
		BASIC_CONFIG
		(
			ONLY_BROADCAST_CHANS,
			0x02000000,
			{
				.packet_number = 31,
				.packet_size = 260
			}
		),
		// Test 5: Broadcast test for an invalid frame.
		INVALID_CONFIG
		(
			ONLY_BROADCAST_CHANS,
			0x03000000,
			{
				.packet_number = 31,
				.packet_size = 260
			}
		),
	};

#define STEP2_TESTS_COUNT 2
static const struct test_config step2_test[STEP1_TESTS_COUNT] =
	{
		// Test 1: Sanity check, no broadcast
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1,
				.packet_size = 64
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x04000000,
			{
				.packet_number = 4,
				.packet_size = 260
			}
		),
	};

void scenario2_step1 (void)
{
	debug_printf("\r\n Start scenario 2\r\n");
	debug_printf("\r\n Step 1: \r\n");

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	wait(2); // FIXME: should be 2us.

	uint32_t val =
		DL_CONFIGURATOR_DL_STATUS_1_GET(CREDIT_VC, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (val != 0xFF)
	{
		debug_printf("\r\n ERROR: credit CV is not 0xFF but 0x%X.\r\n", val);

		return;
	}

	run_tests(STEP1_TESTS_COUNT, step1_test);

	debug_printf("\r\n Step 1: END \r\n");
}

static void assert_ack_counters_increased
(
	const uint32_t last_status,
	const uint32_t new_status,
	const int i
)
{
	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, last_status)
		>= DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, new_status)
	)
	{
		debug_printf("\r\n ACK_COUNTER_TX did not increase in test %d. \r\n", i);
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, last_status)
		>= DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, new_status)
	)
	{
		debug_printf("\r\n ACK_COUNTER_RX did not increase in test %i. \r\n", i);
	}
}

void scenario2_step2 (void)
{
	debug_printf("\r\n Start scenario 2\r\n");
	debug_printf("\r\n Step 2: \r\n");
	uint32_t last_status = 0, new_status = 0;

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	// FCT REQUEST CHECK?

	last_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

	run_test(step2_test + 0);

	new_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

	assert_ack_counters_increased(last_status, new_status, 0);

	last_status = new_status;

	run_test(step2_test + 1);

	new_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

	assert_ack_counters_increased(last_status, new_status, 1);

	debug_printf("\r\n Step 2: END \r\n");
}
