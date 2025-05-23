///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2017 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        CLKDLLE
// /___/   /\      Filename    : CLKDLLE.v
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

module CLKDLLE #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter real CLKDV_DIVIDE = 2.000,
  parameter DUTY_CYCLE_CORRECTION = "TRUE",
  parameter [15:0] FACTORY_JF = 16'hC080,
  parameter STARTUP_WAIT = "FALSE"
)(
  output CLK0,
  output CLK180,
  output CLK270,
  output CLK2X,
  output CLK2X180,
  output CLK90,
  output CLKDV,
  output LOCKED,

  input CLKFB,
  input CLKIN,
  input RST
);

// define constants
  localparam MODULE_NAME = "CLKDLLE";
  
// Parameter encodings and registers
  localparam DUTY_CYCLE_CORRECTION_FALSE = 1;
  localparam DUTY_CYCLE_CORRECTION_TRUE = 0;
  localparam STARTUP_WAIT_FALSE = 0;
  localparam STARTUP_WAIT_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "CLKDLLE_dr.v"
`else
  localparam real CLKDV_DIVIDE_REG = CLKDV_DIVIDE;
  localparam [40:1] DUTY_CYCLE_CORRECTION_REG = DUTY_CYCLE_CORRECTION;
  localparam [15:0] FACTORY_JF_REG = FACTORY_JF;
  localparam [40:1] STARTUP_WAIT_REG = STARTUP_WAIT;
`endif

`ifdef XIL_XECLIB
  wire [63:0] CLKDV_DIVIDE_BIN;
  wire DUTY_CYCLE_CORRECTION_BIN;
  wire STARTUP_WAIT_BIN;
`else
  reg [63:0] CLKDV_DIVIDE_BIN;
  reg DUTY_CYCLE_CORRECTION_BIN;
  reg STARTUP_WAIT_BIN;
`endif

  reg attr_test;
  reg attr_err;
  tri0 glblGSR = glbl.GSR;

  wire CLKFB_in;
  wire CLKIN_in;
  wire RST_in;

  assign CLKFB_in = (CLKFB !== 1'bz) && CLKFB; // rv 0
  assign CLKIN_in = (CLKIN !== 1'bz) && CLKIN; // rv 0
  assign RST_in = (RST !== 1'bz) && RST; // rv 0

`ifndef XIL_XECLIB
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
  assign CLKDV_DIVIDE_BIN = CLKDV_DIVIDE_REG * 1000;
  
  assign DUTY_CYCLE_CORRECTION_BIN =
      (DUTY_CYCLE_CORRECTION_REG == "FALSE") ? DUTY_CYCLE_CORRECTION_FALSE :
      (DUTY_CYCLE_CORRECTION_REG == "TRUE")  ? DUTY_CYCLE_CORRECTION_TRUE  :
       DUTY_CYCLE_CORRECTION_TRUE;
  
  assign STARTUP_WAIT_BIN =
      (STARTUP_WAIT_REG == "FALSE") ? STARTUP_WAIT_FALSE :
      (STARTUP_WAIT_REG == "TRUE")  ? STARTUP_WAIT_TRUE  :
       STARTUP_WAIT_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  CLKDV_DIVIDE_BIN = CLKDV_DIVIDE_REG * 1000;
  
  DUTY_CYCLE_CORRECTION_BIN =
      (DUTY_CYCLE_CORRECTION_REG == "FALSE") ? DUTY_CYCLE_CORRECTION_FALSE :
      (DUTY_CYCLE_CORRECTION_REG == "TRUE")  ? DUTY_CYCLE_CORRECTION_TRUE  :
       DUTY_CYCLE_CORRECTION_TRUE;
  
  STARTUP_WAIT_BIN =
      (STARTUP_WAIT_REG == "FALSE") ? STARTUP_WAIT_FALSE :
      (STARTUP_WAIT_REG == "TRUE")  ? STARTUP_WAIT_TRUE  :
       STARTUP_WAIT_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
       ((CLKDV_DIVIDE_REG != 2.000) &&
        (CLKDV_DIVIDE_REG != 1.500) &&
        (CLKDV_DIVIDE_REG != 2.500) &&
        (CLKDV_DIVIDE_REG != 3.000) &&
        (CLKDV_DIVIDE_REG != 4.000) &&
        (CLKDV_DIVIDE_REG != 5.000) &&
        (CLKDV_DIVIDE_REG != 8.000) &&
        (CLKDV_DIVIDE_REG != 16.000))) begin
      $display("Error: [Unisim %s-101] CLKDV_DIVIDE attribute is set to %f.  Legal values for this attribute are 2.000, 1.500, 2.500, 3.000, 4.000, 5.000, 8.000 or 16.000. Instance: %m", MODULE_NAME, CLKDV_DIVIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DUTY_CYCLE_CORRECTION_REG != "TRUE") &&
         (DUTY_CYCLE_CORRECTION_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-102] DUTY_CYCLE_CORRECTION attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, DUTY_CYCLE_CORRECTION_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_WAIT_REG != "FALSE") &&
         (STARTUP_WAIT_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] STARTUP_WAIT attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, STARTUP_WAIT_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

    initial begin
   $display ("ERROR : Component %s instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the HDL Libraries Guide(s) available on www.xilinx.com.",MODULE_NAME);
   #1 $finish;
    end

// end behavioral model

endmodule

`endcelldefine
