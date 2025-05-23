// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.12)
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /                  32-Bit Shift Register Look-Up-Table with Clock Enable
// /___/   /\     Filename : SRL32E.v
// \   \  /  \    
//  \___\/\___\
//
// Revision:
//    03/15/05 - Initial version.
//    01/07/06 - Add LOC parameter (CR 222733)
//    01/18/06 - Add timing path for A1, A2, A3, A4 (CR224341).
//    05/07/08 - Add negative setup/hold support (CR468872)
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    01/03/13 - 677832 - Moved to retarget -> SRLC32E, remove all timing.
// End Revision

`timescale 1 ps/1 ps

module SRL32E (Q, A, CE, CLK, D);

  parameter [31:0] INIT = 32'h00000000;

  output Q;

  input  [4:0] A;
  input  CE, CLK, D;

  SRLC32E #(.INIT(INIT)) S0 ( .Q(Q), .Q31(), .A(A), .CE(CE), .CLK(CLK), .D(D));

endmodule
