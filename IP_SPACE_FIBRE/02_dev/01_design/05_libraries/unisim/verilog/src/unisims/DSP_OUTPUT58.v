///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_OUTPUT58
// /___/   /\      Filename    : DSP_OUTPUT58.v
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

module DSP_OUTPUT58 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ADREG = 1,
  parameter AMULTSEL = "A",
  parameter AUTORESET_PATDET = "NO_RESET",
  parameter AUTORESET_PRIORITY = "RESET",
  parameter BMULTSEL = "B",
  parameter DSP_MODE = "INT24",
  parameter [0:0] IS_RSTP_INVERTED = 1'b0,
  parameter LEGACY = "DSP58",
  parameter integer PREG = 1,
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output CARRYCASCOUT,
  output CARRYCASCOUT_FB,
  output [3:0] CARRYOUT,
  output MULTSIGNOUT,
  output OVERFLOW,
  output [57:0] P,
  output PATTERNBDETECT,
  output PATTERNDETECT,
  output [57:0] PCOUT,
  output [57:0] P_FDBK,
  output P_FDBK_MSB,
  output UNDERFLOW,
  output [7:0] XOROUT,

  input ALUMODE10,
  input [57:0] ALU_OUT,
  input ASYNC_RST,
  input CEP,
  input CLK,
  input [3:0] COUT,
  input MULTSIGN_ALU,
  input [4:0] PATT_B_DET,
  input [4:0] PATT_DET,
  input RSTP,
  input [7:0] XOR_MX
);
  
// define constants
  localparam MODULE_NAME = "DSP_OUTPUT58";

// Parameter encodings and registers
  localparam AMULTSEL_A = 0;
  localparam AMULTSEL_AD = 1;
  localparam AUTORESET_PATDET_NO_RESET = 0;
  localparam AUTORESET_PATDET_RESET_MATCH = 1;
  localparam AUTORESET_PATDET_RESET_NOT_MATCH = 2;
  localparam AUTORESET_PRIORITY_CEP = 1;
  localparam AUTORESET_PRIORITY_RESET = 0;
  localparam BMULTSEL_AD = 1;
  localparam BMULTSEL_B = 0;
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;
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
  `include "DSP_OUTPUT58_dr.v"
`else
  reg [31:0] ADREG_REG = ADREG;
  reg [16:1] AMULTSEL_REG = AMULTSEL;
  reg [120:1] AUTORESET_PATDET_REG = AUTORESET_PATDET;
  reg [40:1] AUTORESET_PRIORITY_REG = AUTORESET_PRIORITY;
  reg [16:1] BMULTSEL_REG = BMULTSEL;
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [0:0] IS_RSTP_INVERTED_REG = IS_RSTP_INVERTED;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [31:0] PREG_REG = PREG;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire ADREG_BIN;
  wire AMULTSEL_BIN;
  wire [1:0] AUTORESET_PATDET_BIN;
  wire AUTORESET_PRIORITY_BIN;
  wire BMULTSEL_BIN;
  wire [1:0] DSP_MODE_BIN;
  wire LEGACY_BIN;
  wire PREG_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg ADREG_BIN;
  reg AMULTSEL_BIN;
  reg [1:0] AUTORESET_PATDET_BIN;
  reg AUTORESET_PRIORITY_BIN;
  reg BMULTSEL_BIN;
  reg [1:0] DSP_MODE_BIN;
  reg LEGACY_BIN;
  reg PREG_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ALUMODE10_in;
  wire ASYNC_RST_in;
  wire CEP_in;
  wire CLK_in;
  wire MULTSIGN_ALU_in;
  wire RSTP_in;
  wire [3:0] COUT_in;
  wire [4:0] PATT_B_DET_in;
  wire [4:0] PATT_DET_in;
  wire [57:0] ALU_OUT_in;
  wire [7:0] XOR_MX_in;

`ifdef XIL_TIMING
  wire ALUMODE10_delay;
  wire ASYNC_RST_delay;
  wire CEP_delay;
  wire CLK_delay;
  wire MULTSIGN_ALU_delay;
  wire RSTP_delay;
  wire [3:0] COUT_delay;
  wire [4:0] PATT_B_DET_delay;
  wire [4:0] PATT_DET_delay;
  wire [57:0] ALU_OUT_delay;
  wire [7:0] XOR_MX_delay;
`endif
  
`ifdef XIL_TIMING
  assign ALUMODE10_in = ALUMODE10_delay;
  assign ALU_OUT_in = ALU_OUT_delay;
  assign ASYNC_RST_in = ASYNC_RST_delay;
  assign CEP_in = (CEP !== 1'bz) && CEP_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign COUT_in = COUT_delay;
  assign MULTSIGN_ALU_in = MULTSIGN_ALU_delay;
  assign PATT_B_DET_in = PATT_B_DET_delay;
  assign PATT_DET_in = PATT_DET_delay;
  assign RSTP_in = (RSTP !== 1'bz) && (RSTP_delay ^ IS_RSTP_INVERTED_REG); // rv 0
  assign XOR_MX_in = XOR_MX_delay;
`else
  assign ALUMODE10_in = ALUMODE10;
  assign ALU_OUT_in = ALU_OUT;
  assign ASYNC_RST_in = ASYNC_RST;
  assign CEP_in = (CEP !== 1'bz) && CEP; // rv 0
  assign CLK_in = CLK;
  assign COUT_in = COUT;
  assign MULTSIGN_ALU_in = MULTSIGN_ALU;
  assign PATT_B_DET_in = PATT_B_DET;
  assign PATT_DET_in = PATT_DET;
  assign RSTP_in = (RSTP !== 1'bz) && (RSTP ^ IS_RSTP_INVERTED_REG); // rv 0
  assign XOR_MX_in = XOR_MX;
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
  assign ADREG_BIN = ADREG_REG[0];

  assign AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

  assign AUTORESET_PATDET_BIN =
    (AUTORESET_PATDET_REG == "NO_RESET") ? AUTORESET_PATDET_NO_RESET :
    (AUTORESET_PATDET_REG == "RESET_MATCH") ? AUTORESET_PATDET_RESET_MATCH :
    (AUTORESET_PATDET_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RESET_NOT_MATCH :
     AUTORESET_PATDET_NO_RESET;

  assign AUTORESET_PRIORITY_BIN =
    (AUTORESET_PRIORITY_REG == "RESET") ? AUTORESET_PRIORITY_RESET :
    (AUTORESET_PRIORITY_REG == "CEP") ? AUTORESET_PRIORITY_CEP :
     AUTORESET_PRIORITY_RESET;

  assign BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  assign DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

  assign PREG_BIN = PREG_REG[0];

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

  AUTORESET_PATDET_BIN =
    (AUTORESET_PATDET_REG == "NO_RESET") ? AUTORESET_PATDET_NO_RESET :
    (AUTORESET_PATDET_REG == "RESET_MATCH") ? AUTORESET_PATDET_RESET_MATCH :
    (AUTORESET_PATDET_REG == "RESET_NOT_MATCH") ? AUTORESET_PATDET_RESET_NOT_MATCH :
     AUTORESET_PATDET_NO_RESET;

  AUTORESET_PRIORITY_BIN =
    (AUTORESET_PRIORITY_REG == "RESET") ? AUTORESET_PRIORITY_RESET :
    (AUTORESET_PRIORITY_REG == "CEP") ? AUTORESET_PRIORITY_CEP :
     AUTORESET_PRIORITY_RESET;

  BMULTSEL_BIN =
    (BMULTSEL_REG == "B") ? BMULTSEL_B :
    (BMULTSEL_REG == "AD") ? BMULTSEL_AD :
     BMULTSEL_B;

  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

  PREG_BIN = PREG_REG[0];

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
        ((AUTORESET_PATDET_REG != "NO_RESET") &&
         (AUTORESET_PATDET_REG != "RESET_MATCH") &&
         (AUTORESET_PATDET_REG != "RESET_NOT_MATCH"))) begin
      $display("Error: [Unisim %s-103] AUTORESET_PATDET attribute is set to %s.  Legal values for this attribute are NO_RESET, RESET_MATCH or RESET_NOT_MATCH. Instance: %m", MODULE_NAME, AUTORESET_PATDET_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((AUTORESET_PRIORITY_REG != "RESET") &&
         (AUTORESET_PRIORITY_REG != "CEP"))) begin
      $display("Error: [Unisim %s-104] AUTORESET_PRIORITY attribute is set to %s.  Legal values for this attribute are RESET or CEP. Instance: %m", MODULE_NAME, AUTORESET_PRIORITY_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BMULTSEL_REG != "B") &&
         (BMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-105] BMULTSEL attribute is set to %s.  Legal values for this attribute are B or AD. Instance: %m", MODULE_NAME, BMULTSEL_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-106] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-108] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((PREG_REG != 1) &&
         (PREG_REG != 0))) begin
      $display("Error: [Unisim %s-109] PREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, PREG_REG);
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

  localparam P_WIDTH   = 58;
  wire the_auto_reset_patdet;
  wire auto_reset_pri;
  reg opmode_valid_flag_dou = 1'b0; // TODO set to x for invalid OPMODES

  reg [3:0] COUT_reg = 4'b0000;
  reg ALUMODE10_reg = 1'b0;
  wire ALUMODE10_mux;
  reg MULTSIGN_ALU_reg = 1'b0;
  reg [P_WIDTH-1:0] ALU_OUT_reg = {P_WIDTH{1'b0}};
  reg [7:0] XOR_MX_reg = 8'b0;

  wire pdet_o_mux;
  wire pdetb_o_mux;
  wire overflow_data;
  wire underflow_data;
  wire patt_det_sel;
  wire patt_b_det_sel;
  reg  pdet_o_reg1 = 1'b0;
  reg  pdet_o_reg2 = 1'b0;
  reg  pdetb_o_reg1 = 1'b0;
  reg  pdetb_o_reg2 = 1'b0;

  reg ASYNC_RST_async = 1'b0;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  COUT_reg = 4'b0000;
  ALUMODE10_reg = 1'b0;
  MULTSIGN_ALU_reg = 1'b0;
  ALU_OUT_reg = {P_WIDTH{1'b0}};
  XOR_MX_reg = 8'b0;
  pdet_o_reg1 = 1'b0;
  pdet_o_reg2 = 1'b0;
  pdetb_o_reg1 = 1'b0;
  pdetb_o_reg2 = 1'b0;
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

   assign PATTERNDETECT  = opmode_valid_flag_dou ^ pdet_o_mux;
   assign PATTERNBDETECT = opmode_valid_flag_dou ^ pdetb_o_mux;

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

assign patt_det_sel   = (LEGACY_BIN==LEGACY_DSP48) ? &(PATT_DET_in  [3:0]) : &(PATT_DET_in  );
assign patt_b_det_sel = (LEGACY_BIN==LEGACY_DSP48) ? &(PATT_B_DET_in[3:0]) : &(PATT_B_DET_in);

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTP_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         glblGSR || the_auto_reset_patdet) begin
         pdet_o_reg1  <= 1'b0;
         pdet_o_reg2  <= 1'b0;
         pdetb_o_reg1 <= 1'b0;
         pdetb_o_reg2 <= 1'b0;
     end else if (CEP_in && PREG_BIN) begin
       //-- the previous values are used in Underflow/Overflow
         pdet_o_reg2  <= pdet_o_reg1;
         pdetb_o_reg2 <= pdetb_o_reg1;
         pdet_o_reg1  <= patt_det_sel;
         pdetb_o_reg1 <= patt_b_det_sel;
     end
   end

    assign pdet_o_mux     = (PREG_BIN == 1'b1) ? pdet_o_reg1  : patt_det_sel;
    assign pdetb_o_mux    = (PREG_BIN == 1'b1) ? pdetb_o_reg1 : patt_b_det_sel;
    assign overflow_data  = (PREG_BIN == 1'b1) ? pdet_o_reg2  : patt_det_sel;
    assign underflow_data = (PREG_BIN == 1'b1) ? pdetb_o_reg2 : patt_b_det_sel;

//--####################################################################
//--#####                     AUTORESET_PATDET                     #####
//--####################################################################
    assign auto_reset_pri = (AUTORESET_PRIORITY_BIN == AUTORESET_PRIORITY_RESET) || CEP_in;

    assign the_auto_reset_patdet =
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_MATCH) ?
                     auto_reset_pri && pdet_o_mux :
         (AUTORESET_PATDET_BIN == AUTORESET_PATDET_RESET_NOT_MATCH) ?
                     auto_reset_pri && overflow_data && ~pdet_o_mux : 1'b0; // NO_RESET

//--####################################################################
//--#### CARRYOUT, CARRYCASCOUT. MULTSIGNOUT, PCOUT and XOROUT reg ##### 
//--####################################################################
//*** register with 1 level of register
   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTP_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         glblGSR || the_auto_reset_patdet) begin
       COUT_reg         <= 4'b0000;
       ALUMODE10_reg    <= 1'b0;
       MULTSIGN_ALU_reg <= 1'b0;
       ALU_OUT_reg      <= {P_WIDTH{1'b0}};
       XOR_MX_reg       <= 8'b0;
     end else if (CEP_in && PREG_BIN) begin
       COUT_reg         <= COUT_in;
       ALUMODE10_reg    <= ALUMODE10_in;
       MULTSIGN_ALU_reg <= MULTSIGN_ALU_in;
       ALU_OUT_reg      <= ALU_OUT_in;
       XOR_MX_reg       <= XOR_MX_in;
     end
   end

    assign ALUMODE10_mux    = (PREG_BIN == 1'b1) ? ALUMODE10_reg    : ALUMODE10_in;
    assign CARRYOUT     = (PREG_BIN == 1'b1) ? COUT_reg         : COUT_in;
    assign MULTSIGNOUT  = (PREG_BIN == 1'b1) ? MULTSIGN_ALU_reg : MULTSIGN_ALU_in;
    assign P            = (PREG_BIN == 1'b1) ? ALU_OUT_reg      : ALU_OUT_in;
    assign XOROUT       = (PREG_BIN == 1'b1) ? XOR_MX_reg      : XOR_MX_in;
    assign CARRYCASCOUT_FB = ALUMODE10_reg ^ COUT_reg[3];
    assign CARRYCASCOUT  = (PREG_BIN == 1'b1) ? ALUMODE10_reg ^ COUT_reg[3]:
                                                ALUMODE10_in  ^ COUT_in[3];
    assign P_FDBK     = ALU_OUT_reg;
    assign P_FDBK_MSB = (LEGACY_BIN==LEGACY_DSP48) ? ALU_OUT_reg[47] : ALU_OUT_reg[P_WIDTH-1];
    assign PCOUT = (PREG_BIN == 1'b1) ? ALU_OUT_reg : ALU_OUT_in;

//--####################################################################
//--#####                    Underflow / Overflow                  #####
//--####################################################################
    assign OVERFLOW      = ~pdet_o_mux && ~pdetb_o_mux && overflow_data;
    assign UNDERFLOW     = ~pdet_o_mux && ~pdetb_o_mux && underflow_data;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (ALUMODE10 => CARRYCASCOUT) = (0:0:0, 0:0:0);
    (ALU_OUT *> P) = (0:0:0, 0:0:0);
    (ALU_OUT *> PCOUT) = (0:0:0, 0:0:0);
    (CLK *> CARRYOUT) = (100:100:100, 100:100:100);
    (CLK *> P) = (100:100:100, 100:100:100);
    (CLK *> PCOUT) = (100:100:100, 100:100:100);
    (CLK *> P_FDBK) = (100:100:100, 100:100:100);
    (CLK *> XOROUT) = (100:100:100, 100:100:100);
    (CLK => CARRYCASCOUT) = (100:100:100, 100:100:100);
    (CLK => CARRYCASCOUT_FB) = (100:100:100, 100:100:100);
    (CLK => MULTSIGNOUT) = (100:100:100, 100:100:100);
    (CLK => OVERFLOW) = (100:100:100, 100:100:100);
    (CLK => PATTERNBDETECT) = (100:100:100, 100:100:100);
    (CLK => PATTERNDETECT) = (100:100:100, 100:100:100);
    (CLK => P_FDBK_MSB) = (100:100:100, 100:100:100);
    (CLK => UNDERFLOW) = (100:100:100, 100:100:100);
    (COUT *> CARRYCASCOUT) = (0:0:0, 0:0:0);
    (COUT *> CARRYOUT) = (0:0:0, 0:0:0);
    (MULTSIGN_ALU => MULTSIGNOUT) = (0:0:0, 0:0:0);
    (PATT_B_DET *> PATTERNBDETECT) = (0:0:0, 0:0:0);
    (PATT_DET *> PATTERNDETECT) = (0:0:0, 0:0:0);
    (XOR_MX *> XOROUT) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $recrem (negedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $recrem (posedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $setuphold (posedge CLK, negedge ALUMODE10, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALUMODE10_delay);
    $setuphold (posedge CLK, negedge ALU_OUT, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALU_OUT_delay);
    $setuphold (posedge CLK, negedge CEP, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEP_delay);
    $setuphold (posedge CLK, negedge COUT, 0:0:0, 0:0:0, notifier, , , CLK_delay, COUT_delay);
    $setuphold (posedge CLK, negedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier, , , CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (posedge CLK, negedge PATT_B_DET, 0:0:0, 0:0:0, notifier, , , CLK_delay, PATT_B_DET_delay);
    $setuphold (posedge CLK, negedge PATT_DET, 0:0:0, 0:0:0, notifier, , , CLK_delay, PATT_DET_delay);
    $setuphold (posedge CLK, negedge RSTP, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTP_delay);
    $setuphold (posedge CLK, negedge XOR_MX, 0:0:0, 0:0:0, notifier, , , CLK_delay, XOR_MX_delay);
    $setuphold (posedge CLK, posedge ALUMODE10, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALUMODE10_delay);
    $setuphold (posedge CLK, posedge ALU_OUT, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALU_OUT_delay);
    $setuphold (posedge CLK, posedge CEP, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEP_delay);
    $setuphold (posedge CLK, posedge COUT, 0:0:0, 0:0:0, notifier, , , CLK_delay, COUT_delay);
    $setuphold (posedge CLK, posedge MULTSIGN_ALU, 0:0:0, 0:0:0, notifier, , , CLK_delay, MULTSIGN_ALU_delay);
    $setuphold (posedge CLK, posedge PATT_B_DET, 0:0:0, 0:0:0, notifier, , , CLK_delay, PATT_B_DET_delay);
    $setuphold (posedge CLK, posedge PATT_DET, 0:0:0, 0:0:0, notifier, , , CLK_delay, PATT_DET_delay);
    $setuphold (posedge CLK, posedge RSTP, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTP_delay);
    $setuphold (posedge CLK, posedge XOR_MX, 0:0:0, 0:0:0, notifier, , , CLK_delay, XOR_MX_delay);
    $width (negedge ASYNC_RST, 0:0:0, 0, notifier);
    $width (posedge ASYNC_RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
