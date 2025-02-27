///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_NOC_S_AXIS
// /___/   /\      Filename    : AIE_NOC_S_AXIS.v
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

module AIE_NOC_S_AXIS
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output S_AXIS_ACLK,
  output S_AXIS_TREADY,
  output TO_AIE_2,
  output TO_AIE_3,
  output TO_AIE_6,
  output TO_AIE_7,

  input FROM_NOC,
  input [127:0] S_AXIS_TDATA,
  input [9:0] S_AXIS_TDEST,
  input [1:0] S_AXIS_TID,
  input [15:0] S_AXIS_TKEEP,
  input S_AXIS_TLAST,
  input S_AXIS_TVALID
);

// define constants
  localparam MODULE_NAME = "AIE_NOC_S_AXIS";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
