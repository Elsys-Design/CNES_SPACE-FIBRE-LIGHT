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
//  /   /             16-Bit Shift Register Look-Up-Table  with Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : SRL16E_1.v
// \   \  /  \    Timestamp : Tue Mar 06 16:16:24PST 2009
//  \___\/\___\
//
// Revision:
//    03/06/09 - Initial version
//    08/09/12 - 669069 change retarget from SRLC16E to SRL16E

`timescale  1 ps / 1 ps


module SRL16E_1 (Q, A0, A1, A2, A3, CE, CLK, D);

    parameter [15:0] INIT = 16'h0000;

    output Q;

    input  A0, A1, A2, A3, CLK, CE, D;


    SRL16E #(.INIT(INIT)) S0 (.Q(Q), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .CE(CE), .CLK(~CLK), .D(D));

endmodule


