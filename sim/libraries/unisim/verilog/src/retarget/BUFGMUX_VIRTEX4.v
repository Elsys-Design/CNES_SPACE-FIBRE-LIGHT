// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /             Global Clock Mux Buffer (Discontinue in 13.1)
// /___/   /\     Filename : BUFGMUX_VIRTEX4.v
// \   \  /  \    Timestamp : Tue Aug 18 05:36:39 PST 2009
//  \___\/\___\
//
// Revision:
//    08/18/09 - Initial version

`timescale  1 ps / 1 ps
module BUFGMUX_VIRTEX4 (O, I0, I1, S);

    output O;
    
    input  I0;
    input  I1;
    input  S;

    BUFGCTRL #(.INIT_OUT(1'b0), .PRESELECT_I0("TRUE"), .PRESELECT_I1("FALSE")) B0 (.O(O), .CE0(1'b1), .CE1(1'b1), .I0(I0), .I1(I1), .IGNORE0(1'b0), .IGNORE1(1'b0), .S0(~S), .S1(S));
    
endmodule
