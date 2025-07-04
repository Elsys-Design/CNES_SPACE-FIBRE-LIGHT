///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        CLOCK_MOD_CLE_FF
// /___/   /\      Filename    : CLOCK_MOD_CLE_FF.v
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

module CLOCK_MOD_CLE_FF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [3:0] CLK_DLY_VAL = 4'h0,
  parameter FF_CLK_DUAL = "FALSE",
  parameter FF_CLK_EN = "TRUE",
  parameter IMUX_CLK_MODE = "BYPASS"
)(
  output CLK_OUT,

  input CLK_IN
);

// define constants
  localparam MODULE_NAME = "CLOCK_MOD_CLE_FF";
  
// Parameter encodings and registers
  localparam FF_CLK_DUAL_FALSE = 0;
  localparam FF_CLK_DUAL_TRUE = 1;
  localparam FF_CLK_EN_FALSE = 1;
  localparam FF_CLK_EN_TRUE = 0;
  localparam IMUX_CLK_MODE_BYPASS = 0;
  localparam IMUX_CLK_MODE_DELAY = 1;
  localparam IMUX_CLK_MODE_DUAL = 2;
  localparam IMUX_CLK_MODE_PULSE = 3;
  localparam BASE_DELAY = 0;
  localparam DELAY_STEP = 60;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "CLOCK_MOD_CLE_FF_dr.v"
`else
  reg [3:0] CLK_DLY_VAL_REG = CLK_DLY_VAL;
  reg [40:1] FF_CLK_DUAL_REG = FF_CLK_DUAL;
  reg [40:1] FF_CLK_EN_REG = FF_CLK_EN;
  reg [48:1] IMUX_CLK_MODE_REG = IMUX_CLK_MODE;
`endif

`ifdef XIL_XECLIB
  wire FF_CLK_DUAL_BIN;
  wire FF_CLK_EN_BIN;
  wire [1:0] IMUX_CLK_MODE_BIN;
`else
  reg FF_CLK_DUAL_BIN;
  reg FF_CLK_EN_BIN;
  reg [1:0] IMUX_CLK_MODE_BIN;
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
  assign FF_CLK_DUAL_BIN =
      (FF_CLK_DUAL_REG == "FALSE") ? FF_CLK_DUAL_FALSE :
      (FF_CLK_DUAL_REG == "TRUE") ? FF_CLK_DUAL_TRUE :
       FF_CLK_DUAL_FALSE;
  
  assign FF_CLK_EN_BIN =
      (FF_CLK_EN_REG == "TRUE") ? FF_CLK_EN_TRUE :
      (FF_CLK_EN_REG == "FALSE") ? FF_CLK_EN_FALSE :
       FF_CLK_EN_TRUE;
  
  assign IMUX_CLK_MODE_BIN =
      (IMUX_CLK_MODE_REG == "BYPASS") ? IMUX_CLK_MODE_BYPASS :
      (IMUX_CLK_MODE_REG == "DELAY") ? IMUX_CLK_MODE_DELAY :
      (IMUX_CLK_MODE_REG == "DUAL") ? IMUX_CLK_MODE_DUAL :
      (IMUX_CLK_MODE_REG == "PULSE") ? IMUX_CLK_MODE_PULSE :
       IMUX_CLK_MODE_BYPASS;
  
`else
  always @ (trig_attr) begin
  #1;
  FF_CLK_DUAL_BIN =
      (FF_CLK_DUAL_REG == "FALSE") ? FF_CLK_DUAL_FALSE :
      (FF_CLK_DUAL_REG == "TRUE") ? FF_CLK_DUAL_TRUE :
       FF_CLK_DUAL_FALSE;
  
  FF_CLK_EN_BIN =
      (FF_CLK_EN_REG == "TRUE") ? FF_CLK_EN_TRUE :
      (FF_CLK_EN_REG == "FALSE") ? FF_CLK_EN_FALSE :
       FF_CLK_EN_TRUE;
  
  IMUX_CLK_MODE_BIN =
      (IMUX_CLK_MODE_REG == "BYPASS") ? IMUX_CLK_MODE_BYPASS :
      (IMUX_CLK_MODE_REG == "DELAY") ? IMUX_CLK_MODE_DELAY :
      (IMUX_CLK_MODE_REG == "DUAL") ? IMUX_CLK_MODE_DUAL :
      (IMUX_CLK_MODE_REG == "PULSE") ? IMUX_CLK_MODE_PULSE :
       IMUX_CLK_MODE_BYPASS;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((FF_CLK_DUAL_REG != "FALSE") &&
         (FF_CLK_DUAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] FF_CLK_DUAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, FF_CLK_DUAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((FF_CLK_EN_REG != "TRUE") &&
         (FF_CLK_EN_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-103] FF_CLK_EN attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, FF_CLK_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IMUX_CLK_MODE_REG != "BYPASS") &&
         (IMUX_CLK_MODE_REG != "DELAY") &&
         (IMUX_CLK_MODE_REG != "DUAL") &&
         (IMUX_CLK_MODE_REG != "PULSE"))) begin
      $display("Error: [Unisim %s-104] IMUX_CLK_MODE attribute is set to %s.  Legal values for this attribute are BYPASS, DELAY, DUAL or PULSE. Instance: %m", MODULE_NAME, IMUX_CLK_MODE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

 
  integer clk_delay_amt;
  reg     clk_delayed;
  reg     clk_modified;
  wire    CLK_OUT_out;

  always @(*) clk_delay_amt = BASE_DELAY + CLK_DLY_VAL_REG * DELAY_STEP;

  always @(*) clk_delayed <= #(clk_delay_amt) CLK_IN;

  always @(*) begin
   if(IMUX_CLK_MODE_BIN ==IMUX_CLK_MODE_DELAY)
     clk_modified = clk_delayed;
   else if(IMUX_CLK_MODE_BIN == IMUX_CLK_MODE_DUAL)
     clk_modified =  CLK_IN ^ clk_delayed;
   else if(IMUX_CLK_MODE_BIN == IMUX_CLK_MODE_PULSE)
     clk_modified = ~(CLK_IN & ~clk_delayed); 
   else //if(IMUX_CLK_MODE_BIN == IMUX_CLK_MODE_BYPASS)
     clk_modified = 1'b1;
  end

  assign CLK_OUT_out = (FF_CLK_EN_BIN== FF_CLK_EN_TRUE) ? 
                         ((FF_CLK_DUAL_BIN==FF_CLK_DUAL_TRUE) ? clk_modified : CLK_IN ) :
                         1'b0;

  assign CLK_OUT = CLK_OUT_out;


// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (CLK_IN => CLK_OUT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
