///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DDRMC_RIU
// /___/   /\      Filename    : DDRMC_RIU.v
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

module DDRMC_RIU
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [9:0] IF_DMC2PHY0_RIU_DMC2PHY_CTRL_CLK,
  output [79:0] IF_DMC2PHY0_RIU_DMC2RIU_ADDR,
  output [10:0] IF_DMC2PHY0_RIU_DMC2RIU_NIBBLE_SEL,
  output [159:0] IF_DMC2PHY0_RIU_DMC2RIU_WR_DATA,
  output [9:0] IF_DMC2PHY0_RIU_DMC2RIU_WR_EN,
  output [9:0] IF_DMC2PHY1_RIU_DMC2PHY_CTRL_CLK,
  output [79:0] IF_DMC2PHY1_RIU_DMC2RIU_ADDR,
  output [10:0] IF_DMC2PHY1_RIU_DMC2RIU_NIBBLE_SEL,
  output [159:0] IF_DMC2PHY1_RIU_DMC2RIU_WR_DATA,
  output [9:0] IF_DMC2PHY1_RIU_DMC2RIU_WR_EN,
  output [9:0] IF_DMC2PHY2_RIU_DMC2PHY_CTRL_CLK,
  output [79:0] IF_DMC2PHY2_RIU_DMC2RIU_ADDR,
  output [10:0] IF_DMC2PHY2_RIU_DMC2RIU_NIBBLE_SEL,
  output [159:0] IF_DMC2PHY2_RIU_DMC2RIU_WR_DATA,
  output [9:0] IF_DMC2PHY2_RIU_DMC2RIU_WR_EN,

  input [159:0] IF_DMC2PHY0_RIU_RIU2DMC_RD_DATA,
  input [9:0] IF_DMC2PHY0_RIU_RIU2DMC_VALID,
  input [159:0] IF_DMC2PHY1_RIU_RIU2DMC_RD_DATA,
  input [9:0] IF_DMC2PHY1_RIU_RIU2DMC_VALID,
  input [159:0] IF_DMC2PHY2_RIU_RIU2DMC_RD_DATA,
  input [9:0] IF_DMC2PHY2_RIU_RIU2DMC_VALID
);

// define constants
  localparam MODULE_NAME = "DDRMC_RIU";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
