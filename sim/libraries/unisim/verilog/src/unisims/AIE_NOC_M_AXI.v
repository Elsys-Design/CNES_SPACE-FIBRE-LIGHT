///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_NOC_M_AXI
// /___/   /\      Filename    : AIE_NOC_M_AXI.v
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

module AIE_NOC_M_AXI
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [11:0] DESTID_RD,
  output [11:0] DESTID_WR,
  output DESTMODE_RD,
  output DESTMODE_WR,
  output M_AXI_ACLK,
  output [63:0] M_AXI_ARADDR,
  output [1:0] M_AXI_ARBURST,
  output [3:0] M_AXI_ARCACHE,
  output [15:0] M_AXI_ARID,
  output [7:0] M_AXI_ARLEN,
  output [0:0] M_AXI_ARLOCK,
  output [2:0] M_AXI_ARPROT,
  output [3:0] M_AXI_ARQOS,
  output [3:0] M_AXI_ARREGION,
  output [2:0] M_AXI_ARSIZE,
  output [17:0] M_AXI_ARUSER,
  output M_AXI_ARVALID,
  output [63:0] M_AXI_AWADDR,
  output [1:0] M_AXI_AWBURST,
  output [3:0] M_AXI_AWCACHE,
  output [15:0] M_AXI_AWID,
  output [7:0] M_AXI_AWLEN,
  output [0:0] M_AXI_AWLOCK,
  output [2:0] M_AXI_AWPROT,
  output [3:0] M_AXI_AWQOS,
  output [3:0] M_AXI_AWREGION,
  output [2:0] M_AXI_AWSIZE,
  output [17:0] M_AXI_AWUSER,
  output M_AXI_AWVALID,
  output M_AXI_BREADY,
  output M_AXI_RREADY,
  output [9:0] M_AXI_TDEST,
  output [127:0] M_AXI_WDATA,
  output [5:0] M_AXI_WID,
  output [0:0] M_AXI_WLAST,
  output [15:0] M_AXI_WSTRB,
  output [16:0] M_AXI_WUSER,
  output M_AXI_WVALID,
  output TO_NOC,

  input FROM_AIE_2,
  input FROM_AIE_3,
  input FROM_AIE_4,
  input FROM_AIE_5,
  input M_AXI_ARREADY,
  input M_AXI_AWREADY,
  input [15:0] M_AXI_BID,
  input [1:0] M_AXI_BRESP,
  input [15:0] M_AXI_BUSER,
  input M_AXI_BVALID,
  input [127:0] M_AXI_RDATA,
  input [15:0] M_AXI_RID,
  input [0:0] M_AXI_RLAST,
  input [1:0] M_AXI_RRESP,
  input [16:0] M_AXI_RUSER,
  input M_AXI_RVALID,
  input M_AXI_WREADY
);

// define constants
  localparam MODULE_NAME = "AIE_NOC_M_AXI";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
