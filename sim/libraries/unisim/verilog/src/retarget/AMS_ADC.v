///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2019.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AMS_ADC
// /___/   /\      Filename    : AMS_ADC.v
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

module AMS_ADC
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output CLKOUT,
  output [63:0] DATAOUTI,
  output [63:0] DATAOUTQ,
  output [15:0] SPAREOUT
);

// define constants
  localparam MODULE_NAME = "AMS_ADC";
  

// begin behavioral model

  initial begin
   $display ("ERROR : Component %s instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the HDL Libraries Guide(s) available on www.xilinx.com.",MODULE_NAME);
   #1 $finish;
  end

// end behavioral model

endmodule

`endcelldefine
