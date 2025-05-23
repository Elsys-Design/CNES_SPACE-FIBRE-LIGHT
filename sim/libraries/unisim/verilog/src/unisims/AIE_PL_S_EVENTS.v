///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_PL_S_EVENTS
// /___/   /\      Filename    : AIE_PL_S_EVENTS.v
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

module AIE_PL_S_EVENTS
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  input CLK,
  input [15:0] TRIG
);

// define constants
  localparam MODULE_NAME = "AIE_PL_S_EVENTS";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CLK_in;
  wire [15:0] TRIG_in;

`ifdef XIL_TIMING
  wire CLK_delay;
  wire [15:0] TRIG_delay;
`endif

`ifdef XIL_TIMING
  assign CLK_in = CLK_delay;
  assign TRIG_in = TRIG_delay;
`else
  assign CLK_in = CLK;
  assign TRIG_in = TRIG;
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $setuphold (posedge CLK, negedge TRIG[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[0]);
    $setuphold (posedge CLK, negedge TRIG[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[10]);
    $setuphold (posedge CLK, negedge TRIG[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[11]);
    $setuphold (posedge CLK, negedge TRIG[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[12]);
    $setuphold (posedge CLK, negedge TRIG[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[13]);
    $setuphold (posedge CLK, negedge TRIG[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[14]);
    $setuphold (posedge CLK, negedge TRIG[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[15]);
    $setuphold (posedge CLK, negedge TRIG[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[1]);
    $setuphold (posedge CLK, negedge TRIG[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[2]);
    $setuphold (posedge CLK, negedge TRIG[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[3]);
    $setuphold (posedge CLK, negedge TRIG[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[4]);
    $setuphold (posedge CLK, negedge TRIG[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[5]);
    $setuphold (posedge CLK, negedge TRIG[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[6]);
    $setuphold (posedge CLK, negedge TRIG[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[7]);
    $setuphold (posedge CLK, negedge TRIG[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[8]);
    $setuphold (posedge CLK, negedge TRIG[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[9]);
    $setuphold (posedge CLK, posedge TRIG[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[0]);
    $setuphold (posedge CLK, posedge TRIG[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[10]);
    $setuphold (posedge CLK, posedge TRIG[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[11]);
    $setuphold (posedge CLK, posedge TRIG[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[12]);
    $setuphold (posedge CLK, posedge TRIG[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[13]);
    $setuphold (posedge CLK, posedge TRIG[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[14]);
    $setuphold (posedge CLK, posedge TRIG[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[15]);
    $setuphold (posedge CLK, posedge TRIG[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[1]);
    $setuphold (posedge CLK, posedge TRIG[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[2]);
    $setuphold (posedge CLK, posedge TRIG[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[3]);
    $setuphold (posedge CLK, posedge TRIG[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[4]);
    $setuphold (posedge CLK, posedge TRIG[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[5]);
    $setuphold (posedge CLK, posedge TRIG[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[6]);
    $setuphold (posedge CLK, posedge TRIG[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[7]);
    $setuphold (posedge CLK, posedge TRIG[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[8]);
    $setuphold (posedge CLK, posedge TRIG[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, TRIG_delay[9]);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
