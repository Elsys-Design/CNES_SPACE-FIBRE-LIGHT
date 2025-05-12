//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : config2_scenario_dl_link_reset.c
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
#include "config2_scenario_dl_link_reset.h"
// Common
#include "common.h"
#include "shared_header.h"

#define __WORDS_TO_BYTES(x) (((4 * (x)) > 255) ? 255 : (4 * (x)))
//##########################################################################
//## Scenario : Link reset FSM
//##########################################################################

/******************************************************************************/
/**** Step 1: Interface RESET  ************************************************/
/******************************************************************************/
#define STEP1_TESTS_COUNT 2
static const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEFCAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x4562CAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};
void configuration2_dl_link_reset_step1 (void)
{
	uint32_t temp1, temp2;
	uint32_t step1_failed =0;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Link Reset\r\n");
	debug_printf("\r\n Step 1: Check interface reset \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	if (run_test(step1_test)!= OK)
	{
		step1_failed = 1;
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (temp2 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}

  //Assert and de-assert Interface Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		INTERFACE_RESET,
		0x1, /* Assert Interface_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	wait_us_clk_150mhz(10);

  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		debug_printf("\r\n Error: LANE_STATE is active \r\n");
		step1_failed = 1;
	}

  //Check PAUSE_VC for channel 0 is de-asserted
	if (DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR) != 0)
	{
		debug_printf("\r\n Error: PAUSE_VC = x%x is not reset\r\n", temp1);
		step1_failed = 1;
	}

	//Check Link_reset_asserted is at ‘1’
	if (!DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR))
	{
		debug_printf("\r\n Error: LINK_RESET_ASSERTED = x0 not asserted\r\n");
		step1_failed = 1;
	}

	//Clear Link_reset_asserted
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Enable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);
  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();
  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer model

	if((run_test(step1_test+1) != OK) || (step1_failed == 1))
	{
		debug_printf("\r\n Step 1 END: FAILED \r\n");
	}
	else
	{
		debug_printf("\r\n Step 1 END: PASS \r\n");
	}
	
}

void configuration2_dl_link_reset_step1_dbg_step2 (void)
{
	uint32_t temp1, temp2;
	uint32_t step1_failed =0;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Link Reset\r\n");
	debug_printf("\r\n Step 1: Check interface reset \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}

	if (run_test(step1_test)!= OK)
	{
		step1_failed = 1;
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (temp2 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}
//////////////////////////////////////////////////////

  //Assert and de-assert Link Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x1, /* Assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	//Diseable LaneStart
	// DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 0, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	// temp1=  *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	// debug_printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR = x%x \r\n", temp1);

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x0,/* De-assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

///////////////////////////////////////////////////////////////////
	wait_us_clk_150mhz(10);

  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		debug_printf("\r\n Error: LANE_STATE is active \r\n");
		step1_failed = 1;
	}

  //Check PAUSE_VC for channel 0 is de-asserted
	if (DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR) != 0)
	{
		debug_printf("\r\n Error: PAUSE_VC = x%x is not reset\r\n", temp1);
		step1_failed = 1;
	}

	//Check Link_reset_asserted is at ‘1’
	if (!DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR))
	{
		debug_printf("\r\n Error: LINK_RESET_ASSERTED = x0 not asserted\r\n");
		step1_failed = 1;
	}

	//Clear Link_reset_asserted
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Enable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);
  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();
  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer model

	if((run_test(step1_test+1) != OK) || (step1_failed == 1))
	{
		debug_printf("\r\n Step 1 END: FAILED \r\n");
	}
	else
	{
		debug_printf("\r\n Step 1 END: PASS \r\n");
	}
	
}
/******************************************************************************/
/**** Step 2: Link RESET  ************************************************/
/******************************************************************************/
#define STEP2_TESTS_COUNT 2
static const struct test_config step2_test[STEP2_TESTS_COUNT] =
	{
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEF5622,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEF1111,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};

void configuration2_dl_link_reset_step2 (void)
{
	uint32_t temp1, temp2;
	uint32_t step2_failed =0;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Link Reset\r\n");
	debug_printf("\r\n Step 2: Check link reset \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}
	// Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if (run_test(step1_test) != OK)
	{
		step2_failed = 1;
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp2 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}

	//Diseable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 0, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	temp1=  *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR = x%x \r\n", temp1);

  //Assert and de-assert Link Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x1, /* Assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  wait(5);
  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		debug_printf("\r\n Error: LANE_STATE is active \r\n");
		step2_failed = 1;
	}
	temp1= *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	debug_printf("\r\n Before de-assert DL_CONFIGURATOR_DL_PARAMETER_PTR = x%x \r\n", temp1);

	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x0,/* De-assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);


	temp1= *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	debug_printf("\r\n After de-assert DL_CONFIGURATOR_DL_PARAMETER_PTR = x%x \r\n", temp1);

  //Check PAUSE_VC for channel 0 is still asserted
	temp1= DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		debug_printf("\r\n Error: PAUSE_VC = x%x is reset\r\n", temp1);
		step2_failed = 1;
	}

  //Check Link_reset_asserted is at ‘1’
	temp1 = DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		debug_printf("\r\n Error: LINK_RESET_ASSERTED = x%x not asserted\r\n", temp1);
		step2_failed = 1;
	}
  //Clear Link_reset_asserted
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);
	

	temp1=  *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR = x%x \r\n", temp1);

	temp1= *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR = x%x \r\n", temp1);

	temp1= *DL_CONFIGURATOR_LANE_STATUS_PTR;
	debug_printf("\r\n DL_CONFIGURATOR_LANE_STATUS_PTR = x%x \r\n", temp1);
	
	wait_us_clk_150mhz(10);

	//Enable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);
  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();


  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if((run_test(step2_test+1) != OK) || (step2_failed == 1))
	{
		debug_printf("\r\n Step 2 END: FAILED \r\n");
	}
	else
	{
		debug_printf("\r\n Step 2 END: PASS \r\n");
	}
}

void configuration2_dl_link_reset_step2_alt (void)
{
	uint32_t temp1, temp2;
	uint32_t step2_failed =0;
	debug_printf("\r\n Start configuration 2\r\n");
	debug_printf("\r\n Start scenario: Link Reset\r\n");
	debug_printf("\r\n Step 2: Check link reset \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (initialization_sequence() != OK)
	{
		debug_printf("\r\n Initialization sequence failed. \r\n");

		return;
	}
	// Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if (run_test(step2_test) != OK)
	{
		step2_failed = 1;
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp2 == 0)
	{
		debug_printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		debug_printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}

	// temp1=  *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	// debug_printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR = x%x \r\n", temp1);

  //Assert and de-assert Link Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x1, /* Assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);


	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x0,/* De-assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	wait_us_clk_150mhz(2);

  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		debug_printf("\r\n Error: LANE_STATE is active \r\n");
		step2_failed = 1;
	}

  //Check PAUSE_VC for channel 0 is still asserted
	temp1= DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		// debug_printf("\r\n Error: PAUSE_VC = x%x is reset\r\n", temp1);
		// step2_failed = 1;
	}
	
  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x0, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check Link_reset_asserted is at ‘1’
	temp1 = DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		debug_printf("\r\n Error: LINK_RESET_ASSERTED = x%x not asserted\r\n", temp1);
		step2_failed = 1;
	}
  //Clear Link_reset_asserted
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);
	

	// temp1=  *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	// debug_printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR = x%x \r\n", temp1);

	// temp1= *DL_CONFIGURATOR_DL_PARAMETER_PTR;
	// debug_printf("\r\n DL_CONFIGURATOR_DL_PARAMETER_PTR = x%x \r\n", temp1);

	// temp1= *DL_CONFIGURATOR_LANE_STATUS_PTR;
	// debug_printf("\r\n DL_CONFIGURATOR_LANE_STATUS_PTR = x%x \r\n", temp1);
	

	//Enable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);
  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();


  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if((run_test(step2_test+1) != OK) || (step2_failed == 1))
	{
		debug_printf("\r\n Step 2 END: FAILED \r\n");
	}
	else
	{
		debug_printf("\r\n Step 2 END: PASS \r\n");
	}
}

/******************************************************************************/
/**** Function wiath all steps*************************************************/
/******************************************************************************/
void configuration2_dl_link_reset_all_step (void)
{
  configuration2_dl_link_reset_step1();
  configuration2_dl_link_reset_step2();
}