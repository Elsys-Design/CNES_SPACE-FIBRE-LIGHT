##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : SpaceFibre_Random_Generator.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 20/09/2024
##########################################################################
## DESCRIPTION   : Contains SpaceFibre_Random_Generator class for serial port
##########################################################################
## History       :	V1.0: Creation of the file
##########################################################################

import logging
import random
import os
from pathlib import Path
import cocotb
import cocotbext
from cocotb.clock import Clock
from cocotb.triggers import Edge, RisingEdge, FallingEdge, Timer, Join, Combine
from cocotb.utils import get_sim_time
from cocotbext.axi import AxiStreamBus, AxiLiteBus

from framework import   AxiStreamSource, AxiStreamSink, AxiStreamMonitor, AxiBus, \
                        AxiMaster, AxiLiteMaster, AxiRam, AxiLiteRam, \
                        AxiMonitor, AxiLiteMonitor, Data

def ceil(number):
    """return first int above or equal to number"""
    if number == int(number):
        return int(number)
    else :
        return int(number) +  1
class SpaceFibre_Random_Generator:

    def __init__(self, dut, dut_Rx_disparity, dut_Tx_disparity, logger, period_ps):
        self.dut = dut
        self.dut_Rx_disparity = dut_Rx_disparity
        self.dut_Tx_disparity = dut_Tx_disparity
        self.logger = logger
        self.time_per_input = period_ps

    
    def invert(self, encoded_data):
        """
        Take in input a encoded data as a string of bits of 0 or 1, and convert them to a list of integer,
        starting from lowest significant bit
        """
        inverted_data = []
        for x in range(len(encoded_data)):
            inverted_data = inverted_data + [int(encoded_data[x])]
        return inverted_data
    
    def invert_string(self, string):
        """
        Take in input a a string and return the same string read from the last character to the first.
        """
        inverted_data = ""
        for x in (string):
            inverted_data = x + inverted_data 
        return inverted_data
    
    def compute_crc_16(self, byte_input, crc_16 = "1111111111111111"):
        """
        Return the CRC-16bit after the byte_input has been taken into acount
        """
        for i in range(8):
            input = int(byte_input[7-i])
            input = int(crc_16[0]) ^ input
            crc_16 = crc_16[1 : 16] + "0"
            crc_16 = crc_16[0 : 3] + str(input^int(crc_16[3]))+crc_16[4:10] + str(input^int(crc_16[10])) + crc_16[11:15] + str(input)
        #####
        # generate debug file
        #####
        # output_file_bin = open("CRC_16_compute_step.debug", "a")
        # output_file_bin.write(f"{int(crc_16, base = 2):0>4X}" + "_" + str(get_sim_time(units = "ns")) + "\n")  
        # output_file_bin.close()
        return crc_16
    
    def compute_crc_8(self, byte_input, crc_8 = "00000000"):
        """
        Return the CRC-8bit after the byte_input has been taken into acount
        """
        for i in range(8):
            input = int(byte_input[7-i])
            input = int(crc_8[0]) ^ input
            crc_8 = crc_8[1 : 8] + "0"
            crc_8 = crc_8[0 : 5] + str(input^int(crc_8[5])) + str(input^int(crc_8[6])) + str(input)

        #####
        # generate debug file
        #####
        # output_file_bin = open("CRC_8_compute_step.debug", "a")
        # output_file_bin.write(f"{int(crc_8, base = 2):0>2X}" + "_" + str(get_sim_time(units = "ns")) + "\n")  
        # output_file_bin.close()
        return crc_8
    
    async def write_to_Rx(self, data, delay, k_encoding = 0, invert_polarity = 0):
        """
        Writes the given data encoded on 8bits to the Rx port of the SpaceFibreLight IP after
        encoding it to 10bits and serializing the data.
        """
        time_per_input = self.time_per_input
        self.logger.debug("sim_time %d ns: Data not encoded to be sent : %d", get_sim_time(units = "ns"), data)
        encoded_data = self.encode(data, k_encoding)
        self.logger.debug("sim_time %d ns: Data encoded to be sent : %d", get_sim_time(units = "ns"), encoded_data)
        serialized_data = self.invert(encoded_data)
        variation = random.randint(0, 2)
        if variation > 0:
            variation = 1
        if delay != 0:
            await Timer(delay, units="fs")
        for d in range(len(serialized_data)):
            if invert_polarity == 0:
                self.dut.RX_POS.value = serialized_data[d]
                self.dut.RX_NEG.value = serialized_data[d]^1
            else :
                self.dut.RX_POS.value = serialized_data[d]^1
                self.dut.RX_NEG.value = serialized_data[d]
            await Timer(time_per_input + variation, units="fs")
        self.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)
        return encoded_data, k_encoding

    async def write_random_inputs(self, file_path, packet_size, packet_number, frame_size, frame_type, target, sequence, sequence_polarity = 0, delay = 0, invert_polarity = 0, seed = 42):
        """
        Writes the given number of inputs data randomly generated based on the given seed to the Rx port
        of the SpaceFibreLight IP. A log file at file_path is created to record the generated data.
        """
        
        #assert that word have to be sent
        if packet_size != None:
            number_of_words = ceil((packet_number * packet_size)/4)

            assert number_of_words > 0, "Error : number of inputs must be greater than 0"
        assert self.time_per_input > 0, "Error : time per input must be greater than 0"
        
        
        self.logger.info("sim_time %d ns: Creating file %s to receive hexa format data from random generator", get_sim_time(units = "ns"), file_path)
        log_file = open(file_path, "w")

        log_file_10b = open(file_path+"_10b", "w")
        
        #initialize pseudo random generation with given seed
        word_binary = f"{seed:0>32b}"
        if delay != 0:
            await Timer(delay, units="ps")


        #send idle word 10 times for simu
        for i in range(10):
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;CFCFCEFC;0;0001;\n")

        word_counter_for_skip = 5000
        #check if skip needed
        if  word_counter_for_skip >= 5000:
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;7F7FCEFC;0;0001;\n")
            word_counter_for_skip = 0
        current_frame_size = 0
        current_packet_size = 0
        target = f"{(target):0>8b}"
        if frame_type==0: #if Data Frame


            #send first SDF
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("11111100")

            data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("01010000", crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16(target, crc_16)

            data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("00000000", crc_16)

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")
            word_counter_for_skip += 1
            current_packet_size = 0
            #send the number of packet needed
            for i in range(number_of_words-1):
                

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #check if EDF and SDF to be sent
                if current_frame_size == frame_size:
                    current_frame_size = 1
                    data_to_log = ""
                    k_encoded_to_log = ""
                    sequence += 1
                    

                    #Send EDF
                    data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("00011100", crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

                    crc_16 = self.invert_string(crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;00"+f"{(int(crc_16, 2)):0>4X}"+f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

                    word_counter_for_skip += 1
                
                    #check if skip needed
                    if  word_counter_for_skip >= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                    
                    #send SDF
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111100")

                    data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("01010000", crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(target, crc_16)

                    data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("00000000", crc_16)

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")

                    word_counter_for_skip += 1

                    #check if skip needed
                    if  word_counter_for_skip >= 5000:
                        data_to_log = ""
                        k_encoded_to_log = ""

                        data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                        log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                        log_file.write("32;7F7FCEFC;0;0001;\n")
                        word_counter_for_skip = 0
                else :
                    current_frame_size +=1

                #send Data
                for n in range(4):
                    if current_packet_size==packet_size-1:
                        current_packet_size = 0
                        #send EOP at the end of a packet
                        data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_16 = self.compute_crc_16("11111101", crc_16)
                    else:
                        current_packet_size += 1
                        #send EOP at the end of a packet
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_16 = self.compute_crc_16(word_binary[32-8*(n+1):32-8*n], crc_16)
                log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                
                word_counter_for_skip += 1

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4])) 
                
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                
            #check if EDF and SDF to be sent
            if current_frame_size == frame_size:
                current_frame_size = 1
                data_to_log = ""
                k_encoded_to_log = ""
                sequence += 1
                

                #Send EDF
                data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("00011100", crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

                crc_16 = self.invert_string(crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;00" + f"{(int(crc_16, 2)):0>4X}" + f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

                word_counter_for_skip += 1
            
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                
                #send SDF
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("11111100")

                data_10b, k_encoded  = await self.write_to_Rx("01010000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("01010000", crc_16)

                data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16(target, crc_16)

                data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_16 = self.compute_crc_16("00000000", crc_16)

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;00"+f"{(int(target, 2)):0>2X}"+"50FC;0;0001;\n")

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
            else :
                current_frame_size += 1

            #Send last data_word
            last_packet_sent = (packet_number * packet_size-1)%4
            for n in range(4):
                if current_packet_size==packet_size-1:
                    current_packet_size = 0
                    #send EOP at the end of a packet
                    data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111101", crc_16)
                elif n <= last_packet_sent:
                    current_packet_size += 1
                    #send EOP at the end of a packet
                    data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16(word_binary[32-8*(n+1):32-8*n], crc_16)
                else :
                    #send FILL 
                    data_10b, k_encoded  = await self.write_to_Rx("11111011", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_16 = self.compute_crc_16("11111011", crc_16)
            log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                
            #check if skip needed
            if  word_counter_for_skip >= 5000:
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;7F7FCEFC;0;0001;\n")
                word_counter_for_skip = 0
            
            #Send last EDF
            sequence += 1

            data_10b, k_encoded  = await self.write_to_Rx("00011100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16("00011100", crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_16 = self.compute_crc_16(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_16)

            crc_16 = self.invert_string(crc_16)

            data_10b, k_encoded  = await self.write_to_Rx(crc_16[8:16], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded  = await self.write_to_Rx(crc_16[0:8], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;00"+f"{(int(crc_16, 2)):0>4X}"+ f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "1C;0;0001;\n")

            word_counter_for_skip += 1
        
            #check if skip needed
            if  word_counter_for_skip >= 5000:
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;7F7FCEFC;0;0001;\n")
                word_counter_for_skip = 0

        elif frame_type==1: #if Broadcast Frame
            for j in range(packet_number):

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    
                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send SBF
                data_to_log = ""
                k_encoded_to_log = ""
                data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("11111100")

                data_10b, k_encoded  = await self.write_to_Rx("01011101", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("01011101", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(target, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8(target, crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("00101010", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("00101010", crc_8)

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;2A"+f"{(int(target, 2)):0>2X}"+"5DFC;0;0001;\n")
                
                word_counter_for_skip += 1

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send first broadcast data
                data_to_log = ""
                k_encoded_to_log = ""
                for n in range(4):
                    if packet_size != None:
                        data_10b, k_encoded  = await self.write_to_Rx(f"{(packet_size):0>64b}"[64-8*(n+1):64-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(f"{(packet_size):0>64b}"[64-8*(n+1):64-8*n], crc_8)
                    else:
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(word_binary[32-8*(n+1):32-8*n], crc_8)

                if packet_size != None:
                    log_file.write("32;" + f"{(packet_size):0>16X}"[8:16] + ";0;0000;\n")
                else:    
                    log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1

                #check if skip needed
                data_to_log = ""
                k_encoded_to_log = ""
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

                #Send last broadcast data
                data_to_log = ""
                k_encoded_to_log = ""
                for n in range(3):
                    if packet_size != None:
                        data_10b, k_encoded  = await self.write_to_Rx(f"{(packet_size):0>64b}"[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(f"{(packet_size):0>64b}"[32-8*(n+1):32-8*n], crc_8)
                    else:
                        data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                        data_to_log = data_10b + "_" + data_to_log
                        k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                        crc_8 = self.compute_crc_8(word_binary[32-8*(n+1):32-8*n], crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("11111101", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("11111101", crc_8)
                    
                if packet_size != None:
                    log_file.write("32;FD" + f"{(packet_size):0>16X}"[2:8] + ";0;0000;\n")
                else:    
                    log_file.write("32;FD" + f"{(int(word_binary, 2)):0>8X}"[2:8] + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                
                #Send EBF
                sequence += 1
                data_to_log = ""
                k_encoded_to_log = ""

                data_10b, k_encoded  = await self.write_to_Rx("01011100", 0, 1, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("01011100", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx("00000000", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8("00000000", crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

                crc_8 = self.invert_string(crc_8)

                data_10b, k_encoded  = await self.write_to_Rx(crc_8, 0, 0, invert_polarity = invert_polarity)
                data_to_log = data_10b + "_" + data_to_log
                k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                log_file.write("32;" + f"{(int(crc_8,2)):0>2X}" + f"{(sequence%128 + 128 * sequence_polarity):0>2X}" + "005C;0;0001;\n")

                word_counter_for_skip += 1

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0

        elif frame_type==2: #if Idle Frame
            current_frame_size = 0

            #send SIF

            data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8("11111100")

            data_10b, k_encoded  = await self.write_to_Rx("10000100", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8("10000100", crc_8)

            data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log
            crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

            crc_8 = self.invert_string(crc_8)

            data_10b, k_encoded  = await self.write_to_Rx(crc_8[0:8], 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;" + f"{(int(crc_8[0:8],2)):0>2X}" + f"{(sequence%128 +128 * sequence_polarity):0>2X}" + "84FC;0;0001;\n")

            word_counter_for_skip += 1
            
            for j in range(packet_size):
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                #check if SIF needed
                if current_frame_size == 64:
                    current_frame_size =0
                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8("11111100")

                    data_10b, k_encoded  = await self.write_to_Rx("01000100", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8("01000100", crc_8)

                    data_10b, k_encoded  = await self.write_to_Rx(str(sequence_polarity) + f"{(sequence%128):0>7b}", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    crc_8 = self.compute_crc_8(str(sequence_polarity) + f"{(sequence%128):0>7b}", crc_8)

                    crc_8 = self.invert_string(crc_8)

                    data_10b, k_encoded  = await self.write_to_Rx(crc_8[0:8], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;" + f"{(int(crc_8[0:8],2)):0>2X}" + f"{(sequence%128 + sequence_polarity*128):0>2X}" + "005C;0;0001;\n")

                    word_counter_for_skip += 1
                
 

                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    data_to_log = ""
                    k_encoded_to_log = ""

                    data_10b, k_encoded  = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    data_10b, k_encoded  = await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log

                    log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
                    log_file.write("32;7F7FCEFC;0;0001;\n")
                    word_counter_for_skip = 0
                    
                current_frame_size += 1
                for n in range(4):
                    data_10b, k_encoded  = await self.write_to_Rx(word_binary[32-8*(n+1):32-8*n], 0, 0, invert_polarity = invert_polarity)
                    data_to_log = data_10b + "_" + data_to_log
                    k_encoded_to_log = str(k_encoded) + k_encoded_to_log
                    
                log_file.write("32;" + f"{(int(word_binary, 2)):0>8X}" + ";0;0000;\n")
                log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")

                word_binary = word_binary[1:32] + str(int(word_binary[0])^int(word_binary[1])^int(word_binary[3])^int(word_binary[4]))

                word_counter_for_skip += 1


            
        #send idle word ten times for simu
        for i in range(10):
            data_to_log = ""
            k_encoded_to_log = ""

            data_10b, k_encoded = await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            data_10b, k_encoded = await self.write_to_Rx("11001111", 0, 0, invert_polarity = invert_polarity)
            data_to_log = data_10b + "_" + data_to_log
            k_encoded_to_log = str(k_encoded) + k_encoded_to_log

            log_file_10b.write("32;" + data_to_log + ";0;" + k_encoded_to_log + ";" + str(get_sim_time(units = "fs")) + "\n")
            log_file.write("32;CFCFCEFC;0;0001;\n")

        self.dut.RX_POS.value = cocotb.types.Logic("Z")
        self.dut.RX_NEG.value = cocotb.types.Logic("Z")  
        log_file.close()
        log_file_10b.close()

    def encode(self, data, k_encoding = 0):
        """
        encode data from 8bits to 10bits, depending of the disparity of the current link
        """

        self.logger.debug("sim_time %d ns: Encoding of a new symbol. Data value : %s D/K flag: %s", get_sim_time(units = "ns"), data, k_encoding)
        #separation of 5 least-significant bits and 3 most-significant bits
        ls_data = data[3:8]
        ms_data = data[0:3]

        self.logger.debug("sim_time %d ns: Data separation %s_%s", ms_data, ls_data)

        #boolean to decide wether to use primary encoding of Dx.7 or use the alternate encoding
        primary = 1

        #encoding of the 5b/6b
        if ls_data == "00000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "011000"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "100111"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00001":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00010":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00011":
            ls_encoded_data = "110001"

        elif ls_data == "00100":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110101"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "00101":
            ls_encoded_data = "101001"
        elif ls_data == "00110":
            ls_encoded_data = "011001"
        elif ls_data == "00111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000111"
            else:
                ls_encoded_data = "111000"
        elif ls_data == "01000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000110"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "111001"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "01001":
            ls_encoded_data = "100101"
        elif ls_data == "01010":
            ls_encoded_data = "010101"
        elif ls_data == "01011":
            ls_encoded_data = "110100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01100":
            ls_encoded_data = "001101"
        elif ls_data == "01101":
            ls_encoded_data = "101100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01110":
            ls_encoded_data = "011100"
            if self.dut_Rx_disparity[0] >= 0:
                primary = 0
        elif ls_data == "01111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "101000"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "010111"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "10000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011011"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "10001":
            ls_encoded_data = "100011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10010":
            ls_encoded_data = "010011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10011":
            ls_encoded_data = "110010"
        elif ls_data == "10100":
            ls_encoded_data = "001011"
            if self.dut_Rx_disparity[0] <= 0:
                primary = 0
        elif ls_data == "10101":
            ls_encoded_data = "101010"
        elif ls_data == "10110":
            ls_encoded_data = "011010"
        elif ls_data == "10111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "000101"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "111010"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11000":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110011"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11001":
            ls_encoded_data = "100110"
        elif ls_data == "11010":
            ls_encoded_data = "010110"
        elif ls_data == "11011":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "001001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "110110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11100":
            if k_encoding == 0:
                ls_encoded_data = "001110"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ls_encoded_data = "110000"
                    self.dut_Rx_disparity[0] -= 2
                else:
                    ls_encoded_data = "001111"
                    self.dut_Rx_disparity[0] += 2
        elif ls_data == "11101":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11110":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "100001"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "011110"
                self.dut_Rx_disparity[0] += 2
        elif ls_data == "11111":
            if self.dut_Rx_disparity[0] >= 0:
                ls_encoded_data = "010100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ls_encoded_data = "101011"
                self.dut_Rx_disparity[0] += 2
        else :
            self.logger.warning("sim_time %s ns : No valid encoding input on 5b/6b sub-block", get_sim_time(units = 'ns'))
            self.logger.debug("sim_time %d ns: Error, no valid encoding for input : %s ; Disparity is : %s", get_sim_time(units = "ns"), ls_data, self.dut_Rx_disparity[0])
            ls_encoded_data = "000000"


        #encoding of the 3b/4b
        if ms_data == "000":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0100"
                self.dut_Rx_disparity[0] -= 2
            else:
                ms_encoded_data = "1011"
                self.dut_Rx_disparity[0] += 2
        elif ms_data == "001":
            if k_encoding == 0:
                ms_encoded_data = "1001"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1001"
                else:
                    ms_encoded_data = "0110"
        elif ms_data == "010":
            if k_encoding == 0:
                ms_encoded_data = "0101"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "0101"
                else:
                    ms_encoded_data = "1010"
        elif ms_data == "011":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0011"
            else:
                ms_encoded_data = "1100"
        elif ms_data == "100":
            if self.dut_Rx_disparity[0] >= 0:
                ms_encoded_data = "0010"
                self.dut_Rx_disparity[0] -= 2
            else:
                ms_encoded_data = "1101"
                self.dut_Rx_disparity[0] += 2
        elif ms_data == "101":
            if k_encoding == 0:
                ms_encoded_data = "1010"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1010"
                else:
                    ms_encoded_data = "0101"
        elif ms_data == "110":
            if k_encoding == 0:
                ms_encoded_data = "0110"
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "0110"
                else:
                    ms_encoded_data = "1001"
        elif ms_data == "111":
            if k_encoding == 0:
                if self.dut_Rx_disparity[0] >= 0:
                    if primary == 1:
                        ms_encoded_data = "0001"
                        self.dut_Rx_disparity[0] -= 2
                    else:
                        ms_encoded_data = "1000"
                        self.dut_Rx_disparity[0] -= 2
                else:
                    if primary == 1:
                        ms_encoded_data = "1110"
                        self.dut_Rx_disparity[0] += 2
                    else:
                        ms_encoded_data = "0111"
                        self.dut_Rx_disparity[0] += 2
            else:
                if self.dut_Rx_disparity[0] >= 0:
                    ms_encoded_data = "1000"
                    self.dut_Rx_disparity[0] -= 2
                else:
                    ms_encoded_data = "0111"
                    self.dut_Rx_disparity[0] += 2
        else :
            self.logger.warning("sim_time %s ns : No valid encoding input on 3b/4b sub-block", get_sim_time(units = 'ns'))
            self.logger.debug("sim_time %d ns: Error, no valid encoding for input : %s ; Disparity is : %s", get_sim_time(units = "ns"), ms_data, self.dut_Rx_disparity[0])
            ms_encoded_data = "0000"

        return ls_encoded_data + ms_encoded_data