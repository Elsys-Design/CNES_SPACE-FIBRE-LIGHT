///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        AIE_NOC_S_AXI
// /___/   /\      Filename    : AIE_NOC_S_AXI.v
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

module AIE_NOC_S_AXI
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output S_AXI_ACLK,
  output S_AXI_ARREADY,
  output S_AXI_AWREADY,
  output [1:0] S_AXI_BID,
  output [1:0] S_AXI_BRESP,
  output [15:0] S_AXI_BUSER,
  output S_AXI_BVALID,
  output [127:0] S_AXI_RDATA,
  output [1:0] S_AXI_RID,
  output [0:0] S_AXI_RLAST,
  output [1:0] S_AXI_RRESP,
  output [16:0] S_AXI_RUSER,
  output S_AXI_RVALID,
  output S_AXI_WREADY,
  output TO_AIE_2,
  output TO_AIE_3,
  output TO_AIE_6,
  output TO_AIE_7,

  input FROM_NOC,
  input [63:0] S_AXI_ARADDR,
  input [1:0] S_AXI_ARBURST,
  input [3:0] S_AXI_ARCACHE,
  input [1:0] S_AXI_ARID,
  input [7:0] S_AXI_ARLEN,
  input [0:0] S_AXI_ARLOCK,
  input [2:0] S_AXI_ARPROT,
  input [3:0] S_AXI_ARQOS,
  input [3:0] S_AXI_ARREGION,
  input [2:0] S_AXI_ARSIZE,
  input [17:0] S_AXI_ARUSER,
  input S_AXI_ARVALID,
  input [63:0] S_AXI_AWADDR,
  input [1:0] S_AXI_AWBURST,
  input [3:0] S_AXI_AWCACHE,
  input [1:0] S_AXI_AWID,
  input [7:0] S_AXI_AWLEN,
  input [0:0] S_AXI_AWLOCK,
  input [2:0] S_AXI_AWPROT,
  input [3:0] S_AXI_AWQOS,
  input [3:0] S_AXI_AWREGION,
  input [2:0] S_AXI_AWSIZE,
  input [17:0] S_AXI_AWUSER,
  input S_AXI_AWVALID,
  input S_AXI_BREADY,
  input S_AXI_RREADY,
  input [9:0] S_AXI_TDEST,
  input [127:0] S_AXI_WDATA,
  input [5:0] S_AXI_WID,
  input [0:0] S_AXI_WLAST,
  input [15:0] S_AXI_WSTRB,
  input [16:0] S_AXI_WUSER,
  input S_AXI_WVALID
);

// define constants
  localparam MODULE_NAME = "AIE_NOC_S_AXI";
  
`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
