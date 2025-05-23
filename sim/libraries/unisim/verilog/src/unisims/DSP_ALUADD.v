///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_ALUADD
// /___/   /\      Filename    : DSP_ALUADD.v
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

module DSP_ALUADD #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter LEGACY = "DSP58",
  parameter USE_SIMD = "ONE58",
  parameter USE_WIDEXOR = "FALSE",
  parameter XORSIMD = "XOR24_34_58_116"
)(
  output ALUMODE10,
  output [57:0] ALU_OUT,
  output [3:0] COUT,
  output MULTSIGN_ALU,
  output [7:0] XOR_MX,

  input [3:0] ALUMODE_DATA,
  input CIN,
  input [57:0] W,
  input [57:0] X,
  input [57:0] Y,
  input [57:0] Z
);
  
// define constants
  localparam MODULE_NAME = "DSP_ALUADD";

// Parameter encodings and registers
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;
  localparam USE_SIMD_FOUR12 = 1;
  localparam USE_SIMD_ONE48 = 2;
  localparam USE_SIMD_ONE58 = 0;
  localparam USE_SIMD_TWO24 = 3;
  localparam USE_WIDEXOR_FALSE = 0;
  localparam USE_WIDEXOR_TRUE = 1;
  localparam XORSIMD_XOR12 = 1;
  localparam XORSIMD_XOR12_22 = 2;
  localparam XORSIMD_XOR24_34_58_116 = 0;
  localparam XORSIMD_XOR24_48_96 = 3;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_ALUADD_dr.v"
`else
  reg [40:1] LEGACY_REG = LEGACY;
  reg [48:1] USE_SIMD_REG = USE_SIMD;
  reg [40:1] USE_WIDEXOR_REG = USE_WIDEXOR;
  reg [120:1] XORSIMD_REG = XORSIMD;
`endif

`ifdef XIL_XECLIB
  wire LEGACY_BIN;
  wire [1:0] USE_SIMD_BIN;
  wire USE_WIDEXOR_BIN;
  wire [1:0] XORSIMD_BIN;
`else
  reg LEGACY_BIN;
  reg [1:0] USE_SIMD_BIN;
  reg USE_WIDEXOR_BIN;
  reg [1:0] XORSIMD_BIN;
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
  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

  assign USE_SIMD_BIN =
    (USE_SIMD_REG == "ONE58") ? USE_SIMD_ONE58 :
    (USE_SIMD_REG == "FOUR12") ? USE_SIMD_FOUR12 :
    (USE_SIMD_REG == "ONE48") ? USE_SIMD_ONE48 :
    (USE_SIMD_REG == "TWO24") ? USE_SIMD_TWO24 :
     USE_SIMD_ONE58;

  assign USE_WIDEXOR_BIN =
    (USE_WIDEXOR_REG == "FALSE") ? USE_WIDEXOR_FALSE :
    (USE_WIDEXOR_REG == "TRUE") ? USE_WIDEXOR_TRUE :
     USE_WIDEXOR_FALSE;

  assign XORSIMD_BIN =
    (XORSIMD_REG == "XOR24_34_58_116") ? XORSIMD_XOR24_34_58_116 :
    (XORSIMD_REG == "XOR12") ? XORSIMD_XOR12 :
    (XORSIMD_REG == "XOR12_22") ? XORSIMD_XOR12_22 :
    (XORSIMD_REG == "XOR24_48_96") ? XORSIMD_XOR24_48_96 :
     XORSIMD_XOR24_34_58_116;

`else
always @(trig_attr) begin
  #1;

  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

  USE_SIMD_BIN =
    (USE_SIMD_REG == "ONE58") ? USE_SIMD_ONE58 :
    (USE_SIMD_REG == "FOUR12") ? USE_SIMD_FOUR12 :
    (USE_SIMD_REG == "ONE48") ? USE_SIMD_ONE48 :
    (USE_SIMD_REG == "TWO24") ? USE_SIMD_TWO24 :
     USE_SIMD_ONE58;

  USE_WIDEXOR_BIN =
    (USE_WIDEXOR_REG == "FALSE") ? USE_WIDEXOR_FALSE :
    (USE_WIDEXOR_REG == "TRUE") ? USE_WIDEXOR_TRUE :
     USE_WIDEXOR_FALSE;

  XORSIMD_BIN =
    (XORSIMD_REG == "XOR24_34_58_116") ? XORSIMD_XOR24_34_58_116 :
    (XORSIMD_REG == "XOR12") ? XORSIMD_XOR12 :
    (XORSIMD_REG == "XOR12_22") ? XORSIMD_XOR12_22 :
    (XORSIMD_REG == "XOR24_48_96") ? XORSIMD_XOR24_48_96 :
     XORSIMD_XOR24_34_58_116;

end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-101] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_SIMD_REG != "ONE58") &&
         (USE_SIMD_REG != "FOUR12") &&
         (USE_SIMD_REG != "ONE48") &&
         (USE_SIMD_REG != "TWO24"))) begin
      $display("Error: [Unisim %s-102] USE_SIMD attribute is set to %s.  Legal values for this attribute are ONE58, FOUR12, ONE48 or TWO24. Instance: %m", MODULE_NAME, USE_SIMD_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((USE_WIDEXOR_REG != "FALSE") &&
         (USE_WIDEXOR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] USE_WIDEXOR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_WIDEXOR_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((XORSIMD_REG != "XOR24_34_58_116") &&
         (XORSIMD_REG != "XOR12") &&
         (XORSIMD_REG != "XOR12_22") &&
         (XORSIMD_REG != "XOR24_48_96"))) begin
      $display("Error: [Unisim %s-104] XORSIMD attribute is set to %s.  Legal values for this attribute are XOR24_34_58_116, XOR12, XOR12_22 or XOR24_48_96. Instance: %m", MODULE_NAME, XORSIMD_REG);
	 attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  localparam MAX_ALU_FULL   = 58;
  localparam MAX_CARRYOUT   = 4;
  wire [MAX_ALU_FULL-1:0] co;
  wire [MAX_ALU_FULL-1:0] s;
  wire [MAX_ALU_FULL-1:0] comux;
  wire [MAX_ALU_FULL-1:0] comux_w;
  wire [MAX_ALU_FULL-1:0] comux4simd;
  wire [MAX_ALU_FULL-1:0] smux;
  wire [MAX_ALU_FULL-1:0] smux_w;
  wire [MAX_ALU_FULL:0] a_int;
  wire [12:0] s0;
  wire cout0;
  wire intc1;
  wire co12_lsb;
  wire [12:0] s1;
  wire cout1;
  wire intc2;
  wire co24_lsb;
  wire [12:0] s2;
  wire cout2;
  wire intc3;
  wire co36_lsb;
  wire [12:0] s3;
  wire cout3_48;
  wire intc4;
  wire co48_lsb;
  wire [11:0] s4;
  wire cout3_58;
  wire cout4;
  wire cout4_48;
  wire cout4_58;
  wire xor_12a;
  wire xor_12b;
  wire xor_12c;
  wire xor_12d;
  wire xor_22d;
  wire xor_12e;
  wire xor_12f;
  wire xor_12g;
  wire xor_12h;
  wire xor_22h;
  wire xor_12_22d;
  wire xor_12_22h;
  wire xor_24a;
  wire xor_24_34b;
  wire xor_24c;
  wire xor_24_34d;
  wire xor_48_58a;
  wire xor_48_58b;
  wire xor_96_116;
  wire CIN_int;
  wire cout_0;
  wire cout_1;
  wire cout_2;
  wire cout3;
  wire mult_or_logic;
  wire [1:0] s3_sign;


  wire [57:0] z_optinv;

//--####################################################################
//--#####                         ALU                              #####
//--####################################################################

// ADDSUB block - first stage of ALU develops sums and carries for Final Adder
// Invert Z for subtract operation using alumode<0>
  assign z_optinv = {58{ALUMODE_DATA[0]}} ^ Z;

// Add W, X, Y, Z carry-save style; basically full adder logic below
  assign co = ((X & Y)|(z_optinv & Y)|(X & z_optinv));
// s has a fan-out of 2 (1) FA with W (2) second leg of XOR tree
  assign s  = (z_optinv^X^Y);

// Mux S and CO to do 2 operands logic operations
// S = produce XOR/XNOR, NOT functions
// CO = produce AND/NAND, OR/NOR functions
  assign comux = ALUMODE_DATA[2] ? 0  : co;
  assign smux =  ALUMODE_DATA[3] ? co : s;

// Carry mux to handle SIMD mode 
// SIMD must be used here since addition of W requires carry propogation
  assign comux4simd = {
              comux[57:48],
              comux[47]&&(USE_SIMD_BIN == USE_SIMD_ONE58 || USE_SIMD_BIN == USE_SIMD_ONE48),
              comux[46:36],
              comux[35]&&(USE_SIMD_BIN != USE_SIMD_FOUR12),
              comux[34:24],
              comux[23]&&(USE_SIMD_BIN == USE_SIMD_ONE58||USE_SIMD_BIN == USE_SIMD_ONE48),
              comux[22:12],
              comux[11]&&(USE_SIMD_BIN != USE_SIMD_FOUR12),
              comux[10:0]
            };

// FA to combine W-mux with s and co
// comux must be shifted to properly reflect carry operation
  assign smux_w  =   smux ^ {comux4simd[56:0],1'b0} ^ W;
  assign comux_w = ((smux & {comux4simd[56:0],1'b0}) |
                    (W    & {comux4simd[56:0],1'b0}) |
                    (smux & W));

// alumode10 indicates a subtraction, used to correct carryout polarity
  assign ALUMODE10 = (ALUMODE_DATA[0] & ALUMODE_DATA[1]);

// prepare data for Final Adder
// a[0] is in fact the cin bit, adder inputs: a[48:1], b[47:0], cin= a[0]
  assign CIN_int = ~(ALUMODE_DATA[3] | ALUMODE_DATA[2]) && CIN;
  assign a_int = {comux_w, CIN_int};
//  assign b_int = smux_w;

// FINAL ADDER - second stage develops final sums and carries 
  assign s0        = a_int[11:0] + smux_w[11:0];
  // invert if alumode10
  assign cout0     = ALUMODE10     ^ (a_int[12] ^ s0[12] ^ comux[11]);
  // internal carry is zero'd out on mc_simd == 1
  assign intc1     = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s0[12];
  // next lsb is zero'd out on mc_simd == 1
  assign co12_lsb  = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[12];
  //
  assign s1        = {a_int[23:13],co12_lsb} + smux_w[23:12] + intc1;
  assign cout1     = ALUMODE10     ^ (a_int[24] ^ s1[12] ^ comux[23]);
  assign intc2     = (USE_SIMD_BIN == USE_SIMD_ONE58 || USE_SIMD_BIN==USE_SIMD_ONE48) && s1[12];
  assign co24_lsb  = (USE_SIMD_BIN == USE_SIMD_ONE58 || USE_SIMD_BIN==USE_SIMD_ONE48) && a_int[24];
  //
  assign s2        = {a_int[35:25],co24_lsb} + smux_w[35:24] + intc2;
  assign cout2     = ALUMODE10     ^ (a_int[36] ^ s2[12] ^ comux[35]);
  assign intc3     = (USE_SIMD_BIN != USE_SIMD_FOUR12) && s2[12];
  assign co36_lsb  = (USE_SIMD_BIN != USE_SIMD_FOUR12) && a_int[36];
  //
  assign s3        = {a_int[47:37],co36_lsb} + smux_w[47:36]  + intc3;
  assign cout3_48  = ALUMODE10     ^ (a_int[48] ^ s3[12] ^ comux[47]);
  assign intc4     = (USE_SIMD_BIN == USE_SIMD_ONE58) && s3[12];
  assign co48_lsb  = (USE_SIMD_BIN == USE_SIMD_ONE58) && a_int[48];

  assign s4        = {a_int[58:49],co48_lsb} + {comux4simd[57],smux_w[57:48]} + intc4;
  assign cout3_58  = ALUMODE10     ^ s4[10]; 

// Not gated with alumode10 since used to propogate carry in wide multiply
  assign cout4_58    = s4[11];
    
  //multsign_alu for legacy computation
  assign s3_sign   = a_int[48] + s3[12] + comux[47];
  assign cout4_48  = s3_sign[1];
  
// Wide XOR
  assign xor_12a = USE_WIDEXOR_BIN & ^s[5:0];
  assign xor_12b = USE_WIDEXOR_BIN & ^s[11:6];
  assign xor_12c = USE_WIDEXOR_BIN & ^s[17:12];
  assign xor_12d = USE_WIDEXOR_BIN & ^s[23:18];
  assign xor_22d = USE_WIDEXOR_BIN & (^{s[52:48],s[23:18]}^ALUMODE_DATA[0]); // odd # bits, z inverted
  assign xor_12e = USE_WIDEXOR_BIN & ^s[29:24];
  assign xor_12f = USE_WIDEXOR_BIN & ^s[35:30];
  assign xor_12g = USE_WIDEXOR_BIN & ^s[41:36];
  assign xor_12h = USE_WIDEXOR_BIN & ^s[47:42];
  assign xor_22h = USE_WIDEXOR_BIN & (^{s[57:53],s[47:42]}^ALUMODE_DATA[0]); // odd # bits, z inverted
  
  //muxes to maintain legacy support for widexor
  assign xor_12_22d = (LEGACY_BIN == LEGACY_DSP48) ? xor_12d : xor_22d;
  assign xor_12_22h = (LEGACY_BIN == LEGACY_DSP48) ? xor_12h : xor_22h;


  assign xor_24a = xor_12a ^ xor_12b;
  assign xor_24_34b = xor_12c ^ xor_12_22d;
  assign xor_24c = xor_12e ^ xor_12f;
  assign xor_24_34d = xor_12g ^ xor_12_22h;

  assign xor_48_58a = xor_24a ^ xor_24_34b;
  assign xor_48_58b = xor_24c ^ xor_24_34d;

  assign xor_96_116 = xor_48_58a ^ xor_48_58b;

//  "X" carryout for multiply and logic operations
//  No DSP58 atom has OPMODE ALUMODE and CARRYOUT to force the X
  assign mult_or_logic = 1'b0;
// allow carrycascout to not X in output atom
  assign cout3 = ((USE_SIMD_BIN != USE_SIMD_ONE58)||(LEGACY_BIN==LEGACY_DSP48)) ? cout3_48 : cout3_58;
  assign cout4 = (LEGACY_BIN==LEGACY_DSP48) ? cout4_48 : cout4_58;
                
  assign cout_2 = mult_or_logic ? 1'bx : cout2;
  assign cout_1 = mult_or_logic ? 1'bx : cout1;
  assign cout_0 = mult_or_logic ? 1'bx : cout0;
// drive signals to Output Atom
  assign COUT[3] =                                     cout3;
  assign COUT[2] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_2 : 1'bx;
  assign COUT[1] = (USE_SIMD_BIN != USE_SIMD_ONE58 ) ? cout_1 : 1'bx;
  assign COUT[0] = (USE_SIMD_BIN == USE_SIMD_FOUR12) ? cout_0 : 1'bx;
  assign MULTSIGN_ALU     = cout4;
  wire [9:0] s4_masked;
  assign s4_masked = (USE_SIMD_BIN != USE_SIMD_ONE58 || LEGACY_BIN==LEGACY_DSP48) ? {10{ALUMODE_DATA[1]}} : s4[9:0];
  assign #1 ALU_OUT = {58{ALUMODE_DATA[1]}} ^ {s4_masked,s3[11:0],s2[11:0],s1[11:0],s0[11:0]}; // break 0 delay feedback
  assign XOR_MX =  (XORSIMD_BIN == XORSIMD_XOR12_22 || XORSIMD_BIN == XORSIMD_XOR12) ?
         {xor_22h, xor_12g,    xor_12f,    xor_12e, xor_12_22d, xor_12c,    xor_12b,    xor_12a} :
         {xor_22h, xor_24_34d, xor_48_58b, xor_24c, xor_96_116, xor_24_34b, xor_48_58a, xor_24a};


//--########################### END ALU ################################
// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (ALUMODE_DATA *> ALUMODE10) = (0:0:0, 0:0:0);
    (ALUMODE_DATA *> ALU_OUT) = (0:0:0, 0:0:0);
    (ALUMODE_DATA *> COUT) = (0:0:0, 0:0:0);
    (ALUMODE_DATA *> MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (ALUMODE_DATA *> XOR_MX) = (0:0:0, 0:0:0);
    (CIN *> ALU_OUT) = (0:0:0, 0:0:0);
    (CIN *> COUT) = (0:0:0, 0:0:0);
    (CIN => MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (W *> ALU_OUT) = (0:0:0, 0:0:0);
    (W *> COUT) = (0:0:0, 0:0:0);
    (W *> MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (X *> ALU_OUT) = (0:0:0, 0:0:0);
    (X *> COUT) = (0:0:0, 0:0:0);
    (X *> MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (X *> XOR_MX) = (0:0:0, 0:0:0);
    (Y *> ALU_OUT) = (0:0:0, 0:0:0);
    (Y *> COUT) = (0:0:0, 0:0:0);
    (Y *> MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (Y *> XOR_MX) = (0:0:0, 0:0:0);
    (Z *> ALU_OUT) = (0:0:0, 0:0:0);
    (Z *> COUT) = (0:0:0, 0:0:0);
    (Z *> MULTSIGN_ALU) = (0:0:0, 0:0:0);
    (Z *> XOR_MX) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
