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
//  /   /             D Flip-Flop with Asynchronous Preset and Negative-Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : FDP_1.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:47 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDP_1 (Q, C, D, PRE);

    parameter [0:0] INIT = 1'b1;

    output Q;

    input  C, D, PRE;

    wire Q;

    FDPE #(.INIT(INIT)) F2 (.Q(Q), .C(~C), .CE(1'b1), .D(D), .PRE(PRE));

endmodule

