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
//  /   /             D Flip-Flop with Synchronous Reset and Set and Clock Enable and Negative_Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : FDRSE_1.v
// \   \  /  \    Timestamp : Mon Feb 22 03:15:47 PDT 2010

//  \___\/\___\
//
// Revision:
//    02/22/10 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module FDRSE_1 (Q, C, CE, D, R, S);

    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_C_INVERTED = 1'b0;
    parameter [0:0] IS_CE_INVERTED = 1'b0;
    parameter [0:0] IS_D_INVERTED = 1'b0;
    parameter [0:0] IS_R_INVERTED = 1'b0;
    parameter [0:0] IS_S_INVERTED = 1'b0;

    output Q;

    input  C, CE, D, R, S;

    wire Q;
    wire D0;
    wire CE_in;
    wire D_in;
    wire S_in;

    assign CE_in = IS_CE_INVERTED ^ CE;
    assign D_in = IS_D_INVERTED ^ D;
    assign S_in = IS_S_INVERTED ^ S;

    LUT4 #(.INIT(16'hFFCA)) L4 (.O(D0), .I0(Q), .I1(D_in), .I2(CE_in), .I3(S_in)); 
    FDRE #(.INIT(INIT), .IS_C_INVERTED(IS_C_INVERTED), .IS_R_INVERTED(IS_R_INVERTED)) F3 (.Q(Q), .C(~C), .CE(1'b1), .D(D0), .R(R));
endmodule

