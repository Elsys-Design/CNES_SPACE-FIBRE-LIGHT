///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_PL_S_AXIS64
// /___/   /\      Filename    : AIE_PL_S_AXIS64.v
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

module AIE_PL_S_AXIS64
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output S_AXIS_TREADY,
  output TO_AIE,

  input S_AXIS_ACLK,
  input [63:0] S_AXIS_TDATA,
  input S_AXIS_TKEEP,
  input S_AXIS_TLAST,
  input S_AXIS_TVALID
);

// define constants
  localparam MODULE_NAME = "AIE_PL_S_AXIS64";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire S_AXIS_ACLK_in;
  wire S_AXIS_TKEEP_in;
  wire S_AXIS_TLAST_in;
  wire S_AXIS_TVALID_in;
  wire [63:0] S_AXIS_TDATA_in;

`ifdef XIL_TIMING
  wire S_AXIS_ACLK_delay;
  wire S_AXIS_TKEEP_delay;
  wire S_AXIS_TLAST_delay;
  wire S_AXIS_TVALID_delay;
  wire [63:0] S_AXIS_TDATA_delay;
`endif

`ifdef XIL_TIMING
  assign S_AXIS_ACLK_in = S_AXIS_ACLK_delay;
  assign S_AXIS_TDATA_in = S_AXIS_TDATA_delay;
  assign S_AXIS_TKEEP_in = S_AXIS_TKEEP_delay;
  assign S_AXIS_TLAST_in = S_AXIS_TLAST_delay;
  assign S_AXIS_TVALID_in = S_AXIS_TVALID_delay;
`else
  assign S_AXIS_ACLK_in = S_AXIS_ACLK;
  assign S_AXIS_TDATA_in = S_AXIS_TDATA;
  assign S_AXIS_TKEEP_in = S_AXIS_TKEEP;
  assign S_AXIS_TLAST_in = S_AXIS_TLAST;
  assign S_AXIS_TVALID_in = S_AXIS_TVALID;
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

// end behavioral model

`ifndef XIL_XECLIB
  specify
    (S_AXIS_ACLK => S_AXIS_TREADY) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge S_AXIS_ACLK, 0:0:0, notifier);
    $period (posedge S_AXIS_ACLK, 0:0:0, notifier);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[0], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[0]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[10], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[10]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[11], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[11]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[12], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[12]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[13], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[13]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[14], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[14]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[15], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[15]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[16], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[16]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[17], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[17]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[18], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[18]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[19], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[19]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[1], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[1]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[20], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[20]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[21], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[21]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[22], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[22]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[23], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[23]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[24], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[24]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[25], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[25]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[26], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[26]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[27], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[27]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[28], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[28]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[29], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[29]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[2], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[2]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[30], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[30]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[31], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[31]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[32], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[32]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[33], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[33]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[34], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[34]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[35], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[35]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[36], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[36]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[37], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[37]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[38], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[38]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[39], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[39]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[3], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[3]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[40], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[40]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[41], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[41]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[42], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[42]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[43], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[43]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[44], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[44]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[45], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[45]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[46], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[46]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[47], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[47]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[48], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[48]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[49], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[49]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[4], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[4]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[50], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[50]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[51], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[51]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[52], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[52]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[53], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[53]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[54], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[54]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[55], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[55]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[56], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[56]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[57], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[57]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[58], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[58]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[59], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[59]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[5], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[5]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[60], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[60]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[61], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[61]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[62], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[62]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[63], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[63]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[6], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[6]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[7], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[7]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[8], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[8]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TDATA[9], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[9]);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TKEEP, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TKEEP_delay);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TLAST, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TLAST_delay);
    $setuphold (posedge S_AXIS_ACLK, negedge S_AXIS_TVALID, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TVALID_delay);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[0], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[0]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[10], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[10]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[11], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[11]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[12], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[12]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[13], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[13]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[14], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[14]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[15], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[15]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[16], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[16]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[17], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[17]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[18], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[18]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[19], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[19]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[1], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[1]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[20], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[20]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[21], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[21]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[22], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[22]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[23], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[23]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[24], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[24]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[25], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[25]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[26], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[26]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[27], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[27]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[28], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[28]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[29], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[29]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[2], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[2]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[30], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[30]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[31], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[31]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[32], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[32]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[33], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[33]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[34], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[34]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[35], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[35]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[36], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[36]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[37], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[37]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[38], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[38]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[39], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[39]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[3], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[3]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[40], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[40]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[41], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[41]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[42], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[42]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[43], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[43]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[44], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[44]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[45], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[45]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[46], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[46]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[47], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[47]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[48], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[48]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[49], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[49]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[4], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[4]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[50], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[50]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[51], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[51]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[52], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[52]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[53], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[53]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[54], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[54]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[55], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[55]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[56], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[56]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[57], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[57]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[58], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[58]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[59], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[59]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[5], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[5]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[60], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[60]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[61], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[61]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[62], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[62]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[63], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[63]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[6], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[6]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[7], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[7]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[8], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[8]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TDATA[9], 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TDATA_delay[9]);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TKEEP, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TKEEP_delay);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TLAST, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TLAST_delay);
    $setuphold (posedge S_AXIS_ACLK, posedge S_AXIS_TVALID, 0:0:0, 0:0:0, notifier, , , S_AXIS_ACLK_delay, S_AXIS_TVALID_delay);
    $width (negedge S_AXIS_ACLK, 0:0:0, 0, notifier);
    $width (posedge S_AXIS_ACLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
