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
//  /   /             D Flip-Flop with Negative-Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : FD_1.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:41 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FD_1 (Q, C, D);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  C, D;

    wire Q;

    FDRE #(.INIT(INIT)) F3 (.Q(Q), .C(~C), .CE(1'b1), .D(D), .R(1'b0));

endmodule

