///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        CLOCK_MOD_CLE_IMR
// /___/   /\      Filename    : CLOCK_MOD_CLE_IMR.v
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

module CLOCK_MOD_CLE_IMR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [3:0] CLK_DLY_VAL = 4'h0,
  parameter IMUX_CLK1_SEL = "BASE_CLK",
  parameter IMUX_CLK2_SEL = "BASE_CLK",
  parameter IMUX_CLK_MODE = "BYPASS"
)(
  output CLK_OUT,

  input CLK_IN
);

// define constants
  localparam MODULE_NAME = "CLOCK_MOD_CLE_IMR";
  
// Parameter encodings and registers
  localparam IMUX_CLK1_SEL_BASE_CLK = 0;
  localparam IMUX_CLK1_SEL_DLYD_CLK = 1;
  localparam IMUX_CLK1_SEL_HOLD_CLK = 2;
  localparam IMUX_CLK2_SEL_BASE_CLK = 0;
  localparam IMUX_CLK2_SEL_DLYD_CLK = 1;
  localparam IMUX_CLK_MODE_BYPASS = 0;
  localparam IMUX_CLK_MODE_DELAY = 1;
  localparam IMUX_CLK_MODE_DUAL = 2;
  localparam IMUX_CLK_MODE_PULSE = 3;
  localparam BASE_DELAY = 0;
  localparam DELAY_STEP = 60;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "CLOCK_MOD_CLE_IMR_dr.v"
`else
  reg [3:0] CLK_DLY_VAL_REG = CLK_DLY_VAL;
  reg [64:1] IMUX_CLK1_SEL_REG = IMUX_CLK1_SEL;
  reg [64:1] IMUX_CLK2_SEL_REG = IMUX_CLK2_SEL;
  reg [48:1] IMUX_CLK_MODE_REG = IMUX_CLK_MODE;
`endif

`ifdef XIL_XECLIB
  wire [1:0] IMUX_CLK1_SEL_BIN;
  wire IMUX_CLK2_SEL_BIN;
  wire [1:0] IMUX_CLK_MODE_BIN;
`else
  reg [1:0] IMUX_CLK1_SEL_BIN;
  reg IMUX_CLK2_SEL_BIN;
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
  assign IMUX_CLK1_SEL_BIN =
      (IMUX_CLK1_SEL_REG == "BASE_CLK") ? IMUX_CLK1_SEL_BASE_CLK :
      (IMUX_CLK1_SEL_REG == "DLYD_CLK") ? IMUX_CLK1_SEL_DLYD_CLK :
      (IMUX_CLK1_SEL_REG == "HOLD_CLK") ? IMUX_CLK1_SEL_HOLD_CLK :
       IMUX_CLK1_SEL_BASE_CLK;
  
  assign IMUX_CLK2_SEL_BIN =
      (IMUX_CLK2_SEL_REG == "BASE_CLK") ? IMUX_CLK2_SEL_BASE_CLK :
      (IMUX_CLK2_SEL_REG == "DLYD_CLK") ? IMUX_CLK2_SEL_DLYD_CLK :
       IMUX_CLK2_SEL_BASE_CLK;
  
  assign IMUX_CLK_MODE_BIN =
      (IMUX_CLK_MODE_REG == "BYPASS") ? IMUX_CLK_MODE_BYPASS :
      (IMUX_CLK_MODE_REG == "DELAY") ? IMUX_CLK_MODE_DELAY :
      (IMUX_CLK_MODE_REG == "DUAL") ? IMUX_CLK_MODE_DUAL :
      (IMUX_CLK_MODE_REG == "PULSE") ? IMUX_CLK_MODE_PULSE :
       IMUX_CLK_MODE_BYPASS;
  
`else
  always @ (trig_attr) begin
  #1;
  IMUX_CLK1_SEL_BIN =
      (IMUX_CLK1_SEL_REG == "BASE_CLK") ? IMUX_CLK1_SEL_BASE_CLK :
      (IMUX_CLK1_SEL_REG == "DLYD_CLK") ? IMUX_CLK1_SEL_DLYD_CLK :
      (IMUX_CLK1_SEL_REG == "HOLD_CLK") ? IMUX_CLK1_SEL_HOLD_CLK :
       IMUX_CLK1_SEL_BASE_CLK;
  
  IMUX_CLK2_SEL_BIN =
      (IMUX_CLK2_SEL_REG == "BASE_CLK") ? IMUX_CLK2_SEL_BASE_CLK :
      (IMUX_CLK2_SEL_REG == "DLYD_CLK") ? IMUX_CLK2_SEL_DLYD_CLK :
       IMUX_CLK2_SEL_BASE_CLK;
  
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
        ((IMUX_CLK1_SEL_REG != "BASE_CLK") &&
         (IMUX_CLK1_SEL_REG != "DLYD_CLK") &&
         (IMUX_CLK1_SEL_REG != "HOLD_CLK"))) begin
      $display("Error: [Unisim %s-102] IMUX_CLK1_SEL attribute is set to %s.  Legal values for this attribute are BASE_CLK, DLYD_CLK or HOLD_CLK. Instance: %m", MODULE_NAME, IMUX_CLK1_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IMUX_CLK2_SEL_REG != "BASE_CLK") &&
         (IMUX_CLK2_SEL_REG != "DLYD_CLK"))) begin
      $display("Error: [Unisim %s-103] IMUX_CLK2_SEL attribute is set to %s.  Legal values for this attribute are BASE_CLK or DLYD_CLK. Instance: %m", MODULE_NAME, IMUX_CLK2_SEL_REG);
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
  reg     CLK_OUT_out;

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


  always @(*) begin
   if (IMUX_CLK2_SEL_BIN==IMUX_CLK2_SEL_DLYD_CLK) 
     CLK_OUT_out = clk_modified;
   else begin
     case (IMUX_CLK1_SEL_BIN)
       IMUX_CLK1_SEL_BASE_CLK:    CLK_OUT_out = CLK_IN;
       IMUX_CLK1_SEL_DLYD_CLK:    CLK_OUT_out = clk_modified;
       IMUX_CLK1_SEL_HOLD_CLK:    CLK_OUT_out = ~CLK_IN;
       default:                   CLK_OUT_out = CLK_IN;
     endcase
   end
  end

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
