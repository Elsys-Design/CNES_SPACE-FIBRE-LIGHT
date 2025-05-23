///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_C_DATA58
// /___/   /\      Filename    : DSP_C_DATA58.v
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

module DSP_C_DATA58 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer CREG = 1,
  parameter DSP_MODE = "INT24",
  parameter [0:0] IS_RSTC_INVERTED = 1'b0,
  parameter RESET_MODE = "SYNC"
)(
  output [57:0] C_DATA,

  input ASYNC_RST,
  input [57:0] C,
  input CEC,
  input CLK,
  input RSTC
);
  
// define constants
  localparam MODULE_NAME = "DSP_C_DATA58";

// Parameter encodings and registers
  localparam DSP_MODE_CINT18 = 1;
  localparam DSP_MODE_FP32 = 2;
  localparam DSP_MODE_INT24 = 0;
  localparam DSP_MODE_INT8 = 3;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_C_DATA58_dr.v"
`else
  reg [31:0] CREG_REG = CREG;
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [0:0] IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
`endif

`ifdef XIL_XECLIB
  wire CREG_BIN;
  wire [1:0] DSP_MODE_BIN;
  wire RESET_MODE_BIN;
`else
  reg CREG_BIN;
  reg [1:0] DSP_MODE_BIN;
  reg RESET_MODE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEC_in;
  wire CLK_in;
  wire RSTC_in;
  wire [57:0] C_in;

`ifdef XIL_TIMING
  wire ASYNC_RST_delay;
  wire CEC_delay;
  wire CLK_delay;
  wire RSTC_delay;
  wire [57:0] C_delay;
`endif

`ifdef XIL_TIMING
  assign ASYNC_RST_in = ASYNC_RST_delay;
  assign CEC_in = (CEC !== 1'bz) && CEC_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign C_in[0] = (C[0] === 1'bz) || C_delay[0]; // rv 1
  assign C_in[10] = (C[10] === 1'bz) || C_delay[10]; // rv 1
  assign C_in[11] = (C[11] === 1'bz) || C_delay[11]; // rv 1
  assign C_in[12] = (C[12] === 1'bz) || C_delay[12]; // rv 1
  assign C_in[13] = (C[13] === 1'bz) || C_delay[13]; // rv 1
  assign C_in[14] = (C[14] === 1'bz) || C_delay[14]; // rv 1
  assign C_in[15] = (C[15] === 1'bz) || C_delay[15]; // rv 1
  assign C_in[16] = (C[16] === 1'bz) || C_delay[16]; // rv 1
  assign C_in[17] = (C[17] === 1'bz) || C_delay[17]; // rv 1
  assign C_in[18] = (C[18] === 1'bz) || C_delay[18]; // rv 1
  assign C_in[19] = (C[19] === 1'bz) || C_delay[19]; // rv 1
  assign C_in[1] = (C[1] === 1'bz) || C_delay[1]; // rv 1
  assign C_in[20] = (C[20] === 1'bz) || C_delay[20]; // rv 1
  assign C_in[21] = (C[21] === 1'bz) || C_delay[21]; // rv 1
  assign C_in[22] = (C[22] === 1'bz) || C_delay[22]; // rv 1
  assign C_in[23] = (C[23] === 1'bz) || C_delay[23]; // rv 1
  assign C_in[24] = (C[24] === 1'bz) || C_delay[24]; // rv 1
  assign C_in[25] = (C[25] === 1'bz) || C_delay[25]; // rv 1
  assign C_in[26] = (C[26] === 1'bz) || C_delay[26]; // rv 1
  assign C_in[27] = (C[27] === 1'bz) || C_delay[27]; // rv 1
  assign C_in[28] = (C[28] === 1'bz) || C_delay[28]; // rv 1
  assign C_in[29] = (C[29] === 1'bz) || C_delay[29]; // rv 1
  assign C_in[2] = (C[2] === 1'bz) || C_delay[2]; // rv 1
  assign C_in[30] = (C[30] === 1'bz) || C_delay[30]; // rv 1
  assign C_in[31] = (C[31] === 1'bz) || C_delay[31]; // rv 1
  assign C_in[32] = (C[32] === 1'bz) || C_delay[32]; // rv 1
  assign C_in[33] = (C[33] === 1'bz) || C_delay[33]; // rv 1
  assign C_in[34] = (C[34] === 1'bz) || C_delay[34]; // rv 1
  assign C_in[35] = (C[35] === 1'bz) || C_delay[35]; // rv 1
  assign C_in[36] = (C[36] === 1'bz) || C_delay[36]; // rv 1
  assign C_in[37] = (C[37] === 1'bz) || C_delay[37]; // rv 1
  assign C_in[38] = (C[38] === 1'bz) || C_delay[38]; // rv 1
  assign C_in[39] = (C[39] === 1'bz) || C_delay[39]; // rv 1
  assign C_in[3] = (C[3] === 1'bz) || C_delay[3]; // rv 1
  assign C_in[40] = (C[40] === 1'bz) || C_delay[40]; // rv 1
  assign C_in[41] = (C[41] === 1'bz) || C_delay[41]; // rv 1
  assign C_in[42] = (C[42] === 1'bz) || C_delay[42]; // rv 1
  assign C_in[43] = (C[43] === 1'bz) || C_delay[43]; // rv 1
  assign C_in[44] = (C[44] === 1'bz) || C_delay[44]; // rv 1
  assign C_in[45] = (C[45] === 1'bz) || C_delay[45]; // rv 1
  assign C_in[46] = (C[46] === 1'bz) || C_delay[46]; // rv 1
  assign C_in[47] = (C[47] === 1'bz) || C_delay[47]; // rv 1
  assign C_in[48] = (C[48] === 1'bz) || C_delay[48]; // rv 1
  assign C_in[49] = (C[49] === 1'bz) || C_delay[49]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C_delay[4]; // rv 1
  assign C_in[50] = (C[50] === 1'bz) || C_delay[50]; // rv 1
  assign C_in[51] = (C[51] === 1'bz) || C_delay[51]; // rv 1
  assign C_in[52] = (C[52] === 1'bz) || C_delay[52]; // rv 1
  assign C_in[53] = (C[53] === 1'bz) || C_delay[53]; // rv 1
  assign C_in[54] = (C[54] === 1'bz) || C_delay[54]; // rv 1
  assign C_in[55] = (C[55] === 1'bz) || C_delay[55]; // rv 1
  assign C_in[56] = (C[56] === 1'bz) || C_delay[56]; // rv 1
  assign C_in[57] = (C[57] === 1'bz) || C_delay[57]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C_delay[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C_delay[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C_delay[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C_delay[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C_delay[9]; // rv 1
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC_delay ^ IS_RSTC_INVERTED_REG); // rv 0
`else
  assign ASYNC_RST_in = ASYNC_RST;
  assign CEC_in = (CEC !== 1'bz) && CEC; // rv 0
  assign CLK_in = CLK;
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
  assign C_in[32] = (C[32] === 1'bz) || C[32]; // rv 1
  assign C_in[33] = (C[33] === 1'bz) || C[33]; // rv 1
  assign C_in[34] = (C[34] === 1'bz) || C[34]; // rv 1
  assign C_in[35] = (C[35] === 1'bz) || C[35]; // rv 1
  assign C_in[36] = (C[36] === 1'bz) || C[36]; // rv 1
  assign C_in[37] = (C[37] === 1'bz) || C[37]; // rv 1
  assign C_in[38] = (C[38] === 1'bz) || C[38]; // rv 1
  assign C_in[39] = (C[39] === 1'bz) || C[39]; // rv 1
  assign C_in[3] = (C[3] === 1'bz) || C[3]; // rv 1
  assign C_in[40] = (C[40] === 1'bz) || C[40]; // rv 1
  assign C_in[41] = (C[41] === 1'bz) || C[41]; // rv 1
  assign C_in[42] = (C[42] === 1'bz) || C[42]; // rv 1
  assign C_in[43] = (C[43] === 1'bz) || C[43]; // rv 1
  assign C_in[44] = (C[44] === 1'bz) || C[44]; // rv 1
  assign C_in[45] = (C[45] === 1'bz) || C[45]; // rv 1
  assign C_in[46] = (C[46] === 1'bz) || C[46]; // rv 1
  assign C_in[47] = (C[47] === 1'bz) || C[47]; // rv 1
  assign C_in[48] = (C[48] === 1'bz) || C[48]; // rv 1
  assign C_in[49] = (C[49] === 1'bz) || C[49]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C[4]; // rv 1
  assign C_in[50] = (C[50] === 1'bz) || C[50]; // rv 1
  assign C_in[51] = (C[51] === 1'bz) || C[51]; // rv 1
  assign C_in[52] = (C[52] === 1'bz) || C[52]; // rv 1
  assign C_in[53] = (C[53] === 1'bz) || C[53]; // rv 1
  assign C_in[54] = (C[54] === 1'bz) || C[54]; // rv 1
  assign C_in[55] = (C[55] === 1'bz) || C[55]; // rv 1
  assign C_in[56] = (C[56] === 1'bz) || C[56]; // rv 1
  assign C_in[57] = (C[57] === 1'bz) || C[57]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C[9]; // rv 1
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC ^ IS_RSTC_INVERTED_REG); // rv 0
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
  assign CREG_BIN = CREG_REG[0];

  assign DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

`else
always @(trig_attr) begin
  #1;

  CREG_BIN = CREG_REG[0];

  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  RESET_MODE_BIN =
    (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
    (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
    RESET_MODE_SYNC;

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
        ((CREG_REG != 1) &&
         (CREG_REG != 0))) begin
      $display("Error: [Unisim %s-101] CREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-102] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-104] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam C_WIDTH   = 58;
  reg [C_WIDTH-1:0] C_reg = {C_WIDTH{1'b0}};

  reg ASYNC_RST_async = 1'b0;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  C_reg = {C_WIDTH{1'b0}};
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

//*********************************************************
//*** Input register C with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (CREG_BIN == 2'b00) || glblGSR) begin
         C_reg <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         C_reg <= C_in;
      end
   end

   assign C_DATA     = (CREG_BIN == 1'b1) ? C_reg : C_in;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (C *> C_DATA) = (0:0:0, 0:0:0);
    (CLK *> C_DATA) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $recrem (negedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $recrem (posedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $setuphold (posedge CLK, negedge C, 0:0:0, 0:0:0, notifier, , , CLK_delay, C_delay);
    $setuphold (posedge CLK, negedge CEC, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEC_delay);
    $setuphold (posedge CLK, negedge RSTC, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTC_delay);
    $setuphold (posedge CLK, posedge C, 0:0:0, 0:0:0, notifier, , , CLK_delay, C_delay);
    $setuphold (posedge CLK, posedge CEC, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEC_delay);
    $setuphold (posedge CLK, posedge RSTC, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTC_delay);
    $width (negedge ASYNC_RST, 0:0:0, 0, notifier);
    $width (posedge ASYNC_RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
