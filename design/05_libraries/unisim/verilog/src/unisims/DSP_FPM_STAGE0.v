///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FPM_STAGE0
// /___/   /\      Filename    : DSP_FPM_STAGE0.v
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

module DSP_FPM_STAGE0 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter A_FPTYPE = "B32",
  parameter B_D_FPTYPE = "B32",
  parameter LEGACY = "DSP58",
  parameter USE_MULT = "MULTIPLY"
)(
  output [13:0] FPM_EXPINT,
  output [47:0] U,
  output [47:0] V,

  input [7:0] A_EXP_DATA,
  input [23:0] A_MAN_DATA,
  input A_SIGN_DATA,
  input [7:0] B_EXP_DATA,
  input [23:0] B_MAN_DATA,
  input B_SIGN_DATA
);
  
// define constants
  localparam MODULE_NAME = "DSP_FPM_STAGE0";

// Parameter encodings and registers
  localparam A_FPTYPE_B16 = 1;
  localparam A_FPTYPE_B32 = 0;
  localparam B_D_FPTYPE_B16 = 1;
  localparam B_D_FPTYPE_B32 = 0;
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FPM_STAGE0_dr.v"
`else
  reg [24:1] A_FPTYPE_REG = A_FPTYPE;
  reg [24:1] B_D_FPTYPE_REG = B_D_FPTYPE;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire A_FPTYPE_BIN;
  wire B_D_FPTYPE_BIN;
  wire LEGACY_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg A_FPTYPE_BIN;
  reg B_D_FPTYPE_BIN;
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
  assign A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  assign B_D_FPTYPE_BIN =
      (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
      (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
       B_D_FPTYPE_B32;

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
  A_FPTYPE_BIN =
    (A_FPTYPE_REG == "B32") ? A_FPTYPE_B32 :
    (A_FPTYPE_REG == "B16") ? A_FPTYPE_B16 :
    A_FPTYPE_B32;

  B_D_FPTYPE_BIN =
    (B_D_FPTYPE_REG == "B32") ? B_D_FPTYPE_B32 :
    (B_D_FPTYPE_REG == "B16") ? B_D_FPTYPE_B16 :
    B_D_FPTYPE_B32;

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
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((A_FPTYPE_REG != "B32") &&
       (A_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-101] A_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, A_FPTYPE_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((B_D_FPTYPE_REG != "B32") &&
       (B_D_FPTYPE_REG != "B16"))) begin
    $display("Error: [Unisim %s-102] B_D_FPTYPE attribute is set to %s.  Legal values for this attribute are B32 or B16. Instance: %m", MODULE_NAME, B_D_FPTYPE_REG);
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

  localparam M_WIDTH   = 48;
  reg [24:0] b_mult;
  reg [24:0] a_mult;
  wire a_inf, a_snan, a_qnan, a_zd;
  wire b_inf, b_snan, b_qnan, b_zd;
  reg [M_WIDTH-1:0] mult;
  reg [M_WIDTH-1:0] ps_u_mask;
  reg [M_WIDTH-1:0] ps_v_mask;
  reg [M_WIDTH-1:0] U_out;
  reg [M_WIDTH-1:0] V_out;
  reg [13:0] FPM_EXPINT_out;
  reg [9:0] FPM_EXPINT_sum;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  ps_u_mask = {M_WIDTH/2{2'b01}};
  ps_v_mask = {M_WIDTH/2{2'b10}};
  U_out = {1'b0, {M_WIDTH-1{1'b0}}};
  V_out = {1'b0, {M_WIDTH-1{1'b0}}};
  FPM_EXPINT_out = 14'b0;
  FPM_EXPINT_sum = 10'b0;
end
`endif

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
   assign FPM_EXPINT = FPM_EXPINT_out;

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

   assign U    = (USE_MULT_BIN == USE_MULT_NONE) ?  {M_WIDTH{1'b0}} :
                  {mult[M_WIDTH-1:0] & ps_u_mask[M_WIDTH-1:0]};

   assign V    = (USE_MULT_BIN == USE_MULT_NONE) ?  {M_WIDTH{1'b0}} :
                  {mult[M_WIDTH-1:0] & ps_v_mask[M_WIDTH-1:0]};

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (A_EXP_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    (A_MAN_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    (A_MAN_DATA *> U) = (0:0:0, 0:0:0);
    (A_MAN_DATA *> V) = (0:0:0, 0:0:0);
    (A_SIGN_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    (B_EXP_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    (B_MAN_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    (B_MAN_DATA *> U) = (0:0:0, 0:0:0);
    (B_MAN_DATA *> V) = (0:0:0, 0:0:0);
    (B_SIGN_DATA *> FPM_EXPINT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
