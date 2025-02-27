///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Retarget Simulation Library Component
//  /   /             2-input AND Gate
// /___/   /\     Filename : AND2.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//    02/27/09 - Initial version
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps


module AND2
(
  output O,

  input I0,
  input I1
);

// define constants
  localparam MODULE_NAME = "AND2";
  
// begin behavioral model

    LUT2 #(.INIT(4'h8)) L2 (O, I0, I1);

// end behavioral model

endmodule
