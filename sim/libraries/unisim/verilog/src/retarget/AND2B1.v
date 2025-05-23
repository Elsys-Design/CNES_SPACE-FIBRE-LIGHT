///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Retarget Simulation Library Component
//  /   /             2-input AND Gate
// /___/   /\     Filename : AND2B1.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    02/27/09 - Initial version
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps


module AND2B1
(
  output O,

  input I0,
  input I1
);

// define constants
  localparam MODULE_NAME = "AND2B1";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

    LUT2 #(.INIT(4'h4)) L2 (O, I0, I1);

// end behavioral model

endmodule
