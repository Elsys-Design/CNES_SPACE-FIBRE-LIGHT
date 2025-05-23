///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFDS_DPHY_COMP
// /___/   /\      Filename    : OBUFDS_DPHY_COMP.v
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

module OBUFDS_DPHY_COMP #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter IOSTANDARD = "DEFAULT"
)(
  output O,
  output OB,

  input HSTX_I,
  input HSTX_T,
  input LPTX_I_N,
  input LPTX_I_P,
  input LPTX_T
);

// define constants
  localparam MODULE_NAME = "OBUFDS_DPHY_COMP";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "OBUFDS_DPHY_COMP_dr.v"
`else
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif
  reg OB_out;
  reg O_out;

  wire HSTX_I_in;
  wire HSTX_T_in;
  wire LPTX_I_N_in;
  wire LPTX_I_P_in;
  wire LPTX_T_in;

  reg hs_mode = 1'b1;

  assign (strong1, strong0) O   = (hs_mode === 1'b0) ? O_out  : 1'bz;
  assign (strong1, strong0) OB  = (hs_mode === 1'b0) ? OB_out : 1'bz;
  assign (supply1, supply0) O   = (hs_mode === 1'b1) ? O_out  : 1'bz;
  assign (supply1, supply0) OB  = (hs_mode === 1'b1) ? OB_out : 1'bz;

  assign HSTX_I_in   = HSTX_I;
  assign HSTX_T_in   = HSTX_T;
  assign LPTX_I_N_in = LPTX_I_N;
  assign LPTX_I_P_in = LPTX_I_P;
  assign LPTX_T_in   = LPTX_T;


`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
end
`endif

// begin behavioral model


  always @ (LPTX_T_in or HSTX_T_in or LPTX_I_P_in or LPTX_I_N_in or HSTX_I_in) begin
    if (LPTX_T_in === 1'b0) begin
      O_out   <= LPTX_I_P_in;
      OB_out  <= LPTX_I_N_in;
      hs_mode <= 1'b0;
    end else if (LPTX_T_in === 1'b1 && HSTX_T_in === 1'b0) begin
      O_out   <= ~HSTX_I_in;
      OB_out  <= HSTX_I_in;
      hs_mode <= 1'b1;
    end else begin
      O_out   <= 1'bz;
      OB_out  <= 1'bz;
      hs_mode <= 1'bx;
    end
  end


// end behavioral model

endmodule

`endcelldefine
