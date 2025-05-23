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
//  /   /             D Flip-Flop with Synchronous and Set (Discontinue in 13.1)
// /___/   /\     Filename : FDS.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:19 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDS (Q, C, D, S);

    parameter [0:0] INIT = 1'b1;

    output Q;

    input  C, D, S;

    wire Q;

    FDSE #(.INIT(INIT)) F4(.Q(Q), .C(C), .CE(1'b1), .D(D), .S(S));

endmodule

