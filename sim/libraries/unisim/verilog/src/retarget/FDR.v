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
//  /   /             D Flip-Flop with Synchronous Reset (Discontinue in 13.1)
// /___/   /\     Filename : FDR.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:15 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDR (Q, C, D, R);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  C, D, R;

    wire Q;

    FDRE #(.INIT(INIT)) F3(.Q(Q), .C(C), .CE(1'b1), .D(D), .R(R));

endmodule

