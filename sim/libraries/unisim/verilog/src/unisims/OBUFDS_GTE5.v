///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFDS_GTE5
// /___/   /\      Filename    : OBUFDS_GTE5.v
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

module OBUFDS_GTE5 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [0:0] REFCLK_EN_DRV = 1'b0,
  parameter [0:0] REFCLK_EN_TX_PATH = 1'b0
)(
  output O,
  output OB,

  input CEB,
  input I
);

// define constants
  localparam MODULE_NAME = "OBUFDS_GTE5";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "OBUFDS_GTE5_dr.v"
`else
  reg [0:0] REFCLK_EN_DRV_REG = REFCLK_EN_DRV;
  reg [0:0] REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
end
`endif

// begin behavioral model

`ifdef XIL_XECLIB
  reg glblGTS = 1'b0;
`else
  tri0 glblGTS = glbl.GTS;
`endif

// =====================
// Generate O
// =====================

  assign O = (~REFCLK_EN_TX_PATH_REG || (CEB === 1'b1) || glblGTS) ? 1'bz : I;
  assign OB = (~REFCLK_EN_TX_PATH_REG || (CEB === 1'b1) || glblGTS) ? 1'bz : ~I;


// end behavioral model

endmodule

`endcelldefine
