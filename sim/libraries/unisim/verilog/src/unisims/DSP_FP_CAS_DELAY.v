///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_CAS_DELAY
// /___/   /\      Filename    : DSP_FP_CAS_DELAY.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_FP_CAS_DELAY #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DELAY = "TAP0"
)(
  output [7:0] ACOUT_DELAY_EXP,
  output [22:0] ACOUT_DELAY_MAN,
  output ACOUT_DELAY_SIGN,
  output [7:0] BCOUT_DELAY_EXP,
  output [22:0] BCOUT_DELAY_MAN,
  output BCOUT_DELAY_SIGN,
  output [31:0] PCOUT_DELAY,

  input [7:0] ACOUT_EXP,
  input [22:0] ACOUT_MAN,
  input ACOUT_SIGN,
  input [7:0] BCOUT_EXP,
  input [22:0] BCOUT_MAN,
  input BCOUT_SIGN,
  input [31:0] PCOUT
);

// define constants
  localparam MODULE_NAME = "DSP_FP_CAS_DELAY";
  
// Parameter encodings and registers
  localparam DELAY_TAP0 = 0;
  localparam DELAY_TAP1 = 1;
  localparam DELAY_TAP2 = 2;
  localparam DELAY_TAP3 = 3;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FP_CAS_DELAY_dr.v"
`else
  reg [32:1] DELAY_REG = DELAY;
`endif

`ifdef XIL_XECLIB
  wire [1:0] DELAY_BIN;
`else
  reg [1:0] DELAY_BIN;
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
  assign DELAY_BIN =
      (DELAY_REG == "TAP0") ? DELAY_TAP0 :
      (DELAY_REG == "TAP1") ? DELAY_TAP1 :
      (DELAY_REG == "TAP2") ? DELAY_TAP2 :
      (DELAY_REG == "TAP3") ? DELAY_TAP3 :
       DELAY_TAP0;
  
`else
  always @ (trig_attr) begin
  #1;
  DELAY_BIN =
      (DELAY_REG == "TAP0") ? DELAY_TAP0 :
      (DELAY_REG == "TAP1") ? DELAY_TAP1 :
      (DELAY_REG == "TAP2") ? DELAY_TAP2 :
      (DELAY_REG == "TAP3") ? DELAY_TAP3 :
       DELAY_TAP0;
  
  end
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
always @ (trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((DELAY_REG != "TAP0") &&
       (DELAY_REG != "TAP1") &&
       (DELAY_REG != "TAP2") &&
       (DELAY_REG != "TAP3"))) begin
    $display("Error: [Unisim %s-101] DELAY attribute is set to %s.  Legal values for this attribute are TAP0, TAP1, TAP2 or TAP3. Instance: %m", MODULE_NAME, DELAY_REG);
    attr_err = 1'b1;
  end
  
  if (attr_err == 1'b1) #1 $finish;
end
`endif

// begin behavioral model

  assign ACOUT_DELAY_EXP = ACOUT_EXP;
  assign ACOUT_DELAY_MAN = ACOUT_MAN;
  assign ACOUT_DELAY_SIGN = ACOUT_SIGN;
  assign BCOUT_DELAY_EXP = BCOUT_EXP;
  assign BCOUT_DELAY_MAN = BCOUT_MAN;
  assign BCOUT_DELAY_SIGN = BCOUT_SIGN;
  assign PCOUT_DELAY = PCOUT;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (ACOUT_EXP *> ACOUT_DELAY_EXP) = (0:0:0, 0:0:0);
    (ACOUT_MAN *> ACOUT_DELAY_MAN) = (0:0:0, 0:0:0);
    (ACOUT_SIGN => ACOUT_DELAY_SIGN) = (0:0:0, 0:0:0);
    (BCOUT_EXP *> BCOUT_DELAY_EXP) = (0:0:0, 0:0:0);
    (BCOUT_MAN *> BCOUT_DELAY_MAN) = (0:0:0, 0:0:0);
    (BCOUT_SIGN => BCOUT_DELAY_SIGN) = (0:0:0, 0:0:0);
    (PCOUT *> PCOUT_DELAY) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
