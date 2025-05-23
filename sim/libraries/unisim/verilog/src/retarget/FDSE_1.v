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
//  /   /             D Flip-Flop with Synchronous Set and Clock Enable and Negative-Edge Clock (Discontinue in 13.1)
// /___/   /\     Filename : FDSE_1.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:20 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDSE_1 (Q, C, CE, D, S);

    parameter [0:0] INIT = 1'b1;

    output Q;

    input  C, CE, D, S;

    wire Q;

    FDSE #(.INIT(INIT)) F4(.Q(Q), .C(~C), .CE(CE), .D(D), .S(S));

endmodule

