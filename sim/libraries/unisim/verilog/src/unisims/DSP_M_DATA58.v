///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_M_DATA58
// /___/   /\      Filename    : DSP_M_DATA58.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  10/01/16 - Migrate from DSP48E2
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_M_DATA58 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DSP_MODE = "INT24",
  parameter [0:0] IS_RSTM_INVERTED = 1'b0,
  parameter integer MREG = 1,
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [50:0] U_DATA,
  output [50:0] V_DATA,

  input ASYNC_RST,
  input CEM,
  input CLK,
  input RSTM,
  input [50:0] U,
  input [18:0] U0U2_INT8,
  input [16:0] U1_INT8,
  input [36:0] U_CPLX,
  input [50:0] V,
  input [18:0] V0V2_INT8,
  input [16:0] V1_INT8,
  input [36:0] V_CPLX
);
  
// define constants
  localparam MODULE_NAME = "DSP_M_DATA58";

// Parameter encodings and registers
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_M_DATA58_dr.v"
`else
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [0:0] IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
  reg [31:0] MREG_REG = MREG;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire [1:0] DSP_MODE_BIN;
  wire MREG_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg [1:0] DSP_MODE_BIN;
  reg MREG_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEM_in;
  wire CLK_in;
  wire RSTM_in;
  wire [16:0] U1_INT8_in;
  wire [16:0] V1_INT8_in;
  wire [18:0] U0U2_INT8_in;
  wire [18:0] V0V2_INT8_in;
  wire [36:0] U_CPLX_in;
  wire [36:0] V_CPLX_in;
  wire [50:0] U_in;
  wire [50:0] V_in;

`ifdef XIL_TIMING
  wire ASYNC_RST_delay;
  wire CEM_delay;
  wire CLK_delay;
  wire RSTM_delay;
  wire [16:0] U1_INT8_delay;
  wire [16:0] V1_INT8_delay;
  wire [18:0] U0U2_INT8_delay;
  wire [18:0] V0V2_INT8_delay;
  wire [36:0] U_CPLX_delay;
  wire [36:0] V_CPLX_delay;
  wire [50:0] U_delay;
  wire [50:0] V_delay;
`endif
  
`ifdef XIL_TIMING
  assign ASYNC_RST_in = ASYNC_RST_delay;
  assign CEM_in = (CEM !== 1'bz) && CEM_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign RSTM_in = (RSTM !== 1'bz) && (RSTM_delay ^ IS_RSTM_INVERTED_REG); // rv 0
  assign U0U2_INT8_in = U0U2_INT8_delay;
  assign U1_INT8_in = U1_INT8_delay;
  assign U_CPLX_in = U_CPLX_delay;
  assign U_in = U_delay;
  assign V0V2_INT8_in = V0V2_INT8_delay;
  assign V1_INT8_in = V1_INT8_delay;
  assign V_CPLX_in = V_CPLX_delay;
  assign V_in = V_delay;
`else
  assign ASYNC_RST_in = ASYNC_RST;
  assign CEM_in = (CEM !== 1'bz) && CEM; // rv 0
  assign CLK_in = CLK;
  assign RSTM_in = (RSTM !== 1'bz) && (RSTM ^ IS_RSTM_INVERTED_REG); // rv 0
  assign U0U2_INT8_in = U0U2_INT8;
  assign U1_INT8_in = U1_INT8;
  assign U_CPLX_in = U_CPLX;
  assign U_in = U;
  assign V0V2_INT8_in = V0V2_INT8;
  assign V1_INT8_in = V1_INT8;
  assign V_CPLX_in = V_CPLX;
  assign V_in = V;
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

  assign MREG_BIN = MREG_REG[0];

  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

  assign USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

`else
always @(trig_attr) begin
  #1;

  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  MREG_BIN = MREG_REG[0];

  RESET_MODE_BIN =
    (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
    (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
    RESET_MODE_SYNC;

  USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

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

    if ((attr_test == 1'b1) ||
        ((MREG_REG != 1) &&
         (MREG_REG != 0))) begin
      $display("Error: [Unisim %s-103] MREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-104] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-105] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam M_WIDTH   = 51;
  reg [M_WIDTH-2:0] ps_u_mask = {(M_WIDTH-1)/2{2'b01}};
  reg [M_WIDTH-2:0] ps_v_mask = {(M_WIDTH-1)/2{2'b10}};
  reg [M_WIDTH-1:0] U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  reg [M_WIDTH-1:0] V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};

  reg ASYNC_RST_async = 1'b0;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  ps_u_mask = {(M_WIDTH-1)/2{2'b01}};
  ps_v_mask = {(M_WIDTH-1)/2{2'b10}};
  U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

//*********************************************************
//*** Multiplier outputs U, V  with 1 level deep of register
//*********************************************************

   wire [50:0] U_DMD;
   wire [50:0] V_DMD;

   wire [50:0] dmd_sum;
   wire [50:0] dmd_mult;
   wire [50:0] dmd_mult_cplx;

   assign dmd_mult = (DSP_MODE_BIN == DSP_MODE_CINT18) ?
                     {U_in[50] ^ V_in[50] , U_in[49:0] | V_in[49:0]} : 51'b0;
   assign dmd_mult_cplx = (DSP_MODE_BIN == DSP_MODE_CINT18) ?
                     {U_CPLX_in[36] ^ V_CPLX_in[36], {14{~V_CPLX_in[36]}},  U_CPLX_in[35:0]} |
                     {                                15'b0              ,  V_CPLX_in[35:0]} :
                     51'b0;

   assign dmd_sum = (DSP_MODE_BIN == DSP_MODE_CINT18) ? dmd_mult + dmd_mult_cplx : 51'b0;

   assign U_DMD = (DSP_MODE_BIN == DSP_MODE_CINT18) ? {1'b1, dmd_sum[49:0] & ps_u_mask} :
                  (DSP_MODE_BIN == DSP_MODE_INT8) ? {6'b0, U1_INT8_in, U0U2_INT8_in} : U_in;
   assign V_DMD = (DSP_MODE_BIN == DSP_MODE_CINT18) ? {~dmd_sum[50], dmd_sum[49:0] & ps_v_mask} :
                  (DSP_MODE_BIN == DSP_MODE_INT8) ? {6'b0, V1_INT8_in, V0V2_INT8_in} : V_in;

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTM_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (MREG_BIN == 1'b0) || glblGSR) begin
         U_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
         V_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
      end else if (CEM_in)  begin
         U_DATA_reg <= U_DMD;
         V_DATA_reg <= V_DMD;
      end
   end

   assign U_DATA = (MREG_BIN == 1'b1) ? U_DATA_reg : U_DMD;
   assign V_DATA = (MREG_BIN == 1'b1) ? V_DATA_reg : V_DMD;


// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK *> U_DATA) = (100:100:100, 100:100:100);
    (CLK *> V_DATA) = (100:100:100, 100:100:100);
    (U *> U_DATA) = (0:0:0, 0:0:0);
    (U *> V_DATA) = (0:0:0, 0:0:0);
    (U0U2_INT8 *> U_DATA) = (0:0:0, 0:0:0);
    (U0U2_INT8 *> V_DATA) = (0:0:0, 0:0:0);
    (U1_INT8 *> U_DATA) = (0:0:0, 0:0:0);
    (U1_INT8 *> V_DATA) = (0:0:0, 0:0:0);
    (U_CPLX *> U_DATA) = (0:0:0, 0:0:0);
    (U_CPLX *> V_DATA) = (0:0:0, 0:0:0);
    (V *> U_DATA) = (0:0:0, 0:0:0);
    (V *> V_DATA) = (0:0:0, 0:0:0);
    (V0V2_INT8 *> U_DATA) = (0:0:0, 0:0:0);
    (V0V2_INT8 *> V_DATA) = (0:0:0, 0:0:0);
    (V1_INT8 *> U_DATA) = (0:0:0, 0:0:0);
    (V1_INT8 *> V_DATA) = (0:0:0, 0:0:0);
    (V_CPLX *> U_DATA) = (0:0:0, 0:0:0);
    (V_CPLX *> V_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $recrem (negedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $recrem (posedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $setuphold (posedge CLK, negedge CEM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEM_delay);
    $setuphold (posedge CLK, negedge RSTM, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTM_delay);
    $setuphold (posedge CLK, negedge U, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_delay);
    $setuphold (posedge CLK, negedge U0U2_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, U0U2_INT8_delay);
    $setuphold (posedge CLK, negedge U1_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, U1_INT8_delay);
    $setuphold (posedge CLK, negedge U_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_CPLX_delay);
    $setuphold (posedge CLK, negedge V, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_delay);
    $setuphold (posedge CLK, negedge V0V2_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, V0V2_INT8_delay);
    $setuphold (posedge CLK, negedge V1_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, V1_INT8_delay);
    $setuphold (posedge CLK, negedge V_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_CPLX_delay);
    $setuphold (posedge CLK, posedge CEM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEM_delay);
    $setuphold (posedge CLK, posedge RSTM, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTM_delay);
    $setuphold (posedge CLK, posedge U, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_delay);
    $setuphold (posedge CLK, posedge U0U2_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, U0U2_INT8_delay);
    $setuphold (posedge CLK, posedge U1_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, U1_INT8_delay);
    $setuphold (posedge CLK, posedge U_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_CPLX_delay);
    $setuphold (posedge CLK, posedge V, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_delay);
    $setuphold (posedge CLK, posedge V0V2_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, V0V2_INT8_delay);
    $setuphold (posedge CLK, posedge V1_INT8, 0:0:0, 0:0:0, notifier, , , CLK_delay, V1_INT8_delay);
    $setuphold (posedge CLK, posedge V_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_CPLX_delay);
    $width (negedge ASYNC_RST, 0:0:0, 0, notifier);
    $width (posedge ASYNC_RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
