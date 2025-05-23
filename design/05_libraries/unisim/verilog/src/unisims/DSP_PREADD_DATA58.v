///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_PREADD_DATA58
// /___/   /\      Filename    : DSP_PREADD_DATA58.v
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

module DSP_PREADD_DATA58 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ADREG = 1,
  parameter AMULTSEL = "A",
  parameter integer AREG = 1,
  parameter BMULTSEL = "B",
  parameter integer BREG = 1,
  parameter integer DREG = 1,
  parameter DSP_MODE = "INT24",
  parameter integer INMODEREG = 1,
  parameter [4:0] IS_INMODE_INVERTED = 5'b00000,
  parameter [2:0] IS_NEGATE_INVERTED = 3'b000,
  parameter [0:0] IS_RSTINMODE_INVERTED = 1'b0,
  parameter LEGACY = "DSP58",
  parameter integer MREG = 1,
  parameter PREADDINSEL = "A",
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [26:0] A2A1,
  output ADDSUB,
  output [26:0] AD_DATA,
  output [9:0] AD_DATA_CPLX,
  output [23:0] B2B1,
  output [17:0] B2B1_CPLX,
  output CONJ_CPLX_OUT,
  output [26:0] D_DATA,
  output INMODE_2,
  output [2:0] NEGATE_DATA,
  output [26:0] PREADD_AB,

  input [26:0] A1_DATA,
  input [26:0] A2_DATA,
  input [26:0] AD,
  input [9:0] AD_CPLX,
  input ASYNC_RST,
  input [23:0] B1_DATA,
  input [23:0] B2_DATA,
  input CEAD_IN,
  input CED_IN,
  input CEINMODE,
  input CLK,
  input CONJ_CPLX_MULT_IN,
  input CONJ_CPLX_PREADD_IN,
  input [26:0] DIN,
  input [17:0] D_FROM_A_CPLX,
  input [4:0] INMODE,
  input [2:0] NEGATE,
  input RSTAD,
  input RSTD,
  input RSTINMODE
);
  
// define constants
  localparam MODULE_NAME = "DSP_PREADD_DATA58";

// Parameter encodings and registers
  localparam AMULTSEL_A = 0;
  localparam AMULTSEL_AD = 1;
  localparam BMULTSEL_AD = 1;
  localparam BMULTSEL_B = 0;
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;
  localparam PREADDINSEL_A = 0;
  localparam PREADDINSEL_B = 1;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_PREADD_DATA58_dr.v"
`else
  reg [31:0] ADREG_REG = ADREG;
  reg [16:1] AMULTSEL_REG = AMULTSEL;
  reg [31:0] AREG_REG = AREG;
  reg [16:1] BMULTSEL_REG = BMULTSEL;
  reg [31:0] BREG_REG = BREG;
  reg [31:0] DREG_REG = DREG;
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [31:0] INMODEREG_REG = INMODEREG;
  reg [4:0] IS_INMODE_INVERTED_REG = IS_INMODE_INVERTED;
  reg [2:0] IS_NEGATE_INVERTED_REG = IS_NEGATE_INVERTED;
  reg [0:0] IS_RSTINMODE_INVERTED_REG = IS_RSTINMODE_INVERTED;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [31:0] MREG_REG = MREG;
  reg [8:1] PREADDINSEL_REG = PREADDINSEL;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire ADREG_BIN;
  wire AMULTSEL_BIN;
  wire [1:0] AREG_BIN;
  wire BMULTSEL_BIN;
  wire [1:0] BREG_BIN;
  wire DREG_BIN;
  wire [1:0] DSP_MODE_BIN;
  wire INMODEREG_BIN;
  wire LEGACY_BIN;
  wire MREG_BIN;
  wire PREADDINSEL_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg ADREG_BIN;
  reg AMULTSEL_BIN;
  reg [1:0] AREG_BIN;
  reg BMULTSEL_BIN;
  reg [1:0] BREG_BIN;
  reg DREG_BIN;
  reg [1:0] DSP_MODE_BIN;
  reg INMODEREG_BIN;
  reg LEGACY_BIN;
  reg MREG_BIN;
  reg PREADDINSEL_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEAD_IN_in;
  wire CED_IN_in;
  wire CEINMODE_in;
  wire CLK_in;
  wire CONJ_CPLX_MULT_IN_in;
  wire CONJ_CPLX_PREADD_IN_in;
  wire RSTAD_in;
  wire RSTD_in;
  wire RSTINMODE_in;
  wire [17:0] D_FROM_A_CPLX_in;
  wire [23:0] B1_DATA_in;
  wire [23:0] B2_DATA_in;
  wire [26:0] A1_DATA_in;
  wire [26:0] A2_DATA_in;
  wire [26:0] AD_in;
  wire [26:0] DIN_in;
  wire [2:0] NEGATE_in;
  wire [4:0] INMODE_in;
  wire [9:0] AD_CPLX_in;
  wire [4:0] IS_INMODE_INVERTED_int;

  assign IS_INMODE_INVERTED_int = (DSP_MODE_BIN==DSP_MODE_CINT18) ? 5'b00000 : IS_INMODE_INVERTED_REG; //CR-1059657

`ifdef XIL_TIMING
  wire ASYNC_RST_delay;
  wire CEAD_IN_delay;
  wire CED_IN_delay;
  wire CEINMODE_delay;
  wire CLK_delay;
  wire RSTAD_delay;
  wire RSTD_delay;
  wire RSTINMODE_delay;
  wire [17:0] D_FROM_A_CPLX_delay;
  wire [26:0] AD_delay;
  wire [26:0] DIN_delay;
  wire [2:0] NEGATE_delay;
  wire [4:0] INMODE_delay;
  wire [9:0] AD_CPLX_delay;
`endif
  
`ifdef XIL_TIMING
 assign AD_CPLX_in = AD_CPLX_delay;
  assign AD_in = AD_delay;
  assign ASYNC_RST_in = ASYNC_RST_delay;
  assign CEAD_IN_in = CEAD_IN_delay;
  assign CED_IN_in = CED_IN_delay;
  assign CEINMODE_in = CEINMODE_delay;
  assign CLK_in = CLK_delay;
  assign DIN_in[0] = (DIN[0] === 1'bz) || DIN_delay[0]; // rv 1
  assign DIN_in[10] = (DIN[10] === 1'bz) || DIN_delay[10]; // rv 1
  assign DIN_in[11] = (DIN[11] === 1'bz) || DIN_delay[11]; // rv 1
  assign DIN_in[12] = (DIN[12] === 1'bz) || DIN_delay[12]; // rv 1
  assign DIN_in[13] = (DIN[13] === 1'bz) || DIN_delay[13]; // rv 1
  assign DIN_in[14] = (DIN[14] === 1'bz) || DIN_delay[14]; // rv 1
  assign DIN_in[15] = (DIN[15] === 1'bz) || DIN_delay[15]; // rv 1
  assign DIN_in[16] = (DIN[16] === 1'bz) || DIN_delay[16]; // rv 1
  assign DIN_in[17] = (DIN[17] === 1'bz) || DIN_delay[17]; // rv 1
  assign DIN_in[18] = (DIN[18] === 1'bz) || DIN_delay[18]; // rv 1
  assign DIN_in[19] = (DIN[19] === 1'bz) || DIN_delay[19]; // rv 1
  assign DIN_in[1] = (DIN[1] === 1'bz) || DIN_delay[1]; // rv 1
  assign DIN_in[20] = (DIN[20] === 1'bz) || DIN_delay[20]; // rv 1
  assign DIN_in[21] = (DIN[21] === 1'bz) || DIN_delay[21]; // rv 1
  assign DIN_in[22] = (DIN[22] === 1'bz) || DIN_delay[22]; // rv 1
  assign DIN_in[23] = (DIN[23] === 1'bz) || DIN_delay[23]; // rv 1
  assign DIN_in[24] = (DIN[24] === 1'bz) || DIN_delay[24]; // rv 1
  assign DIN_in[25] = (DIN[25] === 1'bz) || DIN_delay[25]; // rv 1
  assign DIN_in[26] = (DIN[26] === 1'bz) || DIN_delay[26]; // rv 1
  assign DIN_in[2] = (DIN[2] === 1'bz) || DIN_delay[2]; // rv 1
  assign DIN_in[3] = (DIN[3] === 1'bz) || DIN_delay[3]; // rv 1
  assign DIN_in[4] = (DIN[4] === 1'bz) || DIN_delay[4]; // rv 1
  assign DIN_in[5] = (DIN[5] === 1'bz) || DIN_delay[5]; // rv 1
  assign DIN_in[6] = (DIN[6] === 1'bz) || DIN_delay[6]; // rv 1
  assign DIN_in[7] = (DIN[7] === 1'bz) || DIN_delay[7]; // rv 1
  assign DIN_in[8] = (DIN[8] === 1'bz) || DIN_delay[8]; // rv 1
  assign DIN_in[9] = (DIN[9] === 1'bz) || DIN_delay[9]; // rv 1
  assign D_FROM_A_CPLX_in = D_FROM_A_CPLX_delay;
  assign INMODE_in[0] = (INMODE[0] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? (|AREG_BIN): INMODE_delay[0]) ^ IS_INMODE_INVERTED_int[0]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[1] = (INMODE[1] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? 1'b0       : INMODE_delay[1]) ^ IS_INMODE_INVERTED_int[1]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[2] = (INMODE[2] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? 1'b1       : INMODE_delay[2]) ^ IS_INMODE_INVERTED_int[2]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[3] = (INMODE[3] !== 1'bz) && (                                                INMODE_delay[3]  ^ IS_INMODE_INVERTED_int[3]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[4] = (INMODE[4] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? (|BREG_BIN): INMODE_delay[4]) ^ IS_INMODE_INVERTED_int[4]); // rv 0 //CR-1026338, CR-1059657
  assign NEGATE_in[0] = (NEGATE[0] !== 1'bz) && (NEGATE_delay[0] ^ IS_NEGATE_INVERTED_REG[0]); // rv 0
  assign NEGATE_in[1] = (NEGATE[1] !== 1'bz) && (NEGATE_delay[1] ^ IS_NEGATE_INVERTED_REG[1]); // rv 0
  assign NEGATE_in[2] = (NEGATE[2] !== 1'bz) && (NEGATE_delay[2] ^ IS_NEGATE_INVERTED_REG[2]); // rv 0
  assign RSTAD_in = RSTAD_delay;
  assign RSTD_in = RSTD_delay;
  assign RSTINMODE_in = (RSTINMODE !== 1'bz) && (RSTINMODE_delay ^ IS_RSTINMODE_INVERTED_REG); // rv 0
`else
 assign AD_CPLX_in = AD_CPLX;
  assign AD_in = AD;
  assign ASYNC_RST_in = ASYNC_RST;
  assign CEAD_IN_in = CEAD_IN;
  assign CED_IN_in = CED_IN;
  assign CEINMODE_in = CEINMODE;
  assign CLK_in = CLK;
  assign DIN_in[0] = (DIN[0] === 1'bz) || DIN[0]; // rv 1
  assign DIN_in[10] = (DIN[10] === 1'bz) || DIN[10]; // rv 1
  assign DIN_in[11] = (DIN[11] === 1'bz) || DIN[11]; // rv 1
  assign DIN_in[12] = (DIN[12] === 1'bz) || DIN[12]; // rv 1
  assign DIN_in[13] = (DIN[13] === 1'bz) || DIN[13]; // rv 1
  assign DIN_in[14] = (DIN[14] === 1'bz) || DIN[14]; // rv 1
  assign DIN_in[15] = (DIN[15] === 1'bz) || DIN[15]; // rv 1
  assign DIN_in[16] = (DIN[16] === 1'bz) || DIN[16]; // rv 1
  assign DIN_in[17] = (DIN[17] === 1'bz) || DIN[17]; // rv 1
  assign DIN_in[18] = (DIN[18] === 1'bz) || DIN[18]; // rv 1
  assign DIN_in[19] = (DIN[19] === 1'bz) || DIN[19]; // rv 1
  assign DIN_in[1] = (DIN[1] === 1'bz) || DIN[1]; // rv 1
  assign DIN_in[20] = (DIN[20] === 1'bz) || DIN[20]; // rv 1
  assign DIN_in[21] = (DIN[21] === 1'bz) || DIN[21]; // rv 1
  assign DIN_in[22] = (DIN[22] === 1'bz) || DIN[22]; // rv 1
  assign DIN_in[23] = (DIN[23] === 1'bz) || DIN[23]; // rv 1
  assign DIN_in[24] = (DIN[24] === 1'bz) || DIN[24]; // rv 1
  assign DIN_in[25] = (DIN[25] === 1'bz) || DIN[25]; // rv 1
  assign DIN_in[26] = (DIN[26] === 1'bz) || DIN[26]; // rv 1
  assign DIN_in[2] = (DIN[2] === 1'bz) || DIN[2]; // rv 1
  assign DIN_in[3] = (DIN[3] === 1'bz) || DIN[3]; // rv 1
  assign DIN_in[4] = (DIN[4] === 1'bz) || DIN[4]; // rv 1
  assign DIN_in[5] = (DIN[5] === 1'bz) || DIN[5]; // rv 1
  assign DIN_in[6] = (DIN[6] === 1'bz) || DIN[6]; // rv 1
  assign DIN_in[7] = (DIN[7] === 1'bz) || DIN[7]; // rv 1
  assign DIN_in[8] = (DIN[8] === 1'bz) || DIN[8]; // rv 1
  assign DIN_in[9] = (DIN[9] === 1'bz) || DIN[9]; // rv 1
  assign D_FROM_A_CPLX_in = D_FROM_A_CPLX;
  assign INMODE_in[0] = (INMODE[0] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? (|AREG_BIN): INMODE[0]) ^ IS_INMODE_INVERTED_int[0]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[1] = (INMODE[1] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? 1'b0       : INMODE[1]) ^ IS_INMODE_INVERTED_int[1]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[2] = (INMODE[2] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? 1'b1       : INMODE[2]) ^ IS_INMODE_INVERTED_int[2]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[3] = (INMODE[3] !== 1'bz) && (                                                INMODE[3]  ^ IS_INMODE_INVERTED_int[3]); // rv 0 //CR-1026338, CR-1059657
  assign INMODE_in[4] = (INMODE[4] !== 1'bz) && (((DSP_MODE_BIN==DSP_MODE_CINT18) ? (|BREG_BIN): INMODE[4]) ^ IS_INMODE_INVERTED_int[4]); // rv 0 //CR-1026338, CR-1059657
  assign NEGATE_in[0] = (NEGATE[0] !== 1'bz) && (NEGATE[0] ^ IS_NEGATE_INVERTED_REG[0]); // rv 0
  assign NEGATE_in[1] = (NEGATE[1] !== 1'bz) && (NEGATE[1] ^ IS_NEGATE_INVERTED_REG[1]); // rv 0
  assign NEGATE_in[2] = (NEGATE[2] !== 1'bz) && (NEGATE[2] ^ IS_NEGATE_INVERTED_REG[2]); // rv 0
  assign RSTAD_in = RSTAD;
  assign RSTD_in = RSTD;
  assign RSTINMODE_in = (RSTINMODE !== 1'bz) && (RSTINMODE ^ IS_RSTINMODE_INVERTED_REG); // rv 0
`endif

  assign A1_DATA_in = A1_DATA;
  assign A2_DATA_in = A2_DATA;
  assign B1_DATA_in = B1_DATA;
  assign B2_DATA_in = B2_DATA;
  assign CONJ_CPLX_MULT_IN_in = CONJ_CPLX_MULT_IN;
  assign CONJ_CPLX_PREADD_IN_in = CONJ_CPLX_PREADD_IN;

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
  assign ADREG_BIN = ADREG_REG[0];

  assign AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  assign AREG_BIN = AREG_REG[1:0];

  assign BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  assign BREG_BIN = BREG_REG[1:0];

  assign DREG_BIN = (DSP_MODE_REG== "CINT18") ? (AREG_REG[1]|AREG_REG[0]) : DREG_REG[0]; //CR-1059657

  assign DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  assign INMODEREG_BIN = INMODEREG_REG[0];

  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

  assign MREG_BIN = MREG_REG[0];

  assign PREADDINSEL_BIN =
    (PREADDINSEL_REG == "A") ? PREADDINSEL_A :
    (PREADDINSEL_REG == "B") ? PREADDINSEL_B :
     PREADDINSEL_A;

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

  ADREG_BIN = ADREG_REG[0];

  AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  AREG_BIN = AREG_REG[1:0];

  BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  BREG_BIN = BREG_REG[1:0];

  DREG_BIN = (DSP_MODE_REG== "CINT18") ? (AREG_REG[1]|AREG_REG[0]) : DREG_REG[0]; //CR-1059657

  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  INMODEREG_BIN = INMODEREG_REG[0];

  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

  MREG_BIN = MREG_REG[0];

  PREADDINSEL_BIN =
    (PREADDINSEL_REG == "A") ? PREADDINSEL_A :
    (PREADDINSEL_REG == "B") ? PREADDINSEL_B :
     PREADDINSEL_A;

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
        ((ADREG_REG != 1) &&
         (ADREG_REG != 0))) begin
      $display("Error: [Unisim %s-101] ADREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ADREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AMULTSEL_REG != "A") &&
         (AMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-102] AMULTSEL attribute is set to %s.  Legal values for this attribute are A or AD. Instance: %m", MODULE_NAME, AMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AREG_REG != 1) &&
         (AREG_REG != 0) &&
         (AREG_REG != 2))) begin
      $display("Error: [Unisim %s-103] AREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, AREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BMULTSEL_REG != "B") &&
         (BMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-104] BMULTSEL attribute is set to %s.  Legal values for this attribute are B or AD. Instance: %m", MODULE_NAME, BMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BREG_REG != 1) &&
         (BREG_REG != 0) &&
         (BREG_REG != 2))) begin
      $display("Error: [Unisim %s-105] BREG attribute is set to %d.  Legal values for this attribute are 1, 0 or 2. Instance: %m", MODULE_NAME, BREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((DREG_REG != 1) &&
         (DREG_REG != 0))) begin
      $display("Error: [Unisim %s-106] DREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, DREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-107] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((INMODEREG_REG != 1) &&
         (INMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-108] INMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, INMODEREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-112] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((MREG_REG != 1) &&
         (MREG_REG != 0))) begin
      $display("Error: [Unisim %s-113] MREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((PREADDINSEL_REG != "A") &&
         (PREADDINSEL_REG != "B"))) begin
      $display("Error: [Unisim %s-114] PREADDINSEL attribute is set to %s.  Legal values for this attribute are A or B. Instance: %m", MODULE_NAME, PREADDINSEL_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-115] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-116] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam D_WIDTH   = 32;
  wire [26:0] a1a2_i_mux;
  wire [23:0] b1b2_i_mux;
  wire [4:0] INMODE_mux;
  reg [4:0]  INMODE_reg = 5'b0;
  reg [D_WIDTH-1:0] AD_DATA_reg = {D_WIDTH{1'b0}};
  reg [9:0] AD_DATA_CPLX_reg = {10{1'b0}};
  reg [D_WIDTH-1:0] D_DATA_reg = {D_WIDTH{1'b0}};
  reg [2:0] NEGATE_DATA_reg = 3'b000;
  reg [2:0] NEGATE_DATA_CPLX_reg = 3'b000;

  reg DREG_INT;
  reg ADREG_INT;

  reg ASYNC_RST_async = 1'b0;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  INMODE_reg = 5'b0;
  AD_DATA_reg = {D_WIDTH{1'b0}};
  AD_DATA_CPLX_reg = {10{1'b0}};
  D_DATA_reg = {D_WIDTH{1'b0}};
  NEGATE_DATA_reg = 3'b000;
  NEGATE_DATA_CPLX_reg = 3'b000;
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

  always @ (*) begin
    if ((((AMULTSEL_BIN == AMULTSEL_A) &&
          (BMULTSEL_BIN == BMULTSEL_B)) ||
         (USE_MULT_BIN == USE_MULT_NONE)) &&
        ((DSP_MODE_BIN == DSP_MODE_INT24) ||
         (DSP_MODE_BIN == DSP_MODE_FP32)  ||
         (DSP_MODE_BIN == DSP_MODE_INT8))) begin
      DREG_INT = 1'b0;
    end else begin
      DREG_INT = DREG_BIN;
    end
  end

  always @ (*) begin
    if (((AMULTSEL_BIN == AMULTSEL_A) && (BMULTSEL_BIN == BMULTSEL_B)) ||
        (USE_MULT_BIN == USE_MULT_NONE)) begin
      ADREG_INT = 1'b0;
    end else begin
      ADREG_INT = ADREG_BIN;
    end
  end

   assign a1a2_i_mux = INMODE_mux[0] ? A1_DATA_in : A2_DATA_in;
   assign b1b2_i_mux = (INMODE_mux[4] && ~((DSP_MODE_BIN==DSP_MODE_CINT18) && (BREG_BIN==2'b10 && ADREG_INT==1'b1))) ?
                        B1_DATA_in : B2_DATA_in;
   assign A2A1      = ((PREADDINSEL_BIN==PREADDINSEL_A) && INMODE_mux[1]) ? 27'b0 : a1a2_i_mux;
   assign B2B1      = ((PREADDINSEL_BIN==PREADDINSEL_B) && INMODE_mux[1]) ? 24'b0 : b1b2_i_mux;
   assign B2B1_CPLX = (INMODE_mux[4]) ? B1_DATA_in[17:0] : B2_DATA_in[17:0];
   assign ADDSUB   = (DSP_MODE_BIN != DSP_MODE_CINT18) ? INMODE_mux[3] : CONJ_CPLX_PREADD_IN_in;

   assign INMODE_2 = (DSP_MODE_BIN == DSP_MODE_CINT18) ? 1'b1 : INMODE_mux[2];

   assign PREADD_AB    = (PREADDINSEL_BIN==PREADDINSEL_B) ? {{3{B2B1[23]}}, B2B1} : A2A1;

//*********************************************************
//**********  INMODE signal registering        ************
//*********************************************************
// new 

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTINMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (INMODEREG_BIN == 1'b0) || glblGSR) begin
         INMODE_reg <= 5'b0;
      end else if (CEINMODE_in) begin
         INMODE_reg <= INMODE_in; 
      end
   end

   assign INMODE_mux[4] = ((DSP_MODE_BIN == DSP_MODE_CINT18) || (INMODEREG_BIN == 1'b0)) ?  INMODE_in[4] : INMODE_reg[4];
   assign INMODE_mux[3] = (INMODEREG_BIN == 1'b0) ? INMODE_in[3] : INMODE_reg[3];
   assign INMODE_mux[2:0] = ((DSP_MODE_BIN == DSP_MODE_CINT18) || (INMODEREG_BIN == 1'b0)) ?  INMODE_in[2:0] : INMODE_reg[2:0];

   assign CONJ_CPLX_OUT = INMODE_mux[3];

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTD_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (DREG_INT == 1'b0) || glblGSR) begin
         D_DATA_reg <= {D_WIDTH{1'b0}};
      end else if (CED_IN_in) begin
         if (DSP_MODE_BIN == DSP_MODE_CINT18) begin
           D_DATA_reg <= {13'b0, D_FROM_A_CPLX_in[17], D_FROM_A_CPLX_in};
         end else begin
         D_DATA_reg <= {5'b0, DIN_in};
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTINMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (INMODEREG_BIN == 1'b0) || glblGSR) begin
        NEGATE_DATA_reg <= 3'b000;
      end else if (CEINMODE_in) begin
           NEGATE_DATA_reg <= NEGATE_in;
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTAD_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          (DSP_MODE_BIN != DSP_MODE_CINT18) ||
          ASYNC_RST_async ||
          (ADREG_INT == 1'b0) || glblGSR) begin
        NEGATE_DATA_CPLX_reg <= 3'b000;
      end else if (CEAD_IN_in) begin
        NEGATE_DATA_CPLX_reg <= {3{CONJ_CPLX_MULT_IN_in}};
      end
   end

   assign D_DATA    = (DREG_INT == 1'b1) ? D_DATA_reg : 
                      (DSP_MODE_BIN != DSP_MODE_CINT18) ? {5'b0, DIN_in}  :
                      {13'b0, D_FROM_A_CPLX_in[17], D_FROM_A_CPLX_in};

   assign NEGATE_DATA = (DSP_MODE_BIN == DSP_MODE_CINT18) ?
                    (ADREG_INT == 1'b1 ) ? NEGATE_DATA_CPLX_reg : {3{CONJ_CPLX_MULT_IN_in}} :
                    (INMODEREG_BIN == 1'b1) ? NEGATE_DATA_reg : NEGATE_in;

//*********************************************************
//*** Input register AD with 1 level deep of register
//*********************************************************

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTAD_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (ADREG_INT == 1'b0) || glblGSR) begin
         AD_DATA_reg <= 27'b0;
      end else if (CEAD_IN_in) AD_DATA_reg <= AD_in;
   end

   assign AD_DATA    = (ADREG_INT == 1'b1) ? AD_DATA_reg : AD_in;

//*********************************************************
//*** Input register AD_DATA_CPLX with 1 level deep of registers
//*********************************************************

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTAD_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (ADREG_INT == 1'b0) || glblGSR) begin
          AD_DATA_CPLX_reg <= 10'b0;
       end else if (CEAD_IN_in) begin
          AD_DATA_CPLX_reg <= AD_CPLX_in;
       end
    end

    assign AD_DATA_CPLX = (ADREG_INT == 1'b1) ? AD_DATA_CPLX_reg : AD_CPLX_in;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (A1_DATA *> A2A1) = (0:0:0, 0:0:0);
    (A1_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (A2_DATA *> A2A1) = (0:0:0, 0:0:0);
    (A2_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (AD *> AD_DATA) = (0:0:0, 0:0:0);
    (AD_CPLX *> AD_DATA) = (0:0:0, 0:0:0);
    (AD_CPLX *> AD_DATA_CPLX) = (0:0:0, 0:0:0);
    (B1_DATA *> B2B1) = (0:0:0, 0:0:0);
    (B1_DATA *> B2B1_CPLX) = (0:0:0, 0:0:0);
    (B1_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (B2_DATA *> B2B1) = (0:0:0, 0:0:0);
    (B2_DATA *> B2B1_CPLX) = (0:0:0, 0:0:0);
    (B2_DATA *> PREADD_AB) = (0:0:0, 0:0:0);
    (CLK *> A2A1) = (100:100:100, 100:100:100);
    (CLK *> AD_DATA) = (100:100:100, 100:100:100);
    (CLK *> AD_DATA_CPLX) = (100:100:100, 100:100:100);
    (CLK *> B2B1) = (100:100:100, 100:100:100);
    (CLK *> D_DATA) = (100:100:100, 100:100:100);
    (CLK *> NEGATE_DATA) = (100:100:100, 100:100:100);
    (CLK *> PREADD_AB) = (100:100:100, 100:100:100);
    (CLK => ADDSUB) = (100:100:100, 100:100:100);
    (CLK => CONJ_CPLX_OUT) = (100:100:100, 100:100:100);
    (CLK => INMODE_2) = (100:100:100, 100:100:100);
    (DIN *> D_DATA) = (0:0:0, 0:0:0);
    (D_FROM_A_CPLX *> D_DATA) = (0:0:0, 0:0:0);
    (INMODE *> A2A1) = (0:0:0, 0:0:0);
    (INMODE *> ADDSUB) = (0:0:0, 0:0:0);
    (INMODE *> B2B1) = (0:0:0, 0:0:0);
    (INMODE *> CONJ_CPLX_OUT) = (0:0:0, 0:0:0);
    (INMODE *> INMODE_2) = (0:0:0, 0:0:0);
    (INMODE *> PREADD_AB) = (0:0:0, 0:0:0);
    (NEGATE *> NEGATE_DATA) = (0:0:0, 0:0:0);
    (posedge CONJ_CPLX_PREADD_IN => (ADDSUB +: 1)) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $recrem (negedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $recrem (posedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $setuphold (posedge CLK, negedge AD, 0:0:0, 0:0:0, notifier, , , CLK_delay, AD_delay);
    $setuphold (posedge CLK, negedge AD_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, AD_CPLX_delay);
    $setuphold (posedge CLK, negedge CEAD_IN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEAD_IN_delay);
    $setuphold (posedge CLK, negedge CED_IN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CED_IN_delay);
    $setuphold (posedge CLK, negedge CEINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEINMODE_delay);
    $setuphold (posedge CLK, negedge DIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, DIN_delay);
    $setuphold (posedge CLK, negedge D_FROM_A_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_FROM_A_CPLX_delay);
    $setuphold (posedge CLK, negedge INMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, INMODE_delay);
    $setuphold (posedge CLK, negedge NEGATE, 0:0:0, 0:0:0, notifier, , , CLK_delay, NEGATE_delay);
    $setuphold (posedge CLK, negedge RSTAD, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTAD_delay);
    $setuphold (posedge CLK, negedge RSTD, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTD_delay);
    $setuphold (posedge CLK, negedge RSTINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTINMODE_delay);
    $setuphold (posedge CLK, posedge AD, 0:0:0, 0:0:0, notifier, , , CLK_delay, AD_delay);
    $setuphold (posedge CLK, posedge AD_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, AD_CPLX_delay);
    $setuphold (posedge CLK, posedge CEAD_IN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEAD_IN_delay);
    $setuphold (posedge CLK, posedge CED_IN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CED_IN_delay);
    $setuphold (posedge CLK, posedge CEINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEINMODE_delay);
    $setuphold (posedge CLK, posedge DIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, DIN_delay);
    $setuphold (posedge CLK, posedge D_FROM_A_CPLX, 0:0:0, 0:0:0, notifier, , , CLK_delay, D_FROM_A_CPLX_delay);
    $setuphold (posedge CLK, posedge INMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, INMODE_delay);
    $setuphold (posedge CLK, posedge NEGATE, 0:0:0, 0:0:0, notifier, , , CLK_delay, NEGATE_delay);
    $setuphold (posedge CLK, posedge RSTAD, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTAD_delay);
    $setuphold (posedge CLK, posedge RSTD, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTD_delay);
    $setuphold (posedge CLK, posedge RSTINMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTINMODE_delay);
    $width (negedge ASYNC_RST, 0:0:0, 0, notifier);
    $width (posedge ASYNC_RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
