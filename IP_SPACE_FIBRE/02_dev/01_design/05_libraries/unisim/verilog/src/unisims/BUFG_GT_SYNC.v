///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        Synchronizer for BUFG_GT Control Signals
// /___/   /\      Filename    : BUFG_GT_SYNC.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    02/03/14 - Initial version.
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module BUFG_GT_SYNC
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output CESYNC,
  output CLRSYNC,

  input CE,
  input CLK,
  input CLR
);
  
// define constants
  localparam MODULE_NAME = "BUFG_GT_SYNC";
  
`ifdef XIL_XECLIB
  reg glblGRESTORE = 1'b0;
`else
  tri0 glblGRESTORE = glbl.GRESTORE;
`endif
  
  wire CE_in;
  wire CLK_in;
  wire CLR_in;

  assign CE_in  = (CE === 1'bz) || CE;  // rv 1
  assign CLK_in = CLK;
  assign CLR_in = (CLR !== 1'bz) && CLR; // rv 0

// begin behavioral model
  reg  [1:0]    clr_sync=2'b11;
  reg  [1:0]    ce_sync =2'b00;

  always @(posedge CLK_in or posedge CLR_in) begin
    if(CLR_in)
      clr_sync <= 2'b11;
    else
      clr_sync <= {clr_sync[0],CLR_in};
  end

  always @(posedge CLK_in or posedge glblGRESTORE) begin
    if(glblGRESTORE)
      ce_sync <= 2'd0;
    else 
      ce_sync <= {ce_sync[0], CE_in};
  end

  assign CESYNC  = ce_sync [1];
  assign CLRSYNC = clr_sync[1];

// end behavioral model

endmodule

`endcelldefine
