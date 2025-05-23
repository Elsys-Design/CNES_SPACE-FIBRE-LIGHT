///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFDS_GTE5_ADV
// /___/   /\      Filename    : OBUFDS_GTE5_ADV.v
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

module OBUFDS_GTE5_ADV #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",  
`endif
  parameter [0:0] REFCLK_EN_TX_PATH = 1'b0,
  parameter [0:0] REFCLK_EN_DRV = 1'b0 
)(
  output O,
  output OB,

  input CEB,
  input [3:0] I,
  input [1:0] RXRECCLKSEL
);
  
// define constants
  localparam MODULE_NAME = "OBUFDS_GTE5_ADV";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "OBUFDS_GTE5_ADV_dr.v"
`else
  reg [0:0] REFCLK_EN_DRV_REG = REFCLK_EN_DRV;
  reg [0:0] REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
`endif

`ifdef XIL_XECLIB
  reg glblGTS = 1'b0;
`else
  tri0 glblGTS = glbl.GTS;
`endif
   
  wire CEB_in;
  wire [1:0] RXRECCLKSEL_in;
  wire [3:0] I_in;

  assign CEB_in = CEB;
  assign I_in = I;
  assign RXRECCLKSEL_in[0] = (RXRECCLKSEL[0] !== 1'bz) && RXRECCLKSEL[0]; // rv 0
  assign RXRECCLKSEL_in[1] = (RXRECCLKSEL[1] !== 1'bz) && RXRECCLKSEL[1]; // rv 0

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
  end
`endif  

// begin behavioral model

  reg  I_sel = 1'b0;
// =====================
// Generate I_sel
// =====================
  always @(*) begin
    case (RXRECCLKSEL_in)
      2'b00:    I_sel <= I_in[0];
      2'b01:    I_sel <= I_in[1];
      2'b10:    I_sel <= I_in[2];
      2'b11:    I_sel <= I_in[3];
      default : I_sel <= I_in[0];
     endcase
   end

// =====================
// Generate O
// =====================

  assign O  = (~(REFCLK_EN_TX_PATH_REG && REFCLK_EN_DRV_REG) || (CEB_in === 1'b1) || glblGTS) ? 1'bz : I_sel;
  assign OB = (~(REFCLK_EN_TX_PATH_REG && REFCLK_EN_DRV_REG) || (CEB_in === 1'b1) || glblGTS) ? 1'bz : ~I_sel;

// end behavioral model

endmodule

`endcelldefine
