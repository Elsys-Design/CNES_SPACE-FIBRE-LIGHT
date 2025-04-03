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

enum fsm_state
{
    FSM_CLEARLINE         = 0b0000,
    FSM_DISABLED          = 0b0001,
    FSM_WAIT              = 0b0010,
    FSM_STARTED           = 0b0011,
    FSM_INVERTRXPOLARITY  = 0b0100,
    FSM_CONNECTING        = 0b0101,
    FSM_CONNECTED         = 0b0110,
    FSM_ACTIVE            = 0b0111,
    FSM_PREPARESTANDBY    = 0b1000,
    FSM_LOSSOFSIGNAL      = 0b1001
};

enum action_result
{
   OK,
   TIMEOUT
};

static void print_fsm_state (const enum fsm_state state)
{
    switch (state)
    {
        case FSM_CLEARLINE:
			debug_printf("CLEARLINE");
			break;

        case FSM_DISABLED:
			debug_printf("DISABLED");
			break;

        case FSM_WAIT:
			debug_printf("WAIT");
			break;

        case FSM_STARTED:
			debug_printf("STARTED");
			break;

        case FSM_INVERTRXPOLARITY:
			debug_printf("INVERTRXPOLARITY");
			break;

        case FSM_CONNECTING:
			debug_printf("CONNECTING");
			break;

        case FSM_CONNECTED:
			debug_printf("CONNECTED");
			break;

        case FSM_ACTIVE:
			debug_printf("ACTIVE");
			break;

        case FSM_PREPARESTANDBY:
			debug_printf("PREPARESTANDBY");
			break;

        case FSM_LOSSOFSIGNAL:
			debug_printf("LOSSOFSIGNAL");
			break;

        default:
            debug_printf("UNKNOWN STATE (%d)", (int) state);
            break;
    }
}

static enum action_result wait_for_state
(
    const volatile uint32_t conf_status_register [const static 1],
    const enum fsm_state target,
    const unsigned int timeout
)
{
    unsigned int timer = 0;

    while (CONF_STATUS_GET(LANE_STATE, *conf_status_register) != target)
    {
        timer += 1;

        if (timer >= timeout)
        {
            debug_printf("\r\n Could not reach FSM STATE ");
            print_fsm_state(target);
            debug_printf(". Stuck in ");
            print_fsm_state(CONF_STATUS_GET(LANE_STATE, *conf_status_register));
            debug_printf(": timed out after %u attempts.\r\n", timer);

            return TIMEOUT;
        }
    }

    debug_printf("\r\n Reached FSM STATE \r\n");
    print_fsm_state(target);
    debug_printf("\r\n");

    return OK;
}

static enum action_result wait_for_states
(
    const volatile uint32_t conf_status_register [const static 1],
    const unsigned int valid_states_count,
    const enum fsm_state valid_states [const static valid_states_count],
    const unsigned int timeout
)
{
    unsigned int timer = 0;
    enum fsm_state current_state;

    for (;;)
    {
        current_state = CONF_STATUS_GET(LANE_STATE, *conf_status_register);

        for (unsigned int i = 0; i < valid_states_count; ++i)
        {
            if (current_state == valid_states[i])
            {
                debug_printf("\r\n Reached FSM STATE \r\n");
                print_fsm_state(current_state);
                debug_printf("\r\n");

                return OK;
            }
        }

        timer += 1;

        if (timer >= timeout)
        {
            debug_printf("\r\n Could not reach FSM STATEs ");

            for (unsigned int i = 0; i < valid_states_count; ++i)
            {
                print_fsm_state(valid_states[i]);
                debug_printf(" ");
            }

            debug_printf(". Stuck in ");
            print_fsm_state(CONF_STATUS_GET(LANE_STATE, *conf_status_register));
            debug_printf(": timed out after %u attempts.\r\n", timer);

            return TIMEOUT;
        }
    }
}

static enum action_result initialize (void)
{
    debug_printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

    reset_the_dut();
    lane_reset_conf();

    CONF_PARAMETER_SET_IN_PLACE(LANESTART, *CONF_PARAMETERS_REGISTER, 1);

    return
        wait_for_state
        (
            CONF_STATUS_REGISTER,
            FSM_STARTED,
            DEFAULT_TIMEOUT
        );
}

// _ prefix to avoid name collision
static enum action_result _wait_for_started_to_active (void)
{
    // The order matters.
    const enum fsm_state valid_states[3] =
        {FSM_ACTIVE, FSM_CONNECTED, FSM_CONNECTING};

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

#define STEP1_TESTS_COUNT 4
const uint8_t step1_test[STEP1_TESTS_COUNT][SETTINGS_COUNT][4] =
    {
        { // Test 1
            {0x84, 0x00, 0x00, 0x00}, // Generator Config
            {0x84, 0x00, 0x00, 0x00}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x34}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x34}, // Analyzer Initial Value
        },
        { // Test 2
            {0x9F, 0x00, 0x00, 0x01}, // Generator Config
            {0x9F, 0x00, 0x00, 0x01}, // Analyzer Config
            {0x01, 0x00, 0x00, 0x00}, // Generator Initial Value
            {0x01, 0x00, 0x00, 0x00}, // Analyzer Initial Value
        },
        { // Test 3
            {0x82, 0x20, 0x00, 0x01}, // Generator Config
            {0x82, 0x20, 0x00, 0x01}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x02}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x02}, // Analyzer Initial Value
        },
        { // Test 4
            {0xA1, 0x08, 0x00, 0x01}, // Generator Config
            {0xA1, 0x08, 0x00, 0x01}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x03}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x03}, // Analyzer Initial Value
        },
    };

#define STEP2_TESTS_COUNT 5
const uint8_t step2_test[STEP2_TESTS_COUNT][SETTINGS_COUNT][4] =
    {
        { // Test 1
            {0x84, 0x00, 0x00, 0x00}, // Generator Config
            {0x84, 0x00, 0x00, 0x00}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x00}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x00}, // Analyzer Initial Value
        },
        { // Test 2
            {0x9F, 0x00, 0x00, 0x01}, // Generator Config
            {0x9F, 0x00, 0x00, 0x01}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x00}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x00}, // Analyzer Initial Value
        },
        { // Test 3
            {0x9F, 0x20, 0x00, 0x01}, // Generator Config
            {0x9F, 0x20, 0x00, 0x01}, // Analyzer Config
            {0x01, 0x00, 0x00, 0x00}, // Generator Initial Value
            {0x01, 0x00, 0x00, 0x00}, // Analyzer Initial Value
        },
        { // Test 4
            {0x82, 0x20, 0x00, 0x01}, // Generator Config
            {0x82, 0x20, 0x00, 0x01}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x02}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x02}, // Analyzer Initial Value
        },
        { // Test 5
            {0xA1, 0x08, 0x00, 0x01}, // Generator Config
            {0xA1, 0x08, 0x00, 0x01}, // Analyzer Config
            {0x00, 0x00, 0x00, 0x03}, // Generator Initial Value
            {0x00, 0x00, 0x00, 0x03}, // Analyzer Initial Value
        },
    };

static void start_test ()
{
    mod_write_all
    (
        MODEL_ANALYZER_ADDR,
        MOD_ANA_CONTROL_REG_OFFSET,
        bytearray(0x01,0x00,0x00,0x00)
    );

    mod_write_all
    (
        MODEL_GENERATOR_ADDR,
        MOD_GEN_CONTROL_REG_OFFSET,
        bytearray(0x01,0x00,0x00,0x00)
    );
}

static enum action_result run_tests
(
    const unsigned int test_count,
    const uint8_t test[const static test_count][SETTINGS_COUNT][4]
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
        for (int j = 0; j < SETTINGS_COUNT; ++j)
        {
             const uint8_t * const config = test[i][j];

             mod_write_all
             (
                 address_and_offset[j][0],
                 address_and_offset[j][1],
                 bytearray(config[0], config[1], config[2], config[3])
             );
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
        *CONF_PARAMETERS_REGISTER,
        1
    );

    run_tests(STEP1_TESTS_COUNT, step1_test);

    // Disable parallel loopback
    CONF_PARAMETER_SET_IN_PLACE
    (
        PARALLEL_LOOPBACK_ENABLES,
        *CONF_PARAMETERS_REGISTER,
        0
    );

    debug_printf("\r\n Step 1: Parallel loopback END \r\n");
}

void alt_scenario_loopback_step_2 (void)
{
    debug_printf("\r\n Step 2 START \r\n");

    CONF_PHY_PARAMETER_SET_IN_PLACE
    (
        NEAR_END_SERIAL_LOOPBACK,
        *CONF_PHY_PARAMETERS_REGISTER,
        1
    );

    run_tests(STEP2_TESTS_COUNT, step2_test);

    CONF_PHY_PARAMETER_SET_IN_PLACE
    (
        NEAR_END_SERIAL_LOOPBACK,
        *CONF_PHY_PARAMETERS_REGISTER,
        0
    );

    debug_printf("\r\n Step 2 END \r\n");
}
