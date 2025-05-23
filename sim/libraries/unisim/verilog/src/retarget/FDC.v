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
//  /   /             D Flip-Flop with Asynchronous Clear (Discontinue in 13.1)
// /___/   /\     Filename : FDC.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:41 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDC (Q, C, CLR, D);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  C, CLR, D;

    wire Q;

    FDCE #(.INIT(INIT)) F1 (.Q(Q), .C(C), .CE(1'b1), .CLR(CLR), .D(D));

endmodule

