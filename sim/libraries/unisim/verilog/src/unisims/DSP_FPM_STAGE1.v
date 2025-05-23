///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FPM_STAGE1
// /___/   /\      Filename    : DSP_FPM_STAGE1.v
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

module DSP_FPM_STAGE1 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter LEGACY = "DSP58"
)(
  output [31:0] FPM_INT,
  output FPM_INVALID_INT,
  output FPM_OVERFLOW_INT,
  output FPM_UNDERFLOW_INT,

  input [13:0] FPM_EXPINT_DATA,
  input [47:0] U_DATA,
  input [47:0] V_DATA
);
  
// define constants
  localparam MODULE_NAME = "DSP_FPM_STAGE1";

// Parameter encodings and registers
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FPM_STAGE1_dr.v"
`else
  reg [40:1] LEGACY_REG = LEGACY;
`endif

`ifdef XIL_XECLIB
  wire LEGACY_BIN;
`else
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
  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

`else
always @(trig_attr) begin
#1;
  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

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
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-102] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  localparam MAX_ALU_FULL   = 48;
  wire [MAX_ALU_FULL-1:0] s1_mult;
  wire [MAX_ALU_FULL-1:0] s2_mult;
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

  assign FPM_INVALID_INT = (FPM_EXPINT_DATA[10] && FPM_EXPINT_DATA[8]) | (FPM_EXPINT_DATA[12] & FPM_EXPINT_DATA[11]);   // SNaN or (zero and inf)
  assign FPM_OVERFLOW_INT = (FPM_EXPINT_DATA[8] || adj_exp[8] || &adj_exp[7:0]) && ~FPM_EXPINT_DATA[9] && ~FPM_EXPINT_DATA[10] && ~FPM_EXPINT_DATA[11] && ~FPM_EXPINT_DATA[12];
  assign FPM_UNDERFLOW_INT = (FPM_EXPINT_DATA[9] && FPM_EXPINT_DATA[8]) || (FPM_EXPINT_DATA[9] && ~s2_mult[47] && ~s1_rnd[24]); // underflow

  assign FPM_INT = 
                   (FPM_INVALID_INT || FPM_EXPINT_DATA[10]) ? // invalid or Qnan
                       {FPM_EXPINT_DATA[13], 8'hff, 1'b1, 22'b0} :
                   FPM_UNDERFLOW_INT ? // underflow
                       {FPM_EXPINT_DATA[13], 31'b0} :
                   (FPM_OVERFLOW_INT || (FPM_EXPINT_DATA[11] && ~FPM_EXPINT_DATA[12])) ? // overflow or inf && not zero
                       {FPM_EXPINT_DATA[13], 8'hff, 1'b0, 22'b0} :
					    FPM_EXPINT_DATA[12] ? {FPM_EXPINT_DATA[13], 31'b0} :
                       {FPM_EXPINT_DATA[13], adj_exp[7:0], significant[22:0]}; // norm rnd


// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (FPM_EXPINT_DATA *> FPM_INT) = (0:0:0, 0:0:0);
    (FPM_EXPINT_DATA *> FPM_INVALID_INT) = (0:0:0, 0:0:0);
    (FPM_EXPINT_DATA *> FPM_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (FPM_EXPINT_DATA *> FPM_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (U_DATA *> FPM_INT) = (0:0:0, 0:0:0);
    (U_DATA *> FPM_INVALID_INT) = (0:0:0, 0:0:0);
    (U_DATA *> FPM_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (U_DATA *> FPM_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (V_DATA *> FPM_INT) = (0:0:0, 0:0:0);
    (V_DATA *> FPM_INVALID_INT) = (0:0:0, 0:0:0);
    (V_DATA *> FPM_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (V_DATA *> FPM_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
