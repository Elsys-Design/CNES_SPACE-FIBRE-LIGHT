///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_SRCMX_OPTINV
// /___/   /\      Filename    : DSP_FP_SRCMX_OPTINV.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  06/28/17 - Initial
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_FP_SRCMX_OPTINV #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [0:0] IS_ASYNC_RST_NAT_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_NAT_INVERTED = 1'b0,
  parameter [0:0] IS_RSTD_NAT_INVERTED = 1'b0
)(
  output ASYNC_RST,
  output CLK,
  output RSTD,

  input ASYNC_RST_NAT,
  input CLK_NAT,
  input RSTD_NAT
);
  
// define constants
  localparam MODULE_NAME = "DSP_FP_SRCMX_OPTINV";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FP_SRCMX_OPTINV_dr.v"
`else
  reg [0:0] IS_ASYNC_RST_NAT_INVERTED_REG = IS_ASYNC_RST_NAT_INVERTED;
  reg [0:0] IS_CLK_NAT_INVERTED_REG = IS_CLK_NAT_INVERTED;
  reg [0:0] IS_RSTD_NAT_INVERTED_REG = IS_RSTD_NAT_INVERTED;
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

// begin behavioral model

  assign ASYNC_RST = ASYNC_RST_NAT ^ IS_ASYNC_RST_NAT_INVERTED_REG;

  assign CLK = CLK_NAT ^ IS_CLK_NAT_INVERTED_REG;

  assign RSTD = RSTD_NAT ^ IS_RSTD_NAT_INVERTED_REG;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK_NAT => CLK) = (0:0:0, 0:0:0);
    (negedge ASYNC_RST_NAT => (ASYNC_RST +: 0)) = (100:100:100, 100:100:100);
    (negedge RSTD_NAT => (RSTD +: 0)) = (100:100:100, 100:100:100);
    (posedge ASYNC_RST_NAT => (ASYNC_RST +: 0)) = (100:100:100, 100:100:100);
    (posedge RSTD_NAT => (RSTD +: 0)) = (100:100:100, 100:100:100);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
