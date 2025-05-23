///////////////////////////////////////////////////////
//  Copyright (c) 1995/2006 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 12.1
//  \  \           Description :
//  /  /                      
// /__/   /\       Filename    : ICAP_SPARTAN6.v
// \  \  /  \      Timestamp : Tue Jul 27 04:34:23 PST 2010
//  \__\/\__ \                    
//                                 
//  Revision:		
//  07/27/10 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module ICAP_SPARTAN6 (BUSY, O, CE, CLK, I, WRITE);

  parameter DEVICE_ID = 32'h04000093;

  parameter SIM_CFG_FILE_NAME = "NONE";

  output BUSY;
  output [15:0] O;

  input CLK;
  input CE;
  input WRITE;
  input [15:0] I;
  wire [15:0] dummy_O;


ICAPE2 #(.DEVICE_ID(DEVICE_ID), .ICAP_WIDTH("X16"), .SIM_CFG_FILE_NAME(SIM_CFG_FILE_NAME)) I5 ( .O({dummy_O,O}), .CLK(CLK), .CSIB(CE), .I({16'b0,I}), .RDWRB(WRITE));

endmodule
