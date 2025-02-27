///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_INREG
// /___/   /\      Filename    : DSP_FP_INREG.v
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

module DSP_FP_INREG #(
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
  parameter integer FPBREG = 1,
  parameter integer FPDREG = 1,
  parameter [0:0] IS_RSTA_INVERTED = 1'b0,
  parameter [0:0] IS_RSTB_INVERTED = 1'b0,
  parameter RESET_MODE = "SYNC"
)(
  output [31:0] A2_DATA,
  output [7:0] ACOUT_EXP,
  output [22:0] ACOUT_MAN,
  output ACOUT_SIGN,
  output [7:0] BCOUT_EXP,
  output [22:0] BCOUT_MAN,
  output BCOUT_SIGN,
  output [31:0] B_DATA,
  output [31:0] D_DATA,
  output [31:0] D_FP_DATA,

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
  input CEA1,
  input CEA2,
  input CEB,
  input CED,
  input CLK,
  input [7:0] D_EXP,
  input [22:0] D_MAN,
  input D_SIGN,
  input RSTA,
  input RSTB,
  input RSTD
);
  
// define constants
  localparam MODULE_NAME = "DSP_FP_INREG";

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
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FP_INREG_dr.v"
`else
  reg [31:0] ACASCREG_REG = ACASCREG;
  reg [31:0] AREG_REG = AREG;
  reg [24:1] A_FPTYPE_REG = A_FPTYPE;
  reg [56:1] A_INPUT_REG = A_INPUT;
  reg [8:1] BCASCSEL_REG = BCASCSEL;
  reg [24:1] B_D_FPTYPE_REG = B_D_FPTYPE;
  reg [56:1] B_INPUT_REG = B_INPUT;
  reg [31:0] FPBREG_REG = FPBREG;
  reg [31:0] FPDREG_REG = FPDREG;
  reg [0:0] IS_RSTA_INVERTED_REG = IS_RSTA_INVERTED;
  reg [0:0] IS_RSTB_INVERTED_REG = IS_RSTB_INVERTED;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
`endif

`ifdef XIL_XECLIB
  wire [1:0] ACASCREG_BIN;
  wire [1:0] AREG_BIN;
  wire A_FPTYPE_BIN;
  wire A_INPUT_BIN;
  wire BCASCSEL_BIN;
  wire B_D_FPTYPE_BIN;
  wire B_INPUT_BIN;
  wire FPBREG_BIN;
  wire FPDREG_BIN;
  wire RESET_MODE_BIN;
`else
  reg [1:0] ACASCREG_BIN;
  reg [1:0] AREG_BIN;
  reg A_FPTYPE_BIN;
  reg A_INPUT_BIN;
  reg BCASCSEL_BIN;
  reg B_D_FPTYPE_BIN;
  reg B_INPUT_BIN;
  reg FPBREG_BIN;
  reg FPDREG_BIN;
  reg RESET_MODE_BIN;
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
  wire CED_in;
  wire CLK_in;
  wire D_SIGN_in;
  wire RSTA_in;
  wire RSTB_in;
  wire RSTD_in;
  wire [22:0] ACIN_MAN_in;
  wire [22:0] A_MAN_in;
  wire [22:0] BCIN_MAN_in;
  wire [22:0] B_MAN_in;
  wire [22:0] D_MAN_in;
  wire [7:0] ACIN_EXP_in;
  wire [7:0] A_EXP_in;
  wire [7:0] BCIN_EXP_in;
  wire [7:0] B_EXP_in;
  wire [7:0] D_EXP_in;

`ifdef XIL_TIMING
  wire ACIN_SIGN_delay;
  wire A_SIGN_delay;
  wire BCIN_SIGN_delay;
  wire B_SIGN_delay;
  wire CEA1_delay;
  wire CEA2_delay;
  wire CEB_delay;
  wire CED_delay;
  wire CLK_delay;
  wire D_SIGN_delay;
  wire [22:0] ACIN_MAN_delay;
  wire [22:0] A_MAN_delay;
  wire [22:0] BCIN_MAN_delay;
  wire [22:0] B_MAN_delay;
  wire [22:0] D_MAN_delay;
  wire [7:0] ACIN_EXP_delay;
  wire [7:0] A_EXP_delay;
  wire [7:0] BCIN_EXP_delay;
  wire [7:0] B_EXP_delay;
  wire [7:0] D_EXP_delay;
`endif

`ifdef XIL_TIMING
  assign ACIN_EXP_in = ACIN_EXP_delay;
  assign ACIN_MAN_in = ACIN_MAN_delay;
  assign ACIN_SIGN_in = ACIN_SIGN_delay;
  assign A_EXP_in[0] = (A_EXP[0] === 1'bz) || A_EXP_delay[0]; // rv 1
  assign A_EXP_in[1] = (A_EXP[1] === 1'bz) || A_EXP_delay[1]; // rv 1
  assign A_EXP_in[2] = (A_EXP[2] === 1'bz) || A_EXP_delay[2]; // rv 1
  assign A_EXP_in[3] = (A_EXP[3] === 1'bz) || A_EXP_delay[3]; // rv 1
  assign A_EXP_in[4] = (A_EXP[4] === 1'bz) || A_EXP_delay[4]; // rv 1
  assign A_EXP_in[5] = (A_EXP[5] === 1'bz) || A_EXP_delay[5]; // rv 1
  assign A_EXP_in[6] = (A_EXP[6] === 1'bz) || A_EXP_delay[6]; // rv 1
  assign A_EXP_in[7] = (A_EXP[7] === 1'bz) || A_EXP_delay[7]; // rv 1
  assign A_MAN_in[0] = (A_MAN[0] === 1'bz) || A_MAN_delay[0]; // rv 1
  assign A_MAN_in[10] = (A_MAN[10] === 1'bz) || A_MAN_delay[10]; // rv 1
  assign A_MAN_in[11] = (A_MAN[11] === 1'bz) || A_MAN_delay[11]; // rv 1
  assign A_MAN_in[12] = (A_MAN[12] === 1'bz) || A_MAN_delay[12]; // rv 1
  assign A_MAN_in[13] = (A_MAN[13] === 1'bz) || A_MAN_delay[13]; // rv 1
  assign A_MAN_in[14] = (A_MAN[14] === 1'bz) || A_MAN_delay[14]; // rv 1
  assign A_MAN_in[15] = (A_MAN[15] === 1'bz) || A_MAN_delay[15]; // rv 1
  assign A_MAN_in[16] = (A_MAN[16] === 1'bz) || A_MAN_delay[16]; // rv 1
  assign A_MAN_in[17] = (A_MAN[17] === 1'bz) || A_MAN_delay[17]; // rv 1
  assign A_MAN_in[18] = (A_MAN[18] === 1'bz) || A_MAN_delay[18]; // rv 1
  assign A_MAN_in[19] = (A_MAN[19] === 1'bz) || A_MAN_delay[19]; // rv 1
  assign A_MAN_in[1] = (A_MAN[1] === 1'bz) || A_MAN_delay[1]; // rv 1
  assign A_MAN_in[20] = (A_MAN[20] === 1'bz) || A_MAN_delay[20]; // rv 1
  assign A_MAN_in[21] = (A_MAN[21] === 1'bz) || A_MAN_delay[21]; // rv 1
  assign A_MAN_in[22] = (A_MAN[22] === 1'bz) || A_MAN_delay[22]; // rv 1
  assign A_MAN_in[2] = (A_MAN[2] === 1'bz) || A_MAN_delay[2]; // rv 1
  assign A_MAN_in[3] = (A_MAN[3] === 1'bz) || A_MAN_delay[3]; // rv 1
  assign A_MAN_in[4] = (A_MAN[4] === 1'bz) || A_MAN_delay[4]; // rv 1
  assign A_MAN_in[5] = (A_MAN[5] === 1'bz) || A_MAN_delay[5]; // rv 1
  assign A_MAN_in[6] = (A_MAN[6] === 1'bz) || A_MAN_delay[6]; // rv 1
  assign A_MAN_in[7] = (A_MAN[7] === 1'bz) || A_MAN_delay[7]; // rv 1
  assign A_MAN_in[8] = (A_MAN[8] === 1'bz) || A_MAN_delay[8]; // rv 1
  assign A_MAN_in[9] = (A_MAN[9] === 1'bz) || A_MAN_delay[9]; // rv 1
  assign A_SIGN_in = (A_SIGN === 1'bz) || A_SIGN_delay; // rv 1
  assign BCIN_EXP_in = BCIN_EXP_delay;
  assign BCIN_MAN_in = BCIN_MAN_delay;
  assign BCIN_SIGN_in = BCIN_SIGN_delay;
  assign B_EXP_in[0] = (B_EXP[0] === 1'bz) || B_EXP_delay[0]; // rv 1
  assign B_EXP_in[1] = (B_EXP[1] === 1'bz) || B_EXP_delay[1]; // rv 1
  assign B_EXP_in[2] = (B_EXP[2] === 1'bz) || B_EXP_delay[2]; // rv 1
  assign B_EXP_in[3] = (B_EXP[3] === 1'bz) || B_EXP_delay[3]; // rv 1
  assign B_EXP_in[4] = (B_EXP[4] === 1'bz) || B_EXP_delay[4]; // rv 1
  assign B_EXP_in[5] = (B_EXP[5] === 1'bz) || B_EXP_delay[5]; // rv 1
  assign B_EXP_in[6] = (B_EXP[6] === 1'bz) || B_EXP_delay[6]; // rv 1
  assign B_EXP_in[7] = (B_EXP[7] === 1'bz) || B_EXP_delay[7]; // rv 1
  assign B_MAN_in[0] = (B_MAN[0] === 1'bz) || B_MAN_delay[0]; // rv 1
  assign B_MAN_in[10] = (B_MAN[10] === 1'bz) || B_MAN_delay[10]; // rv 1
  assign B_MAN_in[11] = (B_MAN[11] === 1'bz) || B_MAN_delay[11]; // rv 1
  assign B_MAN_in[12] = (B_MAN[12] === 1'bz) || B_MAN_delay[12]; // rv 1
  assign B_MAN_in[13] = (B_MAN[13] === 1'bz) || B_MAN_delay[13]; // rv 1
  assign B_MAN_in[14] = (B_MAN[14] === 1'bz) || B_MAN_delay[14]; // rv 1
  assign B_MAN_in[15] = (B_MAN[15] === 1'bz) || B_MAN_delay[15]; // rv 1
  assign B_MAN_in[16] = (B_MAN[16] === 1'bz) || B_MAN_delay[16]; // rv 1
  assign B_MAN_in[17] = (B_MAN[17] === 1'bz) || B_MAN_delay[17]; // rv 1
  assign B_MAN_in[18] = (B_MAN[18] === 1'bz) || B_MAN_delay[18]; // rv 1
  assign B_MAN_in[19] = (B_MAN[19] === 1'bz) || B_MAN_delay[19]; // rv 1
  assign B_MAN_in[1] = (B_MAN[1] === 1'bz) || B_MAN_delay[1]; // rv 1
  assign B_MAN_in[20] = (B_MAN[20] === 1'bz) || B_MAN_delay[20]; // rv 1
  assign B_MAN_in[21] = (B_MAN[21] === 1'bz) || B_MAN_delay[21]; // rv 1
  assign B_MAN_in[22] = (B_MAN[22] === 1'bz) || B_MAN_delay[22]; // rv 1
  assign B_MAN_in[2] = (B_MAN[2] === 1'bz) || B_MAN_delay[2]; // rv 1
  assign B_MAN_in[3] = (B_MAN[3] === 1'bz) || B_MAN_delay[3]; // rv 1
  assign B_MAN_in[4] = (B_MAN[4] === 1'bz) || B_MAN_delay[4]; // rv 1
  assign B_MAN_in[5] = (B_MAN[5] === 1'bz) || B_MAN_delay[5]; // rv 1
  assign B_MAN_in[6] = (B_MAN[6] === 1'bz) || B_MAN_delay[6]; // rv 1
  assign B_MAN_in[7] = (B_MAN[7] === 1'bz) || B_MAN_delay[7]; // rv 1
  assign B_MAN_in[8] = (B_MAN[8] === 1'bz) || B_MAN_delay[8]; // rv 1
  assign B_MAN_in[9] = (B_MAN[9] === 1'bz) || B_MAN_delay[9]; // rv 1
  assign B_SIGN_in = (B_SIGN === 1'bz) || B_SIGN_delay; // rv 1
  assign CEA1_in = CEA1_delay;
  assign CEA2_in = (CEA2 !== 1'bz) && CEA2_delay; // rv 0
  assign CEB_in = (CEB !== 1'bz) && CEB_delay; // rv 0
  assign CED_in = CED_delay;
  assign CLK_in = CLK_delay;
  assign D_EXP_in[0] = (D_EXP[0] === 1'bz) || D_EXP_delay[0]; // rv 1
  assign D_EXP_in[1] = (D_EXP[1] === 1'bz) || D_EXP_delay[1]; // rv 1
  assign D_EXP_in[2] = (D_EXP[2] === 1'bz) || D_EXP_delay[2]; // rv 1
  assign D_EXP_in[3] = (D_EXP[3] === 1'bz) || D_EXP_delay[3]; // rv 1
  assign D_EXP_in[4] = (D_EXP[4] === 1'bz) || D_EXP_delay[4]; // rv 1
  assign D_EXP_in[5] = (D_EXP[5] === 1'bz) || D_EXP_delay[5]; // rv 1
  assign D_EXP_in[6] = (D_EXP[6] === 1'bz) || D_EXP_delay[6]; // rv 1
  assign D_EXP_in[7] = (D_EXP[7] === 1'bz) || D_EXP_delay[7]; // rv 1
  assign D_MAN_in[0] = (D_MAN[0] === 1'bz) || D_MAN_delay[0]; // rv 1
  assign D_MAN_in[10] = (D_MAN[10] === 1'bz) || D_MAN_delay[10]; // rv 1
  assign D_MAN_in[11] = (D_MAN[11] === 1'bz) || D_MAN_delay[11]; // rv 1
  assign D_MAN_in[12] = (D_MAN[12] === 1'bz) || D_MAN_delay[12]; // rv 1
  assign D_MAN_in[13] = (D_MAN[13] === 1'bz) || D_MAN_delay[13]; // rv 1
  assign D_MAN_in[14] = (D_MAN[14] === 1'bz) || D_MAN_delay[14]; // rv 1
  assign D_MAN_in[15] = (D_MAN[15] === 1'bz) || D_MAN_delay[15]; // rv 1
  assign D_MAN_in[16] = (D_MAN[16] === 1'bz) || D_MAN_delay[16]; // rv 1
  assign D_MAN_in[17] = (D_MAN[17] === 1'bz) || D_MAN_delay[17]; // rv 1
  assign D_MAN_in[18] = (D_MAN[18] === 1'bz) || D_MAN_delay[18]; // rv 1
  assign D_MAN_in[19] = (D_MAN[19] === 1'bz) || D_MAN_delay[19]; // rv 1
  assign D_MAN_in[1] = (D_MAN[1] === 1'bz) || D_MAN_delay[1]; // rv 1
  assign D_MAN_in[20] = (D_MAN[20] === 1'bz) || D_MAN_delay[20]; // rv 1
  assign D_MAN_in[21] = (D_MAN[21] === 1'bz) || D_MAN_delay[21]; // rv 1
  assign D_MAN_in[22] = (D_MAN[22] === 1'bz) || D_MAN_delay[22]; // rv 1
  assign D_MAN_in[2] = (D_MAN[2] === 1'bz) || D_MAN_delay[2]; // rv 1
  assign D_MAN_in[3] = (D_MAN[3] === 1'bz) || D_MAN_delay[3]; // rv 1
  assign D_MAN_in[4] = (D_MAN[4] === 1'bz) || D_MAN_delay[4]; // rv 1
  assign D_MAN_in[5] = (D_MAN[5] === 1'bz) || D_MAN_delay[5]; // rv 1
  assign D_MAN_in[6] = (D_MAN[6] === 1'bz) || D_MAN_delay[6]; // rv 1
  assign D_MAN_in[7] = (D_MAN[7] === 1'bz) || D_MAN_delay[7]; // rv 1
  assign D_MAN_in[8] = (D_MAN[8] === 1'bz) || D_MAN_delay[8]; // rv 1
  assign D_MAN_in[9] = (D_MAN[9] === 1'bz) || D_MAN_delay[9]; // rv 1
  assign D_SIGN_in = (D_SIGN === 1'bz) || D_SIGN_delay; // rv 1
`else
  assign ACIN_EXP_in = ACIN_EXP;
  assign ACIN_MAN_in = ACIN_MAN;
  assign ACIN_SIGN_in = ACIN_SIGN;
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
  assign CEA1_in = CEA1;
  assign CEA2_in = (CEA2 !== 1'bz) && CEA2; // rv 0
  assign CEB_in = (CEB !== 1'bz) && CEB; // rv 0
  assign CED_in = CED;
  assign CLK_in = CLK;
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
`endif

  assign ASYNC_RST_in = ASYNC_RST;
  assign RSTA_in = RSTA ^ IS_RSTA_INVERTED_REG;
  assign RSTB_in = (RSTB !== 1'bz) && (RSTB ^ IS_RSTB_INVERTED_REG); // rv 0
  assign RSTD_in = RSTD;

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

  assign FPBREG_BIN = FPBREG_REG[0];
  
  assign FPDREG_BIN = FPDREG_REG[0];
  
  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

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

  FPBREG_BIN = FPBREG_REG[0];
  
  FPDREG_BIN = FPDREG_REG[0];
  
  RESET_MODE_BIN =
    (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
    (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
    RESET_MODE_SYNC;

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
      ((FPBREG_REG != 1) &&
       (FPBREG_REG != 0))) begin
    $display("Error: [Unisim %s-109] FPBREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPBREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPDREG_REG != 1) &&
       (FPDREG_REG != 0))) begin
    $display("Error: [Unisim %s-110] FPDREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPDREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-113] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam A_WIDTH   = 32;
  localparam B_WIDTH   = 32;
  localparam D_WIDTH   = 32;
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

  reg [A_WIDTH-1:0] A1_reg;
  reg [A_WIDTH-1:0] A2_reg;
  reg [B_WIDTH-1:0] B1_DATA_out;
  reg [D_WIDTH-1:0] D_DATA_reg;

  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  A1_reg = {A_WIDTH{1'b0}};
  A2_reg = {A_WIDTH{1'b0}};
  B1_DATA_out = {B_WIDTH{1'b0}};
  D_DATA_reg = {D_WIDTH{1'b0}};
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

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

    assign A2_DATA    = (AREG_BIN != 2'b00) ? A2_reg :
                        (A_INPUT_BIN == A_INPUT_CASCADE) ?
                           {ACIN_SIGN_in, ACIN_EXP_int, ACIN_MAN_int} :
                           {A_SIGN_in, A_EXP_int, A_MAN_int};

// assumes encoding the same for ACASCREG and AREG
    assign {ACOUT_SIGN, ACOUT_EXP, ACOUT_MAN} = (ACASCREG_BIN == AREG_BIN) ? A2_DATA : A1_reg;

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

    assign B_DATA = (FPBREG_BIN != 1'b0) ? B1_DATA_out :
                    (B_INPUT_BIN == B_INPUT_CASCADE) ?  
                        {BCIN_SIGN_in, BCIN_EXP_int, BCIN_MAN_int} :
                        {B_SIGN_in, B_EXP_int, B_MAN_int};

    assign {BCOUT_SIGN, BCOUT_EXP, BCOUT_MAN} = (BCASCSEL_BIN == BCASCSEL_B) ? B_DATA : D_DATA;

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

   assign D_DATA       = (FPDREG_BIN == 1'b1) ? D_DATA_reg : {D_SIGN_in, D_EXP_int, D_MAN_int};
   assign D_FP_DATA    = (FPDREG_BIN == 1'b1) ? D_DATA_reg : {D_SIGN_in, D_EXP_int, D_MAN_int};

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (ACIN_EXP *> A2_DATA) = (0:0:0, 0:0:0);
    (ACIN_EXP *> ACOUT_EXP) = (0:0:0, 0:0:0);
    (ACIN_MAN *> A2_DATA) = (0:0:0, 0:0:0);
    (ACIN_MAN *> ACOUT_MAN) = (0:0:0, 0:0:0);
    (ACIN_SIGN *> A2_DATA) = (0:0:0, 0:0:0);
    (ACIN_SIGN => ACOUT_SIGN) = (0:0:0, 0:0:0);
    (A_EXP *> A2_DATA) = (0:0:0, 0:0:0);
    (A_EXP *> ACOUT_EXP) = (0:0:0, 0:0:0);
    (A_MAN *> A2_DATA) = (0:0:0, 0:0:0);
    (A_MAN *> ACOUT_MAN) = (0:0:0, 0:0:0);
    (A_SIGN *> A2_DATA) = (0:0:0, 0:0:0);
    (A_SIGN => ACOUT_SIGN) = (0:0:0, 0:0:0);
    (BCIN_EXP *> BCOUT_EXP) = (0:0:0, 0:0:0);
    (BCIN_EXP *> B_DATA) = (0:0:0, 0:0:0);
    (BCIN_MAN *> BCOUT_MAN) = (0:0:0, 0:0:0);
    (BCIN_MAN *> B_DATA) = (0:0:0, 0:0:0);
    (BCIN_SIGN *> B_DATA) = (0:0:0, 0:0:0);
    (BCIN_SIGN => BCOUT_SIGN) = (0:0:0, 0:0:0);
    (B_EXP *> BCOUT_EXP) = (0:0:0, 0:0:0);
    (B_EXP *> B_DATA) = (0:0:0, 0:0:0);
    (B_MAN *> BCOUT_MAN) = (0:0:0, 0:0:0);
    (B_MAN *> B_DATA) = (0:0:0, 0:0:0);
    (B_SIGN *> B_DATA) = (0:0:0, 0:0:0);
    (B_SIGN => BCOUT_SIGN) = (0:0:0, 0:0:0);
    (CLK *> A2_DATA) = (100:100:100, 100:100:100);
    (CLK *> ACOUT_EXP) = (100:100:100, 100:100:100);
    (CLK *> ACOUT_MAN) = (100:100:100, 100:100:100);
    (CLK *> BCOUT_EXP) = (100:100:100, 100:100:100);
    (CLK *> BCOUT_MAN) = (100:100:100, 100:100:100);
    (CLK *> B_DATA) = (100:100:100, 100:100:100);
    (CLK *> D_DATA) = (100:100:100, 100:100:100);
    (CLK *> D_FP_DATA) = (100:100:100, 100:100:100);
    (CLK => ACOUT_SIGN) = (100:100:100, 100:100:100);
    (CLK => BCOUT_SIGN) = (100:100:100, 100:100:100);
    (D_EXP *> BCOUT_EXP) = (0:0:0, 0:0:0);
    (D_EXP *> D_DATA) = (0:0:0, 0:0:0);
    (D_EXP *> D_FP_DATA) = (0:0:0, 0:0:0);
    (D_MAN *> BCOUT_MAN) = (0:0:0, 0:0:0);
    (D_MAN *> D_DATA) = (0:0:0, 0:0:0);
    (D_MAN *> D_FP_DATA) = (0:0:0, 0:0:0);
    (D_SIGN *> D_FP_DATA) = (0:0:0, 0:0:0);
    (D_SIGN => BCOUT_SIGN) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge ACIN_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_EXP_delay);
    $setuphold (posedge CLK, negedge ACIN_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_MAN_delay);
    $setuphold (posedge CLK, negedge ACIN_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_SIGN_delay);
    $setuphold (posedge CLK, negedge A_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_EXP_delay);
    $setuphold (posedge CLK, negedge A_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_MAN_delay);
    $setuphold (posedge CLK, negedge A_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_SIGN_delay);
    $setuphold (posedge CLK, negedge BCIN_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_EXP_delay);
    $setuphold (posedge CLK, negedge BCIN_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_MAN_delay);
    $setuphold (posedge CLK, negedge BCIN_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_SIGN_delay);
    $setuphold (posedge CLK, negedge B_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_EXP_delay);
    $setuphold (posedge CLK, negedge B_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_MAN_delay);
    $setuphold (posedge CLK, negedge B_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_SIGN_delay);
    $setuphold (posedge CLK, negedge CEA1, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEA1_delay);
    $setuphold (posedge CLK, negedge CEA2, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEA2_delay);
    $setuphold (posedge CLK, negedge CEB, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEB_delay);
    $setuphold (posedge CLK, negedge CED, 0:0:0, 0:0:0, notifier, , , CLK_delay, CED_delay);
    $setuphold (posedge CLK, negedge D_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_EXP_delay);
    $setuphold (posedge CLK, negedge D_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_MAN_delay);
    $setuphold (posedge CLK, negedge D_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_SIGN_delay);
    $setuphold (posedge CLK, posedge ACIN_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_EXP_delay);
    $setuphold (posedge CLK, posedge ACIN_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_MAN_delay);
    $setuphold (posedge CLK, posedge ACIN_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, ACIN_SIGN_delay);
    $setuphold (posedge CLK, posedge A_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_EXP_delay);
    $setuphold (posedge CLK, posedge A_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_MAN_delay);
    $setuphold (posedge CLK, posedge A_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, A_SIGN_delay);
    $setuphold (posedge CLK, posedge BCIN_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_EXP_delay);
    $setuphold (posedge CLK, posedge BCIN_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_MAN_delay);
    $setuphold (posedge CLK, posedge BCIN_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, BCIN_SIGN_delay);
    $setuphold (posedge CLK, posedge B_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_EXP_delay);
    $setuphold (posedge CLK, posedge B_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_MAN_delay);
    $setuphold (posedge CLK, posedge B_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, B_SIGN_delay);
    $setuphold (posedge CLK, posedge CEA1, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEA1_delay);
    $setuphold (posedge CLK, posedge CEA2, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEA2_delay);
    $setuphold (posedge CLK, posedge CEB, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEB_delay);
    $setuphold (posedge CLK, posedge CED, 0:0:0, 0:0:0, notifier, , , CLK_delay, CED_delay);
    $setuphold (posedge CLK, posedge D_EXP, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_EXP_delay);
    $setuphold (posedge CLK, posedge D_MAN, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_MAN_delay);
    $setuphold (posedge CLK, posedge D_SIGN, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_SIGN_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
