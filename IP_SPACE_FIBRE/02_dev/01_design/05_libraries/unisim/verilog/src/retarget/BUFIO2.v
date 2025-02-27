///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  I/O Clock Buffer/Divider for the Spartan Series
// /___/   /\     Filename : BUFIO2.v
// \   \  /  \    Timestamp : Tue Aug 16 13:49:22 PDT 2011
//  \___\/\___\
//
// Revision:
//    08/16/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFIO2 (DIVCLK, IOCLK, SERDESSTROBE, I);



  parameter DIVIDE_BYPASS = "TRUE";    // TRUE, FALSE
  parameter integer DIVIDE = 1;        // {1..8}
  parameter I_INVERT = "FALSE";        // TRUE, FALSE
  parameter USE_DOUBLER = "FALSE";     // TRUE, FALSE


    output DIVCLK; 
    output IOCLK; 
    output SERDESSTROBE; 

    input I; 


    initial begin
	$display ("ERROR : The following component BUFIO2 at instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com.");
	$finish;
    end



endmodule // BUFIO2

