///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2024 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2024.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PLL_INTF
// /___/   /\      Filename    : X5PLL_INTF.v
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

module X5PLL_INTF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer APBCLK_FREQ = 100,
  parameter DESKEW_SEL = "FALSE",
  parameter DMC_APB_SEL_XPLL = "FALSE",
  parameter DMC_PD_SEL = "FALSE",
  parameter RIUCLK_DBLR_BYPASS = "FALSE",
  parameter [2:0] RIU_CLK_DBL_DCC_XPLL = 3'b000
)(
  output APB2PLL_CA,
  output APB2PLL_CK,
  output APB2PLL_PSCLK,
  output APB2PLL_PSEN,
  output APB2PLL_PSINCDEC,
  output APB2PLL_RST,
  output APB2PLL_WR,
  output [15:0] PRDATA,
  output PREADY,
  output PSDONE,
  output PSLVERR,

  input [9:0] PADDR,
  input PCLK,
  input PENABLE,
  input PLL2APB_CK,
  input PLL2APB_PSDONE,
  input [3:0] PLL2APB_RD,
  input PRESETN,
  input PSCLK,
  input PSEL,
  input PSEN,
  input PSINCDEC,
  input [15:0] PWDATA,
  input PWRITE
);

// define constants
  localparam MODULE_NAME = "X5PLL_INTF";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "X5PLL_INTF_dr.v"
`else
  reg [8:0] APBCLK_FREQ_REG = APBCLK_FREQ;
  reg [40:1] DESKEW_SEL_REG = DESKEW_SEL;
  reg [40:1] DMC_APB_SEL_XPLL_REG = DMC_APB_SEL_XPLL;
  reg [40:1] DMC_PD_SEL_REG = DMC_PD_SEL;
  reg [40:1] RIUCLK_DBLR_BYPASS_REG = RIUCLK_DBLR_BYPASS;
  reg [2:0] RIU_CLK_DBL_DCC_XPLL_REG = RIU_CLK_DBL_DCC_XPLL;
`endif

  reg [40:1] TEST_MCT_XPLL_REG = "FALSE";

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire APB2PLL_CA_out;
  wire APB2PLL_CK_out;
  wire APB2PLL_PSCLK_out;
  wire APB2PLL_PSEN_out;
  wire APB2PLL_PSINCDEC_out;
  wire APB2PLL_RST_out;
  wire APB2PLL_WR_out;
  wire CLB_PREADY_out;
  wire CLB_PSLVERR_out;
  wire DMC_PREADY_out;
  wire DMC_PSLVERR_out;
  wire FABRIC_PSDONE_out;
  wire MUX2APB_PCLK_XPLL_out;
  wire PREADY_out;
  wire PSDONE_out;
  wire PSLVERR_out;
  wire [15:0] CLB_PRDATA_out;
  wire [15:0] DMC_PRDATA_out;
  wire [15:0] PRDATA_out;

  wire CLB_PCLK_in;
  wire CLB_PENABLE_in;
  wire CLB_PRESETN_in;
  wire CLB_PSEL_in;
  wire CLB_PWRITE_in;
  wire DFX_SCAN_EN_in;
  wire DFX_SCAN_MODE_RST_N_in;
  wire DFX_SCAN_MODE_in;
  wire DFX_SCAN_RST_BYP_in;
  wire DMC_PCLK_in;
  wire DMC_PD_in;
  wire DMC_PENABLE_in;
  wire DMC_PRESETN_in;
  wire DMC_PSEL_in;
  wire DMC_PWRITE_in;
  wire FABRIC_PSCLK_in;
  wire FABRIC_PSEN_in;
  wire FABRIC_PSINCDEC_in;
  wire PCLK_in;
  wire PENABLE_in;
  wire PLL2APB_CK_in;
  wire PLL2APB_PSDONE_in;
  wire PRESETN_in;
  wire PSCLK_in;
  wire PSEL_in;
  wire PSEN_in;
  wire PSINCDEC_in;
  wire PWRITE_in;
  wire SCAN_EN_in;
  wire SCAN_MODE_RST_B_in;
  wire SCAN_MODE_in;
  wire SCAN_RST_BYP_in;
  wire [15:0] CLB_PWDATA_in;
  wire [15:0] DMC_PWDATA_in;
  wire [15:0] PWDATA_in;
  wire [3:0] PLL2APB_RD_in;
  wire [9:0] CLB_PADDR_in;
  wire [9:0] DMC_PADDR_in;
  wire [9:0] PADDR_in;

`ifdef XIL_TIMING
  wire PCLK_delay;
  wire PENABLE_delay;
  wire PRESETN_delay;
  wire PSCLK_delay;
  wire PSEL_delay;
  wire PSEN_delay;
  wire PSINCDEC_delay;
  wire PWRITE_delay;
  wire [15:0] PWDATA_delay;
  wire [9:0] PADDR_delay;
`endif

  assign APB2PLL_CA = APB2PLL_CA_out;
  assign APB2PLL_CK = APB2PLL_CK_out;
  assign APB2PLL_PSCLK = APB2PLL_PSCLK_out;
  assign APB2PLL_PSEN = APB2PLL_PSEN_out;
  assign APB2PLL_PSINCDEC = APB2PLL_PSINCDEC_out;
  assign APB2PLL_RST = APB2PLL_RST_out;
  assign APB2PLL_WR = APB2PLL_WR_out;
  assign PRDATA = PRDATA_out;
  assign PREADY = PREADY_out;
  assign PSLVERR = PSLVERR_out;
  
  assign PSDONE = PSDONE_out;

`ifdef XIL_TIMING
  assign PADDR_in = PADDR_delay;
  assign PCLK_in = PCLK_delay;
  assign PENABLE_in = PENABLE_delay;
  assign PRESETN_in = PRESETN_delay;
  assign PSCLK_in = PSCLK_delay;
  assign PSEL_in = PSEL_delay;
  assign PSEN_in = PSEN_delay;
  assign PSINCDEC_in = PSINCDEC_delay;
  assign PWDATA_in = PWDATA_delay;
  assign PWRITE_in = PWRITE_delay;
`else
  assign PADDR_in = PADDR;
  assign PCLK_in = PCLK;
  assign PENABLE_in = PENABLE;
  assign PRESETN_in = PRESETN;
  assign PSCLK_in = PSCLK;
  assign PSEL_in = PSEL;
  assign PSEN_in = PSEN;
  assign PSINCDEC_in = PSINCDEC;
  assign PWDATA_in = PWDATA;
  assign PWRITE_in = PWRITE;
`endif

  assign PLL2APB_CK_in = PLL2APB_CK;
  assign PLL2APB_PSDONE_in = PLL2APB_PSDONE;
  assign PLL2APB_RD_in = PLL2APB_RD;

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((APBCLK_FREQ_REG < 0) || (APBCLK_FREQ_REG > 500))) begin
      $display("Error: [Unisim %s-101] APBCLK_FREQ attribute is set to %d.  Legal values for this attribute are 0 to 500. Instance: %m", MODULE_NAME, APBCLK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DESKEW_SEL_REG != "FALSE") &&
         (DESKEW_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DESKEW_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DESKEW_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_APB_SEL_XPLL_REG != "FALSE") &&
         (DMC_APB_SEL_XPLL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] DMC_APB_SEL_XPLL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_APB_SEL_XPLL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_PD_SEL_REG != "FALSE") &&
         (DMC_PD_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] DMC_PD_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_PD_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RIUCLK_DBLR_BYPASS_REG != "FALSE") &&
         (RIUCLK_DBLR_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-105] RIUCLK_DBLR_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RIUCLK_DBLR_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign CLB_PCLK_in = 1'b1; // tie off
assign DMC_PCLK_in = 1'b1; // tie off
assign FABRIC_PSCLK_in = 1'b1; // tie off

assign CLB_PADDR_in = 10'b1111111111; // tie off
assign CLB_PENABLE_in = 1'b1; // tie off
assign CLB_PRESETN_in = 1'b1; // tie off
assign CLB_PSEL_in = 1'b1; // tie off
assign CLB_PWDATA_in = 16'b1111111111111111; // tie off
assign CLB_PWRITE_in = 1'b1; // tie off
assign DFX_SCAN_EN_in = 1'b0; // tie off
assign DFX_SCAN_MODE_RST_N_in = 1'b1; // tie off
assign DFX_SCAN_MODE_in = 1'b0; // tie off
assign DFX_SCAN_RST_BYP_in = 1'b0; // tie off
assign DMC_PADDR_in = 10'b1111111111; // tie off
assign DMC_PD_in = 1'b1; // tie off
assign DMC_PENABLE_in = 1'b1; // tie off
assign DMC_PRESETN_in = 1'b1; // tie off
assign DMC_PSEL_in = 1'b1; // tie off
assign DMC_PWDATA_in = 16'b1111111111111111; // tie off
assign DMC_PWRITE_in = 1'b1; // tie off
assign FABRIC_PSEN_in = 1'b1; // tie off
assign FABRIC_PSINCDEC_in = 1'b1; // tie off
assign SCAN_EN_in = 1'b0; // tie off
assign SCAN_MODE_RST_B_in = 1'b1; // tie off
assign SCAN_MODE_in = 1'b0; // tie off
assign SCAN_RST_BYP_in = 1'b0; // tie off

  SIP_X5PLL_INTF SIP_X5PLL_INTF_INST (
    //.APBCLK_FREQ (APBCLK_FREQ_REG),
    .DESKEW_SEL (DESKEW_SEL_REG),
    .DMC_APB_SEL_XPLL (DMC_APB_SEL_XPLL_REG),
    .DMC_PD_SEL (DMC_PD_SEL_REG),
    .RIUCLK_DBLR_BYPASS (RIUCLK_DBLR_BYPASS_REG),
    .RIU_CLK_DBL_DCC_XPLL (RIU_CLK_DBL_DCC_XPLL_REG),
    .TEST_MCT_XPLL (TEST_MCT_XPLL_REG),
    .APB2PLL_CA (APB2PLL_CA_out),
    .APB2PLL_CK (APB2PLL_CK_out),
    .APB2PLL_PSCLK (APB2PLL_PSCLK_out),
    .APB2PLL_PSEN (APB2PLL_PSEN_out),
    .APB2PLL_PSINCDEC (APB2PLL_PSINCDEC_out),
    .APB2PLL_RST (APB2PLL_RST_out),
    .APB2PLL_WR (APB2PLL_WR_out),
   // .CLB_PRDATA (CLB_PRDATA_out),
    //.CLB_PREADY (CLB_PREADY_out),
    //.CLB_PSLVERR (CLB_PSLVERR_out),
   // .DMC_PRDATA (DMC_PRDATA_out),
   // .DMC_PREADY (DMC_PREADY_out),
   // .DMC_PSLVERR (DMC_PSLVERR_out),
    //.FABRIC_PSDONE (FABRIC_PSDONE_out),
    //.MUX2APB_PCLK_XPLL (MUX2APB_PCLK_XPLL_out),
    .PRDATA (PRDATA_out),
    .PREADY (PREADY_out),
    .PSDONE (PSDONE_out),
    .PSLVERR (PSLVERR_out),
    //.CLB_PADDR (CLB_PADDR_in),
    //.CLB_PCLK (CLB_PCLK_in),
    //.CLB_PENABLE (CLB_PENABLE_in),
    //.CLB_PRESETN (CLB_PRESETN_in),
   // .CLB_PSEL (CLB_PSEL_in),
   // .CLB_PWDATA (CLB_PWDATA_in),
    //.CLB_PWRITE (CLB_PWRITE_in),
    //.DFX_SCAN_EN (DFX_SCAN_EN_in),
    //.DFX_SCAN_MODE (DFX_SCAN_MODE_in),
    //.DFX_SCAN_MODE_RST_N (DFX_SCAN_MODE_RST_N_in),
    //.DFX_SCAN_RST_BYP (DFX_SCAN_RST_BYP_in),
    //.DMC_PADDR (DMC_PADDR_in),
    //.DMC_PCLK (DMC_PCLK_in),
    //.DMC_PD (DMC_PD_in),
    //.DMC_PENABLE (DMC_PENABLE_in),
    //.DMC_PRESETN (DMC_PRESETN_in),
    //.DMC_PSEL (DMC_PSEL_in),
    //.DMC_PWDATA (DMC_PWDATA_in),
    //.DMC_PWRITE (DMC_PWRITE_in),
    //.FABRIC_PSCLK (FABRIC_PSCLK_in),
    //.FABRIC_PSEN (FABRIC_PSEN_in),
    //.FABRIC_PSINCDEC (FABRIC_PSINCDEC_in),
    .PADDR (PADDR_in),
    .PCLK (PCLK_in),
    .PENABLE (PENABLE_in),
    .PLL2APB_CK (PLL2APB_CK_in),
    .PLL2APB_PSDONE (PLL2APB_PSDONE_in),
    .PLL2APB_RD (PLL2APB_RD_in),
    .PRESETN (PRESETN_in),
    .PSCLK (PSCLK_in),
    .PSEL (PSEL_in),
    .PSEN (PSEN_in),
    .PSINCDEC (PSINCDEC_in),
    .PWDATA (PWDATA_in),
    .PWRITE (PWRITE_in),
    //.SCAN_EN (SCAN_EN_in),
    //.SCAN_MODE (SCAN_MODE_in),
    //.SCAN_MODE_RST_B (SCAN_MODE_RST_B_in),
    //.SCAN_RST_BYP (SCAN_RST_BYP_in),
    .GSR (glblGSR)
  );

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_XECLIB
  // begin timing section
  specify
    (PCLK => PRDATA[0]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[10]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[11]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[12]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[13]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[14]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[15]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[1]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[2]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[3]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[4]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[5]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[6]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[7]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[8]) = (100:100:100, 100:100:100);
    (PCLK => PRDATA[9]) = (100:100:100, 100:100:100);
    (PCLK => PREADY) = (100:100:100, 100:100:100);
    (PSCLK => APB2PLL_PSCLK) = (100:100:100, 100:100:100);
    (PSCLK => PSDONE) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge PCLK, 0:0:0, notifier);
    $period (negedge PRESETN, 0:0:0, notifier);
    $period (negedge PSCLK, 0:0:0, notifier);
    $period (posedge PCLK, 0:0:0, notifier);
    $period (posedge PRESETN, 0:0:0, notifier);
    $period (posedge PSCLK, 0:0:0, notifier);
    $recrem (negedge PRESETN, negedge PCLK, 0:0:0, 0:0:0, notifier, , , PRESETN_delay, PCLK_delay);
    $recrem (posedge PRESETN, negedge PCLK, 0:0:0, 0:0:0, notifier, , , PRESETN_delay, PCLK_delay);
    $setuphold (posedge PCLK, negedge PADDR[0], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[0]);
    $setuphold (posedge PCLK, negedge PADDR[1], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[1]);
    $setuphold (posedge PCLK, negedge PADDR[2], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[2]);
    $setuphold (posedge PCLK, negedge PADDR[3], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[3]);
    $setuphold (posedge PCLK, negedge PADDR[4], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[4]);
    $setuphold (posedge PCLK, negedge PADDR[5], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[5]);
    $setuphold (posedge PCLK, negedge PADDR[6], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[6]);
    $setuphold (posedge PCLK, negedge PADDR[7], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[7]);
    $setuphold (posedge PCLK, negedge PADDR[8], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[8]);
    $setuphold (posedge PCLK, negedge PADDR[9], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[9]);
    $setuphold (posedge PCLK, negedge PENABLE, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PENABLE_delay);
    $setuphold (posedge PCLK, negedge PSEL, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PSEL_delay);
    $setuphold (posedge PCLK, negedge PWDATA[0], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[0]);
    $setuphold (posedge PCLK, negedge PWDATA[10], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[10]);
    $setuphold (posedge PCLK, negedge PWDATA[11], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[11]);
    $setuphold (posedge PCLK, negedge PWDATA[12], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[12]);
    $setuphold (posedge PCLK, negedge PWDATA[13], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[13]);
    $setuphold (posedge PCLK, negedge PWDATA[14], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[14]);
    $setuphold (posedge PCLK, negedge PWDATA[15], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[15]);
    $setuphold (posedge PCLK, negedge PWDATA[1], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[1]);
    $setuphold (posedge PCLK, negedge PWDATA[2], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[2]);
    $setuphold (posedge PCLK, negedge PWDATA[3], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[3]);
    $setuphold (posedge PCLK, negedge PWDATA[4], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[4]);
    $setuphold (posedge PCLK, negedge PWDATA[5], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[5]);
    $setuphold (posedge PCLK, negedge PWDATA[6], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[6]);
    $setuphold (posedge PCLK, negedge PWDATA[7], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[7]);
    $setuphold (posedge PCLK, negedge PWDATA[8], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[8]);
    $setuphold (posedge PCLK, negedge PWDATA[9], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[9]);
    $setuphold (posedge PCLK, negedge PWRITE, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWRITE_delay);
    $setuphold (posedge PCLK, posedge PADDR[0], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[0]);
    $setuphold (posedge PCLK, posedge PADDR[1], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[1]);
    $setuphold (posedge PCLK, posedge PADDR[2], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[2]);
    $setuphold (posedge PCLK, posedge PADDR[3], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[3]);
    $setuphold (posedge PCLK, posedge PADDR[4], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[4]);
    $setuphold (posedge PCLK, posedge PADDR[5], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[5]);
    $setuphold (posedge PCLK, posedge PADDR[6], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[6]);
    $setuphold (posedge PCLK, posedge PADDR[7], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[7]);
    $setuphold (posedge PCLK, posedge PADDR[8], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[8]);
    $setuphold (posedge PCLK, posedge PADDR[9], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PADDR_delay[9]);
    $setuphold (posedge PCLK, posedge PENABLE, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PENABLE_delay);
    $setuphold (posedge PCLK, posedge PSEL, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PSEL_delay);
    $setuphold (posedge PCLK, posedge PWDATA[0], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[0]);
    $setuphold (posedge PCLK, posedge PWDATA[10], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[10]);
    $setuphold (posedge PCLK, posedge PWDATA[11], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[11]);
    $setuphold (posedge PCLK, posedge PWDATA[12], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[12]);
    $setuphold (posedge PCLK, posedge PWDATA[13], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[13]);
    $setuphold (posedge PCLK, posedge PWDATA[14], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[14]);
    $setuphold (posedge PCLK, posedge PWDATA[15], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[15]);
    $setuphold (posedge PCLK, posedge PWDATA[1], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[1]);
    $setuphold (posedge PCLK, posedge PWDATA[2], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[2]);
    $setuphold (posedge PCLK, posedge PWDATA[3], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[3]);
    $setuphold (posedge PCLK, posedge PWDATA[4], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[4]);
    $setuphold (posedge PCLK, posedge PWDATA[5], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[5]);
    $setuphold (posedge PCLK, posedge PWDATA[6], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[6]);
    $setuphold (posedge PCLK, posedge PWDATA[7], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[7]);
    $setuphold (posedge PCLK, posedge PWDATA[8], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[8]);
    $setuphold (posedge PCLK, posedge PWDATA[9], 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWDATA_delay[9]);
    $setuphold (posedge PCLK, posedge PWRITE, 0:0:0, 0:0:0, notifier, , , PCLK_delay, PWRITE_delay);
    $setuphold (posedge PSCLK, negedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, negedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $setuphold (posedge PSCLK, posedge PSEN, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSEN_delay);
    $setuphold (posedge PSCLK, posedge PSINCDEC, 0:0:0, 0:0:0, notifier, , , PSCLK_delay, PSINCDEC_delay);
    $width (negedge PCLK, 0:0:0, 0, notifier);
    $width (negedge PRESETN, 0:0:0, 0, notifier);
    $width (negedge PSCLK, 0:0:0, 0, notifier);
    $width (posedge PCLK, 0:0:0, 0, notifier);
    $width (posedge PRESETN, 0:0:0, 0, notifier);
    $width (posedge PSCLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
endmodule

`endcelldefine
