##########################################################################
## COMPANY       : ELSYS Design
##########################################################################
## TITLE         : configuration_1_scenario_receiver.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 02/10/2024
##########################################################################
## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
##                 receiver process
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import os

import cocotb
import cocotbext
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.result import TestFailure, TestError
from cocotb.utils import get_sim_time

#check for cocotb framework existence and import it
try:
    import framework
    from framework import Data
    from tb2 import TB, Data_read_phy_config_parameters, Data_read_lane_config_parameters, Data_read_lane_config_status, \
                    Data_read_general_control, Data_read_dl_config_parameters, Data_read_dl_config_status_1, \
                    Data_read_dl_config_status_1, Data_read_dl_config_QoS_1, Data_read_dl_config_QoS_2, \
                    CLEARLINE, DISABLED, WAIT, STARTED, INVERTRXPOLARITY, CONNECTING, CONNECTED, \
                    ACTIVE, PREPARESTANDBY, LOSSOFSIGNAL, \
                    SpaceFibre_IP_freq, SpaceFibre_serial_port_freq, SpaceFibre_IP_period_ns, \
                    SpaceFibre_serial_port_period_ns, SpaceFibre_IP_period_ps_int, SpaceFibre_serial_port_period_ps_int, \
                    Data_lane_gen_config, Data_lane_gen_control, Data_lane_gen_status, Data_lane_gen_seed, \
                    Data_lane_ana_config, Data_lane_ana_control, Data_lane_ana_status, Data_lane_ana_seed 

    print("successfully Found cocotb Framework")
except ImportError as e:
    print("")
    print("Error -> ", e)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("!!   COCOTB framework library is not found.                                                      !!")
    print("!!                                                                                               !!")
    print("!!   Have you set FRAMEWORK_COCOTB_INSTALL_PATH variable? prior to launch Runme.sh script?       !!")
    print("!!   Is PYTHONPATH variable include the location of the cocotb_framework python sources?         !!")
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    print("")
    exit()               
    
#Global variable of test success or failure
test_failed = 0

def clean_dir(path):
    """Suppress all files of a directory pointed by path"""
    folder = path
    #create path if needed
    os.makedirs(path,exist_ok=True)
    
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        os.unlink(file_path)

async def initialization_procedure(tb, monitor_path):
    """
    Perform the initialization needed to be performed before each step of the scenario.
    """
    not_started=1
    
    #Reset of the DUT
    await tb.reset_DUT()

    #LaneReset with Lane_Configurator
    await tb.masters[0].init_run("stimuli/axi/Lane_reset.json")

    #Wait to go to Disabled
    await Timer(2, units = "us")


    #Enable LaneStart and wait to be in Started state
    Data_read_lane_config_parameters.data = bytearray([0x01, 0x00, 0x00, 0x00])
    time_out = 0
    await tb.masters[0].write_data(Data_read_lane_config_parameters)
    while not_started==1 and time_out < 10000:
        await tb.masters[0].read_data(Data_read_lane_config_status)
        if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] == STARTED:
            not_started = 0
        time_out += 1
    
    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file(monitor_path, number_of_word = 2274))
    
    #Set Lane initialisatiion FSM from Started to Active state
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/Started_to_Active.dat")

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16))

    #Check that Lane initialisatiion FSM is in Active State
    await tb.masters[0].read_data(Data_read_lane_config_status)

    await monitor

    await stimuli
    if format(Data_read_lane_config_status.data[0], '0>8b')[4:8] != ACTIVE:
        global test_failed 
        test_failed = 1

async def wait_end_test_dl(tb, channel):
    """
    Wait for test end to be raised by the selected analyzer.
    Return the Error counter of the selected analyzer.
    """
    await tb.masters[2*channel].read_data(Data_lane_ana_status)
    test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
    timer = 0
    while test_end != '1' and timer < 1000:
        await tb.masters[2*channel].read_data(Data_lane_ana_status)
        timer += 1
        test_end = format(Data_lane_ana_status.data[0], '0>8b')[6]
        tb.logger.debug("simulation time %d ns : Data_lane_ana_status value read : %s", get_sim_time(units = "ns"), format(Data_lane_ana_status.data[0], '0>8b'))
    if timer >=1000:
        tb.logger.error("simulation time %d ns : test timeout", get_sim_time(units = "ns"))
        return "11111111"
    return format(Data_lane_ana_status.data[1], '0>8b')[6:8] + format(Data_lane_ana_status.data[0], '0>8b')[0:6]

async def wait_end_test_all_dl(tb):
    """
    Wait for test end to be raised by all analyzer.
    Return the Error counter of all analyzer as a list.
    """
    result = []
    for channel in range(2, 11):
        x = await wait_end_test_dl(tb, channel)
        result += [x]
    return result

async def wait_end_test_all_vc_dl(tb):
    """
    Wait for test end to be raised by all analyzer.
    Return the Error counter of all analyzer as a list.
    """
    result = []
    for channel in range(2, 10):
        x = await wait_end_test_dl(tb, channel)
        result += [x]
    return result

async def start_all_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start analyzer
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    for channel in range(2, 11):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_control))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 11):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def start_all_vc_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start analyzer
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_control))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_all_vc_dl(tb, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    action = []
    Data_lane_ana_config.data = bytearray(conf)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure analyzer
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_config.data = bytearray(conf)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_ana_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure analyzer seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel].write_data(Data_lane_ana_seed))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_seed))
        action += [x]
    await Combine(*action)
    await stimuli


async def start_gen_vc_dl(tb):
    """
    Start test on all data link analyzer and all data link generator.
    """

    action = []
    Data_lane_gen_control.data = bytearray([0x01, 0x00, 0x00, 0x00])
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # Start generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_control))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_gen_vc_dl(tb, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    Data_lane_gen_config.data = bytearray(conf)
    action = []
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_config))
        action += [x]
    await Combine(*action)
    await stimuli

    action = []
    Data_lane_gen_seed.data = bytearray(seed)
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    # configure generator seed
    for channel in range(2, 10):
        x = cocotb.start_soon(tb.masters[2*channel-1].write_data(Data_lane_gen_seed))
        action += [x]
    await Combine(*action)
    await stimuli

async def configure_model_dl(tb, model, conf, seed):
    """
    Start test on all data link analyzer and all data link generator.
    """
    # configure generator
    Data_lane_gen_config.data = bytearray(conf)

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_config)
    await stimuli


    # configure generator seed
    Data_lane_gen_seed.data = bytearray(seed)

    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_seed)
    await stimuli

async def start_model_dl(tb, model):
    """
    Start test on all data link analyzer and all data link generator.
    """
    Data_lane_gen_control.data = bytearray([0x01,0x00,0x00,0x00])
    # Start model
    stimuli = cocotb.start_soon(tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16))
    await tb.masters[model].write_data(Data_lane_gen_control)
    await stimuli


async def write_10b_to_Rx(tb, encoded_data, delay, invert_polarity = 0):
    """
    Writes the given data encoded on 10bits to the Rx port
    of the SpaceFibreLight IP after serializing the data.
    Allows to send invalid data encoded.
    """
    time_per_input = tb.spacefibre_driver.time_per_input
    tb.logger.debug("sim_time %d ns: Data encoded to be sent : %d", get_sim_time(units = "ns"), encoded_data)
    serialized_data = tb.spacefibre_driver.invert(encoded_data)
    if delay != 0:
        await Timer(delay, units="fs")
    for d in range(len(serialized_data)):
        if invert_polarity == 0:
            tb.dut.RX_POS.value = serialized_data[d]
            tb.dut.RX_NEG.value = serialized_data[d]^1
        else :
            tb.dut.RX_POS.value = serialized_data[d]^1
            tb.dut.RX_NEG.value = serialized_data[d]
        await Timer(time_per_input, units="fs")
    tb.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)

async def send_FCT(tb, vc, value, seq_num):
    """
    Send an FCT control word to the RX port of the SpaceFibreLight IP
    """
    await tb.spacefibre_driver.write_to_Rx("01111100", delay = 0, k_encoding = 1)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8("01111100")
    await tb.spacefibre_driver.write_to_Rx(f"{(value):0>3b}" + f"{(vc):0>5b}", delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(f"{(value):0>3b}" + f"{(vc):0>5b}", crc_8)
    await tb.spacefibre_driver.write_to_Rx(seq_num, delay = 0, k_encoding = 0)
    crc_8 = tb.spacefibre_random_generator_data_link.compute_crc_8(seq_num , crc_8)
    crc_8 = tb.spacefibre_random_generator_data_link.invert_string(crc_8)
    await tb.spacefibre_driver.write_to_Rx(crc_8, delay = 0, k_encoding = 0)


@cocotb.test()
async def cocotb_run(dut):

    dir_path = os.path.dirname(os.path.realpath(__file__))
    clean_dir(os.path.join(dir_path,"reference/spacefibre_serial"))

    #Instantiation of the testbench and first reset of the DUT
    tb = TB(dut)

    await tb.reset()

    #Specific variable for the scenario
    global test_failed 


    ##########################################################################
    ##########################################################################
    ##########################################################################
    ### Step 1: Check transmission of frame and insertion of control words ###
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_1_failed = 0
    #Sets DUT lane initialisation FSM to Active
    
    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_1")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20+66*8+23))

    #Send first FCT to each virtual channel
    for x in range(8):
        print ("FCT is", x)
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
    
    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/3_IDLE.dat", file_format = 16)

    await (monitor)

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20+66*8+93))


    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")

    await configure_model_dl(tb, 3, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x03])
    await configure_model_dl(tb, 5, [0x04,0x08,0x00,0x00], [0x00,0x00,0x00,0x05])
    await configure_model_dl(tb, 7, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x07])
    await configure_model_dl(tb, 9, [0x10,0x02,0x00,0x00], [0x00,0x00,0x00,0x09])
    await configure_model_dl(tb, 11, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x11])
    await configure_model_dl(tb, 13, [0x04,0x08,0x00,0x00], [0x00,0x00,0x00,0x13])
    await configure_model_dl(tb, 15, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x15])
    await configure_model_dl(tb, 17, [0x10,0x02,0x00,0x00], [0x00,0x00,0x00,0x17])

    await start_gen_vc_dl(tb)


    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/3_IDLE.dat", file_format = 16)

    await (monitor)

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 20))


    await configure_model_dl(tb, 19, [0x82,0x00,0x00,0x00], [0x00,0x00,0x00,0x00])
    await start_model_dl(tb, 19)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)

    await (monitor)

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 123))

    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")

    
    await configure_model_dl(tb, 3, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await configure_model_dl(tb, 19, [0x82,0x00,0x00,0x00], [0x00,0x00,0x00,0x02])
    await start_model_dl(tb, 19)
    
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)

    await (monitor)

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 108))

    #Send FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+25):0>7b}")

    #wait for idle frame (100 words)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/100_IDLE.dat", file_format = 16)

    await monitor

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 55))

    await configure_model_dl(tb, 19, [0x82,0x00,0x00,0x00], [0x00,0x00,0x00,0x02])
    await start_model_dl(tb, 19)

    #wait for idle frame (32 words)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    
    await monitor

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_1", number_of_word = 85))

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/50_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)

    await monitor

    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 1 result: Failed")


    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########        Step 2: Check NACK and ACK insertion        ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################
    
    step_2_failed = 0
    
    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_2")

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 143+66*8+20))

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])


    for model in range(8):
        await configure_model_dl(tb, 3+2*model, [0xE1,0x1F,0x00,0x01], [0x2A,0x00,0x00,0x00])
        await start_model_dl(tb, 3+2*model)

    await start_gen_vc_dl(tb)


    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_1_" + str(target), 255, 1, 64, 0, target, target + 8, delay = 0, invert_polarity = 0, seed = 42)

    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)
    await tb.spacefibre_driver.write_from_file("stimuli/spacefibre_serial/5_IDLE.dat", file_format = 16)

    await monitor

    # Check ACK Request

    monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_2", number_of_word = 143+40*8*15+20))

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+17):0>7b}")

    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])


    for model in range(8):
        await configure_model_dl(tb, 3+2*model, [0x01,0x14,0x00,0x01], [0x2B,0x00,0x00,0x00])
        await start_model_dl(tb, 3+2*model)

    await start_gen_vc_dl(tb)

    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_2_" + str(target), 20, 15, 5, 0, target, 15*target + 24, delay = 0, invert_polarity = 0, seed = 43)

    #Check ACK Request (every 15 word)

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+145):0>7b}")

    for model in range(8):
        await configure_model_dl(tb, 3+2*model, [0x01,0x14,0x00,0x01], [0x2C,0x00,0x00,0x00])
        await start_model_dl(tb, 3+2*model)


    for target in range(8):
        await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_3_" + str(target), 20, 15, 5, 0, target, 15*target + 152, delay = 0, invert_polarity = 0, seed = 44)

    #Check ACK Request (every 15 word)

    await configure_model_dl(tb, 3, [0x81,0x0C,0x00,0x01], [0x2D,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_4_" + str(0), 20, 1, 5, 0, 0, 272, delay = 0, invert_polarity = 0, seed = 45)

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+113):0>7b}")
    
    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/CRC_error.dat")

    #Check NACK request

    await configure_model_dl(tb, 3, [0x81,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_5_" + str(0), 12, 10, 3, 0, 0, 120, delay = 0, invert_polarity = 0, seed = 46)

    #Check ACK

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+131):0>7b}")

    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/SEQ_NUM_error.dat")

    #Check NACK

    await configure_model_dl(tb, 3, [0x81,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_2_6_" + str(0), 12, 10, 3, 0, 0, 138, delay = 0, invert_polarity = 0, seed = 46)

    #Check ACK

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+131):0>7b}")

    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/RXERR_error_1.dat")
    await write_10b_to_Rx(tb, "1101110111")
    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/RXERR_error_2.dat")

    #Check NACK

    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/Pos_seq_error.dat")

    #Check NACK

    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/Neg_seq_error.dat")

    #Check NACK

    await monitor

    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 2 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 3: Check CRC and SEQ_NUMBER generation    ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_3_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_3")

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")
    
    #Check FCT and SEQ num and CRC

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check data frame SEQ NUM and CRC

    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 19)

    #Check broadcast frame SEQ NUM and CRC

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")
    
    await tb.spacefibre_driver.write_from_file("stimulus/spacefibre_serial/CRC_error_bis.dat")


    #Check NACK SEQ NUM and CRC

    await configure_model_dl(tb, 3, [0x81,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 3)

    await tb.spacefibre_random_generator_data_link.write_random_inputs("reference/spacefibre_serial/step_3_1_" + str(0), 12, 10, 3, 0, 0, 16, delay = 0, invert_polarity = 0, seed = 46)

    #Check ACK SEQ NUM and CRC

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+18):0>7b}")


    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check data frame SEQ NUM and CRC

    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])
    await start_model_dl(tb, 19)

    #Check broadcast frame SEQ NUM and CRC

    
    await monitor

    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 3 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 4: Check output buffers flow control      ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_4_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_4")

    #Check that FCT are sent for each virtual buffer

    await configure_gen_vc_dl(tb,[0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check transmission of idle frame

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    #Check transmission of data frame

    await configure_gen_vc_dl(tb,[0xE2,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await start_gen_vc_dl(tb)

    #Check transmission of idle frame

    #Send first FCT to each virtual channel
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")

    #Check transmission of 1 out of 2 data frame

    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 4 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########       Step 5: Check output buffers competiton      ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################


    step_5_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_5")
    
    #Send first FCT to each virtual channel
    
    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+1):0>7b}")

    #Check that FCT are sent for each virtual buffer

    await configure_gen_vc_dl(tb, [0xE1,0x1F,0x00,0x00], [0x00,0x00,0x00,0x00])

    await configure_model_dl(tb, 19, [0x01,0x01,0x00,0x01], [0x2E,0x00,0x00,0x00])

    x = [cocotb.start_soon(start_model_dl(tb, 19))]

    x += [cocotb.start_soon(start_gen_vc_dl(tb))]

    await Combine(*x)

    #Check transmission data and broadcast frame, check order of virtual

    for x in range(8):
        await send_FCT(tb, x, 0, "0"+ f"{(x+9):0>7b}")

    await configure_model_dl(tb, 3, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x03])
    await configure_model_dl(tb, 7, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x07])
    await configure_model_dl(tb, 11, [0x08,0x04,0x00,0x00], [0x00,0x00,0x00,0x11])
    await configure_model_dl(tb, 15, [0x02,0x10,0x00,0x00], [0x00,0x00,0x00,0x15])

    await start_model_dl(tb, 3)
    await start_model_dl(tb, 7)
    await start_model_dl(tb, 11)
    await start_model_dl(tb, 15)

    #Check transmission data, check order of virtual

    await monitor

    if step_5_failed == 0:
        tb.logger.info("simulation time %d ns : step 5 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 5 result: Failed")

    ##########################################################################
    ##########################################################################
    ##########################################################################
    ###########     Step 6: Check continuous mode output buffers   ###########
    ##########################################################################
    ##########################################################################
    ##########################################################################

    step_6_failed = 0

    # monitor = cocotb.start_soon(tb.spacefibre_sink.read_to_file("reference/spacefibre_serial/monitor_step_3", number_of_word = 2500))

    await initialization_procedure(tb, "reference/spacefibre_serial/monitor_step_6")

    data_config = Data(0x10, [0x04, 0x40,0x00,0x00])

    await tb.masters[0].write_data(data_config)

    await configure_model_dl(tb, 3, [0xF0,0x1F,0x00,0x01], [0x00,0x00,0x00,0x2A])
    await start_model_dl(tb, 3)

    #Check that Data Frame are received

    await configure_gen_vc_dl(tb, [0xF0,0x1F,0x00,0x01], [0x00,0x00,0x00,0x00])
    await configure_model_dl(tb, 3, [0xFF,0x1F,0x00,0x01], [0x00,0x00,0x00,0x2A])
    await start_gen_vc_dl(tb)
    
    #Check EEP insertion


    if step_6_failed == 0:
        tb.logger.info("simulation time %d ns : step 6 result: Pass")
    else:
        test_failed = 1
        tb.logger.error("simulation time %d ns : step 6 result: Failed")


    #writting the monitors loggers
    tb.write_monitor_data()

    #print results of test
    tb.logger.info("simulation time %d ns : TEST RESULTS :",get_sim_time(units="ns"))
    if step_1_failed == 0:
        tb.logger.info("simulation time %d ns : step 1 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 1 result: Failed", get_sim_time(units="ns"))

    if step_2_failed == 0:
        tb.logger.info("simulation time %d ns : step 2 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 2 result: Failed", get_sim_time(units="ns"))

    if step_3_failed == 0:
        tb.logger.info("simulation time %d ns : step 3 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 3 result: Failed", get_sim_time(units="ns"))

    if step_4_failed == 0:
        tb.logger.info("simulation time %d ns : step 4 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 4 result: Failed", get_sim_time(units="ns"))

    if step_5_failed == 0:
        tb.logger.info("simulation time %d ns : step 5 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 5 result: Failed", get_sim_time(units="ns"))

    if step_6_failed == 0:
        tb.logger.info("simulation time %d ns : step 6 result: Pass",get_sim_time(units="ns"))
    else:
        tb.logger.error("simulation time %d ns : step 6 result: Failed", get_sim_time(units="ns"))

    if test_failed == 1:
        raise TestFailure

