//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : config2_scenario_dl_lpb.c
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
#include "config2_scenario_dl_lpb.h"
// Common
#include "common.h"
#include "shared_header.h"

#define __WORDS_TO_BYTES(x) (4 * (x))
//##########################################################################
//## Scenario : Transmission Reception loopback
//##########################################################################
/******************************************************************************/
/**** STEP 1 ******************************************************************/
/******************************************************************************/

#define STEP1_TESTS_COUNT 10
static const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		// Test 1: Send a data packet of 64 words to each virtual buffer, check
		// that the data are received on Data_Link_Analyzer
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 2: Send a data packet of 64 words to each virtual buffer, with 2
		// different seeds on Data_Link_Analyzer and Data_Link_Generator. Check
		// that Data_Link_Analyzer models detect errors.
		INVALID_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1, /* First packet? */
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 3: Send multiple packets of pseudo-random size to each virtual
		// buffer, check that the data are received on Data_Link_Analyzer
		//
		// Opting for a https://xkcd.com/221/ inspired solution
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00000001,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(4)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00002001,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(23)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00400001,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(42)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x05000300,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(13)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xCAFE4BEEF,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(7)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEF4CAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(32)
			}
		),
		// Test 4: Send a broadcast frame, check that the data are received on
		// [the] Data_Link_Broadacst_Analyzer model
		BASIC_CONFIG
		(
			ONLY_BROADCAST_CHANS,
			0x02000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 5: Send a broadcast frame with 2 different seeds on
		// Data_Link_Broadcast_Analyzer and Data_Link_Broadcast_Generator check
		// that the data received on Data_Link_Broadcast_Analyzer models are
		// incorrect.
		INVALID_CONFIG
		(
			ONLY_BROADCAST_CHANS,
			0x03000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};

void configuration2_dl_lpb_step1 (void)
{
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 1: Check data and broadcast frames transmission and reception \r\n");

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	// Wait 1 us
	wait(2); // FIXME: should be 1us.

	// Check credit_VC signals for each virtual channels are at 1 in the
	// data_link_configurator
	uint32_t val =
		DL_CONFIGURATOR_DL_STATUS_1_GET(CREDIT_VC, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (val != 0xFF)
	{
		debug_printf("\r\n ERROR: credit CV is not 0xFF but 0x%X.\r\n", val);

		return;
	}

	// Runs regular sending of packets, as described in step1_test.
	run_tests(STEP1_TESTS_COUNT, step1_test);

	debug_printf("\r\n Step 1: END \r\n");
}


/******************************************************************************/
/**** STEP 2 ******************************************************************/
/******************************************************************************/
#define STEP2_TESTS_COUNT 2
static const struct test_config step2_test[STEP2_TESTS_COUNT] =
	{
		// Test 1: Sanity check, no broadcast
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x34000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x04000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
	};

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
		debug_printf("\r\n ACK_COUNTER_TX did not increase for channel %d. \r\n", i);
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, last_status)
		>= DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, new_status)
	)
	{
		debug_printf("\r\n ACK_COUNTER_RX did not increase for channel %i. \r\n", i);
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, last_status)
		>= DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, new_status)
	)
	{
		debug_printf("\r\n FCT_COUNTER_TX did not increase for channel %d. \r\n", i);
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, last_status)
		>= DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, new_status)
	)
	{
		debug_printf("\r\n FCT_COUNTER_RX did not increase for channel %i. \r\n", i);
	}

	// May actually not be that tied:
#ifdef nopedynope
	if
	(
		(
			DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, new_status)
			- DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, last_status)
		)
		!=
		(
			DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, new_status)
			- DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, last_status)
		)
	)
	{
		debug_printf("\r\n ACK_COUNTER_RX and ACK_COUNTER_TX did not increase at the same rate for channel %i. \r\n", i);
	}
#endif
}

void configuration2_dl_lpb_step2 (void)
{
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 2: Check ACK transmission and reception \r\n");
	uint32_t last_status = 0, new_status = 0;

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	// FCT REQUEST CHECK?

	for (int i = 0; i < STEP2_TESTS_COUNT; ++i)
	{
		struct test_config test_fragment = step2_test[i];

		for (int j = 0; j < CHANNEL_COUNT; j++)
		{
			if (step2_test[i].enable_mask & (1 << j))
			{
				last_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

				test_fragment.enable_mask = (1 << j);

				run_test(&test_fragment);

				new_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

				assert_ack_counters_increased(last_status, new_status, j);
			}
		}
	}

	debug_printf("\r\n Step 2: END \r\n");
}

/******************************************************************************/
/**** STEP 3 ******************************************************************/
/******************************************************************************/
#define STEP3_TESTS_COUNT 4
static const struct test_config step3_test[STEP3_TESTS_COUNT] =
	{
		// Test 1: Send a data packet of 64 words to each virtual channel check
		// that the data are received on Data_Link_Analyzer models
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xC0A0F0E0,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 2: Send two data packets of 32 words to each virtual channel
		// check that the data are received on Data_Link_Analyzer models
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x0C0A0F0E,
			{
				.packet_number = 2, // That's packets _count_, not its number.
				.packet_size = __WORDS_TO_BYTES(32)
			}
		),
		// Test 3: Send two data packets of 64 words to a virtual channel check
		// that the data are received on Data_Link_Analyzer models
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00CAFE00,
			{
				.packet_number = 2,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 4: Send a data packet of 1 word to each virtual channel check
		// that the data are received on Data_Link_Analyzer models
		//
		// 1 byte instead
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xCA0000FE,
			{
				.packet_number = 1,
				.packet_size = 1
			}
		),
	};

void configuration2_dl_lpb_step3 (void)
{
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 3: Check output buffer flow control  \r\n");

	init_and_run_tests(STEP3_TESTS_COUNT, step3_test);

	debug_printf("\r\n Step 3: END \r\n");
}

/******************************************************************************/
/**** STEP 4 ******************************************************************/
/******************************************************************************/
#define STEP4_TESTS_COUNT 2
static const struct test_config step4_test[STEP4_TESTS_COUNT] =
	{
		// Test 1: Send 2 packets of 64 words to the virtual buffer 0
		//
		// We don't want these to actually succeed, so they should trigger errors
		// if they are received, and these errors should be reported if they
		// occur (unlike INVALID_CONFIG, which will not display errors when they
		// occur as expected).
		FORCE_ERROR_CONFIG
		(
			0x1, // Channel 0
			0xB0E0E0F0,
			{
				.packet_number = 2, // That's packets _count_, not its number.
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		// Test 2: Send a packet of 64 words to the virtual buffer 0
		//
		// This is the one that should succeed.
		BASIC_CONFIG
		(
			0x1, // Channel 0
			0x0C0A0F0E,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};

void configuration2_dl_lpb_step4 (void)
{
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 4: Check continuous mode output buffers \r\n");

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		CONTINUOUS_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	// This one should timeout
	debug_printf("\r\n Ignore the timeout error below: we want it to occur.\r\n");
	if (run_test(step4_test + 0) != TIMEOUT)
	{
		debug_printf("\r\n Error: the 2 packets of 64 words did not timeout. \r\n");
	}
	debug_printf("\r\n From this point on, no timeouts are expected.\r\n");

	initiate_test(step4_test + 1);

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x0,
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	finalize_test(step4_test + 1);

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		CONTINUOUS_VC,
		0x0,
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	debug_printf("\r\n Step 4: END \r\n");
}

/******************************************************************************/
/**** Function wiath all steps*************************************************/
/******************************************************************************/
void configuration2_dl_lpb_all_step (void)
{
  configuration2_dl_lpb_step1();
  configuration2_dl_lpb_step2();
  configuration2_dl_lpb_step3();
  configuration2_dl_lpb_step4();
}

/******************************************************************************/
/**** Function wiath all steps*************************************************/
/******************************************************************************/

void configuration2test_registre(void)
{
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}
	uint32_t temp1, temp2;
	uint32_t reg = *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	debug_printf("\r\n TEST REG \r\n");
	
	temp1 = DL_CONFIGURATOR_LANE_PARAMETER_GET(LANESTART, reg);
	temp2 = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET);
	debug_printf("\r\n TEST LANE PARAMETER temp 1: %x \r\n", temp1);
	debug_printf("\r\n TEST LANE PARAMETER temp 2: %x \r\n", temp2);
	debug_printf("\r\n TEST ggggggggggggggggggg \r\n");
	*DL_GENERATOR_X_INITIAL_VALUE_PTR(4) = 0x62U;
	debug_printf("\r\n TEST ooooooooooooooo\r\n");
	temp1 = *DL_GENERATOR_X_INITIAL_VALUE_PTR(4);
	debug_printf("\r\n TESTnnnnnnnnnnnnnnnnnnnnnnn \r\n");
	temp2 = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
	debug_printf("\r\n TEST DL_GENERATOR_X_INITIAL_VALUE_PTR(4) temp 1: %x \r\n", temp1);
	debug_printf("\r\n TEST MOD_CONF_STATUS_LANE_REG_OFFSET temp 2: %x \r\n", temp2);
}