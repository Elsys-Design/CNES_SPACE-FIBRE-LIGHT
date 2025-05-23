///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FPM_PIPEREG
// /___/   /\      Filename    : DSP_FPM_PIPEREG.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  05/30/17 - Initial
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_FPM_PIPEREG #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter A_FPTYPE = "B32",
  parameter B_D_FPTYPE = "B32",
  parameter integer FPMPIPEREG = 1,
  parameter [0:0] IS_RSTFPMPIPE_INVERTED = 1'b0,
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [13:0] FPM_EXPINT_DATA,
  output [47:0] U_DATA,
  output [47:0] V_DATA,

  input ASYNC_RST,
  input CEFPMPIPE,
  input CLK,
  input [13:0] FPM_EXPINT,
  input RSTFPMPIPE,
  input [47:0] U,
  input [47:0] V
);
  
// define constants
  localparam MODULE_NAME = "DSP_FPM_PIPEREG";

// Parameter encodings and registers
  localparam A_FPTYPE_B16 = 1;
  localparam A_FPTYPE_B32 = 0;
  localparam B_D_FPTYPE_B16 = 1;
  localparam B_D_FPTYPE_B32 = 0;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FPM_PIPEREG_dr.v"
`else
  reg [24:1] A_FPTYPE_REG = A_FPTYPE;
  reg [24:1] B_D_FPTYPE_REG = B_D_FPTYPE;
  reg [31:0] FPMPIPEREG_REG = FPMPIPEREG;
  reg [0:0] IS_RSTFPMPIPE_INVERTED_REG = IS_RSTFPMPIPE_INVERTED;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire A_FPTYPE_BIN;
  wire B_D_FPTYPE_BIN;
  wire FPMPIPEREG_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg A_FPTYPE_BIN;
  reg B_D_FPTYPE_BIN;
  reg FPMPIPEREG_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEFPMPIPE_in;
  wire CLK_in;
  wire RSTFPMPIPE_in;
  wire [13:0] FPM_EXPINT_in;
  wire [47:0] U_in;
  wire [47:0] V_in;

`ifdef XIL_TIMING
  wire CEFPMPIPE_delay;
  wire CLK_delay;
  wire [47:0] U_delay;
  wire [47:0] V_delay;
`endif
  
`ifdef XIL_TIMING
  assign CEFPMPIPE_in = (CEFPMPIPE !== 1'bz) && CEFPMPIPE_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign U_in = U_delay;
  assign V_in = V_delay;
`else
  assign CEFPMPIPE_in = (CEFPMPIPE !== 1'bz) && CEFPMPIPE; // rv 0
  assign CLK_in = CLK;
  assign U_in = U;
  assign V_in = V;
`endif

  assign ASYNC_RST_in = ASYNC_RST;
  assign FPM_EXPINT_in = FPM_EXPINT;
  assign RSTFPMPIPE_in = (RSTFPMPIPE !== 1'bz) && (RSTFPMPIPE ^ IS_RSTFPMPIPE_INVERTED_REG); // rv 0

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
  assign A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  assign B_D_FPTYPE_BIN =
      (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
      (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
       B_D_FPTYPE_B32;

  assign FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
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
  A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  B_D_FPTYPE_BIN =
    (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
    (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
    B_D_FPTYPE_B32;

  FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
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
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((A_FPTYPE_REG != "B32") &&
       (A_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-101] A_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, A_FPTYPE_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((B_D_FPTYPE_REG != "B32") &&
       (B_D_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-102] B_D_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, B_D_FPTYPE_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((FPMPIPEREG_REG != 1) &&
       (FPMPIPEREG_REG != 0))) begin
    $display("Error: [Unisim %s-104] FPMPIPEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPMPIPEREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-106] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-107] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam M_WIDTH   = 48;
  reg [M_WIDTH-1:0] U_DATA_reg;
  reg [M_WIDTH-1:0] V_DATA_reg;
  reg [13:0] FPM_EXPINT_DATA_reg;

  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  FPM_EXPINT_DATA_reg = 14'b0;
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

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPMPIPE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPMPIPEREG_BIN == 1'b0) || glblGSR) begin
         U_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
         V_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
         FPM_EXPINT_DATA_reg <= 14'b0;
      end else if (CEFPMPIPE_in)  begin
         U_DATA_reg <= U_in;
         V_DATA_reg <= V_in;
         FPM_EXPINT_DATA_reg <= FPM_EXPINT_in;
      end
   end

   assign U_DATA          = (FPMPIPEREG_BIN == 1'b1) ? U_DATA_reg    : U_in;
   assign V_DATA          = (FPMPIPEREG_BIN == 1'b1) ? V_DATA_reg    : V_in;
   assign FPM_EXPINT_DATA = (FPMPIPEREG_BIN == 1'b1) ? FPM_EXPINT_DATA_reg : FPM_EXPINT_in;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK *> FPM_EXPINT_DATA) = (100:100:100, 100:100:100);
    (CLK *> U_DATA) = (100:100:100, 100:100:100);
    (CLK *> V_DATA) = (100:100:100, 100:100:100);
    (FPM_EXPINT *> FPM_EXPINT_DATA) = (0:0:0, 0:0:0);
    (U *> U_DATA) = (0:0:0, 0:0:0);
    (V *> V_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge CEFPMPIPE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPMPIPE_delay);
    $setuphold (posedge CLK, negedge U, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_delay);
    $setuphold (posedge CLK, negedge V, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_delay);
    $setuphold (posedge CLK, posedge CEFPMPIPE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPMPIPE_delay);
    $setuphold (posedge CLK, posedge U, 0:0:0, 0:0:0, notifier, , , CLK_delay, U_delay);
    $setuphold (posedge CLK, posedge V, 0:0:0, 0:0:0, notifier, , , CLK_delay, V_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
