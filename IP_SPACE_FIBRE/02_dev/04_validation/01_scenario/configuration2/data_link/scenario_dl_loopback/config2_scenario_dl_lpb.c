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

#define __WORDS_TO_BYTES(x) (((4 * (x)) > 511) ? 511 : (4 * (x)))

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
		// Opting for a https://xkcd.com/221/ inspired solution*

		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x00000001,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(8)
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
			0xCAFEBEEF,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(7)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEFCAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(7)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xCAFEBEEF,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(55)
			}
		),
		BASIC_CONFIG
		(
			ONLY_BROADCAST_CHANS,
			0x02000000,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(2)
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
				.packet_size = __WORDS_TO_BYTES(2)
			}
		)
	};

void configuration2_dl_lpb_step1 (void)
{
	uint32_t temp;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 1: Check data and broadcast frames transmission and reception \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	// Wait 1 us
	wait_us_clk_150mhz(3000);
	// Check credit_VC signals for each virtual channels are at 1 in the
	// data_link_configurator
	uint32_t val =
		DL_CONFIGURATOR_DL_STATUS_1_GET(CREDIT_VC, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (val != 0xFF)
	{
		debug_printf("\r\n ERROR: credit VC is not 0xFF but 0x%x.\r\n", val);
		temp = *DL_CONFIGURATOR_DL_STATUS_1_PTR;
		debug_printf("\r\n DL_CONFIGURATOR_DL_STATUS_1_PTR %x.\r\n", temp);
		temp = *DL_CONFIGURATOR_DL_STATUS_2_PTR;
		debug_printf("\r\n DL_CONFIGURATOR_DL_STATUS_2_PTR %x.\r\n", temp);
		temp = *DL_CONFIGURATOR_DL_QOS_2_PTR;
		debug_printf("\r\n DL_CONFIGURATOR_DL_QOS_2_PTR %x.\r\n", temp);
		temp = DL_CONFIGURATOR_DL_QOS_2_GET(NACK_COUNTER_TX,*DL_CONFIGURATOR_DL_QOS_2_PTR );
		debug_printf("\r\n NACK_COUNTER_TX %x.\r\n", temp);
		temp = DL_CONFIGURATOR_DL_QOS_2_GET(NACK_COUNTER_RX,*DL_CONFIGURATOR_DL_QOS_2_PTR );
		debug_printf("\r\n NACK_COUNTER_RX %x.\r\n", temp);
		return;
	}
	temp = *DL_CONFIGURATOR_DL_STATUS_1_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_STATUS_1_PTR %x.\r\n", temp);
	temp = *DL_CONFIGURATOR_DL_STATUS_2_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_STATUS_2_PTR %x.\r\n", temp);
	
	temp = *DL_CONFIGURATOR_DL_QOS_2_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_QOS_2_PTR %x.\r\n", temp);

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

static uint32_t assert_ack_counters_increased
(
	const uint32_t last_status,
	const uint32_t new_status,
	const int i
)
{
	uint32_t temp1, temp2;
	uint32_t step2_success = 0;
	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, last_status)
		== DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, new_status)
	)
	{
		temp1 = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, last_status);
		temp2 = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, new_status);
		debug_printf("\r\n ACK_COUNTER_TX did not change, last_status = %x / new_status = %x. For channel 0x%x \r\n", temp1, temp2, i);
		step2_success = 1;
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, last_status)
		== DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, new_status)
	)
	{
		temp1 = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, last_status);
		temp2 = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, new_status);
		debug_printf("\r\n ACK_COUNTER_RX did not change, last_status = %x / new_status = %x. For channel 0x%x  \r\n", temp1, temp2, i);
		step2_success = 1;
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, last_status)
		== DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, new_status)
	)
	{
		temp1 = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, last_status);
		temp2 = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, new_status);
		debug_printf("\r\n FCT_COUNTER_TX did not change, last_status = %x / new_status = %x. For channel 0x%x  \r\n", temp1, temp2, i);
		step2_success = 1;
	}

	if
	(
		DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, last_status)
		== DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, new_status)
	)
	{
		temp1 = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, last_status);
		temp2 = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, new_status);
		debug_printf("\r\n FCT_COUNTER_RX did not change, last_status = %x / new_status = %x.For channel 0x%x  \r\n", temp1, temp2, i);
		step2_success = 1;
	}
  return step2_success;
}


void configuration2_dl_lpb_step2 (void)
{
	uint32_t last_status = 0, new_status = 0, step2_success=0;
	uint32_t temp;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 2: CHECK ACK TRANSMISSION AND RECEPTION  \r\n");

	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	for (int j = 0; j < STEP2_TESTS_COUNT-1; j++)
	{
		for (int i = 0; i < CHANNEL_COUNT-1; ++i)
		{
			// save the context of tcounters
			last_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;


			// config analyzer
			*DL_ANALYZER_X_CONFIGURATION_PTR(i) =
			DL_ANALYZER_CONFIGURATION_TO_UINT32_T((step2_test+j)->ana_conf[i]);

			temp= DL_ANALYZER_CONFIGURATION_TO_UINT32_T((step2_test+j)->ana_conf[i]);
			debug_printf("\r\n DL_ANALYZER_CONFIGURATION_TO_UINT32_T  x%x not ended\r\n", temp);

			temp= *DL_ANALYZER_X_CONFIGURATION_PTR(i);
			debug_printf("\r\n DL_ANALYZER_CONFIGURATION_TO_UINT32_T  x%x not ended\r\n", temp);

	
  	  // config generator 
			*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
				DL_GENERATOR_CONFIGURATION_TO_UINT32_T((step2_test+j)->gen_conf[i]);
			
				temp= *DL_GENERATOR_X_CONFIGURATION_PTR(i);
				debug_printf("\r\n DL_GENERATOR_X_CONFIGURATION_PTR  x%x not ended\r\n", temp);

		
			// init value analyzer
			*DL_ANALYZER_X_INITIAL_VALUE_PTR(i) = (step2_test+j)->ana_init[i];


  	  // init value generator
			*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = (step2_test+j)->gen_init[i];

  	 // start models
			DL_ANALYZER_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_ANALYZER_X_CONTROL_PTR(i));
			DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));

			wait_us_clk_150mhz(300);

			// test ended ?
			if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
			{
				debug_printf("\r\n Generator channel x%x not ended\r\n", i);
				step2_success = 1;
			}
		
			if (!DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i)))
			{
				debug_printf("\r\n Analyzer channel x%x not ended\r\n", i);
				step2_success = 1;
			}

			// New counters value
			new_status = *DL_CONFIGURATOR_DL_QOS_2_PTR;

      // Counters comparison
			step2_success = assert_ack_counters_increased(last_status, new_status, i) | step2_success;
		}
	}

	if (step2_success == 0)
	{
		debug_printf("\r\n Step 2 END: PASS \r\n");
	}
	else{
		debug_printf("\r\n Step 2 END: FAILED \r\n");
	}
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
				.packet_size =1
			}
		)
	};

void configuration2_dl_lpb_step3 (void)
{
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 3: Check output buffer flow control  \r\n");

	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

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
			NO_BROADCAST_CHANS, 
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
			NO_BROADCAST_CHANS, 
			0x0C0A0F0E,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(5)
			}
		)
	};

void configuration2_dl_lpb_step4 (void)
{
	uint32_t temp;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 4: Check continuous mode output buffers \r\n");

	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		CONTINUOUS_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);



	temp = *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR %x \r\n", temp);

	// 2 packets of 64 words 
	if (run_test_gen_only(step4_test + 0) != OK)
	{
		debug_printf("\r\n Error: the 2 packets of 64 words did not generate correctly. \r\n");
	}

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x0,
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	temp = *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR %x \r\n", temp);

  // 2 packets of 64 words 
	if (run_test(step4_test + 1) != OK)
	{
		debug_printf("\r\n Error: 2 packets of 1 byte . \r\n");
	}

	temp= *DL_ANALYZER_X_CONFIGURATION_PTR(0);
	debug_printf("\r\n DL_ANALYZER_CONFIGURATION_TO_UINT32_T  x%x not ended\r\n", temp);

	temp= *DL_GENERATOR_X_CONFIGURATION_PTR(0);
	debug_printf("\r\n DL_GENERATOR_X_CONFIGURATION_PTR  x%x not ended\r\n", temp);

	temp= *DL_ANALYZER_X_CONTROL_PTR(0);
	debug_printf("\r\n DL_ANALYZER_X_CONTROL_PTR  x%x not ended\r\n", temp);

	temp= *DL_GENERATOR_X_CONTROL_PTR(0);
	debug_printf("\r\n DL_GENERATOR_X_CONTROL_PTR  x%x not ended\r\n", temp);

	temp= *DL_ANALYZER_X_STATUS_PTR(0);
	debug_printf("\r\n DL_ANALYZER_X_STATUS_PTR  x%x not ended\r\n", temp);


	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		CONTINUOUS_VC,
		0x0,
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	debug_printf("\r\n Step 4: END \r\n");
}

void configuration2_dl_lpb_step4_alt (void)
{
	uint32_t temp;
	uint32_t step4_failed = 0;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Data-Link Transmission reception loopback\r\n");
	debug_printf("\r\n Step 4: Check continuous mode output buffers \r\n");

	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}
	for (int i = 0; i < CHANNEL_COUNT-1; ++i)
	{
		DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
		(
			CONTINUOUS_VC,
			0x1 << i, /* Channel i */
			*DL_CONFIGURATOR_DL_PARAMETER_PTR
		);

		DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
		(
			PAUSE_VC,
			0x1 << i, /* Channel i */
			*DL_CONFIGURATOR_DL_PARAMETER_PTR
		);



		temp = *DL_CONFIGURATOR_DL_PARAMETER_PTR;
		debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR %x \r\n", temp);

		////////////////////////////////////// 1st send /////////////////////////////

		// 2 packets of 64 words 

  	// config generator 
		*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
			DL_GENERATOR_CONFIGURATION_TO_UINT32_T((step4_test+0)->gen_conf[i]);

			temp= *DL_GENERATOR_X_CONFIGURATION_PTR(i);
			debug_printf("\r\n DL_GENERATOR_X_CONFIGURATION_PTR  x%x\r\n", temp);

  	// init value generator
		*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = (step4_test+0)->gen_init[i];

  	// start models
		DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));

		wait_us_clk_150mhz(300);

		// Generator ended ?
		if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n Generator channel x%x not ended\r\n", i);
			step4_failed = 1;
		}

		temp= *DL_ANALYZER_X_STATUS_PTR(i);
		debug_printf("\r\n DL_ANALYZER STATUS x%x\r\n", temp);

  	////////////////////////////////////// 2nd send ///////////////////////////// 

		// config analyzer
		*DL_ANALYZER_X_CONFIGURATION_PTR(i) =
		DL_ANALYZER_CONFIGURATION_TO_UINT32_T((step4_test+1)->ana_conf[i]);

		temp= *DL_ANALYZER_X_CONFIGURATION_PTR(i);
		debug_printf("\r\n DL_ANALYZER_CONFIGURATION_TO_UINT32_T  x%x \r\n", temp);


  	// config generator 
		*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
			DL_GENERATOR_CONFIGURATION_TO_UINT32_T((step4_test+1)->gen_conf[i]);

		temp= *DL_GENERATOR_X_CONFIGURATION_PTR(i);
		debug_printf("\r\n DL_GENERATOR_X_CONFIGURATION_PTR  x%x \r\n", temp);

		// init value analyzer
		*DL_ANALYZER_X_INITIAL_VALUE_PTR(i) = (step4_test+1)->ana_init[i];

  	// init value generator
		*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = (step4_test+1)->gen_init[i];
	
		// start model generator to send an EOP
		DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));

		wait_us_clk_150mhz(300);

		// Generator ended ?
		if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n ERROR: Generator channel x%x not ended waiting EOP generation\r\n", i);
			step4_failed =1;
		}

  	// start models
		DL_ANALYZER_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_ANALYZER_X_CONTROL_PTR(i));
		DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));

		wait_us_clk_150mhz(300);

		// Generator ended ?
		if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n ERROR: Generator channel x%x not ended\r\n", i);
			step4_failed =1;
		}
		// Analyzer ended ?
		if (DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n ERROR: Analyzer channel x%x ended in pause mode\r\n", i);
			step4_failed =1;
		}

		// Disable pause
		DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
		(
			PAUSE_VC,
			0x0,
			*DL_CONFIGURATOR_DL_PARAMETER_PTR
		);

		temp = *DL_CONFIGURATOR_DL_PARAMETER_PTR;
		debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR %x \r\n", temp);

		wait_us_clk_150mhz(300);

		// Generator ended ?
		if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n ERROR: Generator channel x%x not ended\r\n", i);
			step4_failed =1;
		}
    // Analyzer ended ?
		if (!DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i)))
		{
			debug_printf("\r\n ERROR: Analyzer channel x%x not ended\r\n", i);
			step4_failed =1;
		}

		if (DL_ANALYZER_STATUS_GET(ERROR_COUNTER, *DL_ANALYZER_X_STATUS_PTR(i)) != 0)
		{
			temp= DL_ANALYZER_STATUS_GET(ERROR_COUNTER, *DL_ANALYZER_X_STATUS_PTR(i));
			debug_printf("\r\n ERROR: Analyzer error x%x on channel x%x \r\n", temp, i);
			step4_failed =1;
		}

		temp= *DL_ANALYZER_X_STATUS_PTR(i);
		debug_printf("\r\n DL_ANALYZER STATUS x%x\r\n", temp);
		DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
		(
			CONTINUOUS_VC,
			0x0,
			*DL_CONFIGURATOR_DL_PARAMETER_PTR
		);
	}

	if (step4_failed ==1)
	{
		debug_printf("\r\n Step 4 END : FAILED \r\n");
	}
	else
	{
		debug_printf("\r\n Step 4 END : PASS \r\n");
	}
	
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


