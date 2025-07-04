///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSPFP32
// /___/   /\      Filename    : DSPFP32.v
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

module DSPFP32 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ACASCREG = 1,
  parameter integer AREG = 1,
  parameter A_FPTYPE = "B32",
  parameter A_INPUT = "DIRECT",
  parameter BCASCSEL = "B",
  parameter B_D_FPTYPE = "B32",
  parameter B_INPUT = "DIRECT",
  parameter integer FPA_PREG = 1,
  parameter integer FPBREG = 1,
  parameter integer FPCREG = 3,
  parameter integer FPDREG = 1,
  parameter integer FPMPIPEREG = 1,
  parameter integer FPM_PREG = 1,
  parameter integer FPOPMREG = 3,
  parameter integer INMODEREG = 1,
  parameter [0:0] IS_ASYNC_RST_INVERTED = 1'b0,
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_FPINMODE_INVERTED = 1'b0,
  parameter [6:0] IS_FPOPMODE_INVERTED = 7'b0000000,
  parameter [0:0] IS_RSTA_INVERTED = 1'b0,
  parameter [0:0] IS_RSTB_INVERTED = 1'b0,
  parameter [0:0] IS_RSTC_INVERTED = 1'b0,
  parameter [0:0] IS_RSTD_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPA_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPINMODE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPMPIPE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPM_INVERTED = 1'b0,
  parameter [0:0] IS_RSTFPOPMODE_INVERTED = 1'b0,
  parameter PCOUTSEL = "FPA",
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [7:0] ACOUT_EXP,
  output [22:0] ACOUT_MAN,
  output ACOUT_SIGN,
  output [7:0] BCOUT_EXP,
  output [22:0] BCOUT_MAN,
  output BCOUT_SIGN,
  output FPA_INVALID,
  output [31:0] FPA_OUT,
  output FPA_OVERFLOW,
  output FPA_UNDERFLOW,
  output FPM_INVALID,
  output [31:0] FPM_OUT,
  output FPM_OVERFLOW,
  output FPM_UNDERFLOW,
  output [31:0] PCOUT,

  input [7:0] ACIN_EXP,
  input [22:0] ACIN_MAN,
  input ACIN_SIGN,
  input ASYNC_RST,
  input [7:0] A_EXP,
  input [22:0] A_MAN,
  input A_SIGN,
  input [7:0] BCIN_EXP,
  input [22:0] BCIN_MAN,
  input BCIN_SIGN,
  input [7:0] B_EXP,
  input [22:0] B_MAN,
  input B_SIGN,
  input [31:0] C,
  input CEA1,
  input CEA2,
  input CEB,
  input CEC,
  input CED,
  input CEFPA,
  input CEFPINMODE,
  input CEFPM,
  input CEFPMPIPE,
  input CEFPOPMODE,
  input CLK,
  input [7:0] D_EXP,
  input [22:0] D_MAN,
  input D_SIGN,
  input FPINMODE,
  input [6:0] FPOPMODE,
  input [31:0] PCIN,
  input RSTA,
  input RSTB,
  input RSTC,
  input RSTD,
  input RSTFPA,
  input RSTFPINMODE,
  input RSTFPM,
  input RSTFPMPIPE,
  input RSTFPOPMODE
);
  
// define constants
  localparam MODULE_NAME = "DSPFP32";

// Parameter encodings and registers
  localparam A_FPTYPE_B16 = 1;
  localparam A_FPTYPE_B32 = 0;
  localparam A_INPUT_CASCADE = 1;
  localparam A_INPUT_DIRECT = 0;
  localparam BCASCSEL_B = 0;
  localparam BCASCSEL_D = 1;
  localparam B_D_FPTYPE_B16 = 1;
  localparam B_D_FPTYPE_B32 = 0;
  localparam B_INPUT_CASCADE = 1;
  localparam B_INPUT_DIRECT = 0;
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
  `include "DSPFP32_dr.v"
`else
  reg [31:0] ACASCREG_REG = ACASCREG;
  reg [31:0] AREG_REG = AREG;
  reg [24:1] A_FPTYPE_REG = A_FPTYPE;
  reg [56:1] A_INPUT_REG = A_INPUT;
  reg [8:1] BCASCSEL_REG = BCASCSEL;
  reg [24:1] B_D_FPTYPE_REG = B_D_FPTYPE;
  reg [56:1] B_INPUT_REG = B_INPUT;
  reg [31:0] FPA_PREG_REG = FPA_PREG;
  reg [31:0] FPBREG_REG = FPBREG;
  reg [31:0] FPCREG_REG = FPCREG;
  reg [31:0] FPDREG_REG = FPDREG;
  reg [31:0] FPMPIPEREG_REG = FPMPIPEREG;
  reg [31:0] FPM_PREG_REG = FPM_PREG;
  reg [31:0] FPOPMREG_REG = FPOPMREG;
  reg [31:0] INMODEREG_REG = INMODEREG;
  reg [0:0] IS_ASYNC_RST_INVERTED_REG = IS_ASYNC_RST_INVERTED;
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [0:0] IS_FPINMODE_INVERTED_REG = IS_FPINMODE_INVERTED;
  reg [6:0] IS_FPOPMODE_INVERTED_REG = IS_FPOPMODE_INVERTED;
  reg [0:0] IS_RSTA_INVERTED_REG = IS_RSTA_INVERTED;
  reg [0:0] IS_RSTB_INVERTED_REG = IS_RSTB_INVERTED;
  reg [0:0] IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
  reg [0:0] IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;
  reg [0:0] IS_RSTFPA_INVERTED_REG = IS_RSTFPA_INVERTED;
  reg [0:0] IS_RSTFPINMODE_INVERTED_REG = IS_RSTFPINMODE_INVERTED;
  reg [0:0] IS_RSTFPMPIPE_INVERTED_REG = IS_RSTFPMPIPE_INVERTED;
  reg [0:0] IS_RSTFPM_INVERTED_REG = IS_RSTFPM_INVERTED;
  reg [0:0] IS_RSTFPOPMODE_INVERTED_REG = IS_RSTFPOPMODE_INVERTED;
  reg [24:1] PCOUTSEL_REG = PCOUTSEL;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire [1:0] ACASCREG_BIN;
  wire [1:0] AREG_BIN;
  wire A_FPTYPE_BIN;
  wire A_INPUT_BIN;
  wire BCASCSEL_BIN;
  wire B_D_FPTYPE_BIN;
  wire B_INPUT_BIN;
  wire FPA_PREG_BIN;
  wire FPBREG_BIN;
  wire [1:0] FPCREG_BIN;
  wire FPDREG_BIN;
  wire FPMPIPEREG_BIN;
  wire FPM_PREG_BIN;
  wire [1:0] FPOPMREG_BIN;
  wire INMODEREG_BIN;
  wire PCOUTSEL_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg [1:0] ACASCREG_BIN;
  reg [1:0] AREG_BIN;
  reg A_FPTYPE_BIN;
  reg A_INPUT_BIN;
  reg BCASCSEL_BIN;
  reg B_D_FPTYPE_BIN;
  reg B_INPUT_BIN;
  reg FPA_PREG_BIN;
  reg FPBREG_BIN;
  reg [1:0] FPCREG_BIN;
  reg FPDREG_BIN;
  reg FPMPIPEREG_BIN;
  reg FPM_PREG_BIN;
  reg [1:0] FPOPMREG_BIN;
  reg INMODEREG_BIN;
  reg PCOUTSEL_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ACIN_SIGN_in;
  wire ASYNC_RST_in;
  wire A_SIGN_in;
  wire BCIN_SIGN_in;
  wire B_SIGN_in;
  wire CEA1_in;
  wire CEA2_in;
  wire CEB_in;
  wire CEC_in;
  wire CED_in;
  wire CEFPA_in;
  wire CEFPINMODE_in;
  wire CEFPMPIPE_in;
  wire CEFPM_in;
  wire CEFPOPMODE_in;
  wire CLK_in;
  wire D_SIGN_in;
  wire FPINMODE_in;
  wire RSTA_in;
  wire RSTB_in;
  wire RSTC_in;
  wire RSTD_in;
  wire RSTFPA_in;
  wire RSTFPINMODE_in;
  wire RSTFPMPIPE_in;
  wire RSTFPM_in;
  wire RSTFPOPMODE_in;
  wire [22:0] ACIN_MAN_in;
  wire [22:0] A_MAN_in;
  wire [22:0] BCIN_MAN_in;
  wire [22:0] B_MAN_in;
  wire [22:0] D_MAN_in;
  wire [31:0] C_in;
  wire [31:0] PCIN_in;
  wire [6:0] FPOPMODE_in;
  wire [7:0] ACIN_EXP_in;
  wire [7:0] A_EXP_in;
  wire [7:0] BCIN_EXP_in;
  wire [7:0] B_EXP_in;
  wire [7:0] D_EXP_in;

  assign ACIN_EXP_in = ACIN_EXP;
  assign ACIN_MAN_in = ACIN_MAN;
  assign ACIN_SIGN_in = ACIN_SIGN;
  assign ASYNC_RST_in = (ASYNC_RST !== 1'bz) && (ASYNC_RST ^ IS_ASYNC_RST_INVERTED_REG); // rv 0
  assign A_EXP_in[0] = (A_EXP[0] === 1'bz) || A_EXP[0]; // rv 1
  assign A_EXP_in[1] = (A_EXP[1] === 1'bz) || A_EXP[1]; // rv 1
  assign A_EXP_in[2] = (A_EXP[2] === 1'bz) || A_EXP[2]; // rv 1
  assign A_EXP_in[3] = (A_EXP[3] === 1'bz) || A_EXP[3]; // rv 1
  assign A_EXP_in[4] = (A_EXP[4] === 1'bz) || A_EXP[4]; // rv 1
  assign A_EXP_in[5] = (A_EXP[5] === 1'bz) || A_EXP[5]; // rv 1
  assign A_EXP_in[6] = (A_EXP[6] === 1'bz) || A_EXP[6]; // rv 1
  assign A_EXP_in[7] = (A_EXP[7] === 1'bz) || A_EXP[7]; // rv 1
  assign A_MAN_in[0] = (A_MAN[0] === 1'bz) || A_MAN[0]; // rv 1
  assign A_MAN_in[10] = (A_MAN[10] === 1'bz) || A_MAN[10]; // rv 1
  assign A_MAN_in[11] = (A_MAN[11] === 1'bz) || A_MAN[11]; // rv 1
  assign A_MAN_in[12] = (A_MAN[12] === 1'bz) || A_MAN[12]; // rv 1
  assign A_MAN_in[13] = (A_MAN[13] === 1'bz) || A_MAN[13]; // rv 1
  assign A_MAN_in[14] = (A_MAN[14] === 1'bz) || A_MAN[14]; // rv 1
  assign A_MAN_in[15] = (A_MAN[15] === 1'bz) || A_MAN[15]; // rv 1
  assign A_MAN_in[16] = (A_MAN[16] === 1'bz) || A_MAN[16]; // rv 1
  assign A_MAN_in[17] = (A_MAN[17] === 1'bz) || A_MAN[17]; // rv 1
  assign A_MAN_in[18] = (A_MAN[18] === 1'bz) || A_MAN[18]; // rv 1
  assign A_MAN_in[19] = (A_MAN[19] === 1'bz) || A_MAN[19]; // rv 1
  assign A_MAN_in[1] = (A_MAN[1] === 1'bz) || A_MAN[1]; // rv 1
  assign A_MAN_in[20] = (A_MAN[20] === 1'bz) || A_MAN[20]; // rv 1
  assign A_MAN_in[21] = (A_MAN[21] === 1'bz) || A_MAN[21]; // rv 1
  assign A_MAN_in[22] = (A_MAN[22] === 1'bz) || A_MAN[22]; // rv 1
  assign A_MAN_in[2] = (A_MAN[2] === 1'bz) || A_MAN[2]; // rv 1
  assign A_MAN_in[3] = (A_MAN[3] === 1'bz) || A_MAN[3]; // rv 1
  assign A_MAN_in[4] = (A_MAN[4] === 1'bz) || A_MAN[4]; // rv 1
  assign A_MAN_in[5] = (A_MAN[5] === 1'bz) || A_MAN[5]; // rv 1
  assign A_MAN_in[6] = (A_MAN[6] === 1'bz) || A_MAN[6]; // rv 1
  assign A_MAN_in[7] = (A_MAN[7] === 1'bz) || A_MAN[7]; // rv 1
  assign A_MAN_in[8] = (A_MAN[8] === 1'bz) || A_MAN[8]; // rv 1
  assign A_MAN_in[9] = (A_MAN[9] === 1'bz) || A_MAN[9]; // rv 1
  assign A_SIGN_in = (A_SIGN === 1'bz) || A_SIGN; // rv 1
  assign BCIN_EXP_in = BCIN_EXP;
  assign BCIN_MAN_in = BCIN_MAN;
  assign BCIN_SIGN_in = BCIN_SIGN;
  assign B_EXP_in[0] = (B_EXP[0] === 1'bz) || B_EXP[0]; // rv 1
  assign B_EXP_in[1] = (B_EXP[1] === 1'bz) || B_EXP[1]; // rv 1
  assign B_EXP_in[2] = (B_EXP[2] === 1'bz) || B_EXP[2]; // rv 1
  assign B_EXP_in[3] = (B_EXP[3] === 1'bz) || B_EXP[3]; // rv 1
  assign B_EXP_in[4] = (B_EXP[4] === 1'bz) || B_EXP[4]; // rv 1
  assign B_EXP_in[5] = (B_EXP[5] === 1'bz) || B_EXP[5]; // rv 1
  assign B_EXP_in[6] = (B_EXP[6] === 1'bz) || B_EXP[6]; // rv 1
  assign B_EXP_in[7] = (B_EXP[7] === 1'bz) || B_EXP[7]; // rv 1
  assign B_MAN_in[0] = (B_MAN[0] === 1'bz) || B_MAN[0]; // rv 1
  assign B_MAN_in[10] = (B_MAN[10] === 1'bz) || B_MAN[10]; // rv 1
  assign B_MAN_in[11] = (B_MAN[11] === 1'bz) || B_MAN[11]; // rv 1
  assign B_MAN_in[12] = (B_MAN[12] === 1'bz) || B_MAN[12]; // rv 1
  assign B_MAN_in[13] = (B_MAN[13] === 1'bz) || B_MAN[13]; // rv 1
  assign B_MAN_in[14] = (B_MAN[14] === 1'bz) || B_MAN[14]; // rv 1
  assign B_MAN_in[15] = (B_MAN[15] === 1'bz) || B_MAN[15]; // rv 1
  assign B_MAN_in[16] = (B_MAN[16] === 1'bz) || B_MAN[16]; // rv 1
  assign B_MAN_in[17] = (B_MAN[17] === 1'bz) || B_MAN[17]; // rv 1
  assign B_MAN_in[18] = (B_MAN[18] === 1'bz) || B_MAN[18]; // rv 1
  assign B_MAN_in[19] = (B_MAN[19] === 1'bz) || B_MAN[19]; // rv 1
  assign B_MAN_in[1] = (B_MAN[1] === 1'bz) || B_MAN[1]; // rv 1
  assign B_MAN_in[20] = (B_MAN[20] === 1'bz) || B_MAN[20]; // rv 1
  assign B_MAN_in[21] = (B_MAN[21] === 1'bz) || B_MAN[21]; // rv 1
  assign B_MAN_in[22] = (B_MAN[22] === 1'bz) || B_MAN[22]; // rv 1
  assign B_MAN_in[2] = (B_MAN[2] === 1'bz) || B_MAN[2]; // rv 1
  assign B_MAN_in[3] = (B_MAN[3] === 1'bz) || B_MAN[3]; // rv 1
  assign B_MAN_in[4] = (B_MAN[4] === 1'bz) || B_MAN[4]; // rv 1
  assign B_MAN_in[5] = (B_MAN[5] === 1'bz) || B_MAN[5]; // rv 1
  assign B_MAN_in[6] = (B_MAN[6] === 1'bz) || B_MAN[6]; // rv 1
  assign B_MAN_in[7] = (B_MAN[7] === 1'bz) || B_MAN[7]; // rv 1
  assign B_MAN_in[8] = (B_MAN[8] === 1'bz) || B_MAN[8]; // rv 1
  assign B_MAN_in[9] = (B_MAN[9] === 1'bz) || B_MAN[9]; // rv 1
  assign B_SIGN_in = (B_SIGN === 1'bz) || B_SIGN; // rv 1
  assign CEA1_in = (CEA1 !== 1'bz) && CEA1; // rv 0
  assign CEA2_in = (CEA2 !== 1'bz) && CEA2; // rv 0
  assign CEB_in = (CEB !== 1'bz) && CEB; // rv 0
  assign CEC_in = (CEC !== 1'bz) && CEC; // rv 0
  assign CED_in = (CED !== 1'bz) && CED; // rv 0
  assign CEFPA_in = (CEFPA !== 1'bz) && CEFPA; // rv 0
  assign CEFPINMODE_in = CEFPINMODE;
  assign CEFPMPIPE_in = (CEFPMPIPE !== 1'bz) && CEFPMPIPE; // rv 0
  assign CEFPM_in = (CEFPM !== 1'bz) && CEFPM; // rv 0
  assign CEFPOPMODE_in = (CEFPOPMODE !== 1'bz) && CEFPOPMODE; // rv 0
  assign CLK_in = (CLK !== 1'bz) && (CLK ^ IS_CLK_INVERTED_REG); // rv 0
  assign C_in[0] = (C[0] === 1'bz) || C[0]; // rv 1
  assign C_in[10] = (C[10] === 1'bz) || C[10]; // rv 1
  assign C_in[11] = (C[11] === 1'bz) || C[11]; // rv 1
  assign C_in[12] = (C[12] === 1'bz) || C[12]; // rv 1
  assign C_in[13] = (C[13] === 1'bz) || C[13]; // rv 1
  assign C_in[14] = (C[14] === 1'bz) || C[14]; // rv 1
  assign C_in[15] = (C[15] === 1'bz) || C[15]; // rv 1
  assign C_in[16] = (C[16] === 1'bz) || C[16]; // rv 1
  assign C_in[17] = (C[17] === 1'bz) || C[17]; // rv 1
  assign C_in[18] = (C[18] === 1'bz) || C[18]; // rv 1
  assign C_in[19] = (C[19] === 1'bz) || C[19]; // rv 1
  assign C_in[1] = (C[1] === 1'bz) || C[1]; // rv 1
  assign C_in[20] = (C[20] === 1'bz) || C[20]; // rv 1
  assign C_in[21] = (C[21] === 1'bz) || C[21]; // rv 1
  assign C_in[22] = (C[22] === 1'bz) || C[22]; // rv 1
  assign C_in[23] = (C[23] === 1'bz) || C[23]; // rv 1
  assign C_in[24] = (C[24] === 1'bz) || C[24]; // rv 1
  assign C_in[25] = (C[25] === 1'bz) || C[25]; // rv 1
  assign C_in[26] = (C[26] === 1'bz) || C[26]; // rv 1
  assign C_in[27] = (C[27] === 1'bz) || C[27]; // rv 1
  assign C_in[28] = (C[28] === 1'bz) || C[28]; // rv 1
  assign C_in[29] = (C[29] === 1'bz) || C[29]; // rv 1
  assign C_in[2] = (C[2] === 1'bz) || C[2]; // rv 1
  assign C_in[30] = (C[30] === 1'bz) || C[30]; // rv 1
  assign C_in[31] = (C[31] === 1'bz) || C[31]; // rv 1
  assign C_in[3] = (C[3] === 1'bz) || C[3]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C[4]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C[9]; // rv 1
  assign D_EXP_in[0] = (D_EXP[0] === 1'bz) || D_EXP[0]; // rv 1
  assign D_EXP_in[1] = (D_EXP[1] === 1'bz) || D_EXP[1]; // rv 1
  assign D_EXP_in[2] = (D_EXP[2] === 1'bz) || D_EXP[2]; // rv 1
  assign D_EXP_in[3] = (D_EXP[3] === 1'bz) || D_EXP[3]; // rv 1
  assign D_EXP_in[4] = (D_EXP[4] === 1'bz) || D_EXP[4]; // rv 1
  assign D_EXP_in[5] = (D_EXP[5] === 1'bz) || D_EXP[5]; // rv 1
  assign D_EXP_in[6] = (D_EXP[6] === 1'bz) || D_EXP[6]; // rv 1
  assign D_EXP_in[7] = (D_EXP[7] === 1'bz) || D_EXP[7]; // rv 1
  assign D_MAN_in[0] = (D_MAN[0] === 1'bz) || D_MAN[0]; // rv 1
  assign D_MAN_in[10] = (D_MAN[10] === 1'bz) || D_MAN[10]; // rv 1
  assign D_MAN_in[11] = (D_MAN[11] === 1'bz) || D_MAN[11]; // rv 1
  assign D_MAN_in[12] = (D_MAN[12] === 1'bz) || D_MAN[12]; // rv 1
  assign D_MAN_in[13] = (D_MAN[13] === 1'bz) || D_MAN[13]; // rv 1
  assign D_MAN_in[14] = (D_MAN[14] === 1'bz) || D_MAN[14]; // rv 1
  assign D_MAN_in[15] = (D_MAN[15] === 1'bz) || D_MAN[15]; // rv 1
  assign D_MAN_in[16] = (D_MAN[16] === 1'bz) || D_MAN[16]; // rv 1
  assign D_MAN_in[17] = (D_MAN[17] === 1'bz) || D_MAN[17]; // rv 1
  assign D_MAN_in[18] = (D_MAN[18] === 1'bz) || D_MAN[18]; // rv 1
  assign D_MAN_in[19] = (D_MAN[19] === 1'bz) || D_MAN[19]; // rv 1
  assign D_MAN_in[1] = (D_MAN[1] === 1'bz) || D_MAN[1]; // rv 1
  assign D_MAN_in[20] = (D_MAN[20] === 1'bz) || D_MAN[20]; // rv 1
  assign D_MAN_in[21] = (D_MAN[21] === 1'bz) || D_MAN[21]; // rv 1
  assign D_MAN_in[22] = (D_MAN[22] === 1'bz) || D_MAN[22]; // rv 1
  assign D_MAN_in[2] = (D_MAN[2] === 1'bz) || D_MAN[2]; // rv 1
  assign D_MAN_in[3] = (D_MAN[3] === 1'bz) || D_MAN[3]; // rv 1
  assign D_MAN_in[4] = (D_MAN[4] === 1'bz) || D_MAN[4]; // rv 1
  assign D_MAN_in[5] = (D_MAN[5] === 1'bz) || D_MAN[5]; // rv 1
  assign D_MAN_in[6] = (D_MAN[6] === 1'bz) || D_MAN[6]; // rv 1
  assign D_MAN_in[7] = (D_MAN[7] === 1'bz) || D_MAN[7]; // rv 1
  assign D_MAN_in[8] = (D_MAN[8] === 1'bz) || D_MAN[8]; // rv 1
  assign D_MAN_in[9] = (D_MAN[9] === 1'bz) || D_MAN[9]; // rv 1
  assign D_SIGN_in = (D_SIGN === 1'bz) || D_SIGN; // rv 1
  assign FPINMODE_in = (FPINMODE !== 1'bz) && (FPINMODE ^ IS_FPINMODE_INVERTED_REG); // rv 0
  assign FPOPMODE_in[0] = (FPOPMODE[0] !== 1'bz) && (FPOPMODE[0] ^ IS_FPOPMODE_INVERTED_REG[0]); // rv 0
  assign FPOPMODE_in[1] = (FPOPMODE[1] !== 1'bz) && (FPOPMODE[1] ^ IS_FPOPMODE_INVERTED_REG[1]); // rv 0
  assign FPOPMODE_in[2] = (FPOPMODE[2] !== 1'bz) && (FPOPMODE[2] ^ IS_FPOPMODE_INVERTED_REG[2]); // rv 0
  assign FPOPMODE_in[3] = (FPOPMODE[3] !== 1'bz) && (FPOPMODE[3] ^ IS_FPOPMODE_INVERTED_REG[3]); // rv 0
  assign FPOPMODE_in[4] = (FPOPMODE[4] !== 1'bz) && (FPOPMODE[4] ^ IS_FPOPMODE_INVERTED_REG[4]); // rv 0
  assign FPOPMODE_in[5] = (FPOPMODE[5] !== 1'bz) && (FPOPMODE[5] ^ IS_FPOPMODE_INVERTED_REG[5]); // rv 0
  assign FPOPMODE_in[6] = (FPOPMODE[6] !== 1'bz) && (FPOPMODE[6] ^ IS_FPOPMODE_INVERTED_REG[6]); // rv 0
  assign PCIN_in = PCIN;
  assign RSTA_in = (RSTA !== 1'bz) && (RSTA ^ IS_RSTA_INVERTED_REG); // rv 0
  assign RSTB_in = (RSTB !== 1'bz) && (RSTB ^ IS_RSTB_INVERTED_REG); // rv 0
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC ^ IS_RSTC_INVERTED_REG); // rv 0
  assign RSTD_in = (RSTD !== 1'bz) && (RSTD ^ IS_RSTD_INVERTED_REG); // rv 0
  assign RSTFPA_in = (RSTFPA !== 1'bz) && (RSTFPA ^ IS_RSTFPA_INVERTED_REG); // rv 0
  assign RSTFPINMODE_in = (RSTFPINMODE !== 1'bz) && (RSTFPINMODE ^ IS_RSTFPINMODE_INVERTED_REG); // rv 0
  assign RSTFPMPIPE_in = (RSTFPMPIPE !== 1'bz) && (RSTFPMPIPE ^ IS_RSTFPMPIPE_INVERTED_REG); // rv 0
  assign RSTFPM_in = (RSTFPM !== 1'bz) && (RSTFPM ^ IS_RSTFPM_INVERTED_REG); // rv 0
  assign RSTFPOPMODE_in = (RSTFPOPMODE !== 1'bz) && (RSTFPOPMODE ^ IS_RSTFPOPMODE_INVERTED_REG); // rv 0

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
  assign ACASCREG_BIN = ACASCREG_REG[1:0];

  assign AREG_BIN = AREG_REG[1:0];

  assign A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  assign A_INPUT_BIN =
    (A_INPUT_REG == "DIRECT") ? A_INPUT_DIRECT :
    (A_INPUT_REG == "CASCADE") ? A_INPUT_CASCADE :
     A_INPUT_DIRECT;

  assign BCASCSEL_BIN =
      (BCASCSEL_REG == "B") ? BCASCSEL_B :
      (BCASCSEL_REG == "D") ? BCASCSEL_D :
       BCASCSEL_B;
  
  assign B_D_FPTYPE_BIN =
      (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
      (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
       B_D_FPTYPE_B32;

  assign B_INPUT_BIN =
    (B_INPUT_REG == "DIRECT") ? B_INPUT_DIRECT :
    (B_INPUT_REG == "CASCADE") ? B_INPUT_CASCADE :
     B_INPUT_DIRECT;

  assign FPA_PREG_BIN = FPA_PREG_REG[0];

  assign FPBREG_BIN = FPBREG_REG[0];
  
  assign FPCREG_BIN = FPCREG_REG[1:0];
  
  assign FPDREG_BIN = FPDREG_REG[0];
  
  assign FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
  assign FPM_PREG_BIN = FPM_PREG_REG[0];
  
  assign FPOPMREG_BIN = FPOPMREG_REG[1:0];

  assign INMODEREG_BIN = INMODEREG_REG[0];

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
  ACASCREG_BIN = ACASCREG_REG[1:0];

  AREG_BIN = AREG_REG[1:0];

  A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  A_INPUT_BIN =
    (A_INPUT_REG == "DIRECT") ? A_INPUT_DIRECT :
    (A_INPUT_REG == "CASCADE") ? A_INPUT_CASCADE :
     A_INPUT_DIRECT;

  BCASCSEL_BIN =
    (BCASCSEL_REG == "B") ? BCASCSEL_B :
    (BCASCSEL_REG == "D") ? BCASCSEL_D :
    BCASCSEL_B;
  
  B_D_FPTYPE_BIN =
    (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
    (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
    B_D_FPTYPE_B32;

  B_INPUT_BIN =
    (B_INPUT_REG == "DIRECT") ? B_INPUT_DIRECT :
    (B_INPUT_REG == "CASCADE") ? B_INPUT_CASCADE :
     B_INPUT_DIRECT;

  FPA_PREG_BIN = FPA_PREG_REG[0];

  FPBREG_BIN = FPBREG_REG[0];
  
  FPCREG_BIN = FPCREG_REG[1:0];
  
  FPDREG_BIN = FPDREG_REG[0];
  
  FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
  FPM_PREG_BIN = FPM_PREG_REG[0];
  
  FPOPMREG_BIN = FPOPMREG_REG[1:0];

  INMODEREG_BIN = INMODEREG_REG[0];

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

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((ACASCREG_REG != 1) &&
         (ACASCREG_REG != 0) &&
         (ACASCREG_REG != 2))) begin
      $display("Error: [Unisim %s-101] ACASCREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, ACASCREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AREG_REG != 1) &&
         (AREG_REG != 0) &&
         (AREG_REG != 2))) begin
      $display("Error: [Unisim %s-102] AREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, AREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((A_FPTYPE_REG != "B32") &&
       (A_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-103] A_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, A_FPTYPE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((A_INPUT_REG != "DIRECT") &&
         (A_INPUT_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-104] A_INPUT attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, A_INPUT_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((BCASCSEL_REG != "B") &&
       (BCASCSEL_REG != "D"))) begin
    $display("Error: [Unisim %s-105] BCASCSEL attribute is set to %s.  Legal values for this attribute are B or D. Instance: %m", MODULE_NAME, BCASCSEL_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((B_D_FPTYPE_REG != "B32") &&
       (B_D_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-106] B_D_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, B_D_FPTYPE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((B_INPUT_REG != "DIRECT") &&
         (B_INPUT_REG != "CASCADE"))) begin
      $display("Error: [Unisim %s-107] B_INPUT attribute is set to %s.  Legal values for this attribute are DIRECT or CASCADE. Instance: %m", MODULE_NAME, B_INPUT_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((FPA_PREG_REG != 1) &&
       (FPA_PREG_REG != 0))) begin
    $display("Error: [Unisim %s-109] FPA_PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPA_PREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPBREG_REG != 1) &&
       (FPBREG_REG != 0))) begin
    $display("Error: [Unisim %s-110] FPBREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPBREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPCREG_REG != 3) &&
       (FPCREG_REG != 0) &&
       (FPCREG_REG != 1) &&
       (FPCREG_REG != 2))) begin
    $display("Error: [Unisim %s-111] FPCREG attribute is set to %d.  Legal values for this attribute are 3, 0, 1 or 2. Instance: %m", MODULE_NAME, FPCREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPDREG_REG != 1) &&
       (FPDREG_REG != 0))) begin
    $display("Error: [Unisim %s-112] FPDREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPDREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPMPIPEREG_REG != 1) &&
       (FPMPIPEREG_REG != 0))) begin
    $display("Error: [Unisim %s-113] FPMPIPEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPMPIPEREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPM_PREG_REG != 1) &&
       (FPM_PREG_REG != 0))) begin
    $display("Error: [Unisim %s-114] FPM_PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPM_PREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPOPMREG_REG != 3) &&
       (FPOPMREG_REG != 0) &&
       (FPOPMREG_REG != 1) &&
       (FPOPMREG_REG != 2))) begin
    $display("Error: [Unisim %s-115] FPOPMREG attribute is set to %d.  Legal values for this attribute are 3, 0, 1 or 2. Instance: %m", MODULE_NAME, FPOPMREG_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((INMODEREG_REG != 1) &&
         (INMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-116] INMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, INMODEREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((PCOUTSEL_REG != "FPA") &&
       (PCOUTSEL_REG != "FPM"))) begin
    $display("Error: [Unisim %s-130] PCOUTSEL attribute is set to %s.  Legal values for this attribute are FPA or FPM. Instance: %m", MODULE_NAME, PCOUTSEL_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-131] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-132] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((ACASCREG_REG==0 && AREG_REG==1) || 
         (ACASCREG_REG==0 && AREG_REG==2) || 
         (ACASCREG_REG==1 && AREG_REG==0) ||
         (ACASCREG_REG==2 && AREG_REG==0) ||
         (ACASCREG_REG==2 && AREG_REG==1)) ) begin
      $display("Error: [Unisim %s-201] ACASCREG attribute is set to %0d and AREG attribute is set to %0d. This is not a valid combination. Instance: %m", MODULE_NAME, ACASCREG_REG, AREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        (B_INPUT_REG=="CASCADE")) begin
      $display("Warning: [Unisim %s-202] B_INPUT is set to CASCADE and B_D_FPTYPE is set to %0s. The lower part of the cascade should have the same B_D_FPTYPE values. Instance: %m", MODULE_NAME, B_D_FPTYPE_REG);
      //attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        (A_INPUT_REG=="CASCADE")) begin
      $display("Warning: [Unisim %s-203] A_INPUT is set to CASCADE and A_FPTYPE is set to %0s. The lower part of the cascade should have the same A_FPTYPE values. Instance: %m", MODULE_NAME, A_FPTYPE_REG);
      //attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG=="NONE") && !(FPMPIPEREG_REG==0 && FPM_PREG_REG==0 && FPBREG_REG==0 && INMODEREG_REG==0 && AREG_REG==0))) begin
      $display("Warning: [Unisim %s-204]  USE_MULT is set to NONE. FPMPIPEREG=%0d, FPM_PREG=%0d, FPBREG=%0d, INMODEREG==%0d, AREG=%0d. Disabling these registers could help saving power. For more information please review AM004. Instance: %m",MODULE_NAME, FPMPIPEREG_REG, FPM_PREG_REG,FPBREG_REG, INMODEREG_REG, AREG_REG);
      //attr_err = 1'b1;
    end


    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

// Connections between atoms
  wire [31:0] A2_DATA_in;
  wire [31:0] B_DATA_in;
  wire [31:0] D_DATA_in;
  wire FPA_INVALID_INT_in;
  wire FPA_OVERFLOW_INT_in;
  wire FPA_UNDERFLOW_INT_in;
  wire FPM_INVALID_INT_in;
  wire FPM_OVERFLOW_INT_in;
  wire FPM_UNDERFLOW_INT_in;
  wire [31:0] D_FP_DATA;
  wire [7:0] A_EXP_DATA;
  wire [23:0] A_MAN_DATA;
  wire A_SIGN_DATA;
  wire [31:0] C3_FP_DATA;
  wire [31:0] FPA_FDBK;
  wire [31:0] FPM_DATA;
  wire [31:0] FPA_INT_in;
  wire [31:0] FPM_INT_in;
  wire [6:0] FPOPMODE_DATA;
  wire [7:0] B_EXP_DATA;
  wire [23:0] B_MAN_DATA;
  wire  B_SIGN_DATA;
  wire [47:0] U_DATA;
  wire [47:0] V_DATA;
  wire [13:0] FPM_EXPINT_DATA;
  wire [47:0] U_in;
  wire [47:0] V_in;
  localparam MAX_ALU_FULL   = 48;
  localparam A_WIDTH   = 32;
  localparam B_WIDTH   = 32;
  localparam C_WIDTH   = 32;
  localparam D_WIDTH   = 32;
  localparam M_WIDTH   = 48;
  localparam P_WIDTH   = 58;
  reg [6:0] FPOPMODE_reg;
  reg [6:0] FPOPMODE_reg1;
  reg [6:0] FPOPMODE_reg2;

  wire [22:0] ACIN_MAN_int;
  wire [22:0] A_MAN_int;
  wire [22:0] BCIN_MAN_int;
  wire [22:0] B_MAN_int;
  wire [22:0] D_MAN_int;
  wire [7:0] ACIN_EXP_int;
  wire [7:0] A_EXP_int;
  wire [7:0] BCIN_EXP_int;
  wire [7:0] B_EXP_int;
  wire [7:0] D_EXP_int;
  wire [31:0] C_int;

  wire [MAX_ALU_FULL-1:0] s1_mult;
  wire [MAX_ALU_FULL-1:0] s2_mult;
  reg [A_WIDTH-1:0] A1_reg;
  reg [A_WIDTH-1:0] A2_reg;
  reg [B_WIDTH-1:0] B1_DATA_out;
  reg [C_WIDTH-1:0] C_reg;
  reg [C_WIDTH-1:0] C_reg1;
  reg [C_WIDTH-1:0] C_reg2;
  reg [24:0] b_mult;
  reg [24:0] a_mult;
  wire a_inf, a_snan, a_qnan, a_zd;
  wire b_inf, b_snan, b_qnan, b_zd;
  reg [31:0] P0;
  reg [31:0] P1;
  reg P_sign;
  reg [7:0] P_exp;
  reg [23:0] P_man;
  real P0_real;
  reg P0_sign;
  reg [7:0] P0_exp;
  reg [22:0] P0_man;
  real P1_real;
  reg P1_sign;
  reg [7:0] P1_exp;
  reg [22:0] P1_man;
  reg [31:0] P_out;
  real P_out_real;
  reg [63:0] P_out64;
  reg FPA_INVALID_INT_out;
  reg FPA_OVERFLOW_INT_out;
  reg FPA_UNDERFLOW_INT_out;

  reg [M_WIDTH-1:0] mult;
  reg [M_WIDTH-1:0] ps_u_mask;
  reg [M_WIDTH-1:0] ps_v_mask;
  reg [M_WIDTH-1:0] U_DATA_reg;
  reg [M_WIDTH-1:0] V_DATA_reg;
  reg [13:0] FPM_EXPINT_DATA_reg;

  reg [P_WIDTH-1:0] FPA_OUT_reg;
  reg FPA_INVALID_reg;
  reg FPA_OVERFLOW_reg;
  reg FPA_UNDERFLOW_reg;
  reg [P_WIDTH-1:0] FPM_OUT_reg;
  reg FPM_INVALID_reg;
  reg FPM_OVERFLOW_reg;
  reg FPM_UNDERFLOW_reg;
  wire FPINMODE_mux;
  reg FPINMODE_reg;
  reg [D_WIDTH-1:0] D_DATA_reg;

  reg [M_WIDTH-1:0] U_out;
  reg [M_WIDTH-1:0] V_out;
  reg [13:0] FPM_EXPINT_out;
  reg [9:0] FPM_EXPINT_sum;

  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  FPOPMODE_reg  = 7'b0;
  FPOPMODE_reg1 = 7'b0;
  FPOPMODE_reg2 = 7'b0;
  A1_reg = {A_WIDTH{1'b0}};
  A2_reg = {A_WIDTH{1'b0}};
  B1_DATA_out = {B_WIDTH{1'b0}};
  C_reg = {C_WIDTH{1'b0}};
  C_reg1 = {C_WIDTH{1'b0}};
  C_reg2 = {C_WIDTH{1'b0}};
  ps_u_mask = {M_WIDTH/2{2'b01}};
  ps_v_mask = {M_WIDTH/2{2'b10}};
  U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  FPM_EXPINT_DATA_reg = 14'b0;
  FPA_OUT_reg = {P_WIDTH{1'b0}};
  FPA_INVALID_reg = 1'b0;
  FPA_OVERFLOW_reg = 1'b0;
  FPA_UNDERFLOW_reg = 1'b0;
  FPM_OUT_reg = {P_WIDTH{1'b0}};
  FPM_INVALID_reg = 1'b0;
  FPM_OVERFLOW_reg = 1'b0;
  FPM_UNDERFLOW_reg = 1'b0;
  FPINMODE_reg = 1'b0;
  D_DATA_reg = {D_WIDTH{1'b0}};
  U_out = {1'b0, {M_WIDTH-1{1'b0}}};
  V_out = {1'b0, {M_WIDTH-1{1'b0}}};
  FPM_EXPINT_out = 14'b0;
  FPM_EXPINT_sum = 10'b0;
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

  assign FPA_INT_in = P_out;
  assign FPA_INVALID_INT_in = FPA_INVALID_INT_out;
  assign FPA_OVERFLOW_INT_in = FPA_OVERFLOW_INT_out;
  assign FPA_UNDERFLOW_INT_in = FPA_UNDERFLOW_INT_out;

  always @ (*) begin
    case (FPOPMODE_DATA[1:0]) 
      2'b00 : P0 = 32'b0;
      2'b01 : P0 = FPM_DATA;
      2'b10 : P0 = PCIN;
      2'b11 : P0 = D_FP_DATA;
    endcase
  end
  
  always @ (*) begin
    casex (FPOPMODE_DATA[4:2]) 
      3'b0xx : P1 = 32'b0;
      3'b10x : P1 = FPA_FDBK;
      3'b110 : P1 = C3_FP_DATA;
      3'b111 : P1 = PCIN;
    endcase
  end

  always @ (*) begin
    if ( ~|P0[31:0] ) begin
      P0_real = 0.0;
    end else if ( ~|P0[30:0] ) begin
      P0_real = -0.0;
    end else begin
      P0_real = $bitstoreal({P0[31],P0[30],{3{~P0[30]}}, P0[29:23], P0[22:0], 29'b0});
    end
  end

  always @ (*) begin
    if ( ~|P1[31:0] ) begin
      P1_real = 0.0;
    end else if ( ~|P1[30:0] ) begin
      P1_real = -0.0;
    end else begin
      P1_real = $bitstoreal({P1[31],P1[30],{3{~P1[30]}}, P1[29:23], P1[22:0], 29'b0});
    end
  end

  wire p0_inf, p0_qnan, p0_snan, p0_zd;
  wire p1_inf, p1_qnan, p1_snan, p1_zd;

  assign p0_zd = ~|P0[30:23];

  assign p0_inf = &P0[30:23] && ~|P0[22:0];

  assign p0_qnan = &P0[30:23] &&  P0[22] && |P0[22:0];

  assign p0_snan = &P0[30:23] && ~P0[22] && |P0[21:0];

  assign p1_zd = ~|P1[30:23];

  assign p1_inf = &P1[30:23] && ~|P1[22:0];

  assign p1_qnan = &P1[30:23] &&  P1[22] && |P1[22:0];

  assign p1_snan = &P1[30:23] && ~P1[22] && |P1[21:0];

  always @ (*) begin
    FPA_INVALID_INT_out = 1'b0;
    FPA_OVERFLOW_INT_out = 1'b0;
    FPA_UNDERFLOW_INT_out = 1'b0;
    if (p0_zd && p1_zd) begin // both zero or denormal
      P_out = {((P0[31] ^ FPOPMODE_DATA[5]) && (P1[31]^ FPOPMODE_DATA[6])), 31'b0}; // zero
    end else if (p0_snan | p0_qnan | p1_snan | p1_qnan) begin // either NaN
      if (p0_snan | p1_snan) begin // one sNaN
        FPA_INVALID_INT_out = 1'b1;
      end
      P_out = {1'b0, 8'hff, 1'b1, 22'b0}; // qNaN sign don't care = 0
    end else if (p0_inf || p1_inf) begin // either infinity
      if (p0_inf && p1_inf) begin // both infinity
        if (P0[31] ^ FPOPMODE_DATA[5] != P1[31] ^ FPOPMODE_DATA[6]) begin // opposite signs
          FPA_INVALID_INT_out = 1'b1;
          P_out = {1'b0, 8'hff, 1'b1, 22'b0}; // q-nan
        end else begin
          P_out =  {P0[31] ^ FPOPMODE_DATA[5], P0[30:0]}; // inf
        end
      end else if (p0_inf) begin
        P_out =  {P0[31] ^ FPOPMODE_DATA[5], P0[30:0]}; // inf
      end else begin // p1_inf
        P_out =  {P1[31] ^ FPOPMODE_DATA[6], P1[30:0]}; // inf
      end
    end else if (p0_zd) begin // P0 denormal
      case (FPOPMODE_DATA[6])
        1'b0 : P_out =  P1;
        1'b1 : P_out =  {~P1[31], P1[30:0]};
      endcase
    end else if (p1_zd) begin // P1 denormal
      case (FPOPMODE_DATA[5])
        1'b0 : P_out =  P0;
        1'b1 : P_out =  {~P0[31], P0[30:0]};
      endcase
    end else begin
      case (FPOPMODE_DATA[6:5])
        2'b00 : P_out_real =  P0_real + P1_real;
        2'b01 : P_out_real = -P0_real + P1_real;
        2'b10 : P_out_real =  P0_real - P1_real;
        2'b11 : P_out_real = -P0_real - P1_real;
      endcase
      P_out64 = $realtobits(P_out_real);
      P_out = {P_out64[63], P_out64[62], P_out64[58:52], P_out64[51:29]};
      P_out = (P_out64[28] & (P_out64[29] | P_out64[27] | |P_out64[26:0])) ? P_out + 32'd1 : P_out;
      if (&P_out[30:23]) begin // result inf or nan
        P_out[22:0] = 23'd0;
        FPA_OVERFLOW_INT_out = 1'b1;
      end else if ((P_out_real == 0.0) && (P0[31] ^ FPOPMODE_DATA[5] != P1[31] ^ FPOPMODE_DATA[6])) begin // result zero/denormal with opposite signs
//      end else if ((PO[30:0] === P1[30:0]) && (P0[31] ^ P1[31])) begin // result zero/denormal with opposite signs
        P_out[31] = 1'b0; // +0
      end else if ((~((P_out64[61:59]===3'b000 || P_out64[61:59]===3'b111) && (P_out64[62] !== P_out64[61])) || (~|{P_out64[62], P_out64[58:52]})) && (P_out_real != 0.0)) begin // underflow conditions
        FPA_UNDERFLOW_INT_out = 1'b1;
        P_out[30:0] = 31'd0;
      end
    end
  end

//*********************************************************
//*** FPOPMODE with 3 level of register
//*********************************************************
    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (FPOPMREG_BIN == 2'b00) || glblGSR) begin
          FPOPMODE_reg  <= 7'b0;
	    end else if (CEFPOPMODE_in) begin
          if (FPOPMREG_BIN == 2'b01) begin
             FPOPMODE_reg <= FPOPMODE_in;
          end else begin
             FPOPMODE_reg <= FPOPMODE_reg2;
	       end
	    end
	 end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPOPMREG_BIN[1] != 1'b1) || glblGSR) begin // 1 or 0
         FPOPMODE_reg2 <= 7'b0;
      end else if (CEFPOPMODE_in) begin
         if (FPOPMREG_BIN[0] == 1'b0) begin // 2
            FPOPMODE_reg2 <= FPOPMODE_in;
         end else begin // 3
            FPOPMODE_reg2 <= FPOPMODE_reg1;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPOPMREG_BIN != 2'b11) || glblGSR) begin
         FPOPMODE_reg1 <= 7'b0;
      end else if (CEFPOPMODE_in) begin
         FPOPMODE_reg1 <= FPOPMODE_in;
      end
   end

   assign FPOPMODE_DATA = (FPOPMREG_BIN == 2'b00) ? FPOPMODE_in : FPOPMODE_reg;

  assign s2_mult  = U_DATA | V_DATA;
  assign s1_mult  = s2_mult[47] ? s2_mult : {s2_mult[46:0], 1'b0};

  wire rs_bit;
  wire g_bit;
  wire [24:0] s1_rnd;
  wire [22:0] significant;
  wire [9:0] adj_exp;

  assign rs_bit = s1_mult[24] || |s1_mult[22:0]; // r || s (s=1 if odd)
  assign g_bit = s1_mult[23] & rs_bit; // g and (r || s || odd) round up add 1
  assign s1_rnd =  s1_mult[47:24] + g_bit;
  assign significant = s1_rnd[24] ? s1_rnd[23:1] : s1_rnd[22:0];
  assign adj_exp = s1_rnd[24] ? FPM_EXPINT_DATA[8:0] + s2_mult[47] + 1'b1 : FPM_EXPINT_DATA[8:0] + s2_mult[47];

// FPM_EXPINT_DATA = {sign(13),zero(12),inf(11),nan(10),uf(9),exp[8:0]}
  assign FPM_INVALID_INT_in = (FPM_EXPINT_DATA[10] && FPM_EXPINT_DATA[8]) | (FPM_EXPINT_DATA[12] & FPM_EXPINT_DATA[11]);   // SNaN or (zero and inf)
  assign FPM_OVERFLOW_INT_in = (FPM_EXPINT_DATA[8] || adj_exp[8] || &adj_exp[7:0]) && ~FPM_EXPINT_DATA[9] && ~FPM_EXPINT_DATA[10] && ~FPM_EXPINT_DATA[11] && ~FPM_EXPINT_DATA[12];
  assign FPM_UNDERFLOW_INT_in = (FPM_EXPINT_DATA[9] && FPM_EXPINT_DATA[8]) || (FPM_EXPINT_DATA[9] && ~s2_mult[47] && ~s1_rnd[24]); // underflow

  assign FPM_INT_in =
                   (FPM_INVALID_INT_in || FPM_EXPINT_DATA[10]) ? // invalid or Qnan
                       {FPM_EXPINT_DATA[13], 8'hff, 1'b1, 22'b0} :
                   FPM_UNDERFLOW_INT_in ? // underflow
                       {FPM_EXPINT_DATA[13], 31'b0} :
                   (FPM_OVERFLOW_INT_in || (FPM_EXPINT_DATA[11] && ~FPM_EXPINT_DATA[12])) ? // overflow or inf && not zero
                       {FPM_EXPINT_DATA[13], 8'hff, 1'b0, 22'b0} :
					    FPM_EXPINT_DATA[12] ? {FPM_EXPINT_DATA[13], 31'b0} :
                       {FPM_EXPINT_DATA[13], adj_exp[7:0], significant[22:0]}; // norm rnd

  assign ACIN_MAN_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? ACIN_MAN_in : {ACIN_MAN_in[22:13],13'b0};
  assign A_MAN_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? A_MAN_in : {A_MAN_in[22:13],13'b0};
  assign BCIN_MAN_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? BCIN_MAN_in : {BCIN_MAN_in[22:13],13'b0};
  assign B_MAN_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? B_MAN_in : {B_MAN_in[22:13],13'b0};
  assign D_MAN_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? D_MAN_in : {D_MAN_in[22:13],13'b0};
  assign ACIN_EXP_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? ACIN_EXP_in : {3'b0, ACIN_EXP_in[4:0]};
  assign A_EXP_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? A_EXP_in : {3'b0, A_EXP_in[4:0]};
  assign BCIN_EXP_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? BCIN_EXP_in : {3'b0, BCIN_EXP_in[4:0]};
  assign B_EXP_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? B_EXP_in : {3'b0, B_EXP_in[4:0]};
  assign D_EXP_int = (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) ? D_EXP_in : {3'b0, D_EXP_in[4:0]};
  assign C_int = C_in;
//  assign C_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? C_in : {C_in[31], 3'b111, C_in[27:23], C_in[22:13],13'b0};

//*********************************************************
//*** Input register A with 2 level deep of registers
//*********************************************************

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTA_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (AREG_BIN == 2'b00) || glblGSR) begin
          A1_reg <= {A_WIDTH{1'b0}};
       end else if (CEA1_in) begin
          if (A_INPUT_BIN == A_INPUT_CASCADE) begin
             A1_reg <= {ACIN_SIGN_in, ACIN_EXP_int, ACIN_MAN_int};
          end else begin
             A1_reg <= {A_SIGN_in, A_EXP_int, A_MAN_int};
          end
       end
    end

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTA_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (AREG_BIN == 2'b00) || glblGSR) begin
          A2_reg <= {A_WIDTH{1'b0}};
       end else if (CEA2_in) begin
          if (AREG_BIN == 2'b10) begin
             A2_reg <= A1_reg;
          end else if (A_INPUT_BIN == A_INPUT_CASCADE) begin
             A2_reg <= {ACIN_SIGN_in, ACIN_EXP_int, ACIN_MAN_int};
          end else begin
             A2_reg <= {A_SIGN_in, A_EXP_int, A_MAN_int};
          end
       end
    end

    assign A2_DATA_in = (AREG_BIN != 2'b00) ? A2_reg :
                        (A_INPUT_BIN == A_INPUT_CASCADE) ?
                           {ACIN_SIGN_in, ACIN_EXP_int, ACIN_MAN_int} :
                           {A_SIGN_in, A_EXP_int, A_MAN_int};

// assumes encoding the same for ACASCREG and AREG
    assign {ACOUT_SIGN, ACOUT_EXP, ACOUT_MAN} = (ACASCREG_BIN == AREG_BIN) ? A2_DATA_in : A1_reg;

//*********************************************************
//*** Input register B with 1 level deep of registers
//*********************************************************

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTB_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (FPBREG_BIN == 1'b0) || glblGSR) begin
          B1_DATA_out <= {B_WIDTH{1'b0}};
       end else if (CEB_in) begin
          if (B_INPUT_BIN == B_INPUT_CASCADE) begin
             B1_DATA_out <= {BCIN_SIGN_in, BCIN_EXP_int, BCIN_MAN_int};
          end else begin
             B1_DATA_out <= {B_SIGN_in, B_EXP_int, B_MAN_int};
          end
       end
    end

    assign B_DATA_in = (FPBREG_BIN != 1'b0) ? B1_DATA_out :
                    (B_INPUT_BIN == B_INPUT_CASCADE) ?  
                        {BCIN_SIGN_in, BCIN_EXP_int, BCIN_MAN_int} :
                        {B_SIGN_in, B_EXP_int, B_MAN_int};

    assign {BCOUT_SIGN, BCOUT_EXP, BCOUT_MAN} = (BCASCSEL_BIN == BCASCSEL_B) ? B_DATA_in : D_DATA_in;

//*********************************************************
//*** Input register C with 3 level deep of register
//*********************************************************

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN == 2'b00) || glblGSR) begin
         C_reg <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         if (FPCREG_BIN == 2'b01) begin
            C_reg <= C_int;
         end else begin
            C_reg <= C_reg2;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN[1] != 1'b1) || glblGSR) begin
         C_reg2 <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         if (FPCREG_BIN[0] == 1'b0) begin
            C_reg2 <= C_int;
         end else begin
            C_reg2 <= C_reg1;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN != 2'b11) || glblGSR) begin
         C_reg1 <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         C_reg1 <= C_int;
      end
   end

   assign C3_FP_DATA = (FPCREG_BIN == 2'b00) ? C_int : C_reg;

// floating point multiplier
// A 23:0 = 1+22:0 * B 23:0 = 1+22:0
// b47 = sA ^ sB
// exp = expa + expb
// uses dsp_preadd
// 1.<22:0> * 1.<22:0> = b47,b46 <45:0>
// uses dsp_multiplier
// b47,b46 possible values 11, 10, 01    4.0 > 1.x * 1.x >= 1.0
// if b47 = 1, exp = exp + 1, shift down, out = {s,46:0}
// if b47 = 0, exp = exp  (b46 must be 1) out = {s,45:0,1'b0}
// FPTYPE B32 man <22:0>          exp <7:0>
// FPTYPE B16 man {<22:13>,13'b0} exp {3'b0,<4:0>}

always @(*) begin
  if (A_FPTYPE_BIN == A_FPTYPE_B32) begin
    a_mult = {1'b0,A_MAN_DATA};
  end else begin
    a_mult = {1'b0,A_MAN_DATA[23], A_MAN_DATA[22:13],13'b0};
  end
end
always @(*) begin
  if (B_D_FPTYPE_BIN == B_D_FPTYPE_B32) begin
    b_mult = {1'b0,B_MAN_DATA};
  end else begin
    b_mult = {1'b0,B_MAN_DATA[23], B_MAN_DATA[22:13],13'b0};
  end
end
always @(*) begin
     if (a_snan || b_snan || a_qnan || b_qnan) begin
       mult = {2'b01, 1'b1, {M_WIDTH-3{1'b0}}}; // qNan
     end else if (a_inf && b_inf) begin
       mult = {2'b01, 1'b0, {M_WIDTH-3{1'b0}}}; // inf
     end else if (a_inf || b_inf) begin
       mult = {2'b01, (a_zd | b_zd), {M_WIDTH-3{1'b0}}}; // qNan || inf
     end else if (a_zd || b_zd) begin
       mult = {2'b01, 1'b0, {M_WIDTH-3{1'b0}}}; // zero
     end else begin
       mult = ({{23{a_mult[24]}},a_mult} * {{23{b_mult[24]}},b_mult});
     end
end

// s = sA ^ sB
// b47,b46 possible values 11, 10, 01    4.0 > 1.x * 1.x >= 1.0
// if b47 = 1, exp = exp + 1, shift down, out = {s,46:0}
// if b47 = 0, exp = exp  (b46 must be 1) out = {s,45:0,1'b0}
// 1.<22:0> * 1.<22:0> = b47,b46 <45:0>
   assign a_zd =   ((A_FPTYPE_BIN == A_FPTYPE_B32) && ~|A_EXP_DATA) ||
                   ((A_FPTYPE_BIN == A_FPTYPE_B16) && ~|A_EXP_DATA[4:0]);

   assign a_inf =  ((A_FPTYPE_BIN == A_FPTYPE_B32) && &A_EXP_DATA && ~|A_MAN_DATA[22:0]) ||
                   ((A_FPTYPE_BIN == A_FPTYPE_B16) && &A_EXP_DATA[4:0] && ~|A_MAN_DATA[22:13]);

   assign a_qnan = ((A_FPTYPE_BIN == A_FPTYPE_B32) &&
                    (&A_EXP_DATA && A_MAN_DATA[22] && |A_MAN_DATA[22:0])) ||
                   ((A_FPTYPE_BIN == A_FPTYPE_B16) &&
                    (&A_EXP_DATA[4:0] && A_MAN_DATA[22] && |A_MAN_DATA[22:13]));

   assign a_snan = ((A_FPTYPE_BIN == A_FPTYPE_B32) &&
                    (&A_EXP_DATA && ~A_MAN_DATA[22] && |A_MAN_DATA[21:0])) ||
                   ((A_FPTYPE_BIN == A_FPTYPE_B16) &&
                    (&A_EXP_DATA[4:0] && ~A_MAN_DATA[22] && |A_MAN_DATA[21:13]));

   assign b_zd =   ((B_D_FPTYPE_BIN == B_D_FPTYPE_B32) && ~|B_EXP_DATA) ||
                   ((B_D_FPTYPE_BIN == B_D_FPTYPE_B16) && ~|B_EXP_DATA[4:0]);

   assign b_inf =  ((B_D_FPTYPE_BIN == B_D_FPTYPE_B32) &&
                     &B_EXP_DATA && ~|B_MAN_DATA[22:0]) ||
                   ((B_D_FPTYPE_BIN == B_D_FPTYPE_B16) &&
                     &B_EXP_DATA[4:0] && ~|B_MAN_DATA[22:13]);

   assign b_qnan = ((B_D_FPTYPE_BIN == B_D_FPTYPE_B32) &&
                    (&B_EXP_DATA && B_MAN_DATA[22] && |B_MAN_DATA[22:0])) ||
                   ((B_D_FPTYPE_BIN == B_D_FPTYPE_B16) &&
                    (&B_EXP_DATA[4:0] && B_MAN_DATA[22] && |B_MAN_DATA[22:13]));

   assign b_snan = ((B_D_FPTYPE_BIN == B_D_FPTYPE_B32) &&
                    (&B_EXP_DATA && ~B_MAN_DATA[22] && |B_MAN_DATA[21:0])) ||
                   ((B_D_FPTYPE_BIN == B_D_FPTYPE_B16) &&
                    (&B_EXP_DATA[4:0] && ~B_MAN_DATA[22] && |B_MAN_DATA[21:13]));

// FPM_EXPINT_DATA = {sign(13),zero(12),inf(11),nan(10),uf(9),exp[8:0]}
   always @(*) begin
     FPM_EXPINT_out[13:0] = 14'b0;
     if (USE_MULT_BIN !== USE_MULT_NONE) begin
       FPM_EXPINT_out[13]  = A_SIGN_DATA ^ B_SIGN_DATA;
       if (a_snan || b_snan || a_qnan || b_qnan || a_inf || b_inf || a_zd || b_zd) begin
         FPM_EXPINT_out[9] = 1'b0;
		   FPM_EXPINT_out[10] = (a_snan || b_snan || a_qnan || b_qnan) ? 1'b1 : 1'b0;
		   FPM_EXPINT_out[11] = (a_inf || b_inf) ? 1'b1 : 1'b0;
		   FPM_EXPINT_out[12] = (a_zd || b_zd) ? 1'b1 : 1'b0;
		   FPM_EXPINT_out[8:0] = ((a_snan || b_snan) ? 9'h1ff : ((a_qnan || b_qnan || a_inf || b_inf) ? 9'h0ff : 9'h000));
       end else begin
         FPM_EXPINT_out[10] = 1'b0; // calculation result never sNaN
         if ((A_FPTYPE_BIN == A_FPTYPE_B32) && (B_D_FPTYPE_BIN == B_D_FPTYPE_B32)) begin
           FPM_EXPINT_sum = A_EXP_DATA + B_EXP_DATA;
           if (~((|A_EXP_DATA & |B_EXP_DATA))) begin // zero or denormal
             FPM_EXPINT_out[9]   = 1'b0;
             FPM_EXPINT_out[8:0] = 9'b0;
           end else if (FPM_EXPINT_sum < 9'd128) begin // underflow
             FPM_EXPINT_out[9]   = 1'b1;
             FPM_EXPINT_out[8:0] = FPM_EXPINT_sum - 9'd127;
           end else begin
             FPM_EXPINT_out[9]   = 1'b0;
             FPM_EXPINT_out[8:0] = FPM_EXPINT_sum - 9'd127;
           end
         end else if ((A_FPTYPE_BIN == A_FPTYPE_B16) && (B_D_FPTYPE_BIN == B_D_FPTYPE_B16)) begin
           FPM_EXPINT_sum = A_EXP_DATA[5:0] + B_EXP_DATA[5:0];
           FPM_EXPINT_out[9]   = 1'b0;
           FPM_EXPINT_out[8:0] = FPM_EXPINT_sum + 9'd97;
         end else begin // one 32 and one 16
           if (A_FPTYPE_BIN == A_FPTYPE_B32) begin
             FPM_EXPINT_sum = A_EXP_DATA + B_EXP_DATA[5:0];
           end else begin
             FPM_EXPINT_sum = A_EXP_DATA[5:0] + B_EXP_DATA;
           end
           if (~(|A_EXP_DATA & |B_EXP_DATA)) begin // zero or denormal
             FPM_EXPINT_out[9]   = 1'b0;
             FPM_EXPINT_out[8:0] = 9'b0;
           end else if (FPM_EXPINT_sum < 9'd16) begin // underflow
             FPM_EXPINT_out[9]   = 1'b1;
             FPM_EXPINT_out[8:0] = FPM_EXPINT_sum - 9'd15;
           end else begin
             FPM_EXPINT_out[9]   = 1'b0;
             FPM_EXPINT_out[8:0] = FPM_EXPINT_sum - 9'd15;
           end
         end
       end
     end
   end

   assign U_in = (USE_MULT_BIN == USE_MULT_NONE) ?  {M_WIDTH{1'b0}} :
                  {mult[M_WIDTH-1:0] & ps_u_mask[M_WIDTH-1:0]};

   assign V_in = (USE_MULT_BIN == USE_MULT_NONE) ?  {M_WIDTH{1'b0}} :
                  {mult[M_WIDTH-1:0] & ps_v_mask[M_WIDTH-1:0]};

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
         FPM_EXPINT_DATA_reg <= FPM_EXPINT_out;
      end
   end

   assign U_DATA          = (FPMPIPEREG_BIN == 1'b1) ? U_DATA_reg    : U_in;
   assign V_DATA          = (FPMPIPEREG_BIN == 1'b1) ? V_DATA_reg    : V_in;
   assign FPM_EXPINT_DATA = (FPMPIPEREG_BIN == 1'b1) ? FPM_EXPINT_DATA_reg : FPM_EXPINT_out;

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

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTD_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPDREG_BIN == 1'b0) || glblGSR) begin
         D_DATA_reg <= {D_WIDTH{1'b0}};
      end else if (CED_in) begin
         D_DATA_reg <= {D_SIGN_in, D_EXP_int, D_MAN_int};
      end
   end

   assign D_DATA_in    = (FPDREG_BIN == 1'b1) ? D_DATA_reg : {D_SIGN_in, D_EXP_int, D_MAN_int};
   assign D_FP_DATA    = (FPDREG_BIN == 1'b1) ? D_DATA_reg : {D_SIGN_in, D_EXP_int, D_MAN_int};

// end behavioral model

endmodule

`endcelldefine
