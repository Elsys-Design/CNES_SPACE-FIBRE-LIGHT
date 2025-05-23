///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_MULTIPLIER58
// /___/   /\      Filename    : DSP_MULTIPLIER58.v
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

module DSP_MULTIPLIER58 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter AMULTSEL = "A",
  parameter BMULTSEL = "B",
  parameter DSP_MODE = "INT24",
  parameter LEGACY = "DSP58",
  parameter USE_MULT = "MULTIPLY"
)(
  output AMULTMSB,
  output BMULTMSB,
  output [50:0] U,
  output [18:0] U0U2_INT8,
  output [16:0] U1_INT8,
  output [50:0] V,
  output [18:0] V0V2_INT8,
  output [16:0] V1_INT8,

  input [26:0] A2A1,
  input [26:0] AD_DATA,
  input [23:0] B2B1,
  input [2:0] NEGATE_DATA
);
  
// define constants
  localparam MODULE_NAME = "DSP_MULTIPLIER58";

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
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_MULTIPLIER58_dr.v"
`else
  reg [16:1] AMULTSEL_REG = AMULTSEL;
  reg [16:1] BMULTSEL_REG = BMULTSEL;
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire AMULTSEL_BIN;
  wire BMULTSEL_BIN;
  wire [1:0] DSP_MODE_BIN;
  wire LEGACY_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg AMULTSEL_BIN;
  reg BMULTSEL_BIN;
  reg [1:0] DSP_MODE_BIN;
  reg LEGACY_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
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
  assign AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

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

  assign USE_MULT_BIN =
    (USE_MULT_REG == "MULTIPLY") ? USE_MULT_MULTIPLY :
    (USE_MULT_REG == "DYNAMIC") ? USE_MULT_DYNAMIC :
    (USE_MULT_REG == "NONE") ? USE_MULT_NONE :
     USE_MULT_MULTIPLY;

`else
always @(trig_attr) begin
 #1;

  AMULTSEL_BIN =
    (AMULTSEL_REG == "A") ? AMULTSEL_A :
    (AMULTSEL_REG == "AD") ? AMULTSEL_AD :
     AMULTSEL_A;

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
        ((AMULTSEL_REG != "A") &&
         (AMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-101] AMULTSEL attribute is set to %s.  Legal values for this attribute are A or AD. Instance: %m", MODULE_NAME, AMULTSEL_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((BMULTSEL_REG != "B") &&
         (BMULTSEL_REG != "AD"))) begin
      $display("Error: [Unisim %s-102] BMULTSEL attribute is set to %s.  Legal values for this attribute are B or AD. Instance: %m", MODULE_NAME, BMULTSEL_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-103] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-104] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-105] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  localparam B_WIDTH   = 24;
  localparam M_WIDTH   = 51;
  reg  [B_WIDTH-1:0] b_mult    = {B_WIDTH{1'b0}};
  reg  [B_WIDTH-1:0] b_mult_in = {B_WIDTH{1'b0}};
  reg [26:0] a_mult = {27{1'b0}};
  reg [M_WIDTH-1:0] mult = {M_WIDTH{1'b0}};
  reg [M_WIDTH-2:0] ps_u_mask = {(M_WIDTH-1)/2{2'b01}};
  reg [M_WIDTH-2:0] ps_v_mask = {(M_WIDTH-1)/2{2'b10}};
  reg [M_WIDTH-1:0] mult32 = {M_WIDTH{1'b0}};
  reg [18:0] mult8 = {19{1'b0}};
  reg [17:0] mult802 = {18{1'b0}};
  reg [17:0] mult81 = {18{1'b0}};
  reg [16:0] mult_0 = {17{1'b0}};
  reg [16:0] mult_1 = {17{1'b0}};
  reg [16:0] mult_2 = {17{1'b0}};
  wire [M_WIDTH-1:0] multn;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  b_mult_in = {B_WIDTH{1'b0}};
  a_mult = {27{1'b0}};
  mult = {M_WIDTH{1'b0}};
  ps_u_mask = {(M_WIDTH-1)/2{2'b01}};
  ps_v_mask = {(M_WIDTH-1)/2{2'b10}};
  mult32 = {M_WIDTH{1'b0}};
  mult8 = {19{1'b0}};
  mult802 = {18{1'b0}};
  mult81 = {18{1'b0}};
  mult_0 = {17{1'b0}};
  mult_1 = {17{1'b0}};
  mult_2 = {17{1'b0}};
end
`endif

always @(*) begin
  if (AMULTSEL_BIN == AMULTSEL_A) a_mult = A2A1;
  else a_mult = AD_DATA;
end
always @(*) begin
  if (BMULTSEL_BIN == BMULTSEL_B) b_mult_in = B2B1;
  else b_mult_in = AD_DATA[B_WIDTH-1:0];
end

always @(*) begin
  if((LEGACY_BIN==LEGACY_DSP48) || (DSP_MODE_BIN == DSP_MODE_CINT18))
   b_mult = {{6{b_mult_in[17]}},b_mult_in[17:0]} ; // extend MSB for legacy mode
 else
   b_mult = b_mult_in;
end 

  assign AMULTMSB = a_mult[26];
  assign BMULTMSB = (LEGACY_BIN==LEGACY_DSP48)? b_mult[17] : b_mult[B_WIDTH-1] ^ NEGATE_DATA[0];
  

// U[50],V[50]  11 when mult[50]=0,  10 when mult[50]=1

  assign U = (LEGACY_BIN==LEGACY_DSP48)? {{6{1'b0}},1'b1, mult[43:0]        & ps_u_mask[43:0]} :
                                         {1'b1,           mult[M_WIDTH-2:0] & ps_u_mask      };
                                         
  assign V = (LEGACY_BIN==LEGACY_DSP48)? {{6{1'b0}},~mult[44], mult[43:0]        & ps_v_mask[43:0]} :
                                         {~mult[M_WIDTH-1],    mult[M_WIDTH-2:0] & ps_v_mask      };

  assign U0U2_INT8 = (DSP_MODE_BIN == DSP_MODE_INT8) ? {1'b1, mult802} : 19'b0;
  assign U1_INT8   = (DSP_MODE_BIN == DSP_MODE_INT8) ? {1'b1, mult81[15:0]}  : 17'b0;
  assign V0V2_INT8[18] = (DSP_MODE_BIN == DSP_MODE_INT8) ? ~mult802[17] : 1'b0;
  assign V0V2_INT8[17:0] = 18'b0;
  assign V1_INT8[16] = (DSP_MODE_BIN == DSP_MODE_INT8) ? ~mult81[16] : 1'b0;
  assign V1_INT8[15:0] = 16'b0;

  assign multn = {{M_WIDTH-1{NEGATE_DATA[0]}},1'b1};

always @(*) begin
  if (USE_MULT_BIN == USE_MULT_NONE) begin
     mult = {M_WIDTH{1'b0}};
  end else if (DSP_MODE_BIN == DSP_MODE_INT24) begin
     mult32 = {{24{a_mult[26]}},a_mult} * {{27{b_mult[23]}},b_mult};
     mult   = {{M_WIDTH-1{NEGATE_DATA[0]}},1'b1} * mult32;
  end else if (DSP_MODE_BIN == DSP_MODE_INT8) begin
     mult_0 = {{8{a_mult[ 8]}},a_mult[ 8: 0]} * {{9{b_mult[ 7]}},b_mult[ 7: 0]};
     mult_1 = {{8{a_mult[17]}},a_mult[17: 9]} * {{9{b_mult[15]}},b_mult[15: 8]};
     mult_2 = {{8{a_mult[26]}},a_mult[26:18]} * {{9{b_mult[23]}},b_mult[23:16]};
     mult802  = {{18{NEGATE_DATA[0]}},1'b1} * {{2{mult_0[16]}}, mult_0} +
                {{18{NEGATE_DATA[2]}},1'b1} * {{2{mult_2[16]}}, mult_2};
     mult81   = {{18{NEGATE_DATA[1]}},1'b1} * {{2{mult_1[16]}}, mult_1};
     mult8 = {mult802[17], mult802} + {mult81[17], mult81};
     mult   = {{32{mult8[18]}},mult8};
  end else if (DSP_MODE_BIN == DSP_MODE_CINT18) begin
     mult = {{32{a_mult[18]}},a_mult[18:0]} * {{33{b_mult[17]}},b_mult[17:0]};
     mult = multn * mult;
  end else if (DSP_MODE_BIN == DSP_MODE_FP32) begin
     mult = ({{24{a_mult[26]}},a_mult} * {{27{b_mult[23]}},b_mult});
  end
end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (A2A1 *> AMULTMSB) = (0:0:0, 0:0:0);
    (A2A1 *> U) = (0:0:0, 0:0:0);
    (A2A1 *> U0U2_INT8) = (0:0:0, 0:0:0);
    (A2A1 *> U1_INT8) = (0:0:0, 0:0:0);
    (A2A1 *> V) = (0:0:0, 0:0:0);
    (A2A1 *> V0V2_INT8) = (0:0:0, 0:0:0);
    (A2A1 *> V1_INT8) = (0:0:0, 0:0:0);
    (AD_DATA *> AMULTMSB) = (0:0:0, 0:0:0);
    (AD_DATA *> BMULTMSB) = (0:0:0, 0:0:0);
    (AD_DATA *> U) = (0:0:0, 0:0:0);
    (AD_DATA *> U0U2_INT8) = (0:0:0, 0:0:0);
    (AD_DATA *> U1_INT8) = (0:0:0, 0:0:0);
    (AD_DATA *> V) = (0:0:0, 0:0:0);
    (AD_DATA *> V0V2_INT8) = (0:0:0, 0:0:0);
    (AD_DATA *> V1_INT8) = (0:0:0, 0:0:0);
    (B2B1 *> BMULTMSB) = (0:0:0, 0:0:0);
    (B2B1 *> U) = (0:0:0, 0:0:0);
    (B2B1 *> U0U2_INT8) = (0:0:0, 0:0:0);
    (B2B1 *> U1_INT8) = (0:0:0, 0:0:0);
    (B2B1 *> V) = (0:0:0, 0:0:0);
    (B2B1 *> V0V2_INT8) = (0:0:0, 0:0:0);
    (B2B1 *> V1_INT8) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> BMULTMSB) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> U) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> U0U2_INT8) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> U1_INT8) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> V) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> V0V2_INT8) = (0:0:0, 0:0:0);
    (NEGATE_DATA *> V1_INT8) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
