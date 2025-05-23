///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_SRCMX_OPTINV
// /___/   /\      Filename    : DSP_SRCMX_OPTINV.v
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

module DSP_SRCMX_OPTINV #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DSP_MODE = "INT24",
  parameter [0:0] IS_ASYNC_RST_IN_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_IN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTAD_IN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTD_IN_INVERTED = 1'b0
)(
  output ASYNC_RST,
  output CLK,
  output RSTAD,
  output RSTD,

  input ASYNC_RST_IN,
  input CLK_IN,
  input RSTAD_IN,
  input RSTD_IN
);
  
// define constants
  localparam MODULE_NAME = "DSP_SRCMX_OPTINV";

// Parameter encodings and registers
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_SRCMX_OPTINV_dr.v"
`else
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [0:0] IS_ASYNC_RST_IN_INVERTED_REG = IS_ASYNC_RST_IN_INVERTED;
  reg [0:0] IS_CLK_IN_INVERTED_REG = IS_CLK_IN_INVERTED;
  reg [0:0] IS_RSTAD_IN_INVERTED_REG = IS_RSTAD_IN_INVERTED;
  reg [0:0] IS_RSTD_IN_INVERTED_REG = IS_RSTD_IN_INVERTED;
`endif

`ifdef XIL_XECLIB
  wire [1:0] DSP_MODE_BIN;
`else
  reg [1:0] DSP_MODE_BIN;
`endif

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
initial begin
  trig_attr = 1'b0;
`ifdef XIL_ATTR_TEST
  attr_test = 1'b1;
`else
  attr_test = 1'b0;
`endif
  attr_err = 1'b0;
  #1;
  trig_attr = ~trig_attr;
end
`endif

`ifdef XIL_XECLIB
  assign DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

`else
always @(trig_attr) begin
#1;
  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

end
`endif

`ifndef XIL_TIMING
  initial begin
    if (DSP_MODE != "CINT18") begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
    end
  end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-101] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  assign ASYNC_RST = ASYNC_RST_IN ^ IS_ASYNC_RST_IN_INVERTED_REG;

  assign CLK = CLK_IN ^ IS_CLK_IN_INVERTED_REG;

  assign RSTAD = RSTAD_IN ^ IS_RSTAD_IN_INVERTED_REG;

  assign RSTD = RSTD_IN ^ IS_RSTD_IN_INVERTED_REG;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK_IN => CLK) = (0:0:0, 0:0:0);
    (negedge ASYNC_RST_IN => (ASYNC_RST +: 0)) = (100:100:100, 100:100:100);
    (negedge RSTAD_IN => (RSTAD +: 0)) = (100:100:100, 100:100:100);
    (negedge RSTAD_IN => (RSTD +: 0)) = (100:100:100, 100:100:100);
    (negedge RSTD_IN => (RSTD +: 0)) = (100:100:100, 100:100:100);
    (posedge ASYNC_RST_IN => (ASYNC_RST +: 0)) = (100:100:100, 100:100:100);
    (posedge RSTAD_IN => (RSTAD +: 0)) = (100:100:100, 100:100:100);
    (posedge RSTAD_IN => (RSTD +: 0)) = (100:100:100, 100:100:100);
    (posedge RSTD_IN => (RSTD +: 0)) = (100:100:100, 100:100:100);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
