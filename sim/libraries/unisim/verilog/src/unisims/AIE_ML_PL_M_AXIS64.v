///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_ML_PL_M_AXIS64
// /___/   /\      Filename    : AIE_ML_PL_M_AXIS64.v
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

module AIE_ML_PL_M_AXIS64
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [63:0] M_AXIS_TDATA,
  output M_AXIS_TKEEP,
  output M_AXIS_TLAST,
  output M_AXIS_TVALID,

  input FROM_AIE,
  input M_AXIS_ACLK,
  input M_AXIS_TREADY
);

// define constants
  localparam MODULE_NAME = "AIE_ML_PL_M_AXIS64";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
