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
//  /   /             Transparent Data Latch with Asynchronous Clear and Preset and Inverted Gate  (Discontinue in 13.1)
// /___/   /\     Filename : LDCP_1.v
// \   \  /  \    Timestamp : Mon Aug 20 03:28:53 PDT 2009

//  \___\/\___\
//
// Revision:
//    08/20/09 - Initial version
//    08/23/13 - PR683925 - add invertible pin support.

`timescale  1 ps / 1 ps

module LDCP_1 (Q, CLR, D, G, PRE);

    parameter [0:0] INIT = 1'b0;
    parameter [0:0] IS_CLR_INVERTED = 1'b0;
    parameter [0:0] IS_D_INVERTED = 1'b0;
    parameter [0:0] IS_G_INVERTED = 1'b0;
    parameter [0:0] IS_PRE_INVERTED = 1'b0;

    output Q;
    input  CLR, D, G, PRE;

    wire Q, D0, G0;
    wire CLR_in;
    wire D_in;
    wire G_in;
    wire PRE_in;

    assign CLR_in = IS_CLR_INVERTED ^ CLR;  
    assign D_in = IS_D_INVERTED ^ D;  
    assign G_in = IS_G_INVERTED ^ G;  
    assign PRE_in = IS_PRE_INVERTED ^ PRE;  

    LUT3 #(.INIT (8'h32)) L3_1 (.I0(PRE_in), .I1(CLR_in), .I2(D_in), .O(D0));
    LUT3 #(.INIT (8'hFD)) L3_2 (.I0(G_in), .I1(CLR_in), .I2(PRE_in), .O(G0));
    LDCE #(.INIT(INIT)) L7 (.Q(Q), .G(G0), .GE(1'b1), .CLR(1'b0), .D(D0));

endmodule

