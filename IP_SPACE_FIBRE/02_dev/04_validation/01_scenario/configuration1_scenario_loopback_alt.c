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

// Warning: this alternative is incorrect: it uses Data Link version instead
// of lane.

#define STEP1_TESTS_COUNT 5
static const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		// Test 1
		BASIC_CONFIG(NO_BROADCAST_CHANS, 0x34000000, {.packet_number = 4, .packet_size = 4}),
		// Test 2
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
			0x03000000,
			{
				.packet_number = 1,
				.packet_size = 69,
				.generation_data = GENERATION_DATA_PRBS
			}
		),
	};

#define STEP2_TESTS_COUNT 5
static const struct test_config step2_test[STEP2_TESTS_COUNT] =
	{
		// Test 1
		BASIC_CONFIG(NO_BROADCAST_CHANS, 0x00000000, {.packet_number = 4, .packet_size = 260}),
		// Test 2
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
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
			NO_BROADCAST_CHANS,
			0x03000000,
			{
				.packet_number = 1,
				.packet_size = 69,
				.generation_data = GENERATION_DATA_PRBS
			}
		)
	};

void alt_scenario_loopback_step_1 (void)
{
	debug_printf("\r\n Start scenario loopback\r\n");
	debug_printf("\r\n Step 1: Parallel loopback START \r\n");

	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE
	(
		PARALLEL_LOOPBACK_ENABLES,
		1,
		*DL_CONFIGURATOR_LANE_PARAMETER_PTR
	);

	init_and_run_tests(STEP1_TESTS_COUNT, step1_test);

	// Disable parallel loopback
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE
	(
		PARALLEL_LOOPBACK_ENABLES,
		0,
		*DL_CONFIGURATOR_LANE_PARAMETER_PTR
	);

	debug_printf("\r\n Step 1: Parallel loopback END \r\n");
}

void alt_scenario_loopback_step_2 (void)
{
	debug_printf("\r\n Step 2 START \r\n");

	DL_CONFIGURATOR_PHY_PARAMETER_SET_IN_PLACE
	(
		NEAR_END_SERIAL_LOOPBACK,
		1,
		*DL_CONFIGURATOR_PHY_PARAMETER_PTR
	);

	init_and_run_tests(STEP2_TESTS_COUNT, step2_test);

	DL_CONFIGURATOR_PHY_PARAMETER_SET_IN_PLACE
	(
		NEAR_END_SERIAL_LOOPBACK,
		0,
		*DL_CONFIGURATOR_PHY_PARAMETER_PTR
	);

	debug_printf("\r\n Step 2 END \r\n");
}
