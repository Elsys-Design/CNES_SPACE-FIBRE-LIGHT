///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2017 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        BUFG_LB
// /___/   /\      Filename    : BUFG_LB.v
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

module BUFG_LB
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output CLKOUT,

  input CLKIN
);

// define constants
  localparam MODULE_NAME = "BUFG_LB";
  
  tri0 glblGSR = glbl.GSR;

// begin behavioral model

    initial begin
   $display ("ERROR : Component %s instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the HDL Libraries Guide(s) available on www.xilinx.com.",MODULE_NAME);
   #1 $finish;
    end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (CLKIN => CLKOUT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
