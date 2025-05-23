///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        58-bit Multi-Functional Arithmetic Block
// /___/   /\      Filename    : DSP_ALUMUX.v
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

module DSP_ALUMUX #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DSP_MODE = "INT24",
  parameter LEGACY = "DSP58",
  parameter [57:0] RND = 58'h000000000000000
)(
  output CIN,
  output [57:0] W,
  output [57:0] X,
  output [57:0] Y,
  output [57:0] Z,

  input [33:0] A_ALU,
  input [23:0] B_ALU,
  input CARRYCASCIN,
  input CARRYCASCOUT_FB,
  input [2:0] CARRYINSEL_DATA,
  input CARRYIN_DATA,
  input [57:0] C_DATA,
  input MULTCARRYIN_DATA,
  input MULTSIGNIN,
  input [8:0] OPMODE_DATA,
  input [57:0] PCIN,
  input [57:0] P_FDBK,
  input P_FDBK_MSB,
  input [50:0] U_DATA,
  input [50:0] V_DATA
);
  
// define constants
  localparam MODULE_NAME = "DSP_ALUMUX";

// Parameter encodings and registers
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_ALUMUX_dr.v"
`else
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [57:0] RND_REG = RND;
`endif

`ifdef XIL_XECLIB
  wire [1:0] DSP_MODE_BIN;
  wire LEGACY_BIN;
`else
  reg [1:0] DSP_MODE_BIN;
  reg LEGACY_BIN;
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

`else
always @(trig_attr) begin
	#1;

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
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-101] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-102] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  localparam P_WIDTH   = 58;
  reg cci_drc_msg;
  reg cis_drc_msg;

  reg CIN_out = 1'b0;
  reg  [57:0] W_out = {P_WIDTH{1'b0}};
  reg  [57:0] X_out = {P_WIDTH{1'b0}};
  reg  [57:0] Y_out = {P_WIDTH{1'b0}};
  reg  [57:0] Z_out = {P_WIDTH{1'b0}};
  wire [57:0] ab_concat;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  cci_drc_msg = 1'b0;
  cis_drc_msg = 1'b0;
  CIN_out = 1'b0;
  W_out = {P_WIDTH{1'b0}};
  X_out = {P_WIDTH{1'b0}};
  Y_out = {P_WIDTH{1'b0}};
  Z_out = {P_WIDTH{1'b0}};
end
`endif

  assign CIN = CIN_out;
  assign W = W_out;
  assign X = X_out;
  assign Y = Y_out;
  assign Z = Z_out;
  
  //for legacy support
  assign ab_concat[17:0 ] =  B_ALU[17:0];
  assign ab_concat[23:18] = (LEGACY_BIN == LEGACY_DSP48) ? A_ALU[5:0]  : B_ALU[23:18];
  assign ab_concat[47:24] = (LEGACY_BIN == LEGACY_DSP48) ? A_ALU[29:6] : A_ALU[23:0];
  assign ab_concat[57:48] =  A_ALU[33:24];
  

//*** W mux NB
  always @(OPMODE_DATA[8:7] or P_FDBK or RND_REG or C_DATA or LEGACY_BIN)
    case ({LEGACY_BIN,OPMODE_DATA[8:7]})
      3'b000  : W_out = {P_WIDTH{1'b0}};
      3'b100  : W_out = {P_WIDTH{1'b0}};
      3'b001  : W_out = P_FDBK;
      3'b101  : W_out = {{10{1'b0}}, P_FDBK[47:0]};
      3'b010  : W_out = RND_REG;
      3'b110  : W_out = {{10{1'b0}}, RND_REG[47:0]};
      3'b011  : W_out = C_DATA;
      3'b111  : W_out = {{10{1'b0}}, C_DATA[47:0]};
      default : W_out = {P_WIDTH{1'bx}};
    endcase

// To support MAC-cascade add multsignin to bit 1 of X
  wire [P_WIDTH-1:0] x_mac_cascd;
  assign x_mac_cascd = (OPMODE_DATA[6:4] == 3'b100) ? {{P_WIDTH-2{1'b0}},MULTSIGNIN,1'b0} : {P_WIDTH{1'b0}};

//*** X mux NB
  always @(U_DATA or P_FDBK or A_ALU or B_ALU or OPMODE_DATA[1:0] or x_mac_cascd or LEGACY_BIN)
	case ({LEGACY_BIN,OPMODE_DATA[1:0]})
      3'b000  : X_out = x_mac_cascd;
      3'b100  : X_out = x_mac_cascd;
      3'b001  : X_out = {{7{U_DATA[50]}}, U_DATA};
      3'b101  : X_out = {{10{1'b0}},{3{U_DATA[44]}}, U_DATA[44:0]};
      3'b010  : X_out = P_FDBK;
      3'b110  : X_out = {{10{1'b0}}, P_FDBK[47:0]};
      3'b011  : X_out = ab_concat;
      3'b111  : X_out = {{10{1'b0}}, ab_concat[47:0]};
      default : X_out = {P_WIDTH{1'bx}};
	endcase

//*** Y mux NB
  always @(OPMODE_DATA[3:2] or V_DATA or C_DATA or LEGACY_BIN)
	case ({LEGACY_BIN,OPMODE_DATA[3:2]})
      3'b000  : Y_out = {P_WIDTH{1'b0}};
      3'b100  : Y_out = {P_WIDTH{1'b0}};
      3'b001  : Y_out = {{7{1'b0}}, V_DATA};
      3'b101  : Y_out = {{13{1'b0}}, V_DATA[44:0]};
      3'b010  : Y_out = {P_WIDTH{1'b1}};
      3'b110  : Y_out = {{10{1'b0}},{(P_WIDTH-10){1'b1}}};
      3'b011  : Y_out = C_DATA;
      3'b111  : Y_out = {{10{1'b0}},C_DATA[47:0]}; 
      default : Y_out = {P_WIDTH{1'bx}};
    endcase

//*** Z mux NB
  always @(OPMODE_DATA[6:4] or PCIN or P_FDBK or C_DATA or P_FDBK_MSB or LEGACY_BIN)
	  casex ({LEGACY_BIN,OPMODE_DATA[6:4]})
         4'b0000 : Z_out = {P_WIDTH{1'b0}};
         4'b1000 : Z_out = {P_WIDTH{1'b0}};
         4'b0001 : Z_out = PCIN;
         4'b1001 : Z_out = {{10{1'b0}}, PCIN[47:0]};
         4'b0010 : Z_out = P_FDBK;
         4'b1010 : Z_out = {{10{1'b0}}, P_FDBK[47:0]};
         4'b0011 : Z_out = C_DATA;
         4'b1011 : Z_out = {{10{1'b0}},C_DATA[47:0]};
         4'b0100 : Z_out = P_FDBK;
         4'b1100 : Z_out = {{10{1'b0}}, P_FDBK[47:0]};
         4'b0101 : Z_out = {{23{PCIN[57]}}, PCIN[57:23]};
         4'b1101 : Z_out = {{10{1'b0}},{17{PCIN[47]}}, PCIN[47:17]};
         4'b011x : Z_out = {{23{P_FDBK_MSB}}, P_FDBK[57:23]};
         4'b111x : Z_out = {{10{1'b0}},{9{P_FDBK_MSB}},{8{P_FDBK[47]}},P_FDBK[47:17]};
        default : Z_out = {P_WIDTH{1'bx}};
     endcase

    always @(CARRYINSEL_DATA or CARRYCASCIN or MULTSIGNIN or OPMODE_DATA) begin
      if(CARRYINSEL_DATA == 3'b010) begin 
        if(!((MULTSIGNIN === 1'bx) || (cci_drc_msg == 1'b1) ||
             ((OPMODE_DATA == 9'b001001000) && !(MULTSIGNIN === 1'bx)) ||
             ((MULTSIGNIN == 1'b0) && (CARRYCASCIN == 1'b0)))) begin
	       $display("DRC warning : [Unisim %s-7] CARRYCASCIN can only be used in the current %s if the previous %s is performing a two input ADD or SUBRTACT operation or the current %s is configured in the MAC extend opmode 7'b1001000 at %.3f ns. Instance %m\n", MODULE_NAME, MODULE_NAME, MODULE_NAME, MODULE_NAME, $time/1000.0);
// CR 619940 -- Enhanced DRC warning
          $display("The simulation model does not know the placement of the %s slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the %s slices and ensure that these warnings are not being breached\n", MODULE_NAME, MODULE_NAME);
          cci_drc_msg = 1'b1;
        end  
        if(!((MULTSIGNIN === 1'bx) || (OPMODE_DATA[3:0] != 4'b0101))) begin
          $display("DRC warning : [Unisim %s-10] CARRYINSEL is set to 010 with OPMODE set to multiplication (xxx0101). This is an illegal mode and may show deviation between simulation results and hardware behavior. %s instance %m at %.3f ns.", MODULE_NAME, MODULE_NAME, $time/1000.0);
        end
      end  
    end 

//NB
  always @(*) begin
	case (CARRYINSEL_DATA)
     3'b000  : CIN_out = CARRYIN_DATA;
     3'b001  : CIN_out = (LEGACY_BIN==LEGACY_DSP48)? ~PCIN[47]:~PCIN[57];
     3'b010  : CIN_out = CARRYCASCIN;
     3'b011  : CIN_out = (LEGACY_BIN==LEGACY_DSP48)? PCIN[47]:PCIN[57];
     3'b100  : CIN_out = CARRYCASCOUT_FB;
     3'b101  : CIN_out = (LEGACY_BIN==LEGACY_DSP48)? ~P_FDBK[47]: ~P_FDBK[57];
     3'b110  : CIN_out = MULTCARRYIN_DATA;
     3'b111  : CIN_out = (LEGACY_BIN==LEGACY_DSP48)? P_FDBK[47] : P_FDBK[57];
     default : CIN_out = 1'bx;
	endcase
   end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (A_ALU *> X) = (0:0:0, 0:0:0);
    (B_ALU *> X) = (0:0:0, 0:0:0);
    (CARRYCASCIN => CIN) = (0:0:0, 0:0:0);
    (CARRYINSEL_DATA *> CIN) = (0:0:0, 0:0:0);
    (CARRYIN_DATA => CIN) = (0:0:0, 0:0:0);
    (C_DATA *> W) = (0:0:0, 0:0:0);
    (C_DATA *> Y) = (0:0:0, 0:0:0);
    (C_DATA *> Z) = (0:0:0, 0:0:0);
    (MULTCARRYIN_DATA => CIN) = (0:0:0, 0:0:0);
    (MULTSIGNIN *> X) = (0:0:0, 0:0:0);
    (OPMODE_DATA *> W) = (0:0:0, 0:0:0);
    (OPMODE_DATA *> X) = (0:0:0, 0:0:0);
    (OPMODE_DATA *> Y) = (0:0:0, 0:0:0);
    (OPMODE_DATA *> Z) = (0:0:0, 0:0:0);
    (P_FDBK *> W) = (0:0:0, 0:0:0);
    (P_FDBK *> X) = (0:0:0, 0:0:0);
    (P_FDBK *> Z) = (0:0:0, 0:0:0);
    (P_FDBK_MSB *> W) = (0:0:0, 0:0:0);
    (P_FDBK_MSB *> X) = (0:0:0, 0:0:0);
    (P_FDBK_MSB *> Z) = (0:0:0, 0:0:0);
    (U_DATA *> X) = (0:0:0, 0:0:0);
    (V_DATA *> Y) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
