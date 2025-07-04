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
//  /   /             D Flip-Flop with Clock Enable (Discontinue in 13.1)
// /___/   /\     Filename : FDE.v
// \   \  /  \    Timestamp : Mon Mar 16 17:26:46 PDT 2009

//  \___\/\___\
//
// Revision:
//    03/16/09 - Initial version

`timescale  1 ps / 1 ps

module FDE (Q, C, CE, D);

    parameter [0:0] INIT = 1'b0;

    output Q;

    input  C, CE, D;

    wire Q;

    FDRE #(.INIT(INIT)) F3 (.Q(Q), .C(C), .CE(CE), .D(D), .R(1'b0));

endmodule

