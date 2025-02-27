///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2019 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        XPIO_VREF
// /___/   /\      Filename    : XPIO_VREF.v
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

module XPIO_VREF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter ISTANDARD = "UNUSED",
  parameter integer VOH = 40,
  parameter VREF_NIB = "VREF_MC"
)(
  output VREF,

  input [9:0] FABRIC_VREF_TUNE
);

// define constants
  localparam MODULE_NAME = "XPIO_VREF";
  localparam in_delay    = 0;
  localparam out_delay   = 0;

// Parameter encodings and registers
  localparam VREF_NIB_VREF_FABRIC = 1;
  localparam VREF_NIB_VREF_MC = 0;
  localparam VREF_NIB_VREF_RIU = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "XPIO_VREF_dr.v"
`else
  reg [48:1] ISTANDARD_REG = ISTANDARD;
  reg [31:0] VOH_REG = VOH;
  reg [88:1] VREF_NIB_REG = VREF_NIB;
`endif

`ifdef XIL_XECLIB
  wire [6:0] VOH_BIN;
  wire [1:0] VREF_NIB_BIN;
`else
  reg [6:0] VOH_BIN;
  reg [1:0] VREF_NIB_BIN;
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
  assign VOH_BIN = VOH_REG[6:0];
  
  assign VREF_NIB_BIN =
      (VREF_NIB_REG == "VREF_MC") ? VREF_NIB_VREF_MC :
      (VREF_NIB_REG == "VREF_FABRIC") ? VREF_NIB_VREF_FABRIC :
      (VREF_NIB_REG == "VREF_RIU") ? VREF_NIB_VREF_RIU :
       VREF_NIB_VREF_MC;
  
`else
  always @ (trig_attr) begin
  #1;
  VOH_BIN = VOH_REG[6:0];
  
  VREF_NIB_BIN =
      (VREF_NIB_REG == "VREF_MC") ? VREF_NIB_VREF_MC :
      (VREF_NIB_REG == "VREF_FABRIC") ? VREF_NIB_VREF_FABRIC :
      (VREF_NIB_REG == "VREF_RIU") ? VREF_NIB_VREF_RIU :
       VREF_NIB_VREF_MC;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((VOH_REG < 10) || (VOH_REG > 70))) begin
      $display("Error: [Unisim %s-102] VOH attribute is set to %d.  Legal values for this attribute are 10 to 70. Instance: %m", MODULE_NAME, VOH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((VREF_NIB_REG != "VREF_MC") &&
         (VREF_NIB_REG != "VREF_FABRIC") &&
         (VREF_NIB_REG != "VREF_RIU"))) begin
      $display("Error: [Unisim %s-103] VREF_NIB attribute is set to %s.  Legal values for this attribute are VREF_MC, VREF_FABRIC or VREF_RIU. Instance: %m", MODULE_NAME, VREF_NIB_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire VREF_out;

  wire VREF_delay;

  wire [9:0] FABRIC_VREF_TUNE_in;

  wire [9:0] FABRIC_VREF_TUNE_delay;

  assign #(in_delay) FABRIC_VREF_TUNE_delay = FABRIC_VREF_TUNE;

  assign FABRIC_VREF_TUNE_in = FABRIC_VREF_TUNE_delay;
   
  assign VREF_out = (FABRIC_VREF_TUNE_in == 10'd0 ? 1'b0 : 1'b1);

  assign VREF_delay = VREF_out;

  assign #(out_delay) VREF = VREF_delay;

  always @ (FABRIC_VREF_TUNE_in) begin
     $display("Info: [Unisim %s-1] Fabric Tune Value changed to %b. Instance: %m",MODULE_NAME, FABRIC_VREF_TUNE_in);
  end


// end behavioral model

endmodule

`endcelldefine
