///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DPLL
// /___/   /\      Filename    : DPLL.v
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

module DPLL #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
  parameter real CLKIN_FREQ_MAX = 1230.000,
  parameter real CLKIN_FREQ_MIN = 10.000,
  parameter real CLKTDC_FREQ_MAX = 200.000,
  parameter real CLKTDC_FREQ_MIN = 10.000,
  parameter real VCOCLK_FREQ_MAX = 4000.000,
  parameter real VCOCLK_FREQ_MIN = 2000.000,
`endif
  parameter integer CLKFBOUT_FRACT = 0,
  parameter integer CLKFBOUT_MULT = 42,
  parameter real CLKIN_PERIOD = 0.000,
  parameter integer CLKOUT0_DIVIDE = 2,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter [1:0] CLKOUT0_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT1_DIVIDE = 2,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter [1:0] CLKOUT1_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT2_DIVIDE = 2,
  parameter real CLKOUT2_PHASE = 0.000,
  parameter [1:0] CLKOUT2_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT3_DIVIDE = 2,
  parameter real CLKOUT3_PHASE = 0.000,
  parameter [1:0] CLKOUT3_PHASE_CTRL = 2'b00,
  parameter integer DESKEW_DELAY = 0,
  parameter DESKEW_DELAY_EN = "FALSE",
  parameter DESKEW_DELAY_PATH = "FALSE",
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFB_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN_INVERTED = 1'b0,
  parameter [0:0] IS_PSEN_INVERTED = 1'b0,
  parameter [0:0] IS_PSINCDEC_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter LOCK_WAIT = "FALSE",
  parameter PERF_MODE = "LIMITED",
  parameter real REF_JITTER = 0.010,
  parameter [0:0] SEL_LOCKED_IN = 1'b1,
  parameter [1:0] SEL_REG_DELAY = 2'b00,
  parameter [0:0] USE_REG_VALID = 1'b1,
  parameter ZHOLD = "FALSE"
)(
  output CLKOUT0,
  output CLKOUT1,
  output CLKOUT2,
  output CLKOUT3,
  output [15:0] DO,
  output DRDY,
  output LOCKED,
  output LOCKED_DESKEW,
  output LOCKED_FB,
  output PSDONE,

  input CLKFB_DESKEW,
  input CLKIN,
  input CLKIN_DESKEW,
  input [6:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input PSCLK,
  input PSEN,
  input PSINCDEC,
  input PWRDWN,
  input RST
);

`ifndef XIL_TIMING
  localparam real CLKIN_FREQ_MAX = 1230.000;
  localparam real CLKIN_FREQ_MIN = 10.000;
  localparam real CLKTDC_FREQ_MAX = 200.000;
  localparam real CLKTDC_FREQ_MIN = 10.000;
  localparam real VCOCLK_FREQ_MAX = 4000.000;
  localparam real VCOCLK_FREQ_MIN = 2000.000;
`endif

// define constants
  localparam MODULE_NAME = "DPLL";
  
// Parameter encodings and registers
  localparam DESKEW_DELAY_EN_FALSE = 0;
  localparam DESKEW_DELAY_EN_TRUE = 1;
  localparam DESKEW_DELAY_PATH_FALSE = 0;
  localparam DESKEW_DELAY_PATH_TRUE = 1;
  localparam LOCK_WAIT_FALSE = 0;
  localparam LOCK_WAIT_TRUE = 1;
  localparam PERF_MODE_FULL = 1;
  localparam PERF_MODE_LIMITED = 0;
  localparam ZHOLD_FALSE = 0;
  localparam ZHOLD_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DPLL_dr.v"
`else
  reg [31:0] CLKFBOUT_FRACT_REG = CLKFBOUT_FRACT;
  reg [31:0] CLKFBOUT_MULT_REG = CLKFBOUT_MULT;
  real CLKIN_FREQ_MAX_REG = CLKIN_FREQ_MAX;
  real CLKIN_FREQ_MIN_REG = CLKIN_FREQ_MIN;
  real CLKIN_PERIOD_REG = CLKIN_PERIOD;
  reg [31:0] CLKOUT0_DIVIDE_REG = CLKOUT0_DIVIDE;
  real CLKOUT0_PHASE_REG = CLKOUT0_PHASE;
  reg [1:0] CLKOUT0_PHASE_CTRL_REG = CLKOUT0_PHASE_CTRL;
  reg [31:0] CLKOUT1_DIVIDE_REG = CLKOUT1_DIVIDE;
  real CLKOUT1_PHASE_REG = CLKOUT1_PHASE;
  reg [1:0] CLKOUT1_PHASE_CTRL_REG = CLKOUT1_PHASE_CTRL;
  reg [31:0] CLKOUT2_DIVIDE_REG = CLKOUT2_DIVIDE;
  real CLKOUT2_PHASE_REG = CLKOUT2_PHASE;
  reg [1:0] CLKOUT2_PHASE_CTRL_REG = CLKOUT2_PHASE_CTRL;
  reg [31:0] CLKOUT3_DIVIDE_REG = CLKOUT3_DIVIDE;
  real CLKOUT3_PHASE_REG = CLKOUT3_PHASE;
  reg [1:0] CLKOUT3_PHASE_CTRL_REG = CLKOUT3_PHASE_CTRL;
  real CLKTDC_FREQ_MAX_REG = CLKTDC_FREQ_MAX;
  real CLKTDC_FREQ_MIN_REG = CLKTDC_FREQ_MIN;
  reg [31:0] DESKEW_DELAY_REG = DESKEW_DELAY;
  reg [40:1] DESKEW_DELAY_EN_REG = DESKEW_DELAY_EN;
  reg [40:1] DESKEW_DELAY_PATH_REG = DESKEW_DELAY_PATH;
  reg [31:0] DIVCLK_DIVIDE_REG = DIVCLK_DIVIDE;
  reg [0:0] IS_CLKFB_DESKEW_INVERTED_REG = IS_CLKFB_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN_DESKEW_INVERTED_REG = IS_CLKIN_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN_INVERTED_REG = IS_CLKIN_INVERTED;
  reg [0:0] IS_PSEN_INVERTED_REG = IS_PSEN_INVERTED;
  reg [0:0] IS_PSINCDEC_INVERTED_REG = IS_PSINCDEC_INVERTED;
  reg [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  reg [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  reg [40:1] LOCK_WAIT_REG = LOCK_WAIT;
  reg [56:1] PERF_MODE_REG = PERF_MODE;
  real REF_JITTER_REG = REF_JITTER;
  reg [0:0] SEL_LOCKED_IN_REG = SEL_LOCKED_IN;
  reg [1:0] SEL_REG_DELAY_REG = SEL_REG_DELAY;
  reg [0:0] USE_REG_VALID_REG = USE_REG_VALID;
  real VCOCLK_FREQ_MAX_REG = VCOCLK_FREQ_MAX;
  real VCOCLK_FREQ_MIN_REG = VCOCLK_FREQ_MIN;
  reg [40:1] ZHOLD_REG = ZHOLD;
`endif

`ifdef XIL_XECLIB
  wire [5:0] CLKFBOUT_FRACT_BIN;
  wire [8:0] CLKFBOUT_MULT_BIN;
  wire [63:0] CLKIN_FREQ_MAX_BIN;
  wire [63:0] CLKIN_FREQ_MIN_BIN;
  wire [63:0] CLKIN_PERIOD_BIN;
  wire [8:0] CLKOUT0_DIVIDE_BIN;
  wire [63:0] CLKOUT0_PHASE_BIN;
  wire [8:0] CLKOUT1_DIVIDE_BIN;
  wire [63:0] CLKOUT1_PHASE_BIN;
  wire [8:0] CLKOUT2_DIVIDE_BIN;
  wire [63:0] CLKOUT2_PHASE_BIN;
  wire [8:0] CLKOUT3_DIVIDE_BIN;
  wire [63:0] CLKOUT3_PHASE_BIN;
  wire [63:0] CLKTDC_FREQ_MAX_BIN;
  wire [63:0] CLKTDC_FREQ_MIN_BIN;
  wire [5:0] DESKEW_DELAY_BIN;
  wire DESKEW_DELAY_EN_BIN;
  wire DESKEW_DELAY_PATH_BIN;
  wire [6:0] DIVCLK_DIVIDE_BIN;
  wire LOCK_WAIT_BIN;
  wire PERF_MODE_BIN;
  wire [63:0] REF_JITTER_BIN;
  wire [63:0] VCOCLK_FREQ_MAX_BIN;
  wire [63:0] VCOCLK_FREQ_MIN_BIN;
  wire ZHOLD_BIN;
`else
  reg [5:0] CLKFBOUT_FRACT_BIN;
  reg [8:0] CLKFBOUT_MULT_BIN;
  reg [63:0] CLKIN_FREQ_MAX_BIN;
  reg [63:0] CLKIN_FREQ_MIN_BIN;
  reg [63:0] CLKIN_PERIOD_BIN;
  reg [8:0] CLKOUT0_DIVIDE_BIN;
  reg [63:0] CLKOUT0_PHASE_BIN;
  reg [8:0] CLKOUT1_DIVIDE_BIN;
  reg [63:0] CLKOUT1_PHASE_BIN;
  reg [8:0] CLKOUT2_DIVIDE_BIN;
  reg [63:0] CLKOUT2_PHASE_BIN;
  reg [8:0] CLKOUT3_DIVIDE_BIN;
  reg [63:0] CLKOUT3_PHASE_BIN;
  reg [63:0] CLKTDC_FREQ_MAX_BIN;
  reg [63:0] CLKTDC_FREQ_MIN_BIN;
  reg [5:0] DESKEW_DELAY_BIN;
  reg DESKEW_DELAY_EN_BIN;
  reg DESKEW_DELAY_PATH_BIN;
  reg [6:0] DIVCLK_DIVIDE_BIN;
  reg LOCK_WAIT_BIN;
  reg PERF_MODE_BIN;
  reg [63:0] REF_JITTER_BIN;
  reg [63:0] VCOCLK_FREQ_MAX_BIN;
  reg [63:0] VCOCLK_FREQ_MIN_BIN;
  reg ZHOLD_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire          CLKFB_DESKEW_in;
  wire          CLKIN_DESKEW_in;
  wire          CLKIN_in;
  wire          DCLK_in;
  wire          DEN_in;
  wire          DWE_in;
  wire          PSCLK_in;
  wire          PSEN_in;
  wire          PSINCDEC_in;
  wire          PWRDWN_in;
  wire          RST_in;
  wire [15:0]   DI_in;
  wire [6:0]    DADDR_in;

`ifdef XIL_TIMING
  wire DCLK_delay;
  wire DEN_delay;
  wire DWE_delay;
  wire PSCLK_delay;
  wire PSEN_delay;
  wire PSINCDEC_delay;
  wire [15:0] DI_delay;
  wire [6:0] DADDR_delay;
`endif

`ifdef XIL_TIMING
  assign DADDR_in = DADDR_delay;
  assign DCLK_in = DCLK_delay;
  assign DEN_in = DEN_delay;
  assign DI_in = DI_delay;
  assign DWE_in = DWE_delay;
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK_delay; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN_delay ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = (PSINCDEC !== 1'bz) && (PSINCDEC_delay ^ IS_PSINCDEC_INVERTED_REG); // rv 0
`else
  assign DADDR_in = DADDR;
  assign DCLK_in = DCLK;
  assign DEN_in = DEN;
  assign DI_in = DI;
  assign DWE_in = DWE;
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = (PSINCDEC !== 1'bz) && (PSINCDEC ^ IS_PSINCDEC_INVERTED_REG); // rv 0
`endif

  assign CLKFB_DESKEW_in = CLKFB_DESKEW ^ IS_CLKFB_DESKEW_INVERTED_REG;
  assign CLKIN_DESKEW_in = CLKIN_DESKEW ^ IS_CLKIN_DESKEW_INVERTED_REG;
  assign CLKIN_in = (CLKIN !== 1'bz) && (CLKIN ^ IS_CLKIN_INVERTED_REG); // rv 0
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN ^ IS_PWRDWN_INVERTED_REG); // rv 0
  assign RST_in = (RST !== 1'bz) && (RST ^ IS_RST_INVERTED_REG); // rv 0

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
  assign CLKFBOUT_FRACT_BIN = CLKFBOUT_FRACT_REG[5:0];
  
  assign CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[8:0];
  
  assign CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  assign CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  assign CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  assign CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[8:0];
  
  assign CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  assign CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[8:0];
  
  assign CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  assign CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[8:0];
  
  assign CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  assign CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[8:0];
  
  assign CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  assign CLKTDC_FREQ_MAX_BIN = CLKTDC_FREQ_MAX_REG * 1000;
  
  assign CLKTDC_FREQ_MIN_BIN = CLKTDC_FREQ_MIN_REG * 1000;
  
  assign DESKEW_DELAY_BIN = DESKEW_DELAY_REG[5:0];
  
  assign DESKEW_DELAY_EN_BIN =
      (DESKEW_DELAY_EN_REG == "FALSE") ? DESKEW_DELAY_EN_FALSE :
      (DESKEW_DELAY_EN_REG == "TRUE") ? DESKEW_DELAY_EN_TRUE :
       DESKEW_DELAY_EN_FALSE;
  
  assign DESKEW_DELAY_PATH_BIN =
      (DESKEW_DELAY_PATH_REG == "FALSE") ? DESKEW_DELAY_PATH_FALSE :
      (DESKEW_DELAY_PATH_REG == "TRUE") ? DESKEW_DELAY_PATH_TRUE :
       DESKEW_DELAY_PATH_FALSE;
  
  assign DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[6:0];
  
  assign LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
  
  assign PERF_MODE_BIN =
      (PERF_MODE_REG == "LIMITED") ? PERF_MODE_LIMITED :
      (PERF_MODE_REG == "FULL") ? PERF_MODE_FULL :
       PERF_MODE_LIMITED;
  
  assign REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  assign VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  assign VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
  assign ZHOLD_BIN =
      (ZHOLD_REG == "FALSE") ? ZHOLD_FALSE :
      (ZHOLD_REG == "TRUE") ? ZHOLD_TRUE :
       ZHOLD_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  CLKFBOUT_FRACT_BIN = CLKFBOUT_FRACT_REG[5:0];
  
  CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[8:0];
  
  CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[8:0];
  
  CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[8:0];
  
  CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[8:0];
  
  CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[8:0];
  
  CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  CLKTDC_FREQ_MAX_BIN = CLKTDC_FREQ_MAX_REG * 1000;
  
  CLKTDC_FREQ_MIN_BIN = CLKTDC_FREQ_MIN_REG * 1000;
  
  DESKEW_DELAY_BIN = DESKEW_DELAY_REG[5:0];
  
  DESKEW_DELAY_EN_BIN =
      (DESKEW_DELAY_EN_REG == "FALSE") ? DESKEW_DELAY_EN_FALSE :
      (DESKEW_DELAY_EN_REG == "TRUE") ? DESKEW_DELAY_EN_TRUE :
       DESKEW_DELAY_EN_FALSE;
  
  DESKEW_DELAY_PATH_BIN =
      (DESKEW_DELAY_PATH_REG == "FALSE") ? DESKEW_DELAY_PATH_FALSE :
      (DESKEW_DELAY_PATH_REG == "TRUE") ? DESKEW_DELAY_PATH_TRUE :
       DESKEW_DELAY_PATH_FALSE;
  
  DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[6:0];
  
  LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
 
  PERF_MODE_BIN =
      (PERF_MODE_REG == "LIMITED") ? PERF_MODE_LIMITED :
      (PERF_MODE_REG == "FULL") ? PERF_MODE_FULL :
       PERF_MODE_LIMITED;
  
  REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
  ZHOLD_BIN =
      (ZHOLD_REG == "FALSE") ? ZHOLD_FALSE :
      (ZHOLD_REG == "TRUE") ? ZHOLD_TRUE :
       ZHOLD_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_FRACT_REG < 0) || (CLKFBOUT_FRACT_REG > 63))) begin
      $display("Error: [Unisim %s-101] CLKFBOUT_FRACT attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, CLKFBOUT_FRACT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_MULT_REG < 10) || (CLKFBOUT_MULT_REG > 400))) begin
      $display("Error: [Unisim %s-102] CLKFBOUT_MULT attribute is set to %d.  Legal values for this attribute are 10 to 400. Instance: %m", MODULE_NAME, CLKFBOUT_MULT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MAX_REG < 750.000 || CLKIN_FREQ_MAX_REG > 1230.000)) begin
      $display("Error: [Unisim %s-103] CLKIN_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 750.000 to 1230.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MIN_REG < 10.000 || CLKIN_FREQ_MIN_REG > 10.000)) begin
      $display("Error: [Unisim %s-104] CLKIN_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_PERIOD_REG < 0.000 || CLKIN_PERIOD_REG > 100.000)) begin
      $display("Error: [Unisim %s-105] CLKIN_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT0_DIVIDE_REG < 2) || (CLKOUT0_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-106] CLKOUT0_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT0_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_PHASE_REG < -360.000 || CLKOUT0_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-107] CLKOUT0_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT0_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT1_DIVIDE_REG < 2) || (CLKOUT1_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-109] CLKOUT1_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT1_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_PHASE_REG < -360.000 || CLKOUT1_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-110] CLKOUT1_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT1_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT2_DIVIDE_REG < 2) || (CLKOUT2_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-112] CLKOUT2_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT2_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT2_PHASE_REG < -360.000 || CLKOUT2_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-113] CLKOUT2_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT2_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT3_DIVIDE_REG < 2) || (CLKOUT3_DIVIDE_REG > 511))) begin
      $display("Error: [Unisim %s-115] CLKOUT3_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 511. Instance: %m", MODULE_NAME, CLKOUT3_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT3_PHASE_REG < -360.000 || CLKOUT3_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-116] CLKOUT3_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT3_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKTDC_FREQ_MAX_REG < 100.000 || CLKTDC_FREQ_MAX_REG > 200.000)) begin
      $display("Error: [Unisim %s-118] CLKTDC_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 100.000 to 200.000. Instance: %m", MODULE_NAME, CLKTDC_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKTDC_FREQ_MIN_REG < 10.000 || CLKTDC_FREQ_MIN_REG > 10.000)) begin
      $display("Error: [Unisim %s-119] CLKTDC_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 10.000 to 10.000. Instance: %m", MODULE_NAME, CLKTDC_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_REG < 0) || (DESKEW_DELAY_REG > 63))) begin
      $display("Error: [Unisim %s-120] DESKEW_DELAY attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, DESKEW_DELAY_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_EN_REG != "FALSE") &&
         (DESKEW_DELAY_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-121] DESKEW_DELAY_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_PATH_REG != "FALSE") &&
         (DESKEW_DELAY_PATH_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-122] DESKEW_DELAY_PATH attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_PATH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIVCLK_DIVIDE_REG < 1) || (DIVCLK_DIVIDE_REG > 123))) begin
      $display("Error: [Unisim %s-123] DIVCLK_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 123. Instance: %m", MODULE_NAME, DIVCLK_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOCK_WAIT_REG != "FALSE") &&
         (LOCK_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-131] LOCK_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOCK_WAIT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PERF_MODE_REG != "LIMITED") &&
         (PERF_MODE_REG != "FULL"))) begin
      $display("Error: [Unisim %s-132] PERF_MODE attribute is set to %s.  Legal values for this attribute are LIMITED or FULL. Instance: %m", MODULE_NAME, PERF_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REF_JITTER_REG < 0.000 || REF_JITTER_REG > 0.200)) begin
      $display("Error: [Unisim %s-133] REF_JITTER attribute is set to %f.  Legal values for this attribute are 0.000 to 0.200. Instance: %m", MODULE_NAME, REF_JITTER_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MAX_REG < 4000.000 || VCOCLK_FREQ_MAX_REG > 4000.000)) begin
      $display("Error: [Unisim %s-137] VCOCLK_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 4000.000 to 4000.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MIN_REG < 2000.000 || VCOCLK_FREQ_MIN_REG > 2000.000)) begin
      $display("Error: [Unisim %s-138] VCOCLK_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 2000.000 to 2000.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ZHOLD_REG != "FALSE") &&
         (ZHOLD_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-139] ZHOLD attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ZHOLD_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

// UNISIM %s- warning/error message next number: 38
  reg CLKOUT0_out;
  reg CLKOUT1_out;
  reg CLKOUT2_out;
  reg CLKOUT3_out;
  reg DRDY_out;
  reg LOCKED_out;
  reg LOCKED_DESKEW_out;
  reg LOCKED_FB_out;
  wire PSDONE_out;
  reg [15:0] DO_out;
  reg        psdone_repeat_on;
  reg [4:0]  psdone_repeat_cnt;
  reg        psdone_real;

  assign CLKOUT0 =  CLKOUT0_out;
  assign CLKOUT1 =  CLKOUT1_out;
  assign CLKOUT2 =  CLKOUT2_out;
  assign CLKOUT3 =  CLKOUT3_out;
  assign DO = DO_out;
  assign DRDY = DRDY_out;
  assign LOCKED = LOCKED_out;
  assign LOCKED_DESKEW = LOCKED_DESKEW_out;
  assign LOCKED_FB     = LOCKED_FB_out;     
  assign PSDONE = PSDONE_out;

  localparam ps_res = 32; // phase interpolator resolution is 32. 
  localparam real pi_res = 32.0; 
  localparam AVGI = 16; //number of input clk periods used for averaging
  reg [160:1] clkout_name;
  integer  clkvco_frac_en;
  integer ps_in_init;
  integer clk0_delay=0, clk1_delay=0, clk2_delay=0, clk3_delay=0;
  integer clk0_delay_next=0, clk1_delay_next=0, clk2_delay_next=0, clk3_delay_next=0;
  reg[4:0] clk0_pi=0, clk1_pi=0, clk2_pi=0, clk3_pi=0;
  reg[1:0] clk0_intp_sel=0, clk1_intp_sel=0, clk2_intp_sel=0, clk3_intp_sel=0;
  reg clk0_fps_en=0, clk1_fps_en=0, clk2_fps_en=0, clk3_fps_en=0;
  reg clk0_pd1_en=0, clk1_pd1_en=0, clk2_pd1_en=0, clk3_pd1_en=0;
  reg [5:0]  deskew_prg_dly1_reg = 0;
  integer    deskew_prg_dly1 = 0;
  integer    clkin1_deskew_prg_dly =0;
  integer    clkfb1_deskew_prg_dly =0;
  reg deskew_dly_path1 = 0;
  reg deskew_dly_en1 = 0;
  reg fps_en=1'b0, fps_clk_en=1'b0;
  reg clkinstopped_out1;
  reg  psen_w = 0;
  reg clkinstopped_out_dly = 0;
  reg rst_clkinstopped = 0;
  integer clkin_lost_cnt;
  integer ps_cnt0;
  integer ps_cnt1;
  integer ps_cnt2;
  integer ps_cnt3;
  reg [6:0] daddr_lat;
  reg valid_daddr;
  reg drp_lock;
  integer drp_lock_lat = 4;
  integer drp_lock_lat_cnt;
  reg [15:0] dr_sram [127:0];
  reg rst_int = 1'b0;
  wire rst_in_o;
  reg clkout_en;
  reg clkout_en_pre;
  integer  clkin_lock_cnt;
  integer clkout_en_time;
  integer locked_en_time;
  integer lock_cnt_max;
  integer pll_lock_time;
  integer lock_period_time;
  reg clkvco = 1'b0;
  reg clkpll_dly = 1'b0;
  reg clkpll_stopped;
  reg clkin_osc, clkin_p;
  wire      clk_delay_upd = 1'b0;
  time clkvco_delay=0;
  time clkpll_delay=0;
  time clkin_edge;
  time delay_edge;
  real     period_clkin=500.0;
  integer  clkin_period_tmp;
  integer  clkin_period [AVGI-1:0];
  real     period_vco_rl = 2000.0;
  real     period_vco_rl_half = 1000.0;
  integer  period_fbout=100000;
  integer  period_avg=100000;
  integer period_ps0, period_ps_old0;
  integer period_ps1, period_ps_old1;
  integer period_ps2, period_ps_old2;
  integer period_ps3, period_ps_old3;
  reg  ps_lock;
  integer md_product;
  integer m_product;
  integer mf_product;
  integer pll_locked_delay;
  integer pll_locked_delay_cnt;
  integer clkin_lost_val;
  wire pll_unlock;
  reg lock_period;
  reg unlock_recover;
  reg pll_locked = 0;
  reg clkout_locked = 0;
  reg clkpll_jitter_unlock = 0;
  reg clk0in=1'b0,clk1in=1'b0,clk2in=1'b0,clk3in=1'b0;
  wire clkpll;
  wire clk0ps_en, clk1ps_en, clk2ps_en, clk3ps_en;
  reg [9:0] clk0_dly_cnt;
  reg [9:0] clk1_dly_cnt;
  reg [9:0] clk2_dly_cnt;
  reg [9:0] clk3_dly_cnt;
  real clk0_phase;
  real clk1_phase;
  real clk2_phase;
  real clk3_phase;
  reg clk0_e, clk1_e, clk2_e, clk3_e;
  reg clk0_nc, clk1_nc, clk2_nc, clk3_nc;
  reg [7:0] clk0_dt=0, clk1_dt=0, clk2_dt=0, clk3_dt=0;
  reg       clk0_en=1, clk1_en=1, clk2_en=1, clk3_en=1;
  reg [7:0] clk0_ht, clk1_ht, clk2_ht, clk3_ht;
  reg [7:0] clk0_lt, clk1_lt, clk2_lt, clk3_lt;
  real clkfbout_f_div=5.0;
  integer clkfbout_div=5;
  reg [9:0] clk0_cnt =0; 
  reg [9:0] clk1_cnt =0; 
  reg [9:0] clk2_cnt =0; 
  reg [9:0] clk3_cnt =0; 
  reg [8:0] clk0_div=0;
  reg [8:0] clk1_div=0;
  reg [8:0] clk2_div=0;
  reg [8:0] clk3_div=0;
  integer clk0_cnt_max, clk1_cnt_max, clk2_cnt_max, clk3_cnt_max;
  integer clk0_cnt_ht, clk1_cnt_ht, clk2_cnt_ht, clk3_cnt_ht;
  reg [8:0]  divclk_div=9'd1;
  wire CLKFBIN_int;
  reg drp_updt = 1'b0;

  real halfperiod_sum = 0.0;
  integer halfperiod = 0;
  reg clkvco_free = 1'b0;
  integer ik10=0, ik11=0;
  integer i=0;

  reg CLKFBSTOPPED_out;
  reg CLKINSTOPPED_out;

  reg  ps_wr_to_max0 = 1'b0;
  reg  ps_wr_to_max1 = 1'b0;
  reg  ps_wr_to_max2 = 1'b0;
  reg  ps_wr_to_max3 = 1'b0;

  reg [1:0]  clk0_mx     = 2'b01;
  reg [1:0]  clk1_mx     = 2'b01;
  reg [1:0]  clk2_mx     = 2'b01;
  reg [1:0]  clk3_mx     = 2'b01;
  real       clk0_duty = 0.5;
  real       clk1_duty = 0.5;
  real       clk2_duty = 0.5;
  real       clk3_duty = 0.5;
  reg [3:0]  kip = 4'b1010;
  reg [2:0]  kpp = 3'b110;
  reg [11:0] lock_th;
  reg [11:0] lock_th_type1;
  reg [11:0] lock_tmr;
  reg [11:0] lock_tmr_type1;
  reg        dig_deskew_en1; //digital deskew PD enabled
  reg [5:0]  clkfb_out_fract;
  reg [8:0]  clkfb_out_mult;

  reg      d1_delay_found=1'b0, d1_delay_found_tmp=1'b0;
  time     fb_d1_det_delay=0;//digital deskew 1 detected fb delay 
  time     pd1_clk0_applied_det_delay=0;
  time     pd1_clk1_applied_det_delay=0;
  time     pd1_clk2_applied_det_delay=0;
  time     pd1_clk3_applied_det_delay=0;
  time     max_pd1_applied_delay=0;
  time     max_pd1_en_clk_period=0;
  time     clkin1_d_edge;
  time     delay_edge_d1;
  real     period_clkin1_d=500.0;
  integer  clkin1_d_period_tmp;
  integer  clkin1_d_cnt;
  integer  clkin1_d_period [AVGI-1:0];
  integer  period_avg_clkin1_d=100000; 
  integer  period_avg_clkin1_d_d=100000;
  reg      period_avg_clkin1_d_stable=0;
  reg      period_avg_clkin1_d_stable_i=0;
  reg      period_avg_clkin1_d_stable_f=0;
  reg      clkin1_deskew_in_dly;
  reg      clkfb1_deskew_in_dly;
  reg      pd1_locked;

  reg      dig_deskew_en1_revc=0;

  reg      psdec_adj0;
  reg      psdec_adj1;
  reg      psdec_adj2;
  reg      psdec_adj3;
  reg      psdec_adj0_done;
  reg      psdec_adj1_done;
  reg      psdec_adj2_done;
  reg      psdec_adj3_done;

  wire     dwe_in_pe;
  reg      dwe_in_dly;

 localparam     ST_PSDK_IDLE   = 0,
                ST_PSDK_LOCK   = 1;
              
  reg           ps_deskew_state;
  reg           ps_deskew_state_next; 
  reg           ps_deskew1_detected  =1'b0;
  reg           ps_deskew1_delay_found_tmp = 1'b0;
  reg           ps_deskew1_delay_found = 1'b0;
  wire          ps_deskew_lock;
  reg           ps_deskew1_rst;
  reg           ps_deskew_stop_upd_avg;
  reg           ps_deskew1_det_rst   = 1'b0;
  reg [2:0]     ps_lock_d;
  wire          ps_avg_lock;


  integer jj1;
`ifndef XIL_XECLIB
`ifdef XIL_DR
  always @ (trig_attr) begin
`else
  initial begin
`endif

    if (CLKIN_PERIOD_REG != 0.0) 
      period_clkin =  CLKIN_PERIOD_REG * 1000;
    
    for( jj1=0;jj1<AVGI; jj1=jj1+1) begin
      clkin_period[jj1]    = period_clkin; 
      clkin1_d_period[jj1] = period_clkin1_d;
    end
       
    clkin_period_tmp = 0;
    period_avg = period_clkin;
      
    clkin1_d_period_tmp = 0;
    period_avg_clkin1_d = period_clkin1_d;


    //Make sure phase is positive btw 0 to 360.0
    mod_phase (CLKOUT0_PHASE_REG,  clk0_phase);
    mod_phase (CLKOUT1_PHASE_REG,  clk1_phase);
    mod_phase (CLKOUT2_PHASE_REG,  clk2_phase);
    mod_phase (CLKOUT3_PHASE_REG,  clk3_phase);
    
    clkfb_out_mult  = CLKFBOUT_MULT_REG;
    clkfb_out_fract = CLKFBOUT_FRACT_REG;

    clkfbout_f_div = (CLKFBOUT_MULT_REG * 1.0) + ((CLKFBOUT_FRACT_REG * 1.0) / (64.0));
    clkfbout_div   = CLKFBOUT_MULT_REG;

    if (CLKFBOUT_FRACT_REG > 0)
         clkvco_frac_en = 1'b1;
    else
         clkvco_frac_en = 1'b0;

    clk0_div   = CLKOUT0_DIVIDE_REG;
    clk1_div   = CLKOUT1_DIVIDE_REG;
    clk2_div   = CLKOUT2_DIVIDE_REG;
    clk3_div   = CLKOUT3_DIVIDE_REG;

    attr_to_mc(clk0_div, clk0_phase, clk0_duty, 
               clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt);
    ht_calc(clk0_div,clk0_duty,clk0_cnt_ht,clk0_cnt_max);

    attr_to_mc(clk1_div, clk1_phase, clk1_duty, 
               clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt);
    ht_calc(clk1_div,clk1_duty,clk1_cnt_ht,clk1_cnt_max);

    attr_to_mc(clk2_div, clk2_phase, clk2_duty, 
               clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt);
    ht_calc(clk2_div,clk2_duty,clk2_cnt_ht,clk2_cnt_max);

    attr_to_mc(clk3_div, clk3_phase, clk3_duty, 
               clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt);
    ht_calc(clk3_div,clk3_duty,clk3_cnt_ht,clk3_cnt_max);


    ps_in_init  = 0;
    ps_cnt0     = ps_in_init;
    ps_cnt1     = ps_in_init;
    ps_cnt2     = ps_in_init;
    ps_cnt3     = ps_in_init;
    
    clk0_intp_sel = CLKOUT0_PHASE_CTRL_REG;
    clk1_intp_sel = CLKOUT1_PHASE_CTRL_REG;
    clk2_intp_sel = CLKOUT2_PHASE_CTRL_REG;
    clk3_intp_sel = CLKOUT3_PHASE_CTRL_REG;
    clk0_fps_en = (clk0_intp_sel == 2'b10); // Dynamic phase shift enabled for CLKOUT0
    clk1_fps_en = (clk1_intp_sel == 2'b10);
    clk2_fps_en = (clk2_intp_sel == 2'b10);
    clk3_fps_en = (clk3_intp_sel == 2'b10);
    fps_en = clk0_fps_en || clk1_fps_en || clk2_fps_en || clk3_fps_en;
    pll_lock_time = 12;
    lock_period_time = 10;
    divclk_div = DIVCLK_DIVIDE_REG;
    m_product = clkfbout_f_div;
    md_product = clkfbout_f_div * DIVCLK_DIVIDE_REG;
    mf_product = clkfbout_f_div * 64;
    period_fbout = period_avg * DIVCLK_DIVIDE_REG;
    period_vco_rl = 1.0 * period_fbout / clkfbout_f_div;
    period_vco_rl_half = period_vco_rl / 2.0;
    
    if (CLKFBOUT_FRACT_BIN == 6'b0) begin
      clkout_en_time = 2 * md_product + pll_lock_time;
      locked_en_time = md_product +  clkout_en_time + 2;
    end else begin
      clkout_en_time = 64 + 2 + pll_lock_time;
      locked_en_time = 64 +  clkout_en_time;
    end
      lock_cnt_max = locked_en_time + 16;

    clk0_pd1_en     = (clk0_intp_sel == 2'b01) ; // Digital deskew Phase Detector 1 for CLKOUT0 is enabled.
    clk1_pd1_en     = (clk1_intp_sel == 2'b01) ;
    clk2_pd1_en     = (clk2_intp_sel == 2'b01) ;
    clk3_pd1_en     = (clk3_intp_sel == 2'b01) ;
    dig_deskew_en1  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  );

    //1: Add delay to CLKFB_DESKEW path 
    //0: Add delay to CLKIN_DESKEW path
    deskew_dly_path1 = (DESKEW_DELAY_PATH_BIN == DESKEW_DELAY_PATH_TRUE)? 1'b1 : 1'b0; 

    //digital deskew programmable delay path enabled or not
    deskew_dly_en1 = (DESKEW_DELAY_EN_BIN == DESKEW_DELAY_EN_TRUE)? 1'b1 : 1'b0; 

    //absolute programmable delay in ps
    deskew_prg_dly1_reg   = DESKEW_DELAY_BIN;
    deskew_prg_dly1       = (DESKEW_DELAY_BIN * 40) + 200 ;
    clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
    clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;

    clk0_delay = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay) ;
    clk1_delay = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay) ;
    clk2_delay = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay) ;
    clk3_delay = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay) ;

    GetDlfVal((period_avg/1000), divclk_div, kpp, kip);

    dr_sram[8'h30>>2] = 16'd0; // RESERVED
    dr_sram[8'h34>>2] = 16'd0; // RESERVED
    dr_sram[8'h38>>2] = {1'b0, clkfb_out_mult, clkfb_out_fract};
    dr_sram[8'h3c>>2] = {4'd0, clk0_en, clk0_mx[1:0], clk0_div[8:0]}; 
    dr_sram[8'h40>>2] = {8'd0, clk0_dt[7:0]}; 
    dr_sram[8'h44>>2] = {4'd0, clk1_en, clk1_mx[1:0], clk1_div[8:0]}; 
    dr_sram[8'h48>>2] = {8'd0, clk1_dt[7:0]}; 
    dr_sram[8'h4c>>2] = {4'd0, clk2_en, clk2_mx[1:0], clk2_div[8:0]}; 
    dr_sram[8'h50>>2] = {8'd0, clk2_dt[7:0]}; 
    dr_sram[8'h54>>2] = {4'd0, clk3_en, clk3_mx[1:0], clk3_div[8:0]}; 
    dr_sram[8'h58>>2] = {8'd0, clk3_dt[7:0]};
    dr_sram[8'h5c>>2] = 16'd0; // RESERVED
    dr_sram[8'h60>>2] = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
    dr_sram[8'h64>>2] = {8'd0, divclk_div[8:0]};
    dr_sram[8'h68>>2] = 16'd0; // RESERVED
    dr_sram[8'h6c>>2] = 16'd0; // RESERVED
    dr_sram[8'h70>>2] = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
    dr_sram[8'h74>>2] = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
    dr_sram[8'h78>>2] = 16'd0; // RESERVED
    dr_sram[8'h7c>>2] = 16'd0; // RESERVED
    dr_sram[8'h80>>2] = 16'd0; // RESERVED
    dr_sram[8'h84>>2] = 16'd0; // RESERVED
    dr_sram[8'h88>>2] = 16'd0; // RESERVED
    dr_sram[8'h8c>>2] = 16'd0; // RESERVED
    dr_sram[8'h90>>2] = {4'd0,kip,kpp,5'd0}; 
    dr_sram[8'h94>>2] = {4'd0,lock_th};
    dr_sram[8'h98>>2] = {4'd0,lock_th_type1};
    dr_sram[8'h9c>>2] = {4'd0,lock_tmr};
    dr_sram[8'ha0>>2] = {4'd0,lock_tmr_type1};
    dr_sram[8'ha4>>2] = 16'd0; // RESERVED
    dr_sram[8'ha8>>2] = 16'd0; // RESERVED
    dr_sram[8'hac>>2] = 16'd0; // RESERVED
    dr_sram[8'hb0>>2] = 16'd0; // RESERVED
    dr_sram[8'hb4>>2] = 16'd0; // RESERVED
    dr_sram[8'hc0>>2] = 16'd0; // RESERVED
    dr_sram[9'hc4>>2] = 16'd0; // RESERVED
    dr_sram[8'hb8>>2] = 16'd0; // RESERVED

  end
`endif

  initial begin
    clkin_osc = 0;
    clkin_p = 0;
    ps_lock = 0;
    psdone_real = 1'b0;
    CLKINSTOPPED_out = 1'b0;
    clkinstopped_out1 = 0;
    clkin_lost_val = 2;
    period_ps0 = 0;
    period_ps1 = 0;
    period_ps2 = 0;
    period_ps3 = 0;
    period_ps_old0 = 0;
    period_ps_old1 = 0;
    period_ps_old2 = 0;
    period_ps_old3 = 0;
    clkin_edge = 0;
    delay_edge = 0;
    clkout_en_pre = 0;
    pll_locked_delay = 0;
    pll_locked_delay_cnt = 0;
    unlock_recover = 0;
    clkin_lock_cnt = 0;
    lock_period = 0;
    DRDY_out = 1'b0;
    LOCKED_out = 1'b0;
    DO_out = 16'b0;
    clk0_dly_cnt = 10'b0;
    clk1_dly_cnt = 10'b0;
    clk2_dly_cnt = 10'b0;
    clk3_dly_cnt = 10'b0;
    CLKOUT0_out = 1'b0;
    CLKOUT1_out = 1'b0;
    CLKOUT2_out = 1'b0;
    CLKOUT3_out = 1'b0;
    d1_delay_found = 1'b0;
    d1_delay_found_tmp = 1'b0;
    clkin1_d_edge =0;
    clkin1_d_cnt = 0;
    delay_edge_d1 = 0;
    LOCKED_FB_out = 1'b0;
    LOCKED_DESKEW_out = 1'b0;
    pd1_clk0_applied_det_delay=0;
    pd1_clk1_applied_det_delay=0;
    pd1_clk2_applied_det_delay=0;
    pd1_clk3_applied_det_delay=0;
    period_avg_clkin1_d=100000;
    period_avg_clkin1_d_d=100000;
    period_avg_clkin1_d_stable=0;
    period_avg_clkin1_d_stable_i=0;
    period_avg_clkin1_d_stable_f=0;
    pd1_locked = 0;
    psdec_adj0 = 1'b0;
    psdec_adj1 = 1'b0;
    psdec_adj2 = 1'b0;
    psdec_adj3 = 1'b0;
    ps_deskew_state      = ST_PSDK_IDLE;
    ps_deskew_state_next = ST_PSDK_IDLE;
    ps_deskew1_detected  =1'b0;
    ps_deskew1_delay_found_tmp = 1'b0;
    ps_deskew1_delay_found = 1'b0;
    ps_deskew1_rst = 1'b0;    
    ps_deskew_stop_upd_avg = 1'b0;
    ps_deskew1_det_rst   =1'b0;
    ps_lock_d = 3'd0;
  end

  assign clkpll = CLKIN_in;

  always @(posedge clkpll or posedge RST_in or posedge PWRDWN_in)
    rst_int <= (RST_in === 1'b1) || (PWRDWN_in === 1'b1);

  assign rst_in_o = (rst_int || rst_clkinstopped);

  //
  // DRP access
  //
  assign dwe_in_ne = ~DWE_in & dwe_in_dly;

  always @(posedge DCLK_in or posedge glblGSR) begin
    if (glblGSR == 1) 
      dwe_in_dly <= 1'b0;
    else
      dwe_in_dly <= DWE_in;
  end
  
  always @(posedge DCLK_in or posedge glblGSR) begin
    if (~glblGSR) begin
      if (drp_lock) begin
        if(~DEN_in) begin
          $display("Error: [Unisim %s-33] DEN is deasserted at time %t. Need wait for DRDY signal to be asserted to comply with APB3 transfer. Instance %m ", MODULE_NAME, $time);
          #1 $finish;
        end
        else if(dwe_in_ne) begin
          $display("Error: [Unisim %s-34] DWE is deasserted at time %t. Need wait for DRDY signal to be asserted to comply with APB3 transfer. Instance %m ", MODULE_NAME, $time);
          #1 $finish;
        end
      end
    end
  end

  always @(posedge DCLK_in or posedge glblGSR)
    if (glblGSR == 1) begin
      drp_lock <= 0;
      drp_updt <= 1'b0;
    end else begin
      if (~RST_in && drp_updt) 
        drp_updt <= 1'b0;
      if (DEN_in == 1) begin
        valid_daddr = addr_is_valid(DADDR_in);
        
        if (~drp_lock) begin
          drp_lock <= 1;
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
          daddr_lat <= DADDR_in;
        end

        if (~valid_daddr) 
          $display("Warning: [Unisim %s-15] Address DADDR=%b is unsupported at time %t. Instance %m ", MODULE_NAME, DADDR_in, $time);
        if (DWE_in == 1) begin          // write process
          if (rst_int == 1 || PERF_MODE_BIN==PERF_MODE_FULL) begin
            //if (valid_daddr) dr_sram[DADDR_in] <= DI_in;
            if (valid_daddr || drp_updt) 
              drp_updt <= 1'b1;
            case ({DADDR_in,2'b00})
              8'h30: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h34: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h38: begin
                     {clkfb_out_mult, clkfb_out_fract} = DI_in[14:0];
                     end
              8'h3c: begin
                     clk0_div[8:0] = DI_in[8:0];
                     end
              8'h40: begin 
                     clk0_dt[7:0] = DI_in[7:0];
                     end
              8'h44: begin 
                     clk1_div[8:0] = DI_in[8:0];
                     end
              8'h48: begin 
                     clk1_dt[7:0] = DI_in[7:0];
                     end
              8'h4c: begin
                     clk2_div[8:0] = DI_in[8:0];
                     end
              8'h50: begin 
                     clk2_dt[7:0] = DI_in[7:0];
                     end
              8'h54: begin
                     clk3_div[8:0] = DI_in[8:0];
                     end
              8'h58: begin 
                     clk3_dt[7:0] = DI_in[7:0];
                     end
              8'h5c: begin
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h60: begin 
                     {dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]} = DI_in[8:0]; 
                     end
              8'h64: begin
                     divclk_div[8:0] = DI_in[8:0];
                     end
              8'h68: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h6c: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h70: begin 
                     {clk1_pi,clk1_intp_sel} = DI_in[14:8];
                     {clk0_pi,clk0_intp_sel} = DI_in[6:0];
                     end
              8'h74: begin 
                     {clk3_pi,clk3_intp_sel} = DI_in[14:8];
                     {clk2_pi,clk2_intp_sel} = DI_in[6:0];
                     end
              8'h78: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h7c: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h80: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h84: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h88: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h8c: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'h90: begin 
                     {kip,kpp} = DI_in[11:5];
                     end
              8'h94: begin 
                     lock_th = DI_in[11:0];
                     end
              8'h98: begin 
                     lock_th_type1 = DI_in[11:0];
                     end
              8'h9c: begin
                     lock_tmr = DI_in[11:0];
                     end
              8'ha0: begin 
                     lock_tmr_type1 = DI_in[11:0];
                     end
              8'ha4: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'ha8: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'hac: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'hb0: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'hb4: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'hc0: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hc4: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              8'hb8: begin 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              default: begin
                    $display("Warning: [Unisim %s-6] Address DADDR=%b is unsupported at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
            endcase
          end else begin
            $display("Error: [Unisim %s-18] RST is low at time %t. RST needs to be high when changing parameters through DRP. Instance %m", MODULE_NAME, $time);
          end
        end else begin
          case ({DADDR_in,2'b00})
            8'h30: DO_out = 16'd0; // RESERVED
            8'h34: DO_out = 16'd0; // RESERVED
            8'h38: DO_out = {1'b0,clkfb_out_mult,clkfb_out_fract};
            8'h3c: DO_out = {4'd0, clk0_en, clk0_mx[1:0], clk0_div[8:0]}; 
            8'h40: DO_out = {8'd0, clk0_dt[7:0]}; 
            8'h44: DO_out = {4'd0, clk1_en, clk1_mx[1:0], clk1_div[8:0]}; 
            8'h48: DO_out = {8'd0, clk1_dt[7:0]}; 
            8'h4c: DO_out = {4'd0, clk2_en, clk2_mx[1:0], clk2_div[8:0]}; 
            8'h50: DO_out = {8'd0, clk2_dt[7:0]}; 
            8'h54: DO_out = {4'd0, clk3_en, clk3_mx[1:0], clk3_div[8:0]}; 
            8'h58: DO_out = {8'd0, clk3_dt[7:0]};
            8'h5c: DO_out = 16'd0; // RESERVED
            8'h60: DO_out = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
            8'h64: DO_out = {8'd0, divclk_div[8:0]};
            8'h68: DO_out = 16'd0; // RESERVED
            8'h6c: DO_out = 16'd0; // RESERVED
            8'h70: DO_out = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
            8'h74: DO_out = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
            8'h78: DO_out = 16'd0; // RESERVED
            8'h7c: DO_out = 16'd0; // RESERVED
            8'h80: DO_out = 16'd0; // RESERVED
            8'h84: DO_out = 16'd0; // RESERVED
            8'h88: DO_out = 16'd0; // RESERVED
            8'h8c: DO_out = 16'd0; // RESERVED
            8'h90: DO_out = {4'd0,kip,kpp,5'd0}; 
            8'h94: DO_out = {4'd0,lock_th};
            8'h98: DO_out = {4'd0,lock_th_type1};
            8'h9c: DO_out = {4'd0,lock_tmr};
            8'ha0: DO_out = {4'd0,lock_tmr_type1};
            8'ha4: DO_out = 16'd0; // RESERVED
            8'ha8: DO_out = 16'd0; // RESERVED
            8'hac: DO_out = 16'd0; // RESERVED
            8'hb0: DO_out = 16'd0; // RESERVED
            8'hb4: DO_out = 16'd0; // RESERVED
            8'hc0: DO_out = 16'd0; // RESERVED
            9'hc4: DO_out = 16'd0; // RESERVED
            8'hb8: DO_out = 16'd0; // RESERVED
          endcase
        end
      end  //DEN

      if ( drp_lock == 1) begin
         if (drp_lock_lat_cnt < drp_lock_lat) begin
            drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
         end else begin
            DRDY_out <= 1;
            drp_lock_lat_cnt <= 0;
         end
      end
    if (DRDY == 1) begin
        DRDY_out <= 0;
      drp_lock <= 0;
    end
  end

  function addr_is_valid;
    input [6:0] daddr_in;
    begin
      addr_is_valid = 1'b1;
      for (i=0; i<=6; i=i+1)
        if (daddr_in[i] != 0 && daddr_in[i] != 1) addr_is_valid = 1'b0;
    end
  endfunction

  integer jj2;
  always @(posedge clkpll or posedge rst_int)
    if (rst_int) begin
      for( jj2=0;jj2<AVGI; jj2=jj2+1) 
        clkin_period[jj2]   <= period_clkin; 
      clkout_en_pre <= 0;
      clkin_lock_cnt <= 0;
      pll_locked <= 0;
      clkout_locked <= 0;
      unlock_recover <= 0;
      pll_locked_delay_cnt <= 0;
    end else begin
      clkin_edge <= $time;
      if (clkin_edge != 0 && CLKINSTOPPED_out == 0) begin 
        for( jj2=0;jj2<AVGI-1; jj2=jj2+1)
          clkin_period[jj2+1]   <= clkin_period[jj2]; 
         clkin_period[0] <= $time - clkin_edge;
      end

      if ( ~glblGSR && (clkin_lock_cnt < lock_cnt_max) && (~pll_unlock || unlock_recover) )
         clkin_lock_cnt <= clkin_lock_cnt + 1;
      else if (pll_unlock == 1 && clkout_locked ==1 ) begin
         clkin_lock_cnt <= lock_cnt_max - 6;
         unlock_recover <= 1;
      end
      if ( clkin_lock_cnt >= pll_lock_time && pll_unlock == 0)
         pll_locked <= 1;
      if ( clkin_lock_cnt == lock_period_time )
         lock_period <= 1;
      if (((clkin_lock_cnt >= clkout_en_time) && pll_locked == 1)) begin
         clkout_en_pre <= 1;
      end
      if (unlock_recover ==1 && clkin_lock_cnt  >= lock_cnt_max)
         unlock_recover <= 0;
      if ((clkin_lock_cnt >= locked_en_time) && (pll_locked_delay_cnt >= pll_locked_delay) && clkout_en == 1) begin
         clkout_locked <= 1;
      end else if (pll_locked_delay_cnt < pll_locked_delay) begin
         pll_locked_delay_cnt <= pll_locked_delay_cnt + 1;
         clkout_locked <= 0;
      end
    end

  always @(*)
    if (rst_int == 0) begin
      if (clkvco_frac_en == 1'b0) begin
        clkout_en_time = md_product + m_product + pll_lock_time;
        locked_en_time = md_product +  clkout_en_time + 2;
      end else begin
        clkout_en_time = 64 + 2 + pll_lock_time;
        locked_en_time = 64 +  clkout_en_time;
      end
      lock_cnt_max = locked_en_time + 16;
    end

  always @(rst_int or clkout_locked or pll_unlock or unlock_recover) begin
    if ((rst_int == 1) && (LOCKED !== 1'b0))
      LOCKED_FB_out <= #1000 0;
    else if ((clkout_locked && ~pll_unlock && ~unlock_recover) === 1'b1)
      LOCKED_FB_out <= 1'b1;
    else
      LOCKED_FB_out <= 1'b0;
  end
  
  always @(*) begin
    LOCKED_DESKEW_out <= dig_deskew_en1 && pd1_locked; 
    LOCKED_out        <= LOCKED_FB_out && (!dig_deskew_en1 || LOCKED_DESKEW_out);
  end

  integer jj3;
  always @(clkin_edge) begin
    if(~ps_deskew_stop_upd_avg) begin
      if (clkin_period[0] > clkin_period[1])
          clkin_period_tmp = clkin_period[0] - clkin_period[1];
      else
          clkin_period_tmp = clkin_period[1] - clkin_period[0];
        if ( (clkin_period[0] != period_avg) && 
          (clkin_period[0] < 1.5 * period_avg || clkin_period_tmp <= 300) ) begin 
          period_avg = 0;
          for( jj3=0;jj3<AVGI; jj3=jj3+1) 
            period_avg = period_avg + clkin_period[jj3];
          period_avg  = period_avg  / AVGI;
        end
      end
  end

  always @(clkfb_out_mult or clkfb_out_fract) 
  begin
    clkfbout_f_div = (clkfb_out_mult * 1.0) + ((clkfb_out_fract * 1.0) / (64.0));
    clkfbout_div = clkfb_out_mult;
      
    if (clkfb_out_fract > 0)
         clkvco_frac_en = 1'b1;
    else
         clkvco_frac_en = 1'b0;
  end


  always @(period_avg or divclk_div or clkfbout_f_div) begin
    if(~ps_deskew_stop_upd_avg) begin
      m_product = clkfbout_div;
      mf_product = clkfbout_f_div * 2**6;
      period_fbout = period_avg * divclk_div;
      period_vco_rl = 1.0 * period_fbout / clkfbout_f_div;
      period_vco_rl_half = period_vco_rl / 2.0;
      pll_locked_delay = (period_fbout * clkfbout_f_div) / period_avg;
      if(drp_updt)
        GetDlfVal((period_avg/1000), divclk_div, kpp, kip);
    end
  end

  always @ (negedge RST_in) begin
    if (drp_updt) begin
      if( clk0_div==0 || clk1_div==0 ||clk2_div==0 ||clk3_div ==0)
        $display("Error: [Unisim %s-28] Illegal values for CLKOUT0_DIVIDE=%0d,\
          CLKOUT1_DIVIDE=%0d, CLKOUT2_DIVIDE=%0d, CLKOUT3_DIVIDE=%0d after DRP write. They cannot be zero. @%0t",
          MODULE_NAME, clk0_div,clk1_div,clk2_div,clk3_div, $time);

      clkout_name = "CLKOUT0";
      mc_to_attr (clkout_name, clk0_pi, clk0_dt, clk0_div, clk0_phase);
      attr_to_mc(clk0_div, clk0_phase, clk0_duty, 
                 clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt);
      ht_calc(clk0_div,clk0_duty,clk0_cnt_ht,clk0_cnt_max);

      clkout_name = "CLKOUT1";
      mc_to_attr (clkout_name, clk1_pi, clk1_dt, clk1_div, clk1_phase);
      attr_to_mc(clk1_div, clk1_phase, clk1_duty, 
                 clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt);
      ht_calc(clk1_div,clk1_duty,clk1_cnt_ht,clk1_cnt_max);

      clkout_name = "CLKOUT2";
      mc_to_attr (clkout_name, clk2_pi, clk2_dt, clk2_div, clk2_phase);
      attr_to_mc(clk2_div, clk2_phase, clk2_duty, 
                 clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt);
      ht_calc(clk2_div,clk2_duty,clk2_cnt_ht,clk2_cnt_max);

      clkout_name = "CLKOUT3";
      mc_to_attr (clkout_name, clk3_pi, clk3_dt, clk3_div, clk3_phase);
      attr_to_mc(clk3_div, clk3_phase, clk3_duty, 
                 clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt);
      ht_calc(clk3_div,clk3_duty,clk3_cnt_ht,clk3_cnt_max);
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clk0_fps_en = (clk0_intp_sel == 2'b10); 
      clk1_fps_en = (clk1_intp_sel == 2'b10); 
      clk2_fps_en = (clk2_intp_sel == 2'b10); 
      clk3_fps_en = (clk3_intp_sel == 2'b10); 
      clk0_pd1_en = (clk0_intp_sel == 2'b01) ;
      clk1_pd1_en = (clk1_intp_sel == 2'b01) ;
      clk2_pd1_en = (clk2_intp_sel == 2'b01) ;
      clk3_pd1_en = (clk3_intp_sel == 2'b01) ;
      dig_deskew_en1_revc  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  );
      if(dig_deskew_en1 != dig_deskew_en1_revc) 
        $display("Error: [Unisim %s-30] Illegal DRP programming values at time %0t. Instance %m.\n\
          DRP Write doesn't match calculated value from CLK*INTP_SEL registers. Values of 2'b10 enable DESKEW_EN.\n\
          written: CLK*_INTP_SEL={%0b,%0b,%0b,%0b} DESKEW_EN=%0b. Calculated DESKEW_EN=%0b", 
          MODULE_NAME, $time,
          clk0_intp_sel,clk1_intp_sel,clk2_intp_sel,clk3_intp_sel,
          dig_deskew_en1,dig_deskew_en1_revc);

      deskew_prg_dly1       = (deskew_prg_dly1_reg * 40) + 200 ;
      clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
      clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;
    end
  end

  always @(/*period_vco_rl or*/ ps_cnt0)
  if (fps_en == 1) begin
      period_ps_old0 = period_ps0;
      if (ps_cnt0 == 0)
        period_ps0 = 0;
      else if (ps_cnt0 < 0)
        period_ps0 = (period_vco_rl*clk0_div) + ps_cnt0 * period_vco_rl / (ps_res*1.0); //cannot be a negative shift
    else
        period_ps0 = ps_cnt0 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt1)
    if (fps_en == 1) begin
      period_ps_old1 = period_ps1;
      if (ps_cnt1 == 0)
        period_ps1 = 0;
      else if (ps_cnt1 < 0)
        period_ps1 = (period_vco_rl*clk1_div) + ps_cnt1 * period_vco_rl / (ps_res*1.0); 
      else
        period_ps1 = ps_cnt1 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt2)
    if (fps_en == 1) begin
      period_ps_old2 = period_ps2;
      if (ps_cnt2 == 0)
        period_ps2 = 0;
      else if (ps_cnt2 < 0)
        period_ps2 = (period_vco_rl*clk2_div) + ps_cnt2 * period_vco_rl / (ps_res*1.0); 
      else
        period_ps2 = ps_cnt2 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt3)
    if (fps_en == 1) begin
      period_ps_old3 = period_ps3;
      if (ps_cnt3 == 0) 
        period_ps3 = 0;
      else if (ps_cnt3 < 0)
        period_ps3 = (period_vco_rl*clk3_div) + ps_cnt3 * period_vco_rl / (ps_res*1.0); 
      else
        period_ps3 = ps_cnt3 * period_vco_rl / (ps_res*1.0);
  end


  always @(posedge clkinstopped_out1 or posedge rst_int)
    if (rst_int)
      CLKINSTOPPED_out <= 0;
    else begin
      CLKINSTOPPED_out <= 1;
    end

  always @(posedge clkpll_dly) 
    if (pll_locked == 1 ) begin
      clkvco_free = 1'b1;
      halfperiod_sum = 0.0;
      halfperiod = 0;
      if (clkvco_frac_en == 1) begin
        if (mf_product > 1) begin
          for (ik10=1; ik10 < mf_product; ik10=ik10+1) begin
            if (rst_int) ik10 = mf_product;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b0;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b1;
          end
        end
      end else begin
        if (m_product > 1) begin
          for (ik11=1; ik11 < m_product; ik11=ik11+1) begin
            if (rst_int) ik11 = m_product;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b0;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b1;
          end
        end
      end
      halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
      halfperiod = $rtoi(halfperiod_sum);
      #halfperiod clkvco_free = 1'b0;

      //if((divclk_div*1.0)/(clkfbout_f_div*1.0) > 2.0)
      //  #(((divclk_div/clkfbout_f_div)/2)*period_avg -1);
      if(divclk_div>clkfbout_div)
        #(period_vco_rl_half -1.0);   
      
      clkout_en <= clkout_en_pre;
    end else begin 
      clkout_en <= 1'b0;
      clkvco_free = 1'b1;
      halfperiod_sum = 0.0;
      halfperiod = 0;
    end

   always @(*) clkvco <= #(clkvco_delay) clkvco_free;

   always @(*) clkpll_dly <= #(clkpll_delay) clkpll;
  always @(posedge PSCLK_in or posedge rst_int)
    if (rst_int) begin
      ps_cnt0   <= ps_in_init;
      ps_cnt1   <= ps_in_init;
      ps_cnt2   <= ps_in_init;
      ps_cnt3   <= ps_in_init;
      psen_w <= 0;
      ps_lock <= 0;

    end else if (fps_en == 1) begin
      if (PSEN_in) begin
        if (psen_w == 1)
          $display("Error: [Unisim %s-23] PSEN is active more than 1 PSCLK period at time %t. PSEN must be active for only one PSCLK period. Instance %m ", MODULE_NAME, $time);

        psen_w <= 1;
        if(~LOCKED_out)
          $display("Warning: [Unisim %s-37] Clock outputs are not locked yet. Please check for the LOCKED output signal before sending a PS request. This PSEN will be ignored. Instance %m", MODULE_NAME, $time );
        else if (ps_lock == 1)
          $display("Warning: [Unisim %s-24] Please wait for PSDONE signal at time %t before adjusting the Phase Shift. Instance %m ", MODULE_NAME, $time);
        else if (ps_deskew_lock)
          $display("Warning: [Unisim %s-36] Deskew is actively adjusting right now. PS request cannot be accepted before the output clocks are realinged. It is recommended to wait for 15 CLKIN_DESKEW cycles after PSDONE before sending a new PSEN request. This PSEN will be ignored. Instance %m", MODULE_NAME, $time );

        else if (PSINCDEC_in == 1) begin

          if (ps_cnt0   < $rtoi($itor((ps_res*clk0_div)-1)))    ps_cnt0 <= ps_cnt0 + 1;
          else                                                  ps_cnt0 <= 0;
          if (ps_cnt1   < $rtoi($itor((ps_res*clk1_div)-1)))    ps_cnt1 <= ps_cnt1 + 1; 
          else                                                  ps_cnt1 <= 0;       
          if (ps_cnt2   < $rtoi($itor((ps_res*clk2_div)-1)))    ps_cnt2 <= ps_cnt2 + 1;
          else                                                  ps_cnt2 <= 0;
          if (ps_cnt3   < $rtoi($itor((ps_res*clk3_div)-1)))    ps_cnt3 <= ps_cnt3 + 1;
          else                                                  ps_cnt3 <= 0;

          ps_lock <= 1;
        end
      else if (PSINCDEC_in == 0) begin
        if ( ps_cnt0 > $rtoi($itor(((-1)*(ps_res*clk0_div-1)))))        ps_cnt0   <= ps_cnt0 - 1; 
        else                                 ps_cnt0   <= 0;
        if ( ps_cnt1 > $rtoi($itor(((-1)*(ps_res*clk1_div-1)))))        ps_cnt1   <= ps_cnt1 - 1; 
        else                                 ps_cnt1   <= 0;           
        if ( ps_cnt2 > $rtoi($itor(((-1)*(ps_res*clk2_div-1)))))        ps_cnt2   <= ps_cnt2 - 1; 
        else                                 ps_cnt2   <= 0;
        if ( ps_cnt3 > $rtoi($itor(((-1)*(ps_res*clk3_div-1)))))        ps_cnt3   <= ps_cnt3 - 1; 
        else                                 ps_cnt3   <= 0;           

        ps_lock <= 1;
      end
    end //PSEN_in
     else
        psen_w <= 0;

     if ( PSDONE == 1'b1)
       ps_lock <= 0;
  end

  always @(posedge ps_lock)
    if (fps_en == 1) begin
      @(posedge clkpll_dly);//ps_wr_to_max will rise. Synching
      #1;
      //repeat(4) begin
      repeat(11)  @(posedge PSCLK_in);
      psdone_real = 1'b1;
      @(posedge PSCLK_in);
      psdone_real = 1'b0;
    end
  
  // RTL simulation shows that the 1st PSDONE pulse comes out after 
  // 12 psclk cycles when psen pulse shows; 
  // then if psen is flat low, psdone pulse repeats every 32 psclk cycles.
  always @(posedge PSCLK_in or posedge rst_int) begin
    if (rst_int) 
      psdone_repeat_on <= 1'b0;
    else if (PSDONE_out)
      psdone_repeat_on <= 1'b1;
    else if (PSEN_in)
      psdone_repeat_on <= 1'b0;
  end
  
  always @(posedge PSCLK_in or posedge rst_int) begin
    if (rst_int) 
      psdone_repeat_cnt <= 'd0;
    else if (psdone_repeat_on)
      psdone_repeat_cnt <= psdone_repeat_cnt +1;
    else 
      psdone_repeat_cnt <= 'd0;
  end

  assign PSDONE_out = psdone_real || (psdone_repeat_on && psdone_repeat_cnt==5'd31);
  



  always @(posedge ps_lock) begin
    if(dig_deskew_en1) begin
      ps_deskew1_rst = 1;
      repeat (2) @(negedge clkin1_deskew_in_dly);
      repeat (3) @(posedge PSCLK_in); 
      repeat (1) @(negedge clkin1_deskew_in_dly); //might change this w.r.t. spec
      ps_deskew1_rst = 0;    
      ps_deskew1_detected = 1;
      @(negedge ps_deskew_lock);
      ps_deskew1_detected = 0;
    end
  end

  always @(posedge ps_deskew1_detected) begin
    ps_deskew1_det_rst = 1;
    #2 ;
    ps_deskew1_det_rst = 0;
  end

  always @(*) clk0_delay_next = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay);
  always @(*) clk1_delay_next = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay);
  always @(*) clk2_delay_next = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay);
  always @(*) clk3_delay_next = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay);
  
  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps0 - period_ps_old0) > period_vco_rl_half)
        ps_wr_to_max0 <= 1'b1;
      else
        ps_wr_to_max0 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps1 - period_ps_old1) > period_vco_rl_half)
        ps_wr_to_max1 <= 1'b1;
      else
        ps_wr_to_max1 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps2 - period_ps_old2) > period_vco_rl_half)
        ps_wr_to_max2 <= 1'b1;
      else
        ps_wr_to_max2 <= 1'b0;
    end
  end

  always @ (posedge clkpll_dly) begin
    if (ps_lock) begin
      if ((period_ps3 - period_ps_old3) > period_vco_rl_half)
        ps_wr_to_max3 <= 1'b1;
      else
        ps_wr_to_max3 <= 1'b0;
    end
  end

  assign clk_delay_upd =  fps_en ? clkvco : clkpll_dly;

  always @ (clk_delay_upd) begin
    #2;
    clk0_delay <= clk0_delay_next;
    clk1_delay <= clk1_delay_next;
    clk2_delay <= clk2_delay_next;
    clk3_delay <= clk3_delay_next;
  end

  always @ (clkvco) begin
    if (clk0_dly_cnt > clk0_dt) begin
      if (clk0_delay == 0) begin clk0in = clkvco;
      end else if (clk0_fps_en && ps_wr_to_max0 && ~clkvco) begin
        clk0in <= #clk0_delay 1'b0;
      end else begin
        clk0in <= #clk0_delay clkvco;
      end
    end else clk0in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk1_dly_cnt > clk1_dt) begin
      if (clk1_delay == 0) begin clk1in = clkvco;
      end else if (clk1_fps_en && ps_wr_to_max1 && ~clkvco) begin
        clk1in <= #clk1_delay 1'b0;
      end else begin
        clk1in <= #clk1_delay clkvco;
      end
    end else clk1in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk2_dly_cnt > clk2_dt)
      if (clk2_delay == 0) clk2in = clkvco;
      else if (clk2_fps_en && ps_wr_to_max2 && ~clkvco) begin
        clk2in <= #clk2_delay 1'b0;
      end else begin
        clk2in <= #clk2_delay clkvco;
      end
    else clk2in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk3_dly_cnt > clk3_dt)
      if (clk3_delay == 0) clk3in = clkvco;
      else if (clk3_fps_en && ps_wr_to_max3 && ~clkvco) begin
        clk3in <= #clk3_delay 1'b0;
      end else begin
        clk3in <= #clk3_delay clkvco;
      end
    else clk3in = 1'b0;
  end


  assign clk0ps_en = clkout_en;
  assign clk1ps_en = clkout_en;
  assign clk2ps_en = clkout_en;
  assign clk3ps_en = clkout_en;

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk0_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk0_en == 1) begin
     if (clk0_dly_cnt <= clk0_dt)
       clk0_dly_cnt <= clk0_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk1_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk1_en == 1) begin
     if (clk1_dly_cnt <= clk1_dt)
       clk1_dly_cnt <= clk1_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk2_dly_cnt <= 'd0;
   else if (clkout_en == 1'b1 && clk2_en == 1'b1) begin
     if (clk2_dly_cnt <= clk2_dt)
       clk2_dly_cnt <= clk2_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk3_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk3_en == 1) begin
     if (clk3_dly_cnt <= clk3_dt)
       clk3_dly_cnt <= clk3_dly_cnt + 1;
   end

  always @(posedge ps_wr_to_max0 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk0_fps_en) 
      psdec_adj0      = 1'b0;
    else begin
      psdec_adj0      = 1'b1;
      if(clk0_cnt>=clk0_cnt_max-2) //if already at CLKOUT posedge, wait for another cycle, it is too late to shorten this one. Synching
        #1;
        //@(posedge CLKOUT0_out);
      @(posedge psdec_adj0_done);
      psdec_adj0      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max1 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk1_fps_en) 
      psdec_adj1      = 1'b0;
    else begin
      psdec_adj1      = 1'b1;
      if(clk1_cnt>=clk1_cnt_max-2) 
        #1;
        //@(posedge CLKOUT1_out);
      @(posedge psdec_adj1_done);
      psdec_adj1      = 1'b0;
    end
  end

  always @(posedge ps_wr_to_max2 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk2_fps_en) 
      psdec_adj2      = 1'b0;
    else begin
      psdec_adj2      = 1'b1;
      if(clk2_cnt>=clk2_cnt_max-2) 
         #1;
        //@(posedge CLKOUT2_out);
      @(posedge psdec_adj2_done);
      psdec_adj2      = 1'b0;
    end
  end
  
  always @(posedge ps_wr_to_max3 or posedge rst_in_o) begin
    if (rst_in_o || ~pll_locked || ~clk3_fps_en) 
      psdec_adj3      = 1'b0;
    else begin
      psdec_adj3      = 1'b1;
      if(clk3_cnt>=clk3_cnt_max-2) 
        #1;
        //@(posedge CLKOUT3_out);
      @(posedge psdec_adj3_done);
      psdec_adj3      = 1'b0;
    end
  end
  
  always @(posedge clk0in or negedge clk0in or posedge rst_in_o)
    if (rst_in_o || ~clk0ps_en) begin
      clk0_cnt <= 'd0;
      CLKOUT0_out = 0;
      psdec_adj0_done<=1'b0;
    end
    else if(clk0_div==1'b1) begin
      CLKOUT0_out = ~CLKOUT0_out;
      psdec_adj0_done<=1'b0;
    end
    else begin
      if (clk0_cnt < clk0_cnt_max) begin
        clk0_cnt <= clk0_cnt + 1;
        psdec_adj0_done<=1'b0;
      end
      else begin
        clk0_cnt <= 'd0; 
        if(psdec_adj0)
          psdec_adj0_done<=1'b1;
      end
      if (clk0_cnt < clk0_cnt_ht)
        CLKOUT0_out = 1;
      else
        CLKOUT0_out = 0;
    end

  always @(posedge clk1in or negedge clk1in or posedge rst_in_o)
    if (rst_in_o || ~clk1ps_en || ~pll_locked) begin
      clk1_cnt <= 'd0;
      CLKOUT1_out = 0;
      psdec_adj1_done<=1'b0;
    end
    else if(clk1_div==1'b1) begin
      CLKOUT1_out = ~CLKOUT1_out;
      psdec_adj1_done<=1'b0;
    end
    else begin
      if (clk1_cnt < clk1_cnt_max) begin
        clk1_cnt <= clk1_cnt + 1;
        psdec_adj1_done<=1'b0;
      end
      else begin
        clk1_cnt <= 'd0; 
        if(psdec_adj1)
          psdec_adj1_done<=1'b1;
      end
      if (clk1_cnt < clk1_cnt_ht)
        CLKOUT1_out = 1;
      else
        CLKOUT1_out = 0;
    end

  always @(posedge clk2in or negedge clk2in or posedge rst_in_o)
    if (rst_in_o || ~clk2ps_en || ~pll_locked) begin
      clk2_cnt <= 'd0;
      CLKOUT2_out = 0;
      psdec_adj2_done<=1'b0;
    end
    else if(clk2_div==1'b1) begin
      CLKOUT2_out = ~CLKOUT2_out;
      psdec_adj2_done<=1'b0;
    end
    else begin
      if (clk2_cnt < clk2_cnt_max) begin
        clk2_cnt <= clk2_cnt + 1;
        psdec_adj2_done<=1'b0;
      end
      else begin
        clk2_cnt <= 'd0; 
        if(psdec_adj2)
          psdec_adj2_done<=1'b1;
      end
      if (clk2_cnt < clk2_cnt_ht)
        CLKOUT2_out = 1;
      else
        CLKOUT2_out = 0;
    end

  always @(posedge clk3in or negedge clk3in or posedge rst_in_o)
    if (rst_in_o || ~clk3ps_en || ~pll_locked) begin
      clk3_cnt <= 'd0;
      CLKOUT3_out = 0;
      psdec_adj3_done<=1'b0;
    end
    else if(clk3_div==1'b1) begin
        CLKOUT3_out = ~CLKOUT3_out;
      psdec_adj3_done<=1'b0;
    end
    else begin
      if (clk3_cnt < clk3_cnt_max) begin
        clk3_cnt <= clk3_cnt + 1;
        psdec_adj3_done<=1'b0;
      end
      else begin
        clk3_cnt <= 'd0; 
        if(psdec_adj3)
          psdec_adj3_done<=1'b1;
      end
      if (clk3_cnt < clk3_cnt_ht)
        CLKOUT3_out = 1;
      else
        CLKOUT3_out = 0;
    end


  assign CLKFBIN_int = CLKIN_in;

  always @(*) clkpll_stopped <= #(period_avg/2) (clkinstopped_out1 || CLKINSTOPPED_out) && ~clkpll_stopped;
  always #(2*period_avg/3+250) clkin_osc = ~rst_int && ~clkin_osc;

  always @(posedge clkpll or negedge clkpll) begin
      clkin_p <= 1;
      clkin_p <= #100 0;
  end

  always @(posedge clkin_osc or posedge rst_int or posedge clkin_p)
      if ((rst_int == 1) || (LOCKED == 1'b0)) begin
        clkinstopped_out1 <= 0;
        clkin_lost_cnt <= 0;
      end
      else if (clkin_p == 1) begin
        if (clkinstopped_out1 == 1) begin
          @(posedge clkpll) begin
          clkinstopped_out1 <= 0;
          clkin_lost_cnt <= 0;
          end
        end
        else begin
           clkinstopped_out1 <= 0;
           clkin_lost_cnt <= 0;
        end
      end
      else if (lock_period) begin
        if (clkin_lost_cnt < clkin_lost_val) begin
           clkin_lost_cnt <= clkin_lost_cnt + 1;
           clkinstopped_out1 <= 0;
        end
        else
           clkinstopped_out1 <= 1;
      end

  always @(posedge clkinstopped_out1 or posedge rst_int)
  begin
    if (rst_int);
    else begin
        $display("Warning: [Unisim %s-12] Input CLKIN is stopped at time %t. Reset is required when input clock returns. Instance %m.", MODULE_NAME, $time);
    end
  end  

  assign pll_unlock = (CLKINSTOPPED_out === 1) || (clkpll_jitter_unlock === 1) || (unlock_recover === 1);
  //
  // DIGITAL DESKEW
  //
  
  // Averaging deskew clk references
  integer ii1,ii2;
  always @(posedge CLKIN_DESKEW_in or posedge rst_int) begin
    if (rst_int) begin
      for( ii1=0;ii1<5; ii1=ii1+1)
        clkin1_d_period[ii1] <= period_clkin1_d;
    end 
    else begin
      clkin1_d_edge <= $time;
      if (clkin1_d_edge != 0 && CLKINSTOPPED_out == 0) begin 
        clkin1_d_period[0] <= $time - clkin1_d_edge;
        for( ii1=0;ii1<4; ii1=ii1+1)
         clkin1_d_period[ii1+1] <= clkin1_d_period[ii1];
      end
    end
  end

  always @(clkin1_d_edge) begin
   //  if(clkin1_d_cnt>5) begin
    if (clkin1_d_period[0] > clkin1_d_period[1])
      clkin1_d_period_tmp = clkin1_d_period[0] - clkin1_d_period[1];
    else
      clkin1_d_period_tmp = clkin1_d_period[1] - clkin1_d_period[0];
    //    end
    if ( (clkin1_d_period[0] != period_avg_clkin1_d) && (clkin1_d_period[0] < 1.5 * period_avg_clkin1_d || clkin1_d_period_tmp <= 300) ) 
    //if(clkin1_d_period_tmp != 0)
      period_avg_clkin1_d = (clkin1_d_period[0] + clkin1_d_period[1] + clkin1_d_period[2]
                           + clkin1_d_period[3] + clkin1_d_period[4])/5;
  end


  always @(posedge PSCLK_in)
    ps_lock_d[2:0] <= {ps_lock_d[1:0],ps_lock}; 

  assign ps_avg_lock = ps_lock || ps_lock_d[2] ||ps_lock_d[1] || ps_lock_d[0]; 

  always @(clkin1_d_edge or posedge rst_int) begin
    if(rst_int) begin
      clkin1_d_cnt = 0;
      period_avg_clkin1_d_d <= 0;
      period_avg_clkin1_d_stable <=0;
    end
    else if (ps_avg_lock) begin
      //clkin1_d_cnt = 0; //keep
      period_avg_clkin1_d_d <= period_avg_clkin1_d; //keep updating
      period_avg_clkin1_d_stable <=1;
    end
    else begin
      clkin1_d_cnt = clkin1_d_cnt +1;
      period_avg_clkin1_d_d <= period_avg_clkin1_d;
      if((clkin1_d_cnt>5) && ((period_avg_clkin1_d_d-period_avg_clkin1_d)<=2 && (period_avg_clkin1_d_d-period_avg_clkin1_d)>=-2))
        period_avg_clkin1_d_stable <= 1;
      else 
        period_avg_clkin1_d_stable <=0;
    end
  end

  //
  // Add programmable deskew to inputs
  //
  
  always @(posedge CLKIN_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_i <= 0;
    else
      period_avg_clkin1_d_stable_i <= period_avg_clkin1_d_stable;
  end

  always @(posedge CLKFB_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_f <= 0;
    else
      period_avg_clkin1_d_stable_f <= period_avg_clkin1_d_stable;
  end

  always @(CLKIN_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_i) 
      clkin1_deskew_in_dly <=  #clkin1_deskew_prg_dly CLKIN_DESKEW_in;
    else 
      clkin1_deskew_in_dly <=  0;
  end

  always @(CLKFB_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_f) 
      clkfb1_deskew_in_dly <=  #clkfb1_deskew_prg_dly CLKFB_DESKEW_in;
    else
      clkfb1_deskew_in_dly <=  0;
  end

  always @( posedge clkin1_deskew_in_dly or posedge rst_int or posedge ps_deskew1_rst) begin
    if (rst_int ||  ps_deskew1_rst)
      delay_edge_d1  <= 0;
    else if (~d1_delay_found || ps_deskew1_detected ) //in ps, wait until average is calculated
      delay_edge_d1 <= $time;
  end

  always @(negedge clkfb1_deskew_in_dly or negedge d1_delay_found_tmp)
    d1_delay_found <= d1_delay_found_tmp;

  always @(negedge clkfb1_deskew_in_dly or negedge ps_deskew1_delay_found_tmp )
    ps_deskew1_delay_found <= ps_deskew1_delay_found_tmp;

  
  always @(posedge clkfb1_deskew_in_dly or posedge rst_int or posedge ps_deskew1_det_rst)
    if (dig_deskew_en1 == 0 || rst_int==1|| LOCKED_FB_out==0) begin
      fb_d1_det_delay <= 0;
      d1_delay_found_tmp <=  1'b0;
      ps_deskew1_delay_found_tmp    <= 1'b0;
    end else if (ps_deskew1_det_rst) begin
      d1_delay_found_tmp          <=  1'b0;
      ps_deskew1_delay_found_tmp  <= 1'b0;
    end else if (d1_delay_found_tmp == 1'b0  || (ps_deskew1_detected && ~ps_deskew1_delay_found_tmp)) begin 
      if ( delay_edge_d1 != 0) begin
        fb_d1_det_delay             <= fb_d1_det_delay + ($time - delay_edge_d1);
        d1_delay_found_tmp <=  1'b1;
        if(ps_deskew1_detected && ~ps_deskew1_delay_found_tmp ) 
          ps_deskew1_delay_found_tmp  <= 1'b1;
        else
          ps_deskew1_delay_found_tmp  <= 1'b0;
      end 
    end
    else if (ps_deskew1_delay_found_tmp && ~ps_deskew_lock)
      ps_deskew1_delay_found_tmp  <= 1'b0;

    always @(posedge d1_delay_found or posedge rst_in_o) begin
      if(rst_in_o==1) begin
        max_pd1_applied_delay = 0;
        max_pd1_en_clk_period = 0;
        pd1_clk0_applied_det_delay = 0;
        pd1_clk1_applied_det_delay = 0;
        pd1_clk2_applied_det_delay = 0;
        pd1_clk3_applied_det_delay = 0;
      end 
      else begin
        if(dig_deskew_en1 && d1_delay_found) begin
          max_pd1_applied_delay = 0;
          max_pd1_en_clk_period = 0;
          calc_dly_to_apply(fb_d1_det_delay,clk0_div,clk0_pd1_en,pd1_clk0_applied_det_delay);
          calc_dly_to_apply(fb_d1_det_delay,clk1_div,clk1_pd1_en,pd1_clk1_applied_det_delay);
          calc_dly_to_apply(fb_d1_det_delay,clk2_div,clk2_pd1_en,pd1_clk2_applied_det_delay);
          calc_dly_to_apply(fb_d1_det_delay,clk3_div,clk3_pd1_en,pd1_clk3_applied_det_delay);
        end
      end
    end

    always @(posedge d1_delay_found or posedge rst_int) begin
      if(rst_int)
        pd1_locked = 0;
      else begin
        #1;
        #max_pd1_applied_delay;
        repeat(4) @(posedge clkfb1_deskew_in_dly);
        pd1_locked = 1;
      end
    end

   always @(posedge PSCLK_in or posedge rst_in_o) 
      if(rst_in_o)
        ps_deskew_state <= ST_PSDK_IDLE;
      else 
        ps_deskew_state <= ps_deskew_state_next;

    always @(*) begin
      case (ps_deskew_state)
        ST_PSDK_IDLE:
          if(PSEN_in && dig_deskew_en1 )
            ps_deskew_state_next <= ST_PSDK_LOCK;
        ST_PSDK_LOCK:
          if (ps_deskew1_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
      endcase
    end

    assign ps_deskew_lock = (ps_deskew_state==ST_PSDK_IDLE)? 0 : 1;

    always @(posedge ps_deskew_lock or posedge pll_unlock or posedge rst_in_o) begin
      if(rst_in_o)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (pll_unlock)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (ps_deskew_lock)
        ps_deskew_stop_upd_avg <= 1'b1;       
    end

// -----------------------------------------------------------
// ----     TASKS --------------------------------------------
// -----------------------------------------------------------

task mc_to_attr;
    input reg [160:1] clkout_name;
    input  reg [4:0]  pi;
    input  reg [7:0]  dt;
    input  integer    div;

    output real       phase;

begin
  
  phase = 360.0 * ($itor(dt ) + $itor(pi)/pi_res) / $itor(div); 

end
endtask //mc_to_attr


task attr_to_mc;
    input integer           div;
    input real              phase;
    input real              duty;

    output reg [4:0] pi; // Interpolator control
    output reg       edg;  // edge.
    output reg [7:0] dt; //output counter delay setting
    output reg [7:0] ht; //high time
    output reg [7:0] lt; //low time

    real dt_rl;
    real pi_rl;
    reg [9:0] ht_int; //high time internal
    integer  dt_check;
    integer  pi_check;

begin

  dt_rl = 1.0*div*(phase/360.0); //Put phase in terms of decimal number of VCO clock cycles.
  get_int_frac_parts(dt_rl, 8, dt, pi );
  pi = pi*4;
  
  get_int_frac_parts(dt_rl, 8, dt_check, pi_check );
  //pi_check=pi_check*4;
  
  if(dt_check>255)
    $display("Error: [Unisim %s-29] Illegal value for %s_phase=%0d.\
      The maximum phase for %sDIV=%0d has been exceeded; causing DT exceed maximum value of 255.",
      MODULE_NAME, clkout_name, phase, clkout_name, div);

  get_int_frac_parts((duty*div),2,ht_int,edg );
  ht = ht_int;

  // The following two conditional stmts are for when the nearest 0.5 value is not allowed because of h/w limitations
  // HT cannot be 0
  if (ht == 0)
  begin
    ht       = 1;
    edg      = 0;
  end

  // HT and edge cannot be equal to DIVIDE because then LT would need to be 0, fix this 
  if (ht + edg == div) 
  begin
    ht       = div-1;
    edg      = 0; 
  end

   if(div==1) 
   begin
     ht  = 0;
     edg = 1;
     lt  = 0;
   end 

   lt = div - ht - edg;

end
endtask 
  
task ht_calc; 
  input  integer   div;
  input real       duty;
  output integer   cnt_ht;
  output integer   cnt_max;

begin

  cnt_ht = 2*div*duty;
  cnt_max = 2*div - 1;
  
end
endtask //ht_calc

task get_int_frac_parts;
  input real fDec;
  input integer nPrec;
  output integer nInt;
  output integer nFrac;

  real       dDecPrec;
  integer    nDecPrecInt;
begin
 
   // this task takes a decimal number and splits it into its integer part and
   //  fractional part after rounding it to the nearest 1/precision
   // the fractional part is represented as an integer which when divided by
   //  the precision gives the decimal version of the fractional part
   // ie. int_part and frac_part calculated such that
   //  (int_part + frac_part / precision) is closest possible to input decimal

  dDecPrec = fDec * nPrec;//0.5*3 *2=3
  nDecPrecInt = $rtoi(dDecPrec); //3
  if ((dDecPrec - nDecPrecInt) >= 0.5) begin //3-3=0
    nDecPrecInt = nDecPrecInt + 1; //3
  end

  nInt = nDecPrecInt / nPrec; // 3/2=1
  nFrac = nDecPrecInt - (nInt * nPrec);//3-1*2=1
end
endtask


task mod_phase;
  
  input real phase_reg;
  output real clk_phase;

begin

  // Make sure phase is positive.
  if (phase_reg > 360.0)
    clk_phase = phase_reg - 360.0;
  else if (phase_reg < 0.0)
    clk_phase = phase_reg + 360.0;
  else 
    clk_phase = phase_reg;

end
endtask //mod_phase


task GetDlfVal ;
  input real clkin_pval; 
  input integer divide; 
  output reg[2:0] kpp_val; 
  output reg[3:0] kip_val;

  real ref_period_in_ns;
begin
  
  ref_period_in_ns = clkin_pval *1.0* divide;
  if(ref_period_in_ns>=5 && ref_period_in_ns<6.666) begin   //200MHz~150MHz
    kpp_val = 3'd7; kip_val = 4'd11;
  end
  else if(ref_period_in_ns>=6.666 && ref_period_in_ns<10) begin  //150MHz~100MHz
    kpp_val = 3'd6; kip_val = 4'd9;
  end
  else if(ref_period_in_ns>=10 && ref_period_in_ns<20) begin  //100MHz~50MHz
    kpp_val = 3'd6; kip_val = 4'd9;
  end
  else if(ref_period_in_ns>=20 && ref_period_in_ns<33.333) begin  //50MHz~30MHz
    kpp_val = 3'd5; kip_val = 4'd7;
  end
  else if(ref_period_in_ns>=33.333 && ref_period_in_ns<50) begin  //30MHz~20MHz
    kpp_val = 3'd4; kip_val = 4'd6;
  end
  else if(ref_period_in_ns>=50 && ref_period_in_ns<66.666) begin  //20MHz~15MHz
    kpp_val = 3'd4; kip_val = 4'd6;
  end
  else if(ref_period_in_ns>=66.666 && ref_period_in_ns<=100) begin  //15MHz~10MHz
    kpp_val = 3'd3; kip_val = 4'd6;
  end
  else begin
    kpp_val = 3'd6; kip_val = 4'd10;
  end
end
endtask

task calc_dly_to_apply;
  input time        pd_delay;
  input reg [9:0]   clk_div;
  input reg         pd1_en;
  output time       pd1_clk_app_delay;

  real              clk_period;
  reg signed [63:0] pd_dly_mod_clkp; // (pd_delay%clk_period)

begin
  clk_period = period_vco_rl*clk_div;
  if(clk_period >= pd_delay)
    pd1_clk_app_delay = clk_period - pd_delay;
  else begin
    pd_dly_mod_clkp   = (pd_delay -$rtoi(($itor($rtoi(pd_delay*1.0/clk_period))*clk_period))); //(pd_delay%clk_period)
    //This part is to correct rounding errors:
    if(pd_dly_mod_clkp > clk_period)
      pd_dly_mod_clkp = pd_dly_mod_clkp - clk_period;
    else if (pd_dly_mod_clkp < 0)
      pd_dly_mod_clkp = pd_dly_mod_clkp + clk_period;
  
    pd1_clk_app_delay = clk_period - pd_dly_mod_clkp; //clk_period - (pd_delay%clk_period)
  end
  
  // also calculate the maximum
  max_pd1_applied_delay = (max_pd1_applied_delay>pd1_clk_app_delay)? max_pd1_applied_delay : pd1_clk_app_delay;
  max_pd1_en_clk_period = pd1_en? ((max_pd1_en_clk_period>clk_period)? max_pd1_en_clk_period: clk_period):max_pd1_en_clk_period;
end
endtask

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLKIN => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT3) = (0:0:0, 0:0:0);
    (DCLK => DO[0]) = (100:100:100, 100:100:100);
    (DCLK => DO[10]) = (100:100:100, 100:100:100);
    (DCLK => DO[11]) = (100:100:100, 100:100:100);
    (DCLK => DO[12]) = (100:100:100, 100:100:100);
    (DCLK => DO[13]) = (100:100:100, 100:100:100);
    (DCLK => DO[14]) = (100:100:100, 100:100:100);
    (DCLK => DO[15]) = (100:100:100, 100:100:100);
    (DCLK => DO[1]) = (100:100:100, 100:100:100);
    (DCLK => DO[2]) = (100:100:100, 100:100:100);
    (DCLK => DO[3]) = (100:100:100, 100:100:100);
    (DCLK => DO[4]) = (100:100:100, 100:100:100);
    (DCLK => DO[5]) = (100:100:100, 100:100:100);
    (DCLK => DO[6]) = (100:100:100, 100:100:100);
    (DCLK => DO[7]) = (100:100:100, 100:100:100);
    (DCLK => DO[8]) = (100:100:100, 100:100:100);
    (DCLK => DO[9]) = (100:100:100, 100:100:100);
    (DCLK => DRDY) = (100:100:100, 100:100:100);
    (PSCLK => PSDONE) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLKFB_DESKEW, 0:0:0, notifier);
    $period (negedge CLKIN, 0:0:0, notifier);
    $period (negedge CLKIN_DESKEW, 0:0:0, notifier);
    $period (negedge CLKOUT0, 0:0:0, notifier);
    $period (negedge CLKOUT1, 0:0:0, notifier);
    $period (negedge CLKOUT2, 0:0:0, notifier);
    $period (negedge CLKOUT3, 0:0:0, notifier);
    $period (negedge DCLK, 0:0:0, notifier);
    $period (negedge PSCLK, 0:0:0, notifier);
    $period (posedge CLKFB_DESKEW, 0:0:0, notifier);
    $period (posedge CLKIN, 0:0:0, notifier);
    $period (posedge CLKIN_DESKEW, 0:0:0, notifier);
    $period (posedge CLKOUT0, 0:0:0, notifier);
    $period (posedge CLKOUT1, 0:0:0, notifier);
    $period (posedge CLKOUT2, 0:0:0, notifier);
    $period (posedge CLKOUT3, 0:0:0, notifier);
    $period (posedge DCLK, 0:0:0, notifier);
    $period (posedge PSCLK, 0:0:0, notifier);
    $setuphold (posedge DCLK, negedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, negedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, negedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, negedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, negedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, negedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, negedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, negedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, negedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, negedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, negedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, negedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, negedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, negedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, negedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, negedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, negedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, negedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, negedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, negedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, negedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, negedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, negedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, negedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, negedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge DCLK, posedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, posedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, posedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, posedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, posedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, posedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, posedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, posedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, posedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, posedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, posedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, posedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, posedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, posedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, posedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, posedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, posedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, posedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, posedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, posedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, posedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, posedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, posedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, posedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, posedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $width (negedge CLKFB_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKIN, 0:0:0, 0, notifier);
    $width (negedge CLKIN_DESKEW, 0:0:0, 0, notifier);
    $width (negedge DCLK, 0:0:0, 0, notifier);
    $width (negedge PSCLK, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKFB_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKIN, 0:0:0, 0, notifier);
    $width (posedge CLKIN_DESKEW, 0:0:0, 0, notifier);
    $width (posedge DCLK, 0:0:0, 0, notifier);
    $width (posedge PSCLK, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
