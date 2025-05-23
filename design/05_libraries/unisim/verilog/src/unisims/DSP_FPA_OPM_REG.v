///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FPA_OPM_REG
// /___/   /\      Filename    : DSP_FPA_OPM_REG.v
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

module DSP_FPA_OPM_REG #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer FPMPIPEREG = 1,
  parameter integer FPOPMREG = 3,
  parameter [6:0] IS_FPOPMODE_INVERTED = 7'b0000000,
  parameter [0:0] IS_RSTFPOPMODE_INVERTED = 1'b0,
  parameter RESET_MODE = "SYNC",
  parameter USE_MULT = "MULTIPLY"
)(
  output [6:0] FPOPMODE_DATA,

  input ASYNC_RST,
  input CEFPOPMODE,
  input CLK,
  input [6:0] FPOPMODE,
  input RSTFPOPMODE
);
  
// define constants
  localparam MODULE_NAME = "DSP_FPA_OPM_REG";

// Parameter encodings and registers
  localparam RESET_MODE_ASYNC = 1;
  localparam RESET_MODE_SYNC = 0;
  localparam USE_MULT_DYNAMIC = 1;
  localparam USE_MULT_MULTIPLY = 0;
  localparam USE_MULT_NONE = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_FPA_OPM_REG_dr.v"
`else
  reg [31:0] FPMPIPEREG_REG = FPMPIPEREG;
  reg [31:0] FPOPMREG_REG = FPOPMREG;
  reg [6:0] IS_FPOPMODE_INVERTED_REG = IS_FPOPMODE_INVERTED;
  reg [0:0] IS_RSTFPOPMODE_INVERTED_REG = IS_RSTFPOPMODE_INVERTED;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
  reg [64:1] USE_MULT_REG = USE_MULT;
`endif

`ifdef XIL_XECLIB
  wire FPMPIPEREG_BIN;
  wire [1:0] FPOPMREG_BIN;
  wire RESET_MODE_BIN;
  wire [1:0] USE_MULT_BIN;
`else
  reg FPMPIPEREG_BIN;
  reg [1:0] FPOPMREG_BIN;
  reg RESET_MODE_BIN;
  reg [1:0] USE_MULT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire ASYNC_RST_in;
  wire CEFPOPMODE_in;
  wire CLK_in;
  wire RSTFPOPMODE_in;
  wire [6:0] FPOPMODE_in;

`ifdef XIL_TIMING
  wire CEFPOPMODE_delay;
  wire CLK_delay;
  wire RSTFPOPMODE_delay;
  wire [6:0] FPOPMODE_delay;
`endif

`ifdef XIL_TIMING
  assign CEFPOPMODE_in = (CEFPOPMODE !== 1'bz) && CEFPOPMODE_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign FPOPMODE_in[0] = (FPOPMODE[0] !== 1'bz) && (FPOPMODE_delay[0] ^ IS_FPOPMODE_INVERTED_REG[0]); // rv 0
  assign FPOPMODE_in[1] = (FPOPMODE[1] !== 1'bz) && (FPOPMODE_delay[1] ^ IS_FPOPMODE_INVERTED_REG[1]); // rv 0
  assign FPOPMODE_in[2] = (FPOPMODE[2] !== 1'bz) && (FPOPMODE_delay[2] ^ IS_FPOPMODE_INVERTED_REG[2]); // rv 0
  assign FPOPMODE_in[3] = (FPOPMODE[3] !== 1'bz) && (FPOPMODE_delay[3] ^ IS_FPOPMODE_INVERTED_REG[3]); // rv 0
  assign FPOPMODE_in[4] = (FPOPMODE[4] !== 1'bz) && (FPOPMODE_delay[4] ^ IS_FPOPMODE_INVERTED_REG[4]); // rv 0
  assign FPOPMODE_in[5] = (FPOPMODE[5] !== 1'bz) && (FPOPMODE_delay[5] ^ IS_FPOPMODE_INVERTED_REG[5]); // rv 0
  assign FPOPMODE_in[6] = (FPOPMODE[6] !== 1'bz) && (FPOPMODE_delay[6] ^ IS_FPOPMODE_INVERTED_REG[6]); // rv 0
  assign RSTFPOPMODE_in = (RSTFPOPMODE !== 1'bz) && (RSTFPOPMODE_delay ^ IS_RSTFPOPMODE_INVERTED_REG); // rv 0
`else
  assign CEFPOPMODE_in = (CEFPOPMODE !== 1'bz) && CEFPOPMODE; // rv 0
  assign CLK_in = CLK;
  assign FPOPMODE_in[0] = (FPOPMODE[0] !== 1'bz) && (FPOPMODE[0] ^ IS_FPOPMODE_INVERTED_REG[0]); // rv 0
  assign FPOPMODE_in[1] = (FPOPMODE[1] !== 1'bz) && (FPOPMODE[1] ^ IS_FPOPMODE_INVERTED_REG[1]); // rv 0
  assign FPOPMODE_in[2] = (FPOPMODE[2] !== 1'bz) && (FPOPMODE[2] ^ IS_FPOPMODE_INVERTED_REG[2]); // rv 0
  assign FPOPMODE_in[3] = (FPOPMODE[3] !== 1'bz) && (FPOPMODE[3] ^ IS_FPOPMODE_INVERTED_REG[3]); // rv 0
  assign FPOPMODE_in[4] = (FPOPMODE[4] !== 1'bz) && (FPOPMODE[4] ^ IS_FPOPMODE_INVERTED_REG[4]); // rv 0
  assign FPOPMODE_in[5] = (FPOPMODE[5] !== 1'bz) && (FPOPMODE[5] ^ IS_FPOPMODE_INVERTED_REG[5]); // rv 0
  assign FPOPMODE_in[6] = (FPOPMODE[6] !== 1'bz) && (FPOPMODE[6] ^ IS_FPOPMODE_INVERTED_REG[6]); // rv 0
  assign RSTFPOPMODE_in = (RSTFPOPMODE !== 1'bz) && (RSTFPOPMODE ^ IS_RSTFPOPMODE_INVERTED_REG); // rv 0
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
  assign FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
  assign FPOPMREG_BIN = FPOPMREG_REG[1:0];

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
  FPMPIPEREG_BIN = FPMPIPEREG_REG[0];
  
  FPOPMREG_BIN = FPOPMREG_REG[1:0];

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
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((FPMPIPEREG_REG != 1) &&
       (FPMPIPEREG_REG != 0))) begin
    $display("Error: [Unisim %s-102] FPMPIPEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, FPMPIPEREG_REG);
    attr_err = 1'b1;
  end
  
  if ((attr_test == 1'b1) ||
      ((FPOPMREG_REG != 3) &&
       (FPOPMREG_REG != 0) &&
       (FPOPMREG_REG != 1) &&
       (FPOPMREG_REG != 2))) begin
    $display("Error: [Unisim %s-103] FPOPMREG attribute is set to %d.  Legal values for this attribute are 3, 0, 1 or 2. Instance: %m", MODULE_NAME, FPOPMREG_REG);
    attr_err = 1'b1;
  end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-106] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if ((attr_test == 1'b1) ||
        ((USE_MULT_REG != "MULTIPLY") &&
         (USE_MULT_REG != "DYNAMIC") &&
         (USE_MULT_REG != "NONE"))) begin
      $display("Error: [Unisim %s-107] USE_MULT attribute is set to %s.  Legal values for this attribute are MULTIPLY, DYNAMIC or NONE. Instance: %m", MODULE_NAME, USE_MULT_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg [6:0] FPOPMODE_reg;
  reg [6:0] FPOPMODE_reg1;
  reg [6:0] FPOPMODE_reg2;

  reg ASYNC_RST_async;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  FPOPMODE_reg  = 7'b0;
  FPOPMODE_reg1 = 7'b0;
  FPOPMODE_reg2 = 7'b0;
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
//*** FPOPMODE with 3 level of register
//*********************************************************
    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (FPOPMREG_BIN == 2'b00) || glblGSR) begin
          FPOPMODE_reg  <= 7'b0;
	    end else if (CEFPOPMODE_in) begin
          if (FPOPMREG_BIN == 2'b01) begin
             FPOPMODE_reg <= FPOPMODE_in;
          end else begin
             FPOPMODE_reg <= FPOPMODE_reg2;
	       end
	    end
	 end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPOPMREG_BIN[1] != 1'b1) || glblGSR) begin // 1 or 0
         FPOPMODE_reg2 <= 7'b0;
      end else if (CEFPOPMODE_in) begin
         if (FPOPMREG_BIN[0] == 1'b0) begin // 2
            FPOPMODE_reg2 <= FPOPMODE_in;
         end else begin // 3
            FPOPMODE_reg2 <= FPOPMODE_reg1;
         end
      end
   end

   always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTFPOPMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (FPOPMREG_BIN != 2'b11) || glblGSR) begin
         FPOPMODE_reg1 <= 7'b0;
      end else if (CEFPOPMODE_in) begin
         FPOPMODE_reg1 <= FPOPMODE_in;
      end
   end

   assign FPOPMODE_DATA = (FPOPMREG_BIN == 2'b00) ? FPOPMODE_in : FPOPMODE_reg;

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (CLK *> FPOPMODE_DATA) = (100:100:100, 100:100:100);
    (FPOPMODE *> FPOPMODE_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (posedge CLK, negedge CEFPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPOPMODE_delay);
    $setuphold (posedge CLK, negedge FPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPOPMODE_delay);
    $setuphold (posedge CLK, negedge RSTFPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPOPMODE_delay);
    $setuphold (posedge CLK, posedge CEFPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEFPOPMODE_delay);
    $setuphold (posedge CLK, posedge FPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, FPOPMODE_delay);
    $setuphold (posedge CLK, posedge RSTFPOPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTFPOPMODE_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
