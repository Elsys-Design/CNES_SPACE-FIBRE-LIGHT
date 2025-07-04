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
//  /   /             Transparent Data Latch with Asynchronous Preset and Inverted Gate (Discontinue in 13.1)
// /___/   /\     Filename : LDP_1.v
// \   \  /  \    Timestamp : Mon Mar 16 18:06:34 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module LDP_1 (Q, G, D, PRE);

    parameter [0:0] INIT = 1'b1;

    output Q;

    input  G, D, PRE;

    wire Q;

    LDPE #(.INIT(INIT)) L8 (.Q(Q), .G(~G), .GE(1'b1), .D(D), .PRE(PRE));

endmodule

