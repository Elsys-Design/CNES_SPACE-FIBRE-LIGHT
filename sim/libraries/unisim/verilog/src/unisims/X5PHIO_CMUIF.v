///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PHIO_CMUIF
// /___/   /\      Filename    : X5PHIO_CMUIF.v
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

module X5PHIO_CMUIF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer APBCLK_FREQ = 100,
  parameter DMC_APB_SEL_CMU = "FALSE",
  parameter RIUCLK_DBLR_BYPASS = "FALSE",
  parameter [2:0] RIU_CLK_DBL_CMU = 3'b000
)(
  output APB2CMU_CA,
  output APB2CMU_CK,
  output APB2CMU_RST,
  output APB2CMU_WR,
  output [15:0] PRDATA,
  output PREADY,
  output PSLVERR,

  input CMU2APB_CK,
  input [3:0] CMU2APB_RD,
  input [9:0] PADDR,
  input PCLK,
  input PENABLE,
  input PRESETN,
  input PSEL,
  input [15:0] PWDATA,
  input PWRITE
);

// define constants
  localparam MODULE_NAME = "X5PHIO_CMUIF";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "X5PHIO_CMUIF_dr.v"
`else
  reg [8:0] APBCLK_FREQ_REG = APBCLK_FREQ;
  reg [40:1] DMC_APB_SEL_CMU_REG = DMC_APB_SEL_CMU;
  reg [40:1] RIUCLK_DBLR_BYPASS_REG = RIUCLK_DBLR_BYPASS;
  reg [2:0] RIU_CLK_DBL_CMU_REG = RIU_CLK_DBL_CMU;
`endif

  reg [40:1] TEST_MCT_CMU_REG = "FALSE";

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire APB2CLB_PREADY_out;
  wire APB2CLB_PSLVERR_out;
  wire APB2CMU_CA_out;
  wire APB2CMU_CK_out;
  wire APB2CMU_RST_out;
  wire APB2CMU_WR_out;
  wire APB2DMC_PREADY_out;
  wire APB2DMC_PSLVERR_out;
  wire MUX2APB_PCLK_CMU_out;
  wire PREADY_out;
  wire PSLVERR_out;
  wire [15:0] APB2CLB_PRDATA_out;
  wire [15:0] APB2DMC_PRDATA_out;
  wire [15:0] PRDATA_out;

  wire CLB2APB_CK_in;
  wire CLB2APB_PENABLE_in;
  wire CLB2APB_PSEL_in;
  wire CLB2APB_PWRITE_in;
  wire CLB2APB_RST_in;
  wire CMU2APB_CK_in;
  wire DFX_SCAN_EN_in;
  wire DFX_SCAN_MODE_RST_N_in;
  wire DFX_SCAN_MODE_in;
  wire DFX_SCAN_RST_BYP_in;
  wire DMC2APB_CK_in;
  wire DMC2APB_PENABLE_in;
  wire DMC2APB_PSEL_in;
  wire DMC2APB_PWRITE_in;
  wire DMC2APB_RST_in;
  wire PCLK_in;
  wire PENABLE_in;
  wire PRESETN_in;
  wire PSEL_in;
  wire PWRITE_in;
  wire SCAN_EN_in;
  wire SCAN_MODE_RST_B_in;
  wire SCAN_MODE_in;
  wire SCAN_RST_BYP_in;
  wire [15:0] CLB2APB_PWDATA_in;
  wire [15:0] DMC2APB_PWDATA_in;
  wire [15:0] PWDATA_in;
  wire [3:0] CMU2APB_RD_in;
  wire [9:0] CLB2APB_PADDR_in;
  wire [9:0] DMC2APB_PADDR_in;
  wire [9:0] PADDR_in;

`ifdef XIL_TIMING
  wire PCLK_delay;
  wire PENABLE_delay;
  wire PRESETN_delay;
  wire PSEL_delay;
  wire PWRITE_delay;
  wire [15:0] PWDATA_delay;
  wire [9:0] PADDR_delay;
`endif

  assign APB2CMU_CA = APB2CMU_CA_out;
  assign APB2CMU_CK = APB2CMU_CK_out;
  assign APB2CMU_RST = APB2CMU_RST_out;
  assign APB2CMU_WR = APB2CMU_WR_out;

//Manual output assignments
  assign PRDATA = PRDATA_out;
  assign PREADY = PREADY_out;
  assign PSLVERR = PSLVERR_out;


`ifdef XIL_TIMING
  assign PADDR_in = PADDR_delay;
  assign PCLK_in = PCLK_delay;
  assign PENABLE_in = PENABLE_delay;
  assign PRESETN_in = PRESETN_delay;
  assign PSEL_in = PSEL_delay;
  assign PWDATA_in = PWDATA_delay;
  assign PWRITE_in = PWRITE_delay;
`else
  assign PADDR_in = PADDR;
  assign PCLK_in = PCLK;
  assign PENABLE_in = PENABLE;
  assign PRESETN_in = PRESETN;
  assign PSEL_in = PSEL;
  assign PWDATA_in = PWDATA;
  assign PWRITE_in = PWRITE;
`endif

  assign CMU2APB_CK_in = CMU2APB_CK;
  assign CMU2APB_RD_in = CMU2APB_RD;

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
        ((DMC_APB_SEL_CMU_REG != "FALSE") &&
         (DMC_APB_SEL_CMU_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DMC_APB_SEL_CMU attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_APB_SEL_CMU_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RIUCLK_DBLR_BYPASS_REG != "FALSE") &&
         (RIUCLK_DBLR_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] RIUCLK_DBLR_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RIUCLK_DBLR_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign CLB2APB_CK_in = 1'b1; // tie off
assign DMC2APB_CK_in = 1'b1; // tie off

assign CLB2APB_PADDR_in = 10'b1111111111; // tie off
assign CLB2APB_PENABLE_in = 1'b1; // tie off
assign CLB2APB_PSEL_in = 1'b1; // tie off
assign CLB2APB_PWDATA_in = 16'b1111111111111111; // tie off
assign CLB2APB_PWRITE_in = 1'b1; // tie off
assign CLB2APB_RST_in = 1'b1; // tie off
assign DFX_SCAN_EN_in = 1'b1; // tie off
assign DFX_SCAN_MODE_RST_N_in = 1'b1; // tie off
assign DFX_SCAN_MODE_in = 1'b1; // tie off
assign DFX_SCAN_RST_BYP_in = 1'b1; // tie off
assign DMC2APB_PADDR_in = 10'b1111111111; // tie off
assign DMC2APB_PENABLE_in = 1'b1; // tie off
assign DMC2APB_PSEL_in = 1'b1; // tie off
assign DMC2APB_PWDATA_in = 16'b1111111111111111; // tie off
assign DMC2APB_PWRITE_in = 1'b1; // tie off
assign DMC2APB_RST_in = 1'b1; // tie off
assign SCAN_EN_in = 1'b0; // tie off
assign SCAN_MODE_RST_B_in = 1'b1; // tie off
assign SCAN_MODE_in = 1'b0; // tie off
assign SCAN_RST_BYP_in = 1'b0; // tie off

  SIP_X5PHIO_CMUIF SIP_X5PHIO_CMUIF_INST (
    //.APBCLK_FREQ (APBCLK_FREQ_REG),
    .DMC_APB_SEL_CMU (DMC_APB_SEL_CMU_REG),
    .RIUCLK_DBLR_BYPASS (RIUCLK_DBLR_BYPASS_REG),
    .RIU_CLK_DBL_CMU (RIU_CLK_DBL_CMU_REG),
    .TEST_MCT_CMU (TEST_MCT_CMU_REG),
    //.APB2CLB_PRDATA (APB2CLB_PRDATA_out),
    //.APB2CLB_PREADY (APB2CLB_PREADY_out),
    //.APB2CLB_PSLVERR (APB2CLB_PSLVERR_out),
    .APB2CMU_CA (APB2CMU_CA_out),
    .APB2CMU_CK (APB2CMU_CK_out),
    .APB2CMU_RST (APB2CMU_RST_out),
    .APB2CMU_WR (APB2CMU_WR_out),
    //.APB2DMC_PRDATA (APB2DMC_PRDATA_out),
    //.APB2DMC_PREADY (APB2DMC_PREADY_out),
    //.APB2DMC_PSLVERR (APB2DMC_PSLVERR_out),
    .MUX2APB_PCLK_CMU (MUX2APB_PCLK_CMU_out),
    .PRDATA (PRDATA_out),
    .PREADY (PREADY_out),
    .PSLVERR (PSLVERR_out),
    //.CLB2APB_CK (CLB2APB_CK_in),
    //.CLB2APB_PADDR (CLB2APB_PADDR_in),
    //.CLB2APB_PENABLE (CLB2APB_PENABLE_in),
    //.CLB2APB_PSEL (CLB2APB_PSEL_in),
    //.CLB2APB_PWDATA (CLB2APB_PWDATA_in),
    //.CLB2APB_PWRITE (CLB2APB_PWRITE_in),
    //.CLB2APB_RST (CLB2APB_RST_in),
    .CMU2APB_CK (CMU2APB_CK_in),
    .CMU2APB_RD (CMU2APB_RD_in),
    .DFX_SCAN_EN (DFX_SCAN_EN_in),
    .DFX_SCAN_MODE (DFX_SCAN_MODE_in),
    .DFX_SCAN_MODE_RST_N (DFX_SCAN_MODE_RST_N_in),
    .DFX_SCAN_RST_BYP (DFX_SCAN_RST_BYP_in),
    //.DMC2APB_CK (DMC2APB_CK_in),
    //.DMC2APB_PADDR (DMC2APB_PADDR_in),
    //.DMC2APB_PENABLE (DMC2APB_PENABLE_in),
    //.DMC2APB_PSEL (DMC2APB_PSEL_in),
    //.DMC2APB_PWDATA (DMC2APB_PWDATA_in),
    //.DMC2APB_PWRITE (DMC2APB_PWRITE_in),
    //.DMC2APB_RST (DMC2APB_RST_in),
    .PADDR (PADDR_in),
    .PCLK (PCLK_in),
    .PENABLE (PENABLE_in),
    .PRESETN (PRESETN_in),
    .PSEL (PSEL_in),
    .PWDATA (PWDATA_in),
    .PWRITE (PWRITE_in),
    .SCAN_EN (SCAN_EN_in),
    .SCAN_MODE (SCAN_MODE_in),
    .SCAN_MODE_RST_B (SCAN_MODE_RST_B_in),
    .SCAN_RST_BYP (SCAN_RST_BYP_in),
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
`ifdef XIL_TIMING
    $period (negedge PCLK, 0:0:0, notifier);
    $period (posedge PCLK, 0:0:0, notifier);
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
    $width (negedge PCLK, 0:0:0, 0, notifier);
    $width (posedge PCLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
endmodule

`endcelldefine
