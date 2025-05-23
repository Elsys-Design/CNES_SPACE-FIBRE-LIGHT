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
//  /   /             16-Bit Shift Register Look-Up-Table with Carry and Negative-Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : SRLC16_1.v
// \   \  /  \    Timestamp : Wed Mar 18 12:13:51PST 2009
//  \___\/\___\
//
// Revision:
//    03/18/09 - Initial version
//    01/03/13 - 677832 - change retarget from SRLC16E to 2 x SRL16E

`timescale  1 ps / 1 ps

module SRLC16_1 (Q, Q15, A0, A1, A2, A3, CLK, D);

    parameter [15:0] INIT = 16'h0000;

    output Q, Q15;

    input  A0, A1, A2, A3, CLK, D;

    SRL16E #(.INIT(INIT)) S0 (.Q(Q), .A0(A0), .A1(A1), .A2(A2), .A3(A3), .CE(1'b1), .CLK(~CLK), .D(D));
    SRL16E #(.INIT(INIT)) S1 (.Q(Q15), .A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1), .CE(1'b1), .CLK(~CLK), .D(D));

endmodule
