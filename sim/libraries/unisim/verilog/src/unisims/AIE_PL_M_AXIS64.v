///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_PL_M_AXIS64
// /___/   /\      Filename    : AIE_PL_M_AXIS64.v
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

module AIE_PL_M_AXIS64
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [63:0] M_AXIS_TDATA,
  output M_AXIS_TKEEP,
  output M_AXIS_TLAST,
  output M_AXIS_TVALID,

  input FROM_AIE,
  input M_AXIS_ACLK,
  input M_AXIS_TREADY
);

// define constants
  localparam MODULE_NAME = "AIE_PL_M_AXIS64";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire FROM_AIE_in;
  wire M_AXIS_ACLK_in;
  wire M_AXIS_TREADY_in;

`ifdef XIL_TIMING
  wire M_AXIS_ACLK_delay;
  wire M_AXIS_TREADY_delay;
`endif

`ifdef XIL_TIMING
  assign M_AXIS_ACLK_in = M_AXIS_ACLK_delay;
  assign M_AXIS_TREADY_in = M_AXIS_TREADY_delay;
`else
  assign M_AXIS_ACLK_in = M_AXIS_ACLK;
  assign M_AXIS_TREADY_in = M_AXIS_TREADY;
`endif

  assign FROM_AIE_in = FROM_AIE;

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (M_AXIS_ACLK => M_AXIS_TDATA[0]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[10]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[11]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[12]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[13]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[14]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[15]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[16]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[17]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[18]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[19]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[1]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[20]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[21]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[22]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[23]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[24]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[25]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[26]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[27]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[28]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[29]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[2]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[30]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[31]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[32]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[33]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[34]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[35]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[36]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[37]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[38]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[39]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[3]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[40]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[41]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[42]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[43]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[44]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[45]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[46]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[47]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[48]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[49]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[4]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[50]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[51]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[52]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[53]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[54]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[55]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[56]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[57]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[58]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[59]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[5]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[60]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[61]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[62]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[63]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[6]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[7]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[8]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TDATA[9]) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TKEEP) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TLAST) = (100:100:100, 100:100:100);
    (M_AXIS_ACLK => M_AXIS_TVALID) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge M_AXIS_ACLK, 0:0:0, notifier);
    $period (posedge M_AXIS_ACLK, 0:0:0, notifier);
    $setuphold (posedge M_AXIS_ACLK, negedge M_AXIS_TREADY, 0:0:0, 0:0:0, notifier, , , M_AXIS_ACLK_delay, M_AXIS_TREADY_delay);
    $setuphold (posedge M_AXIS_ACLK, posedge M_AXIS_TREADY, 0:0:0, 0:0:0, notifier, , , M_AXIS_ACLK_delay, M_AXIS_TREADY_delay);
    $width (negedge M_AXIS_ACLK, 0:0:0, 0, notifier);
    $width (posedge M_AXIS_ACLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
