##########################################################################
## COMPANY       : CNES
##########################################################################
## TITLE         : SpaceFibre_Driver.py
## PROJECT       : SPACE FIBRE LIGHT
##########################################################################
## AUTHOR        : Thomas FAVRE-FELIX
## CREATED       : 20/09/2024
##########################################################################
## DESCRIPTION   : Contains SpaceFibre_Driver class for serial port
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



class SpaceFibre_Driver:

    def __init__(self, dut, dut_Rx_disparity, dut_Tx_disparity, logger, period_ps):
        self.dut = dut
        self.dut_Rx_disparity = dut_Rx_disparity
        self.dut_Tx_disparity = dut_Tx_disparity
        self.logger = logger
        self.time_per_input = period_ps

       
    async def write_to_Rx(self, data, delay,  k_encoding = 0, invert_polarity = 0):
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
            await Timer(delay, units="ps")
        for d in range(len(serialized_data)):
            if invert_polarity == 0:
                self.dut.RX_POS.value = serialized_data[d]
                self.dut.RX_NEG.value = serialized_data[d]^1
            else :
                self.dut.RX_POS.value = serialized_data[d]^1
                self.dut.RX_NEG.value = serialized_data[d]
            await Timer(time_per_input + variation, units="fs")
        self.logger.debug("sim_time %d ns: Data encoded sent : %d", get_sim_time(units = "ns"), encoded_data)

    
    async def write_from_file(self, file_path, file_format = 16, invert_polarity = 0) : 
        assert os.path.exists(file_path), "Source file doesn't exist"

        self.logger.info("sim_time %d ns: Writing from file %s", get_sim_time(units = "ns"), file_path)
        input_file = open(file_path, "r")
        word_counter_for_skip = 2
        
        for input in input_file:
            input_splitted = input.split(';')
            if input_splitted[-1] == "\n":
                input_splitted.remove("\n")
            elif '\n' in input_splitted[-1]:
                input_splitted[-1] = input_splitted[-1].replace("\n", "")
            for x in range(0, len(input_splitted), 4):
                
                #check if skip needed
                if  word_counter_for_skip >= 5000:
                    await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                    await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                    await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                    word_counter_for_skip = 0

                input_data = f"{(int(input_splitted[x+1], base = file_format)):b}"
                if int(input_splitted[x]) == 8:
                    assert len(input_data) <= 8, "Data size different from indicated"
                    while len(input_data) < 8:
                        input_data = "0" + input_data
                    await self.write_to_Rx(input_data, int(input_splitted[x+2]),  int(input_splitted[x+3]), invert_polarity = invert_polarity)
                    word_counter_for_skip += 0.25
                elif int(input_splitted[x]) == 32:
                    assert len(input_data) <= 32, "Data size different from indicated"
                    while len(input_data) < 32:
                        input_data = "0" + input_data
                    await self.write_to_Rx(input_data[24:32], int(input_splitted[x+2]), int(input_splitted[x+3][3]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[16:24], int(input_splitted[x+2]), int(input_splitted[x+3][2]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[8:16], int(input_splitted[x+2]), int(input_splitted[x+3][1]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[:8], int(input_splitted[x+2]), int(input_splitted[x+3][0]), invert_polarity = invert_polarity)
                    word_counter_for_skip += 1
                elif int(input_splitted[x]) == 64:
                    assert len(input_data) <= 64, "Data size different from indicated"
                    while len(input_data) < 64:
                        input_data = "0" + input_data
                    await self.write_to_Rx(input_data[56:64], int(input_splitted[x+2]), int(input_splitted[x+3][7]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[48:56], int(input_splitted[x+2]), int(input_splitted[x+3][6]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[40:48], int(input_splitted[x+2]), int(input_splitted[x+3][5]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[32:40], int(input_splitted[x+2]), int(input_splitted[x+3][4]), invert_polarity = invert_polarity)
                    word_counter_for_skip += 1
                    #check if skip needed
                    if  word_counter_for_skip >= 5000:
                        await self.write_to_Rx("11111100", 0, 1, invert_polarity = invert_polarity)
                        await self.write_to_Rx("11001110", 0, 0, invert_polarity = invert_polarity)
                        await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        await self.write_to_Rx("01111111", 0, 0, invert_polarity = invert_polarity)
                        word_counter_for_skip = 0

                    await self.write_to_Rx(input_data[24:32], int(input_splitted[x+2]), int(input_splitted[x+3][3]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[16:24], int(input_splitted[x+2]), int(input_splitted[x+3][2]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[8:16], int(input_splitted[x+2]), int(input_splitted[x+3][1]), invert_polarity = invert_polarity)
                    await self.write_to_Rx(input_data[:8], int(input_splitted[x+2]), int(input_splitted[x+3][0]), invert_polarity = invert_polarity)
                    word_counter_for_skip += 1
                else:
                    self.logger.error("sim_time %d ns: Error on input size. Size specified : %s Data input: %s", get_sim_time(units = "ns"), input_splitted[x], input)
                    assert 1<0, "Unsupported data size, must be 8, 32 or 64"

            
        self.dut.RX_POS.value = cocotb.types.Logic("Z")
        self.dut.RX_NEG.value = cocotb.types.Logic("Z")
        input_file.close()

    def invert(self, encoded_data):
        """
        Take in input a encoded data as a string of bits of 0 or 1, and convert them to a list of integer,
        starting from lowest significant bit
        """
        inverted_data = []
        for x in range(len(encoded_data)):
            inverted_data = inverted_data  + [int(encoded_data[x])]
        return inverted_data
    
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