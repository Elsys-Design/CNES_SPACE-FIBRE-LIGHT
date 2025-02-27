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
//define constant

#define CLEARLINE         0b0000
#define DISABLED          0b0001
#define WAIT              0b0010
#define STARTED           0b0011
#define INVERTRXPOLARITY  0b0100
#define CONNECTING        0b0101
#define CONNECTED         0b0110
#define ACTIVE            0b0111
#define PREPARESTANDBY    0b1000
#define LOSSOFSIGNAL      0b1001

int test_failed=0;

void init_to_started(void){
    uint32_t temp;
    debug_printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

    int not_started=1;
    

    
    //#Reset of the DUT
    reset_the_dut();
    
    //LaneReset with Lane_Configurator
    lane_reset_conf();
    
    //Wait to go to Disabled
        //Enable LaneStart and wait to be in Started state
    int time_out = 0;

    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, LANESTART_MASK, 1 << LANESTART_SHIFT);
    
    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    while ((not_started==1) && (time_out < 2000000)){
        if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT)  == STARTED){
            not_started = 0;
            debug_printf("\r\n FSM STATE = STARTED\r\n");
            return;
        }
        time_out += 1;
        temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    }
    debug_printf("\r\n FSM STARTED NOT REACHED: TIMEOUT %x\r\n", temp);
    debug_printf("\r\n HARD RESET REQUESTED\r\n", temp);
    while (1){
        
    }

}
void wait_for_started_to_active(void){
    //debug_printf("\r\n Wait the time needed for DUT Lane initialisation FSM to go into Active state. Checks all the state the DUT should go through.\r\n");

    wait(1023);//await Timer(32*1023*SpaceFibre_serial_port_period_ps_int, units = "ps")
    
    uint32_t temp,cpt_timeout =0;
    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);//cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_parameters))
    //Check that Lane initialisatiion FSM is in Connecting State
    while  ((((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) !=  CONNECTING) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE)){
      temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
      if (cpt_timeout == 5000){
       debug_printf("\r\n FSM CONNECTING NOT REACHED: TIMEOUT ss %x \r\n", temp);
       debug_printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      wait(1);
      cpt_timeout ++;
    }     

    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);//cocotb.start_soon(tb.masters[0].read_data(Data_read_lane_config_parameters))
    //Check that Lane initialisatiion FSM is in Connected State
    while  ((((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE)){
      temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
      if (cpt_timeout == 5000){
       debug_printf("\r\n FSM CONNECTED NOT REACHED: TIMEOUT\r\n", temp);
       debug_printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      cpt_timeout ++;
    }   

    //Check that Lane initialisatiion FSM is in Active State
    while  (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE){
      temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
      if (cpt_timeout == 5000){
       debug_printf("\r\n FSM ACTIVE NOT REACHED: TIMEOUT\r\n", temp);
       debug_printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      cpt_timeout ++;
    }   
}
uint32_t wait_end_test(void){
    //debug_printf("\r\n Wait for test end to be raised by the Lane_Analyzer. Return the Error counter of the Lane_Analyzer.\r\n");
    uint32_t test_end_gen = mod_read(MODEL_GENERATOR_ADDR, MOD_GEN_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
    uint32_t test_end_ana = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
    int timer = 0;
    while ((test_end_gen != 1) && (test_end_ana != 1) && (timer < 20000)){
        test_end_gen = mod_read(MODEL_GENERATOR_ADDR, MOD_GEN_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
        test_end_ana = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
        timer += 1;
        if (timer >= 20000){
            debug_printf("\r\n timeout\r\n");
           if (test_end_gen == 0) {
              debug_printf("\r\n Generator not ended\r\n");
           }
           else if(test_end_ana == 0){
              debug_printf("\r\n Analyzer not ended\r\n");
           }
           while(1){

           }
           return (uint32_t) 255;
        }
    }
    uint32_t result = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, ERROR_COUNTER_MASK, ERROR_COUNTER_SHIFT);
    if (result != 0){
        debug_printf("\r\n nb error %x\r\n",result );
        while(1){

        }
    }
    return result;
    
}

void started_to_active(void){ 
    debug_printf("\r\nSets the DUT Lane initialisation FSM to Active state from Started, checking each of state it goes through.\r\n");

    //Set Lane initialisation FSM from Started to Connecting state
    //await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Connecting.dat")

    //Check that Lane initialisatiion FSM is in Connecting State
    uint32_t temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTING){
      test_failed = 1;
    }     

    //Set Lane initialisation FSM from Connecting to Connected state
    //await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Connecting_to_Connected.dat")

    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    //Check that Lane initialisatiion FSM is in Connected State
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED){
      test_failed = 1;
    }      

    //Set Lane initialisation FSM from Connected to Active state
    //await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Connected_to_Active.dat")

    //Check that Lane initialisatiion FSM is in Active State
    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE){
      test_failed = 1;
    }    
    debug_printf("\r\nSets the DUT Lane initialisation FSM to Active state from Started, checking each of state it goes through.\r\n");
}

void scenario_loopback(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	debug_printf("\r\n Start scenraio loopback\r\n");
    debug_printf("\r\n Step 1: Parallel loopback START \r\n");
	
    ///////////////////////////////////////////////
	//Step 1: Check lane layer parallel loopback //
    ///////////////////////////////////////////////       
	int step_1_failed = 0;
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, PARALLEL_LOOPBACK_MASK, 1 << PARALLEL_LOOPBACK_SHIFT);
    init_to_started();

    ///With loopback during init

    wait_for_started_to_active();

    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);


    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x34);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x34);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);
    
    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);
    
    data_lane_gen_control = bytearray(0x01,0x00,0X00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);

    wait_us_clk_150mhz(60);

    //Pull until Test End
    error_cnt = wait_end_test();


    if ((error_cnt != 0)){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.1 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.1 result: PASS\r\n");
    }

    ////PRBS data generation 
    // seed 0x00000000
   
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.2 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.2 result: PASS\r\n");
    }

     // seed 0x00000001
   //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);                                                    
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.3 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.3 result: PASS\r\n");
    }

    // seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.4 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.4 result: PASS\r\n");
    }

    // seed 0x03000000 
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.5 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.5 result: PASS\r\n");
    }
    debug_printf("\r\n Step 1: Parallel loopback END \r\n");

    // Disable parallel loopback
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, PARALLEL_LOOPBACK_MASK, 0 << PARALLEL_LOOPBACK_SHIFT);

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    /////        Step 2: Check phy layer near-end serial loopback        /////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    debug_printf("\r\n Step 2 START \r\n");
    uint32_t step_2_failed = 0;
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_PHY_REG_OFFSET, NEAR_END_LOOPBACK_MASK, 1 << NEAR_END_LOOPBACK_SHIFT);
    init_to_started();
    //###########################
    //#With loopback during init
    //###########################
    
    wait_for_started_to_active();

    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x20,0x00,0x00);// 4 frames, 104 bytes, incremental
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x84,0x20,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.1 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.1 result: PASS\r\n");
    }

    //PRBS data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.2 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.2 result: PASS\r\n");
    }

    //// seed 0x00000001
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.3 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.3 result: PASS\r\n");
    }

    //// seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);// 2 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.4 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.4 result: PASS\r\n");
    }

    //// seed 0x03000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);// 1 frames, 69 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.5 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.5 result: PASS\r\n");
    }
    debug_printf("\r\n Step 2 END \r\n");
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_PHY_REG_OFFSET, NEAR_END_LOOPBACK_MASK, 0 << NEAR_END_LOOPBACK_SHIFT);
    //print results of test
    debug_printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_1_failed == 0){
        debug_printf("\r\n Step 1 parallel loopback result: Pass\r\n");
    }
    else{
        debug_printf("\r\n Step 1 parallel loopback result: Failed\r\n");
    }
    if (step_2_failed == 0){
        debug_printf("\r\n Step 2 near-end loopback result: Pass\r\n");
    }
    else{
        debug_printf("\r\n Step 2 near-end loopback result: Failed\r\n");
    }
}

void scenario_loopback_step1(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	debug_printf("\r\n Start scenraio loopback\r\n");
    debug_printf("\r\n Step 1: Parallel loopback START \r\n");
	
    ///////////////////////////////////////////////
	//Step 1: Check lane layer parallel loopback //
    ///////////////////////////////////////////////       
	int step_1_failed = 0;
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, PARALLEL_LOOPBACK_MASK, 1 << PARALLEL_LOOPBACK_SHIFT);
    init_to_started();

    ///With loopback during init

    wait_for_started_to_active();

    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);


    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x34);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x34);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);
    
    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);
    
    data_lane_gen_control = bytearray(0x01,0x00,0X00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);

    wait_us_clk_150mhz(60);

    //Pull until Test End
    error_cnt = wait_end_test();


    if ((error_cnt != 0)){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.1 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.1 result: PASS\r\n");
    }

    ////PRBS data generation 
    // seed 0x00000000
   
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.2 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.2 result: PASS\r\n");
    }

     // seed 0x00000001
   //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);                                                    
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.3 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.3 result: PASS\r\n");
    }

    // seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.4 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.4 result: PASS\r\n");
    }

    // seed 0x03000000 
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        debug_printf("\r\nstep 1.5 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 1.5 result: PASS\r\n");
    }
    debug_printf("\r\n Step 1: Parallel loopback END \r\n");

    // Disable parallel loopback
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, PARALLEL_LOOPBACK_MASK, 0 << PARALLEL_LOOPBACK_SHIFT);

    //print results of test
    debug_printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_1_failed == 0){
        debug_printf("\r\n Step 1 parallel loopback result: Pass\r\n");
    }
    else{
        debug_printf("\r\n Step 1 parallel loopback result: Failed\r\n");
    }
}

void scenario_loopback_step2(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	debug_printf("\r\n Start scenraio loopback\r\n");	

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    /////        Step 2: Check phy layer near-end serial loopback        /////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    debug_printf("\r\n Step 2: Near-End Loopback START \r\n");
    uint32_t step_2_failed = 0;
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_PHY_REG_OFFSET, NEAR_END_LOOPBACK_MASK, 1 << NEAR_END_LOOPBACK_SHIFT);
    init_to_started();
    //###########################
    //#With loopback during init
    //###########################
    
    wait_for_started_to_active();

    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x20,0x00,0x00);// 4 frames, 104 bytes, incremental
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x84,0x20,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.1 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.1 result: PASS\r\n");
    }

    //PRBS data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.2 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.2 result: PASS\r\n");
    }

    //// seed 0x00000001
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.3 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.3 result: PASS\r\n");
    }

    //// seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);// 2 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.4 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.4 result: PASS\r\n");
    }

    //// seed 0x03000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);// 1 frames, 69 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        debug_printf("\r\nstep 2.5 result: FAILED\r\n");
        debug_printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        debug_printf("\r\nstep 2.5 result: PASS\r\n");
    }
    debug_printf("\r\n Step 2 END \r\n");
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_PHY_REG_OFFSET, NEAR_END_LOOPBACK_MASK, 0 << NEAR_END_LOOPBACK_SHIFT);
    //print results of test
    debug_printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_2_failed == 0){
        debug_printf("\r\n Step 2 near-end loopback result: Pass\r\n");
    }
    else{
        debug_printf("\r\n Step 2 near-end loopback result: Failed\r\n");
    }
}