///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_PL_S_AXIS128
// /___/   /\      Filename    : AIE_PL_S_AXIS128.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module AIE_PL_S_AXIS128
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [1:0] S_AXIS_TREADY,
  output [1:0] TO_AIE,

  input S_AXIS_ACLK,
  input [127:0] S_AXIS_TDATA,
  input [1:0] S_AXIS_TKEEP,
  input [1:0] S_AXIS_TLAST,
  input [1:0] S_AXIS_TVALID
);

// define constants
  localparam MODULE_NAME = "AIE_PL_S_AXIS128";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
