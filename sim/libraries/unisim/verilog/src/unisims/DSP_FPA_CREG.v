///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FPA_CREG
// /___/   /\      Filename    : DSP_FPA_CREG.v
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

module DSP_FPA_CREG #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer FPCREG = 3,
  parameter [0:0] IS_RSTC_INVERTED = 1'b0,
  parameter LEGACY = "DSP58",
  parameter RESET_MODE = "SYNC"
)(
  output [31:0] C3_FP_DATA,

  input ASYNC_RST,
  input [31:0] C,
  input CEC,
  input CLK,
  input RSTC
);
  
// define constants
  localparam MODULE_NAME = "DSP_FPA_CREG";

// Parameter encodings and registers
  localparam LEGACY_DSP48 = 1;
  localparam LEGACY_DSP58 = 0;
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FPA_CREG_dr.v"
`else
  reg [31:0] FPCREG_REG = FPCREG;
  reg [0:0] IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
  reg [40:1] LEGACY_REG = LEGACY;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
`endif

`ifdef XIL_XECLIB
  wire [1:0] FPCREG_BIN;
  wire LEGACY_BIN;
  wire RESET_MODE_BIN;
`else
  reg [1:0] FPCREG_BIN;
  reg LEGACY_BIN;
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
  wire [31:0] C_in;

`ifdef XIL_TIMING
  wire CEC_delay;
  wire CLK_delay;
  wire RSTC_delay;
  wire [31:0] C_delay;
`endif
  
`ifdef XIL_TIMING
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
  assign C_in[3] = (C[3] === 1'bz) || C_delay[3]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C_delay[4]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C_delay[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C_delay[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C_delay[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C_delay[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C_delay[9]; // rv 1
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC_delay ^ IS_RSTC_INVERTED_REG); // rv 0
`else
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
  assign C_in[3] = (C[3] === 1'bz) || C[3]; // rv 1
  assign C_in[4] = (C[4] === 1'bz) || C[4]; // rv 1
  assign C_in[5] = (C[5] === 1'bz) || C[5]; // rv 1
  assign C_in[6] = (C[6] === 1'bz) || C[6]; // rv 1
  assign C_in[7] = (C[7] === 1'bz) || C[7]; // rv 1
  assign C_in[8] = (C[8] === 1'bz) || C[8]; // rv 1
  assign C_in[9] = (C[9] === 1'bz) || C[9]; // rv 1
  assign RSTC_in = (RSTC !== 1'bz) && (RSTC ^ IS_RSTC_INVERTED_REG); // rv 0
`endif

  assign ASYNC_RST_in = ASYNC_RST;

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
  assign FPCREG_BIN = FPCREG_REG[1:0];
  
  assign LEGACY_BIN =
      (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
      (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
       LEGACY_DSP58;

  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

`else
always @(trig_attr) begin
#1;
  FPCREG_BIN = FPCREG_REG[1:0];
  
  LEGACY_BIN =
    (LEGACY_REG == "DSP58") ? LEGACY_DSP58 :
    (LEGACY_REG == "DSP48") ? LEGACY_DSP48 :
    LEGACY_DSP58;

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
      ((FPCREG_REG != 3) &&
       (FPCREG_REG != 0) &&
       (FPCREG_REG != 1) &&
       (FPCREG_REG != 2))) begin
    $display("Error: [Unisim %s-102] FPCREG attribute is set to %d.  Legal values for this attribute are 3, 0, 1 or 2. Instance: %m", MODULE_NAME, FPCREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((LEGACY_REG != "DSP58") &&
       (LEGACY_REG != "DSP48"))) begin
    $display("Error: [Unisim %s-104] LEGACY attribute is set to %s.  Legal values for this attribute are DSP58 or DSP48. Instance: %m", MODULE_NAME, LEGACY_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-105] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam C_WIDTH   = 32;
  wire [31:0] C_int;

  reg [C_WIDTH-1:0] C_reg;
  reg [C_WIDTH-1:0] C_reg1;
  reg [C_WIDTH-1:0] C_reg2;


  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  C_reg = {C_WIDTH{1'b0}};
  C_reg1 = {C_WIDTH{1'b0}};
  C_reg2 = {C_WIDTH{1'b0}};
end
`endif

  always @ (*) begin
    if (RESET_MODE_BIN == RESET_MODE_ASYNC) begin
      ASYNC_RST_async = ASYNC_RST_in;
    end else begin
      ASYNC_RST_async = 1'b0;
    end
  end

  assign C_int = C_in;
//  assign C_int = (A_FPTYPE_BIN == A_FPTYPE_B32) ? C_in : {C_in[31], 3'b111, C_in[27:23], C_in[22:13],13'b0};

//*********************************************************
//*** Input register C with 3 level deep of register
//*********************************************************

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN == 2'b00) || glblGSR) begin
         C_reg <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         if (FPCREG_BIN == 2'b01) begin
            C_reg <= C_int;
         end else begin
            C_reg <= C_reg2;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN[1] != 1'b1) || glblGSR) begin
         C_reg2 <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         if (FPCREG_BIN[0] == 1'b0) begin
            C_reg2 <= C_int;
         end else begin
            C_reg2 <= C_reg1;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTC_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPCREG_BIN != 2'b11) || glblGSR) begin
         C_reg1 <= {C_WIDTH{1'b0}};
      end else if (CEC_in) begin
         C_reg1 <= C_int;
      end
   end

   assign C3_FP_DATA = (FPCREG_BIN == 2'b00) ? C_int : C_reg;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (C *> C3_FP_DATA) = (0:0:0, 0:0:0);
    (CLK *> C3_FP_DATA) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge C, 0:0:0, 0:0:0, notifier, , , CLK_delay, C_delay);
    $setuphold (posedge CLK, negedge CEC, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEC_delay);
    $setuphold (posedge CLK, negedge RSTC, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTC_delay);
    $setuphold (posedge CLK, posedge C, 0:0:0, 0:0:0, notifier, , , CLK_delay, C_delay);
    $setuphold (posedge CLK, posedge CEC, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEC_delay);
    $setuphold (posedge CLK, posedge RSTC, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTC_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
