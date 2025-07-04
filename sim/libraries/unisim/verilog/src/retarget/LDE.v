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
//  /   /             Transparent Data Latch with Gate Enable (Discontinue in 13.1)
// /___/   /\     Filename : LDE.v
// \   \  /  \    Timestamp : Mon Mar 16 18:06:33 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module LDE (Q, G, GE, D);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  G, GE, D;

    wire Q;

    LDCE #(.INIT(INIT)) L7 (.Q(Q), .G(G), .GE(GE), .CLR(1'b0), .D(D));

endmodule

