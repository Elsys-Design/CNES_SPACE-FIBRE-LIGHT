///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_ALUREG
// /___/   /\      Filename    : DSP_ALUREG.v
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

module DSP_ALUREG #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer ALUMODEREG = 1,
  parameter integer CARRYINREG = 1,
  parameter integer CARRYINSELREG = 1,
  parameter DSP_MODE = "INT24",
  parameter [3:0] IS_ALUMODE_INVERTED = 4'b0000,
  parameter [0:0] IS_CARRYIN_INVERTED = 1'b0,
  parameter [8:0] IS_OPMODE_INVERTED = 9'b000000000,
  parameter [0:0] IS_RSTALLCARRYIN_INVERTED = 1'b0,
  parameter [0:0] IS_RSTALUMODE_INVERTED = 1'b0,
  parameter [0:0] IS_RSTCTRL_INVERTED = 1'b0,
  parameter integer MREG = 1,
  parameter integer OPMODEREG = 1,
  parameter RESET_MODE = "SYNC"
)(
  output [3:0] ALUMODE_DATA,
  output [2:0] CARRYINSEL_DATA,
  output CARRYIN_DATA,
  output MULTCARRYIN_DATA,
  output [8:0] OPMODE_DATA,

  input [3:0] ALUMODE,
  input AMULTMSB,
  input ASYNC_RST,
  input BMULTMSB,
  input CARRYIN,
  input [2:0] CARRYINSEL,
  input CEALUMODE,
  input CECARRYIN,
  input CECTRL,
  input CEM,
  input CLK,
  input [8:0] OPMODE,
  input RSTALLCARRYIN,
  input RSTALUMODE,
  input RSTCTRL
);
  
// define constants
  localparam MODULE_NAME = "DSP_ALUREG";

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
  `include "DSP_ALUREG_dr.v"
`else
  reg [31:0] ALUMODEREG_REG = ALUMODEREG;
  reg [31:0] CARRYINREG_REG = CARRYINREG;
  reg [31:0] CARRYINSELREG_REG = CARRYINSELREG;
  reg [48:1] DSP_MODE_REG = DSP_MODE;
  reg [3:0] IS_ALUMODE_INVERTED_REG = IS_ALUMODE_INVERTED;
  reg [0:0] IS_CARRYIN_INVERTED_REG = IS_CARRYIN_INVERTED;
  reg [8:0] IS_OPMODE_INVERTED_REG = IS_OPMODE_INVERTED;
  reg [0:0] IS_RSTALLCARRYIN_INVERTED_REG = IS_RSTALLCARRYIN_INVERTED;
  reg [0:0] IS_RSTALUMODE_INVERTED_REG = IS_RSTALUMODE_INVERTED;
  reg [0:0] IS_RSTCTRL_INVERTED_REG = IS_RSTCTRL_INVERTED;
  reg [31:0] MREG_REG = MREG;
  reg [31:0] OPMODEREG_REG = OPMODEREG;
  reg [40:1] RESET_MODE_REG = RESET_MODE;
`endif

`ifdef XIL_XECLIB
  wire ALUMODEREG_BIN;
  wire CARRYINREG_BIN;
  wire CARRYINSELREG_BIN;
  wire [1:0] DSP_MODE_BIN;
  wire MREG_BIN;
  wire OPMODEREG_BIN;
  wire RESET_MODE_BIN;
`else
  reg ALUMODEREG_BIN;
  reg CARRYINREG_BIN;
  reg CARRYINSELREG_BIN;
  reg [1:0] DSP_MODE_BIN;
  reg MREG_BIN;
  reg OPMODEREG_BIN;
  reg RESET_MODE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire AMULTMSB_in;
  wire ASYNC_RST_in;
  wire BMULTMSB_in;
  wire CARRYIN_in;
  wire CEALUMODE_in;
  wire CECARRYIN_in;
  wire CECTRL_in;
  wire CEM_in;
  wire CLK_in;
  wire RSTALLCARRYIN_in;
  wire RSTALUMODE_in;
  wire RSTCTRL_in;
  wire [2:0] CARRYINSEL_in;
  wire [3:0] ALUMODE_in;
  wire [8:0] OPMODE_in;

`ifdef XIL_TIMING
  wire AMULTMSB_delay;
  wire ASYNC_RST_delay;
  wire BMULTMSB_delay;
  wire CARRYIN_delay;
  wire CEALUMODE_delay;
  wire CECARRYIN_delay;
  wire CECTRL_delay;
  wire CEM_delay;
  wire CLK_delay;
  wire RSTALLCARRYIN_delay;
  wire RSTALUMODE_delay;
  wire RSTCTRL_delay;
  wire [2:0] CARRYINSEL_delay;
  wire [3:0] ALUMODE_delay;
  wire [8:0] OPMODE_delay;
`endif

`ifdef XIL_TIMING
  assign ALUMODE_in[0] = (ALUMODE[0] !== 1'bz) && (ALUMODE_delay[0] ^ IS_ALUMODE_INVERTED_REG[0]); // rv 0
  assign ALUMODE_in[1] = (ALUMODE[1] !== 1'bz) && (ALUMODE_delay[1] ^ IS_ALUMODE_INVERTED_REG[1]); // rv 0
  assign ALUMODE_in[2] = (ALUMODE[2] !== 1'bz) && (ALUMODE_delay[2] ^ IS_ALUMODE_INVERTED_REG[2]); // rv 0
  assign ALUMODE_in[3] = (ALUMODE[3] !== 1'bz) && (ALUMODE_delay[3] ^ IS_ALUMODE_INVERTED_REG[3]); // rv 0
  assign AMULTMSB_in = AMULTMSB_delay;
  assign ASYNC_RST_in = ASYNC_RST_delay;
  assign BMULTMSB_in = BMULTMSB_delay;
  assign CARRYINSEL_in[0] = (CARRYINSEL[0] !== 1'bz) && CARRYINSEL_delay[0]; // rv 0
  assign CARRYINSEL_in[1] = (CARRYINSEL[1] !== 1'bz) && CARRYINSEL_delay[1]; // rv 0
  assign CARRYINSEL_in[2] = (CARRYINSEL[2] !== 1'bz) && CARRYINSEL_delay[2]; // rv 0
  assign CARRYIN_in = (CARRYIN !== 1'bz) && (CARRYIN_delay ^ IS_CARRYIN_INVERTED_REG); // rv 0
  assign CEALUMODE_in = (CEALUMODE !== 1'bz) && CEALUMODE_delay; // rv 0
  assign CECARRYIN_in = (CECARRYIN !== 1'bz) && CECARRYIN_delay; // rv 0
  assign CECTRL_in = (CECTRL !== 1'bz) && CECTRL_delay; // rv 0
  assign CEM_in = (CEM !== 1'bz) && CEM_delay; // rv 0
  assign CLK_in = CLK_delay;
  assign OPMODE_in[0] = (OPMODE[0] !== 1'bz) && (OPMODE_delay[0] ^ IS_OPMODE_INVERTED_REG[0]); // rv 0
  assign OPMODE_in[1] = (OPMODE[1] !== 1'bz) && (OPMODE_delay[1] ^ IS_OPMODE_INVERTED_REG[1]); // rv 0
  assign OPMODE_in[2] = (OPMODE[2] !== 1'bz) && (OPMODE_delay[2] ^ IS_OPMODE_INVERTED_REG[2]); // rv 0
  assign OPMODE_in[3] = (OPMODE[3] !== 1'bz) && (OPMODE_delay[3] ^ IS_OPMODE_INVERTED_REG[3]); // rv 0
  assign OPMODE_in[4] = (OPMODE[4] !== 1'bz) && (OPMODE_delay[4] ^ IS_OPMODE_INVERTED_REG[4]); // rv 0
  assign OPMODE_in[5] = (OPMODE[5] !== 1'bz) && (OPMODE_delay[5] ^ IS_OPMODE_INVERTED_REG[5]); // rv 0
  assign OPMODE_in[6] = (OPMODE[6] !== 1'bz) && (OPMODE_delay[6] ^ IS_OPMODE_INVERTED_REG[6]); // rv 0
  assign OPMODE_in[7] = (OPMODE[7] !== 1'bz) && (OPMODE_delay[7] ^ IS_OPMODE_INVERTED_REG[7]); // rv 0
  assign OPMODE_in[8] = (OPMODE[8] !== 1'bz) && (OPMODE_delay[8] ^ IS_OPMODE_INVERTED_REG[8]); // rv 0
  assign RSTALLCARRYIN_in = (RSTALLCARRYIN !== 1'bz) && (RSTALLCARRYIN_delay ^ IS_RSTALLCARRYIN_INVERTED_REG); // rv 0
  assign RSTALUMODE_in = (RSTALUMODE !== 1'bz) && (RSTALUMODE_delay ^ IS_RSTALUMODE_INVERTED_REG); // rv 0
  assign RSTCTRL_in = (RSTCTRL !== 1'bz) && (RSTCTRL_delay ^ IS_RSTCTRL_INVERTED_REG); // rv 0
`else
  assign ALUMODE_in[0] = (ALUMODE[0] !== 1'bz) && (ALUMODE[0] ^ IS_ALUMODE_INVERTED_REG[0]); // rv 0
  assign ALUMODE_in[1] = (ALUMODE[1] !== 1'bz) && (ALUMODE[1] ^ IS_ALUMODE_INVERTED_REG[1]); // rv 0
  assign ALUMODE_in[2] = (ALUMODE[2] !== 1'bz) && (ALUMODE[2] ^ IS_ALUMODE_INVERTED_REG[2]); // rv 0
  assign ALUMODE_in[3] = (ALUMODE[3] !== 1'bz) && (ALUMODE[3] ^ IS_ALUMODE_INVERTED_REG[3]); // rv 0
  assign AMULTMSB_in = AMULTMSB;
  assign ASYNC_RST_in = ASYNC_RST;
  assign BMULTMSB_in = BMULTMSB;
  assign CARRYINSEL_in[0] = (CARRYINSEL[0] !== 1'bz) && CARRYINSEL[0]; // rv 0
  assign CARRYINSEL_in[1] = (CARRYINSEL[1] !== 1'bz) && CARRYINSEL[1]; // rv 0
  assign CARRYINSEL_in[2] = (CARRYINSEL[2] !== 1'bz) && CARRYINSEL[2]; // rv 0
  assign CARRYIN_in = (CARRYIN !== 1'bz) && (CARRYIN ^ IS_CARRYIN_INVERTED_REG); // rv 0
  assign CEALUMODE_in = (CEALUMODE !== 1'bz) && CEALUMODE; // rv 0
  assign CECARRYIN_in = (CECARRYIN !== 1'bz) && CECARRYIN; // rv 0
  assign CECTRL_in = (CECTRL !== 1'bz) && CECTRL; // rv 0
  assign CEM_in = (CEM !== 1'bz) && CEM; // rv 0
  assign CLK_in = CLK;
  assign OPMODE_in[0] = (OPMODE[0] !== 1'bz) && (OPMODE[0] ^ IS_OPMODE_INVERTED_REG[0]); // rv 0
  assign OPMODE_in[1] = (OPMODE[1] !== 1'bz) && (OPMODE[1] ^ IS_OPMODE_INVERTED_REG[1]); // rv 0
  assign OPMODE_in[2] = (OPMODE[2] !== 1'bz) && (OPMODE[2] ^ IS_OPMODE_INVERTED_REG[2]); // rv 0
  assign OPMODE_in[3] = (OPMODE[3] !== 1'bz) && (OPMODE[3] ^ IS_OPMODE_INVERTED_REG[3]); // rv 0
  assign OPMODE_in[4] = (OPMODE[4] !== 1'bz) && (OPMODE[4] ^ IS_OPMODE_INVERTED_REG[4]); // rv 0
  assign OPMODE_in[5] = (OPMODE[5] !== 1'bz) && (OPMODE[5] ^ IS_OPMODE_INVERTED_REG[5]); // rv 0
  assign OPMODE_in[6] = (OPMODE[6] !== 1'bz) && (OPMODE[6] ^ IS_OPMODE_INVERTED_REG[6]); // rv 0
  assign OPMODE_in[7] = (OPMODE[7] !== 1'bz) && (OPMODE[7] ^ IS_OPMODE_INVERTED_REG[7]); // rv 0
  assign OPMODE_in[8] = (OPMODE[8] !== 1'bz) && (OPMODE[8] ^ IS_OPMODE_INVERTED_REG[8]); // rv 0
  assign RSTALLCARRYIN_in = (RSTALLCARRYIN !== 1'bz) && (RSTALLCARRYIN ^ IS_RSTALLCARRYIN_INVERTED_REG); // rv 0
  assign RSTALUMODE_in = (RSTALUMODE !== 1'bz) && (RSTALUMODE ^ IS_RSTALUMODE_INVERTED_REG); // rv 0
  assign RSTCTRL_in = (RSTCTRL !== 1'bz) && (RSTCTRL ^ IS_RSTCTRL_INVERTED_REG); // rv 0
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
  assign ALUMODEREG_BIN = ALUMODEREG_REG[0];

  assign CARRYINREG_BIN = CARRYINREG_REG[0];

  assign CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  assign DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  assign MREG_BIN = MREG_REG[0];

  assign OPMODEREG_BIN = OPMODEREG_REG[0];

  assign RESET_MODE_BIN =
      (RESET_MODE_REG == "SYNC") ? RESET_MODE_SYNC :
      (RESET_MODE_REG == "ASYNC") ? RESET_MODE_ASYNC :
       RESET_MODE_SYNC;

`else

always @(trig_attr) begin
  #1;

  ALUMODEREG_BIN = ALUMODEREG_REG[0];

  CARRYINREG_BIN = CARRYINREG_REG[0];

  CARRYINSELREG_BIN = CARRYINSELREG_REG[0];

  DSP_MODE_BIN =
    (DSP_MODE_REG == "INT24") ? DSP_MODE_INT24 :
    (DSP_MODE_REG == "CINT18") ? DSP_MODE_CINT18 :
    (DSP_MODE_REG == "FP32") ? DSP_MODE_FP32 :
    (DSP_MODE_REG == "INT8") ? DSP_MODE_INT8 :
     DSP_MODE_INT24;

  MREG_BIN = MREG_REG[0];

  OPMODEREG_BIN = OPMODEREG_REG[0];

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
        ((ALUMODEREG_REG != 1) &&
         (ALUMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-101] ALUMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, ALUMODEREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CARRYINREG_REG != 1) &&
         (CARRYINREG_REG != 0))) begin
      $display("Error: [Unisim %s-102] CARRYINREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((CARRYINSELREG_REG != 1) &&
         (CARRYINSELREG_REG != 0))) begin
      $display("Error: [Unisim %s-103] CARRYINSELREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, CARRYINSELREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((DSP_MODE_REG != "INT24") &&
       (DSP_MODE_REG != "CINT18") &&
       (DSP_MODE_REG != "FP32") &&
       (DSP_MODE_REG != "INT8"))) begin
    $display("Error: [Unisim %s-104] DSP_MODE attribute is set to %s.  Legal values for this attribute are INT24, CINT18, FP32 or INT8. Instance: %m", MODULE_NAME, DSP_MODE_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((MREG_REG != 1) &&
         (MREG_REG != 0))) begin
      $display("Error: [Unisim %s-111] MREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_REG);
      attr_err = 1'b1;
    end

    if ((attr_test == 1'b1) ||
        ((OPMODEREG_REG != 1) &&
         (OPMODEREG_REG != 0))) begin
      $display("Error: [Unisim %s-112] OPMODEREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, OPMODEREG_REG);
      attr_err = 1'b1;
    end

  if ((attr_test == 1'b1) ||
      ((RESET_MODE_REG != "SYNC") &&
       (RESET_MODE_REG != "ASYNC"))) begin
    $display("Error: [Unisim %s-113] RESET_MODE attribute is set to %s.  Legal values for this attribute are SYNC or ASYNC. Instance: %m", MODULE_NAME, RESET_MODE_REG);
    attr_err = 1'b1;
  end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  reg CARRYIN_reg = 1'b0;
  reg [3:0] ALUMODE_reg = 4'b0;
  reg [2:0] CARRYINSEL_reg = 3'b0;
  reg [8:0] OPMODE_reg = 9'b0;
  reg  MULTCARRYIN_reg = 1'b0;

  reg ASYNC_RST_async = 1'b0;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  CARRYIN_reg = 1'b0;
  ALUMODE_reg = 4'b0;
  CARRYINSEL_reg = 3'b0;
  OPMODE_reg = 9'b0;
  MULTCARRYIN_reg = 1'b0;
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
//*** CARRYINSEL and OPMODE with 1 level of register
//*********************************************************
    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTCTRL_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (OPMODEREG_BIN == 1'b0) || glblGSR) begin
         OPMODE_reg <= 9'b0;
	   end  
	   else if (CECTRL_in) begin
         OPMODE_reg <= OPMODE_in;
	   end
    end

    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
      if ((RSTCTRL_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
          ASYNC_RST_async ||
          (CARRYINSELREG_BIN == 1'b0) || glblGSR) begin
         CARRYINSEL_reg <= 3'b0;
	   end  
	   else if (CECTRL_in) begin
         CARRYINSEL_reg <= CARRYINSEL_in;
	   end
    end

    assign CARRYINSEL_DATA = (CARRYINSELREG_BIN == 1'b1) ?  CARRYINSEL_reg : CARRYINSEL_in;

    assign OPMODE_DATA = (OPMODEREG_BIN == 1'b1) ? OPMODE_reg : OPMODE_in;


//*********************************************************
//*** ALUMODE with 1 level of register
//*********************************************************
    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
       if ((RSTALUMODE_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
           ASYNC_RST_async ||
           (ALUMODEREG_BIN == 1'b0) || glblGSR)
          ALUMODE_reg <= 4'b0;
	    else if (CEALUMODE_in)
          ALUMODE_reg <= ALUMODE_in;
       end

    assign ALUMODE_DATA = (ALUMODEREG_BIN == 1'b1) ? ALUMODE_reg : ALUMODE_in;
 
    
//*** CarryIn Mux and Register

//-------  input 0
    always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTALLCARRYIN_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         (CARRYINREG_BIN == 1'b0) || glblGSR)
          CARRYIN_reg <= 1'b0;
	    else if (CECARRYIN_in)
          CARRYIN_reg <= CARRYIN_in;
       end

       assign CARRYIN_DATA = (CARRYINREG_BIN == 1'b1) ? CARRYIN_reg : CARRYIN_in;

// INTERNAL CARRYIN REGISTER

  always @(posedge CLK_in or posedge ASYNC_RST_async) begin
     if ((RSTALLCARRYIN_in && (RESET_MODE_BIN == RESET_MODE_SYNC)) ||
         ASYNC_RST_async ||
         (MREG_BIN == 1'b0) || glblGSR)
       MULTCARRYIN_reg <= 1'b0;
    else if (CEM_in)
       MULTCARRYIN_reg <= !(AMULTMSB_in^BMULTMSB_in);
  end

  // bypass register mux
  assign MULTCARRYIN_DATA = (MREG_BIN == 1'b1) ? MULTCARRYIN_reg : !(AMULTMSB_in^BMULTMSB_in);

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (ALUMODE *> ALUMODE_DATA) = (0:0:0, 0:0:0);
    (AMULTMSB => MULTCARRYIN_DATA) = (0:0:0, 0:0:0);
    (BMULTMSB => MULTCARRYIN_DATA) = (0:0:0, 0:0:0);
    (CARRYIN => CARRYIN_DATA) = (0:0:0, 0:0:0);
    (CARRYINSEL *> CARRYINSEL_DATA) = (0:0:0, 0:0:0);
    (CLK *> ALUMODE_DATA) = (100:100:100, 100:100:100);
    (CLK *> CARRYINSEL_DATA) = (100:100:100, 100:100:100);
    (CLK *> OPMODE_DATA) = (100:100:100, 100:100:100);
    (CLK => CARRYIN_DATA) = (100:100:100, 100:100:100);
    (CLK => MULTCARRYIN_DATA) = (100:100:100, 100:100:100);
    (OPMODE *> OPMODE_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $recrem (negedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $recrem (posedge ASYNC_RST, posedge CLK, 0:0:0, 0:0:0, notifier, , , ASYNC_RST_delay, CLK_delay);
    $setuphold (posedge CLK, negedge ALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALUMODE_delay);
    $setuphold (posedge CLK, negedge AMULTMSB, 0:0:0, 0:0:0, notifier, , , CLK_delay, AMULTMSB_delay);
    $setuphold (posedge CLK, negedge BMULTMSB, 0:0:0, 0:0:0, notifier, , , CLK_delay, BMULTMSB_delay);
    $setuphold (posedge CLK, negedge CARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CARRYIN_delay);
    $setuphold (posedge CLK, negedge CARRYINSEL, 0:0:0, 0:0:0, notifier, , , CLK_delay, CARRYINSEL_delay);
    $setuphold (posedge CLK, negedge CEALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEALUMODE_delay);
    $setuphold (posedge CLK, negedge CECARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CECARRYIN_delay);
    $setuphold (posedge CLK, negedge CECTRL, 0:0:0, 0:0:0, notifier, , , CLK_delay, CECTRL_delay);
    $setuphold (posedge CLK, negedge CEM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEM_delay);
    $setuphold (posedge CLK, negedge OPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, OPMODE_delay);
    $setuphold (posedge CLK, negedge RSTALLCARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTALLCARRYIN_delay);
    $setuphold (posedge CLK, negedge RSTALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTALUMODE_delay);
    $setuphold (posedge CLK, negedge RSTCTRL, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTCTRL_delay);
    $setuphold (posedge CLK, posedge ALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, ALUMODE_delay);
    $setuphold (posedge CLK, posedge AMULTMSB, 0:0:0, 0:0:0, notifier, , , CLK_delay, AMULTMSB_delay);
    $setuphold (posedge CLK, posedge BMULTMSB, 0:0:0, 0:0:0, notifier, , , CLK_delay, BMULTMSB_delay);
    $setuphold (posedge CLK, posedge CARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CARRYIN_delay);
    $setuphold (posedge CLK, posedge CARRYINSEL, 0:0:0, 0:0:0, notifier, , , CLK_delay, CARRYINSEL_delay);
    $setuphold (posedge CLK, posedge CEALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEALUMODE_delay);
    $setuphold (posedge CLK, posedge CECARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, CECARRYIN_delay);
    $setuphold (posedge CLK, posedge CECTRL, 0:0:0, 0:0:0, notifier, , , CLK_delay, CECTRL_delay);
    $setuphold (posedge CLK, posedge CEM, 0:0:0, 0:0:0, notifier, , , CLK_delay, CEM_delay);
    $setuphold (posedge CLK, posedge OPMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, OPMODE_delay);
    $setuphold (posedge CLK, posedge RSTALLCARRYIN, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTALLCARRYIN_delay);
    $setuphold (posedge CLK, posedge RSTALUMODE, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTALUMODE_delay);
    $setuphold (posedge CLK, posedge RSTCTRL, 0:0:0, 0:0:0, notifier, , , CLK_delay, RSTCTRL_delay);
    $width (negedge ASYNC_RST, 0:0:0, 0, notifier);
    $width (posedge ASYNC_RST, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
