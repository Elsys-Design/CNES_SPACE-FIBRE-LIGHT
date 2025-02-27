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
// /__/   /\       Filename    : ICAP_VIRTEX4.v
// \  \  /  \      Timestamp : Tue Jul 27 04:27:39 PST 2010
//  \__\/\__ \                    
//                                 
//  Revision:		
//  07/27/10 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module ICAP_VIRTEX4 (BUSY, O, CE, CLK, I, WRITE);

    output BUSY;
    output [31:0] O;

    input  CE, CLK, WRITE;
    input  [31:0] I;

    parameter ICAP_WIDTH = "X8";


ICAPE2 #(.ICAP_WIDTH(ICAP_WIDTH)) I5 ( .O(O), .CLK(CLK), .CSIB(CE), .I(I), .RDWRB(WRITE));

endmodule
