///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2022 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PHIO_DCCINVBUF
// /___/   /\      Filename    : X5PHIO_DCCINVBUF.v
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

module X5PHIO_DCCINVBUF
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output ZN,

  input A,
  input [3:0] OVERRIDE_CODE,
  input OVERRIDE_SEL
);

// define constants
  localparam MODULE_NAME = "X5PHIO_DCCINVBUF";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

assign ZN = ~A;

// end behavioral model

endmodule

`endcelldefine
