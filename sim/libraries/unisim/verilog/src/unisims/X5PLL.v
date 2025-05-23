///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PLL
// /___/   /\      Filename    : X5PLL.v
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

module X5PLL #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
  parameter real CLKIN_FREQ_MAX = 1230.000,
  parameter real CLKIN_FREQ_MIN = 100.000,
  parameter real CLKPFD_FREQ_MAX = 667.500,
  parameter real CLKPFD_FREQ_MIN = 100.000,
  parameter real VCOCLK_FREQ_MAX = 4320.000,
  parameter real VCOCLK_FREQ_MIN = 2160.000,
`endif
  parameter integer CLKFBOUT_MULT = 42,
  parameter real CLKFBOUT_PHASE = 0.000,
  parameter real CLKIN_PERIOD = 0.000,
  parameter integer CLKOUT0_DIVIDE = 2,
  parameter real CLKOUT0_DUTY_CYCLE = 0.500,
  parameter real CLKOUT0_PHASE = 0.000,
  parameter [1:0] CLKOUT0_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT1_DIVIDE = 2,
  parameter real CLKOUT1_DUTY_CYCLE = 0.500,
  parameter real CLKOUT1_PHASE = 0.000,
  parameter [1:0] CLKOUT1_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT2_DIVIDE = 2,
  parameter real CLKOUT2_DUTY_CYCLE = 0.500,
  parameter real CLKOUT2_PHASE = 0.000,
  parameter [1:0] CLKOUT2_PHASE_CTRL = 2'b00,
  parameter integer CLKOUT3_DIVIDE = 2,
  parameter real CLKOUT3_DUTY_CYCLE = 0.500,
  parameter real CLKOUT3_PHASE = 0.000,
  parameter [1:0] CLKOUT3_PHASE_CTRL = 2'b00,
  parameter [0:0] CLKOUTPHY_CASCIN_EN = 1'b0,
  parameter [0:0] CLKOUTPHY_CASCOUT_EN = 1'b0,
  parameter CLKOUTPHY_DIVIDE = "DIV8",
  parameter [0:0] DESKEW2_MUXIN_SEL = 1'b0,
  parameter integer DESKEW_DELAY1 = 0,
  parameter integer DESKEW_DELAY2 = 0,
  parameter DESKEW_DELAY_EN1 = "FALSE",
  parameter DESKEW_DELAY_EN2 = "FALSE",
  parameter DESKEW_DELAY_PATH1 = "FALSE",
  parameter DESKEW_DELAY_PATH2 = "FALSE",
  parameter [0:0] DESKEW_MUXIN_SEL = 1'b0,
  parameter [0:0] DIV4_CLKOUT012 = 1'b0,
  parameter [0:0] DIV4_CLKOUT3 = 1'b0,
  parameter integer DIVCLK_DIVIDE = 1,
  parameter [0:0] IS_CLKFB1_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKFB2_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN1_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN2_DESKEW_INVERTED = 1'b0,
  parameter [0:0] IS_CLKIN_INVERTED = 1'b0,
  parameter [0:0] IS_PSEN_INVERTED = 1'b0,
  parameter [0:0] IS_PSINCDEC_INVERTED = 1'b0,
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0,
  parameter [0:0] IS_RST_INVERTED = 1'b0,
  parameter LOCK_WAIT = "FALSE",
  parameter real REF_JITTER = 0.010,
  parameter SIM_ADJ_CLK0_CASCADE = "FALSE",
  parameter XPLL_CONNECT_TO_NOCMC = "NONE"
)(
  output CLKOUT0,
  output CLKOUT1,
  output CLKOUT2,
  output CLKOUT3,
  output CLKOUTPHY_0,
  output CLKOUTPHY_90,
  output CLKOUTPHY_CASC_OUT_0,
  output CLKOUTPHY_CASC_OUT_90,
  output [15:0] DO,
  output DRDY,
  output LOCKED,
  output LOCKED1_DESKEW,
  output LOCKED2_DESKEW,
  output LOCKED_FB,
  output PSDONE,
  output [15:0] RIU_RD_DATA,
  output RIU_VALID,

  input CLKFB1_DESKEW,
  input CLKFB2_DESKEW,
  input CLKIN,
  input CLKIN1_DESKEW,
  input CLKIN2_DESKEW,
  input CLKOUTPHYEN,
  input CLKOUTPHY_CASC_IN_0,
  input CLKOUTPHY_CASC_IN_90,
  input [6:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input PSCLK,
  input PSEN,
  input PSINCDEC,
  input PWRDWN,
  input [7:0] RIU_ADDR,
  input RIU_CLK,
  input RIU_NIBBLE_SEL,
  input [15:0] RIU_WR_DATA,
  input RIU_WR_EN,
  input RST
);

`ifndef XIL_TIMING
  localparam real CLKIN_FREQ_MAX = 1230.000;
  localparam real CLKIN_FREQ_MIN = 100.000;
  localparam real CLKPFD_FREQ_MAX = 667.500;
  localparam real CLKPFD_FREQ_MIN = 100.000;
  localparam real VCOCLK_FREQ_MAX = 4320.000;
  localparam real VCOCLK_FREQ_MIN = 2160.000;
`endif

// define constants
  localparam MODULE_NAME = "X5PLL";
  
// Parameter encodings and registers
  localparam CLKOUTPHY_DIVIDE_DIV1 = 0; //Do not modify
  localparam CLKOUTPHY_DIVIDE_DIV2 = 1;
  localparam CLKOUTPHY_DIVIDE_DIV4 = 2;
  localparam CLKOUTPHY_DIVIDE_DIV8 = 3;
  localparam CLKOUTPHY_DIVIDE_DIV16 = 4;
  localparam DESKEW_DELAY_EN1_FALSE = 0;
  localparam DESKEW_DELAY_EN1_TRUE = 1;
  localparam DESKEW_DELAY_EN2_FALSE = 0;
  localparam DESKEW_DELAY_EN2_TRUE = 1;
  localparam DESKEW_DELAY_PATH1_FALSE = 0;
  localparam DESKEW_DELAY_PATH1_TRUE = 1;
  localparam DESKEW_DELAY_PATH2_FALSE = 0;
  localparam DESKEW_DELAY_PATH2_TRUE = 1;
  localparam LOCK_WAIT_FALSE = 0;
  localparam LOCK_WAIT_TRUE = 1;
  localparam SIM_ADJ_CLK0_CASCADE_FALSE = 0;
  localparam SIM_ADJ_CLK0_CASCADE_TRUE = 1;
  localparam XPLL_CONNECT_TO_NOCMC_DDR = 1;
  localparam XPLL_CONNECT_TO_NOCMC_LP4 = 2;
  localparam XPLL_CONNECT_TO_NOCMC_NONE = 0;
  localparam SLIP_TOLERANCE = 0.1; //10% slip is tolerated

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "X5PLL_dr.v"
`else
  reg [31:0] CLKFBOUT_MULT_REG = CLKFBOUT_MULT;
  real CLKFBOUT_PHASE_REG = CLKFBOUT_PHASE;
  real CLKIN_FREQ_MAX_REG = CLKIN_FREQ_MAX;
  real CLKIN_FREQ_MIN_REG = CLKIN_FREQ_MIN;
  real CLKIN_PERIOD_REG = CLKIN_PERIOD;
  reg [31:0] CLKOUT0_DIVIDE_REG = CLKOUT0_DIVIDE;
  real CLKOUT0_DUTY_CYCLE_REG = CLKOUT0_DUTY_CYCLE;
  real CLKOUT0_PHASE_REG = CLKOUT0_PHASE;
  reg [1:0] CLKOUT0_PHASE_CTRL_REG = CLKOUT0_PHASE_CTRL;
  reg [31:0] CLKOUT1_DIVIDE_REG = CLKOUT1_DIVIDE;
  real CLKOUT1_DUTY_CYCLE_REG = CLKOUT1_DUTY_CYCLE;
  real CLKOUT1_PHASE_REG = CLKOUT1_PHASE;
  reg [1:0] CLKOUT1_PHASE_CTRL_REG = CLKOUT1_PHASE_CTRL;
  reg [31:0] CLKOUT2_DIVIDE_REG = CLKOUT2_DIVIDE;
  real CLKOUT2_DUTY_CYCLE_REG = CLKOUT2_DUTY_CYCLE;
  real CLKOUT2_PHASE_REG = CLKOUT2_PHASE;
  reg [1:0] CLKOUT2_PHASE_CTRL_REG = CLKOUT2_PHASE_CTRL;
  reg [31:0] CLKOUT3_DIVIDE_REG = CLKOUT3_DIVIDE;
  real CLKOUT3_DUTY_CYCLE_REG = CLKOUT3_DUTY_CYCLE;
  real CLKOUT3_PHASE_REG = CLKOUT3_PHASE;
  reg [1:0] CLKOUT3_PHASE_CTRL_REG = CLKOUT3_PHASE_CTRL;
  reg [0:0] CLKOUTPHY_CASCIN_EN_REG = CLKOUTPHY_CASCIN_EN;
  reg [0:0] CLKOUTPHY_CASCOUT_EN_REG = CLKOUTPHY_CASCOUT_EN;
  reg [40:1] CLKOUTPHY_DIVIDE_REG = CLKOUTPHY_DIVIDE;
  real CLKPFD_FREQ_MAX_REG = CLKPFD_FREQ_MAX;
  real CLKPFD_FREQ_MIN_REG = CLKPFD_FREQ_MIN;
  reg [0:0] DESKEW2_MUXIN_SEL_REG = DESKEW2_MUXIN_SEL;
  reg [31:0] DESKEW_DELAY1_REG = DESKEW_DELAY1;
  reg [31:0] DESKEW_DELAY2_REG = DESKEW_DELAY2;
  reg [40:1] DESKEW_DELAY_EN1_REG = DESKEW_DELAY_EN1;
  reg [40:1] DESKEW_DELAY_EN2_REG = DESKEW_DELAY_EN2;
  reg [40:1] DESKEW_DELAY_PATH1_REG = DESKEW_DELAY_PATH1;
  reg [40:1] DESKEW_DELAY_PATH2_REG = DESKEW_DELAY_PATH2;
  reg [0:0] DESKEW_MUXIN_SEL_REG = DESKEW_MUXIN_SEL;
  reg [0:0] DIV4_CLKOUT012_REG = DIV4_CLKOUT012;
  reg [0:0] DIV4_CLKOUT3_REG = DIV4_CLKOUT3;
  reg [31:0] DIVCLK_DIVIDE_REG = DIVCLK_DIVIDE;
  reg [0:0] IS_CLKFB1_DESKEW_INVERTED_REG = IS_CLKFB1_DESKEW_INVERTED;
  reg [0:0] IS_CLKFB2_DESKEW_INVERTED_REG = IS_CLKFB2_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN1_DESKEW_INVERTED_REG = IS_CLKIN1_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN2_DESKEW_INVERTED_REG = IS_CLKIN2_DESKEW_INVERTED;
  reg [0:0] IS_CLKIN_INVERTED_REG = IS_CLKIN_INVERTED;
  reg [0:0] IS_PSEN_INVERTED_REG = IS_PSEN_INVERTED;
  reg [0:0] IS_PSINCDEC_INVERTED_REG = IS_PSINCDEC_INVERTED;
  reg [0:0] IS_PWRDWN_INVERTED_REG = IS_PWRDWN_INVERTED;
  reg [0:0] IS_RST_INVERTED_REG = IS_RST_INVERTED;
  reg [40:1] LOCK_WAIT_REG = LOCK_WAIT;
  real REF_JITTER_REG = REF_JITTER;
  reg [40:1] SIM_ADJ_CLK0_CASCADE_REG = SIM_ADJ_CLK0_CASCADE;
  real VCOCLK_FREQ_MAX_REG = VCOCLK_FREQ_MAX;
  real VCOCLK_FREQ_MIN_REG = VCOCLK_FREQ_MIN;
  reg [32:1] XPLL_CONNECT_TO_NOCMC_REG = XPLL_CONNECT_TO_NOCMC;
`endif

`ifdef XIL_XECLIB
  wire [5:0] CLKFBOUT_MULT_BIN;
  wire [63:0] CLKFBOUT_PHASE_BIN;
  wire [63:0] CLKIN_FREQ_MAX_BIN;
  wire [63:0] CLKIN_FREQ_MIN_BIN;
  wire [63:0] CLKIN_PERIOD_BIN;
  wire [7:0] CLKOUT0_DIVIDE_BIN;
  wire [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT0_PHASE_BIN;
  wire [7:0] CLKOUT1_DIVIDE_BIN;
  wire [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT1_PHASE_BIN;
  wire [7:0] CLKOUT2_DIVIDE_BIN;
  wire [63:0] CLKOUT2_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT2_PHASE_BIN;
  wire [7:0] CLKOUT3_DIVIDE_BIN;
  wire [63:0] CLKOUT3_DUTY_CYCLE_BIN;
  wire [63:0] CLKOUT3_PHASE_BIN;
  wire [2:0] CLKOUTPHY_DIVIDE_BIN;
  wire [63:0] CLKPFD_FREQ_MAX_BIN;
  wire [63:0] CLKPFD_FREQ_MIN_BIN;
  wire [5:0] DESKEW_DELAY1_BIN;
  wire [5:0] DESKEW_DELAY2_BIN;
  wire DESKEW_DELAY_EN1_BIN;
  wire DESKEW_DELAY_EN2_BIN;
  wire DESKEW_DELAY_PATH1_BIN;
  wire DESKEW_DELAY_PATH2_BIN;
  wire [3:0] DIVCLK_DIVIDE_BIN;
  wire LOCK_WAIT_BIN;
  wire [63:0] REF_JITTER_BIN;
  wire SIM_ADJ_CLK0_CASCADE_BIN;
  wire [63:0] VCOCLK_FREQ_MAX_BIN;
  wire [63:0] VCOCLK_FREQ_MIN_BIN;
  wire [1:0] XPLL_CONNECT_TO_NOCMC_BIN;
`else
  reg [5:0] CLKFBOUT_MULT_BIN;
  reg [63:0] CLKFBOUT_PHASE_BIN;
  reg [63:0] CLKIN_FREQ_MAX_BIN;
  reg [63:0] CLKIN_FREQ_MIN_BIN;
  reg [63:0] CLKIN_PERIOD_BIN;
  reg [7:0] CLKOUT0_DIVIDE_BIN;
  reg [63:0] CLKOUT0_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT0_PHASE_BIN;
  reg [7:0] CLKOUT1_DIVIDE_BIN;
  reg [63:0] CLKOUT1_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT1_PHASE_BIN;
  reg [7:0] CLKOUT2_DIVIDE_BIN;
  reg [63:0] CLKOUT2_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT2_PHASE_BIN;
  reg [7:0] CLKOUT3_DIVIDE_BIN;
  reg [63:0] CLKOUT3_DUTY_CYCLE_BIN;
  reg [63:0] CLKOUT3_PHASE_BIN;
  reg [2:0] CLKOUTPHY_DIVIDE_BIN;
  reg [63:0] CLKPFD_FREQ_MAX_BIN;
  reg [63:0] CLKPFD_FREQ_MIN_BIN;
  reg [5:0] DESKEW_DELAY1_BIN;
  reg [5:0] DESKEW_DELAY2_BIN;
  reg DESKEW_DELAY_EN1_BIN;
  reg DESKEW_DELAY_EN2_BIN;
  reg DESKEW_DELAY_PATH1_BIN;
  reg DESKEW_DELAY_PATH2_BIN;
  reg [3:0] DIVCLK_DIVIDE_BIN;
  reg LOCK_WAIT_BIN;
  reg [63:0] REF_JITTER_BIN;
  reg SIM_ADJ_CLK0_CASCADE_BIN;
  reg [63:0] VCOCLK_FREQ_MAX_BIN;
  reg [63:0] VCOCLK_FREQ_MIN_BIN;
  reg [1:0] XPLL_CONNECT_TO_NOCMC_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CLKFB1_DESKEW_in;
  wire CLKFB2_DESKEW_in;
  wire CLKIN1_DESKEW_in;
  wire CLKIN2_DESKEW_in;
  wire CLKIN_in;
  wire CLKOUTPHYEN_in;
  wire CLKOUTPHY_CASC_IN_0_in;
  wire CLKOUTPHY_CASC_IN_90_in;
  wire DCLK_in;
  wire DEN_in;
  wire DWE_in;
  wire PSCLK_in;
  wire PSEN_in;
  wire PSINCDEC_in;
  wire PWRDWN_in;
  wire RIU_CLK_in;
  wire RIU_NIBBLE_SEL_in;
  wire RIU_WR_EN_in;
  wire RST_in;
  wire [15:0] DI_in;
  wire [15:0] RIU_WR_DATA_in;
  wire [6:0] DADDR_in;
  wire [7:0] RIU_ADDR_in;

`ifdef XIL_TIMING
  wire PSCLK_delay;
  wire PSEN_delay;
  wire PSINCDEC_delay;
`endif

`ifdef XIL_TIMING
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK_delay; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN_delay ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = PSINCDEC_delay ^ IS_PSINCDEC_INVERTED_REG;
`else
  assign PSCLK_in = (PSCLK !== 1'bz) && PSCLK; // rv 0
  assign PSEN_in = (PSEN !== 1'bz) && (PSEN ^ IS_PSEN_INVERTED_REG); // rv 0
  assign PSINCDEC_in = PSINCDEC ^ IS_PSINCDEC_INVERTED_REG;
`endif

  assign CLKFB1_DESKEW_in = CLKFB1_DESKEW ^ IS_CLKFB1_DESKEW_INVERTED_REG;
  assign CLKFB2_DESKEW_in = CLKFB2_DESKEW ^ IS_CLKFB2_DESKEW_INVERTED_REG;
  assign CLKIN1_DESKEW_in = CLKIN1_DESKEW ^ IS_CLKIN1_DESKEW_INVERTED_REG;
  assign CLKIN2_DESKEW_in = CLKIN2_DESKEW ^ IS_CLKIN2_DESKEW_INVERTED_REG;
  assign CLKIN_in = CLKIN ^ IS_CLKIN_INVERTED_REG;
  assign CLKOUTPHYEN_in = (CLKOUTPHYEN === 1'bz) || CLKOUTPHYEN; // rv 1
  assign CLKOUTPHY_CASC_IN_0_in = CLKOUTPHY_CASC_IN_0;
  assign CLKOUTPHY_CASC_IN_90_in = CLKOUTPHY_CASC_IN_90;
  assign DADDR_in = DADDR;
  assign DCLK_in = DCLK;
  assign DEN_in = (DEN !== 1'bz) && DEN; // rv 0
  assign DI_in = DI;
  assign DWE_in = DWE;
  assign PWRDWN_in = (PWRDWN !== 1'bz) && (PWRDWN ^ IS_PWRDWN_INVERTED_REG); // rv 0
  assign RIU_ADDR_in = RIU_ADDR;
  assign RIU_CLK_in = RIU_CLK;
  assign RIU_NIBBLE_SEL_in = RIU_NIBBLE_SEL;
  assign RIU_WR_DATA_in = RIU_WR_DATA;
  assign RIU_WR_EN_in = RIU_WR_EN;
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
  assign CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[5:0];
  
  assign CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  assign CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  assign CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  assign CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  assign CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[7:0];
  
  assign CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  assign CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[7:0];
  
  assign CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  assign CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[7:0];
  
  assign CLKOUT2_DUTY_CYCLE_BIN = CLKOUT2_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  assign CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[7:0];
  
  assign CLKOUT3_DUTY_CYCLE_BIN = CLKOUT3_DUTY_CYCLE_REG * 1000;
  
  assign CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  assign CLKOUTPHY_DIVIDE_BIN =
      (CLKOUTPHY_DIVIDE_REG == "DIV8") ? CLKOUTPHY_DIVIDE_DIV8 :
      (CLKOUTPHY_DIVIDE_REG == "DIV1") ? CLKOUTPHY_DIVIDE_DIV1 :
      (CLKOUTPHY_DIVIDE_REG == "DIV2") ? CLKOUTPHY_DIVIDE_DIV2 :
      (CLKOUTPHY_DIVIDE_REG == "DIV4") ? CLKOUTPHY_DIVIDE_DIV4 :
      (CLKOUTPHY_DIVIDE_REG == "DIV16") ? CLKOUTPHY_DIVIDE_DIV16 :
       CLKOUTPHY_DIVIDE_DIV8;
  
  assign CLKPFD_FREQ_MAX_BIN = CLKPFD_FREQ_MAX_REG * 1000;
  
  assign CLKPFD_FREQ_MIN_BIN = CLKPFD_FREQ_MIN_REG * 1000;
  
  assign DESKEW_DELAY1_BIN = DESKEW_DELAY1_REG[5:0];
  
  assign DESKEW_DELAY2_BIN = DESKEW_DELAY2_REG[5:0];
  
  assign DESKEW_DELAY_EN1_BIN =
      (DESKEW_DELAY_EN1_REG == "FALSE") ? DESKEW_DELAY_EN1_FALSE :
      (DESKEW_DELAY_EN1_REG == "TRUE") ? DESKEW_DELAY_EN1_TRUE :
       DESKEW_DELAY_EN1_FALSE;
  
  assign DESKEW_DELAY_EN2_BIN =
      (DESKEW_DELAY_EN2_REG == "FALSE") ? DESKEW_DELAY_EN2_FALSE :
      (DESKEW_DELAY_EN2_REG == "TRUE") ? DESKEW_DELAY_EN2_TRUE :
       DESKEW_DELAY_EN2_FALSE;
  
  assign DESKEW_DELAY_PATH1_BIN =
      (DESKEW_DELAY_PATH1_REG == "FALSE") ? DESKEW_DELAY_PATH1_FALSE :
      (DESKEW_DELAY_PATH1_REG == "TRUE") ? DESKEW_DELAY_PATH1_TRUE :
       DESKEW_DELAY_PATH1_FALSE;
  
  assign DESKEW_DELAY_PATH2_BIN =
      (DESKEW_DELAY_PATH2_REG == "FALSE") ? DESKEW_DELAY_PATH2_FALSE :
      (DESKEW_DELAY_PATH2_REG == "TRUE") ? DESKEW_DELAY_PATH2_TRUE :
       DESKEW_DELAY_PATH2_FALSE;
  
  assign DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[3:0];
  
  assign LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
  
  assign REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  assign SIM_ADJ_CLK0_CASCADE_BIN =
      (SIM_ADJ_CLK0_CASCADE_REG == "FALSE") ? SIM_ADJ_CLK0_CASCADE_FALSE :
      (SIM_ADJ_CLK0_CASCADE_REG == "TRUE") ? SIM_ADJ_CLK0_CASCADE_TRUE :
       SIM_ADJ_CLK0_CASCADE_FALSE;
  
  assign VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  assign VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
  assign XPLL_CONNECT_TO_NOCMC_BIN =
      (XPLL_CONNECT_TO_NOCMC_REG == "NONE") ? XPLL_CONNECT_TO_NOCMC_NONE :
      (XPLL_CONNECT_TO_NOCMC_REG == "DDR") ? XPLL_CONNECT_TO_NOCMC_DDR :
      (XPLL_CONNECT_TO_NOCMC_REG == "LP4") ? XPLL_CONNECT_TO_NOCMC_LP4 :
       XPLL_CONNECT_TO_NOCMC_NONE;
  
`else
  always @ (trig_attr) begin
  #1;
  CLKFBOUT_MULT_BIN = CLKFBOUT_MULT_REG[5:0];
  
  CLKFBOUT_PHASE_BIN = CLKFBOUT_PHASE_REG * 1000;
  
  CLKIN_FREQ_MAX_BIN = CLKIN_FREQ_MAX_REG * 1000;
  
  CLKIN_FREQ_MIN_BIN = CLKIN_FREQ_MIN_REG * 1000;
  
  CLKIN_PERIOD_BIN = CLKIN_PERIOD_REG * 1000;
  
  CLKOUT0_DIVIDE_BIN = CLKOUT0_DIVIDE_REG[7:0];
  
  CLKOUT0_DUTY_CYCLE_BIN = CLKOUT0_DUTY_CYCLE_REG * 1000;
  
  CLKOUT0_PHASE_BIN = CLKOUT0_PHASE_REG * 1000;
  
  CLKOUT1_DIVIDE_BIN = CLKOUT1_DIVIDE_REG[7:0];
  
  CLKOUT1_DUTY_CYCLE_BIN = CLKOUT1_DUTY_CYCLE_REG * 1000;
  
  CLKOUT1_PHASE_BIN = CLKOUT1_PHASE_REG * 1000;
  
  CLKOUT2_DIVIDE_BIN = CLKOUT2_DIVIDE_REG[7:0];
  
  CLKOUT2_DUTY_CYCLE_BIN = CLKOUT2_DUTY_CYCLE_REG * 1000;
  
  CLKOUT2_PHASE_BIN = CLKOUT2_PHASE_REG * 1000;
  
  CLKOUT3_DIVIDE_BIN = CLKOUT3_DIVIDE_REG[7:0];
  
  CLKOUT3_DUTY_CYCLE_BIN = CLKOUT3_DUTY_CYCLE_REG * 1000;
  
  CLKOUT3_PHASE_BIN = CLKOUT3_PHASE_REG * 1000;
  
  CLKOUTPHY_DIVIDE_BIN =
      (CLKOUTPHY_DIVIDE_REG == "DIV8") ? CLKOUTPHY_DIVIDE_DIV8 :
      (CLKOUTPHY_DIVIDE_REG == "DIV1") ? CLKOUTPHY_DIVIDE_DIV1 :
      (CLKOUTPHY_DIVIDE_REG == "DIV2") ? CLKOUTPHY_DIVIDE_DIV2 :
      (CLKOUTPHY_DIVIDE_REG == "DIV4") ? CLKOUTPHY_DIVIDE_DIV4 :
      (CLKOUTPHY_DIVIDE_REG == "DIV16") ? CLKOUTPHY_DIVIDE_DIV16 :
       CLKOUTPHY_DIVIDE_DIV8;
  
  CLKPFD_FREQ_MAX_BIN = CLKPFD_FREQ_MAX_REG * 1000;
  
  CLKPFD_FREQ_MIN_BIN = CLKPFD_FREQ_MIN_REG * 1000;
  
  DESKEW_DELAY1_BIN = DESKEW_DELAY1_REG[5:0];
  
  DESKEW_DELAY2_BIN = DESKEW_DELAY2_REG[5:0];
  
  DESKEW_DELAY_EN1_BIN =
      (DESKEW_DELAY_EN1_REG == "FALSE") ? DESKEW_DELAY_EN1_FALSE :
      (DESKEW_DELAY_EN1_REG == "TRUE") ? DESKEW_DELAY_EN1_TRUE :
       DESKEW_DELAY_EN1_FALSE;
  
  DESKEW_DELAY_EN2_BIN =
      (DESKEW_DELAY_EN2_REG == "FALSE") ? DESKEW_DELAY_EN2_FALSE :
      (DESKEW_DELAY_EN2_REG == "TRUE") ? DESKEW_DELAY_EN2_TRUE :
       DESKEW_DELAY_EN2_FALSE;
  
  DESKEW_DELAY_PATH1_BIN =
      (DESKEW_DELAY_PATH1_REG == "FALSE") ? DESKEW_DELAY_PATH1_FALSE :
      (DESKEW_DELAY_PATH1_REG == "TRUE") ? DESKEW_DELAY_PATH1_TRUE :
       DESKEW_DELAY_PATH1_FALSE;
  
  DESKEW_DELAY_PATH2_BIN =
      (DESKEW_DELAY_PATH2_REG == "FALSE") ? DESKEW_DELAY_PATH2_FALSE :
      (DESKEW_DELAY_PATH2_REG == "TRUE") ? DESKEW_DELAY_PATH2_TRUE :
       DESKEW_DELAY_PATH2_FALSE;
  
  DIVCLK_DIVIDE_BIN = DIVCLK_DIVIDE_REG[3:0];
  
  LOCK_WAIT_BIN =
      (LOCK_WAIT_REG == "FALSE") ? LOCK_WAIT_FALSE :
      (LOCK_WAIT_REG == "TRUE") ? LOCK_WAIT_TRUE :
       LOCK_WAIT_FALSE;
  
  REF_JITTER_BIN = REF_JITTER_REG * 1000;
  
  SIM_ADJ_CLK0_CASCADE_BIN =
      (SIM_ADJ_CLK0_CASCADE_REG == "FALSE") ? SIM_ADJ_CLK0_CASCADE_FALSE :
      (SIM_ADJ_CLK0_CASCADE_REG == "TRUE") ? SIM_ADJ_CLK0_CASCADE_TRUE :
       SIM_ADJ_CLK0_CASCADE_FALSE;
  
  VCOCLK_FREQ_MAX_BIN = VCOCLK_FREQ_MAX_REG * 1000;
  
  VCOCLK_FREQ_MIN_BIN = VCOCLK_FREQ_MIN_REG * 1000;
  
  XPLL_CONNECT_TO_NOCMC_BIN =
      (XPLL_CONNECT_TO_NOCMC_REG == "NONE") ? XPLL_CONNECT_TO_NOCMC_NONE :
      (XPLL_CONNECT_TO_NOCMC_REG == "DDR") ? XPLL_CONNECT_TO_NOCMC_DDR :
      (XPLL_CONNECT_TO_NOCMC_REG == "LP4") ? XPLL_CONNECT_TO_NOCMC_LP4 :
       XPLL_CONNECT_TO_NOCMC_NONE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CLKFBOUT_MULT_REG < 4) || (CLKFBOUT_MULT_REG > 43))) begin
      $display("Error: [Unisim %s-101] CLKFBOUT_MULT attribute is set to %d.  Legal values for this attribute are 4 to 43. Instance: %m", MODULE_NAME, CLKFBOUT_MULT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKFBOUT_PHASE_REG < -360.000 || CLKFBOUT_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-102] CLKFBOUT_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKFBOUT_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MAX_REG < 750.000 || CLKIN_FREQ_MAX_REG > 1230.000)) begin
      $display("Error: [Unisim %s-103] CLKIN_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 750.000 to 1230.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_FREQ_MIN_REG < 100.000 || CLKIN_FREQ_MIN_REG > 100.000)) begin
      $display("Error: [Unisim %s-104] CLKIN_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 100.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKIN_PERIOD_REG < 0.000 || CLKIN_PERIOD_REG > 100.000)) begin
      $display("Error: [Unisim %s-105] CLKIN_PERIOD attribute is set to %f.  Legal values for this attribute are 0.000 to 100.000. Instance: %m", MODULE_NAME, CLKIN_PERIOD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT0_DIVIDE_REG < 2) || (CLKOUT0_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-106] CLKOUT0_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 128. Instance: %m", MODULE_NAME, CLKOUT0_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_DUTY_CYCLE_REG < 0.001 || CLKOUT0_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-107] CLKOUT0_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT0_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT0_PHASE_REG < -360.000 || CLKOUT0_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-108] CLKOUT0_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT0_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT1_DIVIDE_REG < 2) || (CLKOUT1_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-110] CLKOUT1_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 128. Instance: %m", MODULE_NAME, CLKOUT1_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_DUTY_CYCLE_REG < 0.001 || CLKOUT1_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-111] CLKOUT1_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT1_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT1_PHASE_REG < -360.000 || CLKOUT1_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-112] CLKOUT1_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT1_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT2_DIVIDE_REG < 2) || (CLKOUT2_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-114] CLKOUT2_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 128. Instance: %m", MODULE_NAME, CLKOUT2_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT2_DUTY_CYCLE_REG < 0.001 || CLKOUT2_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-115] CLKOUT2_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT2_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT2_PHASE_REG < -360.000 || CLKOUT2_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-116] CLKOUT2_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT2_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUT3_DIVIDE_REG < 2) || (CLKOUT3_DIVIDE_REG > 128))) begin
      $display("Error: [Unisim %s-118] CLKOUT3_DIVIDE attribute is set to %d.  Legal values for this attribute are 2 to 128. Instance: %m", MODULE_NAME, CLKOUT3_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT3_DUTY_CYCLE_REG < 0.001 || CLKOUT3_DUTY_CYCLE_REG > 0.999)) begin
      $display("Error: [Unisim %s-119] CLKOUT3_DUTY_CYCLE attribute is set to %f.  Legal values for this attribute are 0.001 to 0.999. Instance: %m", MODULE_NAME, CLKOUT3_DUTY_CYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKOUT3_PHASE_REG < -360.000 || CLKOUT3_PHASE_REG > 360.000)) begin
      $display("Error: [Unisim %s-120] CLKOUT3_PHASE attribute is set to %f.  Legal values for this attribute are -360.000 to 360.000. Instance: %m", MODULE_NAME, CLKOUT3_PHASE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLKOUTPHY_DIVIDE_REG != "DIV8") &&
         (CLKOUTPHY_DIVIDE_REG != "DIV1") &&
         (CLKOUTPHY_DIVIDE_REG != "DIV2") &&
         (CLKOUTPHY_DIVIDE_REG != "DIV4") &&
         (CLKOUTPHY_DIVIDE_REG != "DIV16"))) begin
      $display("Error: [Unisim %s-124] CLKOUTPHY_DIVIDE attribute is set to %s.  Legal values for this attribute are DIV8, DIV1, DIV2, DIV4 or DIV16. Instance: %m", MODULE_NAME, CLKOUTPHY_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKPFD_FREQ_MAX_REG < 667.500 || CLKPFD_FREQ_MAX_REG > 667.500)) begin
      $display("Error: [Unisim %s-125] CLKPFD_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 667.500 to 667.500. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLKPFD_FREQ_MIN_REG < 100.000 || CLKPFD_FREQ_MIN_REG > 100.000)) begin
      $display("Error: [Unisim %s-126] CLKPFD_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 100.000 to 100.000. Instance: %m", MODULE_NAME, CLKPFD_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY1_REG < 0) || (DESKEW_DELAY1_REG > 63))) begin
      $display("Error: [Unisim %s-128] DESKEW_DELAY1 attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, DESKEW_DELAY1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY2_REG < 0) || (DESKEW_DELAY2_REG > 63))) begin
      $display("Error: [Unisim %s-129] DESKEW_DELAY2 attribute is set to %d.  Legal values for this attribute are 0 to 63. Instance: %m", MODULE_NAME, DESKEW_DELAY2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_EN1_REG != "FALSE") &&
         (DESKEW_DELAY_EN1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-130] DESKEW_DELAY_EN1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_EN1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_EN2_REG != "FALSE") &&
         (DESKEW_DELAY_EN2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-131] DESKEW_DELAY_EN2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_EN2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_PATH1_REG != "FALSE") &&
         (DESKEW_DELAY_PATH1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-132] DESKEW_DELAY_PATH1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_PATH1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_DELAY_PATH2_REG != "FALSE") &&
         (DESKEW_DELAY_PATH2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-133] DESKEW_DELAY_PATH2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_DELAY_PATH2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIVCLK_DIVIDE_REG < 1) || (DIVCLK_DIVIDE_REG > 12))) begin
      $display("Error: [Unisim %s-137] DIVCLK_DIVIDE attribute is set to %d.  Legal values for this attribute are 1 to 12. Instance: %m", MODULE_NAME, DIVCLK_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LOCK_WAIT_REG != "FALSE") &&
         (LOCK_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-147] LOCK_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LOCK_WAIT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (REF_JITTER_REG < 0.000 || REF_JITTER_REG > 0.200)) begin
      $display("Error: [Unisim %s-148] REF_JITTER attribute is set to %f.  Legal values for this attribute are 0.000 to 0.200. Instance: %m", MODULE_NAME, REF_JITTER_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_ADJ_CLK0_CASCADE_REG != "FALSE") &&
         (SIM_ADJ_CLK0_CASCADE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-149] SIM_ADJ_CLK0_CASCADE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SIM_ADJ_CLK0_CASCADE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MAX_REG < 4320.000 || VCOCLK_FREQ_MAX_REG > 4320.000)) begin
      $display("Error: [Unisim %s-150] VCOCLK_FREQ_MAX attribute is set to %f.  Legal values for this attribute are 4320.000 to 4320.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MAX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (VCOCLK_FREQ_MIN_REG < 2160.000 || VCOCLK_FREQ_MIN_REG > 2160.000)) begin
      $display("Error: [Unisim %s-151] VCOCLK_FREQ_MIN attribute is set to %f.  Legal values for this attribute are 2160.000 to 2160.000. Instance: %m", MODULE_NAME, VCOCLK_FREQ_MIN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPLL_CONNECT_TO_NOCMC_REG != "NONE") &&
         (XPLL_CONNECT_TO_NOCMC_REG != "DDR") &&
         (XPLL_CONNECT_TO_NOCMC_REG != "LP4"))) begin
      $display("Error: [Unisim %s-152] XPLL_CONNECT_TO_NOCMC attribute is set to %s.  Legal values for this attribute are NONE, DDR or LP4. Instance: %m", MODULE_NAME, XPLL_CONNECT_TO_NOCMC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  // UNISIM %s- warning/error message next number:   38
  reg CLKOUT0_out;
  reg CLKOUT1_out;
  reg CLKOUT2_out;
  reg CLKOUT3_out;
  reg CLKOUTPHY_0_out;
  reg CLKOUTPHY_90_out;
  reg DRDY_out;
  reg LOCKED_out;
  reg LOCKED1_DESKEW_out;
  reg LOCKED2_DESKEW_out;
  reg LOCKED_FB_out;
  wire PSDONE_out;
  reg [15:0] DO_out;
  reg        psdone_repeat_on;
  reg [4:0]  psdone_repeat_cnt;
  reg        psdone_real;
  reg [15:0] RIU_RD_DATA_out;
  reg        RIU_VALID_out;

  assign CLKOUT0        = CLKOUT0_out;
  assign CLKOUT1        = CLKOUT1_out;
  assign CLKOUT2        = CLKOUT2_out;
  assign CLKOUT3        = CLKOUT3_out;
  assign CLKOUTPHY_0    = CLKOUTPHY_0_out;
  assign CLKOUTPHY_90   = CLKOUTPHY_90_out;
  assign DO             = DO_out;
  assign DRDY           = DRDY_out;
  assign LOCKED         = LOCKED_out;
  assign LOCKED1_DESKEW = LOCKED1_DESKEW_out;
  assign LOCKED2_DESKEW = LOCKED2_DESKEW_out;
  assign LOCKED_FB      = LOCKED_FB_out;     
  assign PSDONE         = PSDONE_out;
  assign RIU_RD_DATA    = RIU_RD_DATA_out;
  assign RIU_VALID      = RIU_VALID_out;

  localparam ps_res = 32; // phase interpolator resolution is 32. 
  localparam real pi_res = 32.0; 
  localparam AVGI = 16; //number of input clk periods used for averaging
  reg [160:1] clkout_name;
  integer ps_in_init;
  integer clk0_delay=0, clk1_delay=0, clk2_delay=0, clk3_delay=0;
  integer clk0_delay_next=0, clk1_delay_next=0, clk2_delay_next=0, clk3_delay_next=0;
  reg[4:0] clk0_pi=0, clk1_pi=0, clk2_pi=0, clk3_pi=0;
  reg[1:0] clk0_intp_sel=0, clk1_intp_sel=0, clk2_intp_sel=0, clk3_intp_sel=0;
  reg clk0_fps_en=0, clk1_fps_en=0, clk2_fps_en=0, clk3_fps_en=0;
  reg clk0_pd1_en=0, clk1_pd1_en=0, clk2_pd1_en=0, clk3_pd1_en=0;
  reg clk0_pd2_en=0, clk1_pd2_en=0, clk2_pd2_en=0, clk3_pd2_en=0;
  reg [5:0]  deskew_prg_dly1_reg = 0;
  reg [5:0]  deskew_prg_dly2_reg = 0;
  integer    deskew_prg_dly1 = 0;
  integer    deskew_prg_dly2 = 0;
  integer clkin1_deskew_prg_dly =0;
  integer clkfb1_deskew_prg_dly =0;
  integer clkin2_deskew_prg_dly =0;
  integer clkfb2_deskew_prg_dly =0;
  reg deskew_dly_path1 = 0;
  reg deskew_dly_path2 = 0;
  reg deskew_dly_en1 = 0;
  reg deskew_dly_en2 = 0;
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
  reg clkvco_90 = 1'b0;
  reg clkpll_dly = 1'b0;
  reg clkpll_stopped;
  reg clkin_osc, clkin_p;
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
  //integer mf_product;
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
  real divclk_phase;
  real clkfb_out_phase;
  real clkfb_duty;
  real clk0_duty;
  real clk1_duty;
  real clk2_duty;
  real clk3_duty;
  real divclk_duty; 
  reg [1:0] clkfbout_mx = 2'b01;
  reg [1:0] clk0_mx     = 2'b01;
  reg [1:0] clk1_mx     = 2'b01;
  reg [1:0] clk2_mx     = 2'b01;
  reg [1:0] clk3_mx     = 2'b01;
  reg clkfbout_e =0;
  reg clk0_e, clk1_e, clk2_e, clk3_e;
  reg [7:0] clkfbout_dt=0;
  reg [7:0] clk0_dt=0, clk1_dt=0, clk2_dt=0, clk3_dt=0;
  reg [8:0] clk0_dt_int=0, clk1_dt_int=0, clk2_dt_int=0, clk3_dt_int=0;
  reg       divclk_en=1, clkfbout_en=1;
  reg       clk0_en=1, clk1_en=1, clk2_en=1, clk3_en=1;
  reg [7:0] clkfbout_ht=0;
  reg [7:0] divclk_ht;
  reg [7:0] clk0_ht, clk1_ht, clk2_ht, clk3_ht;
  reg [7:0] divclk_lt;
  reg [7:0] clkfbout_lt=0;
  reg [7:0] clk0_lt, clk1_lt, clk2_lt, clk3_lt;
  integer clkfbout_div=42;
  reg [9:0] clk0_cnt, clk0_div;
  reg [9:0] clk1_cnt, clk1_div;
  reg [9:0] clk2_cnt, clk2_div;
  reg [9:0] clk3_cnt, clk3_div;
  integer clk0_cnt_max, clk1_cnt_max, clk2_cnt_max, clk3_cnt_max;
  integer clk0_cnt_ht, clk1_cnt_ht, clk2_cnt_ht, clk3_cnt_ht;
  reg [7:0]  divclk_div=8'b1, divclk_cnt=8'b0;
  wire clkoutphy_out_by16;
  reg  xiphyen_sync=1'b0;
  reg  xiphyen_sync1=1'b0;
  reg  xiphyen_sync2=1'b0;
  reg  [7:0] clkvco_cnt;
  reg drp_updt = 1'b0;
  reg riu_updt = 1'b0;

  real halfperiod_sum   = 0.0;
  integer halfperiod    = 0;
  integer quarterperiod = 0;
  reg clkvco_free       = 1'b0;
  integer ik10=0, ik11=0;
  integer i=0;
  integer rr=0;

  reg CLKFBSTOPPED_out;
  reg CLKINSTOPPED_out;

  reg  ps_wr_to_max0 = 1'b0;
  reg  ps_wr_to_max1 = 1'b0;
  reg  ps_wr_to_max2 = 1'b0;
  reg  ps_wr_to_max3 = 1'b0;

  reg divclk_e ;
  reg clk0_prediv2     = 1;
  reg clk1_prediv2     = 1;
  reg clk2_prediv2     = 1;
  reg clk3_prediv2     = 1;
  reg clkfbout_prediv2 = 1;
  reg clk0_start_h     = 0;
  reg clk1_start_h     = 0;
  reg clk2_start_h     = 0;
  reg clk3_start_h     = 0;
  reg clk0_p5_en       = 0;
  reg clk1_p5_en       = 0;
  reg clk2_p5_en       = 0;
  reg clk3_p5_en       = 0;
  reg clk0_p5_fedge    = 0;
  reg clk1_p5_fedge    = 0;
  reg clk2_p5_fedge    = 0;
  reg clk3_p5_fedge    = 0;
  reg [4:0] pi_dummy;
  reg [5:0] dt_dummy;
  reg p5_fedge_dummy;
  reg p5_en_dummy   ;
  reg start_h_dummy ;
  reg [3:0] pll_cp;
  reg [3:0] pll_res;
  reg [1:0] pll_lfhf;
  reg       dig_deskew_en1; //digital deskew PD1 enabled
  reg       dig_deskew_en2; //digital deskew PD2 enabled
  reg [9:0] lock_cnt;
  reg [4:0] lock_fb_dly;
  reg [9:0] lock_sat_high;
  reg [4:0] lock_ref_dly;
  reg [9:0] unlock_cnt;
  reg       ss_enabled;
  reg [2:0] clkoutphy_divmode = 3'b011;
  reg [2:0] clkoutphy_div = CLKOUTPHY_DIVIDE_DIV8;
  reg       clkoutphy_0_out_int;
  reg       clkoutphy_90_out_int;

  reg      d1_delay_found=1'b0, d1_delay_found_tmp=1'b0;
  reg      d2_delay_found=1'b0, d2_delay_found_tmp=1'b0;
  time     fb_d1_det_delay=0;//digital deskew 1 detected fb delay 
  time     fb_d2_det_delay=0;//digital deskew 2 detected fb delay 
  time     pd1_clk0_applied_det_delay=0;
  time     pd1_clk1_applied_det_delay=0;
  time     pd1_clk2_applied_det_delay=0;
  time     pd1_clk3_applied_det_delay=0;
  time     pd2_clk0_applied_det_delay=0;
  time     pd2_clk1_applied_det_delay=0;
  time     pd2_clk2_applied_det_delay=0;
  time     pd2_clk3_applied_det_delay=0;
  time     pd1_applied_delay=0;
  time     pd2_applied_delay=0;
  time     clkin1_d_edge;
  time     clkin2_d_edge;
  time     delay_edge_d1;
  time     delay_edge_d2;
  real     period_clkin1_d=500.0;
  real     period_clkin2_d=500.0;
  integer  clkin1_d_period_tmp;
  integer  clkin2_d_period_tmp;
  integer  clkin1_d_cnt;
  integer  clkin2_d_cnt;
  integer  clkin1_d_period [AVGI-1:0];
  integer  clkin2_d_period [AVGI-1:0];
  integer  period_avg_clkin1_d=100000; 
  integer  period_avg_clkin2_d=100000;
  integer  period_avg_clkin1_d_d=100000;
  integer  period_avg_clkin2_d_d=100000;
  reg      period_avg_clkin1_d_stable=0;
  reg      period_avg_clkin2_d_stable=0;
  reg      period_avg_clkin1_d_stable_i=0;
  reg      period_avg_clkin1_d_stable_f=0;
  reg      period_avg_clkin2_d_stable_i=0;
  reg      period_avg_clkin2_d_stable_f=0;
  reg      clkin1_deskew_in_dly;
  reg      clkfb1_deskew_in_dly;
  reg      clkin2_deskew_in_dly;
  reg      clkfb2_deskew_in_dly;
  reg      pd1_locked;
  reg      pd2_locked;
  wire     slip_det_en = 1'b0; //Not supporting SLIP DETECT
  integer  period_clkin_at_lock   = 0;
  wire     slip;
  reg      slip_clkin;
  reg      slip_warn_displayed_clkin =0;
  integer  slip_avg_in_cnt =0;
  wire     slip_avg_rdy;


  // reverse calculations
  reg [7:0]   clkfbout_dt_revc=0;
  reg [7:0]   clkfbout_ht_revc;
  reg [7:0]   clkfbout_lt_revc;
  reg         clkfbout_e_revc;
  reg [4:0]   clk0_pi_revc=0, clk1_pi_revc=0, clk2_pi_revc=0, clk3_pi_revc=0;
  reg         clk0_e_revc, clk1_e_revc, clk2_e_revc,clk3_e_revc;
  reg [7:0]   clk0_dt_revc=0,clk1_dt_revc=0,clk2_dt_revc=0,clk3_dt_revc=0;
  reg [7:0]   clk0_ht_revc,clk1_ht_revc,clk2_ht_revc,clk3_ht_revc;
  reg [7:0]   clk0_lt_revc,clk1_lt_revc,clk2_lt_revc,clk3_lt_revc;
  reg         clk0_start_h_revc=0,clk1_start_h_revc=0,clk2_start_h_revc=0,clk3_start_h_revc=0;
  reg         clk0_p5_en_revc=0,clk1_p5_en_revc=0,clk2_p5_en_revc=0,clk3_p5_en_revc=0;
  reg         clk0_p5_fedge_revc=0,clk1_p5_fedge_revc=0,clk2_p5_fedge_revc=0,clk3_p5_fedge_revc=0;
  reg         dig_deskew_en1_revc=0, dig_deskew_en2_revc=0;

  reg         psdec_adj0;
  reg         psdec_adj1;
  reg         psdec_adj2;
  reg         psdec_adj3;
  reg         psdec_adj0_done;
  reg         psdec_adj1_done;
  reg         psdec_adj2_done;
  reg         psdec_adj3_done;

  wire        dwe_in_ne;
  reg         dwe_in_dly;


  localparam    ST_PSDK_IDLE   = 0,
                ST_PSDK_LOCK   = 1,
                ST_PSDK_RLOCK1 = 2,
                ST_PSDK_RLOCK2 = 3;
              
  reg  [1:0]    ps_deskew_state;
  reg  [1:0]    ps_deskew_state_next; 
  reg           ps_deskew1_detected  =1'b0;
  reg           ps_deskew2_detected  =1'b0;
  reg           ps_deskew1_det_rst   = 1'b0;
  reg           ps_deskew2_det_rst   = 1'b0;
  reg           ps_deskew1_delay_found_tmp = 1'b0;
  reg           ps_deskew2_delay_found_tmp = 1'b0;
  reg           ps_deskew1_delay_found = 1'b0;
  reg           ps_deskew2_delay_found = 1'b0;
  wire          ps_deskew_lock;
  reg [2:0]     ps_lock_d;
  wire          ps_avg_lock;
  reg           ps_deskew1_rst;
  reg           ps_deskew2_rst;
  reg           ps_deskew_stop_upd_avg;

  reg           riu_valid_addr;


  integer jj1;
`ifndef XIL_XECLIB
`ifdef XIL_DR
  always @ (trig_attr) begin
`else
  initial begin
`endif
    if (CLKIN_PERIOD_REG != 0.0) period_clkin =  CLKIN_PERIOD_REG * 1000;

    for( jj1=0;jj1<AVGI; jj1=jj1+1) begin
      clkin_period[jj1]    = period_clkin; 
      clkin1_d_period[jj1] = period_clkin1_d;
      clkin2_d_period[jj1] = period_clkin2_d;
    end
       
    clkin_period_tmp = 0;
    period_avg = period_clkin;
       
    clkin1_d_period_tmp = 0;
    period_avg_clkin1_d = period_clkin1_d;

    clkin2_d_period_tmp = 0;
    period_avg_clkin2_d = period_clkin2_d;

    //Make sure phase is positive btw 0 to 360.0
    mod_phase (CLKOUT0_PHASE_REG,  clk0_phase);
    mod_phase (CLKOUT1_PHASE_REG,  clk1_phase);
    mod_phase (CLKOUT2_PHASE_REG,  clk2_phase);
    mod_phase (CLKOUT3_PHASE_REG,  clk3_phase);
    mod_phase (CLKFBOUT_PHASE_REG, clkfb_out_phase);

    clkfbout_div = CLKFBOUT_MULT_REG;
    
    clk0_div = CLKOUT0_DIVIDE_REG;
    clk1_div = CLKOUT1_DIVIDE_REG;
    clk2_div = CLKOUT2_DIVIDE_REG;
    clk3_div = CLKOUT3_DIVIDE_REG;
    
    clk0_duty = CLKOUT0_DUTY_CYCLE_REG;
    clk1_duty = CLKOUT1_DUTY_CYCLE_REG;
    clk2_duty = CLKOUT2_DUTY_CYCLE_REG;
    clk3_duty = CLKOUT3_DUTY_CYCLE_REG;
    clkfb_duty = 0.5; //always 0.5

    
    GetMultVal(clkfbout_div, pll_cp, pll_res, pll_lfhf );
    GetLockDetSettings (clkfbout_div, lock_ref_dly, lock_fb_dly, lock_cnt, lock_sat_high, unlock_cnt);

    
    clkout_name = "CLKFBOUT";
    attr_to_mc(clkout_name, clkfbout_div, clkfb_out_phase, clkfb_duty, 0,
               pi_dummy, clkfbout_e, clkfbout_dt, clkfbout_ht, clkfbout_lt, 
               p5_fedge_dummy, p5_en_dummy, start_h_dummy  );

    clkout_name = "CLKOUT0";
    attr_to_mc(clkout_name, clk0_div, clk0_phase, clk0_duty, clk0_prediv2,
               clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt, 
               clk0_p5_fedge, clk0_p5_en, clk0_start_h   );
    ht_calc(clk0_div,clk0_duty,clk0_dt,clk0_start_h,clk0_cnt_ht,clk0_cnt_max,clk0_dt_int);

    clkout_name = "CLKOUT1";
    attr_to_mc(clkout_name, clk1_div, clk1_phase, clk1_duty, clk1_prediv2,
               clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt, 
               clk1_p5_fedge, clk1_p5_en, clk1_start_h   );
    ht_calc(clk1_div,clk1_duty,clk1_dt,clk1_start_h,clk1_cnt_ht,clk1_cnt_max,clk1_dt_int);

    clkout_name = "CLKOUT2";
    attr_to_mc(clkout_name, clk2_div, clk2_phase, clk2_duty, clk2_prediv2,
               clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt, 
               clk2_p5_fedge, clk2_p5_en, clk2_start_h   );
    ht_calc(clk2_div,clk2_duty,clk2_dt,clk2_start_h,clk2_cnt_ht,clk2_cnt_max,clk2_dt_int);

    clkout_name = "CLKOUT3";
    attr_to_mc(clkout_name, clk3_div, clk3_phase, clk3_duty, clk3_prediv2,
               clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt, 
               clk3_p5_fedge, clk3_p5_en, clk3_start_h   );
    ht_calc(clk3_div,clk3_duty,clk3_dt,clk3_start_h,clk3_cnt_ht,clk3_cnt_max,clk3_dt_int);


    divclk_div   = DIVCLK_DIVIDE_REG;
    divclk_duty  = 0.5;
    divclk_phase = 0;
    divclk_ht      = divclk_div;
    divclk_lt      = divclk_div;
    divclk_e       = 0;
    

    ps_in_init  = 0;
    ps_cnt0     = ps_in_init;
    ps_cnt1     = ps_in_init;
    ps_cnt2     = ps_in_init;
    ps_cnt3     = ps_in_init;
   
    clk0_intp_sel = CLKOUT0_PHASE_CTRL_REG;
    clk1_intp_sel = CLKOUT1_PHASE_CTRL_REG;
    clk2_intp_sel = CLKOUT2_PHASE_CTRL_REG;
    clk3_intp_sel = CLKOUT3_PHASE_CTRL_REG;
    clk0_fps_en = (clk0_intp_sel == 2'b10);// Dynamic phase shift enabled for CLKOUT0
    clk1_fps_en = (clk1_intp_sel == 2'b10);
    clk2_fps_en = (clk2_intp_sel == 2'b10);
    clk3_fps_en = (clk3_intp_sel == 2'b10);
    fps_en = clk0_fps_en || clk1_fps_en || clk2_fps_en || clk3_fps_en;
    pll_lock_time = 12;
    lock_period_time = 10;
    m_product = clkfbout_div;
    md_product = clkfbout_div * divclk_div;
    period_fbout = period_avg * divclk_div;
    period_vco_rl = 1.0 * period_fbout / clkfbout_div;
    period_vco_rl_half = period_vco_rl / 2.0;

    clkout_en_time = 2 * md_product + pll_lock_time;
    locked_en_time = md_product +  clkout_en_time + 2;
    lock_cnt_max = locked_en_time + 16;
    clk0_pd1_en     = (clk0_intp_sel == 2'b01) ; // Digital deskew Phase Detector 1 for CLKOUT0 is enabled.
    clk1_pd1_en     = (clk1_intp_sel == 2'b01) ;
    clk2_pd1_en     = (clk2_intp_sel == 2'b01) ;
    clk3_pd1_en     = (clk3_intp_sel == 2'b01) ;
    dig_deskew_en1  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  );
    clk0_pd2_en     = (clk0_intp_sel == 2'b11) ; // Digital deskew Phase Detector 2 for CLKOUT0 is enabled.
    clk1_pd2_en     = (clk1_intp_sel == 2'b11) ;
    clk2_pd2_en     = (clk2_intp_sel == 2'b11) ;
    clk3_pd2_en     = (clk3_intp_sel == 2'b11) ;
    dig_deskew_en2  = (clk0_pd2_en || clk1_pd2_en || clk2_pd2_en || clk3_pd2_en  );
    
    //1: Add delay to CLKFB_DESKEW path 
    //0: Add delay to CLKIN_DESKEW path
    deskew_dly_path1 = (DESKEW_DELAY_PATH1_BIN == DESKEW_DELAY_PATH1_TRUE)? 1'b1 : 1'b0; 
    deskew_dly_path2 = (DESKEW_DELAY_PATH2_BIN == DESKEW_DELAY_PATH2_TRUE)? 1'b1 : 1'b0;

    //digital deskew programmable delay path enabled or not
    deskew_dly_en1 = (DESKEW_DELAY_EN1_BIN == DESKEW_DELAY_EN1_TRUE)? 1'b1 : 1'b0; 
    deskew_dly_en2 = (DESKEW_DELAY_EN2_BIN == DESKEW_DELAY_EN2_TRUE)? 1'b1 : 1'b0;

    //absolute programmable delay in ps
    deskew_prg_dly1_reg = DESKEW_DELAY1_BIN;
    deskew_prg_dly2_reg = DESKEW_DELAY2_BIN;
    deskew_prg_dly1     = (DESKEW_DELAY1_BIN * 40) + 200 ;
    deskew_prg_dly2     = (DESKEW_DELAY2_BIN * 40) + 200 ;
    clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
    clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;
    clkin2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==0)) ? deskew_prg_dly2 : 0;
    clkfb2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==1)) ? deskew_prg_dly2 : 0;

    clk0_delay = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay) + (clk0_pd2_en * pd2_clk0_applied_det_delay);
    clk1_delay = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay) + (clk1_pd2_en * pd2_clk1_applied_det_delay);
    clk2_delay = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay) + (clk2_pd2_en * pd2_clk2_applied_det_delay);
    clk3_delay = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay) + (clk3_pd2_en * pd2_clk3_applied_det_delay);

    dr_sram[8'h28>>2] = 16'd0; // RESERVED
    dr_sram[8'h2c>>2] = 16'd0; // RESERVED
    dr_sram[8'h30>>2] = {clkoutphy_divmode, clkfbout_prediv2, 2'b01, clkfbout_en, clkfbout_e, clkfbout_dt[7:0]}; // RESERVED[31:13]
    dr_sram[8'h34>>2] = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; 
    dr_sram[8'h38>>2] = {clk0_p5_fedge, clk0_start_h, clk0_p5_en, clk0_en, clk0_prediv2, clk0_mx[1:0], clk0_e, clk0_dt[7:0]};
    dr_sram[8'h3c>>2] = {clk0_ht[7:0], clk0_lt[7:0]}; 
    dr_sram[8'h40>>2] = {clk1_p5_fedge, clk1_start_h, clk1_p5_en, clk1_en, clk1_prediv2, clk1_mx[1:0], clk1_e, clk1_dt[7:0]};
    dr_sram[8'h44>>2] = {clk1_ht[7:0], clk1_lt[7:0]}; 
    dr_sram[8'h48>>2] = {clk2_p5_fedge, clk2_start_h, clk2_p5_en, clk2_en, clk2_prediv2, clk2_mx[1:0], clk2_e, clk2_dt[7:0]};
    dr_sram[8'h4c>>2] = {clk2_ht[7:0], clk2_lt[7:0]}; 
    dr_sram[8'h50>>2] = {clk3_p5_fedge, clk3_start_h, clk3_p5_en, clk3_en, clk3_prediv2, clk3_mx[1:0], clk3_e, clk3_dt[7:0]};
    dr_sram[8'h54>>2] = {clk3_ht[7:0], clk3_lt[7:0]}; 
    dr_sram[8'h58>>2] = 16'd0; // RESERVED
    dr_sram[8'h5c>>2] = 16'd0; // RESERVED
    dr_sram[8'h60>>2] = 16'd0; // RESERVED
    dr_sram[8'h64>>2] = 16'd0; // RESERVED
    dr_sram[8'h68>>2] = 16'd0; // RESERVED
    dr_sram[8'h6c>>2] = 16'd0; // RESERVED
    dr_sram[8'h70>>2] = 16'd0; // RESERVED
    dr_sram[8'h74>>2] = 16'd0; // RESERVED
    dr_sram[8'h78>>2] = {12'h002, pll_cp};
    dr_sram[8'h7c>>2] = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
    dr_sram[8'h80>>2] = {5'd0, divclk_e, 1'b0, dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]};
    dr_sram[8'h84>>2] = {divclk_ht[7:0], divclk_lt[7:0]}; 
    dr_sram[8'h88>>2] = 16'd0; // RESERVED
    dr_sram[8'h8c>>2] = 16'd0; // RESERVED
    dr_sram[8'h90>>2] = 16'd0; // RESERVED
    dr_sram[8'h94>>2] = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
    dr_sram[8'h98>>2] = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
    dr_sram[8'h9c>>2] = {4'd0, pll_lfhf, 10'h280};
    dr_sram[8'ha0>>2] = {1'b0, lock_fb_dly[4:0], lock_cnt[9:0]};
    dr_sram[8'ha4>>2] = {1'b0, lock_ref_dly[4:0],lock_sat_high[9:0]}; 
    dr_sram[8'ha8>>2] = 16'd0; // RESERVED
    dr_sram[8'hac>>2] = {11'd0, pll_res,1'b0};
    dr_sram[8'hb0>>2] = 16'd0; // RESERVED
    dr_sram[8'hb4>>2] = 16'd0; // RESERVED
    dr_sram[8'hb8>>2] = 16'd0; // RESERVED
    dr_sram[8'hbc>>2] = 16'd0; // RESERVED
    dr_sram[8'hc0>>2] = 16'd0; // RESERVED
    dr_sram[8'hc4>>2] = {6'd0, unlock_cnt[9:0]};
    dr_sram[8'hc8>>2] = 16'd0; // RESERVED
    dr_sram[8'hcc>>2] = 16'd0; // RESERVED
    dr_sram[8'hd0>>2] = 16'd0; // RESERVED
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
    CLKOUTPHY_0_out = 1'b0;
    CLKOUTPHY_90_out = 1'b0;
    clkvco_cnt = 8'h0;
    d1_delay_found = 1'b0;
    d1_delay_found_tmp = 1'b0;
    d2_delay_found = 1'b0;
    d2_delay_found_tmp = 1'b0;
    clkin1_d_edge =0;
    clkin2_d_edge =0;
    clkin1_d_cnt = 0;
    clkin2_d_cnt = 0;
    delay_edge_d1 = 0;
    delay_edge_d2 = 0;
    LOCKED_FB_out = 1'b0;
    LOCKED1_DESKEW_out = 1'b0;
    LOCKED2_DESKEW_out = 1'b0;
    pd1_clk0_applied_det_delay=0;
    pd1_clk1_applied_det_delay=0;
    pd1_clk2_applied_det_delay=0;
    pd1_clk3_applied_det_delay=0;
    pd2_clk0_applied_det_delay=0;
    pd2_clk1_applied_det_delay=0;
    pd2_clk2_applied_det_delay=0;
    pd2_clk3_applied_det_delay=0;
    period_avg_clkin1_d=100000;
    period_avg_clkin2_d=100000;
    period_avg_clkin1_d_d=100000;
    period_avg_clkin2_d_d=100000;
    period_avg_clkin1_d_stable=0;
    period_avg_clkin1_d_stable_i=0;
    period_avg_clkin1_d_stable_f=0;
    period_avg_clkin2_d_stable=0;
    period_avg_clkin2_d_stable_i=0;
    period_avg_clkin2_d_stable_f=0;
    pd1_locked = 0;
    pd2_locked = 0;
    slip_clkin = 0;
    psdec_adj0 = 1'b0;
    psdec_adj1 = 1'b0;
    psdec_adj2 = 1'b0;
    psdec_adj3 = 1'b0;
    ps_deskew_state      = ST_PSDK_IDLE;
    ps_deskew_state_next = ST_PSDK_IDLE;
    ps_deskew1_detected  =1'b0;
    ps_deskew2_detected  =1'b0;
    ps_deskew1_det_rst   =1'b0;
    ps_deskew2_det_rst   =1'b0;
    ps_deskew1_delay_found_tmp = 1'b0;
    ps_deskew2_delay_found_tmp = 1'b0;
    ps_deskew1_delay_found = 1'b0;
    ps_deskew2_delay_found = 1'b0;
    ps_deskew1_rst = 1'b0;    
    ps_deskew2_rst = 1'b0; 
    ps_lock_d = 3'd0;
    ps_deskew_stop_upd_avg = 1'b0;
  end

  
  assign clkpll =  CLKIN_in;

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
        
        if(~drp_lock) begin
          drp_lock <= 1;
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
          daddr_lat <= DADDR_in;
        end
        
        if (~valid_daddr) 
          $display("Warning: [Unisim %s-15] Address DADDR=%b is unsupported at time %t. Instance %m ", MODULE_NAME, DADDR_in, $time);
        
        if (DWE_in == 1) begin          // write process
          if (rst_int == 1) begin
//            if (valid_daddr) dr_sram[DADDR_in] <= DI_in;
            if (valid_daddr || drp_updt) 
              drp_updt <= 1'b1;
            case ({DADDR_in,2'b00})
              9'h28: begin // = 16'h0; 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h2c: begin // = 16'h0; 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h30: begin 
                     {clkoutphy_divmode,clkfbout_prediv2, clkfbout_mx[1:0], clkfbout_en, clkfbout_e, clkfbout_dt[7:0]} = DI_in[15:0];
                     end
              9'h34: begin 
                     {clkfbout_ht[7:0], clkfbout_lt[7:0]} = DI_in;
                     end
              9'h38: begin 
                     {clk0_p5_fedge, clk0_start_h, clk0_p5_en} = DI_in[15:13];
                     {clk0_e, clk0_dt[7:0]} = DI_in[8:0];
                     end
              9'h3c: begin
                     {clk0_ht[7:0], clk0_lt[7:0]} = DI_in[15:0];
                     end
              9'h40: begin 
                     {clk1_p5_fedge, clk1_start_h, clk1_p5_en} = DI_in[15:13];
                     {clk1_e, clk1_dt[7:0]} = DI_in[8:0];
                     end
              9'h44: begin
                     {clk1_ht[7:0], clk1_lt[7:0]} = DI_in[15:0];
                     end
              9'h48: begin
                     {clk2_p5_fedge, clk2_start_h, clk2_p5_en} = DI_in[15:13];
                     {clk2_e, clk2_dt[7:0]} = DI_in[8:0];
                     end
              9'h4c: begin 
                     {clk2_ht[7:0], clk2_lt[7:0]} = DI_in[15:0];
                     end
              9'h50: begin
                     {clk3_p5_fedge, clk3_start_h, clk3_p5_en} = DI_in[15:13];
                     {clk3_e, clk3_dt[7:0]} = DI_in[8:0];
                     end
              9'h54: begin
                     {clk3_ht[7:0], clk3_lt[7:0]} = DI_in[15:0];
                     end
              9'h58: begin //RESERVED 
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h5c: begin  //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h60: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h64: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h68: begin  //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h6c: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h70: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h74: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h78: begin 
                     pll_cp[3:0] = DI_in[3:0];
                     end
              9'h7c: begin 
                     {dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]} = DI_in[8:0]; 
                     end
              9'h80: begin 
                     divclk_e = DI_in[10];
                     {dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]} = DI_in[8:0]; 
                     end
              9'h84: begin 
                     {divclk_ht[7:0], divclk_lt[7:0]} = DI_in[15:0];
                     end
              9'h88: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h8c: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h90: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'h94: begin 
                     {clk1_pi,clk1_intp_sel} = DI_in[14:8];
                     {clk0_pi,clk0_intp_sel} = DI_in[6:0];
                     end
              9'h98: begin
                     {clk3_pi,clk3_intp_sel} = DI_in[14:8];
                     {clk2_pi,clk2_intp_sel} = DI_in[6:0];
                     end
              9'h9c: begin 
                     pll_lfhf = DI_in[11:10];
                     end
              9'ha0: begin 
                     {lock_fb_dly[4:0],lock_cnt[9:0]} = DI_in[14:0];
                     end
              9'ha4: begin
                     {lock_ref_dly[4:0],lock_sat_high[9:0]} = DI_in[14:0];
                     end
              9'ha8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hac: begin 
                     pll_res[3:0] = DI_in[4:1];
                     end
              9'hb0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hb4: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hb8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hbc: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hc0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hc4: begin 
                     unlock_cnt = DI_in[9:0];
                     end
              9'hc8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hcc: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              9'hd0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address DADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                     end
              default: begin
                    $display("Warning: [Unisim %s-6] Address DADDR=%b is unsupported at time %t. Instance %m.", MODULE_NAME, DADDR_in, $time);
                       end
            endcase
          end else begin
            $display("Error: [Unisim %s-18] RST is low at time %t. RST need to be high when changing parameters through DRP. Instance %m", MODULE_NAME, $time);
          end
        end else begin //DRP read
          case ({DADDR_in,2'b00})
            9'h28: DO_out = 16'd0; // RESERVED
            9'h2c: DO_out = 16'd0; // RESERVED
            9'h30: DO_out = {clkoutphy_divmode, clkfbout_prediv2, 2'b01, clkfbout_en, clkfbout_e, clkfbout_dt[7:0]}; // RESERVED[31:13]
            9'h34: DO_out = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; 
            9'h38: DO_out = {clk0_p5_fedge, clk0_start_h, clk0_p5_en, clk0_en, clk0_prediv2, clk0_mx[1:0], clk0_e, clk0_dt[7:0]};
            9'h3c: DO_out = {clk0_ht[7:0], clk0_lt[7:0]}; 
            9'h40: DO_out = {clk1_p5_fedge, clk1_start_h, clk1_p5_en, clk1_en, clk1_prediv2, clk1_mx[1:0], clk1_e, clk1_dt[7:0]};
            9'h44: DO_out = {clk1_ht[7:0], clk1_lt[7:0]}; 
            9'h48: DO_out = {clk2_p5_fedge, clk2_start_h, clk2_p5_en, clk2_en, clk2_prediv2, clk2_mx[1:0], clk2_e, clk2_dt[7:0]};
            9'h4c: DO_out = {clk2_ht[7:0], clk2_lt[7:0]}; 
            9'h50: DO_out = {clk3_p5_fedge, clk3_start_h, clk3_p5_en, clk3_en, clk3_prediv2, clk3_mx[1:0], clk3_e, clk3_dt[7:0]};
            9'h54: DO_out = {clk3_ht[7:0], clk3_lt[7:0]}; 
            9'h58: DO_out = 16'd0; // RESERVED
            9'h5c: DO_out = 16'd0; // RESERVED
            9'h60: DO_out = 16'd0; // RESERVED
            9'h64: DO_out = 16'd0; // RESERVED
            9'h68: DO_out = 16'd0; // RESERVED
            9'h6c: DO_out = 16'd0; // RESERVED
            9'h70: DO_out = 16'd0; // RESERVED
            9'h74: DO_out = 16'd0; // RESERVED
            9'h78: DO_out = {12'h002, pll_cp};
            9'h7c: DO_out = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
            9'h80: DO_out = {5'd0, divclk_e, 1'b0, dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]};
            9'h84: DO_out = {divclk_ht[7:0], divclk_lt[7:0]}; 
            9'h88: DO_out = 16'd0; // RESERVED
            9'h8c: DO_out = 16'd0; // RESERVED
            9'h90: DO_out = 16'd0; // RESERVED
            9'h94: DO_out = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
            9'h98: DO_out = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
            9'h9c: DO_out = {4'd0, pll_lfhf, 10'h280};
            9'ha0: DO_out = {1'b0, lock_fb_dly[4:0], lock_cnt[9:0]};
            9'ha4: DO_out = {1'b0, lock_ref_dly[4:0],lock_sat_high[9:0]}; 
            9'ha8: DO_out = 16'd0; // RESERVED
            9'hac: DO_out = {11'd0, pll_res,1'b0};
            9'hb0: DO_out = 16'd0; // RESERVED
            9'hb4: DO_out = 16'd0; // RESERVED
            9'hb8: DO_out = 16'd0; // RESERVED
            9'hbc: DO_out = 16'd0; // RESERVED
            9'hc0: DO_out = 16'd0; // RESERVED
            9'hc4: DO_out = {6'd0, unlock_cnt[9:0]};
            9'hc8: DO_out = 16'd0; // RESERVED
            9'hcc: DO_out = 16'd0; // RESERVED
            9'hd0: DO_out = 16'd0; // RESERVED
          endcase
        end
    end  //DEN
    if ( drp_lock == 1) begin
       if (drp_lock_lat_cnt < drp_lock_lat) begin
          drp_lock_lat_cnt <= drp_lock_lat_cnt + 1;
       end else begin
          DRDY_out <= 1;
          drp_lock_lat_cnt <= 0;
          //@(negedge DCLK_in);
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

  //--------------------------------------------------------------
  //    RIU Interface
  //--------------------------------------------------------------

  //reg  [15:0]   RIU_WR_DATA_d;
  //reg  [7:0]    RIU_ADDR_d;
  //reg           riu_wr_eff;

  
  //always @(posedge RIU_CLK_in or posedge glblGSR) begin
  //  if (glblGSR == 1)
  //    RIU_WR_DATA_d     <= 0;
  //    RIU_ADDR_d        <= 0;
  //    RIU_WR_eff         <= 0;
  //  else
  //    RIU_WR_DATA_d     <= RIU_WR_DATA_in;
  //    RIU_ADDR_d        <= RIU_ADDR_in;
  //    RIU_WR_eff        <= RIU_WR_EN_in && RIU_NIBBLE_SEL_in && riu_valid_addr;
  //end

  always @(posedge RIU_CLK_in or posedge glblGSR) begin
    if (glblGSR == 1) 
      RIU_VALID_out <= 0;
    else 
      RIU_VALID_out <= 1;
  end

  always @(posedge RIU_CLK_in or posedge glblGSR) begin
    if (glblGSR == 1) begin
      riu_updt <= 1'b0;
    end else begin
      
      if (~RST_in && riu_updt)
        riu_updt <= 1'b0;
       
      if (RIU_NIBBLE_SEL_in == 1 ) begin //RIU operation
        riu_valid_addr = riu_addr_is_valid(RIU_ADDR_in);
        if (~riu_valid_addr) begin
          $display("Warning: [Unisim %s-15] Address RIU_ADDR=%b is unsupported at time %t. Instance %m ", MODULE_NAME, RIU_ADDR_in, $time);
        end
      
        if(RIU_WR_EN_in) begin //WRITE
          if(rst_int ==1) begin
            if(riu_valid_addr || riu_updt)
              riu_updt <= 1'b1;
            case ({RIU_ADDR_in[7:0], 2'b00}) //TODO check this
              9'h28: begin // = 16'h0; 
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h2c: begin // = 16'h0; 
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h30: begin 
                     {clkoutphy_divmode,clkfbout_prediv2, clkfbout_mx[1:0], clkfbout_en, clkfbout_e, clkfbout_dt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h34: begin 
                     {clkfbout_ht[7:0], clkfbout_lt[7:0]} = RIU_WR_DATA_in;
                     end
              9'h38: begin 
                     {clk0_p5_fedge, clk0_start_h, clk0_p5_en} = RIU_WR_DATA_in[15:13];
                     {clk0_e, clk0_dt[7:0]} = RIU_WR_DATA_in[8:0];
                     end
              9'h3c: begin
                     {clk0_ht[7:0], clk0_lt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h40: begin 
                     {clk1_p5_fedge, clk1_start_h, clk1_p5_en} = RIU_WR_DATA_in[15:13];
                     {clk1_e, clk1_dt[7:0]} = RIU_WR_DATA_in[8:0];
                     end
              9'h44: begin
                     {clk1_ht[7:0], clk1_lt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h48: begin
                     {clk2_p5_fedge, clk2_start_h, clk2_p5_en} = RIU_WR_DATA_in[15:13];
                     {clk2_e, clk2_dt[7:0]} = RIU_WR_DATA_in[8:0];
                     end
              9'h4c: begin 
                     {clk2_ht[7:0], clk2_lt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h50: begin
                     {clk3_p5_fedge, clk3_start_h, clk3_p5_en} = RIU_WR_DATA_in[15:13];
                     {clk3_e, clk3_dt[7:0]} = RIU_WR_DATA_in[8:0];
                     end
              9'h54: begin
                     {clk3_ht[7:0], clk3_lt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h58: begin //RESERVED 
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h5c: begin  //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h60: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h64: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h68: begin  //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h6c: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h70: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h74: begin //RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h78: begin 
                     pll_cp[3:0] = RIU_WR_DATA_in[3:0];
                     end
              9'h7c: begin 
                     {dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]} = RIU_WR_DATA_in[8:0]; 
                     end
              9'h80: begin 
                     divclk_e = RIU_WR_DATA_in[10];
                     {dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]} = RIU_WR_DATA_in[8:0]; 
                     end
              9'h84: begin 
                     {divclk_ht[7:0], divclk_lt[7:0]} = RIU_WR_DATA_in[15:0];
                     end
              9'h88: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h8c: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h90: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'h94: begin 
                     {clk1_pi,clk1_intp_sel} = RIU_WR_DATA_in[14:8];
                     {clk0_pi,clk0_intp_sel} = RIU_WR_DATA_in[6:0];
                     end
              9'h98: begin
                     {clk3_pi,clk3_intp_sel} = RIU_WR_DATA_in[14:8];
                     {clk2_pi,clk2_intp_sel} = RIU_WR_DATA_in[6:0];
                     end
              9'h9c: begin 
                     pll_lfhf = RIU_WR_DATA_in[11:10];
                     end
              9'ha0: begin 
                     {lock_fb_dly[4:0],lock_cnt[9:0]} = RIU_WR_DATA_in[14:0];
                     end
              9'ha4: begin
                     {lock_ref_dly[4:0],lock_sat_high[9:0]} = RIU_WR_DATA_in[14:0];
                     end
              9'ha8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hac: begin 
                     pll_res[3:0] = RIU_WR_DATA_in[4:1];
                     end
              9'hb0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hb4: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hb8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hbc: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hc0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hc4: begin 
                     unlock_cnt = RIU_WR_DATA_in[9:0];
                     end
              9'hc8: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hcc: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              9'hd0: begin // RESERVED
                     $display("Warning: [Unisim %s-6] Write address RIU_ADDR=%b is unused at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                     end
              default: begin
                    $display("Warning: [Unisim %s-6] Address RIU_ADDR=%b is unsupported at time %t. Instance %m.", MODULE_NAME, RIU_ADDR_in, $time);
                       end
            endcase
          end else begin
            $display("Error: [Unisim %s-18] RST is low at time %t. RST need to be high when changing parameters through RIU. Instance %m", MODULE_NAME, $time);
          end
        end // WRITE
      
        // READ  
        // There's also an automatic read after each write.
        case ({RIU_ADDR_in[7:0],2'b00}) //TODO check this
          9'h28: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h2c: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h30: RIU_RD_DATA_out = {clkoutphy_divmode, clkfbout_prediv2, 2'b01, clkfbout_en, clkfbout_e, clkfbout_dt[7:0]}; // RESERVED[31:13]
          9'h34: RIU_RD_DATA_out = {clkfbout_ht[7:0], clkfbout_lt[7:0]}; 
          9'h38: RIU_RD_DATA_out = {clk0_p5_fedge, clk0_start_h, clk0_p5_en, clk0_en, clk0_prediv2, clk0_mx[1:0], clk0_e, clk0_dt[7:0]};
          9'h3c: RIU_RD_DATA_out = {clk0_ht[7:0], clk0_lt[7:0]}; 
          9'h40: RIU_RD_DATA_out = {clk1_p5_fedge, clk1_start_h, clk1_p5_en, clk1_en, clk1_prediv2, clk1_mx[1:0], clk1_e, clk1_dt[7:0]};
          9'h44: RIU_RD_DATA_out = {clk1_ht[7:0], clk1_lt[7:0]}; 
          9'h48: RIU_RD_DATA_out = {clk2_p5_fedge, clk2_start_h, clk2_p5_en, clk2_en, clk2_prediv2, clk2_mx[1:0], clk2_e, clk2_dt[7:0]};
          9'h4c: RIU_RD_DATA_out = {clk2_ht[7:0], clk2_lt[7:0]}; 
          9'h50: RIU_RD_DATA_out = {clk3_p5_fedge, clk3_start_h, clk3_p5_en, clk3_en, clk3_prediv2, clk3_mx[1:0], clk3_e, clk3_dt[7:0]};
          9'h54: RIU_RD_DATA_out = {clk3_ht[7:0], clk3_lt[7:0]}; 
          9'h58: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h5c: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h60: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h64: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h68: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h6c: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h70: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h74: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h78: RIU_RD_DATA_out = {12'h002, pll_cp};
          9'h7c: RIU_RD_DATA_out = {7'd0, dig_deskew_en1, deskew_dly_path1, deskew_dly_en1, deskew_prg_dly1_reg[5:0]};
          9'h80: RIU_RD_DATA_out = {5'd0, divclk_e, 1'b0, dig_deskew_en2, deskew_dly_path2, deskew_dly_en2, deskew_prg_dly2_reg[5:0]};
          9'h84: RIU_RD_DATA_out = {divclk_ht[7:0], divclk_lt[7:0]}; 
          9'h88: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h8c: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h90: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'h94: RIU_RD_DATA_out = {1'b0,clk1_pi,clk1_intp_sel,1'b0,clk0_pi,clk0_intp_sel}; 
          9'h98: RIU_RD_DATA_out = {1'b0,clk3_pi,clk3_intp_sel,1'b0,clk2_pi,clk2_intp_sel}; 
          9'h9c: RIU_RD_DATA_out = {4'd0, pll_lfhf, 10'h280};
          9'ha0: RIU_RD_DATA_out = {1'b0, lock_fb_dly[4:0], lock_cnt[9:0]};
          9'ha4: RIU_RD_DATA_out = {1'b0, lock_ref_dly[4:0],lock_sat_high[9:0]}; 
          9'ha8: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hac: RIU_RD_DATA_out = {11'd0, pll_res,1'b0};
          9'hb0: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hb4: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hb8: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hbc: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hc0: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hc4: RIU_RD_DATA_out = {6'd0, unlock_cnt[9:0]};
          9'hc8: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hcc: RIU_RD_DATA_out = 16'd0; // RESERVED
          9'hd0: RIU_RD_DATA_out = 16'd0; // RESERVED
        endcase
        //end of READ, or WRITE.
      end // RIU_NIBBLE_SEL_in. End of RIU operation.
    end //else
  end //always


  function riu_addr_is_valid;
  input [7:0] raddr_in;
  begin
    riu_addr_is_valid = 1'b1;
    for (rr=0; rr<=7; rr=rr+1)
      if (raddr_in[rr] != 0 && raddr_in[rr] != 1) riu_addr_is_valid = 1'b0;
    $display("riu_addr_is_valid called. riu_addr_in=h%0h, returning %0d",raddr_in, riu_addr_is_valid); 
  end
  endfunction

  
  //--------------------------------------------------------------
  

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
        clkout_en_time = md_product + m_product + pll_lock_time;
        locked_en_time = md_product +  clkout_en_time + 2;
      lock_cnt_max = locked_en_time + 16;
    end

  always @(rst_int or clkout_locked or pll_unlock or unlock_recover or slip) begin
    if ((rst_int == 1) && (LOCKED !== 1'b0))
      LOCKED_FB_out <= #1000 0;
    else if ((clkout_locked && ~pll_unlock && ~unlock_recover && ~slip) === 1'b1)
      LOCKED_FB_out <= 1'b1;
    else
      LOCKED_FB_out <= 1'b0;
  end

  always @(*) begin
    LOCKED1_DESKEW_out <= dig_deskew_en1 && pd1_locked; 
    LOCKED2_DESKEW_out <= dig_deskew_en2 && pd2_locked;
    LOCKED_out         <= LOCKED_FB_out && 
                          (!dig_deskew_en1 || LOCKED1_DESKEW_out) && 
                          (!dig_deskew_en2 || LOCKED2_DESKEW_out);
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

  always @(period_avg or divclk_div or clkfbout_div) begin
    if(~ps_deskew_stop_upd_avg) begin
      m_product = clkfbout_div;
      period_fbout = period_avg * divclk_div;
      period_vco_rl = 1.0 * period_fbout / clkfbout_div;
      period_vco_rl_half = period_vco_rl / 2.0;
      pll_locked_delay = (period_fbout * clkfbout_div) / period_avg;
    end
  end

  always @ (negedge RST_in) begin
    if (drp_updt ||riu_updt) begin
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKFBOUT";
      mc_to_attr_fbout (clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e, 
                        clkfbout_div, clkfb_out_phase); 
  
      //reverse calculations for sanity check
      attr_to_mc (clkout_name, clkfbout_div, clkfb_out_phase,0.5,0, 
                pi_dummy, clkfbout_e_revc, clkfbout_dt_revc, clkfbout_ht_revc, clkfbout_lt_revc,
                p5_fedge_dummy, p5_en_dummy,start_h_dummy   );

      if({clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e} !=
         {clkfbout_dt_revc,clkfbout_ht_revc, clkfbout_lt_revc,clkfbout_e_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
           Programmed values different than calculated.\n\
           {clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e} \n\
           Written via DRP: {%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d} \n\
           Intended clkfbout_div=%0d, clkfbout_phase=%0d", 
           MODULE_NAME, clkout_name, $time, 
           clkfbout_dt, clkfbout_ht, clkfbout_lt, clkfbout_e,
           clkfbout_dt_revc,clkfbout_ht_revc, clkfbout_lt_revc,clkfbout_e_revc,
           clkfbout_div, clkfb_out_phase);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT0";
      mc_to_attr (clkout_name, clk0_prediv2, clk0_pi, clk0_dt, clk0_ht, clk0_lt, clk0_e, 
                  clk0_p5_fedge, clk0_p5_en, clk0_start_h,
                  clk0_div, clk0_phase, clk0_duty);
      ht_calc(clk0_div,clk0_duty,clk0_dt,clk0_start_h,clk0_cnt_ht,clk0_cnt_max,clk0_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk0_div, clk0_phase, clk0_duty, clk0_prediv2,
                 clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc, 
                 clk0_p5_fedge_revc, clk0_p5_en_revc, clk0_start_h_revc   );
      if({clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h} !=
         {clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc,clk0_p5_fedge_revc,clk0_p5_en_revc,clk0_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
           {clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h} \n\
           Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
         clk0_pi, clk0_e, clk0_dt, clk0_ht, clk0_lt,clk0_p5_fedge, clk0_p5_en, clk0_start_h,
         clk0_pi_revc, clk0_e_revc, clk0_dt_revc,  clk0_ht_revc, clk0_lt_revc,clk0_p5_fedge_revc,clk0_p5_en_revc,clk0_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT1";
      mc_to_attr (clkout_name, clk1_prediv2, clk1_pi, clk1_dt, clk1_ht, clk1_lt, clk1_e, 
                  clk1_p5_fedge, clk1_p5_en, clk1_start_h,
                  clk1_div, clk1_phase, clk1_duty);
      ht_calc(clk1_div,clk1_duty,clk1_dt,clk1_start_h,clk1_cnt_ht,clk1_cnt_max,clk1_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk1_div, clk1_phase, clk1_duty, clk1_prediv2,
                 clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc, 
                 clk1_p5_fedge_revc, clk1_p5_en_revc, clk1_start_h_revc   );
      if({clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h} !=
         {clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc,clk1_p5_fedge_revc,clk1_p5_en_revc,clk1_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
           {clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h} \n\
           Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
         clk1_pi, clk1_e, clk1_dt, clk1_ht, clk1_lt,clk1_p5_fedge, clk1_p5_en, clk1_start_h,
         clk1_pi_revc, clk1_e_revc, clk1_dt_revc,  clk1_ht_revc, clk1_lt_revc,clk1_p5_fedge_revc,clk1_p5_en_revc,clk1_start_h_revc);
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT2";
      mc_to_attr (clkout_name, clk2_prediv2, clk2_pi, clk2_dt, clk2_ht, clk2_lt, clk2_e, 
                  clk2_p5_fedge, clk2_p5_en, clk2_start_h,
                  clk2_div, clk2_phase, clk2_duty);
      ht_calc(clk2_div,clk2_duty,clk2_dt,clk2_start_h,clk2_cnt_ht,clk2_cnt_max,clk2_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk2_div, clk2_phase, clk2_duty, clk2_prediv2,
                 clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc, 
                 clk2_p5_fedge_revc, clk2_p5_en_revc, clk2_start_h_revc   );
      if({clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h} !=
         {clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc,clk2_p5_fedge_revc,clk2_p5_en_revc,clk2_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
          {clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h} \n\
          Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
         clk2_pi, clk2_e, clk2_dt, clk2_ht, clk2_lt,clk2_p5_fedge, clk2_p5_en, clk2_start_h,
         clk2_pi_revc, clk2_e_revc, clk2_dt_revc,  clk2_ht_revc, clk2_lt_revc,clk2_p5_fedge_revc,clk2_p5_en_revc,clk2_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "CLKOUT3";
      mc_to_attr (clkout_name, clk3_prediv2, clk3_pi, clk3_dt, clk3_ht, clk3_lt, clk3_e, 
                  clk3_p5_fedge, clk3_p5_en, clk3_start_h,
                  clk3_div, clk3_phase, clk3_duty);
      ht_calc(clk3_div,clk3_duty,clk3_dt,clk3_start_h,clk3_cnt_ht,clk3_cnt_max,clk3_dt_int);

      //reverse calculations for sanity check
      attr_to_mc(clkout_name, clk3_div, clk3_phase, clk3_duty, clk3_prediv2,
                 clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc, 
                 clk3_p5_fedge_revc, clk3_p5_en_revc, clk3_start_h_revc   );
      if({clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h} !=
         {clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc,clk3_p5_fedge_revc,clk3_p5_en_revc,clk3_start_h_revc})
        $display("Error: [Unisim %s-26] Illegal DRP programming values for %0s at time %0t. Instance %m.\
          Programmed values different than calculated.\n\
           {clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h} \n\
           Written via DRP: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d} calculated: {%0d,%0d,%0d,%0d,%0d,%0d,%0d,%0d}.",
          MODULE_NAME,clkout_name, $time,
         clk3_pi, clk3_e, clk3_dt, clk3_ht, clk3_lt,clk3_p5_fedge, clk3_p5_en, clk3_start_h,
         clk3_pi_revc, clk3_e_revc, clk3_dt_revc,  clk3_ht_revc, clk3_lt_revc,clk3_p5_fedge_revc,clk3_p5_en_revc,clk3_start_h_revc);

      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clkout_name = "DIVCLK";
      mc_to_attr_div (divclk_ht,divclk_lt,divclk_e, divclk_div);
      
      //~~~~~~~~~~~~~~~~~~~~~~~~~
      clk0_fps_en = (clk0_intp_sel == 2'b10); 
      clk1_fps_en = (clk1_intp_sel == 2'b10); 
      clk2_fps_en = (clk2_intp_sel == 2'b10); 
      clk3_fps_en = (clk3_intp_sel == 2'b10); 
      clk0_pd1_en = (clk0_intp_sel == 2'b01) ;
      clk1_pd1_en = (clk1_intp_sel == 2'b01) ;
      clk2_pd1_en = (clk2_intp_sel == 2'b01) ;
      clk3_pd1_en = (clk3_intp_sel == 2'b01) ;
      clk0_pd2_en = (clk0_intp_sel == 2'b11) ;
      clk1_pd2_en = (clk1_intp_sel == 2'b11) ;
      clk2_pd2_en = (clk2_intp_sel == 2'b11) ;
      clk3_pd2_en = (clk3_intp_sel == 2'b11) ;
      dig_deskew_en1_revc  = (clk0_pd1_en || clk1_pd1_en || clk2_pd1_en || clk3_pd1_en  );
      dig_deskew_en2_revc  = (clk0_pd2_en || clk1_pd2_en || clk2_pd2_en || clk3_pd2_en  );
      if(dig_deskew_en1 != dig_deskew_en1_revc) 
        $display("Error: [Unisim %s-30] Illegal DRP programming values at time %0t. Instance %m.\n\
          DRP Write doesn't match calculated value from CLK*INTP_SEL registers. Values of 2'b10 enable DESKEW_EN.\n\
          written: CLK*_INTP_SEL={%0b,%0b,%0b,%0b} DESKEW_EN=%0b. Calculated DESKEW_EN=%0b", 
          MODULE_NAME, $time,
          clk0_intp_sel,clk1_intp_sel,clk2_intp_sel,clk3_intp_sel,
          dig_deskew_en1,dig_deskew_en1_revc);
      if(dig_deskew_en2 != dig_deskew_en2_revc)
        $display("Error: [Unisim %s-30] Illegal DRP programming values at time %0t. Instance %m.\n\
          DRP Write doesn't match calculated value from CLK*INTP_SEL registers. Values of 2'b11 enable DESKEW_EN_2ND.\n\
          written: CLK*_INTP_SEL={%0b,%0b,%0b,%0b} DESKEW_EN_2ND=%0b. Calculated DESKEW_EN_2ND=%0b", 
          MODULE_NAME, $time,
          clk0_intp_sel,clk1_intp_sel,clk2_intp_sel,clk3_intp_sel,
          dig_deskew_en2,dig_deskew_en2_revc);

      deskew_prg_dly1       = (deskew_prg_dly1_reg * 40) + 200 ;
      deskew_prg_dly2       = (deskew_prg_dly2_reg * 40) + 200 ;
      clkin1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==0)) ? deskew_prg_dly1 : 0;
      clkfb1_deskew_prg_dly = ((deskew_dly_en1==1) && (deskew_dly_path1==1)) ? deskew_prg_dly1 : 0;
      clkin2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==0)) ? deskew_prg_dly2 : 0;
      clkfb2_deskew_prg_dly = ((deskew_dly_en2==1) && (deskew_dly_path2==1)) ? deskew_prg_dly2 : 0;
    end
  end

  always @ (negedge RST_in ) begin
    if (drp_updt||riu_updt) begin
      case (clkoutphy_divmode) 
        3'b000:  clkoutphy_div = CLKOUTPHY_DIVIDE_DIV1  ;
        3'b001:  clkoutphy_div = CLKOUTPHY_DIVIDE_DIV2  ;
        3'b010:  clkoutphy_div = CLKOUTPHY_DIVIDE_DIV4  ;
        3'b011:  clkoutphy_div = CLKOUTPHY_DIVIDE_DIV8  ;
        3'b100:  clkoutphy_div = CLKOUTPHY_DIVIDE_DIV16 ;
        default: clkoutphy_div = CLKOUTPHY_DIVIDE_DIV8  ;
      endcase
    end
  end
   
  always @(/*period_vco_rl or */ps_cnt0)
    if (fps_en == 1) begin
      period_ps_old0 = period_ps0;
      //if (ps_cnt0 == 0)
      //  period_ps0 = 0;
      if (ps_cnt0 <= 0)
        period_ps0 = (period_vco_rl*clk0_div) + (ps_cnt0 * period_vco_rl / (ps_res*1.0)); //cannot be a negative shift
      else
        period_ps0 = ps_cnt0 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt1)
    if (fps_en == 1) begin
      period_ps_old1 = period_ps1;
      //if (ps_cnt1 == 0)
      //  period_ps1 = 0;
      //else if (ps_cnt1 < 0)
      if (ps_cnt1 <= 0)
        period_ps1 = (period_vco_rl*clk1_div) + (ps_cnt1 * period_vco_rl / (ps_res*1.0)); 
      else
        period_ps1 = ps_cnt1 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt2)
    if (fps_en == 1) begin
      period_ps_old2 = period_ps2;
      //if (ps_cnt2 == 0)
      //  period_ps2 = 0;
      //else if (ps_cnt2 < 0)
      if (ps_cnt2 <= 0)
        period_ps2 = (period_vco_rl*clk2_div) + (ps_cnt2 * period_vco_rl / (ps_res*1.0)); 
      else
        period_ps2 = ps_cnt2 * period_vco_rl / (ps_res*1.0);
    end

  always @(/*period_vco_rl or */ps_cnt3)
    if (fps_en == 1) begin
      period_ps_old3 = period_ps3;
      //if (ps_cnt3 == 0)
      //  period_ps3 = 0;
      //else if (ps_cnt3 < 0)
      if(ps_cnt3 <= 0)
        period_ps3 = (period_vco_rl*clk3_div) + (ps_cnt3 * period_vco_rl / (ps_res*1.0)); 
      else if ((ps_cnt3 == 0) && PSINCDEC_in == 0)
        period_ps3 = 0;
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
        if (m_product > 1) begin
          for (ik11=1; ik11 < m_product; ik11=ik11+1) begin
            if (rst_int) ik11 = m_product;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b0;
            if (clkvco_cnt == 8'h0) clkout_en <= clkout_en_pre;
            halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
            halfperiod = $rtoi(halfperiod_sum);
            #halfperiod clkvco_free = 1'b1;
          end
        end
      halfperiod_sum = halfperiod_sum + period_vco_rl_half - halfperiod;
      halfperiod = $rtoi(halfperiod_sum);
      #halfperiod clkvco_free = 1'b0;
      
      if(divclk_div>clkfbout_div) 
        #(period_vco_rl_half -1.0);

      if (clkvco_cnt == 8'h0) begin
        clkout_en <= clkout_en_pre;
      end
    end else begin
      clkout_en <= 1'b0;
      clkvco_free = 1'b0;
      halfperiod_sum = 0.0;
      halfperiod = 0;
    end

  always @(*) clkvco <= #(clkvco_delay) clkvco_free;

  always @(posedge clkvco_free) begin
    quarterperiod = halfperiod / 2;
  end

  always @(*) clkvco_90 <= #(quarterperiod) clkvco;

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
      repeat (2) @(negedge clkin1_deskew_in_dly); //might change this w.r.t. spec
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

  always @(posedge ps_lock) begin
    if(dig_deskew_en2) begin
      ps_deskew2_rst = 1;
      repeat (2) @(negedge clkin2_deskew_in_dly); 
      repeat (3) @(posedge PSCLK_in); 
      repeat (1) @(negedge clkin2_deskew_in_dly);
      ps_deskew2_rst = 0;
      ps_deskew2_detected = 1;
      @(negedge ps_deskew_lock);
      ps_deskew2_detected = 0;
    end
  end

  always @(posedge ps_deskew2_detected) begin
    ps_deskew2_det_rst = 1;
    #2 ;
    ps_deskew2_det_rst = 0;
  end

  always @(*) clk0_delay_next = ((clk0_pi * period_vco_rl) / pi_res) + (clk0_fps_en * period_ps0) + (clk0_pd1_en * pd1_clk0_applied_det_delay) + (clk0_pd2_en * pd2_clk0_applied_det_delay);
  always @(*) clk1_delay_next = ((clk1_pi * period_vco_rl) / pi_res) + (clk1_fps_en * period_ps1) + (clk1_pd1_en * pd1_clk1_applied_det_delay) + (clk1_pd2_en * pd2_clk1_applied_det_delay);
  always @(*) clk2_delay_next = ((clk2_pi * period_vco_rl) / pi_res) + (clk2_fps_en * period_ps2) + (clk2_pd1_en * pd1_clk2_applied_det_delay) + (clk2_pd2_en * pd2_clk2_applied_det_delay);
  always @(*) clk3_delay_next = ((clk3_pi * period_vco_rl) / pi_res) + (clk3_fps_en * period_ps3) + (clk3_pd1_en * pd1_clk3_applied_det_delay) + (clk3_pd2_en * pd2_clk3_applied_det_delay);

  always @ (posedge clkpll_dly) begin
    if (ps_lock ) begin
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
    if (clk0_dly_cnt > clk0_dt_int) begin
      if (clk0_delay == 0) begin clk0in = clkvco;
      end else if (clk0_fps_en && ps_wr_to_max0 && ~clkvco) begin
        clk0in <= #clk0_delay 1'b0;
      end else begin
        clk0in <= #clk0_delay clkvco;
      end
    end else clk0in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk1_dly_cnt > clk1_dt_int) begin
      if (clk1_delay == 0) begin clk1in = clkvco;
      end else if (clk1_fps_en && ps_wr_to_max1 && ~clkvco) begin
        clk1in <= #clk1_delay 1'b0;
      end else begin
        clk1in <= #clk1_delay clkvco;
      end
    end else clk1in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk2_dly_cnt > clk2_dt_int)
      if (clk2_delay == 0) clk2in = clkvco;
      else if (clk2_fps_en && ps_wr_to_max2 && ~clkvco) begin
        clk2in <= #clk2_delay 1'b0;
      end else begin
        clk2in <= #clk2_delay clkvco;
      end
    else clk2in = 1'b0;
  end

  always @ (clkvco) begin
    if (clk3_dly_cnt > clk3_dt_int)
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
     if (clk0_dly_cnt <= clk0_dt_int)
       clk0_dly_cnt <= clk0_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk1_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk1_en == 1) begin
     if (clk1_dly_cnt <= clk1_dt_int)
       clk1_dly_cnt <= clk1_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk2_dly_cnt <= 'd0;
   else if (clkout_en == 1'b1 && clk2_en == 1'b1) begin
     if (clk2_dly_cnt <= clk2_dt_int)
       clk2_dly_cnt <= clk2_dly_cnt + 1;
   end

 always  @(negedge clkvco or posedge rst_in_o)
   if (rst_in_o)
     clk3_dly_cnt <= 'd0;
   else if (clkout_en == 1 && clk3_en == 1) begin
     if (clk3_dly_cnt <= clk3_dt_int)
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

  always @(CLKOUTPHY_DIVIDE_BIN) begin
    clkoutphy_div = CLKOUTPHY_DIVIDE_BIN;
    case (clkoutphy_div) 
      CLKOUTPHY_DIVIDE_DIV1:   clkoutphy_divmode = 3'b000;
      CLKOUTPHY_DIVIDE_DIV2:   clkoutphy_divmode = 3'b001;
      CLKOUTPHY_DIVIDE_DIV4:   clkoutphy_divmode = 3'b010;
      CLKOUTPHY_DIVIDE_DIV8:   clkoutphy_divmode = 3'b011;
      CLKOUTPHY_DIVIDE_DIV16:  clkoutphy_divmode = 3'b100; 
      default:                 clkoutphy_divmode = 3'b011; //DIV8
    endcase
  end

  always @(posedge clkvco or posedge rst_int) 
  begin
    if (rst_int) begin
      clkvco_cnt <= 8'd0;
    end else begin
      clkvco_cnt <= clkvco_cnt - 8'd1;
    end
  end
 
  assign clkoutphy_out_by16 = ((clkvco_cnt[7] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV16)) ||
                               (clkvco_cnt[6] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV8 )) ||
                               (clkvco_cnt[5] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV4 )) ||
                               (clkvco_cnt[4] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV2 )) ||
                               (clkvco_cnt[3] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV1)));

  always @(*) begin
    CLKOUTPHY_0_out = xiphyen_sync && clkoutphy_0_out_int;
  end

  always @(*) begin
    clkoutphy_0_out_int = 
                    ((clkvco_cnt[3] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV16)) ||
                     (clkvco_cnt[2] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV8 )) ||
                     (clkvco_cnt[1] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV4 )) ||
                     (clkvco_cnt[0] && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV2 )) ||
                     (clkvco        && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV1)));
  end

  always @(posedge clkoutphy_out_by16 or posedge rst_int) begin
    if (rst_int) begin
      xiphyen_sync2  <= 1'b0;
      xiphyen_sync1  <= 1'b0;
      xiphyen_sync   <= 1'b0;
    end
    else begin
      xiphyen_sync2  <= CLKOUTPHYEN_in;
      xiphyen_sync1  <= xiphyen_sync2;
      xiphyen_sync   <= xiphyen_sync1;
    end
  end


  //clkoutphy90
  always @(*) begin
    CLKOUTPHY_90_out = xiphyen_sync && clkoutphy_90_out_int;
  end

  always @(*) begin
    clkoutphy_90_out_int = 
                    (((clkvco_cnt[3] ^  clkvco_cnt[2]) && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV16)) ||
                     ((clkvco_cnt[2] ^  clkvco_cnt[1]) && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV8 )) ||
                     ((clkvco_cnt[1] ^  clkvco_cnt[0]) && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV4 )) ||
                     ((clkvco_cnt[0] ^  clkvco       ) && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV2 )) ||
                     ( clkvco_90                       && (clkoutphy_div == CLKOUTPHY_DIVIDE_DIV1)));
  end


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
  always @(posedge CLKIN1_DESKEW_in or posedge rst_int) begin
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

  always @(posedge CLKIN2_DESKEW_in or posedge rst_int) begin
    if (rst_int) begin
      for( ii2=0;ii2<5; ii2=ii2+1)
        clkin2_d_period[ii2] <= period_clkin2_d;
    end 
    else begin
      clkin2_d_edge <= $time;
      if (clkin2_d_edge != 0 && CLKINSTOPPED_out == 0) begin 
        clkin2_d_period[0] <= $time - clkin2_d_edge;
        for( ii2=0;ii2<4; ii2=ii2+1)
         clkin2_d_period[ii2+1] <= clkin2_d_period[ii2];
      end
    end
  end

  always @(clkin2_d_edge) begin
    if (clkin2_d_period[0] > clkin2_d_period[1])
        clkin2_d_period_tmp = clkin2_d_period[0] - clkin2_d_period[1];
    else
        clkin2_d_period_tmp = clkin2_d_period[1] - clkin2_d_period[0];
    if ( (clkin2_d_period[0] != period_avg_clkin2_d) && (clkin2_d_period[0] < 1.5 * period_avg_clkin2_d || clkin2_d_period_tmp <= 300) ) 
      period_avg_clkin2_d = (clkin2_d_period[0] + clkin2_d_period[1] + clkin2_d_period[2]
                 + clkin2_d_period[3] + clkin2_d_period[4])/5;
  end

  always @(clkin2_d_edge or posedge rst_int) begin
    if(rst_int) begin
      clkin2_d_cnt = 0;
      period_avg_clkin2_d_d <= 0;
      period_avg_clkin2_d_stable <=0;
    end
    else if (ps_avg_lock) begin
      period_avg_clkin2_d_d <= period_avg_clkin2_d; //keep updating
      period_avg_clkin2_d_stable <=1;
    end
    else begin
      clkin2_d_cnt = clkin2_d_cnt +1;
      period_avg_clkin2_d_d <= period_avg_clkin2_d;
      if((clkin2_d_cnt>5) && ((period_avg_clkin2_d_d-period_avg_clkin2_d)<=2 && (period_avg_clkin2_d_d-period_avg_clkin2_d)>=-2))
        period_avg_clkin2_d_stable <= 1;
      else 
        period_avg_clkin2_d_stable <=0;
    end
  end


  //
  // Add programmable deskew to inputs
  //
  always @(posedge CLKIN1_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_i <= 0;
    else
      period_avg_clkin1_d_stable_i <= period_avg_clkin1_d_stable;
  end

  always @(posedge CLKFB1_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin1_d_stable_f <= 0;
    else
      period_avg_clkin1_d_stable_f <= period_avg_clkin1_d_stable;
  end

  always @(posedge CLKIN2_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin2_d_stable_i <= 0;
    else
      period_avg_clkin2_d_stable_i <= period_avg_clkin2_d_stable;
  end

  always @(posedge CLKFB2_DESKEW_in or posedge rst_in_o) begin
    if(rst_in_o)
      period_avg_clkin2_d_stable_f <= 0;
    else
      period_avg_clkin2_d_stable_f <= period_avg_clkin2_d_stable;
  end

  always @(CLKIN1_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_i) 
      clkin1_deskew_in_dly <=  #clkin1_deskew_prg_dly CLKIN1_DESKEW_in;
    else
      clkin1_deskew_in_dly <=  0;
  end

  always @(CLKFB1_DESKEW_in) begin
    if(period_avg_clkin1_d_stable_f) 
      clkfb1_deskew_in_dly <=  #clkfb1_deskew_prg_dly CLKFB1_DESKEW_in;
    else
      clkfb1_deskew_in_dly <=  0;
    end
  
  always @(CLKIN2_DESKEW_in) begin
    if(period_avg_clkin2_d_stable_i)
      clkin2_deskew_in_dly <=  #clkin2_deskew_prg_dly CLKIN2_DESKEW_in;
    else
      clkin2_deskew_in_dly <=  0;
    end

  always @(CLKFB2_DESKEW_in) begin
    if(period_avg_clkin2_d_stable_f) 
      clkfb2_deskew_in_dly <=  #clkfb2_deskew_prg_dly CLKFB2_DESKEW_in;
    else
      clkfb2_deskew_in_dly <=  0;
  end

  always @(posedge clkin1_deskew_in_dly or posedge rst_int or posedge ps_deskew1_rst) begin
    if (rst_int ||  ps_deskew1_rst)
      delay_edge_d1  <= 0;
    else if (~d1_delay_found || ps_deskew1_detected ) 
      delay_edge_d1 <= $time;
  end

  always @(negedge clkfb1_deskew_in_dly or negedge d1_delay_found_tmp)
    d1_delay_found <= d1_delay_found_tmp;

  always @(negedge clkfb1_deskew_in_dly or negedge ps_deskew1_delay_found_tmp )
    ps_deskew1_delay_found <= ps_deskew1_delay_found_tmp;

  
  always @(posedge clkfb1_deskew_in_dly or posedge rst_int or posedge ps_deskew1_det_rst)
    if (dig_deskew_en1 == 0 || rst_int==1 || LOCKED_FB_out==0) begin
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

  always @( posedge clkin2_deskew_in_dly or posedge rst_int or posedge ps_deskew2_rst)
    if (rst_int||  ps_deskew2_rst)
      delay_edge_d2  <= 0;
    else if (~d2_delay_found || ps_deskew2_detected)
      delay_edge_d2 <= $time;

  always @(negedge clkfb2_deskew_in_dly or negedge d2_delay_found_tmp)
       d2_delay_found <= d2_delay_found_tmp;

  always @(negedge clkfb2_deskew_in_dly or negedge ps_deskew2_delay_found_tmp )
    ps_deskew2_delay_found <= ps_deskew2_delay_found_tmp;

  always @(posedge clkfb2_deskew_in_dly or posedge rst_int or posedge ps_deskew2_det_rst)
    if (dig_deskew_en2 == 0 || rst_int==1 || LOCKED_FB_out==0) begin
      fb_d2_det_delay <= 0;
      d2_delay_found_tmp <=  1'b0;
      ps_deskew2_delay_found_tmp    <= 1'b0;
    end else if(ps_deskew2_det_rst) begin
      d2_delay_found_tmp <=  1'b0;
      ps_deskew2_delay_found_tmp    <= 1'b0;
    end else if (d2_delay_found_tmp == 1'b0 || (ps_deskew2_detected && ~ps_deskew2_delay_found_tmp)) begin
      if ( delay_edge_d2 != 0) begin
        fb_d2_det_delay             <= fb_d2_det_delay + ($time - delay_edge_d2);
        d2_delay_found_tmp <=  1'b1;
      if(ps_deskew2_detected && ~ps_deskew2_delay_found_tmp )
        ps_deskew2_delay_found_tmp  <= 1'b1;
      else 
        ps_deskew2_delay_found_tmp  <= 1'b0;
      end 
    end
    else if (ps_deskew2_delay_found_tmp && ~ps_deskew_lock)
      ps_deskew2_delay_found_tmp  <= 1'b0;


    always @(posedge d1_delay_found or posedge d2_delay_found or posedge rst_in_o) begin
      if(rst_in_o==1) begin
        pd1_applied_delay = 0;
        pd2_applied_delay = 0;
        pd1_clk0_applied_det_delay = 0;
        pd1_clk1_applied_det_delay = 0;
        pd1_clk2_applied_det_delay = 0;
        pd1_clk3_applied_det_delay = 0;
        pd2_clk0_applied_det_delay = 0;
        pd2_clk1_applied_det_delay = 0;
        pd2_clk2_applied_det_delay = 0;
        pd2_clk3_applied_det_delay = 0;
      end
      else begin
        if(dig_deskew_en1 && d1_delay_found) begin
          pd1_applied_delay = 0;
          calc_dly_to_apply(fb_d1_det_delay,clk0_div,pd1_clk0_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk1_div,pd1_clk1_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk2_div,pd1_clk2_applied_det_delay,1);
          calc_dly_to_apply(fb_d1_det_delay,clk3_div,pd1_clk3_applied_det_delay,1);
        end
        if(dig_deskew_en2 && d2_delay_found) begin
          pd2_applied_delay = 0;
          calc_dly_to_apply(fb_d2_det_delay,clk0_div,pd2_clk0_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk1_div,pd2_clk1_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk2_div,pd2_clk2_applied_det_delay,0);
          calc_dly_to_apply(fb_d2_det_delay,clk3_div,pd2_clk3_applied_det_delay,0);
        end
      end
    end

    always @(posedge d1_delay_found or posedge rst_int) begin
      if(rst_int)
        pd1_locked = 0;
      else begin
        #1;
        #pd1_applied_delay;
        repeat(4) @(posedge clkfb1_deskew_in_dly);
        pd1_locked = 1;
      end
    end
  
    always @(posedge d2_delay_found or posedge rst_int) begin
      if(rst_int)
        pd2_locked = 0;
      else begin
        #1;
        #pd2_applied_delay;
        repeat(4) @(posedge clkfb2_deskew_in_dly);
        pd2_locked = 1;
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
          if(PSEN_in && (dig_deskew_en1 || dig_deskew_en2))
            ps_deskew_state_next <= ST_PSDK_LOCK;
        ST_PSDK_LOCK:
          if(dig_deskew_en1 && dig_deskew_en2) begin
            if (ps_deskew1_delay_found && ps_deskew2_delay_found)
              ps_deskew_state_next <= ST_PSDK_IDLE;
            else if(ps_deskew1_delay_found )
            ps_deskew_state_next <= ST_PSDK_RLOCK1;
            else if (ps_deskew2_delay_found)
            ps_deskew_state_next <= ST_PSDK_RLOCK2;
          end
          else if (ps_deskew1_delay_found || ps_deskew2_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
        ST_PSDK_RLOCK1:
          if (ps_deskew2_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
        ST_PSDK_RLOCK2:
          if (ps_deskew1_delay_found)
            ps_deskew_state_next <= ST_PSDK_IDLE;
      endcase
    end

    assign ps_deskew_lock = (ps_deskew_state==ST_PSDK_IDLE)? 0 :1;


    always @(posedge ps_deskew_lock or posedge pll_unlock or posedge rst_in_o) begin
      if(rst_in_o)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (pll_unlock)
        ps_deskew_stop_upd_avg <= 1'b0;
      else if (ps_deskew_lock)
        ps_deskew_stop_upd_avg <= 1'b1;
        
    end
    
  //
  // SLIP DETECTION
  //

  always @(posedge clkpll or posedge rst_int) begin
    if(rst_int) 
      slip_avg_in_cnt <=0;
    else if(LOCKED_FB_out && slip_avg_in_cnt<6) begin
      slip_avg_in_cnt <= slip_avg_in_cnt +1;
    end
  end
  
  assign slip_avg_rdy = (slip_avg_in_cnt==6);
  
  always @(posedge slip_avg_rdy or posedge rst_int) begin
    if(rst_int) 
      period_clkin_at_lock   <= 0;
    else if(LOCKED_FB_out) 
      period_clkin_at_lock   <= period_avg;
  end

  assign  slip = slip_clkin;

  always @(posedge clkpll  or posedge rst_int) begin
    if (rst_int) begin
      slip_clkin <= 1'b0;
      slip_warn_displayed_clkin <=1'b0;
    end
    else begin
      if(slip_det_en) begin
        if((!LOCKED_FB_out && !slip) || period_clkin_at_lock==0)
          slip_clkin <= 1'b0;
        else if((period_avg > ((1.0+SLIP_TOLERANCE)*$itor(period_clkin_at_lock) )) || 
                (period_avg < ((1.0-SLIP_TOLERANCE)*$itor(period_clkin_at_lock) ))  ) begin
          slip_clkin <= 1'b1;
          if(~slip_warn_displayed_clkin) begin
          $display("Warning: [Unisim %s-31] CLKIN has slipped at time %0t. Instance %0m. \n\
              Only %0d%% tolerance is allowed CLKIN period is now %0d ps. XPLL might need a reset and a change in setup to lock again.",
              MODULE_NAME, $time, (SLIP_TOLERANCE*100), clkin_period[0] );
            slip_warn_displayed_clkin <= 1'b1;
          end

        end
      end
      else
        slip_clkin <= 1'b0;
    end
  end


// -----------------------------------------------------------
// ----     TASKS --------------------------------------------
// -----------------------------------------------------------

task ht_calc; 
  input  integer   div;
  input real       duty;
  input reg  [7:0] dt; 
  input reg        start_h;
  output integer   cnt_ht;
  output integer   cnt_max;
  output reg [8:0] dt_int;

begin

  cnt_ht = 2*div*duty;
  cnt_max = 2*div - 1;
  dt_int  = dt*2 + start_h;
  
end
endtask //ht_calc

task mc_to_attr;
    input reg [160:1] clkout_name;

    input reg         prediv2;
    input  reg [4:0]  pi;
    input  reg [7:0]  dt;
    input  reg [7:0]  ht;
    input  reg [7:0]  lt;
    input  reg        edg;  // edge. 
    input  reg        p5_fedge;
    input  reg        p5_en;
    input  reg        start_h;
    
    output integer    div;
    output real       phase;
    output real       duty;

begin
  
  if ((ht + lt + edg) == 0)
    div = $rtoi((prediv2 +1) * (1 + $itor(prediv2*p5_en)/2.0 ));
  else 
    div = $rtoi((prediv2 +1) *(ht + lt + edg + $itor(prediv2*p5_en)/2.0 ));

  if (div<=2)
    duty = 0.5;
  else
    duty =  ($itor(ht) + ($itor(edg)/2.0) + ($itor(prediv2*p5_fedge)/4.0))
           / $itor(ht + lt + edg + $itor(prediv2*p5_en)/2.0); 

  phase = 360.0 * ($itor(dt + prediv2*start_h*0.5) * (1+prediv2) + $itor(pi)/pi_res) 
          / $itor(div); 

  //$display("X5PLL %s mc_to_attr calculates prediv2= %0d, pi=%0d, dt=%0d, ht=%0d, lt=%0d, edg=%0d, p5_fedge=%0d, p5_en=%0d, start_h=%0d at %0t",
  //  clkout_name, prediv2,pi,d, ht, lt, edg, p5_fedge, p5_en, start_h, $time);
  
end

endtask //mc_to_attr

task mc_to_attr_fbout;
  input  reg [7:0]  dt;
  input  reg [7:0]  ht;
  input  reg [7:0]  lt;
  input  reg        edg;

  output integer    fbout_mult; //div
  output real       phase;

begin

  if ((ht + lt + edg) == 0)
    fbout_mult = 1;
  else
    fbout_mult = ht + lt + edg;
  
  phase = 360.0 * $itor(dt) / $itor(fbout_mult) ; 

end
endtask // mc_to_attr_fbout

task mc_to_attr_div;
  input  reg [7:0]  ht;
  input  reg [7:0]  lt;
  input  reg        edg;

  output integer    div;

begin

  if ((ht + lt + edg) == 0)
    div = 1;
  else
    div = ht + lt + edg;

end
endtask

task attr_to_mc;
    input reg [160:1]       clkout_name;
    input integer           div;
    input real              phase;
    input real              duty;
    input reg               prediv2;

    output reg [4:0] pi; // Interpolator control
    output reg       edg;  // edge.
    output reg [7:0] dt; //output counter delay setting
    output reg [7:0] ht; //high time
    output reg [7:0] lt; //low time
    output reg       p5_fedge;
    output reg       p5_en;
    output reg       start_h;

    real dt_rl;
    real pi_rl;
    //reg [9:0] ht_int; //high time internal
    integer  val_edge;

begin

  start_h = 0;
  p5_en = 0;
  p5_fedge = 0; 
  val_edge = 0;

  dt_rl = 1.0*div*(phase/360.0); //Put phase in terms of decimal number of VCO clock cycles.
  get_int_frac_parts(dt_rl, 8, 8, dt, pi );
  pi=pi*4;
  
  get_int_frac_parts((duty*div), 2, 8, ht, edg);
  //ht = ht_int;

  
  if(prediv2==1'b1) begin
    get_int_frac_parts((duty*div/2.0), 4, 8, ht, val_edge);
    edg       = val_edge/2;
    p5_fedge  = val_edge%2;
    start_h   = dt%2;
    p5_en     = div%2;
    div       = div/2; // notes: change nDiv value to divided by 2.
    dt        = dt/2;
  end

  // The following two conditional stmts are for when the nearest 0.5 value 
  // is not allowed because of h/w limitations
  // HT cannot be 0
  if (ht == 0 && div>1) begin
    ht       = 1;
    edg      = 0;
    p5_fedge = 0;
  end

  // HT and edge cannot be equal to DIVIDE because then LT would need to be 0, fix this 
  if (ht + edg == div) begin
    ht       = div-1;
    edg      = 0; 
    p5_fedge = 0;
   
    if(prediv2==1'b1) begin
      if(div==1 && p5_en==1 && duty>=0.5 ) p5_fedge = 1;
      if(div==1 && p5_en==0 && duty>=0.75) p5_fedge = 1;
    
      if(div>1 && p5_en==1 && duty>=((ht+0.25)/(div+0.5))) p5_fedge = 1;
      if(div>1 && p5_en==0 && duty>=((ht+0.25)/(div+0.0))) p5_fedge = 1;
    end
     
  end

  if(div==1)  begin
     ht  = 0;
     edg = 0;
     lt  = 0;
   end 
   else 
     lt = div - ht - edg;
  
  //$display("X5PLL %s attr_to_mc calculates prediv2= %0d, pi=%0d, dt=%0d, ht=%0d, lt=%0d, edg=%0d, p5_fedge=%0d, p5_en=%0d, start_h=%0d at %0t",
  //  clkout_name, prediv2,pi,d, ht, lt, edg, p5_fedge, p5_en, start_h, $time);

         
end
endtask //attr_to_mc

task get_int_frac_parts;
  input real fDec;
  input integer nPrec;
  input integer nInt_size_in_bits;//8 if nInt is a [7:0] register
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

  //final correction for overflow
  if(nInt>=(2**nInt_size_in_bits)) begin
    nInt = (2**nInt_size_in_bits) - 1;
    nFrac= nPrec-1;
  end
end
endtask //get_int_frac_parts

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

task GetMultVal (
  input integer    fClkFbOutMultF, 
  //input integer    nBandwidth, 
  output reg [3:0] cp, 
  output reg [3:0] res, 
  output reg [1:0] lfhf
);
 begin
   //if ((nBandwidth == BANDWIDTH_HIGH) || (nBandwidth == BANDWIDTH_OPTIMIZED) || (nBandwidth == BANDWIDTH_LOW))
      lfhf = 2'd3;
      case (fClkFbOutMultF)
         4: begin
              cp = 4'd3; res = 4'd9; 
            end
         5: begin
              cp = 4'd3; res = 4'd14; 
            end
         6: begin
              cp = 4'd4; res = 4'd14;
            end
         7: begin
              cp = 4'd3; res = 4'd6;
            end
         8: begin
              cp = 4'd3; res = 4'd10;
            end
         9: begin
              cp = 4'd4; res = 4'd6;
            end
         10: begin
              cp = 4'd4; res = 4'd10;
            end
         11,12,13,14: begin
              cp = 4'd3; res = 4'd12;
            end
         15,16,17: begin
              cp = 4'd3; res = 4'd2;
            end
         18,19: begin
              cp = 4'd5; res = 4'd12;
            end
         20,21: begin
              cp = 4'd4; res = 4'd2;
            end
         22,23: begin
              cp = 4'd6; res = 4'd12;
            end
         24,25,26,27: begin
              cp = 4'd5; res = 4'd2;
            end
         28,29,30,31,32,33: begin
              cp = 4'd3; res = 4'd4;
            end
         34,35: begin
              cp = 4'd7; res = 4'd2;
            end
         36,37,38,39,40,41,42: begin
              cp = 4'd4; res = 4'd4;
            end
         43: begin
              cp = 4'd3; res = 4'd8;
            end
	 default:
	   begin
	      cp = 4'd4; res = 4'd2;
	   end
      endcase
 end 
endtask

task GetLockDetSettings (
  input integer   fClkFbOutMultF, 
  output reg[4:0] lock_ref_dly, 
  output reg[4:0] lock_fb_dly, 
  output reg[9:0] lock_cnt, 
  output reg[9:0] lock_sat_high, 
  output reg[9:0] unlock_cnt);
begin
  lock_sat_high = 10'd1001;
  unlock_cnt = 10'd1;
  case (fClkFbOutMultF) 
    4:
    begin
      lock_ref_dly = 8;
      lock_fb_dly = 8;
      lock_cnt = 1000;
    end
    5:
    begin
      lock_ref_dly = 11;
      lock_fb_dly = 11;
      lock_cnt = 1000;
    end
    6,7:
    begin
      lock_ref_dly = 14;
      lock_fb_dly = 14;
      lock_cnt = 1000;
    end
    8:
    begin
      lock_ref_dly = 17;
      lock_fb_dly = 17;
      lock_cnt = 1000;
    end
    9,10:
    begin
      lock_ref_dly = 19;
      lock_fb_dly = 19;
      lock_cnt = 1000;
    end
    11:
    begin
      lock_ref_dly = 22;
      lock_fb_dly = 22;
      lock_cnt = 1000;
    end
    12:
    begin
      lock_ref_dly = 25;
      lock_fb_dly = 25;
      lock_cnt = 1000;
    end
    13,14:
    begin
      lock_ref_dly = 28;
      lock_fb_dly = 28;
      lock_cnt = 1000;
    end
    15:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 900;
    end
    16,17:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 825;
    end
    18:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 750;
    end
    19,20:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 700;
    end
    21:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 650;
    end
    22,23:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 625;
    end
    24:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 575;
    end
    25:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 550;
    end
    26,27,28:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 525;
    end
    29,30:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 475;
    end
    31:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 450;
    end
    32,33:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 425;
    end
    34,35,36:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 400;
    end
    37:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 375;
    end
    38,39,40:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 350;
    end
    41,42,43:
    begin
      lock_ref_dly = 31;
      lock_fb_dly = 31;
      lock_cnt = 325;
    end
  endcase
end
endtask

task calc_dly_to_apply;
  input time        pd_delay;
  input reg [9:0]   clk_div;
  output time       pd1_clk_app_delay;
  input reg         pd_idx;

  real              clk_period;
  reg signed[63:0]  pd_dly_mod_clkp; // (pd_delay%clk_period)
  
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
  if(pd_idx==1)
    pd1_applied_delay = (pd1_applied_delay>pd1_clk_app_delay)? pd1_applied_delay : pd1_clk_app_delay;
  else
    pd2_applied_delay = (pd2_applied_delay>pd1_clk_app_delay)? pd2_applied_delay : pd1_clk_app_delay;
end
endtask



// end behavioral model

`ifndef XIL_XECLIB
  // begin timing section
  specify
    (CLKIN => CLKOUT0) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT1) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT2) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUT3) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUTPHY_0) = (0:0:0, 0:0:0);
    (CLKIN => CLKOUTPHY_90) = (0:0:0, 0:0:0);
    (PSCLK => PSDONE) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (negedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge PWRDWN => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED1_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED2_DESKEW +: 0)) = (100:100:100, 100:100:100);
    (posedge RST => (LOCKED_FB +: 0)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLKFB1_DESKEW, 0:0:0, notifier);
    $period (negedge CLKFB2_DESKEW, 0:0:0, notifier);
    $period (negedge CLKIN, 0:0:0, notifier);
    $period (negedge CLKIN1_DESKEW, 0:0:0, notifier);
    $period (negedge CLKIN2_DESKEW, 0:0:0, notifier);
    $period (negedge CLKOUT0, 0:0:0, notifier);
    $period (negedge CLKOUT1, 0:0:0, notifier);
    $period (negedge CLKOUT2, 0:0:0, notifier);
    $period (negedge CLKOUT3, 0:0:0, notifier);
    $period (negedge CLKOUTPHY_0, 0:0:0, notifier);
    $period (negedge CLKOUTPHY_90, 0:0:0, notifier);
    $period (negedge DCLK, 0:0:0, notifier);
    $period (negedge PSCLK, 0:0:0, notifier);
    $period (posedge CLKFB1_DESKEW, 0:0:0, notifier);
    $period (posedge CLKFB2_DESKEW, 0:0:0, notifier);
    $period (posedge CLKIN, 0:0:0, notifier);
    $period (posedge CLKIN1_DESKEW, 0:0:0, notifier);
    $period (posedge CLKIN2_DESKEW, 0:0:0, notifier);
    $period (posedge CLKOUT0, 0:0:0, notifier);
    $period (posedge CLKOUT1, 0:0:0, notifier);
    $period (posedge CLKOUT2, 0:0:0, notifier);
    $period (posedge CLKOUT3, 0:0:0, notifier);
    $period (posedge CLKOUTPHY_0, 0:0:0, notifier);
    $period (posedge CLKOUTPHY_90, 0:0:0, notifier);
    $period (posedge DCLK, 0:0:0, notifier);
    $period (posedge PSCLK, 0:0:0, notifier);
    $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $width (negedge CLKFB1_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKFB2_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKIN, 0:0:0, 0, notifier);
    $width (negedge CLKIN1_DESKEW, 0:0:0, 0, notifier);
    $width (negedge CLKIN2_DESKEW, 0:0:0, 0, notifier);
    $width (negedge DCLK, 0:0:0, 0, notifier);
    $width (negedge PSCLK, 0:0:0, 0, notifier);
    $width (negedge PWRDWN, 0:0:0, 0, notifier);
    $width (negedge RST, 0:0:0, 0, notifier);
    $width (posedge CLKFB1_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKFB2_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKIN, 0:0:0, 0, notifier);
    $width (posedge CLKIN1_DESKEW, 0:0:0, 0, notifier);
    $width (posedge CLKIN2_DESKEW, 0:0:0, 0, notifier);
    $width (posedge DCLK, 0:0:0, 0, notifier);
    $width (posedge PSCLK, 0:0:0, 0, notifier);
    $width (posedge PWRDWN, 0:0:0, 0, notifier);
    $width (posedge RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
endmodule

`endcelldefine
