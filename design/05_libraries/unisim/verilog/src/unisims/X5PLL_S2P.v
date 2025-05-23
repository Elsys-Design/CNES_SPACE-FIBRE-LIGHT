///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2022 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PLL_S2P
// /___/   /\      Filename    : X5PLL_S2P.v
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

module X5PLL_S2P
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [7:0] RIU_ADDR,
  output RIU_CLK,
  output RIU_NIBBLE_SEL,
  output RIU_WREN,
  output [15:0] RIU_WR_DATA,
  output XCV2RIU_CK,
  output [3:0] XCV2RIU_RD,

  input RIU2XCV_CA,
  input RIU2XCV_CK,
  input RIU2XCV_WR,
  input [15:0] RIU_RDATA,
  input RIU_RST
);

// define constants
  localparam MODULE_NAME = "X5PLL_S2P";
  
    reg [0:0] APBCLK_FREQ_REG = 1'b0;

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire RIU_CLK_out;
  wire RIU_NIBBLE_SEL_out;
  wire RIU_WREN_out;
  wire XCV2RIU_CK_out;
  wire [15:0] RIU_WR_DATA_out;
  wire [3:0] XCV2RIU_RD_out;
  wire [7:0] RIU_ADDR_out;

  wire RIU2XCV_CA_in;
  wire RIU2XCV_CK_in;
  wire RIU2XCV_WR_in;
  wire RIU_RST_in;
  wire [15:0] RIU_RDATA_in;

  assign RIU_ADDR = RIU_ADDR_out;
  assign RIU_CLK = RIU_CLK_out;
  assign RIU_NIBBLE_SEL = RIU_NIBBLE_SEL_out;
  assign RIU_WREN = RIU_WREN_out;
  assign RIU_WR_DATA = RIU_WR_DATA_out;
  assign XCV2RIU_CK = XCV2RIU_CK_out;
  assign XCV2RIU_RD = XCV2RIU_RD_out;

  assign RIU2XCV_CA_in = RIU2XCV_CA;
  assign RIU2XCV_CK_in = RIU2XCV_CK;
  assign RIU2XCV_WR_in = RIU2XCV_WR;
  assign RIU_RDATA_in = RIU_RDATA;
  assign RIU_RST_in = RIU_RST;




    SIP_X5PLL_S2P SIP_X5PLL_S2P_INST (
      //.APBCLK_FREQ (APBCLK_FREQ_REG),
      .RIU_ADDR (RIU_ADDR_out),
      .RIU_CLK (RIU_CLK_out),
      .RIU_NIBBLE_SEL (RIU_NIBBLE_SEL_out),
      .RIU_WREN (RIU_WREN_out),
      .RIU_WR_DATA (RIU_WR_DATA_out),
      .XCV2RIU_CK (XCV2RIU_CK_out),
      .XCV2RIU_RD (XCV2RIU_RD_out),
      .RIU2XCV_CA (RIU2XCV_CA_in),
      .RIU2XCV_CK (RIU2XCV_CK_in),
      .RIU2XCV_WR (RIU2XCV_WR_in),
      .RIU_RDATA (RIU_RDATA_in),
      .RIU_RST (RIU_RST_in)
      //.GSR (glblGSR)
    );

endmodule

`endcelldefine
