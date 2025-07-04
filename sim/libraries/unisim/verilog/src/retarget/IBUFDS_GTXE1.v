///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                   Differential Signaling Input Buffer for GTs
// /___/   /\     Filename : IBUFDS_GTXE1.v
// \   \  /  \    Timestamp : Thu Aug 4 23:37:39 PDT 2011
//  \___\/\___\
//
// Revision:
//    08/04/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IBUFDS_GTXE1 (O, ODIV2, CEB, I, IB);

    parameter CLKCM_CFG = "TRUE";
    parameter CLKRCV_TRST = "TRUE";
    parameter [9:0] REFCLKOUT_DLY = 10'b0000000000;

    output O; 
    output ODIV2; 

    input CEB; 
    input I; 
    input IB; 

initial begin
    $display ("ERROR : The following component IBUFDS_GTXE1 at instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com.");
    $finish;
end

endmodule // IBUFDS_GTXE1
