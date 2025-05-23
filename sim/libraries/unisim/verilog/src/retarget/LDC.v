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
//  /   /             Transparent Data Latch with Asynchronous Clear (Discontinue in 13.1)
// /___/   /\     Filename : LDC.v
// \   \  /  \    Timestamp : Mon Mar 16 18:06:31 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module LDC (Q, G, CLR, D);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  G, CLR, D;

    wire Q;

    LDCE #(.INIT(INIT)) L7 (.Q(Q), .G(G), .GE(1'b1), .CLR(CLR), .D(D));

endmodule

