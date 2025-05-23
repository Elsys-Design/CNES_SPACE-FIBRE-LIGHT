///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        NPI_NIR
// /___/   /\      Filename    : NPI_NIR.v
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

module NPI_NIR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [22:0] REG_CNTL = 23'h400002,
  parameter [2:0] REG_SRVC = 3'h0,
  parameter [29:0] REG_TIMEBASE_SEL = 30'h398B2310
)(
  output IF_NPI_AXI_ARREADY,
  output IF_NPI_AXI_AWREADY,
  output [15:0] IF_NPI_AXI_BID,
  output [1:0] IF_NPI_AXI_BRESP,
  output [15:0] IF_NPI_AXI_BUSER,
  output IF_NPI_AXI_BVALID,
  output [31:0] IF_NPI_AXI_RDATA,
  output [15:0] IF_NPI_AXI_RID,
  output [0:0] IF_NPI_AXI_RLAST,
  output [1:0] IF_NPI_AXI_RRESP,
  output [15:0] IF_NPI_AXI_RUSER,
  output IF_NPI_AXI_RVALID,
  output IF_NPI_AXI_WREADY,
  output [23:0] NPI_INTERRUPT_OUT,

  input [63:0] IF_NPI_AXI_ARADDR,
  input [1:0] IF_NPI_AXI_ARBURST,
  input [3:0] IF_NPI_AXI_ARCACHE,
  input [15:0] IF_NPI_AXI_ARID,
  input [7:0] IF_NPI_AXI_ARLEN,
  input [0:0] IF_NPI_AXI_ARLOCK,
  input [2:0] IF_NPI_AXI_ARPROT,
  input [3:0] IF_NPI_AXI_ARQOS,
  input [3:0] IF_NPI_AXI_ARREGION,
  input [2:0] IF_NPI_AXI_ARSIZE,
  input [15:0] IF_NPI_AXI_ARUSER,
  input IF_NPI_AXI_ARVALID,
  input [63:0] IF_NPI_AXI_AWADDR,
  input [1:0] IF_NPI_AXI_AWBURST,
  input [3:0] IF_NPI_AXI_AWCACHE,
  input [15:0] IF_NPI_AXI_AWID,
  input [7:0] IF_NPI_AXI_AWLEN,
  input [0:0] IF_NPI_AXI_AWLOCK,
  input [2:0] IF_NPI_AXI_AWPROT,
  input [3:0] IF_NPI_AXI_AWQOS,
  input [3:0] IF_NPI_AXI_AWREGION,
  input [2:0] IF_NPI_AXI_AWSIZE,
  input [15:0] IF_NPI_AXI_AWUSER,
  input IF_NPI_AXI_AWVALID,
  input IF_NPI_AXI_BREADY,
  input IF_NPI_AXI_RREADY,
  input [31:0] IF_NPI_AXI_WDATA,
  input [15:0] IF_NPI_AXI_WID,
  input [0:0] IF_NPI_AXI_WLAST,
  input [3:0] IF_NPI_AXI_WSTRB,
  input [15:0] IF_NPI_AXI_WUSER,
  input IF_NPI_AXI_WVALID,
  input NPI_CLK,
  input NPI_RST_N,
  input PMC_CLK
);

// define constants
  localparam MODULE_NAME = "NPI_NIR";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "NPI_NIR_dr.v"
`else
  reg [22:0] REG_CNTL_REG = REG_CNTL;
  reg [2:0] REG_SRVC_REG = REG_SRVC;
  reg [29:0] REG_TIMEBASE_SEL_REG = REG_TIMEBASE_SEL;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

`ifndef XIL_XECLIB
  initial begin
  trig_attr = 1'b0;
  #1;
  trig_attr = ~trig_attr;
end
`endif

// begin behavioral model

// end behavioral model

endmodule

`endcelldefine
