///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Retarget Simulation Library Component
//  /   /                        General Clock Buffer with Clock Enable and Output State 1
// /___/   /\     Filename : BUFGCE_1.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
// Revision:
//    06/24/10 - Initial version
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

module BUFGCE_1 #(
parameter SIM_DEVICE = "ULTRASCALE"
)(
  output O,

  input CE,
  input I
);

// define constants
  localparam MODULE_NAME = "BUFGCE_1";

  wire CE_in;
  wire I_in;
    
  assign CE_in = (CE !== 1'bz) && CE; // rv 0
  assign I_in = I;

// begin behavioral model
BUFGCTRL #(.SIM_DEVICE(SIM_DEVICE), .INIT_OUT(1'b1), .PRESELECT_I0("TRUE"), .PRESELECT_I1("FALSE")) B0 (.O(O), .CE0(CE_in), .CE1(1'b0), .I0(I_in), .I1(1'b1), .IGNORE0(1'b0), .IGNORE1(1'b1), .S0(1'b1), .S1(1'b0));

// end behavioral model

endmodule
