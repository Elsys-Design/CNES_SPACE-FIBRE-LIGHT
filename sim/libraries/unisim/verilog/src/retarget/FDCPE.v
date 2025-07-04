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
//  /   /             D Flip-Flop with Asynchronous Clear and Preset and Clock Enable  (Discontinue in 13.1)
// /___/   /\     Filename : FDCPE.v
// \   \  /  \    Timestamp : Mon Aug 19 09:38:44 PDT 2009

//  \___\/\___\
//
// Revision:
//    08/19/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module FDCPE (Q, C, CE, CLR, D, PRE);

    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    parameter [0:0] IS_CLR_INVERTED = 1'b0;
    parameter [0:0] IS_PRE_INVERTED = 1'b0;

    output Q;

    input  C, CE, CLR, D, PRE;

    wire Q;
    wire D0, D1, S0;
    wire PRE_in;

    assign PRE_in = IS_PRE_INVERTED ^ PRE;

    FDCE #(.INIT(INIT), .IS_C_INVERTED(IS_C_INVERTED), .IS_CLR_INVERTED(IS_CLR_INVERTED)) F1 (.Q(D0), .C(C), .CE(CE), .CLR(CLR), .D(D));
    FDPE #(.INIT(INIT), .IS_C_INVERTED(IS_C_INVERTED), .IS_PRE_INVERTED(IS_PRE_INVERTED)) F2 (.Q(D1), .C(C), .CE(CE), .D(D), .PRE(PRE));
    LDCE #(.INIT(INIT), .IS_CLR_INVERTED(IS_CLR_INVERTED)) L7 (.Q(S0), .G(PRE_in), .GE(1'b1), .CLR(CLR), .D(1'b1));
    LUT3 #(.INIT(8'hCA)) L3 (.O(Q), .I0(D0), .I1(D1), .I2(S0)); 
endmodule

