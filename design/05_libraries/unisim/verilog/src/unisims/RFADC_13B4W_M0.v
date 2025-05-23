///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        RFADC_13B4W_M0
// /___/   /\      Filename    : RFADC_13B4W_M0.v
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

module RFADC_13B4W_M0 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer LD_DEVICE = 0,
  parameter integer OPT_ANALOG = 0,
  parameter integer OPT_CLK_DIST = 0,
  parameter SIM_DEVICE = "ULTRASCALE_PLUS",
  parameter integer XPA_ACTIVE_DUTYCYCLE = 100,
  parameter integer XPA_CFG0 = 0,
  parameter integer XPA_CFG1 = 0,
  parameter integer XPA_CFG2 = 0,
  parameter XPA_NUM_ADCS = "0",
  parameter integer XPA_NUM_DDCS = 0,
  parameter XPA_PLL_USED = "EXTERNAL",
  parameter integer XPA_SAMPLE_RATE_MSPS = 0
)(
  output CLK_ADC,
  output CLK_DIST_OUT_NORTH,
  output CLK_DIST_OUT_SOUTH,
  output [51:0] DATA_ADC0,
  output [51:0] DATA_ADC1,
  output [51:0] DATA_ADC2,
  output [51:0] DATA_ADC3,
  output [15:0] DOUT,
  output DRDY,
  output PLL_DMON_OUT,
  output PLL_REFCLK_OUT,
  output [23:0] STATUS_ADC0,
  output [23:0] STATUS_ADC1,
  output [23:0] STATUS_ADC2,
  output [23:0] STATUS_ADC3,
  output [23:0] STATUS_COMMON,
  output SYSREF_OUT_NORTH,
  output SYSREF_OUT_SOUTH,
  output T1_ALLOWED_SOUTH,

  input ADC_CLK_N,
  input ADC_CLK_P,
  input CLK_DIST_IN_NORTH,
  input CLK_DIST_IN_SOUTH,
  input CLK_FIFO_LM,
  input [15:0] CONTROL_ADC0,
  input [15:0] CONTROL_ADC1,
  input [15:0] CONTROL_ADC2,
  input [15:0] CONTROL_ADC3,
  input [15:0] CONTROL_COMMON,
  input [11:0] DADDR,
  input DCLK,
  input DEN,
  input [15:0] DI,
  input DWE,
  input FABRIC_CLK,
  input PLL_MONCLK,
  input PLL_REFCLK_IN,
  input SYSREF_IN_NORTH,
  input SYSREF_IN_SOUTH,
  input SYSREF_N,
  input SYSREF_P,
  input T1_ALLOWED_NORTH,
  input VIN0_N,
  input VIN0_P,
  input VIN1_N,
  input VIN1_P,
  input VIN2_N,
  input VIN2_P,
  input VIN3_N,
  input VIN3_P,
  input VIN_I01_N,
  input VIN_I01_P,
  input VIN_I23_N,
  input VIN_I23_P
);

// define constants
  localparam MODULE_NAME = "RFADC_13B4W_M0";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "RFADC_13B4W_M0_dr.v"
`else
  reg [15:0] LD_DEVICE_REG = LD_DEVICE;
  reg [15:0] OPT_ANALOG_REG = OPT_ANALOG;
  reg [15:0] OPT_CLK_DIST_REG = OPT_CLK_DIST;
  reg [152:1] SIM_DEVICE_REG = SIM_DEVICE;
  reg [6:0] XPA_ACTIVE_DUTYCYCLE_REG = XPA_ACTIVE_DUTYCYCLE;
  reg [15:0] XPA_CFG0_REG = XPA_CFG0;
  reg [15:0] XPA_CFG1_REG = XPA_CFG1;
  reg [15:0] XPA_CFG2_REG = XPA_CFG2;
  reg [16:1] XPA_NUM_ADCS_REG = XPA_NUM_ADCS;
  reg [2:0] XPA_NUM_DDCS_REG = XPA_NUM_DDCS;
  reg [112:1] XPA_PLL_USED_REG = XPA_PLL_USED;
  reg [13:0] XPA_SAMPLE_RATE_MSPS_REG = XPA_SAMPLE_RATE_MSPS;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire CLK_ADC_SPARE_out;
  wire CLK_ADC_out;
  wire CLK_DIST_OUT_NORTH_out;
  wire CLK_DIST_OUT_SOUTH_out;
  wire DRDY_out;
  wire PLL_DMON_OUT_out;
  wire PLL_REFCLK_OUT_out;
  wire SYSREF_OUT_NORTH_out;
  wire SYSREF_OUT_SOUTH_out;
  wire T1_ALLOWED_SOUTH_out;
  wire [15:0] DOUT_out;
  wire [15:0] TEST_STATUS_out;
  wire [1:0] PLL_SCAN_OUT_B_FD_out;
  wire [23:0] STATUS_ADC0_out;
  wire [23:0] STATUS_ADC1_out;
  wire [23:0] STATUS_ADC2_out;
  wire [23:0] STATUS_ADC3_out;
  wire [23:0] STATUS_COMMON_out;
  wire [191:0] DATA_ADC0_out;
  wire [191:0] DATA_ADC1_out;
  wire [191:0] DATA_ADC2_out;
  wire [191:0] DATA_ADC3_out;
  wire [299:0] TEST_SO_out;

  wire ADC_CLK_N_in;
  wire ADC_CLK_P_in;
  wire CLK_DIST_IN_NORTH_in;
  wire CLK_DIST_IN_SOUTH_in;
  wire CLK_FIFO_LM_in;
  wire DCLK_in;
  wire DEN_in;
  wire DWE_in;
  wire FABRIC_CLK_in;
  wire PLL_MONCLK_in;
  wire PLL_REFCLK_IN_in;
  wire PLL_SCAN_EN_B_FD_in;
  wire PLL_SCAN_MODE_B_FD_in;
  wire PLL_SCAN_RST_EN_FD_in;
  wire SYSREF_IN_NORTH_in;
  wire SYSREF_IN_SOUTH_in;
  wire SYSREF_N_in;
  wire SYSREF_P_in;
  wire T1_ALLOWED_NORTH_in;
  wire TEST_SCAN_MODE_B_in;
  wire TEST_SCAN_RESET_in;
  wire TEST_SE_B_in;
  wire VIN0_N_in;
  wire VIN0_P_in;
  wire VIN1_N_in;
  wire VIN1_P_in;
  wire VIN2_N_in;
  wire VIN2_P_in;
  wire VIN3_N_in;
  wire VIN3_P_in;
  wire VIN_I01_N_in;
  wire VIN_I01_P_in;
  wire VIN_I23_N_in;
  wire VIN_I23_P_in;
  wire [11:0] DADDR_in;
  wire [15:0] CONTROL_ADC0_in;
  wire [15:0] CONTROL_ADC1_in;
  wire [15:0] CONTROL_ADC2_in;
  wire [15:0] CONTROL_ADC3_in;
  wire [15:0] CONTROL_COMMON_in;
  wire [15:0] DI_in;
  wire [15:0] TEST_SCAN_CTRL_in;
  wire [1:0] PLL_SCAN_CLK_FD_in;
  wire [1:0] PLL_SCAN_IN_FD_in;
  wire [299:0] TEST_SI_in;
  wire [4:0] TEST_SCAN_CLK_in;

`ifdef XIL_TIMING
  wire DCLK_delay;
  wire DEN_delay;
  wire DWE_delay;
  wire FABRIC_CLK_delay;
  wire [11:0] DADDR_delay;
  wire [15:0] CONTROL_ADC0_delay;
  wire [15:0] CONTROL_ADC1_delay;
  wire [15:0] CONTROL_ADC2_delay;
  wire [15:0] CONTROL_ADC3_delay;
  wire [15:0] CONTROL_COMMON_delay;
  wire [15:0] DI_delay;
`endif

  real VIN0_N_real = 1.0;
  real VIN0_P_real = 1.0;
  real VIN1_N_real = 1.0;
  real VIN1_P_real = 1.0;
  real VIN2_N_real = 1.0;
  real VIN2_P_real = 1.0;
  real VIN3_N_real = 1.0;
  real VIN3_P_real = 1.0;
  real VIN_I01_N_real = 1.0;
  real VIN_I01_P_real = 1.0;
  real VIN_I23_N_real = 1.0;
  real VIN_I23_P_real = 1.0;

  assign CLK_ADC = CLK_ADC_out;
  assign CLK_DIST_OUT_NORTH = CLK_DIST_OUT_NORTH_out;
  assign CLK_DIST_OUT_SOUTH = CLK_DIST_OUT_SOUTH_out;
  assign DATA_ADC0 = {DATA_ADC0_out[63:51], DATA_ADC0_out[47:35], DATA_ADC0_out[31:19], DATA_ADC0_out[15:3]};
  assign DATA_ADC1 = {DATA_ADC1_out[63:51], DATA_ADC1_out[47:35], DATA_ADC1_out[31:19], DATA_ADC1_out[15:3]};
  assign DATA_ADC2 = {DATA_ADC2_out[63:51], DATA_ADC2_out[47:35], DATA_ADC2_out[31:19], DATA_ADC2_out[15:3]};
  assign DATA_ADC3 = {DATA_ADC3_out[63:51], DATA_ADC3_out[47:35], DATA_ADC3_out[31:19], DATA_ADC3_out[15:3]};
  assign DOUT = DOUT_out;
  assign DRDY = DRDY_out;
  assign PLL_DMON_OUT = PLL_DMON_OUT_out;
  assign PLL_REFCLK_OUT = PLL_REFCLK_OUT_out;
  assign STATUS_ADC0 = STATUS_ADC0_out;
  assign STATUS_ADC1 = STATUS_ADC1_out;
  assign STATUS_ADC2 = STATUS_ADC2_out;
  assign STATUS_ADC3 = STATUS_ADC3_out;
  assign STATUS_COMMON = STATUS_COMMON_out;
  assign SYSREF_OUT_NORTH = SYSREF_OUT_NORTH_out;
  assign SYSREF_OUT_SOUTH = SYSREF_OUT_SOUTH_out;
  assign T1_ALLOWED_SOUTH = T1_ALLOWED_SOUTH_out;

`ifdef XIL_TIMING
  assign CONTROL_ADC0_in = CONTROL_ADC0_delay;
  assign CONTROL_ADC1_in = CONTROL_ADC1_delay;
  assign CONTROL_ADC2_in = CONTROL_ADC2_delay;
  assign CONTROL_ADC3_in = CONTROL_ADC3_delay;
  assign CONTROL_COMMON_in = CONTROL_COMMON_delay;
  assign DADDR_in = DADDR_delay;
  assign DCLK_in = DCLK_delay;
  assign DEN_in = DEN_delay;
  assign DI_in = DI_delay;
  assign DWE_in = DWE_delay;
  assign FABRIC_CLK_in = FABRIC_CLK_delay;
`else
  assign CONTROL_ADC0_in = CONTROL_ADC0;
  assign CONTROL_ADC1_in = CONTROL_ADC1;
  assign CONTROL_ADC2_in = CONTROL_ADC2;
  assign CONTROL_ADC3_in = CONTROL_ADC3;
  assign CONTROL_COMMON_in = CONTROL_COMMON;
  assign DADDR_in = DADDR;
  assign DCLK_in = DCLK;
  assign DEN_in = DEN;
  assign DI_in = DI;
  assign DWE_in = DWE;
  assign FABRIC_CLK_in = FABRIC_CLK;
`endif

  assign ADC_CLK_N_in = ADC_CLK_N;
  assign ADC_CLK_P_in = ADC_CLK_P;
  assign CLK_DIST_IN_NORTH_in = CLK_DIST_IN_NORTH;
  assign CLK_DIST_IN_SOUTH_in = CLK_DIST_IN_SOUTH;
  assign CLK_FIFO_LM_in = CLK_FIFO_LM;
  assign PLL_MONCLK_in = PLL_MONCLK;
  assign PLL_REFCLK_IN_in = PLL_REFCLK_IN;
  assign SYSREF_IN_NORTH_in = SYSREF_IN_NORTH;
  assign SYSREF_IN_SOUTH_in = SYSREF_IN_SOUTH;
  assign SYSREF_N_in = SYSREF_N;
  assign SYSREF_P_in = SYSREF_P;
  assign T1_ALLOWED_NORTH_in = T1_ALLOWED_NORTH;
  assign VIN0_N_in = VIN0_N;
  assign VIN0_P_in = VIN0_P;
  assign VIN1_N_in = VIN1_N;
  assign VIN1_P_in = VIN1_P;
  assign VIN2_N_in = VIN2_N;
  assign VIN2_P_in = VIN2_P;
  assign VIN3_N_in = VIN3_N;
  assign VIN3_P_in = VIN3_P;
  assign VIN_I01_N_in = VIN_I01_N;
  assign VIN_I01_P_in = VIN_I01_P;
  assign VIN_I23_N_in = VIN_I23_N;
  assign VIN_I23_P_in = VIN_I23_P;

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
        ((LD_DEVICE_REG < 0) || (LD_DEVICE_REG > 65535))) begin
      $display("Error: [Unisim %s-101] LD_DEVICE attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, LD_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((OPT_ANALOG_REG < 0) || (OPT_ANALOG_REG > 65535))) begin
      $display("Error: [Unisim %s-102] OPT_ANALOG attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, OPT_ANALOG_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((OPT_CLK_DIST_REG < 0) || (OPT_CLK_DIST_REG > 65535))) begin
      $display("Error: [Unisim %s-103] OPT_CLK_DIST attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, OPT_CLK_DIST_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_DEVICE_REG != "ULTRASCALE_PLUS") &&
         (SIM_DEVICE_REG != "ULTRASCALE_PLUS_ES1") &&
         (SIM_DEVICE_REG != "ULTRASCALE_PLUS_ES2"))) begin
      $display("Error: [Unisim %s-104] SIM_DEVICE attribute is set to %s.  Legal values for this attribute are ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1 or ULTRASCALE_PLUS_ES2. Instance: %m", MODULE_NAME, SIM_DEVICE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_ACTIVE_DUTYCYCLE_REG < 0) || (XPA_ACTIVE_DUTYCYCLE_REG > 100))) begin
      $display("Error: [Unisim %s-105] XPA_ACTIVE_DUTYCYCLE attribute is set to %d.  Legal values for this attribute are 0 to 100. Instance: %m", MODULE_NAME, XPA_ACTIVE_DUTYCYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_CFG0_REG < 0) || (XPA_CFG0_REG > 65535))) begin
      $display("Error: [Unisim %s-106] XPA_CFG0 attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, XPA_CFG0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_CFG1_REG < 0) || (XPA_CFG1_REG > 65535))) begin
      $display("Error: [Unisim %s-107] XPA_CFG1 attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, XPA_CFG1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_CFG2_REG < 0) || (XPA_CFG2_REG > 65535))) begin
      $display("Error: [Unisim %s-108] XPA_CFG2 attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, XPA_CFG2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_NUM_ADCS_REG != "0") &&
         (XPA_NUM_ADCS_REG != "1") &&
         (XPA_NUM_ADCS_REG != "1I") &&
         (XPA_NUM_ADCS_REG != "2") &&
         (XPA_NUM_ADCS_REG != "2I") &&
         (XPA_NUM_ADCS_REG != "3") &&
         (XPA_NUM_ADCS_REG != "4"))) begin
      $display("Error: [Unisim %s-109] XPA_NUM_ADCS attribute is set to %s.  Legal values for this attribute are 0, 1, 1I, 2, 2I, 3 or 4. Instance: %m", MODULE_NAME, XPA_NUM_ADCS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_NUM_DDCS_REG < 0) || (XPA_NUM_DDCS_REG > 4))) begin
      $display("Error: [Unisim %s-110] XPA_NUM_DDCS attribute is set to %d.  Legal values for this attribute are 0 to 4. Instance: %m", MODULE_NAME, XPA_NUM_DDCS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_PLL_USED_REG != "EXTERNAL") &&
         (XPA_PLL_USED_REG != "DISTRIBUTED_T1") &&
         (XPA_PLL_USED_REG != "INTERNAL_PLL"))) begin
      $display("Error: [Unisim %s-111] XPA_PLL_USED attribute is set to %s.  Legal values for this attribute are EXTERNAL, DISTRIBUTED_T1 or INTERNAL_PLL. Instance: %m", MODULE_NAME, XPA_PLL_USED_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_SAMPLE_RATE_MSPS_REG < 0) || (XPA_SAMPLE_RATE_MSPS_REG > 10000))) begin
      $display("Error: [Unisim %s-112] XPA_SAMPLE_RATE_MSPS attribute is set to %d.  Legal values for this attribute are 0 to 10000. Instance: %m", MODULE_NAME, XPA_SAMPLE_RATE_MSPS_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign PLL_SCAN_CLK_FD_in = 2'b11; // tie off
assign TEST_SCAN_CLK_in = 5'b11111; // tie off

assign PLL_SCAN_EN_B_FD_in = 1'b1; // tie off
assign PLL_SCAN_IN_FD_in = 2'b11; // tie off
assign PLL_SCAN_MODE_B_FD_in = 1'b1; // tie off
assign PLL_SCAN_RST_EN_FD_in = 1'b1; // tie off
assign TEST_SCAN_CTRL_in = 16'b1111111111111111; // tie off
assign TEST_SCAN_MODE_B_in = 1'b1; // tie off
assign TEST_SCAN_RESET_in = 1'b1; // tie off
assign TEST_SE_B_in = 1'b1; // tie off
assign TEST_SI_in = 300'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111; // tie off

  SIP_RFADC SIP_RFADC_13B4W_M0_INST (
    .LD_DEVICE (LD_DEVICE_REG),
    .OPT_ANALOG (OPT_ANALOG_REG),
    .OPT_CLK_DIST (OPT_CLK_DIST_REG),
    .SIM_DEVICE (SIM_DEVICE_REG),
    .XPA_ACTIVE_DUTYCYCLE (XPA_ACTIVE_DUTYCYCLE_REG),
    .XPA_CFG0 (XPA_CFG0_REG),
    .XPA_CFG1 (XPA_CFG1_REG),
    .XPA_CFG2 (XPA_CFG2_REG),
    .XPA_NUM_ADCS (XPA_NUM_ADCS_REG),
    .XPA_NUM_DDCS (XPA_NUM_DDCS_REG),
    .XPA_PLL_USED (XPA_PLL_USED_REG),
    .XPA_SAMPLE_RATE_MSPS (XPA_SAMPLE_RATE_MSPS_REG),
    .CLK_ADC (CLK_ADC_out),
    .CLK_ADC_SPARE (CLK_ADC_SPARE_out),
    .CLK_DIST_OUT_NORTH (CLK_DIST_OUT_NORTH_out),
    .CLK_DIST_OUT_SOUTH (CLK_DIST_OUT_SOUTH_out),
    .DATA_ADC0 (DATA_ADC0_out),
    .DATA_ADC1 (DATA_ADC1_out),
    .DATA_ADC2 (DATA_ADC2_out),
    .DATA_ADC3 (DATA_ADC3_out),
    .DOUT (DOUT_out),
    .DRDY (DRDY_out),
    .PLL_DMON_OUT (PLL_DMON_OUT_out),
    .PLL_REFCLK_OUT (PLL_REFCLK_OUT_out),
    .PLL_SCAN_OUT_B_FD (PLL_SCAN_OUT_B_FD_out),
    .STATUS_ADC0 (STATUS_ADC0_out),
    .STATUS_ADC1 (STATUS_ADC1_out),
    .STATUS_ADC2 (STATUS_ADC2_out),
    .STATUS_ADC3 (STATUS_ADC3_out),
    .STATUS_COMMON (STATUS_COMMON_out),
    .SYSREF_OUT_NORTH (SYSREF_OUT_NORTH_out),
    .SYSREF_OUT_SOUTH (SYSREF_OUT_SOUTH_out),
    .T1_ALLOWED_SOUTH (T1_ALLOWED_SOUTH_out),
    .TEST_SO (TEST_SO_out),
    .TEST_STATUS (TEST_STATUS_out),
    .ADC_CLK_N (ADC_CLK_N_in),
    .ADC_CLK_P (ADC_CLK_P_in),
    .CLK_DIST_IN_NORTH (CLK_DIST_IN_NORTH_in),
    .CLK_DIST_IN_SOUTH (CLK_DIST_IN_SOUTH_in),
    .CLK_FIFO_LM (CLK_FIFO_LM_in),
    .CONTROL_ADC0 (CONTROL_ADC0_in),
    .CONTROL_ADC1 (CONTROL_ADC1_in),
    .CONTROL_ADC2 (CONTROL_ADC2_in),
    .CONTROL_ADC3 (CONTROL_ADC3_in),
    .CONTROL_COMMON (CONTROL_COMMON_in),
    .DADDR (DADDR_in),
    .DCLK (DCLK_in),
    .DEN (DEN_in),
    .DI (DI_in),
    .DWE (DWE_in),
    .FABRIC_CLK (FABRIC_CLK_in),
    .PLL_MONCLK (PLL_MONCLK_in),
    .PLL_REFCLK_IN (PLL_REFCLK_IN_in),
    .PLL_SCAN_CLK_FD (PLL_SCAN_CLK_FD_in),
    .PLL_SCAN_EN_B_FD (PLL_SCAN_EN_B_FD_in),
    .PLL_SCAN_IN_FD (PLL_SCAN_IN_FD_in),
    .PLL_SCAN_MODE_B_FD (PLL_SCAN_MODE_B_FD_in),
    .PLL_SCAN_RST_EN_FD (PLL_SCAN_RST_EN_FD_in),
    .SYSREF_IN_NORTH (SYSREF_IN_NORTH_in),
    .SYSREF_IN_SOUTH (SYSREF_IN_SOUTH_in),
    .SYSREF_N (SYSREF_N_in),
    .SYSREF_P (SYSREF_P_in),
    .T1_ALLOWED_NORTH (T1_ALLOWED_NORTH_in),
    .TEST_SCAN_CLK (TEST_SCAN_CLK_in),
    .TEST_SCAN_CTRL (TEST_SCAN_CTRL_in),
    .TEST_SCAN_MODE_B (TEST_SCAN_MODE_B_in),
    .TEST_SCAN_RESET (TEST_SCAN_RESET_in),
    .TEST_SE_B (TEST_SE_B_in),
    .TEST_SI (TEST_SI_in),
    .VIN0_N (VIN0_N_real),
    .VIN0_P (VIN0_P_real),
    .VIN1_N (VIN1_N_real),
    .VIN1_P (VIN1_P_real),
    .VIN2_N (VIN2_N_real),
    .VIN2_P (VIN2_P_real),
    .VIN3_N (VIN3_N_real),
    .VIN3_P (VIN3_P_real),
    .VIN_I01_N (VIN_I01_N_real),
    .VIN_I01_P (VIN_I01_P_real),
    .VIN_I23_N (VIN_I23_N_real),
    .VIN_I23_P (VIN_I23_P_real),
    .GSR (glblGSR)
  );

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_XECLIB
  // begin timing section
  specify
    (CLK_FIFO_LM => DATA_ADC0[0]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[13]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[14]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[15]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[16]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[17]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[18]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[19]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[1]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[20]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[21]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[22]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[23]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[24]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[25]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[26]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[27]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[28]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[29]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[2]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[30]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[31]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[32]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[33]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[34]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[35]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[36]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[37]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[38]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[39]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[3]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[40]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[41]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[42]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[43]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[44]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[45]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[46]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[47]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[48]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[49]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[4]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[50]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[51]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[5]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[6]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[7]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC0[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[0]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[13]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[14]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[15]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[16]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[17]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[18]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[19]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[1]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[20]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[21]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[22]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[23]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[24]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[25]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[26]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[27]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[28]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[29]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[2]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[30]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[31]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[32]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[33]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[34]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[35]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[36]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[37]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[38]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[39]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[3]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[40]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[41]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[42]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[43]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[44]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[45]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[46]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[47]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[48]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[49]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[4]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[50]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[51]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[5]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[6]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[7]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC1[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[0]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[13]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[14]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[15]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[16]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[17]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[18]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[19]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[1]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[20]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[21]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[22]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[23]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[24]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[25]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[26]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[27]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[28]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[29]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[2]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[30]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[31]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[32]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[33]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[34]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[35]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[36]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[37]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[38]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[39]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[3]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[40]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[41]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[42]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[43]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[44]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[45]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[46]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[47]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[48]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[49]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[4]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[50]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[51]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[5]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[6]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[7]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC2[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[0]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[13]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[14]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[15]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[16]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[17]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[18]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[19]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[1]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[20]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[21]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[22]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[23]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[24]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[25]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[26]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[27]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[28]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[29]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[2]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[30]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[31]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[32]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[33]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[34]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[35]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[36]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[37]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[38]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[39]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[3]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[40]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[41]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[42]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[43]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[44]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[45]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[46]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[47]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[48]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[49]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[4]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[50]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[51]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[5]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[6]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[7]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => DATA_ADC3[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC0[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC0[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC0[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC0[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC0[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC1[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC1[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC1[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC1[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC1[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC2[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC2[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC2[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC2[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC2[9]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC3[10]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC3[11]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC3[12]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC3[8]) = (0:0:0, 0:0:0);
    (CLK_FIFO_LM => STATUS_ADC3[9]) = (0:0:0, 0:0:0);
    (DCLK => DOUT[0]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[10]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[11]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[12]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[13]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[14]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[15]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[1]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[2]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[3]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[4]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[5]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[6]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[7]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[8]) = (100:100:100, 100:100:100);
    (DCLK => DOUT[9]) = (100:100:100, 100:100:100);
    (DCLK => DRDY) = (100:100:100, 100:100:100);
    (DCLK => STATUS_COMMON[6]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[0]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[13]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[14]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[15]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[16]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[17]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[18]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[19]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[1]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[20]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[21]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[22]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[23]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[24]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[25]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[26]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[27]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[28]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[29]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[2]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[30]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[31]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[32]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[33]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[34]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[35]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[36]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[37]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[38]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[39]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[3]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[40]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[41]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[42]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[43]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[44]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[45]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[46]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[47]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[48]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[49]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[4]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[50]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[51]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[5]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[6]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[7]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC0[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[0]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[13]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[14]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[15]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[16]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[17]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[18]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[19]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[1]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[20]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[21]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[22]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[23]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[24]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[25]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[26]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[27]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[28]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[29]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[2]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[30]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[31]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[32]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[33]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[34]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[35]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[36]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[37]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[38]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[39]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[3]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[40]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[41]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[42]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[43]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[44]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[45]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[46]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[47]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[48]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[49]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[4]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[50]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[51]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[5]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[6]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[7]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC1[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[0]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[13]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[14]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[15]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[16]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[17]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[18]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[19]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[1]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[20]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[21]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[22]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[23]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[24]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[25]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[26]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[27]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[28]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[29]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[2]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[30]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[31]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[32]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[33]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[34]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[35]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[36]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[37]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[38]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[39]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[3]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[40]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[41]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[42]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[43]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[44]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[45]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[46]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[47]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[48]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[49]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[4]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[50]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[51]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[5]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[6]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[7]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC2[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[0]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[13]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[14]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[15]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[16]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[17]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[18]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[19]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[1]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[20]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[21]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[22]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[23]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[24]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[25]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[26]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[27]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[28]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[29]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[2]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[30]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[31]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[32]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[33]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[34]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[35]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[36]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[37]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[38]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[39]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[3]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[40]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[41]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[42]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[43]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[44]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[45]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[46]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[47]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[48]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[49]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[4]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[50]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[51]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[5]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[6]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[7]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => DATA_ADC3[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC0[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC0[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC0[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC0[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC0[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC1[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC1[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC1[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC1[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC1[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC2[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC2[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC2[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC2[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC2[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC3[10]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC3[11]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC3[12]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC3[8]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_ADC3[9]) = (100:100:100, 100:100:100);
    (FABRIC_CLK => STATUS_COMMON[5]) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLK_ADC, 0:0:0, notifier);
    $period (negedge CLK_FIFO_LM, 0:0:0, notifier);
    $period (negedge DCLK, 0:0:0, notifier);
    $period (negedge FABRIC_CLK, 0:0:0, notifier);
    $period (negedge PLL_DMON_OUT, 0:0:0, notifier);
    $period (negedge PLL_MONCLK, 0:0:0, notifier);
    $period (negedge PLL_REFCLK_IN, 0:0:0, notifier);
    $period (negedge PLL_REFCLK_OUT, 0:0:0, notifier);
    $period (posedge CLK_ADC, 0:0:0, notifier);
    $period (posedge CLK_FIFO_LM, 0:0:0, notifier);
    $period (posedge DCLK, 0:0:0, notifier);
    $period (posedge FABRIC_CLK, 0:0:0, notifier);
    $period (posedge PLL_DMON_OUT, 0:0:0, notifier);
    $period (posedge PLL_MONCLK, 0:0:0, notifier);
    $period (posedge PLL_REFCLK_IN, 0:0:0, notifier);
    $period (posedge PLL_REFCLK_OUT, 0:0:0, notifier);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[13]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[14]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[15]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[2]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[3]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[4]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[5]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC0[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[6]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[13]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[14]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[15]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[2]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[3]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[4]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[5]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC1[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[6]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[13]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[14]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[15]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[2]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[3]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[4]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[5]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC2[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[6]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[13]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[14]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[15]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[2]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[3]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[4]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[5]);
    $setuphold (posedge DCLK, negedge CONTROL_ADC3[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[6]);
    $setuphold (posedge DCLK, negedge CONTROL_COMMON[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_COMMON_delay[3]);
    $setuphold (posedge DCLK, negedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, negedge DADDR[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[10]);
    $setuphold (posedge DCLK, negedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, negedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, negedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, negedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, negedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, negedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, negedge DADDR[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[7]);
    $setuphold (posedge DCLK, negedge DADDR[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[8]);
    $setuphold (posedge DCLK, negedge DADDR[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[9]);
    $setuphold (posedge DCLK, negedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, negedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, negedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, negedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, negedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, negedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, negedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, negedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, negedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, negedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, negedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, negedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, negedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, negedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, negedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, negedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, negedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, negedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[13]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[14]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[15]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[2]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[3]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[4]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[5]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC0[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC0_delay[6]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[13]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[14]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[15]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[2]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[3]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[4]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[5]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC1[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC1_delay[6]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[13]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[14]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[15]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[2]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[3]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[4]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[5]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC2[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC2_delay[6]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[13]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[14]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[15]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[2]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[3]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[4]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[5]);
    $setuphold (posedge DCLK, posedge CONTROL_ADC3[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_ADC3_delay[6]);
    $setuphold (posedge DCLK, posedge CONTROL_COMMON[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, CONTROL_COMMON_delay[3]);
    $setuphold (posedge DCLK, posedge DADDR[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[0]);
    $setuphold (posedge DCLK, posedge DADDR[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[10]);
    $setuphold (posedge DCLK, posedge DADDR[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[1]);
    $setuphold (posedge DCLK, posedge DADDR[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[2]);
    $setuphold (posedge DCLK, posedge DADDR[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[3]);
    $setuphold (posedge DCLK, posedge DADDR[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[4]);
    $setuphold (posedge DCLK, posedge DADDR[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[5]);
    $setuphold (posedge DCLK, posedge DADDR[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[6]);
    $setuphold (posedge DCLK, posedge DADDR[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[7]);
    $setuphold (posedge DCLK, posedge DADDR[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[8]);
    $setuphold (posedge DCLK, posedge DADDR[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DADDR_delay[9]);
    $setuphold (posedge DCLK, posedge DEN, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DEN_delay);
    $setuphold (posedge DCLK, posedge DI[0], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[0]);
    $setuphold (posedge DCLK, posedge DI[10], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[10]);
    $setuphold (posedge DCLK, posedge DI[11], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[11]);
    $setuphold (posedge DCLK, posedge DI[12], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[12]);
    $setuphold (posedge DCLK, posedge DI[13], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[13]);
    $setuphold (posedge DCLK, posedge DI[14], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[14]);
    $setuphold (posedge DCLK, posedge DI[15], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[15]);
    $setuphold (posedge DCLK, posedge DI[1], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[1]);
    $setuphold (posedge DCLK, posedge DI[2], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[2]);
    $setuphold (posedge DCLK, posedge DI[3], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[3]);
    $setuphold (posedge DCLK, posedge DI[4], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[4]);
    $setuphold (posedge DCLK, posedge DI[5], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[5]);
    $setuphold (posedge DCLK, posedge DI[6], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[6]);
    $setuphold (posedge DCLK, posedge DI[7], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[7]);
    $setuphold (posedge DCLK, posedge DI[8], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[8]);
    $setuphold (posedge DCLK, posedge DI[9], 0:0:0, 0:0:0, notifier, , , DCLK_delay, DI_delay[9]);
    $setuphold (posedge DCLK, posedge DWE, 0:0:0, 0:0:0, notifier, , , DCLK_delay, DWE_delay);
    $setuphold (posedge FABRIC_CLK, negedge CONTROL_COMMON[12], 0:0:0, 0:0:0, notifier, , , FABRIC_CLK_delay, CONTROL_COMMON_delay[12]);
    $setuphold (posedge FABRIC_CLK, posedge CONTROL_COMMON[12], 0:0:0, 0:0:0, notifier, , , FABRIC_CLK_delay, CONTROL_COMMON_delay[12]);
    $width (negedge CLK_FIFO_LM, 0:0:0, 0, notifier);
    $width (negedge DCLK, 0:0:0, 0, notifier);
    $width (negedge FABRIC_CLK, 0:0:0, 0, notifier);
    $width (negedge PLL_MONCLK, 0:0:0, 0, notifier);
    $width (negedge PLL_REFCLK_IN, 0:0:0, 0, notifier);
    $width (posedge CLK_FIFO_LM, 0:0:0, 0, notifier);
    $width (posedge DCLK, 0:0:0, 0, notifier);
    $width (posedge FABRIC_CLK, 0:0:0, 0, notifier);
    $width (posedge PLL_MONCLK, 0:0:0, 0, notifier);
    $width (posedge PLL_REFCLK_IN, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
endmodule

`endcelldefine
