///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        OBUFTDS_ODDR
// /___/   /\      Filename    : OBUFTDS_ODDR.v
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

module OBUFTDS_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter EN_OMUX = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter SLEW = "SLOW"
)(
  output O,
  output OB,

  input C,
  input I_0,
  input I_1,
  input T
);

// define constants
  localparam MODULE_NAME = "OBUFTDS_ODDR";
  
// Parameter encodings and registers
  localparam EN_OMUX_FALSE = 0;
  localparam EN_OMUX_TRUE = 1;
  localparam SLEW_FAST = 1;
  localparam SLEW_MEDIUM = 2;
  localparam SLEW_SLOW = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "OBUFTDS_ODDR_dr.v"
`else
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg [48:1] SLEW_REG = SLEW;
`endif

`ifdef XIL_XECLIB
  wire EN_OMUX_BIN;
  wire [1:0] SLEW_BIN;
`else
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
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_REG != "SLOW") &&
         (SLEW_REG != "FAST") &&
         (SLEW_REG != "MEDIUM"))) begin
      $display("Error: [Unisim %s-104] SLEW attribute is set to %s.  Legal values for this attribute are SLOW, FAST or MEDIUM. Instance: %m", MODULE_NAME, SLEW_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire ts;
  tri0 GTS = glbl.GTS;
  wire I_muxed;

  assign I_muxed   = (C==1'b1) ? I_0 : I_1; 

  
  or O1 (ts, GTS, T);
  bufif0 B1 (O, I_muxed, ts);
  notif0 N1 (OB, I_muxed, ts);


// end behavioral model

endmodule

`endcelldefine
