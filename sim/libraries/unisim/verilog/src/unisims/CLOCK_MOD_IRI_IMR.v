///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        CLOCK_MOD_IRI_IMR
// /___/   /\      Filename    : CLOCK_MOD_IRI_IMR.v
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

module CLOCK_MOD_IRI_IMR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [3:0] CLK_DLY_VAL_COE = 4'h0,
  parameter [4:0] CLK_DLY_VAL_IMUX = 5'h00,
  parameter CLK_EN = "FALSE",
  parameter IMUX_CLK1_SEL = "BASE_CLK",
  parameter IMUX_CLK2_SEL = "BASE_CLK"
)(
  output CLK_OUT,

  input CLK_IN
);

// define constants
  localparam MODULE_NAME = "CLOCK_MOD_IRI_IMR";
  
// Parameter encodings and registers
  localparam CLK_EN_FALSE = 0;
  localparam CLK_EN_TRUE = 1;
  localparam IMUX_CLK1_SEL_BASE_CLK = 0;
  localparam IMUX_CLK1_SEL_DLYD_CLK = 1;
  localparam IMUX_CLK1_SEL_DUAL_CLK = 2;
  localparam IMUX_CLK2_SEL_BASE_CLK = 0;
  localparam IMUX_CLK2_SEL_DLYD_CLK = 1;
  localparam DELAY_STEP             = 60;
  localparam [4:0] IMUX_TAP18       = 5'h11;


  reg trig_attr;

  reg CLK_OUT_out;
  reg clk_dlyd_imux;
  reg clk_dlyd_coe;
  reg clk_dlyd_tap18;

// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "CLOCK_MOD_IRI_IMR_dr.v"
`else
  reg [3:0] CLK_DLY_VAL_COE_REG = CLK_DLY_VAL_COE;
  reg [4:0] CLK_DLY_VAL_IMUX_REG = CLK_DLY_VAL_IMUX;
  reg [40:1] CLK_EN_REG = CLK_EN;
  reg [64:1] IMUX_CLK1_SEL_REG = IMUX_CLK1_SEL;
  reg [64:1] IMUX_CLK2_SEL_REG = IMUX_CLK2_SEL;
`endif

`ifdef XIL_XECLIB
  wire CLK_EN_BIN;
  wire [1:0] IMUX_CLK1_SEL_BIN;
  wire IMUX_CLK2_SEL_BIN;
`else
  reg CLK_EN_BIN;
  reg [1:0] IMUX_CLK1_SEL_BIN;
  reg IMUX_CLK2_SEL_BIN;
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
  assign CLK_EN_BIN =
      (CLK_EN_REG == "FALSE") ? CLK_EN_FALSE :
      (CLK_EN_REG == "TRUE") ? CLK_EN_TRUE :
       CLK_EN_FALSE;
  
  assign IMUX_CLK1_SEL_BIN =
      (IMUX_CLK1_SEL_REG == "BASE_CLK") ? IMUX_CLK1_SEL_BASE_CLK :
      (IMUX_CLK1_SEL_REG == "DLYD_CLK") ? IMUX_CLK1_SEL_DLYD_CLK :
      (IMUX_CLK1_SEL_REG == "DUAL_CLK") ? IMUX_CLK1_SEL_DUAL_CLK :
       IMUX_CLK1_SEL_BASE_CLK;
  
  assign IMUX_CLK2_SEL_BIN =
      (IMUX_CLK2_SEL_REG == "BASE_CLK") ? IMUX_CLK2_SEL_BASE_CLK :
      (IMUX_CLK2_SEL_REG == "DLYD_CLK") ? IMUX_CLK2_SEL_DLYD_CLK :
       IMUX_CLK2_SEL_BASE_CLK;
  
`else
  always @ (trig_attr) begin
  #1;
  CLK_EN_BIN =
      (CLK_EN_REG == "FALSE") ? CLK_EN_FALSE :
      (CLK_EN_REG == "TRUE") ? CLK_EN_TRUE :
       CLK_EN_FALSE;
  
  IMUX_CLK1_SEL_BIN =
      (IMUX_CLK1_SEL_REG == "BASE_CLK") ? IMUX_CLK1_SEL_BASE_CLK :
      (IMUX_CLK1_SEL_REG == "DLYD_CLK") ? IMUX_CLK1_SEL_DLYD_CLK :
      (IMUX_CLK1_SEL_REG == "DUAL_CLK") ? IMUX_CLK1_SEL_DUAL_CLK :
       IMUX_CLK1_SEL_BASE_CLK;
  
  IMUX_CLK2_SEL_BIN =
      (IMUX_CLK2_SEL_REG == "BASE_CLK") ? IMUX_CLK2_SEL_BASE_CLK :
      (IMUX_CLK2_SEL_REG == "DLYD_CLK") ? IMUX_CLK2_SEL_DLYD_CLK :
       IMUX_CLK2_SEL_BASE_CLK;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((CLK_DLY_VAL_IMUX_REG < 5'h00) || (CLK_DLY_VAL_IMUX_REG > 5'h0F))) begin
        $display("Error: [Unisim %s-102] CLK_DLY_VAL_IMUX attribute is set to %h.  Legal values for this attribute are 5'h00 to 5'h0F. Instance: %m", MODULE_NAME, CLK_DLY_VAL_IMUX_REG);
        attr_err = 1'b1;
      end
    
    if ((attr_test == 1'b1) ||
        ((CLK_EN_REG != "FALSE") &&
         (CLK_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] CLK_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CLK_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IMUX_CLK1_SEL_REG != "BASE_CLK") &&
         (IMUX_CLK1_SEL_REG != "DLYD_CLK") &&
         (IMUX_CLK1_SEL_REG != "DUAL_CLK"))) begin
      $display("Error: [Unisim %s-104] IMUX_CLK1_SEL attribute is set to %s.  Legal values for this attribute are BASE_CLK, DLYD_CLK or DUAL_CLK. Instance: %m", MODULE_NAME, IMUX_CLK1_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IMUX_CLK2_SEL_REG != "BASE_CLK") &&
         (IMUX_CLK2_SEL_REG != "DLYD_CLK"))) begin
      $display("Error: [Unisim %s-105] IMUX_CLK2_SEL attribute is set to %s.  Legal values for this attribute are BASE_CLK or DLYD_CLK. Instance: %m", MODULE_NAME, IMUX_CLK2_SEL_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

  initial begin
    CLK_OUT_out = 1'b0;
  end

  always @(*) clk_dlyd_imux  <= #(DELAY_STEP * CLK_DLY_VAL_IMUX) CLK_IN;
  always @(*) clk_dlyd_coe   <= #(DELAY_STEP * CLK_DLY_VAL_COE)  CLK_IN;
  always @(*) clk_dlyd_tap18 <= #(DELAY_STEP * IMUX_TAP18)       CLK_IN;

  always @(*) begin
    if (CLK_EN_BIN == CLK_EN_FALSE) 
      CLK_OUT_out = 1'b0;
    else if (IMUX_CLK1_SEL_BIN == IMUX_CLK1_SEL_BASE_CLK ) 
      CLK_OUT_out = clk_dlyd_coe;
    else if (IMUX_CLK1_SEL_BIN == IMUX_CLK1_SEL_DLYD_CLK ) 
      CLK_OUT_out = ~clk_dlyd_coe;
    else if (IMUX_CLK1_SEL_BIN == IMUX_CLK1_SEL_DUAL_CLK ) 
      CLK_OUT_out = clk_dlyd_imux ^ clk_dlyd_tap18;
    else begin
      if (IMUX_CLK2_SEL_BIN== IMUX_CLK2_SEL_BASE_CLK) 
      	CLK_OUT_out = clk_dlyd_coe;
      else if (IMUX_CLK2_SEL_BIN==IMUX_CLK2_SEL_BASE_CLK ) 
      	CLK_OUT_out = clk_dlyd_imux;
    end
  end

  assign CLK_OUT = CLK_OUT_out;

 
// end behavioral model

endmodule

`endcelldefine
