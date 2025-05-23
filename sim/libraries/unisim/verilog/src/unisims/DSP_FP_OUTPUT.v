///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_OUTPUT
// /___/   /\      Filename    : DSP_FP_OUTPUT.v
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

module DSP_FP_OUTPUT #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer FPA_PREG = 1,
  parameter integer FPM_PREG = 1,
  parameter [0:0] IS_RSTFPA_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPM_INVERTED = 1'b0,
  parameter PCOUTSEL = "FPA",
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [31:0] FPA_FDBK,
  output FPA_INVALID,
  output [31:0] FPA_OUT,
  output FPA_OVERFLOW,
  output FPA_UNDERFLOW,
  output [31:0] FPM_DATA,
  output FPM_INVALID,
  output [31:0] FPM_OUT,
  output FPM_OVERFLOW,
  output FPM_UNDERFLOW,
  output [31:0] PCOUT,

  input ASYNC_RST,
  input CEFPA,
  input CEFPM,
  input CLK,
  input [31:0] FPA_INT,
  input FPA_INVALID_INT,
  input FPA_OVERFLOW_INT,
  input FPA_UNDERFLOW_INT,
  input [31:0] FPM_INT,
  input FPM_INVALID_INT,
  input FPM_OVERFLOW_INT,
  input FPM_UNDERFLOW_INT,
  input RSTFPA,
  input RSTFPM
);
  
// define constants
  localparam MODULE_NAME = "DSP_FP_OUTPUT";

// Parameter encodings and registers
  localparam PCOUTSEL_FPA = 0;
  localparam PCOUTSEL_FPM = 1;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FP_OUTPUT_dr.v"
`else
  reg [31:0] FPA_PREG_REG = FPA_PREG;
  reg [31:0] FPM_PREG_REG = FPM_PREG;
  reg [0:0] IS_RSTFPA_INVERTED_REG = IS_RSTFPA_INVERTED;
  reg [0:0] IS_RSTFPM_INVERTED_REG = IS_RSTFPM_INVERTED;
  reg [24:1] PCOUTSEL_REG = PCOUTSEL;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire FPA_PREG_BIN;
  wire FPM_PREG_BIN;
  wire PCOUTSEL_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg FPA_PREG_BIN;
  reg FPM_PREG_BIN;
  reg PCOUTSEL_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEFPA_in;
  wire CEFPM_in;
  wire CLK_in;
  wire FPA_INVALID_INT_in;
  wire FPA_OVERFLOW_INT_in;
  wire FPA_UNDERFLOW_INT_in;
  wire FPM_INVALID_INT_in;
  wire FPM_OVERFLOW_INT_in;
  wire FPM_UNDERFLOW_INT_in;
  wire RSTFPA_in;
  wire RSTFPM_in;
  wire [31:0] FPA_INT_in;
  wire [31:0] FPM_INT_in;

`ifdef XIL_TIMING
  wire CEFPA_delay;
  wire CEFPM_delay;
  wire CLK_delay;
  wire FPA_INVALID_INT_delay;
  wire FPA_OVERFLOW_INT_delay;
  wire FPA_UNDERFLOW_INT_delay;
  wire FPM_INVALID_INT_delay;
  wire FPM_OVERFLOW_INT_delay;
  wire FPM_UNDERFLOW_INT_delay;
  wire RSTFPA_delay;
  wire RSTFPM_delay;
  wire [31:0] FPA_INT_delay;
  wire [31:0] FPM_INT_delay;
`endif
  
`ifdef XIL_TIMING
  assign CEFPA_in = (CEFPA !== 1'bz) && CEFPA_delay; // rv 0
  assign CEFPM_in = (CEFPM !== 1'bz) && CEFPM_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign FPA_INT_in = FPA_INT_delay;
  assign FPA_INVALID_INT_in = FPA_INVALID_INT_delay;
  assign FPA_OVERFLOW_INT_in = FPA_OVERFLOW_INT_delay;
  assign FPA_UNDERFLOW_INT_in = FPA_UNDERFLOW_INT_delay;
  assign FPM_INT_in = FPM_INT_delay;
  assign FPM_INVALID_INT_in = FPM_INVALID_INT_delay;
  assign FPM_OVERFLOW_INT_in = FPM_OVERFLOW_INT_delay;
  assign FPM_UNDERFLOW_INT_in = FPM_UNDERFLOW_INT_delay;
  assign RSTFPA_in = (RSTFPA !== 1'bz) && (RSTFPA_delay ^ IS_RSTFPA_INVERTED_REG); // rv 0
  assign RSTFPM_in = (RSTFPM !== 1'bz) && (RSTFPM_delay ^ IS_RSTFPM_INVERTED_REG); // rv 0
`else
  assign CEFPA_in = (CEFPA !== 1'bz) && CEFPA; // rv 0
  assign CEFPM_in = (CEFPM !== 1'bz) && CEFPM; // rv 0
  assign CLK_in = CLK;
  assign FPA_INT_in = FPA_INT;
  assign FPA_INVALID_INT_in = FPA_INVALID_INT;
  assign FPA_OVERFLOW_INT_in = FPA_OVERFLOW_INT;
  assign FPA_UNDERFLOW_INT_in = FPA_UNDERFLOW_INT;
  assign FPM_INT_in = FPM_INT;
  assign FPM_INVALID_INT_in = FPM_INVALID_INT;
  assign FPM_OVERFLOW_INT_in = FPM_OVERFLOW_INT;
  assign FPM_UNDERFLOW_INT_in = FPM_UNDERFLOW_INT;
  assign RSTFPA_in = (RSTFPA !== 1'bz) && (RSTFPA ^ IS_RSTFPA_INVERTED_REG); // rv 0
  assign RSTFPM_in = (RSTFPM !== 1'bz) && (RSTFPM ^ IS_RSTFPM_INVERTED_REG); // rv 0
`endif

  assign ASYNC_RST_in = ASYNC_RST;

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
  assign FPA_PREG_BIN = FPA_PREG_REG[0];

  assign FPM_PREG_BIN = FPM_PREG_REG[0];
  
  assign PCOUTSEL_BIN =
      (PCOUTSEL_REG == "FPA") ? PCOUTSEL_FPA :
      (PCOUTSEL_REG == "FPM") ? PCOUTSEL_FPM :
       PCOUTSEL_FPA;

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
  FPA_PREG_BIN = FPA_PREG_REG[0];

  FPM_PREG_BIN = FPM_PREG_REG[0];
  
  PCOUTSEL_BIN =
    (PCOUTSEL_REG == "FPA") ? PCOUTSEL_FPA :
    (PCOUTSEL_REG == "FPM") ? PCOUTSEL_FPM :
    PCOUTSEL_FPA;

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
      ((FPA_PREG_REG != 1) &&
       (FPA_PREG_REG != 0))) begin
    $display("Error: [Unisim %s-102] FPA_PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPA_PREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPM_PREG_REG != 1) &&
       (FPM_PREG_REG != 0))) begin
    $display("Error: [Unisim %s-103] FPM_PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPM_PREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((PCOUTSEL_REG != "FPA") &&
       (PCOUTSEL_REG != "FPM"))) begin
    $display("Error: [Unisim %s-106] PCOUTSEL attribute is set to %s.  Legal values for this attribute are FPA or FPM. Instance: %m", MODULE_NAME, PCOUTSEL_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-107] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-108] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam P_WIDTH   = 58;
  reg [P_WIDTH-1:0] FPA_OUT_reg;
  reg FPA_INVALID_reg;
  reg FPA_OVERFLOW_reg;
  reg FPA_UNDERFLOW_reg;
  reg [P_WIDTH-1:0] FPM_OUT_reg;
  reg FPM_INVALID_reg;
  reg FPM_OVERFLOW_reg;
  reg FPM_UNDERFLOW_reg;

  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  FPA_OUT_reg = {P_WIDTH{1'b0}};
  FPA_INVALID_reg = 1'b0;
  FPA_OVERFLOW_reg = 1'b0;
  FPA_UNDERFLOW_reg = 1'b0;
  FPM_OUT_reg = {P_WIDTH{1'b0}};
  FPM_INVALID_reg = 1'b0;
  FPM_OVERFLOW_reg = 1'b0;
  FPM_UNDERFLOW_reg = 1'b0;
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

//--####################################################################
//--#### PCOUT FPA FPM reg                                         ##### 
//--####################################################################
//*** register with 1 level of register
   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTFPA_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         (FPA_PREG_BIN == 1'b0) || glblGSR) begin
       FPA_OUT_reg <= {P_WIDTH{1'b0}};
       FPA_INVALID_reg <= 1'b0;
       FPA_OVERFLOW_reg <= 1'b0;
       FPA_UNDERFLOW_reg <= 1'b0;
     end else if (CEFPA_in) begin
       FPA_OUT_reg <= FPA_INT_in;
       FPA_INVALID_reg <= FPA_INVALID_INT_in;
       FPA_OVERFLOW_reg <= FPA_OVERFLOW_INT_in;
       FPA_UNDERFLOW_reg <= FPA_UNDERFLOW_INT_in;
     end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTFPM_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         (FPM_PREG_BIN == 1'b0) || glblGSR) begin
       FPM_OUT_reg <= {P_WIDTH{1'b0}};
       FPM_INVALID_reg <= 1'b0;
       FPM_OVERFLOW_reg <= 1'b0;
       FPM_UNDERFLOW_reg <= 1'b0;
     end else if (CEFPM_in) begin
       FPM_OUT_reg <= FPM_INT_in;
       FPM_INVALID_reg <= FPM_INVALID_INT_in;
       FPM_OVERFLOW_reg <= FPM_OVERFLOW_INT_in;
       FPM_UNDERFLOW_reg <= FPM_UNDERFLOW_INT_in;
     end
   end

   assign FPM_DATA = (FPM_PREG_BIN == 1'b0) ?  FPM_INT_in : FPM_OUT_reg;

   assign FPM_OUT = (FPM_PREG_BIN == 1'b0) ?  FPM_INT_in : FPM_OUT_reg;

   assign FPM_INVALID = (FPM_PREG_BIN == 1'b0) ? FPM_INVALID_INT_in : FPM_INVALID_reg;
   assign FPM_OVERFLOW = (FPM_PREG_BIN == 1'b0) ? FPM_OVERFLOW_INT_in : FPM_OVERFLOW_reg;
   assign FPM_UNDERFLOW = (FPM_PREG_BIN == 1'b0) ? FPM_UNDERFLOW_INT_in : FPM_UNDERFLOW_reg;

   assign FPA_FDBK = FPA_OUT_reg;

   assign FPA_OUT = (FPA_PREG_BIN == 1'b0) ?  FPA_INT_in : FPA_OUT_reg;

   assign FPA_INVALID = (FPA_PREG_BIN == 1'b0) ? FPA_INVALID_INT_in : FPA_INVALID_reg;
   assign FPA_OVERFLOW = (FPA_PREG_BIN == 1'b0) ? FPA_OVERFLOW_INT_in : FPA_OVERFLOW_reg;
   assign FPA_UNDERFLOW = (FPA_PREG_BIN == 1'b0) ? FPA_UNDERFLOW_INT_in : FPA_UNDERFLOW_reg;

   assign PCOUT = (PCOUTSEL_BIN == PCOUTSEL_FPA) ? FPA_OUT : FPM_OUT;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK *> FPA_FDBK) = (100:100:100, 100:100:100);
    (CLK *> FPA_OUT) = (100:100:100, 100:100:100);
    (CLK *> FPM_DATA) = (100:100:100, 100:100:100);
    (CLK *> FPM_OUT) = (100:100:100, 100:100:100);
    (CLK *> PCOUT) = (100:100:100, 100:100:100);
    (CLK => FPA_INVALID) = (100:100:100, 100:100:100);
    (CLK => FPA_OVERFLOW) = (100:100:100, 100:100:100);
    (CLK => FPA_UNDERFLOW) = (100:100:100, 100:100:100);
    (CLK => FPM_INVALID) = (100:100:100, 100:100:100);
    (CLK => FPM_OVERFLOW) = (100:100:100, 100:100:100);
    (CLK => FPM_UNDERFLOW) = (100:100:100, 100:100:100);
    (FPA_INT *> FPA_OUT) = (0:0:0, 0:0:0);
    (FPA_INT *> PCOUT) = (0:0:0, 0:0:0);
    (FPA_INVALID_INT => FPA_INVALID) = (0:0:0, 0:0:0);
    (FPA_OVERFLOW_INT => FPA_OVERFLOW) = (0:0:0, 0:0:0);
    (FPA_UNDERFLOW_INT => FPA_UNDERFLOW) = (0:0:0, 0:0:0);
    (FPM_INT *> FPM_DATA) = (0:0:0, 0:0:0);
    (FPM_INT *> FPM_OUT) = (0:0:0, 0:0:0);
    (FPM_INT *> PCOUT) = (0:0:0, 0:0:0);
    (FPM_INVALID_INT => FPM_INVALID) = (0:0:0, 0:0:0);
    (FPM_OVERFLOW_INT => FPM_OVERFLOW) = (0:0:0, 0:0:0);
    (FPM_UNDERFLOW_INT => FPM_UNDERFLOW) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge CEFPA, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPA_delay);
    $setuphold (posedge CLK, negedge CEFPM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPM_delay);
    $setuphold (posedge CLK, negedge FPA_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_INT_delay);
    $setuphold (posedge CLK, negedge FPA_INVALID_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_INVALID_INT_delay);
    $setuphold (posedge CLK, negedge FPA_OVERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_OVERFLOW_INT_delay);
    $setuphold (posedge CLK, negedge FPA_UNDERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_UNDERFLOW_INT_delay);
    $setuphold (posedge CLK, negedge FPM_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_INT_delay);
    $setuphold (posedge CLK, negedge FPM_INVALID_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_INVALID_INT_delay);
    $setuphold (posedge CLK, negedge FPM_OVERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_OVERFLOW_INT_delay);
    $setuphold (posedge CLK, negedge FPM_UNDERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_UNDERFLOW_INT_delay);
    $setuphold (posedge CLK, negedge RSTFPA, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPA_delay);
    $setuphold (posedge CLK, negedge RSTFPM, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPM_delay);
    $setuphold (posedge CLK, posedge CEFPA, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPA_delay);
    $setuphold (posedge CLK, posedge CEFPM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPM_delay);
    $setuphold (posedge CLK, posedge FPA_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_INT_delay);
    $setuphold (posedge CLK, posedge FPA_INVALID_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_INVALID_INT_delay);
    $setuphold (posedge CLK, posedge FPA_OVERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_OVERFLOW_INT_delay);
    $setuphold (posedge CLK, posedge FPA_UNDERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPA_UNDERFLOW_INT_delay);
    $setuphold (posedge CLK, posedge FPM_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_INT_delay);
    $setuphold (posedge CLK, posedge FPM_INVALID_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_INVALID_INT_delay);
    $setuphold (posedge CLK, posedge FPM_OVERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_OVERFLOW_INT_delay);
    $setuphold (posedge CLK, posedge FPM_UNDERFLOW_INT, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPM_UNDERFLOW_INT_delay);
    $setuphold (posedge CLK, posedge RSTFPA, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPA_delay);
    $setuphold (posedge CLK, posedge RSTFPM, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPM_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
