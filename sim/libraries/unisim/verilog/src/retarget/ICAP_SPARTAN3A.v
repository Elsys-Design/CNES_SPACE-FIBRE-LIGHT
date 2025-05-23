///////////////////////////////////////////////////////
//  Copyright (c) 1995/2006 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 12.1
//  \  \           Description :Xilinx Functional Simulation Library Component
//  /   /                  Internal Configuration Access Port for Spartan3a (Discontinue in 13.1)
//  /  /                      
// /__/   /\       Filename    : ICAP_SPARTAN3A.v
// \  \  /  \      Timestamp : Tue Jul 27 04:29:45 PST 2010
//  \__\/\__ \                    
//                                 
//  Revision:		
//  07/27/10 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module ICAP_SPARTAN3A (BUSY, O, CE, CLK, I, WRITE);

    output BUSY;
    output [7:0] O;

    input  CE, CLK, WRITE;
    input  [7:0] I;
    wire   [23:0] dummy_O;


ICAPE2 #(.ICAP_WIDTH("X8")) I5 ( .O({dummy_O,O}), .CLK(CLK), .CSIB(CE), .I({24'b0,I[7:0]}), .RDWRB(WRITE));

endmodule
