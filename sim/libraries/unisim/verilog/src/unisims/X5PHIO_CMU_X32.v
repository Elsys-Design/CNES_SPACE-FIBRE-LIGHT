///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2022 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PHIO_CMU_X32
// /___/   /\      Filename    : X5PHIO_CMU_X32.v
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

module X5PHIO_CMU_X32 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [3:0] ANATERM_NVAL = 4'b0000,
  parameter [3:0] ANATERM_PVAL = 4'b0000,
  parameter ANATERM_SEL = "FALSE",
  parameter [11:0] ATBMUX_SEL = 12'b000000000000,
  parameter ATB_PATH_SEL = "ATB_PATH_UNUSED",
  parameter BYP_FREQ_DIV_S2P_CMU = "FALSE",
  parameter BYP_FREQ_DIV_X5PLL = "FALSE",
  parameter CALTX_RCAL_EN = "FALSE",
  parameter [8:0] CALTX_RCAL_VAL = 9'h000,
  parameter [2:0] CMU_ADLY_BIAS = 3'b000,
  parameter CMU_APB_CLK_SEL = "APB_CLK",
  parameter [4:0] CMU_CTLE_BIAS = 5'b00000,
  parameter [2:0] CMU_D2C_BIAS = 3'b000,
  parameter [10:0] CMU_DFE_BIAS = 11'b00000000000,
  parameter [4:0] CMU_LPRXBIAS_SEL = 5'b00000,
  parameter CMU_NPI_CLK_SEL = "NPI_CLK",
  parameter [7:0] CMU_RXBIAS_SPARE = 8'b00000000,
  parameter CMU_SRCH_ALGORITHM = "LINEAR",
  parameter [4:0] CMU_TXBIAS_SEL = 5'b00000,
  parameter [6:0] CMU_VREF_BIAS = 7'b0000000,
  parameter [6:0] DCI2LTCH_NCODE = 7'b0000000,
  parameter [6:0] DCI2LTCH_PCODE = 7'b0000000,
  parameter DCIUPDATEMODE = "QUIET",
  parameter [1:0] DCI_CASCADE_SEL = 2'b00,
  parameter DCI_CONFIG = "FUNCT",
  parameter [15:0] DCI_DEBUG_SEL = 16'b0000000000000000,
  parameter [3:0] DCI_FLTR_CTRL = 4'b0000,
  parameter DCI_ITER_SEL = "DCI_ITER_8",
  parameter DCI_LOCK_DIR = "FALSE",
  parameter [11:0] DCI_SCL_CTRL_N0 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_N1 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_N2 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_N3 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_N4 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_P0 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_P1 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_P2 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_P3 = 12'b000000000000,
  parameter [11:0] DCI_SCL_CTRL_P4 = 12'b000000000000,
  parameter [5:0] DCI_TYPE = 6'b011111,
  parameter DEBUG_CALTX_RCAL_EN = "FALSE",
  parameter [8:0] DEBUG_CALTX_RCAL_VAL = 9'h000,
  parameter DEBUG_DCI_LOCK_DIR = "FALSE",
  parameter DEBUG_RCAL_M_OVERRIDE = "FALSE",
  parameter DEBUG_VREF_APB_SEL = "FALSE",
  parameter DEBUG_VREF_MONITOR = "FALSE",
  parameter EN_DCI = "FALSE",
  parameter EN_OUT_FLTR = "FALSE",
  parameter [8:0] RCAL_BUS = 9'h000,
  parameter RCAL_ITER_SEL = "RCAL_ITER_8",
  parameter RCAL_MODE = "RCAL_QUIET",
  parameter RCAL_M_OVERRIDE = "FALSE",
  parameter [12:0] RCAL_SCALE = 13'h0000,
  parameter TST_EN = "FALSE",
  parameter [9:0] VREF_0P3_CODE = 10'b0000000000,
  parameter [9:0] VREF_0P5_CODE = 10'b0000000000,
  parameter [9:0] VREF_0P75_CODE = 10'b0000000000,
  parameter [9:0] VREF_12P5_CODE = 10'b0000000000,
  parameter [9:0] VREF_16P7_CODE = 10'b0000000000,
  parameter VREF_MONITOR = "FALSE",
  parameter WAIT_BYPASS = "FALSE"
)(
  output CMU2APB_CK,
  output [3:0] CMU2APB_RD,
  output [14:0] CMU2CMU_RCAL_OUT,
  output [16:0] CMU2XCV_DCI,
  output DCI_LOCK_DONE_DWN,
  output DCI_LOCK_DONE_UP,

  input APB2CMU_CA,
  input APB2CMU_CK,
  input APB2CMU_RST,
  input APB2CMU_WR,
  input [14:0] CMU2CMU_RCAL_IN,
  input CMU_SCAN_EN,
  input CMU_SCAN_MODE,
  input CMU_SCAN_MODE_RST_B,
  input CMU_SCAN_RST_BYP,
  input DCI_LOCK_INIT_DWN,
  input DCI_LOCK_INIT_UP,
  input MASTER_EN_PIN,
  input OCTAD_VREF_H1M,
  input OCTAD_VREF_H1P
);

// define constants
  localparam MODULE_NAME = "X5PHIO_CMU_X32";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "X5PHIO_CMU_X32_dr.v"
`else
  reg [3:0] ANATERM_NVAL_REG = ANATERM_NVAL;
  reg [3:0] ANATERM_PVAL_REG = ANATERM_PVAL;
  reg [40:1] ANATERM_SEL_REG = ANATERM_SEL;
  reg [11:0] ATBMUX_SEL_REG = ATBMUX_SEL;
  reg [120:1] ATB_PATH_SEL_REG = ATB_PATH_SEL;
  reg [40:1] BYP_FREQ_DIV_S2P_CMU_REG = BYP_FREQ_DIV_S2P_CMU;
  reg [40:1] BYP_FREQ_DIV_X5PLL_REG = BYP_FREQ_DIV_X5PLL;
  reg [40:1] CALTX_RCAL_EN_REG = CALTX_RCAL_EN;
  reg [8:0] CALTX_RCAL_VAL_REG = CALTX_RCAL_VAL;
  reg [2:0] CMU_ADLY_BIAS_REG = CMU_ADLY_BIAS;
  reg [104:1] CMU_APB_CLK_SEL_REG = CMU_APB_CLK_SEL;
  reg [4:0] CMU_CTLE_BIAS_REG = CMU_CTLE_BIAS;
  reg [2:0] CMU_D2C_BIAS_REG = CMU_D2C_BIAS;
  reg [10:0] CMU_DFE_BIAS_REG = CMU_DFE_BIAS;
  reg [4:0] CMU_LPRXBIAS_SEL_REG = CMU_LPRXBIAS_SEL;
  reg [104:1] CMU_NPI_CLK_SEL_REG = CMU_NPI_CLK_SEL;
  reg [7:0] CMU_RXBIAS_SPARE_REG = CMU_RXBIAS_SPARE;
  reg [48:1] CMU_SRCH_ALGORITHM_REG = CMU_SRCH_ALGORITHM;
  reg [4:0] CMU_TXBIAS_SEL_REG = CMU_TXBIAS_SEL;
  reg [6:0] CMU_VREF_BIAS_REG = CMU_VREF_BIAS;
  reg [6:0] DCI2LTCH_NCODE_REG = DCI2LTCH_NCODE;
  reg [6:0] DCI2LTCH_PCODE_REG = DCI2LTCH_PCODE;
  reg [80:1] DCIUPDATEMODE_REG = DCIUPDATEMODE;
  reg [1:0] DCI_CASCADE_SEL_REG = DCI_CASCADE_SEL;
  reg [48:1] DCI_CONFIG_REG = DCI_CONFIG;
  reg [15:0] DCI_DEBUG_SEL_REG = DCI_DEBUG_SEL;
  reg [3:0] DCI_FLTR_CTRL_REG = DCI_FLTR_CTRL;
  reg [88:1] DCI_ITER_SEL_REG = DCI_ITER_SEL;
  reg [40:1] DCI_LOCK_DIR_REG = DCI_LOCK_DIR;
  reg [11:0] DCI_SCL_CTRL_N0_REG = DCI_SCL_CTRL_N0;
  reg [11:0] DCI_SCL_CTRL_N1_REG = DCI_SCL_CTRL_N1;
  reg [11:0] DCI_SCL_CTRL_N2_REG = DCI_SCL_CTRL_N2;
  reg [11:0] DCI_SCL_CTRL_N3_REG = DCI_SCL_CTRL_N3;
  reg [11:0] DCI_SCL_CTRL_N4_REG = DCI_SCL_CTRL_N4;
  reg [11:0] DCI_SCL_CTRL_P0_REG = DCI_SCL_CTRL_P0;
  reg [11:0] DCI_SCL_CTRL_P1_REG = DCI_SCL_CTRL_P1;
  reg [11:0] DCI_SCL_CTRL_P2_REG = DCI_SCL_CTRL_P2;
  reg [11:0] DCI_SCL_CTRL_P3_REG = DCI_SCL_CTRL_P3;
  reg [11:0] DCI_SCL_CTRL_P4_REG = DCI_SCL_CTRL_P4;
  reg [5:0] DCI_TYPE_REG = DCI_TYPE;
  reg [40:1] DEBUG_CALTX_RCAL_EN_REG = DEBUG_CALTX_RCAL_EN;
  reg [8:0] DEBUG_CALTX_RCAL_VAL_REG = DEBUG_CALTX_RCAL_VAL;
  reg [40:1] DEBUG_DCI_LOCK_DIR_REG = DEBUG_DCI_LOCK_DIR;
  reg [40:1] DEBUG_RCAL_M_OVERRIDE_REG = DEBUG_RCAL_M_OVERRIDE;
  reg [40:1] DEBUG_VREF_APB_SEL_REG = DEBUG_VREF_APB_SEL;
  reg [40:1] DEBUG_VREF_MONITOR_REG = DEBUG_VREF_MONITOR;
  reg [40:1] EN_DCI_REG = EN_DCI;
  reg [40:1] EN_OUT_FLTR_REG = EN_OUT_FLTR;
  reg [8:0] RCAL_BUS_REG = RCAL_BUS;
  reg [96:1] RCAL_ITER_SEL_REG = RCAL_ITER_SEL;
  reg [80:1] RCAL_MODE_REG = RCAL_MODE;
  reg [40:1] RCAL_M_OVERRIDE_REG = RCAL_M_OVERRIDE;
  reg [12:0] RCAL_SCALE_REG = RCAL_SCALE;
  reg [40:1] TST_EN_REG = TST_EN;
  reg [9:0] VREF_0P3_CODE_REG = VREF_0P3_CODE;
  reg [9:0] VREF_0P5_CODE_REG = VREF_0P5_CODE;
  reg [9:0] VREF_0P75_CODE_REG = VREF_0P75_CODE;
  reg [9:0] VREF_12P5_CODE_REG = VREF_12P5_CODE;
  reg [9:0] VREF_16P7_CODE_REG = VREF_16P7_CODE;
  reg [40:1] VREF_MONITOR_REG = VREF_MONITOR;
  reg [40:1] WAIT_BYPASS_REG = WAIT_BYPASS;
`endif

`ifdef XIL_XECLIB
//reg glblGSR = 1'b0;
`else
//tri0 glblGSR = glbl.GSR;
`endif

  wire CMU2APB_CK_out;
  wire DCI_LOCK_DONE_DWN_out;
  wire DCI_LOCK_DONE_UP_out;
  wire [14:0] CMU2CMU_RCAL_OUT_out;
  wire [16:0] CMU2XCV_DCI_out;
  wire [3:0] CMU2APB_RD_out;

  wire APB2CMU_CA_in;
  wire APB2CMU_CK_in;
  wire APB2CMU_RST_in;
  wire APB2CMU_WR_in;
  wire CMU_SCAN_EN_in;
  wire CMU_SCAN_MODE_RST_B_in;
  wire CMU_SCAN_MODE_in;
  wire CMU_SCAN_RST_BYP_in;
  wire DCI_LOCK_INIT_DWN_in;
  wire DCI_LOCK_INIT_UP_in;
  wire MASTER_EN_PIN_in;
  wire OCTAD_VREF_H1M_in;
  wire OCTAD_VREF_H1P_in;
  wire [14:0] CMU2CMU_RCAL_IN_in;

  assign CMU2APB_CK = CMU2APB_CK_out;
  assign CMU2APB_RD = CMU2APB_RD_out;
  assign CMU2CMU_RCAL_OUT = CMU2CMU_RCAL_OUT_out;
  assign CMU2XCV_DCI = CMU2XCV_DCI_out;
  assign DCI_LOCK_DONE_DWN = DCI_LOCK_DONE_DWN_out;
  assign DCI_LOCK_DONE_UP = DCI_LOCK_DONE_UP_out;

  assign APB2CMU_CA_in = APB2CMU_CA;
  assign APB2CMU_CK_in = APB2CMU_CK;
  assign APB2CMU_RST_in = APB2CMU_RST;
  assign APB2CMU_WR_in = APB2CMU_WR;
  assign CMU2CMU_RCAL_IN_in = CMU2CMU_RCAL_IN;
  assign CMU_SCAN_EN_in = CMU_SCAN_EN;
  assign CMU_SCAN_MODE_RST_B_in = CMU_SCAN_MODE_RST_B;
  assign CMU_SCAN_MODE_in = CMU_SCAN_MODE;
  assign CMU_SCAN_RST_BYP_in = CMU_SCAN_RST_BYP;
  assign DCI_LOCK_INIT_DWN_in = DCI_LOCK_INIT_DWN;
  assign DCI_LOCK_INIT_UP_in = DCI_LOCK_INIT_UP;
  assign MASTER_EN_PIN_in = MASTER_EN_PIN;
  assign OCTAD_VREF_H1M_in = OCTAD_VREF_H1M;
  assign OCTAD_VREF_H1P_in = OCTAD_VREF_H1P;

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
        ((ANATERM_SEL_REG != "FALSE") &&
         (ANATERM_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] ANATERM_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, ANATERM_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ATB_PATH_SEL_REG != "ATB_PATH_UNUSED") &&
         (ATB_PATH_SEL_REG != "BYP_SEL") &&
         (ATB_PATH_SEL_REG != "UGB_SEL"))) begin
      $display("Error: [Unisim %s-105] ATB_PATH_SEL attribute is set to %s.  Legal values for this attribute are ATB_PATH_UNUSED, BYP_SEL or UGB_SEL. Instance: %m", MODULE_NAME, ATB_PATH_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((BYP_FREQ_DIV_S2P_CMU_REG != "FALSE") &&
         (BYP_FREQ_DIV_S2P_CMU_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-106] BYP_FREQ_DIV_S2P_CMU attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, BYP_FREQ_DIV_S2P_CMU_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((BYP_FREQ_DIV_X5PLL_REG != "FALSE") &&
         (BYP_FREQ_DIV_X5PLL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] BYP_FREQ_DIV_X5PLL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, BYP_FREQ_DIV_X5PLL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CALTX_RCAL_EN_REG != "FALSE") &&
         (CALTX_RCAL_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-108] CALTX_RCAL_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CALTX_RCAL_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CMU_APB_CLK_SEL_REG != "APB_CLK") &&
         (CMU_APB_CLK_SEL_REG != "APB_DIV_2_CLK") &&
         (CMU_APB_CLK_SEL_REG != "APB_DIV_4_CLK") &&
         (CMU_APB_CLK_SEL_REG != "APB_DIV_8_CLK"))) begin
      $display("Error: [Unisim %s-111] CMU_APB_CLK_SEL attribute is set to %s.  Legal values for this attribute are APB_CLK, APB_DIV_2_CLK, APB_DIV_4_CLK or APB_DIV_8_CLK. Instance: %m", MODULE_NAME, CMU_APB_CLK_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CMU_NPI_CLK_SEL_REG != "NPI_CLK") &&
         (CMU_NPI_CLK_SEL_REG != "NPI_DIV_4_CLK"))) begin
      $display("Error: [Unisim %s-116] CMU_NPI_CLK_SEL attribute is set to %s.  Legal values for this attribute are NPI_CLK or NPI_DIV_4_CLK. Instance: %m", MODULE_NAME, CMU_NPI_CLK_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CMU_SRCH_ALGORITHM_REG != "LINEAR") &&
         (CMU_SRCH_ALGORITHM_REG != "SAR"))) begin
      $display("Error: [Unisim %s-118] CMU_SRCH_ALGORITHM attribute is set to %s.  Legal values for this attribute are LINEAR or SAR. Instance: %m", MODULE_NAME, CMU_SRCH_ALGORITHM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCIUPDATEMODE_REG != "QUIET") &&
         (DCIUPDATEMODE_REG != "CONTINUOUS") &&
         (DCIUPDATEMODE_REG != "SAFE"))) begin
      $display("Error: [Unisim %s-123] DCIUPDATEMODE attribute is set to %s.  Legal values for this attribute are QUIET, CONTINUOUS or SAFE. Instance: %m", MODULE_NAME, DCIUPDATEMODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCI_CONFIG_REG != "FUNCT") &&
         (DCI_CONFIG_REG != "DEBUG") &&
         (DCI_CONFIG_REG != "FILTER"))) begin
      $display("Error: [Unisim %s-125] DCI_CONFIG attribute is set to %s.  Legal values for this attribute are FUNCT, DEBUG or FILTER. Instance: %m", MODULE_NAME, DCI_CONFIG_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCI_ITER_SEL_REG != "DCI_ITER_8") &&
         (DCI_ITER_SEL_REG != "DCI_ITER_16") &&
         (DCI_ITER_SEL_REG != "DCI_ITER_32"))) begin
      $display("Error: [Unisim %s-128] DCI_ITER_SEL attribute is set to %s.  Legal values for this attribute are DCI_ITER_8, DCI_ITER_16 or DCI_ITER_32. Instance: %m", MODULE_NAME, DCI_ITER_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCI_LOCK_DIR_REG != "FALSE") &&
         (DCI_LOCK_DIR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-129] DCI_LOCK_DIR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DCI_LOCK_DIR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DEBUG_CALTX_RCAL_EN_REG != "FALSE") &&
         (DEBUG_CALTX_RCAL_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-141] DEBUG_CALTX_RCAL_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DEBUG_CALTX_RCAL_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DEBUG_DCI_LOCK_DIR_REG != "FALSE") &&
         (DEBUG_DCI_LOCK_DIR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-143] DEBUG_DCI_LOCK_DIR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DEBUG_DCI_LOCK_DIR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DEBUG_RCAL_M_OVERRIDE_REG != "FALSE") &&
         (DEBUG_RCAL_M_OVERRIDE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-144] DEBUG_RCAL_M_OVERRIDE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DEBUG_RCAL_M_OVERRIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DEBUG_VREF_APB_SEL_REG != "FALSE") &&
         (DEBUG_VREF_APB_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-145] DEBUG_VREF_APB_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DEBUG_VREF_APB_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DEBUG_VREF_MONITOR_REG != "FALSE") &&
         (DEBUG_VREF_MONITOR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-146] DEBUG_VREF_MONITOR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DEBUG_VREF_MONITOR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_DCI_REG != "FALSE") &&
         (EN_DCI_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-147] EN_DCI attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_DCI_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OUT_FLTR_REG != "FALSE") &&
         (EN_OUT_FLTR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-148] EN_OUT_FLTR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OUT_FLTR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RCAL_ITER_SEL_REG != "RCAL_ITER_8") &&
         (RCAL_ITER_SEL_REG != "RCAL_ITER_16") &&
         (RCAL_ITER_SEL_REG != "RCAL_ITER_32"))) begin
      $display("Error: [Unisim %s-150] RCAL_ITER_SEL attribute is set to %s.  Legal values for this attribute are RCAL_ITER_8, RCAL_ITER_16 or RCAL_ITER_32. Instance: %m", MODULE_NAME, RCAL_ITER_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RCAL_MODE_REG != "RCAL_QUIET") &&
         (RCAL_MODE_REG != "RCAL_CONT"))) begin
      $display("Error: [Unisim %s-151] RCAL_MODE attribute is set to %s.  Legal values for this attribute are RCAL_QUIET or RCAL_CONT. Instance: %m", MODULE_NAME, RCAL_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RCAL_M_OVERRIDE_REG != "FALSE") &&
         (RCAL_M_OVERRIDE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-152] RCAL_M_OVERRIDE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RCAL_M_OVERRIDE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TST_EN_REG != "FALSE") &&
         (TST_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-154] TST_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TST_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((VREF_MONITOR_REG != "FALSE") &&
         (VREF_MONITOR_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-160] VREF_MONITOR attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, VREF_MONITOR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WAIT_BYPASS_REG != "FALSE") &&
         (WAIT_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-161] WAIT_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WAIT_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif




  SIP_X5PHIO_CMU_X32 SIP_X5PHIO_CMU_X32_INST (
    .ANATERM_NVAL (ANATERM_NVAL_REG),
    .ANATERM_PVAL (ANATERM_PVAL_REG),
    .ANATERM_SEL (ANATERM_SEL_REG),
    .ATBMUX_SEL (ATBMUX_SEL_REG),
    .ATB_PATH_SEL (ATB_PATH_SEL_REG),
    .BYP_FREQ_DIV_S2P_CMU (BYP_FREQ_DIV_S2P_CMU_REG),
    .BYP_FREQ_DIV_X5PLL (BYP_FREQ_DIV_X5PLL_REG),
    .CALTX_RCAL_EN (CALTX_RCAL_EN_REG),
    .CALTX_RCAL_VAL (CALTX_RCAL_VAL_REG),
    .CMU_ADLY_BIAS (CMU_ADLY_BIAS_REG),
    .CMU_APB_CLK_SEL (CMU_APB_CLK_SEL_REG),
    .CMU_CTLE_BIAS (CMU_CTLE_BIAS_REG),
    .CMU_D2C_BIAS (CMU_D2C_BIAS_REG),
    .CMU_DFE_BIAS (CMU_DFE_BIAS_REG),
    .CMU_LPRXBIAS_SEL (CMU_LPRXBIAS_SEL_REG),
    .CMU_NPI_CLK_SEL (CMU_NPI_CLK_SEL_REG),
    .CMU_RXBIAS_SPARE (CMU_RXBIAS_SPARE_REG),
    .CMU_SRCH_ALGORITHM (CMU_SRCH_ALGORITHM_REG),
    .CMU_TXBIAS_SEL (CMU_TXBIAS_SEL_REG),
    .CMU_VREF_BIAS (CMU_VREF_BIAS_REG),
    .DCI2LTCH_NCODE (DCI2LTCH_NCODE_REG),
    .DCI2LTCH_PCODE (DCI2LTCH_PCODE_REG),
    .DCIUPDATEMODE (DCIUPDATEMODE_REG),
    .DCI_CASCADE_SEL (DCI_CASCADE_SEL_REG),
    .DCI_CONFIG (DCI_CONFIG_REG),
    .DCI_DEBUG_SEL (DCI_DEBUG_SEL_REG),
    .DCI_FLTR_CTRL (DCI_FLTR_CTRL_REG),
    .DCI_ITER_SEL (DCI_ITER_SEL_REG),
    .DCI_LOCK_DIR (DCI_LOCK_DIR_REG),
    .DCI_SCL_CTRL_N0 (DCI_SCL_CTRL_N0_REG),
    .DCI_SCL_CTRL_N1 (DCI_SCL_CTRL_N1_REG),
    .DCI_SCL_CTRL_N2 (DCI_SCL_CTRL_N2_REG),
    .DCI_SCL_CTRL_N3 (DCI_SCL_CTRL_N3_REG),
    .DCI_SCL_CTRL_N4 (DCI_SCL_CTRL_N4_REG),
    .DCI_SCL_CTRL_P0 (DCI_SCL_CTRL_P0_REG),
    .DCI_SCL_CTRL_P1 (DCI_SCL_CTRL_P1_REG),
    .DCI_SCL_CTRL_P2 (DCI_SCL_CTRL_P2_REG),
    .DCI_SCL_CTRL_P3 (DCI_SCL_CTRL_P3_REG),
    .DCI_SCL_CTRL_P4 (DCI_SCL_CTRL_P4_REG),
    .DCI_TYPE (DCI_TYPE_REG),
    .DEBUG_CALTX_RCAL_EN (DEBUG_CALTX_RCAL_EN_REG),
    .DEBUG_CALTX_RCAL_VAL (DEBUG_CALTX_RCAL_VAL_REG),
    .DEBUG_DCI_LOCK_DIR (DEBUG_DCI_LOCK_DIR_REG),
    .DEBUG_RCAL_M_OVERRIDE (DEBUG_RCAL_M_OVERRIDE_REG),
    .DEBUG_VREF_APB_SEL (DEBUG_VREF_APB_SEL_REG),
    .DEBUG_VREF_MONITOR (DEBUG_VREF_MONITOR_REG),
    .EN_DCI (EN_DCI_REG),
    .EN_OUT_FLTR (EN_OUT_FLTR_REG),
    .RCAL_BUS (RCAL_BUS_REG),
    .RCAL_ITER_SEL (RCAL_ITER_SEL_REG),
    .RCAL_MODE (RCAL_MODE_REG),
    .RCAL_M_OVERRIDE (RCAL_M_OVERRIDE_REG),
    .RCAL_SCALE (RCAL_SCALE_REG),
    .TST_EN (TST_EN_REG),
    .VREF_0P3_CODE (VREF_0P3_CODE_REG),
    .VREF_0P5_CODE (VREF_0P5_CODE_REG),
    .VREF_0P75_CODE (VREF_0P75_CODE_REG),
    .VREF_12P5_CODE (VREF_12P5_CODE_REG),
    .VREF_16P7_CODE (VREF_16P7_CODE_REG),
    .VREF_MONITOR (VREF_MONITOR_REG),
    .WAIT_BYPASS (WAIT_BYPASS_REG),
    .CMU2APB_CK (CMU2APB_CK_out),
    .CMU2APB_RD (CMU2APB_RD_out),
    .CMU2CMU_RCAL_OUT (CMU2CMU_RCAL_OUT_out),
    .CMU2XCV_DCI (CMU2XCV_DCI_out),
    .DCI_LOCK_DONE_DWN (DCI_LOCK_DONE_DWN_out),
    .DCI_LOCK_DONE_UP (DCI_LOCK_DONE_UP_out),
    .APB2CMU_CA (APB2CMU_CA_in),
    .APB2CMU_CK (APB2CMU_CK_in),
    .APB2CMU_RST (APB2CMU_RST_in),
    .APB2CMU_WR (APB2CMU_WR_in),
    .CMU2CMU_RCAL_IN (CMU2CMU_RCAL_IN_in),
    .CMU_SCAN_EN (CMU_SCAN_EN_in),
    .CMU_SCAN_MODE (CMU_SCAN_MODE_in),
    .CMU_SCAN_MODE_RST_B (CMU_SCAN_MODE_RST_B_in),
    .CMU_SCAN_RST_BYP (CMU_SCAN_RST_BYP_in),
    .DCI_LOCK_INIT_DWN (DCI_LOCK_INIT_DWN_in),
    .DCI_LOCK_INIT_UP (DCI_LOCK_INIT_UP_in),
    .MASTER_EN_PIN (MASTER_EN_PIN_in),
    .OCTAD_VREF_H1M (OCTAD_VREF_H1M_in),
    .OCTAD_VREF_H1P (OCTAD_VREF_H1P_in)
    //.GSR (glblGSR)
  );

endmodule

`endcelldefine
