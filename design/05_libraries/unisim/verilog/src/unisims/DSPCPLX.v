///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        58-bit Multi-Functional Complex Arithmetic Block
// /___/   /\      Filename    : DSPCPLX.v
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

module DSPCPLX #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ACASCREG_IM = 1,
  parameter integer ACASCREG_RE = 1,
  parameter integer ADREG = 1,
  parameter integer ALUMODEREG_IM = 1,
  parameter integer ALUMODEREG_RE = 1,
  parameter integer AREG_IM = 2,
  parameter integer AREG_RE = 2,
  parameter AUTORESET_PATDET_IM = "NO_RESET",
  parameter AUTORESET_PATDET_RE = "NO_RESET",
  parameter AUTORESET_PRIORITY_IM = "RESET",
  parameter AUTORESET_PRIORITY_RE = "RESET",
  parameter A_INPUT_IM = "DIRECT",
  parameter A_INPUT_RE = "DIRECT",
  parameter integer BCASCREG_IM = 1,
  parameter integer BCASCREG_RE = 1,
  parameter integer BREG_IM = 2,
  parameter integer BREG_RE = 2,
  parameter B_INPUT_IM = "DIRECT",
  parameter B_INPUT_RE = "DIRECT",
  parameter integer CARRYINREG_IM = 1,
  parameter integer CARRYINREG_RE = 1,
  parameter integer CARRYINSELREG_IM = 1,
  parameter integer CARRYINSELREG_RE = 1,
  parameter integer CONJUGATEREG_A = 1,
  parameter integer CONJUGATEREG_B = 1,
  parameter integer CREG_IM = 1,
  parameter integer CREG_RE = 1,
  parameter [3:0] IS_ALUMODE_IM_INVERTED = 4'b0000,
  parameter [3:0] IS_ALUMODE_RE_INVERTED = 4'b0000,
  parameter [0:0] IS_ASYNC_RST_INVERTED = 1'b0,
  parameter [0:0] IS_CARRYIN_IM_INVERTED = 1'b0,
  parameter [0:0] IS_CARRYIN_RE_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_CONJUGATE_A_INVERTED = 1'b0,
  parameter [0:0] IS_CONJUGATE_B_INVERTED = 1'b0,
  parameter [8:0] IS_OPMODE_IM_INVERTED = 9'b000000000,
  parameter [8:0] IS_OPMODE_RE_INVERTED = 9'b000000000,
  parameter [0:0] IS_RSTAD_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALLCARRYIN_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALLCARRYIN_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALUMODE_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALUMODE_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTA_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTA_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTB_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTB_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTCONJUGATE_A_INVERTED = 1'b0,
  parameter [0:0] IS_RSTCONJUGATE_B_INVERTED = 1'b0,
  parameter [0:0] IS_RSTCTRL_IM_INVERTED= 1'b0,
  parameter [0:0] IS_RSTCTRL_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTC_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTC_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTM_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTM_RE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTP_IM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTP_RE_INVERTED = 1'b0,
  parameter [57:0] MASK_IM = 58'h0FFFFFFFFFFFFFF,
  parameter [57:0] MASK_RE = 58'h0FFFFFFFFFFFFFF,
  parameter integer MREG_IM = 1,
  parameter integer MREG_RE = 1,
  parameter integer OPMODEREG_IM = 1,
  parameter integer OPMODEREG_RE = 1,
  parameter [57:0] PATTERN_IM = 58'h000000000000000,
  parameter [57:0] PATTERN_RE = 58'h000000000000000,
  parameter integer PREG_IM = 1,
  parameter integer PREG_RE = 1,
  parameter RESET_MODE = "SYNC",
  parameter [57:0] RND_IM = 58'h000000000000000,
  parameter [57:0] RND_RE = 58'h000000000000000,
  parameter SEL_MASK_IM = "MASK",
  parameter SEL_MASK_RE = "MASK",
  parameter SEL_PATTERN_IM = "PATTERN",
  parameter SEL_PATTERN_RE = "PATTERN",
  parameter USE_PATTERN_DETECT_IM = "NO_PATDET",
  parameter USE_PATTERN_DETECT_RE = "NO_PATDET"
)(
  output [17:0] ACOUT_IM,
  output [17:0] ACOUT_RE,
  output [17:0] BCOUT_IM,
  output [17:0] BCOUT_RE,
  output CARRYCASCOUT_IM,
  output CARRYCASCOUT_RE,
  output CARRYOUT_IM,
  output CARRYOUT_RE,
  output MULTSIGNOUT_IM,
  output MULTSIGNOUT_RE,
  output OVERFLOW_IM,
  output OVERFLOW_RE,
  output PATTERNBDETECT_IM,
  output PATTERNBDETECT_RE,
  output PATTERNDETECT_IM,
  output PATTERNDETECT_RE,
  output [57:0] PCOUT_IM,
  output [57:0] PCOUT_RE,
  output [57:0] P_IM,
  output [57:0] P_RE,
  output UNDERFLOW_IM,
  output UNDERFLOW_RE,

  input [17:0] ACIN_IM,
  input [17:0] ACIN_RE,
  input [3:0] ALUMODE_IM,
  input [3:0] ALUMODE_RE,
  input ASYNC_RST,
  input [17:0] A_IM,
  input [17:0] A_RE,
  input [17:0] BCIN_IM,
  input [17:0] BCIN_RE,
  input [17:0] B_IM,
  input [17:0] B_RE,
  input CARRYCASCIN_IM,
  input CARRYCASCIN_RE,
  input [2:0] CARRYINSEL_IM,
  input [2:0] CARRYINSEL_RE,
  input CARRYIN_IM,
  input CARRYIN_RE,
  input CEA1_IM,
  input CEA1_RE,
  input CEA2_IM,
  input CEA2_RE,
  input CEAD,
  input CEALUMODE_IM,
  input CEALUMODE_RE,
  input CEB1_IM,
  input CEB1_RE,
  input CEB2_IM,
  input CEB2_RE,
  input CECARRYIN_IM,
  input CECARRYIN_RE,
  input CECONJUGATE_A,
  input CECONJUGATE_B,
  input CECTRL_IM,
  input CECTRL_RE,
  input CEC_IM,
  input CEC_RE,
  input CEM_IM,
  input CEM_RE,
  input CEP_IM,
  input CEP_RE,
  input CLK,
  input CONJUGATE_A,
  input CONJUGATE_B,
  input [57:0] C_IM,
  input [57:0] C_RE,
  input MULTSIGNIN_IM,
  input MULTSIGNIN_RE,
  input [8:0] OPMODE_IM,
  input [8:0] OPMODE_RE,
  input [57:0] PCIN_IM,
  input [57:0] PCIN_RE,
  input RSTAD,
  input RSTALLCARRYIN_IM,
  input RSTALLCARRYIN_RE,
  input RSTALUMODE_IM,
  input RSTALUMODE_RE,
  input RSTA_IM,
  input RSTA_RE,
  input RSTB_IM,
  input RSTB_RE,
  input RSTCONJUGATE_A,
  input RSTCONJUGATE_B,
  input RSTCTRL_IM,
  input RSTCTRL_RE,
  input RSTC_IM,
  input RSTC_RE,
  input RSTM_IM,
  input RSTM_RE,
  input RSTP_IM,
  input RSTP_RE
);
  
// define constants
  localparam MODULE_NAME = "DSPCPLX";

// Parameter encodings and registers
  localparam AUTORESET_PATDET_IM_NO_RESET = 0;
  localparam AUTORESET_PATDET_IM_RESET_MATCH = 1;
  localparam AUTORESET_PATDET_IM_RESET_NOT_MATCH = 2;
  localparam AUTORESET_PATDET_RE_NO_RESET = 0;
  localparam AUTORESET_PATDET_RE_RESET_MATCH = 1;
  localparam AUTORESET_PATDET_RE_RESET_NOT_MATCH = 2;
  localparam AUTORESET_PRIORITY_IM_CEP = 1;
  localparam AUTORESET_PRIORITY_IM_RESET = 0;
  localparam AUTORESET_PRIORITY_RE_CEP = 1;
  localparam AUTORESET_PRIORITY_RE_RESET = 0;
  localparam A_INPUT_IM_CASCADE = 1;
  localparam A_INPUT_IM_DIRECT = 0;
  localparam A_INPUT_RE_CASCADE = 1;
  localparam A_INPUT_RE_DIRECT = 0;
  localparam B_INPUT_IM_CASCADE = 1;
  localparam B_INPUT_IM_DIRECT = 0;
  localparam B_INPUT_RE_CASCADE = 1;
  localparam B_INPUT_RE_DIRECT = 0;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam SEL_MASK_IM_C = 1;
  localparam SEL_MASK_IM_MASK = 0;
  localparam SEL_MASK_IM_ROUNDING_MODE1 = 2;
  localparam SEL_MASK_IM_ROUNDING_MODE2 = 3;
  localparam SEL_MASK_RE_C = 1;
  localparam SEL_MASK_RE_MASK = 0;
  localparam SEL_MASK_RE_ROUNDING_MODE1 = 2;
  localparam SEL_MASK_RE_ROUNDING_MODE2 = 3;
  localparam SEL_PATTERN_IM_C = 1;
  localparam SEL_PATTERN_IM_PATTERN = 0;
  localparam SEL_PATTERN_RE_C = 1;
  localparam SEL_PATTERN_RE_PATTERN = 0;
  localparam USE_PATTERN_DETECT_IM_NO_PATDET = 0;
  localparam USE_PATTERN_DETECT_IM_PATDET = 1;
  localparam USE_PATTERN_DETECT_RE_NO_PATDET = 0;
  localparam USE_PATTERN_DETECT_RE_PATDET = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSPCPLX_dr.v"
`else
  reg [31:0] ACASCREG_IM_REG = ACASCREG_IM;
  reg [31:0] ACASCREG_RE_REG = ACASCREG_RE;
  reg [31:0] ADREG_REG = ADREG;
  reg [31:0] ALUMODEREG_IM_REG = ALUMODEREG_IM;
  reg [31:0] ALUMODEREG_RE_REG = ALUMODEREG_RE;
  reg [31:0] AREG_IM_REG = AREG_IM;
  reg [31:0] AREG_RE_REG = AREG_RE;
  reg [120:1] AUTORESET_PATDET_IM_REG = AUTORESET_PATDET_IM;
  reg [120:1] AUTORESET_PATDET_RE_REG = AUTORESET_PATDET_RE;
  reg [40:1] AUTORESET_PRIORITY_IM_REG = AUTORESET_PRIORITY_IM;
  reg [40:1] AUTORESET_PRIORITY_RE_REG = AUTORESET_PRIORITY_RE;
  reg [56:1] A_INPUT_IM_REG = A_INPUT_IM;
  reg [56:1] A_INPUT_RE_REG = A_INPUT_RE;
  reg [31:0] BCASCREG_IM_REG = BCASCREG_IM;
  reg [31:0] BCASCREG_RE_REG = BCASCREG_RE;
  reg [31:0] BREG_IM_REG = BREG_IM;
  reg [31:0] BREG_RE_REG = BREG_RE;
  reg [56:1] B_INPUT_IM_REG = B_INPUT_IM;
  reg [56:1] B_INPUT_RE_REG = B_INPUT_RE;
  reg [31:0] CARRYINREG_IM_REG = CARRYINREG_IM;
  reg [31:0] CARRYINREG_RE_REG = CARRYINREG_RE;
  reg [31:0] CARRYINSELREG_IM_REG = CARRYINSELREG_IM;
  reg [31:0] CARRYINSELREG_RE_REG = CARRYINSELREG_RE;
  reg [31:0] CONJUGATEREG_A_REG = CONJUGATEREG_A;
  reg [31:0] CONJUGATEREG_B_REG = CONJUGATEREG_B;
  reg [31:0] CREG_IM_REG = CREG_IM;
  reg [31:0] CREG_RE_REG = CREG_RE;
  reg [3:0] IS_ALUMODE_IM_INVERTED_REG = IS_ALUMODE_IM_INVERTED;
  reg [3:0] IS_ALUMODE_RE_INVERTED_REG = IS_ALUMODE_RE_INVERTED;
  reg [0:0] IS_ASYNC_RST_INVERTED_REG = IS_ASYNC_RST_INVERTED;
  reg [0:0] IS_CARRYIN_IM_INVERTED_REG = IS_CARRYIN_IM_INVERTED;
  reg [0:0] IS_CARRYIN_RE_INVERTED_REG = IS_CARRYIN_RE_INVERTED;
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [0:0] IS_CONJUGATE_A_INVERTED_REG = IS_CONJUGATE_A_INVERTED;
  reg [0:0] IS_CONJUGATE_B_INVERTED_REG = IS_CONJUGATE_B_INVERTED;
  reg [8:0] IS_OPMODE_IM_INVERTED_REG = IS_OPMODE_IM_INVERTED;
  reg [8:0] IS_OPMODE_RE_INVERTED_REG = IS_OPMODE_RE_INVERTED;
  reg [0:0] IS_RSTAD_INVERTED_REG = IS_RSTAD_INVERTED;
  reg [0:0] IS_RSTALLCARRYIN_IM_INVERTED_REG = IS_RSTALLCARRYIN_IM_INVERTED;
  reg [0:0] IS_RSTALLCARRYIN_RE_INVERTED_REG = IS_RSTALLCARRYIN_RE_INVERTED;
  reg [0:0] IS_RSTALUMODE_IM_INVERTED_REG = IS_RSTALUMODE_IM_INVERTED;
  reg [0:0] IS_RSTALUMODE_RE_INVERTED_REG = IS_RSTALUMODE_RE_INVERTED;
  reg [0:0] IS_RSTA_IM_INVERTED_REG = IS_RSTA_IM_INVERTED;
  reg [0:0] IS_RSTA_RE_INVERTED_REG = IS_RSTA_RE_INVERTED;
  reg [0:0] IS_RSTB_IM_INVERTED_REG = IS_RSTB_IM_INVERTED;
  reg [0:0] IS_RSTB_RE_INVERTED_REG = IS_RSTB_RE_INVERTED;
  reg [0:0] IS_RSTCONJUGATE_A_INVERTED_REG = IS_RSTCONJUGATE_A_INVERTED;
  reg [0:0] IS_RSTCONJUGATE_B_INVERTED_REG = IS_RSTCONJUGATE_B_INVERTED;
  reg [0:0] IS_RSTCTRL_IM_INVERTED_REG = IS_RSTCTRL_IM_INVERTED;
  reg [0:0] IS_RSTCTRL_RE_INVERTED_REG = IS_RSTCTRL_RE_INVERTED;
  reg [0:0] IS_RSTC_IM_INVERTED_REG = IS_RSTC_IM_INVERTED;
  reg [0:0] IS_RSTC_RE_INVERTED_REG = IS_RSTC_RE_INVERTED;
  reg [0:0] IS_RSTM_IM_INVERTED_REG = IS_RSTM_IM_INVERTED;
  reg [0:0] IS_RSTM_RE_INVERTED_REG = IS_RSTM_RE_INVERTED;
  reg [0:0] IS_RSTP_IM_INVERTED_REG = IS_RSTP_IM_INVERTED;
  reg [0:0] IS_RSTP_RE_INVERTED_REG = IS_RSTP_RE_INVERTED;
  reg [57:0] MASK_IM_REG = MASK_IM;
  reg [57:0] MASK_RE_REG = MASK_RE;
  reg [31:0] MREG_IM_REG = MREG_IM;
  reg [31:0] MREG_RE_REG = MREG_RE;
  reg [31:0] OPMODEREG_IM_REG = OPMODEREG_IM;
  reg [31:0] OPMODEREG_RE_REG = OPMODEREG_RE;
  reg [57:0] PATTERN_IM_REG = PATTERN_IM;
  reg [57:0] PATTERN_RE_REG = PATTERN_RE;
  reg [31:0] PREG_IM_REG = PREG_IM;
  reg [31:0] PREG_RE_REG = PREG_RE;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [57:0] RND_IM_REG = RND_IM;
  reg [57:0] RND_RE_REG = RND_RE;
  reg [112:1] SEL_MASK_IM_REG = SEL_MASK_IM;
  reg [112:1] SEL_MASK_RE_REG = SEL_MASK_RE;
  reg [56:1] SEL_PATTERN_IM_REG = SEL_PATTERN_IM;
  reg [56:1] SEL_PATTERN_RE_REG = SEL_PATTERN_RE;
  reg [72:1] USE_PATTERN_DETECT_IM_REG = USE_PATTERN_DETECT_IM;
  reg [72:1] USE_PATTERN_DETECT_RE_REG = USE_PATTERN_DETECT_RE;
`endif

`ifdef XIL_XECLIB
  wire [1:0] ACASCREG_IM_BIN;
  wire [1:0] ACASCREG_RE_BIN;
  wire ADREG_BIN;
  wire ALUMODEREG_IM_BIN;
  wire ALUMODEREG_RE_BIN;
  wire [1:0] AREG_IM_BIN;
  wire [1:0] AREG_RE_BIN;
  wire [1:0] AUTORESET_PATDET_IM_BIN;
  wire [1:0] AUTORESET_PATDET_RE_BIN;
  wire AUTORESET_PRIORITY_IM_BIN;
  wire AUTORESET_PRIORITY_RE_BIN;
  wire A_INPUT_IM_BIN;
  wire A_INPUT_RE_BIN;
  wire [1:0] BCASCREG_IM_BIN;
  wire [1:0] BCASCREG_RE_BIN;
  wire [1:0] BREG_IM_BIN;
  wire [1:0] BREG_RE_BIN;
  wire B_INPUT_IM_BIN;
  wire B_INPUT_RE_BIN;
  wire CARRYINREG_IM_BIN;
  wire CARRYINREG_RE_BIN;
  wire CARRYINSELREG_IM_BIN;
  wire CARRYINSELREG_RE_BIN;
  wire CONJUGATEREG_A_BIN;
  wire CONJUGATEREG_B_BIN;
  wire CREG_IM_BIN;
  wire CREG_RE_BIN;
  wire MREG_IM_BIN;
  wire MREG_RE_BIN;
  wire OPMODEREG_IM_BIN;
  wire OPMODEREG_RE_BIN;
  wire PREG_IM_BIN;
  wire PREG_RE_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] SEL_MASK_IM_BIN;
  wire [1:0] SEL_MASK_RE_BIN;
  wire SEL_PATTERN_IM_BIN;
  wire SEL_PATTERN_RE_BIN;
  wire USE_PATTERN_DETECT_IM_BIN;
  wire USE_PATTERN_DETECT_RE_BIN;
`else
  reg [1:0] ACASCREG_IM_BIN;
  reg [1:0] ACASCREG_RE_BIN;
  reg ADREG_BIN;
  reg ALUMODEREG_IM_BIN;
  reg ALUMODEREG_RE_BIN;
  reg [1:0] AREG_IM_BIN;
  reg [1:0] AREG_RE_BIN;
  reg [1:0] AUTORESET_PATDET_IM_BIN;
  reg [1:0] AUTORESET_PATDET_RE_BIN;
  reg AUTORESET_PRIORITY_IM_BIN;
  reg AUTORESET_PRIORITY_RE_BIN;
  reg A_INPUT_IM_BIN;
  reg A_INPUT_RE_BIN;
  reg [1:0] BCASCREG_IM_BIN;
  reg [1:0] BCASCREG_RE_BIN;
  reg [1:0] BREG_IM_BIN;
  reg [1:0] BREG_RE_BIN;
  reg B_INPUT_IM_BIN;
  reg B_INPUT_RE_BIN;
  reg CARRYINREG_IM_BIN;
  reg CARRYINREG_RE_BIN;
  reg CARRYINSELREG_IM_BIN;
  reg CARRYINSELREG_RE_BIN;
  reg CONJUGATEREG_A_BIN;
  reg CONJUGATEREG_B_BIN;
  reg CREG_IM_BIN;
  reg CREG_RE_BIN;
  reg MREG_IM_BIN;
  reg MREG_RE_BIN;
  reg OPMODEREG_IM_BIN;
  reg OPMODEREG_RE_BIN;
  reg PREG_IM_BIN;
  reg PREG_RE_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] SEL_MASK_IM_BIN;
  reg [1:0] SEL_MASK_RE_BIN;
  reg SEL_PATTERN_IM_BIN;
  reg SEL_PATTERN_RE_BIN;
  reg USE_PATTERN_DETECT_IM_BIN;
  reg USE_PATTERN_DETECT_RE_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CARRYCASCIN_IM_in;
  wire CARRYCASCIN_RE_in;
  wire CARRYIN_IM_in;
  wire CARRYIN_RE_in;
  wire CEA1_IM_in;
  wire CEA1_RE_in;
  wire CEA2_IM_in;
  wire CEA2_RE_in;
  wire CEAD_in;
  wire CEALUMODE_IM_in;
  wire CEALUMODE_RE_in;
  wire CEB1_IM_in;
  wire CEB1_RE_in;
  wire CEB2_IM_in;
  wire CEB2_RE_in;
  wire CECARRYIN_IM_in;
  wire CECARRYIN_RE_in;
  wire CECONJUGATE_A_in;
  wire CECONJUGATE_B_in;
  wire CECTRL_IM_in;
  wire CECTRL_RE_in;
  wire CEC_IM_in;
  wire CEC_RE_in;
  wire CEM_IM_in;
  wire CEM_RE_in;
  wire CEP_IM_in;
  wire CEP_RE_in;
  wire CLK_in;
  wire CONJUGATE_A_in;
  wire CONJUGATE_B_in;
  wire MULTSIGNIN_IM_in;
  wire MULTSIGNIN_RE_in;
  wire RSTAD_in;
  wire RSTALLCARRYIN_IM_in;
  wire RSTALLCARRYIN_RE_in;
  wire RSTALUMODE_IM_in;
  wire RSTALUMODE_RE_in;
  wire RSTA_IM_in;
  wire RSTA_RE_in;
  wire RSTB_IM_in;
  wire RSTB_RE_in;
  wire RSTCONJUGATE_A_in;
  wire RSTCONJUGATE_B_in;
  wire RSTCTRL_IM_in;
  wire RSTCTRL_RE_in;
  wire RSTC_IM_in;
  wire RSTC_RE_in;
  wire RSTM_IM_in;
  wire RSTM_RE_in;
  wire RSTP_IM_in;
  wire RSTP_RE_in;
  wire [17:0] ACIN_IM_in;
  wire [17:0] ACIN_RE_in;
  wire [17:0] A_IM_in;
  wire [17:0] A_RE_in;
  wire [17:0] BCIN_IM_in;
  wire [17:0] BCIN_RE_in;
  wire [17:0] B_IM_in;
  wire [17:0] B_RE_in;
  wire [2:0] CARRYINSEL_IM_in;
  wire [2:0] CARRYINSEL_RE_in;
  wire [3:0] ALUMODE_IM_in;
  wire [3:0] ALUMODE_RE_in;
  wire [57:0] C_IM_in;
  wire [57:0] C_RE_in;
  wire [57:0] PCIN_IM_in;
  wire [57:0] PCIN_RE_in;
  wire [8:0] OPMODE_IM_in;
  wire [8:0] OPMODE_RE_in;

  assign ACIN_IM_in = ACIN_IM;
  assign ACIN_RE_in = ACIN_RE;
  assign ALUMODE_IM_in[0] = (ALUMODE_IM[0] !== 1'bz) && (ALUMODE_IM[0] ^ IS_ALUMODE_IM_INVERTED_REG[0]); // rv 0
  assign ALUMODE_IM_in[1] = (ALUMODE_IM[1] !== 1'bz) && (ALUMODE_IM[1] ^ IS_ALUMODE_IM_INVERTED_REG[1]); // rv 0
  assign ALUMODE_IM_in[2] = (ALUMODE_IM[2] !== 1'bz) && (ALUMODE_IM[2] ^ IS_ALUMODE_IM_INVERTED_REG[2]); // rv 0
  assign ALUMODE_IM_in[3] = (ALUMODE_IM[3] !== 1'bz) && (ALUMODE_IM[3] ^ IS_ALUMODE_IM_INVERTED_REG[3]); // rv 0
  assign ALUMODE_RE_in[0] = (ALUMODE_RE[0] !== 1'bz) && (ALUMODE_RE[0] ^ IS_ALUMODE_RE_INVERTED_REG[0]); // rv 0
  assign ALUMODE_RE_in[1] = (ALUMODE_RE[1] !== 1'bz) && (ALUMODE_RE[1] ^ IS_ALUMODE_RE_INVERTED_REG[1]); // rv 0
  assign ALUMODE_RE_in[2] = (ALUMODE_RE[2] !== 1'bz) && (ALUMODE_RE[2] ^ IS_ALUMODE_RE_INVERTED_REG[2]); // rv 0
  assign ALUMODE_RE_in[3] = (ALUMODE_RE[3] !== 1'bz) && (ALUMODE_RE[3] ^ IS_ALUMODE_RE_INVERTED_REG[3]); // rv 0
  assign ASYNC_RST_in = (ASYNC_RST !== 1'bz) && (ASYNC_RST ^ IS_ASYNC_RST_INVERTED_REG); // rv 0
  assign A_IM_in[0] = (A_IM[0] === 1'bz) || A_IM[0]; // rv 1
  assign A_IM_in[10] = (A_IM[10] === 1'bz) || A_IM[10]; // rv 1
  assign A_IM_in[11] = (A_IM[11] === 1'bz) || A_IM[11]; // rv 1
  assign A_IM_in[12] = (A_IM[12] === 1'bz) || A_IM[12]; // rv 1
  assign A_IM_in[13] = (A_IM[13] === 1'bz) || A_IM[13]; // rv 1
  assign A_IM_in[14] = (A_IM[14] === 1'bz) || A_IM[14]; // rv 1
  assign A_IM_in[15] = (A_IM[15] === 1'bz) || A_IM[15]; // rv 1
  assign A_IM_in[16] = (A_IM[16] === 1'bz) || A_IM[16]; // rv 1
  assign A_IM_in[17] = (A_IM[17] === 1'bz) || A_IM[17]; // rv 1
  assign A_IM_in[1] = (A_IM[1] === 1'bz) || A_IM[1]; // rv 1
  assign A_IM_in[2] = (A_IM[2] === 1'bz) || A_IM[2]; // rv 1
  assign A_IM_in[3] = (A_IM[3] === 1'bz) || A_IM[3]; // rv 1
  assign A_IM_in[4] = (A_IM[4] === 1'bz) || A_IM[4]; // rv 1
  assign A_IM_in[5] = (A_IM[5] === 1'bz) || A_IM[5]; // rv 1
  assign A_IM_in[6] = (A_IM[6] === 1'bz) || A_IM[6]; // rv 1
  assign A_IM_in[7] = (A_IM[7] === 1'bz) || A_IM[7]; // rv 1
  assign A_IM_in[8] = (A_IM[8] === 1'bz) || A_IM[8]; // rv 1
  assign A_IM_in[9] = (A_IM[9] === 1'bz) || A_IM[9]; // rv 1
  assign A_RE_in[0] = (A_RE[0] === 1'bz) || A_RE[0]; // rv 1
  assign A_RE_in[10] = (A_RE[10] === 1'bz) || A_RE[10]; // rv 1
  assign A_RE_in[11] = (A_RE[11] === 1'bz) || A_RE[11]; // rv 1
  assign A_RE_in[12] = (A_RE[12] === 1'bz) || A_RE[12]; // rv 1
  assign A_RE_in[13] = (A_RE[13] === 1'bz) || A_RE[13]; // rv 1
  assign A_RE_in[14] = (A_RE[14] === 1'bz) || A_RE[14]; // rv 1
  assign A_RE_in[15] = (A_RE[15] === 1'bz) || A_RE[15]; // rv 1
  assign A_RE_in[16] = (A_RE[16] === 1'bz) || A_RE[16]; // rv 1
  assign A_RE_in[17] = (A_RE[17] === 1'bz) || A_RE[17]; // rv 1
  assign A_RE_in[1] = (A_RE[1] === 1'bz) || A_RE[1]; // rv 1
  assign A_RE_in[2] = (A_RE[2] === 1'bz) || A_RE[2]; // rv 1
  assign A_RE_in[3] = (A_RE[3] === 1'bz) || A_RE[3]; // rv 1
  assign A_RE_in[4] = (A_RE[4] === 1'bz) || A_RE[4]; // rv 1
  assign A_RE_in[5] = (A_RE[5] === 1'bz) || A_RE[5]; // rv 1
  assign A_RE_in[6] = (A_RE[6] === 1'bz) || A_RE[6]; // rv 1
  assign A_RE_in[7] = (A_RE[7] === 1'bz) || A_RE[7]; // rv 1
  assign A_RE_in[8] = (A_RE[8] === 1'bz) || A_RE[8]; // rv 1
  assign A_RE_in[9] = (A_RE[9] === 1'bz) || A_RE[9]; // rv 1
  assign BCIN_IM_in = BCIN_IM;
  assign BCIN_RE_in = BCIN_RE;
  assign B_IM_in[0] = (B_IM[0] === 1'bz) || B_IM[0]; // rv 1
  assign B_IM_in[10] = (B_IM[10] === 1'bz) || B_IM[10]; // rv 1
  assign B_IM_in[11] = (B_IM[11] === 1'bz) || B_IM[11]; // rv 1
  assign B_IM_in[12] = (B_IM[12] === 1'bz) || B_IM[12]; // rv 1
  assign B_IM_in[13] = (B_IM[13] === 1'bz) || B_IM[13]; // rv 1
  assign B_IM_in[14] = (B_IM[14] === 1'bz) || B_IM[14]; // rv 1
  assign B_IM_in[15] = (B_IM[15] === 1'bz) || B_IM[15]; // rv 1
  assign B_IM_in[16] = (B_IM[16] === 1'bz) || B_IM[16]; // rv 1
  assign B_IM_in[17] = (B_IM[17] === 1'bz) || B_IM[17]; // rv 1
  assign B_IM_in[1] = (B_IM[1] === 1'bz) || B_IM[1]; // rv 1
  assign B_IM_in[2] = (B_IM[2] === 1'bz) || B_IM[2]; // rv 1
  assign B_IM_in[3] = (B_IM[3] === 1'bz) || B_IM[3]; // rv 1
  assign B_IM_in[4] = (B_IM[4] === 1'bz) || B_IM[4]; // rv 1
  assign B_IM_in[5] = (B_IM[5] === 1'bz) || B_IM[5]; // rv 1
  assign B_IM_in[6] = (B_IM[6] === 1'bz) || B_IM[6]; // rv 1
  assign B_IM_in[7] = (B_IM[7] === 1'bz) || B_IM[7]; // rv 1
  assign B_IM_in[8] = (B_IM[8] === 1'bz) || B_IM[8]; // rv 1
  assign B_IM_in[9] = (B_IM[9] === 1'bz) || B_IM[9]; // rv 1
  assign B_RE_in[0] = (B_RE[0] === 1'bz) || B_RE[0]; // rv 1
  assign B_RE_in[10] = (B_RE[10] === 1'bz) || B_RE[10]; // rv 1
  assign B_RE_in[11] = (B_RE[11] === 1'bz) || B_RE[11]; // rv 1
  assign B_RE_in[12] = (B_RE[12] === 1'bz) || B_RE[12]; // rv 1
  assign B_RE_in[13] = (B_RE[13] === 1'bz) || B_RE[13]; // rv 1
  assign B_RE_in[14] = (B_RE[14] === 1'bz) || B_RE[14]; // rv 1
  assign B_RE_in[15] = (B_RE[15] === 1'bz) || B_RE[15]; // rv 1
  assign B_RE_in[16] = (B_RE[16] === 1'bz) || B_RE[16]; // rv 1
  assign B_RE_in[17] = (B_RE[17] === 1'bz) || B_RE[17]; // rv 1
  assign B_RE_in[1] = (B_RE[1] === 1'bz) || B_RE[1]; // rv 1
  assign B_RE_in[2] = (B_RE[2] === 1'bz) || B_RE[2]; // rv 1
  assign B_RE_in[3] = (B_RE[3] === 1'bz) || B_RE[3]; // rv 1
  assign B_RE_in[4] = (B_RE[4] === 1'bz) || B_RE[4]; // rv 1
  assign B_RE_in[5] = (B_RE[5] === 1'bz) || B_RE[5]; // rv 1
  assign B_RE_in[6] = (B_RE[6] === 1'bz) || B_RE[6]; // rv 1
  assign B_RE_in[7] = (B_RE[7] === 1'bz) || B_RE[7]; // rv 1
  assign B_RE_in[8] = (B_RE[8] === 1'bz) || B_RE[8]; // rv 1
  assign B_RE_in[9] = (B_RE[9] === 1'bz) || B_RE[9]; // rv 1
  assign CARRYCASCIN_IM_in = CARRYCASCIN_IM;
  assign CARRYCASCIN_RE_in = CARRYCASCIN_RE;
  assign CARRYINSEL_IM_in[0] = (CARRYINSEL_IM[0] !== 1'bz) && CARRYINSEL_IM[0]; // rv 0
  assign CARRYINSEL_IM_in[1] = (CARRYINSEL_IM[1] !== 1'bz) && CARRYINSEL_IM[1]; // rv 0
  assign CARRYINSEL_IM_in[2] = (CARRYINSEL_IM[2] !== 1'bz) && CARRYINSEL_IM[2]; // rv 0
  assign CARRYINSEL_RE_in[0] = (CARRYINSEL_RE[0] !== 1'bz) && CARRYINSEL_RE[0]; // rv 0
  assign CARRYINSEL_RE_in[1] = (CARRYINSEL_RE[1] !== 1'bz) && CARRYINSEL_RE[1]; // rv 0
  assign CARRYINSEL_RE_in[2] = (CARRYINSEL_RE[2] !== 1'bz) && CARRYINSEL_RE[2]; // rv 0
  assign CARRYIN_IM_in = (CARRYIN_IM !== 1'bz) && (CARRYIN_IM ^ IS_CARRYIN_IM_INVERTED_REG); // rv 0
  assign CARRYIN_RE_in = (CARRYIN_RE !== 1'bz) && (CARRYIN_RE ^ IS_CARRYIN_RE_INVERTED_REG); // rv 0
  assign CEA1_IM_in = (CEA1_IM !== 1'bz) && CEA1_IM; // rv 0
  assign CEA1_RE_in = (CEA1_RE !== 1'bz) && CEA1_RE; // rv 0
  assign CEA2_IM_in = (CEA2_IM !== 1'bz) && CEA2_IM; // rv 0
  assign CEA2_RE_in = (CEA2_RE !== 1'bz) && CEA2_RE; // rv 0
  assign CEAD_in = (CEAD !== 1'bz) && CEAD; // rv 0
  assign CEALUMODE_IM_in = (CEALUMODE_IM !== 1'bz) && CEALUMODE_IM; // rv 0
  assign CEALUMODE_RE_in = (CEALUMODE_RE !== 1'bz) && CEALUMODE_RE; // rv 0
  assign CEB1_IM_in = (CEB1_IM !== 1'bz) && CEB1_IM; // rv 0
  assign CEB1_RE_in = (CEB1_RE !== 1'bz) && CEB1_RE; // rv 0
  assign CEB2_IM_in = (CEB2_IM !== 1'bz) && CEB2_IM; // rv 0
  assign CEB2_RE_in = (CEB2_RE !== 1'bz) && CEB2_RE; // rv 0
  assign CECARRYIN_IM_in = (CECARRYIN_IM !== 1'bz) && CECARRYIN_IM; // rv 0
  assign CECARRYIN_RE_in = (CECARRYIN_RE !== 1'bz) && CECARRYIN_RE; // rv 0
  assign CECONJUGATE_A_in = CECONJUGATE_A;
  assign CECONJUGATE_B_in = CECONJUGATE_B;
  assign CECTRL_IM_in = (CECTRL_IM !== 1'bz) && CECTRL_IM; // rv 0
  assign CECTRL_RE_in = (CECTRL_RE !== 1'bz) && CECTRL_RE; // rv 0
  assign CEC_IM_in = (CEC_IM !== 1'bz) && CEC_IM; // rv 0
  assign CEC_RE_in = (CEC_RE !== 1'bz) && CEC_RE; // rv 0
  assign CEM_IM_in = (CEM_IM !== 1'bz) && CEM_IM; // rv 0
  assign CEM_RE_in = (CEM_RE !== 1'bz) && CEM_RE; // rv 0
  assign CEP_IM_in = (CEP_IM !== 1'bz) && CEP_IM; // rv 0
  assign CEP_RE_in = (CEP_RE !== 1'bz) && CEP_RE; // rv 0
  assign CLK_in = (CLK !== 1'bz) && (CLK ^ IS_CLK_INVERTED_REG); // rv 0
  assign CONJUGATE_A_in = (CONJUGATE_A !== 1'bz) && (CONJUGATE_A ^ IS_CONJUGATE_A_INVERTED_REG); // rv 0
  assign CONJUGATE_B_in = (CONJUGATE_B !== 1'bz) && (CONJUGATE_B ^ IS_CONJUGATE_B_INVERTED_REG); // rv 0
  assign C_IM_in[0] = (C_IM[0] === 1'bz) || C_IM[0]; // rv 1
  assign C_IM_in[10] = (C_IM[10] === 1'bz) || C_IM[10]; // rv 1
  assign C_IM_in[11] = (C_IM[11] === 1'bz) || C_IM[11]; // rv 1
  assign C_IM_in[12] = (C_IM[12] === 1'bz) || C_IM[12]; // rv 1
  assign C_IM_in[13] = (C_IM[13] === 1'bz) || C_IM[13]; // rv 1
  assign C_IM_in[14] = (C_IM[14] === 1'bz) || C_IM[14]; // rv 1
  assign C_IM_in[15] = (C_IM[15] === 1'bz) || C_IM[15]; // rv 1
  assign C_IM_in[16] = (C_IM[16] === 1'bz) || C_IM[16]; // rv 1
  assign C_IM_in[17] = (C_IM[17] === 1'bz) || C_IM[17]; // rv 1
  assign C_IM_in[18] = (C_IM[18] === 1'bz) || C_IM[18]; // rv 1
  assign C_IM_in[19] = (C_IM[19] === 1'bz) || C_IM[19]; // rv 1
  assign C_IM_in[1] = (C_IM[1] === 1'bz) || C_IM[1]; // rv 1
  assign C_IM_in[20] = (C_IM[20] === 1'bz) || C_IM[20]; // rv 1
  assign C_IM_in[21] = (C_IM[21] === 1'bz) || C_IM[21]; // rv 1
  assign C_IM_in[22] = (C_IM[22] === 1'bz) || C_IM[22]; // rv 1
  assign C_IM_in[23] = (C_IM[23] === 1'bz) || C_IM[23]; // rv 1
  assign C_IM_in[24] = (C_IM[24] === 1'bz) || C_IM[24]; // rv 1
  assign C_IM_in[25] = (C_IM[25] === 1'bz) || C_IM[25]; // rv 1
  assign C_IM_in[26] = (C_IM[26] === 1'bz) || C_IM[26]; // rv 1
  assign C_IM_in[27] = (C_IM[27] === 1'bz) || C_IM[27]; // rv 1
  assign C_IM_in[28] = (C_IM[28] === 1'bz) || C_IM[28]; // rv 1
  assign C_IM_in[29] = (C_IM[29] === 1'bz) || C_IM[29]; // rv 1
  assign C_IM_in[2] = (C_IM[2] === 1'bz) || C_IM[2]; // rv 1
  assign C_IM_in[30] = (C_IM[30] === 1'bz) || C_IM[30]; // rv 1
  assign C_IM_in[31] = (C_IM[31] === 1'bz) || C_IM[31]; // rv 1
  assign C_IM_in[32] = (C_IM[32] === 1'bz) || C_IM[32]; // rv 1
  assign C_IM_in[33] = (C_IM[33] === 1'bz) || C_IM[33]; // rv 1
  assign C_IM_in[34] = (C_IM[34] === 1'bz) || C_IM[34]; // rv 1
  assign C_IM_in[35] = (C_IM[35] === 1'bz) || C_IM[35]; // rv 1
  assign C_IM_in[36] = (C_IM[36] === 1'bz) || C_IM[36]; // rv 1
  assign C_IM_in[37] = (C_IM[37] === 1'bz) || C_IM[37]; // rv 1
  assign C_IM_in[38] = (C_IM[38] === 1'bz) || C_IM[38]; // rv 1
  assign C_IM_in[39] = (C_IM[39] === 1'bz) || C_IM[39]; // rv 1
  assign C_IM_in[3] = (C_IM[3] === 1'bz) || C_IM[3]; // rv 1
  assign C_IM_in[40] = (C_IM[40] === 1'bz) || C_IM[40]; // rv 1
  assign C_IM_in[41] = (C_IM[41] === 1'bz) || C_IM[41]; // rv 1
  assign C_IM_in[42] = (C_IM[42] === 1'bz) || C_IM[42]; // rv 1
  assign C_IM_in[43] = (C_IM[43] === 1'bz) || C_IM[43]; // rv 1
  assign C_IM_in[44] = (C_IM[44] === 1'bz) || C_IM[44]; // rv 1
  assign C_IM_in[45] = (C_IM[45] === 1'bz) || C_IM[45]; // rv 1
  assign C_IM_in[46] = (C_IM[46] === 1'bz) || C_IM[46]; // rv 1
  assign C_IM_in[47] = (C_IM[47] === 1'bz) || C_IM[47]; // rv 1
  assign C_IM_in[48] = (C_IM[48] === 1'bz) || C_IM[48]; // rv 1
  assign C_IM_in[49] = (C_IM[49] === 1'bz) || C_IM[49]; // rv 1
  assign C_IM_in[4] = (C_IM[4] === 1'bz) || C_IM[4]; // rv 1
  assign C_IM_in[50] = (C_IM[50] === 1'bz) || C_IM[50]; // rv 1
  assign C_IM_in[51] = (C_IM[51] === 1'bz) || C_IM[51]; // rv 1
  assign C_IM_in[52] = (C_IM[52] === 1'bz) || C_IM[52]; // rv 1
  assign C_IM_in[53] = (C_IM[53] === 1'bz) || C_IM[53]; // rv 1
  assign C_IM_in[54] = (C_IM[54] === 1'bz) || C_IM[54]; // rv 1
  assign C_IM_in[55] = (C_IM[55] === 1'bz) || C_IM[55]; // rv 1
  assign C_IM_in[56] = (C_IM[56] === 1'bz) || C_IM[56]; // rv 1
  assign C_IM_in[57] = (C_IM[57] === 1'bz) || C_IM[57]; // rv 1
  assign C_IM_in[5] = (C_IM[5] === 1'bz) || C_IM[5]; // rv 1
  assign C_IM_in[6] = (C_IM[6] === 1'bz) || C_IM[6]; // rv 1
  assign C_IM_in[7] = (C_IM[7] === 1'bz) || C_IM[7]; // rv 1
  assign C_IM_in[8] = (C_IM[8] === 1'bz) || C_IM[8]; // rv 1
  assign C_IM_in[9] = (C_IM[9] === 1'bz) || C_IM[9]; // rv 1
  assign C_RE_in[0] = (C_RE[0] === 1'bz) || C_RE[0]; // rv 1
  assign C_RE_in[10] = (C_RE[10] === 1'bz) || C_RE[10]; // rv 1
  assign C_RE_in[11] = (C_RE[11] === 1'bz) || C_RE[11]; // rv 1
  assign C_RE_in[12] = (C_RE[12] === 1'bz) || C_RE[12]; // rv 1
  assign C_RE_in[13] = (C_RE[13] === 1'bz) || C_RE[13]; // rv 1
  assign C_RE_in[14] = (C_RE[14] === 1'bz) || C_RE[14]; // rv 1
  assign C_RE_in[15] = (C_RE[15] === 1'bz) || C_RE[15]; // rv 1
  assign C_RE_in[16] = (C_RE[16] === 1'bz) || C_RE[16]; // rv 1
  assign C_RE_in[17] = (C_RE[17] === 1'bz) || C_RE[17]; // rv 1
  assign C_RE_in[18] = (C_RE[18] === 1'bz) || C_RE[18]; // rv 1
  assign C_RE_in[19] = (C_RE[19] === 1'bz) || C_RE[19]; // rv 1
  assign C_RE_in[1] = (C_RE[1] === 1'bz) || C_RE[1]; // rv 1
  assign C_RE_in[20] = (C_RE[20] === 1'bz) || C_RE[20]; // rv 1
  assign C_RE_in[21] = (C_RE[21] === 1'bz) || C_RE[21]; // rv 1
  assign C_RE_in[22] = (C_RE[22] === 1'bz) || C_RE[22]; // rv 1
  assign C_RE_in[23] = (C_RE[23] === 1'bz) || C_RE[23]; // rv 1
  assign C_RE_in[24] = (C_RE[24] === 1'bz) || C_RE[24]; // rv 1
  assign C_RE_in[25] = (C_RE[25] === 1'bz) || C_RE[25]; // rv 1
  assign C_RE_in[26] = (C_RE[26] === 1'bz) || C_RE[26]; // rv 1
  assign C_RE_in[27] = (C_RE[27] === 1'bz) || C_RE[27]; // rv 1
  assign C_RE_in[28] = (C_RE[28] === 1'bz) || C_RE[28]; // rv 1
  assign C_RE_in[29] = (C_RE[29] === 1'bz) || C_RE[29]; // rv 1
  assign C_RE_in[2] = (C_RE[2] === 1'bz) || C_RE[2]; // rv 1
  assign C_RE_in[30] = (C_RE[30] === 1'bz) || C_RE[30]; // rv 1
  assign C_RE_in[31] = (C_RE[31] === 1'bz) || C_RE[31]; // rv 1
  assign C_RE_in[32] = (C_RE[32] === 1'bz) || C_RE[32]; // rv 1
  assign C_RE_in[33] = (C_RE[33] === 1'bz) || C_RE[33]; // rv 1
  assign C_RE_in[34] = (C_RE[34] === 1'bz) || C_RE[34]; // rv 1
  assign C_RE_in[35] = (C_RE[35] === 1'bz) || C_RE[35]; // rv 1
  assign C_RE_in[36] = (C_RE[36] === 1'bz) || C_RE[36]; // rv 1
  assign C_RE_in[37] = (C_RE[37] === 1'bz) || C_RE[37]; // rv 1
  assign C_RE_in[38] = (C_RE[38] === 1'bz) || C_RE[38]; // rv 1
  assign C_RE_in[39] = (C_RE[39] === 1'bz) || C_RE[39]; // rv 1
  assign C_RE_in[3] = (C_RE[3] === 1'bz) || C_RE[3]; // rv 1
  assign C_RE_in[40] = (C_RE[40] === 1'bz) || C_RE[40]; // rv 1
  assign C_RE_in[41] = (C_RE[41] === 1'bz) || C_RE[41]; // rv 1
  assign C_RE_in[42] = (C_RE[42] === 1'bz) || C_RE[42]; // rv 1
  assign C_RE_in[43] = (C_RE[43] === 1'bz) || C_RE[43]; // rv 1
  assign C_RE_in[44] = (C_RE[44] === 1'bz) || C_RE[44]; // rv 1
  assign C_RE_in[45] = (C_RE[45] === 1'bz) || C_RE[45]; // rv 1
  assign C_RE_in[46] = (C_RE[46] === 1'bz) || C_RE[46]; // rv 1
  assign C_RE_in[47] = (C_RE[47] === 1'bz) || C_RE[47]; // rv 1
  assign C_RE_in[48] = (C_RE[48] === 1'bz) || C_RE[48]; // rv 1
  assign C_RE_in[49] = (C_RE[49] === 1'bz) || C_RE[49]; // rv 1
  assign C_RE_in[4] = (C_RE[4] === 1'bz) || C_RE[4]; // rv 1
  assign C_RE_in[50] = (C_RE[50] === 1'bz) || C_RE[50]; // rv 1
  assign C_RE_in[51] = (C_RE[51] === 1'bz) || C_RE[51]; // rv 1
  assign C_RE_in[52] = (C_RE[52] === 1'bz) || C_RE[52]; // rv 1
  assign C_RE_in[53] = (C_RE[53] === 1'bz) || C_RE[53]; // rv 1
  assign C_RE_in[54] = (C_RE[54] === 1'bz) || C_RE[54]; // rv 1
  assign C_RE_in[55] = (C_RE[55] === 1'bz) || C_RE[55]; // rv 1
  assign C_RE_in[56] = (C_RE[56] === 1'bz) || C_RE[56]; // rv 1
  assign C_RE_in[57] = (C_RE[57] === 1'bz) || C_RE[57]; // rv 1
  assign C_RE_in[5] = (C_RE[5] === 1'bz) || C_RE[5]; // rv 1
  assign C_RE_in[6] = (C_RE[6] === 1'bz) || C_RE[6]; // rv 1
  assign C_RE_in[7] = (C_RE[7] === 1'bz) || C_RE[7]; // rv 1
  assign C_RE_in[8] = (C_RE[8] === 1'bz) || C_RE[8]; // rv 1
  assign C_RE_in[9] = (C_RE[9] === 1'bz) || C_RE[9]; // rv 1
  assign MULTSIGNIN_IM_in = MULTSIGNIN_IM;
  assign MULTSIGNIN_RE_in = MULTSIGNIN_RE;
  assign OPMODE_IM_in[0] = (OPMODE_IM[0] !== 1'bz) && (OPMODE_IM[0] ^ IS_OPMODE_IM_INVERTED_REG[0]); // rv 0
  assign OPMODE_IM_in[1] = (OPMODE_IM[1] !== 1'bz) && (OPMODE_IM[1] ^ IS_OPMODE_IM_INVERTED_REG[1]); // rv 0
  assign OPMODE_IM_in[2] = (OPMODE_IM[2] !== 1'bz) && (OPMODE_IM[2] ^ IS_OPMODE_IM_INVERTED_REG[2]); // rv 0
  assign OPMODE_IM_in[3] = (OPMODE_IM[3] !== 1'bz) && (OPMODE_IM[3] ^ IS_OPMODE_IM_INVERTED_REG[3]); // rv 0
  assign OPMODE_IM_in[4] = (OPMODE_IM[4] !== 1'bz) && (OPMODE_IM[4] ^ IS_OPMODE_IM_INVERTED_REG[4]); // rv 0
  assign OPMODE_IM_in[5] = (OPMODE_IM[5] !== 1'bz) && (OPMODE_IM[5] ^ IS_OPMODE_IM_INVERTED_REG[5]); // rv 0
  assign OPMODE_IM_in[6] = (OPMODE_IM[6] !== 1'bz) && (OPMODE_IM[6] ^ IS_OPMODE_IM_INVERTED_REG[6]); // rv 0
  assign OPMODE_IM_in[7] = (OPMODE_IM[7] !== 1'bz) && (OPMODE_IM[7] ^ IS_OPMODE_IM_INVERTED_REG[7]); // rv 0
  assign OPMODE_IM_in[8] = (OPMODE_IM[8] !== 1'bz) && (OPMODE_IM[8] ^ IS_OPMODE_IM_INVERTED_REG[8]); // rv 0
  assign OPMODE_RE_in[0] = (OPMODE_RE[0] !== 1'bz) && (OPMODE_RE[0] ^ IS_OPMODE_RE_INVERTED_REG[0]); // rv 0
  assign OPMODE_RE_in[1] = (OPMODE_RE[1] !== 1'bz) && (OPMODE_RE[1] ^ IS_OPMODE_RE_INVERTED_REG[1]); // rv 0
  assign OPMODE_RE_in[2] = (OPMODE_RE[2] !== 1'bz) && (OPMODE_RE[2] ^ IS_OPMODE_RE_INVERTED_REG[2]); // rv 0
  assign OPMODE_RE_in[3] = (OPMODE_RE[3] !== 1'bz) && (OPMODE_RE[3] ^ IS_OPMODE_RE_INVERTED_REG[3]); // rv 0
  assign OPMODE_RE_in[4] = (OPMODE_RE[4] !== 1'bz) && (OPMODE_RE[4] ^ IS_OPMODE_RE_INVERTED_REG[4]); // rv 0
  assign OPMODE_RE_in[5] = (OPMODE_RE[5] !== 1'bz) && (OPMODE_RE[5] ^ IS_OPMODE_RE_INVERTED_REG[5]); // rv 0
  assign OPMODE_RE_in[6] = (OPMODE_RE[6] !== 1'bz) && (OPMODE_RE[6] ^ IS_OPMODE_RE_INVERTED_REG[6]); // rv 0
  assign OPMODE_RE_in[7] = (OPMODE_RE[7] !== 1'bz) && (OPMODE_RE[7] ^ IS_OPMODE_RE_INVERTED_REG[7]); // rv 0
  assign OPMODE_RE_in[8] = (OPMODE_RE[8] !== 1'bz) && (OPMODE_RE[8] ^ IS_OPMODE_RE_INVERTED_REG[8]); // rv 0
  assign PCIN_IM_in = PCIN_IM;
  assign PCIN_RE_in = PCIN_RE;
  assign RSTAD_in = (RSTAD !== 1'bz) && (RSTAD ^ IS_RSTAD_INVERTED_REG); // rv 0
  assign RSTALLCARRYIN_IM_in = (RSTALLCARRYIN_IM !== 1'bz) && (RSTALLCARRYIN_IM ^ IS_RSTALLCARRYIN_IM_INVERTED_REG); // rv 0
  assign RSTALLCARRYIN_RE_in = (RSTALLCARRYIN_RE !== 1'bz) && (RSTALLCARRYIN_RE ^ IS_RSTALLCARRYIN_RE_INVERTED_REG); // rv 0
  assign RSTALUMODE_IM_in = (RSTALUMODE_IM !== 1'bz) && (RSTALUMODE_IM ^ IS_RSTALUMODE_IM_INVERTED_REG); // rv 0
  assign RSTALUMODE_RE_in = (RSTALUMODE_RE !== 1'bz) && (RSTALUMODE_RE ^ IS_RSTALUMODE_RE_INVERTED_REG); // rv 0
  assign RSTA_IM_in = (RSTA_IM !== 1'bz) && (RSTA_IM ^ IS_RSTA_IM_INVERTED_REG); // rv 0
  assign RSTA_RE_in = (RSTA_RE !== 1'bz) && (RSTA_RE ^ IS_RSTA_RE_INVERTED_REG); // rv 0
  assign RSTB_IM_in = (RSTB_IM !== 1'bz) && (RSTB_IM ^ IS_RSTB_IM_INVERTED_REG); // rv 0
  assign RSTB_RE_in = (RSTB_RE !== 1'bz) && (RSTB_RE ^ IS_RSTB_RE_INVERTED_REG); // rv 0
  assign RSTCONJUGATE_A_in = (RSTCONJUGATE_A !== 1'bz) && (RSTCONJUGATE_A ^ IS_RSTCONJUGATE_A_INVERTED_REG); // rv 0
  assign RSTCONJUGATE_B_in = (RSTCONJUGATE_B !== 1'bz) && (RSTCONJUGATE_B ^ IS_RSTCONJUGATE_B_INVERTED_REG); // rv 0
  assign RSTCTRL_IM_in = (RSTCTRL_IM !== 1'bz) && (RSTCTRL_IM ^ IS_RSTCTRL_IM_INVERTED_REG); // rv 0
  assign RSTCTRL_RE_in = (RSTCTRL_RE !== 1'bz) && (RSTCTRL_RE ^ IS_RSTCTRL_RE_INVERTED_REG); // rv 0
  assign RSTC_IM_in = (RSTC_IM !== 1'bz) && (RSTC_IM ^ IS_RSTC_IM_INVERTED_REG); // rv 0
  assign RSTC_RE_in = (RSTC_RE !== 1'bz) && (RSTC_RE ^ IS_RSTC_RE_INVERTED_REG); // rv 0
  assign RSTM_IM_in = (RSTM_IM !== 1'bz) && (RSTM_IM ^ IS_RSTM_IM_INVERTED_REG); // rv 0
  assign RSTM_RE_in = (RSTM_RE !== 1'bz) && (RSTM_RE ^ IS_RSTM_RE_INVERTED_REG); // rv 0
  assign RSTP_IM_in = (RSTP_IM !== 1'bz) && (RSTP_IM ^ IS_RSTP_IM_INVERTED_REG); // rv 0
  assign RSTP_RE_in = (RSTP_RE !== 1'bz) && (RSTP_RE ^ IS_RSTP_RE_INVERTED_REG); // rv 0

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
  assign ACASCREG_IM_BIN = ACASCREG_IM_REG[1:0];

  assign ACASCREG_RE_BIN = ACASCREG_RE_REG[1:0];

  assign ADREG_BIN = ADREG_REG[0];

  assign ALUMODEREG_IM_BIN = ALUMODEREG_IM_REG[0];

  assign ALUMODEREG_RE_BIN = ALUMODEREG_RE_REG[0];

  assign AREG_IM_BIN = AREG_IM_REG[1:0];

  assign AREG_RE_BIN = AREG_RE_REG[1:0];

  assign AUTORESET_PATDET_IM_BIN =
  (AUTORESET_PATDET_IM_REG == "NO_RESET") ? AUTORESET_PATDET_IM_NO_RESET :
  (AUTORESET_PATDET_IM_REG == "RESET_MATCH") ? AUTORESET_PATDET_IM_RESET_MATCH :
  (AUTORESET_PATDET_IM_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_IM_RESET_NOT_MATCH :
   AUTORESET_PATDET_IM_NO_RESET;

  assign AUTORESET_PATDET_RE_BIN =
  (AUTORESET_PATDET_RE_REG == "NO_RESET") ? AUTORESET_PATDET_RE_NO_RESET :
  (AUTORESET_PATDET_RE_REG == "RESET_MATCH") ? AUTORESET_PATDET_RE_RESET_MATCH :
  (AUTORESET_PATDET_RE_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RE_RESET_NOT_MATCH :
   AUTORESET_PATDET_RE_NO_RESET;

  assign AUTORESET_PRIORITY_IM_BIN =
  (AUTORESET_PRIORITY_IM_REG == "RESET") ? AUTORESET_PRIORITY_IM_RESET :
  (AUTORESET_PRIORITY_IM_REG == "CEP") ? AUTORESET_PRIORITY_IM_CEP :
   AUTORESET_PRIORITY_IM_RESET;

  assign AUTORESET_PRIORITY_RE_BIN =
  (AUTORESET_PRIORITY_RE_REG == "RESET") ? AUTORESET_PRIORITY_RE_RESET :
  (AUTORESET_PRIORITY_RE_REG == "CEP") ? AUTORESET_PRIORITY_RE_CEP :
   AUTORESET_PRIORITY_RE_RESET;

  assign A_INPUT_IM_BIN =
  (A_INPUT_IM_REG == "DIRECT") ? A_INPUT_IM_DIRECT :
  (A_INPUT_IM_REG == "CASCADE") ? A_INPUT_IM_CASCADE :
   A_INPUT_IM_DIRECT;

  assign A_INPUT_RE_BIN =
  (A_INPUT_RE_REG == "DIRECT") ? A_INPUT_RE_DIRECT :
  (A_INPUT_RE_REG == "CASCADE") ? A_INPUT_RE_CASCADE :
   A_INPUT_RE_DIRECT;

  assign BCASCREG_IM_BIN = BCASCREG_IM_REG[1:0];

  assign BCASCREG_RE_BIN = BCASCREG_RE_REG[1:0];

  assign BREG_IM_BIN = BREG_IM_REG[1:0];

  assign BREG_RE_BIN = BREG_RE_REG[1:0];

  assign B_INPUT_IM_BIN =
  (B_INPUT_IM_REG == "DIRECT") ? B_INPUT_IM_DIRECT :
  (B_INPUT_IM_REG == "CASCADE") ? B_INPUT_IM_CASCADE :
   B_INPUT_IM_DIRECT;

  assign B_INPUT_RE_BIN =
  (B_INPUT_RE_REG == "DIRECT") ? B_INPUT_RE_DIRECT :
  (B_INPUT_RE_REG == "CASCADE") ? B_INPUT_RE_CASCADE :
   B_INPUT_RE_DIRECT;

  assign CARRYINREG_IM_BIN = CARRYINREG_IM_REG[0];

  assign CARRYINREG_RE_BIN = CARRYINREG_RE_REG[0];

  assign CARRYINSELREG_IM_BIN = CARRYINSELREG_IM_REG[0];

  assign CARRYINSELREG_RE_BIN = CARRYINSELREG_RE_REG[0];

  assign CONJUGATEREG_A_BIN = CONJUGATEREG_A_REG[0];

  assign CONJUGATEREG_B_BIN = CONJUGATEREG_B_REG[0];

  assign CREG_IM_BIN = CREG_IM_REG[0];

  assign CREG_RE_BIN = CREG_RE_REG[0];

  assign MREG_IM_BIN = MREG_IM_REG[0];

  assign MREG_RE_BIN = MREG_RE_REG[0];

  assign OPMODEREG_IM_BIN = OPMODEREG_IM_REG[0];

  assign OPMODEREG_RE_BIN = OPMODEREG_RE_REG[0];

  assign PREG_IM_BIN = PREG_IM_REG[0];

  assign PREG_RE_BIN = PREG_RE_REG[0];

  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

  assign SEL_MASK_IM_BIN =
  (SEL_MASK_IM_REG == "MASK") ? SEL_MASK_IM_MASK :
  (SEL_MASK_IM_REG == "C") ? SEL_MASK_IM_C :
  (SEL_MASK_IM_REG == "ROUNDING_MODE1") ? SEL_MASK_IM_ROUNDING_MODE1 :
  (SEL_MASK_IM_REG == "ROUNDING_MODE2") ? SEL_MASK_IM_ROUNDING_MODE2 :
   SEL_MASK_IM_MASK;

  assign SEL_MASK_RE_BIN =
  (SEL_MASK_RE_REG == "MASK") ? SEL_MASK_RE_MASK :
  (SEL_MASK_RE_REG == "C") ? SEL_MASK_RE_C :
  (SEL_MASK_RE_REG == "ROUNDING_MODE1") ? SEL_MASK_RE_ROUNDING_MODE1 :
  (SEL_MASK_RE_REG == "ROUNDING_MODE2") ? SEL_MASK_RE_ROUNDING_MODE2 :
   SEL_MASK_RE_MASK;

  assign SEL_PATTERN_IM_BIN =
  (SEL_PATTERN_IM_REG == "PATTERN") ? SEL_PATTERN_IM_PATTERN :
  (SEL_PATTERN_IM_REG == "C") ? SEL_PATTERN_IM_C :
   SEL_PATTERN_IM_PATTERN;

  assign SEL_PATTERN_RE_BIN =
  (SEL_PATTERN_RE_REG == "PATTERN") ? SEL_PATTERN_RE_PATTERN :
  (SEL_PATTERN_RE_REG == "C") ? SEL_PATTERN_RE_C :
   SEL_PATTERN_RE_PATTERN;

  assign USE_PATTERN_DETECT_IM_BIN =
  (USE_PATTERN_DETECT_IM_REG == "NO_PATDET") ? USE_PATTERN_DETECT_IM_NO_PATDET :
  (USE_PATTERN_DETECT_IM_REG == "PATDET") ? USE_PATTERN_DETECT_IM_PATDET :
   USE_PATTERN_DETECT_IM_NO_PATDET;

  assign USE_PATTERN_DETECT_RE_BIN =
  (USE_PATTERN_DETECT_RE_REG == "NO_PATDET") ? USE_PATTERN_DETECT_RE_NO_PATDET :
  (USE_PATTERN_DETECT_RE_REG == "PATDET") ? USE_PATTERN_DETECT_RE_PATDET :
   USE_PATTERN_DETECT_RE_NO_PATDET;

`else
always @(trig_attr) begin
#1;
  ACASCREG_IM_BIN = ACASCREG_IM_REG[1:0];

  ACASCREG_RE_BIN = ACASCREG_RE_REG[1:0];

  ADREG_BIN = ADREG_REG[0];

  ALUMODEREG_IM_BIN = ALUMODEREG_IM_REG[0];

  ALUMODEREG_RE_BIN = ALUMODEREG_RE_REG[0];

  AREG_IM_BIN = AREG_IM_REG[1:0];

  AREG_RE_BIN = AREG_RE_REG[1:0];

  AUTORESET_PATDET_IM_BIN =
    (AUTORESET_PATDET_IM_REG == "NO_RESET") ? AUTORESET_PATDET_IM_NO_RESET :
    (AUTORESET_PATDET_IM_REG == "RESET_MATCH") ? AUTORESET_PATDET_IM_RESET_MATCH :
    (AUTORESET_PATDET_IM_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_IM_RESET_NOT_MATCH :
     AUTORESET_PATDET_IM_NO_RESET;

  AUTORESET_PATDET_RE_BIN =
    (AUTORESET_PATDET_RE_REG == "NO_RESET") ? AUTORESET_PATDET_RE_NO_RESET :
    (AUTORESET_PATDET_RE_REG == "RESET_MATCH") ? AUTORESET_PATDET_RE_RESET_MATCH :
    (AUTORESET_PATDET_RE_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RE_RESET_NOT_MATCH :
     AUTORESET_PATDET_RE_NO_RESET;

  AUTORESET_PRIORITY_IM_BIN =
    (AUTORESET_PRIORITY_IM_REG == "RESET") ? AUTORESET_PRIORITY_IM_RESET :
    (AUTORESET_PRIORITY_IM_REG == "CEP") ? AUTORESET_PRIORITY_IM_CEP :
     AUTORESET_PRIORITY_IM_RESET;

  AUTORESET_PRIORITY_RE_BIN =
    (AUTORESET_PRIORITY_RE_REG == "RESET") ? AUTORESET_PRIORITY_RE_RESET :
    (AUTORESET_PRIORITY_RE_REG == "CEP") ? AUTORESET_PRIORITY_RE_CEP :
     AUTORESET_PRIORITY_RE_RESET;

  A_INPUT_IM_BIN =
    (A_INPUT_IM_REG == "DIRECT") ? A_INPUT_IM_DIRECT :
    (A_INPUT_IM_REG == "CASCADE") ? A_INPUT_IM_CASCADE :
     A_INPUT_IM_DIRECT;

  A_INPUT_RE_BIN =
    (A_INPUT_RE_REG == "DIRECT") ? A_INPUT_RE_DIRECT :
    (A_INPUT_RE_REG == "CASCADE") ? A_INPUT_RE_CASCADE :
     A_INPUT_RE_DIRECT;

  BCASCREG_IM_BIN = BCASCREG_IM_REG[1:0];

  BCASCREG_RE_BIN = BCASCREG_RE_REG[1:0];

  BREG_IM_BIN = BREG_IM_REG[1:0];

  BREG_RE_BIN = BREG_RE_REG[1:0];

  B_INPUT_IM_BIN =
    (B_INPUT_IM_REG == "DIRECT") ? B_INPUT_IM_DIRECT :
    (B_INPUT_IM_REG == "CASCADE") ? B_INPUT_IM_CASCADE :
     B_INPUT_IM_DIRECT;

  B_INPUT_RE_BIN =
    (B_INPUT_RE_REG == "DIRECT") ? B_INPUT_RE_DIRECT :
    (B_INPUT_RE_REG == "CASCADE") ? B_INPUT_RE_CASCADE :
     B_INPUT_RE_DIRECT;

  CARRYINREG_IM_BIN = CARRYINREG_IM_REG[0];

  CARRYINREG_RE_BIN = CARRYINREG_RE_REG[0];

  CARRYINSELREG_IM_BIN = CARRYINSELREG_IM_REG[0];

  CARRYINSELREG_RE_BIN = CARRYINSELREG_RE_REG[0];

  CONJUGATEREG_A_BIN = CONJUGATEREG_A_REG[0];

  CONJUGATEREG_B_BIN = CONJUGATEREG_B_REG[0];

  CREG_IM_BIN = CREG_IM_REG[0];

  CREG_RE_BIN = CREG_RE_REG[0];

  MREG_IM_BIN = MREG_IM_REG[0];

  MREG_RE_BIN = MREG_RE_REG[0];

  OPMODEREG_IM_BIN = OPMODEREG_IM_REG[0];

  OPMODEREG_RE_BIN = OPMODEREG_RE_REG[0];

  PREG_IM_BIN = PREG_IM_REG[0];

  PREG_RE_BIN = PREG_RE_REG[0];

  RESET_MODE_BIN =
    (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
    (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
    RESET_MODE_SYNC;

  SEL_MASK_IM_BIN =
    (SEL_MASK_IM_REG == "MASK") ? SEL_MASK_IM_MASK :
    (SEL_MASK_IM_REG == "C") ? SEL_MASK_IM_C :
    (SEL_MASK_IM_REG == "ROUNDING_MODE1") ? SEL_MASK_IM_ROUNDING_MODE1 :
    (SEL_MASK_IM_REG == "ROUNDING_MODE2") ? SEL_MASK_IM_ROUNDING_MODE2 :
     SEL_MASK_IM_MASK;

  SEL_MASK_RE_BIN =
    (SEL_MASK_RE_REG == "MASK") ? SEL_MASK_RE_MASK :
    (SEL_MASK_RE_REG == "C") ? SEL_MASK_RE_C :
    (SEL_MASK_RE_REG == "ROUNDING_MODE1") ? SEL_MASK_RE_ROUNDING_MODE1 :
    (SEL_MASK_RE_REG == "ROUNDING_MODE2") ? SEL_MASK_RE_ROUNDING_MODE2 :
     SEL_MASK_RE_MASK;

  SEL_PATTERN_IM_BIN =
    (SEL_PATTERN_IM_REG == "PATTERN") ? SEL_PATTERN_IM_PATTERN :
    (SEL_PATTERN_IM_REG == "C") ? SEL_PATTERN_IM_C :
     SEL_PATTERN_IM_PATTERN;

  SEL_PATTERN_RE_BIN =
    (SEL_PATTERN_RE_REG == "PATTERN") ? SEL_PATTERN_RE_PATTERN :
    (SEL_PATTERN_RE_REG == "C") ? SEL_PATTERN_RE_C :
     SEL_PATTERN_RE_PATTERN;

  USE_PATTERN_DETECT_IM_BIN =
    (USE_PATTERN_DETECT_IM_REG == "NO_PATDET") ? USE_PATTERN_DETECT_IM_NO_PATDET :
    (USE_PATTERN_DETECT_IM_REG == "PATDET") ? USE_PATTERN_DETECT_IM_PATDET :
     USE_PATTERN_DETECT_IM_NO_PATDET;

  USE_PATTERN_DETECT_RE_BIN =
    (USE_PATTERN_DETECT_RE_REG == "NO_PATDET") ? USE_PATTERN_DETECT_RE_NO_PATDET :
    (USE_PATTERN_DETECT_RE_REG == "PATDET") ? USE_PATTERN_DETECT_RE_PATDET :
     USE_PATTERN_DETECT_RE_NO_PATDET;

end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((ACASCREG_IM_REG != 1) &&
       (ACASCREG_IM_REG != 0) &&
       (ACASCREG_IM_REG != 2))) begin
    $display("Error: [Unisim %s-101] ACASCREG_IM attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, ACASCREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((ACASCREG_RE_REG != 1) &&
       (ACASCREG_RE_REG != 0) &&
       (ACASCREG_RE_REG != 2))) begin
    $display("Error: [Unisim %s-102] ACASCREG_RE attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, ACASCREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
        ((ADREG_REG != 1) &&
         (ADREG_REG != 0))) begin
      $display("Error: [Unisim %s-103] ADREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ADREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((ALUMODEREG_IM_REG != 1) &&
       (ALUMODEREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-104] ALUMODEREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ALUMODEREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((ALUMODEREG_RE_REG != 1) &&
       (ALUMODEREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-105] ALUMODEREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ALUMODEREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AREG_IM_REG != 2) &&
       (AREG_IM_REG != 0) &&
       (AREG_IM_REG != 1))) begin
      $display("Error: [Unisim %s-107] AREG_IM attribute is set to %d.  Legal values for this attribute are 2, 0 or 1. Instance: %m", MODULE_NAME, AREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AREG_RE_REG != 2) &&
       (AREG_RE_REG != 0) &&
       (AREG_RE_REG != 1))) begin
      $display("Error: [Unisim %s-108] AREG_RE attribute is set to %d.  Legal values for this attribute are 2, 0 or 1. Instance: %m", MODULE_NAME, AREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AUTORESET_PATDET_IM_REG != "NO_RESET") &&
       (AUTORESET_PATDET_IM_REG != "RESET_MATCH") &&
       (AUTORESET_PATDET_IM_REG != "RESET_NOT_MATCH"))) begin
      $display("Error: [Unisim %s-109] AUTORESET_PATDET_IM attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AUTORESET_PATDET_RE_REG != "NO_RESET") &&
       (AUTORESET_PATDET_RE_REG != "RESET_MATCH") &&
       (AUTORESET_PATDET_RE_REG != "RESET_NOT_MATCH"))) begin
      $display("Error: [Unisim %s-110] AUTORESET_PATDET_RE attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AUTORESET_PRIORITY_IM_REG != "RESET") &&
       (AUTORESET_PRIORITY_IM_REG != "CEP"))) begin
      $display("Error: [Unisim %s-111] AUTORESET_PRIORITY_IM attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((AUTORESET_PRIORITY_RE_REG != "RESET") &&
       (AUTORESET_PRIORITY_RE_REG != "CEP"))) begin
      $display("Error: [Unisim %s-112] AUTORESET_PRIORITY_RE attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((A_INPUT_IM_REG != "DIRECT") &&
       (A_INPUT_IM_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-113] A_INPUT_IM attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, A_INPUT_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((A_INPUT_RE_REG != "DIRECT") &&
       (A_INPUT_RE_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-114] A_INPUT_RE attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, A_INPUT_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((BCASCREG_IM_REG != 1) &&
       (BCASCREG_IM_REG != 0) &&
       (BCASCREG_IM_REG != 2))) begin
      $display("Error: [Unisim %s-115] BCASCREG_IM attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, BCASCREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((BCASCREG_RE_REG != 1) &&
       (BCASCREG_RE_REG != 0) &&
       (BCASCREG_RE_REG != 2))) begin
      $display("Error: [Unisim %s-116] BCASCREG_RE attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, BCASCREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((BREG_IM_REG != 2) &&
       (BREG_IM_REG != 0) &&
       (BREG_IM_REG != 1))) begin
      $display("Error: [Unisim %s-117] BREG_IM attribute is set to %d.  Legal values for this attribute are 2, 0 or 1. Instance: %m", MODULE_NAME, BREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((BREG_RE_REG != 2) &&
       (BREG_RE_REG != 0) &&
       (BREG_RE_REG != 1))) begin
      $display("Error: [Unisim %s-118] BREG_RE attribute is set to %d.  Legal values for this attribute are 2, 0 or 1. Instance: %m", MODULE_NAME, BREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((B_INPUT_IM_REG != "DIRECT") &&
       (B_INPUT_IM_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-119] B_INPUT_IM attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, B_INPUT_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((B_INPUT_RE_REG != "DIRECT") &&
       (B_INPUT_RE_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-120] B_INPUT_RE attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, B_INPUT_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CARRYINREG_IM_REG != 1) &&
       (CARRYINREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-121] CARRYINREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CARRYINREG_RE_REG != 1) &&
       (CARRYINREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-122] CARRYINREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CARRYINSELREG_IM_REG != 1) &&
       (CARRYINSELREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-123] CARRYINSELREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINSELREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CARRYINSELREG_RE_REG != 1) &&
       (CARRYINSELREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-124] CARRYINSELREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINSELREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CONJUGATEREG_A_REG != 1) &&
       (CONJUGATEREG_A_REG != 0))) begin
      $display("Error: [Unisim %s-125] CONJUGATEREG_A attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CONJUGATEREG_A_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CONJUGATEREG_B_REG != 1) &&
       (CONJUGATEREG_B_REG != 0))) begin
      $display("Error: [Unisim %s-126] CONJUGATEREG_B attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CONJUGATEREG_B_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CREG_IM_REG != 1) &&
       (CREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-127] CREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((CREG_RE_REG != 1) &&
       (CREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-128] CREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((MREG_IM_REG != 1) &&
       (MREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-161] MREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((MREG_RE_REG != 1) &&
       (MREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-162] MREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((OPMODEREG_IM_REG != 1) &&
       (OPMODEREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-163] OPMODEREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, OPMODEREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((OPMODEREG_RE_REG != 1) &&
       (OPMODEREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-164] OPMODEREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, OPMODEREG_RE_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((PREG_IM_REG != 1) &&
       (PREG_IM_REG != 0))) begin
      $display("Error: [Unisim %s-167] PREG_IM attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, PREG_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((PREG_RE_REG != 1) &&
       (PREG_RE_REG != 0))) begin
      $display("Error: [Unisim %s-168] PREG_RE attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, PREG_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
      $display("Error: [Unisim %s-169] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((SEL_MASK_IM_REG != "MASK") &&
       (SEL_MASK_IM_REG != "C") &&
       (SEL_MASK_IM_REG != "ROUNDING_MODE1") &&
       (SEL_MASK_IM_REG != "ROUNDING_MODE2"))) begin
      $display("Error: [Unisim %s-172] SEL_MASK_IM attribute is set to %s.  Legal values for this attribute are MASK, C, ROUNDING_MODE1 or ROUNDING_MODE2. Instance: %m", MODULE_NAME, SEL_MASK_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((SEL_MASK_RE_REG != "MASK") &&
       (SEL_MASK_RE_REG != "C") &&
       (SEL_MASK_RE_REG != "ROUNDING_MODE1") &&
       (SEL_MASK_RE_REG != "ROUNDING_MODE2"))) begin
      $display("Error: [Unisim %s-173] SEL_MASK_RE attribute is set to %s.  Legal values for this attribute are MASK, C, ROUNDING_MODE1 or ROUNDING_MODE2. Instance: %m", MODULE_NAME, SEL_MASK_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((SEL_PATTERN_IM_REG != "PATTERN") &&
       (SEL_PATTERN_IM_REG != "C"))) begin
      $display("Error: [Unisim %s-174] SEL_PATTERN_IM attribute is set to %s.  Legal values for this attribute are PATTERN or C. Instance: %m", MODULE_NAME, SEL_PATTERN_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((SEL_PATTERN_RE_REG != "PATTERN") &&
       (SEL_PATTERN_RE_REG != "C"))) begin
      $display("Error: [Unisim %s-175] SEL_PATTERN_RE attribute is set to %s.  Legal values for this attribute are PATTERN or C. Instance: %m", MODULE_NAME, SEL_PATTERN_RE_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((USE_PATTERN_DETECT_IM_REG != "NO_PATDET") &&
       (USE_PATTERN_DETECT_IM_REG != "PATDET"))) begin
      $display("Error: [Unisim %s-176] USE_PATTERN_DETECT_IM attribute is set to %s.  Legal values for this attribute are NO_PATDET or PATDET. Instance: %m", MODULE_NAME, USE_PATTERN_DETECT_IM_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((USE_PATTERN_DETECT_RE_REG != "NO_PATDET") &&
       (USE_PATTERN_DETECT_RE_REG != "PATDET"))) begin
      $display("Error: [Unisim %s-177] USE_PATTERN_DETECT_RE attribute is set to %s.  Legal values for this attribute are NO_PATDET or PATDET. Instance: %m", MODULE_NAME, USE_PATTERN_DETECT_RE_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  wire [3:0] CARRYOUT_IM_out;
  wire [3:0] CARRYOUT_RE_out;

  assign CARRYOUT_IM = CARRYOUT_IM_out[3];
  assign CARRYOUT_RE = CARRYOUT_RE_out[3];

  wire [33:0] ACOUT_IM_out;
  wire [33:0] ACOUT_RE_out;
  wire [23:0] BCOUT_IM_out;
  wire [23:0] BCOUT_RE_out;

  assign ACOUT_IM = ACOUT_IM_out[17:0];
  assign ACOUT_RE = ACOUT_RE_out[17:0];
  assign BCOUT_IM = BCOUT_IM_out[17:0];
  assign BCOUT_RE = BCOUT_RE_out[17:0];


  wire ADDSUB_IM;
  wire ADDSUB_RE;
  wire [26:0] A2A1_IM;
  wire [26:0] A2A1_RE;
  wire [26:0] AD_DATA_IM;
  wire [26:0] AD_DATA_RE;
  wire [9:0] AD_DATA_CPLX_IM;
  wire [9:0] AD_DATA_CPLX_RE;
  wire ALUMODE10_IM;
  wire ALUMODE10_RE;
  wire AMULTMSB_IM;
  wire AMULTMSB_RE;
  wire [33:0] A_ALU_IM;
  wire [33:0] A_ALU_RE;
  wire [17:0] A_TO_D_CPLX_IM;
  wire [17:0] A_TO_D_CPLX_RE;
  wire BMULTMSB_IM;
  wire BMULTMSB_RE;
  wire [23:0] B2B1_IM;
  wire [23:0] B2B1_RE;
  wire [17:0] B2B1_CPLX_IM;
  wire [17:0] B2B1_CPLX_RE;
  wire [23:0] B_ALU_IM;
  wire [23:0] B_ALU_RE;
  wire [2:0] CARRYINSEL_DATA_IM;
  wire [2:0] CARRYINSEL_DATA_RE;
  wire CARRYIN_DATA_IM;
  wire CARRYIN_DATA_RE;
  wire [26:0] D_DATA_IM;
  wire [26:0] D_DATA_RE;
  wire [2:0] NEGATE_DATA_IM;
  wire [2:0] NEGATE_DATA_RE;
  wire [26:0] PREADD_AB_IM;
  wire [26:0] PREADD_AB_RE;
  wire [57:0] C_DATA_IM;
  wire [57:0] C_DATA_RE;
  wire [8:0] OPMODE_DATA_IM;
  wire [8:0] OPMODE_DATA_RE;
  wire [57:0] P_FDBK_IM;
  wire [57:0] P_FDBK_RE;
  wire P_FDBK_MSB_IM;
  wire P_FDBK_MSB_RE;
  wire [23:0] B1_DATA_IM;
  wire [23:0] B1_DATA_RE;
  wire [23:0] B2_DATA_IM;
  wire [23:0] B2_DATA_RE;
  wire [26:0] A1_DATA_IM;
  wire [26:0] A2_DATA_IM;
  wire [26:0] A1_DATA_RE;
  wire [26:0] A2_DATA_RE;
  wire [26:0] AD_IM;
  wire [26:0] AD_RE;
  wire [36:0] U_CPLX;
  wire [36:0] V_CPLX;
  wire [3:0] ALUMODE_DATA_IM;
  wire [3:0] ALUMODE_DATA_RE;
  wire [3:0] COUT_IM;
  wire [3:0] COUT_RE;
  wire [4:0] INMODE_IM;
  wire [4:0] INMODE_RE;
  wire [4:0] PATT_B_DET_IM;
  wire [4:0] PATT_DET_IM;
  wire [4:0] PATT_B_DET_RE;
  wire [4:0] PATT_DET_RE;
  wire [50:0] U_IM;
  wire [50:0] U_RE;
  wire [50:0] V_IM;
  wire [50:0] V_RE;
  wire [7:0] XOROUT_IM;
  wire [7:0] XOROUT_RE;
  wire [18:0] U0U2_INT8_IM;
  wire [18:0] U0U2_INT8_RE;
  wire [16:0] U1_INT8_IM;
  wire [16:0] U1_INT8_RE;
  wire [18:0] V0V2_INT8_IM;
  wire [18:0] V0V2_INT8_RE;
  wire [16:0] V1_INT8_IM;
  wire [16:0] V1_INT8_RE;
  wire [50:0] U_DATA_IM;
  wire [50:0] U_DATA_RE;
  wire [50:0] V_DATA_IM;
  wire [50:0] V_DATA_RE;
  wire [57:0] ALU_OUT_RE;
  wire [57:0] ALU_OUT_IM;
  wire [7:0] XOR_MX_IM;
  wire [7:0] XOR_MX_RE;
  wire [17:0] A_CPLX_IM;
  wire [17:0] A_CPLX_RE;
  wire [9:0] AD_CPLX_IM;
  wire [9:0] AD_CPLX_RE;
  wire [57:0] W_IM;
  wire [57:0] X_IM;
  wire [57:0] Y_IM;
  wire [57:0] Z_IM;
  wire [57:0] W_RE;
  wire [57:0] X_RE;
  wire [57:0] Y_RE;
  wire [57:0] Z_RE;

  wire MULTSIGN_ALU_IM;
  wire MULTSIGN_ALU_RE;
  wire CIN_IM;
  wire CIN_RE;
  wire CARRYCASCOUT_FB_IM;
  wire CARRYCASCOUT_FB_RE;
  wire MULTCARRYIN_DATA_IM;
  wire MULTCARRYIN_DATA_RE;
  wire INMODE_2_IM;
  wire INMODE_2_RE;

  localparam DREG_IM = AREG_RE[1] || AREG_RE[0];
  localparam DREG_RE = AREG_IM[1] || AREG_IM[0];

  reg DREG_IM_REG;
  reg DREG_RE_REG;

  always @(*) begin
    DREG_IM_REG = AREG_RE_REG[1] || AREG_RE_REG[0];
    DREG_RE_REG = AREG_IM_REG[1] || AREG_IM_REG[0];
  end

DSP_ALUADD #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .LEGACY("DSP58"),
  .USE_SIMD("ONE58"),
  .USE_WIDEXOR("FALSE"),
  .XORSIMD("XOR24_34_58_116")
) DSP_ALUADD_IM_INST (
  .ALUMODE10(ALUMODE10_IM),
  .ALU_OUT(ALU_OUT_IM),
  .COUT(COUT_IM),
  .MULTSIGN_ALU(MULTSIGN_ALU_IM),
  .XOR_MX(XOR_MX_IM),

  .ALUMODE_DATA(ALUMODE_DATA_IM),
  .CIN(CIN_IM),
  .W(W_IM),
  .X(X_IM),
  .Y(Y_IM),
  .Z(Z_IM)
);

DSP_ALUMUX #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18"),
  .LEGACY("DSP58"),
  .RND(RND_IM)
) DSP_ALUMUX_IM_INST (
  .CIN(CIN_IM),
  .W(W_IM),
  .X(X_IM),
  .Y(Y_IM),
  .Z(Z_IM),

  .A_ALU(A_ALU_IM),
  .B_ALU(B_ALU_IM),
  .CARRYCASCIN(CARRYCASCIN_IM),
  .CARRYCASCOUT_FB(CARRYCASCOUT_FB_IM),
  .CARRYINSEL_DATA(CARRYINSEL_DATA_IM),
  .CARRYIN_DATA(CARRYIN_DATA_IM),
  .C_DATA(C_DATA_IM),
  .MULTCARRYIN_DATA(MULTCARRYIN_DATA_IM),
  .MULTSIGNIN(MULTSIGNIN_IM),
  .OPMODE_DATA(OPMODE_DATA_IM),
  .PCIN(PCIN_IM),
  .P_FDBK(P_FDBK_IM),
  .P_FDBK_MSB(P_FDBK_MSB_IM),
  .U_DATA(U_DATA_IM),
  .V_DATA(V_DATA_IM)
);

DSP_ALUREG #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .ALUMODEREG(ALUMODEREG_IM),
  .CARRYINREG(CARRYINREG_IM),
  .CARRYINSELREG(CARRYINSELREG_IM),
  .DSP_MODE("CINT18"),
  .IS_ALUMODE_INVERTED(4'b0000),
  .IS_CARRYIN_INVERTED(1'b0),
  .IS_OPMODE_INVERTED(9'b000000000),
  .IS_RSTALLCARRYIN_INVERTED(1'b0),
  .IS_RSTALUMODE_INVERTED(1'b0),
  .IS_RSTCTRL_INVERTED(1'b0),
  .MREG(MREG_IM),
  .OPMODEREG(OPMODEREG_IM),
  .RESET_MODE(RESET_MODE)
) DSP_ALUREG_IM_INST (
  .ALUMODE_DATA(ALUMODE_DATA_IM),
  .CARRYINSEL_DATA(CARRYINSEL_DATA_IM),
  .CARRYIN_DATA(CARRYIN_DATA_IM),
  .MULTCARRYIN_DATA(MULTCARRYIN_DATA_IM),
  .OPMODE_DATA(OPMODE_DATA_IM),

  .ALUMODE(ALUMODE_IM_in),
  .AMULTMSB(AMULTMSB_IM),
  .ASYNC_RST(ASYNC_RST_in),
  .BMULTMSB(BMULTMSB_IM),
  .CARRYIN(CARRYIN_IM_in),
  .CARRYINSEL(CARRYINSEL_IM),
  .CEALUMODE(CEALUMODE_IM),
  .CECARRYIN(CECARRYIN_IM),
  .CECTRL(CECTRL_IM),
  .CEM(CEM_IM),
  .CLK(CLK_in),
  .OPMODE(OPMODE_IM_in),
  .RSTALLCARRYIN(RSTALLCARRYIN_IM_in),
  .RSTALUMODE(RSTALUMODE_IM_in),
  .RSTCTRL(RSTCTRL_IM_in)
);

DSP_ALUADD #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .LEGACY("DSP58"),
  .USE_SIMD("ONE58"),
  .USE_WIDEXOR("FALSE"),
  .XORSIMD("XOR24_34_58_116")
) DSP_ALUADD_RE_INST (
  .ALUMODE10(ALUMODE10_RE),
  .ALU_OUT(ALU_OUT_RE),
  .COUT(COUT_RE),
  .MULTSIGN_ALU(MULTSIGN_ALU_RE),
  .XOR_MX(XOR_MX_RE),

  .ALUMODE_DATA(ALUMODE_DATA_RE),
  .CIN(CIN_RE),
  .W(W_RE),
  .X(X_RE),
  .Y(Y_RE),
  .Z(Z_RE)
);

DSP_ALUMUX #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18"),
  .LEGACY("DSP58"),
  .RND(RND_RE)
) DSP_ALUMUX_RE_INST (
  .CIN(CIN_RE),
  .W(W_RE),
  .X(X_RE),
  .Y(Y_RE),
  .Z(Z_RE),

  .A_ALU(A_ALU_RE),
  .B_ALU(B_ALU_RE),
  .CARRYCASCIN(CARRYCASCIN_RE),
  .CARRYCASCOUT_FB(CARRYCASCOUT_FB_RE),
  .CARRYINSEL_DATA(CARRYINSEL_DATA_RE),
  .CARRYIN_DATA(CARRYIN_DATA_RE),
  .C_DATA(C_DATA_RE),
  .MULTCARRYIN_DATA(MULTCARRYIN_DATA_RE),
  .MULTSIGNIN(MULTSIGNIN_RE),
  .OPMODE_DATA(OPMODE_DATA_RE),
  .PCIN(PCIN_RE),
  .P_FDBK(P_FDBK_RE),
  .P_FDBK_MSB(P_FDBK_MSB_RE),
  .U_DATA(U_DATA_RE),
  .V_DATA(V_DATA_RE)
);

DSP_ALUREG #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .ALUMODEREG(ALUMODEREG_RE),
  .CARRYINREG(CARRYINREG_RE),
  .CARRYINSELREG(CARRYINSELREG_RE),
  .DSP_MODE("CINT18"),
  .IS_ALUMODE_INVERTED(4'b0000),
  .IS_CARRYIN_INVERTED(1'b0),
  .IS_OPMODE_INVERTED(9'b000000000),
  .IS_RSTALLCARRYIN_INVERTED(1'b0),
  .IS_RSTALUMODE_INVERTED(1'b0),
  .IS_RSTCTRL_INVERTED(1'b0),
  .MREG(MREG_RE),
  .OPMODEREG(OPMODEREG_RE),
  .RESET_MODE(RESET_MODE)
) DSP_ALUREG_RE_INST (
  .ALUMODE_DATA(ALUMODE_DATA_RE),
  .CARRYINSEL_DATA(CARRYINSEL_DATA_RE),
  .CARRYIN_DATA(CARRYIN_DATA_RE),
  .MULTCARRYIN_DATA(MULTCARRYIN_DATA_RE),
  .OPMODE_DATA(OPMODE_DATA_RE),

  .ALUMODE(ALUMODE_RE_in),
  .AMULTMSB(AMULTMSB_RE),
  .ASYNC_RST(ASYNC_RST_in),
  .BMULTMSB(BMULTMSB_RE),
  .CARRYIN(CARRYIN_RE_in),
  .CARRYINSEL(CARRYINSEL_RE),
  .CEALUMODE(CEALUMODE_RE),
  .CECARRYIN(CECARRYIN_RE),
  .CECTRL(CECTRL_RE),
  .CEM(CEM_RE),
  .CLK(CLK_in),
  .OPMODE(OPMODE_RE_in),
  .RSTALLCARRYIN(RSTALLCARRYIN_RE_in),
  .RSTALUMODE(RSTALUMODE_RE_in),
  .RSTCTRL(RSTCTRL_RE_in)
);

  assign INMODE_IM = {BREG_RE_REG[1] | BREG_RE_REG[0], CONJUGATE_A_in, 1'b1, 1'b0, DREG_IM_REG};
  assign INMODE_RE = {BREG_IM_REG[1] | BREG_IM_REG[0], CONJUGATE_B_in, 1'b1, 1'b0, DREG_RE_REG};

DSP_A_B_DATA58 #(
  .ACASCREG(ACASCREG_IM),
  .AMULTSEL("AD"),
  .AREG(AREG_IM),
  .A_INPUT(A_INPUT_IM),
  .BCASCREG(BCASCREG_IM),
  .BMULTSEL("B"),
  .BREG(BREG_IM),
  .B_INPUT(B_INPUT_IM),
  .DSP_MODE("CINT18"),
  .IS_RSTA_INVERTED(1'b0),
  .IS_RSTB_INVERTED(1'b0),
  .RESET_MODE(RESET_MODE)
) DSP_A_B_DATA58_RE_INST (
  .A1_DATA(A1_DATA_RE),
  .A2_DATA(A2_DATA_RE),
  .ACOUT(ACOUT_IM_out),
  .A_ALU(A_ALU_RE),
  .A_CPLX(A_CPLX_RE),
  .A_TO_D_CPLX(A_TO_D_CPLX_RE),
  .B1_DATA(B1_DATA_RE),
  .B2_DATA(B2_DATA_RE),
  .BCOUT(BCOUT_IM_out),
  .B_ALU(B_ALU_RE),

  .A({{16{A_IM_in[17]}}, A_IM_in}),
  .ACIN({{16{ACIN_IM_in[17]}}, ACIN_IM_in}),
  .ASYNC_RST(ASYNC_RST_in),
  .B({{6{B_IM_in[17]}}, B_IM_in}),
  .BCIN({{6{BCIN_IM_in[17]}}, BCIN_IM_in}),
  .CEA1(CEA1_IM_in),
  .CEA2(CEA2_IM_in),
  .CEB1(CEB1_IM_in),
  .CEB2(CEB2_IM_in),
  .CLK(CLK_in),
  .RSTA(RSTA_IM_in),
  .RSTB(RSTB_IM_in)
);

DSP_A_B_DATA58 #(
  .ACASCREG(ACASCREG_RE),
  .AMULTSEL("AD"),
  .AREG(AREG_RE),
  .A_INPUT(A_INPUT_RE),
  .BCASCREG(BCASCREG_RE),
  .BMULTSEL("B"),
  .BREG(BREG_RE),
  .B_INPUT(B_INPUT_RE),
  .DSP_MODE("CINT18"),
  .IS_RSTA_INVERTED(1'b0),
  .IS_RSTB_INVERTED(1'b0),
  .RESET_MODE(RESET_MODE)
) DSP_A_B_DATA58_IM_INST (
  .A1_DATA(A1_DATA_IM),
  .A2_DATA(A2_DATA_IM),
  .ACOUT(ACOUT_RE_out),
  .A_ALU(A_ALU_IM),
  .A_CPLX(A_CPLX_IM),
  .A_TO_D_CPLX(A_TO_D_CPLX_IM),
  .B1_DATA(B1_DATA_IM),
  .B2_DATA(B2_DATA_IM),
  .BCOUT(BCOUT_RE_out),
  .B_ALU(B_ALU_IM),

  .A({{16{A_RE_in[17]}}, A_RE_in}),
  .ACIN({{16{ACIN_RE_in[17]}}, ACIN_RE_in}),
  .ASYNC_RST(ASYNC_RST_in),
  .B({{6{B_RE_in[17]}}, B_RE_in}),
  .BCIN({{6{BCIN_RE_in[17]}}, BCIN_RE_in}),
  .CEA1(CEA1_RE_in),
  .CEA2(CEA2_RE_in),
  .CEB1(CEB1_RE_in),
  .CEB2(CEB2_RE_in),
  .CLK(CLK_in),
  .RSTA(RSTA_RE_in),
  .RSTB(RSTB_RE_in)
);

DSP_C_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .CREG(CREG_IM),
  .DSP_MODE("CINT18"),
  .IS_RSTC_INVERTED(1'b0),
  .RESET_MODE(RESET_MODE)
) DSP_C_DATA58_IM_INST (
  .C_DATA(C_DATA_IM),

  .ASYNC_RST(ASYNC_RST_in),
  .C(C_IM_in),
  .CEC(CEC_IM_in),
  .CLK(CLK_in),
  .RSTC(RSTC_IM_in)
);

DSP_C_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .CREG(CREG_RE),
  .DSP_MODE("CINT18"),
  .IS_RSTC_INVERTED(1'b0),
  .RESET_MODE(RESET_MODE)
) DSP_C_DATA58_RE_INST (
  .C_DATA(C_DATA_RE),

  .ASYNC_RST(ASYNC_RST_in),
  .C(C_RE_in),
  .CEC(CEC_RE_in),
  .CLK(CLK_in),
  .RSTC(RSTC_RE_in)
);

DSP_MULTIPLIER58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .AMULTSEL("AD"),
  .BMULTSEL("B"),
  .DSP_MODE("CINT18"),
  .LEGACY("DSP58"),
  .USE_MULT("MULTIPLY")
) DSP_MULTIPLIER58_IM_INST (
  .AMULTMSB(AMULTMSB_IM),
  .BMULTMSB(BMULTMSB_IM),
  .U(U_IM),
  .U0U2_INT8(U0U2_INT8_IM),
  .U1_INT8(U1_INT8_IM),
  .V(V_IM),
  .V0V2_INT8(V0V2_INT8_IM),
  .V1_INT8(V1_INT8_IM),

  .A2A1(A2A1_IM),
  .AD_DATA(AD_DATA_IM),
  .B2B1(B2B1_IM),
  .NEGATE_DATA(NEGATE_DATA_IM)
);

DSP_MULTIPLIER58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .AMULTSEL("AD"),
  .BMULTSEL("B"),
  .DSP_MODE("CINT18"),
  .LEGACY("DSP58"),
  .USE_MULT("MULTIPLY")
) DSP_MULTIPLIER58_RE_INST (
  .AMULTMSB(AMULTMSB_RE),
  .BMULTMSB(BMULTMSB_RE),
  .U(U_RE),
  .U0U2_INT8(U0U2_INT8_RE),
  .U1_INT8(U1_INT8_RE),
  .V(V_RE),
  .V0V2_INT8(V0V2_INT8_RE),
  .V1_INT8(V1_INT8_RE),

  .A2A1(A2A1_RE),
  .AD_DATA(AD_DATA_RE),
  .B2B1(B2B1_RE),
  .NEGATE_DATA(NEGATE_DATA_RE)
);

DSP_M_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18"),
  .IS_RSTM_INVERTED(1'b0),
  .MREG(MREG_IM),
  .RESET_MODE(RESET_MODE)
) DSP_M_DATA58_IM_INST (
  .U_DATA(U_DATA_IM),
  .V_DATA(V_DATA_IM),

  .ASYNC_RST(ASYNC_RST_in),
  .CEM(CEM_IM),
  .CLK(CLK_in),
  .RSTM(RSTM_IM_in),
  .U(U_IM),
  .U0U2_INT8(U0U2_INT8_IM),
  .U1_INT8(U1_INT8_IM),
  .U_CPLX(U_CPLX),
  .V(V_IM),
  .V0V2_INT8(V0V2_INT8_IM),
  .V1_INT8(V1_INT8_IM),
  .V_CPLX(V_CPLX)
);

DSP_M_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18"),
  .IS_RSTM_INVERTED(1'b0),
  .MREG(MREG_RE),
  .RESET_MODE(RESET_MODE)
) DSP_M_DATA58_RE_INST (
  .U_DATA(U_DATA_RE),
  .V_DATA(V_DATA_RE),

  .ASYNC_RST(ASYNC_RST_in),
  .CEM(CEM_RE),
  .CLK(CLK_in),
  .RSTM(RSTM_RE_in),
  .U(U_RE),
  .U0U2_INT8(U0U2_INT8_RE),
  .U1_INT8(U1_INT8_RE),
  .U_CPLX(U_CPLX),
  .V(V_RE),
  .V0V2_INT8(V0V2_INT8_RE),
  .V1_INT8(V1_INT8_RE),
  .V_CPLX(V_CPLX)
);

DSP_OUTPUT58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .AUTORESET_PATDET(AUTORESET_PATDET_IM),
  .AUTORESET_PRIORITY(AUTORESET_PRIORITY_IM),
  .DSP_MODE("CINT18"),
  .IS_RSTP_INVERTED(1'b0),
  .LEGACY("DSP58"),
  .PREG(PREG_IM),
  .RESET_MODE(RESET_MODE)
) DSP_OUTPUT58_IM_INST (
  .CARRYCASCOUT(CARRYCASCOUT_IM),
  .CARRYCASCOUT_FB(CARRYCASCOUT_FB_IM),
  .CARRYOUT(CARRYOUT_IM_out),
  .MULTSIGNOUT(MULTSIGNOUT_IM),
  .OVERFLOW(OVERFLOW_IM),
  .P(P_IM),
  .PATTERNBDETECT(PATTERNBDETECT_IM),
  .PATTERNDETECT(PATTERNDETECT_IM),
  .PCOUT(PCOUT_IM),
  .P_FDBK(P_FDBK_IM),
  .P_FDBK_MSB(P_FDBK_MSB_IM),
  .UNDERFLOW(UNDERFLOW_IM),
  .XOROUT(XOROUT_IM),

  .ALUMODE10(ALUMODE10_IM),
  .ALU_OUT(ALU_OUT_IM),
  .ASYNC_RST(ASYNC_RST_in),
  .CEP(CEP_IM),
  .CLK(CLK_in),
  .COUT(COUT_IM),
  .MULTSIGN_ALU(MULTSIGN_ALU_IM),
  .PATT_B_DET(PATT_B_DET_IM),
  .PATT_DET(PATT_DET_IM),
  .RSTP(RSTP_IM_in),
  .XOR_MX(XOR_MX_IM)
);

DSP_OUTPUT58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .AUTORESET_PATDET(AUTORESET_PATDET_RE),
  .AUTORESET_PRIORITY(AUTORESET_PRIORITY_RE),
  .DSP_MODE("CINT18"),
  .IS_RSTP_INVERTED(1'b0),
  .LEGACY("DSP58"),
  .PREG(PREG_RE),
  .RESET_MODE(RESET_MODE)
) DSP_OUTPUT58_RE_INST (
  .CARRYCASCOUT(CARRYCASCOUT_RE),
  .CARRYCASCOUT_FB(CARRYCASCOUT_FB_RE),
  .CARRYOUT(CARRYOUT_RE_out),
  .MULTSIGNOUT(MULTSIGNOUT_RE),
  .OVERFLOW(OVERFLOW_RE),
  .P(P_RE),
  .PATTERNBDETECT(PATTERNBDETECT_RE),
  .PATTERNDETECT(PATTERNDETECT_RE),
  .PCOUT(PCOUT_RE),
  .P_FDBK(P_FDBK_RE),
  .P_FDBK_MSB(P_FDBK_MSB_RE),
  .UNDERFLOW(UNDERFLOW_RE),
  .XOROUT(XOROUT_RE),

  .ALUMODE10(ALUMODE10_RE),
  .ALU_OUT(ALU_OUT_RE),
  .ASYNC_RST(ASYNC_RST_in),
  .CEP(CEP_RE),
  .CLK(CLK_in),
  .COUT(COUT_RE),
  .MULTSIGN_ALU(MULTSIGN_ALU_RE),
  .PATT_B_DET(PATT_B_DET_RE),
  .PATT_DET(PATT_DET_RE),
  .RSTP(RSTP_RE_in),
  .XOR_MX(XOR_MX_RE)
);

DSP_PATDET #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .MASK(MASK_IM),
  .PATTERN(PATTERN_IM),
  .SEL_MASK(SEL_MASK_IM),
  .SEL_PATTERN(SEL_PATTERN_IM),
  .USE_PATTERN_DETECT(USE_PATTERN_DETECT_IM)
) DSP_PATDET_IM_INST (
  .PATT_B_DET(PATT_B_DET_IM),
  .PATT_DET(PATT_DET_IM),

  .ALU_OUT(ALU_OUT_IM),
  .C_DATA(C_DATA_IM)
);

DSP_PATDET #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .MASK(MASK_RE),
  .PATTERN(PATTERN_RE),
  .SEL_MASK(SEL_MASK_RE),
  .SEL_PATTERN(SEL_PATTERN_RE),
  .USE_PATTERN_DETECT(USE_PATTERN_DETECT_RE)
) DSP_PATDET_RE_INST (
  .PATT_B_DET(PATT_B_DET_RE),
  .PATT_DET(PATT_DET_RE),

  .ALU_OUT(ALU_OUT_RE),
  .C_DATA(C_DATA_RE)
);

DSP_PREADD58
#(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18")
) DSP_PREADD58_IM_INST (
  .AD(AD_IM),

  .ADDSUB(ADDSUB_IM),
  .D_DATA(D_DATA_IM),
  .INMODE_2(INMODE_2_IM),
  .PREADD_AB(PREADD_AB_IM)
);

DSP_PREADD58
#(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .DSP_MODE("CINT18")
) DSP_PREADD58_RE_INST (
  .AD(AD_RE),

  .ADDSUB(ADDSUB_RE),
  .D_DATA(D_DATA_RE),
  .INMODE_2(INMODE_2_RE),
  .PREADD_AB(PREADD_AB_RE)
);

DSP_CPLX_STAGE1 DSP_CPLX_STAGE1_INST 
(
  .U_CPLX(U_CPLX),
  .V_CPLX(V_CPLX),

  .AD_DATA_CPLX_DSPL(AD_DATA_CPLX_IM),
  .AD_DATA_CPLX_DSPR(AD_DATA_CPLX_RE),
  .A_CPLX_L(A_CPLX_IM)
);

wire CONJ_CPLX_PREADD_IN_IM;
wire CONJ_CPLX_PREADD_IN_RE;
wire CONJ_CPLX_OUT_IM;
wire CONJ_CPLX_OUT_RE;
wire CONJ_CPLX_MULT_IN_IM;
wire CONJ_CPLX_MULT_IN_RE;

DSP_CPLX_STAGE0 DSP_CPLX_STAGE0_INST
(
  .AD_CPLX_DSPL(AD_CPLX_IM),
  .AD_CPLX_DSPR(AD_CPLX_RE),
  .CONJ_DSP_L_MULT_OUT(CONJ_CPLX_MULT_IN_IM),
  .CONJ_DSP_L_PREADD_OUT(CONJ_CPLX_PREADD_IN_IM),
  .CONJ_DSP_R_MULT_OUT(CONJ_CPLX_MULT_IN_RE),
  .CONJ_DSP_R_PREADD_OUT(CONJ_CPLX_PREADD_IN_RE),

  .B2B1_CPLX_L(B2B1_CPLX_IM),
  .B2B1_CPLX_R(B2B1_CPLX_RE),
  .CONJ_DSP_L_IN(CONJ_CPLX_OUT_IM),
  .CONJ_DSP_R_IN(CONJ_CPLX_OUT_RE)
);

DSP_PREADD_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .ADREG(ADREG),
  .AMULTSEL("AD"),
  .AREG(AREG_RE),
  .BMULTSEL("B"),
  .BREG(BREG_RE),
  .DREG(DREG_IM),
  .DSP_MODE("CINT18"),
  .INMODEREG(CONJUGATEREG_A),
  .IS_INMODE_INVERTED(5'b00000),
  .IS_NEGATE_INVERTED(3'b000),
  .IS_RSTINMODE_INVERTED(1'b0),
  .LEGACY("DSP58"),
  .MREG(MREG_IM),
  .PREADDINSEL("A"),
  .RESET_MODE(RESET_MODE),
  .USE_MULT("MULTIPLY")
) DSP_PREADD_DATA58_IM_INST (
  .A2A1(A2A1_IM),
  .ADDSUB(ADDSUB_IM),
  .AD_DATA(AD_DATA_IM),
  .AD_DATA_CPLX(AD_DATA_CPLX_IM),
  .B2B1(B2B1_IM),
  .B2B1_CPLX(B2B1_CPLX_IM),
  .CONJ_CPLX_OUT(CONJ_CPLX_OUT_IM),
  .D_DATA(D_DATA_IM),
  .INMODE_2(INMODE_2_IM),
  .NEGATE_DATA(NEGATE_DATA_IM),
  .PREADD_AB(PREADD_AB_IM),

  .A1_DATA(A1_DATA_IM),
  .A2_DATA(A2_DATA_IM),
  .AD(AD_IM),
  .AD_CPLX(AD_CPLX_IM),
  .ASYNC_RST(ASYNC_RST_in),
  .B1_DATA(B1_DATA_IM),
  .B2_DATA(B2_DATA_IM),
  .CEAD_IN(CEAD_in),
  .CED_IN(CEA1_IM_in),
  .CEINMODE(CECONJUGATE_A_in),
  .CLK(CLK_in),
  .CONJ_CPLX_MULT_IN(CONJ_CPLX_MULT_IN_IM),
  .CONJ_CPLX_PREADD_IN(CONJ_CPLX_PREADD_IN_IM),
  .DIN(27'b0),
  .D_FROM_A_CPLX(A_TO_D_CPLX_RE),
  .INMODE(INMODE_IM),
  .NEGATE(3'b0),
  .RSTAD(RSTAD_in),
  .RSTD(RSTA_IM_in),
  .RSTINMODE(RSTCONJUGATE_A_in)
);

DSP_PREADD_DATA58 #(
`ifdef XIL_TIMING
  .LOC(LOC),
`endif
  .ADREG(ADREG),
  .AMULTSEL("AD"),
  .AREG(AREG_IM),
  .BMULTSEL("B"),
  .BREG(BREG_IM),
  .DREG(DREG_RE),
  .DSP_MODE("CINT18"),
  .INMODEREG(CONJUGATEREG_B),
  .IS_INMODE_INVERTED(5'b00000),
  .IS_NEGATE_INVERTED(3'b000),
  .IS_RSTINMODE_INVERTED(1'b0),
  .LEGACY("DSP58"),
  .MREG(MREG_RE),
  .PREADDINSEL("A"),
  .RESET_MODE(RESET_MODE),
  .USE_MULT("MULTIPLY")
) DSP_PREADD_DATA58_RE_INST (
  .A2A1(A2A1_RE),
  .ADDSUB(ADDSUB_RE),
  .AD_DATA(AD_DATA_RE),
  .AD_DATA_CPLX(AD_DATA_CPLX_RE),
  .B2B1(B2B1_RE),
  .B2B1_CPLX(B2B1_CPLX_RE),
  .CONJ_CPLX_OUT(CONJ_CPLX_OUT_RE),
  .D_DATA(D_DATA_RE),
  .INMODE_2(INMODE_2_RE),
  .NEGATE_DATA(NEGATE_DATA_RE),
  .PREADD_AB(PREADD_AB_RE),

  .A1_DATA(A1_DATA_RE),
  .A2_DATA(A2_DATA_RE),
  .AD(AD_RE),
  .AD_CPLX(AD_CPLX_RE),
  .ASYNC_RST(ASYNC_RST_in),
  .B1_DATA(B1_DATA_RE),
  .B2_DATA(B2_DATA_RE),
  .CEAD_IN(CEAD_in),
  .CED_IN(CEA1_RE_in),
  .CEINMODE(CECONJUGATE_B_in),
  .CLK(CLK_in),
  .CONJ_CPLX_MULT_IN(CONJ_CPLX_MULT_IN_RE),
  .CONJ_CPLX_PREADD_IN(CONJ_CPLX_PREADD_IN_RE),
  .DIN(27'b0),
  .D_FROM_A_CPLX(A_TO_D_CPLX_IM),
  .INMODE(INMODE_RE),
  .NEGATE(3'b0),
  .RSTAD(RSTAD_in),
  .RSTD(RSTA_RE_in),
  .RSTINMODE(RSTCONJUGATE_B_in)
);

// end behavioral model

endmodule

`endcelldefine
