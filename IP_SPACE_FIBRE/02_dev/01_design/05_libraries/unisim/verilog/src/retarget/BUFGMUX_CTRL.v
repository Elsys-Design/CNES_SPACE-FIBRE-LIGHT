// $Header:  $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Global Clock Mux Buffer
// /___/   /\     Filename : BUFGMUX_CTRL.v
// \   \  /  \    Timestamp : Wed Feb 09 14:43:23 PST 2011
//  \___\/\___\
//
// Revision:
//    02/09/11 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module BUFGMUX_CTRL (O, I0, I1, S);
    
    output O;
    
    input  I0;
    input  I1;
    input  S;
    
    BUFGCTRL #(.INIT_OUT(1'b0), .PRESELECT_I0("TRUE"), .PRESELECT_I1("FALSE")) B0 (.O(O), .CE0(1'b1), .CE1(1'b1), .I0(I0), .I1(I1), .IGNORE0(1'b0), .IGNORE1(1'b0), .S0(~S), .S1(S));
    
endmodule
