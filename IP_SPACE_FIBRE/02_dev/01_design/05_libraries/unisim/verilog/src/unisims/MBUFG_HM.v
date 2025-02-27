///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2024.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        MBUFG_HM
// /___/   /\      Filename    : MBUFG_HM.v
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

module MBUFG_HM #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter MODE = "PERFORMANCE",
  parameter STARTUP_SYNC = "TRUE"
)(
  output O1,
  output O2,
  output O3,
  output O4,

  input CLRB_LEAF,
  input I
);

// define constants
  localparam MODULE_NAME = "MBUFG_HM";
  
// Parameter encodings and registers
  localparam MODE_PERFORMANCE = 0;
  localparam MODE_POWER = 1;
  localparam STARTUP_SYNC_FALSE = 1;
  localparam STARTUP_SYNC_TRUE = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "MBUFG_HM_dr.v"
`else
  reg [88:1] MODE_REG = MODE;
  reg [40:1] STARTUP_SYNC_REG = STARTUP_SYNC;
`endif

`ifdef XIL_XECLIB
  wire MODE_BIN;
  wire STARTUP_SYNC_BIN;
`else
  reg MODE_BIN;
  reg STARTUP_SYNC_BIN;
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
  assign MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
  assign STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
       STARTUP_SYNC_TRUE;
  
`else
  always @ (trig_attr) begin
  #1;
  MODE_BIN =
      (MODE_REG == "PERFORMANCE") ? MODE_PERFORMANCE :
      (MODE_REG == "POWER") ? MODE_POWER :
       MODE_PERFORMANCE;
  
  STARTUP_SYNC_BIN =
      (STARTUP_SYNC_REG == "TRUE") ? STARTUP_SYNC_TRUE :
      (STARTUP_SYNC_REG == "FALSE") ? STARTUP_SYNC_FALSE :
       STARTUP_SYNC_TRUE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((MODE_REG != "PERFORMANCE") &&
         (MODE_REG != "POWER"))) begin
      $display("Error: [Unisim %s-101] MODE attribute is set to %s.  Legal values for this attribute are PERFORMANCE or POWER. Instance: %m", MODULE_NAME, MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((STARTUP_SYNC_REG != "TRUE") &&
         (STARTUP_SYNC_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-102] STARTUP_SYNC attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, STARTUP_SYNC_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  // begin timing section
  specify
    (I => O1) = (0:0:0, 0:0:0);
    (I => O2) = (0:0:0, 0:0:0);
    (I => O3) = (0:0:0, 0:0:0);
    (I => O4) = (0:0:0, 0:0:0);
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
`endif
endmodule

`endcelldefine
