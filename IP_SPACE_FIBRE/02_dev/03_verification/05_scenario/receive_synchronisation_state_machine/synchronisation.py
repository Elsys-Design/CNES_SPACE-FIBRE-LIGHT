##########################################################################
## COMPANY       : ELSYS Design
##########################################################################
## TITLE         : configuration_1_scenario_transmitter.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 tranceiver process
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError
from cocotb.utils import get_sim_time


import framework

from framework import Data

from tb import TB, Data_read_phy_config_parameters, Data_read_lane_config_parameters, Data_read_lane_config_status, \
                CLEARLINE, DISABLED, WAIT, STARTED, INVERTRXPOLARITY, CONNECTING, CONNECTED, \
                ACTIVE, PREPARESTANDBY, LOSSOFSIGNAL, \
                SpaceFibre_IP_freq, SpaceFibre_serial_port_freq, SpaceFibre_IP_period_ns, \
                SpaceFibre_serial_port_period_ns, SpaceFibre_IP_period_ps_int, SpaceFibre_serial_port_period_ps_int, \
                Data_lane_gen_config, Data_lane_gen_control, Data_lane_gen_status, Data_lane_gen_seed, \
                Data_lane_ana_config, Data_lane_ana_control, Data_lane_ana_status, Data_lane_ana_seed 

#Global variable of test success or failure
test_failed = 0


async def configure_gen_ana(tb, config, seed):
    """
    Configure the generator and the analyzer of the testbench with matching configuration.
    It then start the test.
    """
    
    #Configure Lane_Analizer and Lane_Generator
    Data_lane_ana_config.data = bytearray(config)
    await tb.masters[2].write_data(Data_lane_ana_config)
    Data_lane_gen_config.data = bytearray(config)
    await tb.masters[1].write_data(Data_lane_gen_config)

    #Seed of Lane_Analyzer and Lane_Generator
    Data_lane_ana_seed.data = bytearray( seed)
    await tb.masters[2].write_data(Data_lane_ana_seed)
    Data_lane_gen_seed.data = bytearray( seed)
    await tb.masters[1].write_data(Data_lane_gen_seed)


    Data_lane_ana_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    Data_lane_gen_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    await tb.master[2].write_data(Data_lane_ana_control)
    await tb.master[2].write_data(Data_lane_gen_control)

async def write_4b(tb, value):
    """
    Send 4bit on the Rx port of the DUT.
    """

    for i in value:
        tb.dut.RX_POS.value = int(value[i])^1
        tb.dut.RX_NEG.value = int(value[i])

async def write_10b_to_Rx(tb, encoded_data, delay, invert_polarity = 0):
    """
    Writes the given data encoded on 10bits to the Rx port
    of the SpaceFibreLight IP after serializing the data.
    Allows to send invalid data encoded.
    """
    time_per_input = tb.spacefibre_driver.time_per_input
    tb.logger.debug("sim_time %d ns: Data encoded to be sent : %d", get_sim_time(units = "ns"), encoded_data)
    serialized_data = tb.invert(encoded_data)
    if delay != 0:
        await Timer(delay, units="ps")
    for d in range(len(serialized_data)):
        if invert_polarity == 0:
            tb.dut.RX_POS.value = serialized_data[d]
            tb.dut.RX_NEG.value = serialized_data[d]^1
        else :
            tb.dut.RX_POS.value = serialized_data[d]^1
            tb.dut.RX_NEG.value = serialized_data[d]
        await Timer(time_per_input, units="ps")
    tb.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)

async def write_word(tb, word_list, delay, invert_polarity = 0):
    """
    Writes the given data encoded on 10bits to the Rx port
    of the SpaceFibreLight IP after serializing the data.
    Allows to send invalid data encoded.
    """

async def configure_gen(tb, config, seed):
    """
    Configure the generator of the testbench.
    """
    
    #Configure Lane_Generator
    Data_lane_gen_config.data = bytearray(config)
    await tb.masters[1].write_data(Data_lane_gen_config)

    #Seed of Lane_Generator
    Data_lane_gen_seed.data = bytearray( seed)
    await tb.masters[1].write_data(Data_lane_gen_seed)


async def configure_ana(tb, config, seed):
    """
    Configure the analyzer of the testbench.
    It then start the analyzer test.
    """
    
    #Configure Lane_Analizer
    Data_lane_ana_config.data = bytearray(config)
    await tb.masters[2].write_data(Data_lane_ana_config)

    #Seed of Lane_Analyzer
    Data_lane_ana_seed.data = bytearray( seed)
    await tb.masters[2].write_data(Data_lane_ana_seed)


    Data_lane_ana_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    await tb.master[2].write_data(Data_lane_ana_control)


async def wait_end_test(tb):
    """
    Wait for test end to be raised by the Lane_Analyzer.
    Return the Error counter of the Lane_Analyzer.
    """
    await tb.masters[2].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    while test_end != '1':
        await tb.masters[2].read_data(Data_lane_ana_status)
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]


async def initialization_procedure(tb):
    """
    Perform the initialization needed to be performed before each step of the scenario.
    """
    not_started=1
    
    #Reset of the DUT
    await tb.reset()

    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait to go to Disabled
    await Timer(2, units = "us")

    #Enable LaneStart and wait to be in Started state
    Enable_Lanestart = Data(0x04, 0x00000001)
    time_out = 0
    await tb.masters[0].write_data(Enable_Lanestart)
    while not_started==1 and time_out < 10000:
        await tb.masters[0].read_data(Data_read_lane_config_status)
        if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] == STARTED:
            not_started = 0
        time_out += 1
    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Active.dat")

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        test_failed = 1


@cocotb.test()
async def cocotb_run(dut):

    #Instantiation of the testbench and first reset of the DUT
    tb = TB(dut)
    await tb.reset()

    #Specific variable for the scenario
    global test_failed 


    ########################################################################################################
    ########################################################################################################
    ########################################################################################################
    #####        Step 1: Check LANE Synchronisation FSM transitions from “Ready” to “Lost Sync”        #####
    ########################################################################################################
    ########################################################################################################
    ########################################################################################################


    step_1_failed = 0

    await initialization_procedure(tb)

    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_Link_control_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1


    
    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")
    
    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_Link_control_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    

    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")    

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_1.dat", file_format = 16))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    
    await initialization_procedure(tb)



    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_2.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    await initialization_procedure(tb)




    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_3.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    await initialization_procedure(tb)




    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_1.dat", file_format = 16))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    
    await initialization_procedure(tb)





    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_2.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    await initialization_procedure(tb)






    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_3.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    await initialization_procedure(tb)



    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    await write_4b(tb, "1010")
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_4.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1

    await initialization_procedure(tb)






    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    await write_4b(tb, "1010")
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_4.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_1_failed = 1




    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 1 result: Failed")


    
    ########################################################################################################
    ########################################################################################################
    ########################################################################################################
    #####           Step 2: Check LANE Synchronisation FSM behaviour when in “Lost Sync” and           #####
    #####             LANE Synchronisation FSM transitions from “Lost Sync” to “Check Sync”            #####
    ########################################################################################################
    ########################################################################################################
    ########################################################################################################    

    step_2_failed = 0

    await initialization_procedure(tb)

    if tb.dut_Tx_disparity[0] == 1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")    

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_1.dat", file_format = 16))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_2_failed = 1

    

    


    await configure_ana(tb, [0x0A,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/10_data_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_2_failed = 1

    
    tb.dut_Tx_disparity[0] = -1

    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_Link_control_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_2_failed = 1
    



    await initialization_procedure(tb)

    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")    

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_1.dat", file_format = 16))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_2_failed = 1

    


    
    tb.dut_Tx_disparity[0] = 1

    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_Link_control_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_2_failed = 1

    
    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 2 result: Failed")
    

    ########################################################################################################
    ########################################################################################################
    ########################################################################################################
    #####      Step 3: Check LANE Synchronisation FSM transitions from “Check Sync” to “Lost Sync”     #####
    ########################################################################################################
    ########################################################################################################
    ########################################################################################################

    await initialization_procedure(tb)

    if tb.dut_Tx_disparity[0] == -1:
        tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Change_disparity.dat")    

    await configure_ana(tb, [0x01,0x00,0x00,0x04], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/comma_1.dat", file_format = 16))


    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_3_failed = 1

    


    
    tb.dut_Tx_disparity[0] = 1

    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Data_Link_control_word.dat", file_format = 16))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_3_failed = 1




    wrong_data_5 = [
        [
            1001110100,
            1001110100,
            1001110100,
            1001111011
        ],
        [
            1001110100,
            1001110100,
            1001110100,
            1001111011
        ],
        [
            1001110100,
            1001110100,
            1001110100,
            1011111000
        ],
        [
            1001110100,
            1001110100,
            1001110100,
            1011111000
        ],
        [
            1001110100,
            1001110100,
            1001110100,
            1011111000
        ]]
    await configure_ana(tb, [[0x00,0x00,0x00,0x02]], [0x00,0x00,0x00,0x00])
    cocotb.start_soon(write_word(tb, wrong_data_5, 0))

    #Pull until Test End
    error_cnt = await wait_end_test(tb)
    
    if error_cnt != 0:
        step_3_failed = 1