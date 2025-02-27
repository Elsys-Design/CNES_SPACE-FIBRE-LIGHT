///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUF_ODDR
// /___/   /\      Filename    : OBUF_ODDR.v
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

module OBUF_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DRIVE = 8,
  parameter EN_OMUX = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter SLEW = "SLOW"
)(
  output O,

  input C,
  input I_0,
  input I_1
);

// define constants
  localparam MODULE_NAME = "OBUF_ODDR";
  
// Parameter encodings and registers
  localparam EN_OMUX_FALSE = 0;
  localparam EN_OMUX_TRUE = 1;
  localparam SLEW_FAST = 1;
  localparam SLEW_MEDIUM = 2;
  localparam SLEW_SLOW = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "OBUF_ODDR_dr.v"
`else
  reg [31:0] DRIVE_REG = DRIVE;
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg [48:1] SLEW_REG = SLEW;
`endif

`ifdef XIL_XECLIB
  wire [4:0] DRIVE_BIN;
  wire EN_OMUX_BIN;
  wire [1:0] SLEW_BIN;
`else
  reg [4:0] DRIVE_BIN;
  reg EN_OMUX_BIN;
  reg [1:0] SLEW_BIN;
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
  assign DRIVE_BIN = DRIVE_REG[4:0];
  
  assign EN_OMUX_BIN =
      (EN_OMUX_REG == "FALSE") ? EN_OMUX_FALSE :
      (EN_OMUX_REG == "TRUE") ? EN_OMUX_TRUE :
       EN_OMUX_FALSE;
  
  assign SLEW_BIN =
      (SLEW_REG == "SLOW") ? SLEW_SLOW :
      (SLEW_REG == "FAST") ? SLEW_FAST :
      (SLEW_REG == "MEDIUM") ? SLEW_MEDIUM :
       SLEW_SLOW;
  
`else
  always @ (trig_attr) begin
  #1;
  DRIVE_BIN = DRIVE_REG[4:0];
  
  EN_OMUX_BIN =
      (EN_OMUX_REG == "FALSE") ? EN_OMUX_FALSE :
      (EN_OMUX_REG == "TRUE") ? EN_OMUX_TRUE :
       EN_OMUX_FALSE;
  
  SLEW_BIN =
      (SLEW_REG == "SLOW") ? SLEW_SLOW :
      (SLEW_REG == "FAST") ? SLEW_FAST :
      (SLEW_REG == "MEDIUM") ? SLEW_MEDIUM :
       SLEW_SLOW;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DRIVE_REG < 2) || (DRIVE_REG > 24))) begin
      $display("Error: [Unisim %s-101] DRIVE attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_REG != "SLOW") &&
         (SLEW_REG != "FAST") &&
         (SLEW_REG != "MEDIUM"))) begin
      $display("Error: [Unisim %s-105] SLEW attribute is set to %s.  Legal values for this attribute are SLOW, FAST or MEDIUM. Instance: %m", MODULE_NAME, SLEW_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  tri0 GTS = glbl.GTS;
  wire I_muxed;

  assign I_muxed   = (C==1'b1) ? I_0 : I_1; 


  bufif0 B1 (O, I_muxed, GTS);


// end behavioral model

endmodule

`endcelldefine
