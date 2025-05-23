///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_INMUX
// /___/   /\      Filename    : DSP_FP_INMUX.v
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

module DSP_FP_INMUX #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer AREG = 1,
  parameter integer FPA_PREG = 1,
  parameter integer FPBREG = 1,
  parameter integer FPDREG = 1,
  parameter integer INMODEREG = 1,
  parameter [0:0] IS_FPINMODE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPINMODE_INVERTED = 1'b0,
  parameter LEGACY = "DSP58",
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [7:0] A_EXP_DATA,
  output [23:0] A_MAN_DATA,
  output A_SIGN_DATA,
  output [7:0] B_EXP_DATA,
  output [23:0] B_MAN_DATA,
  output B_SIGN_DATA,

  input [31:0] A2_DATA,
  input ASYNC_RST,
  input [31:0] B_DATA,
  input CEFPINMODE,
  input CLK,
  input [31:0] D_DATA,
  input FPINMODE,
  input RSTFPINMODE
);
  
// define constants
  localparam MODULE_NAME = "DSP_FP_INMUX";

// Parameter encodings and registers
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FP_INMUX_dr.v"
`else
  reg [31:0] AREG_REG = AREG;
  reg [31:0] FPA_PREG_REG = FPA_PREG;
  reg [31:0] FPBREG_REG = FPBREG;
  reg [31:0] FPDREG_REG = FPDREG;
  reg [31:0] INMODEREG_REG = INMODEREG;
  reg [0:0] IS_FPINMODE_INVERTED_REG = IS_FPINMODE_INVERTED;
  reg [0:0] IS_RSTFPINMODE_INVERTED_REG = IS_RSTFPINMODE_INVERTED;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire [1:0] AREG_BIN;
  wire FPA_PREG_BIN;
  wire FPBREG_BIN;
  wire FPDREG_BIN;
  wire INMODEREG_BIN;
  wire LEGACY_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg [1:0] AREG_BIN;
  reg FPA_PREG_BIN;
  reg FPBREG_BIN;
  reg FPDREG_BIN;
  reg INMODEREG_BIN;
  reg LEGACY_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEFPINMODE_in;
  wire CLK_in;
  wire FPINMODE_in;
  wire RSTFPINMODE_in;
  wire [31:0] A2_DATA_in;
  wire [31:0] B_DATA_in;
  wire [31:0] D_DATA_in;

`ifdef XIL_TIMING
  wire CEFPINMODE_delay;
  wire CLK_delay;
  wire FPINMODE_delay;
  wire RSTFPINMODE_delay;
`endif

`ifdef XIL_TIMING
  assign CEFPINMODE_in = CEFPINMODE_delay;
  assign CLK_in = CLK_delay;
  assign FPINMODE_in = (FPINMODE !== 1'bz) && (FPINMODE_delay ^ IS_FPINMODE_INVERTED_REG); // rv 0
  assign RSTFPINMODE_in = (RSTFPINMODE !== 1'bz) && (RSTFPINMODE_delay ^ IS_RSTFPINMODE_INVERTED_REG); // rv 0
`else
  assign CEFPINMODE_in = CEFPINMODE;
  assign CLK_in = CLK;
  assign FPINMODE_in = (FPINMODE !== 1'bz) && (FPINMODE ^ IS_FPINMODE_INVERTED_REG); // rv 0
  assign RSTFPINMODE_in = (RSTFPINMODE !== 1'bz) && (RSTFPINMODE ^ IS_RSTFPINMODE_INVERTED_REG); // rv 0
`endif

  assign A2_DATA_in = A2_DATA;
  assign ASYNC_RST_in = ASYNC_RST;
  assign B_DATA_in = B_DATA;
  assign D_DATA_in = D_DATA;

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
  assign AREG_BIN = AREG_REG[1:0];

  assign FPA_PREG_BIN = FPA_PREG_REG[0];

  assign FPBREG_BIN = FPBREG_REG[0];
  
  assign FPDREG_BIN = FPDREG_REG[0];
  
  assign INMODEREG_BIN = INMODEREG_REG[0];

  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

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
  AREG_BIN = AREG_REG[1:0];

  FPA_PREG_BIN = FPA_PREG_REG[0];

  FPBREG_BIN = FPBREG_REG[0];
  
  FPDREG_BIN = FPDREG_REG[0];
  
  INMODEREG_BIN = INMODEREG_REG[0];

  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

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
        ((AREG_REG != 1) &&
         (AREG_REG != 0) &&
         (AREG_REG != 2))) begin
      $display("Error: [Unisim %s-101] AREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, AREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((FPA_PREG_REG != 1) &&
       (FPA_PREG_REG != 0))) begin
    $display("Error: [Unisim %s-103] FPA_PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPA_PREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPBREG_REG != 1) &&
       (FPBREG_REG != 0))) begin
    $display("Error: [Unisim %s-104] FPBREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPBREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPDREG_REG != 1) &&
       (FPDREG_REG != 0))) begin
    $display("Error: [Unisim %s-105] FPDREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPDREG_REG);
    attr_err = 1'b1;
  end
  
    if ((attr_test == 1'b1) ||
        ((INMODEREG_REG != 1) &&
         (INMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-106] INMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, INMODEREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-109] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-110] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-111] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  wire FPINMODE_mux;
  reg FPINMODE_reg;
  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  FPINMODE_reg = 1'b0;
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
//**********  INMODE signal registering        ************
//*********************************************************
// new 

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPINMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (INMODEREG_BIN == 1'b0) || glblGSR) begin
         FPINMODE_reg <= 1'b0;
      end else if (CEFPINMODE_in) begin
         FPINMODE_reg <= FPINMODE_in;
      end
   end

   assign FPINMODE_mux = (INMODEREG_BIN == 1'b1) ? FPINMODE_reg : FPINMODE_in;

   assign  A_MAN_DATA[23] = 1'b1;
   assign  B_MAN_DATA[23] = 1'b1;
   assign  {A_SIGN_DATA, A_EXP_DATA, A_MAN_DATA[22:0]} = A2_DATA_in;
   assign  {B_SIGN_DATA, B_EXP_DATA, B_MAN_DATA[22:0]} = FPINMODE_mux ? B_DATA_in : D_DATA_in;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (A2_DATA *> A_EXP_DATA) = (0:0:0, 0:0:0);
    (A2_DATA *> A_MAN_DATA) = (0:0:0, 0:0:0);
    (A2_DATA *> A_SIGN_DATA) = (0:0:0, 0:0:0);
    (B_DATA *> B_EXP_DATA) = (0:0:0, 0:0:0);
    (B_DATA *> B_MAN_DATA) = (0:0:0, 0:0:0);
    (B_DATA *> B_SIGN_DATA) = (0:0:0, 0:0:0);
    (CLK *> B_EXP_DATA) = (100:100:100, 100:100:100);
    (CLK *> B_MAN_DATA) = (100:100:100, 100:100:100);
    (CLK => B_SIGN_DATA) = (100:100:100, 100:100:100);
    (D_DATA *> B_EXP_DATA) = (0:0:0, 0:0:0);
    (D_DATA *> B_MAN_DATA) = (0:0:0, 0:0:0);
    (D_DATA *> B_SIGN_DATA) = (0:0:0, 0:0:0);
    (FPINMODE *> B_EXP_DATA) = (0:0:0, 0:0:0);
    (FPINMODE *> B_MAN_DATA) = (0:0:0, 0:0:0);
    (FPINMODE => B_SIGN_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge CEFPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPINMODE_delay);
    $setuphold (posedge CLK, negedge FPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPINMODE_delay);
    $setuphold (posedge CLK, negedge RSTFPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPINMODE_delay);
    $setuphold (posedge CLK, posedge CEFPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPINMODE_delay);
    $setuphold (posedge CLK, posedge FPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPINMODE_delay);
    $setuphold (posedge CLK, posedge RSTFPINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPINMODE_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
