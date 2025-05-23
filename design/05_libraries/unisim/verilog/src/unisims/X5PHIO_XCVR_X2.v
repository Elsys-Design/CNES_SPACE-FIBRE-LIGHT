///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2024.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        X5PHIO_XCVR_X2
// /___/   /\      Filename    : X5PHIO_XCVR_X2.v
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

module X5PHIO_XCVR_X2 #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [0:0] ADL_H1ME_OFST_POL_M = 1'b0,
  parameter [0:0] ADL_H1ME_OFST_POL_S = 1'b0,
  parameter [3:0] ADL_H1ME_OFST_VALUE_M = 4'b0000,
  parameter [3:0] ADL_H1ME_OFST_VALUE_S = 4'b0000,
  parameter [0:0] ADL_H1MO_OFST_POL_M = 1'b0,
  parameter [0:0] ADL_H1MO_OFST_POL_S = 1'b0,
  parameter [3:0] ADL_H1MO_OFST_VALUE_M = 4'b0000,
  parameter [3:0] ADL_H1MO_OFST_VALUE_S = 4'b0000,
  parameter [0:0] ADL_H1PE_OFST_POL_M = 1'b0,
  parameter [0:0] ADL_H1PE_OFST_POL_S = 1'b0,
  parameter [3:0] ADL_H1PE_OFST_VALUE_M = 4'b0000,
  parameter [3:0] ADL_H1PE_OFST_VALUE_S = 4'b0000,
  parameter [0:0] ADL_H1PO_OFST_POL_M = 1'b0,
  parameter [0:0] ADL_H1PO_OFST_POL_S = 1'b0,
  parameter [3:0] ADL_H1PO_OFST_VALUE_M = 4'b0000,
  parameter [3:0] ADL_H1PO_OFST_VALUE_S = 4'b0000,
  parameter integer APBCLK_FREQ = 0,
  parameter CASCADE_IDL_M = "UNUSED_CASC",
  parameter CASCADE_IDL_S = "UNUSED_CASC",
  parameter CASCADE_ODL_M = "UNUSED_CASC_O",
  parameter CASCADE_ODL_S = "UNUSED_CASC_O",
  parameter CCIO_EN_M = "FALSE",
  parameter CCIO_EN_S = "FALSE",
  parameter integer CLOCK_FREQ = 200,
  parameter CONTINUOUS_DQS = "FALSE",
  parameter [0:0] CPHY_MODE_CTRL = 1'b0,
  parameter CPHY_TERM_M = "FALSE",
  parameter CPHY_TERM_S = "FALSE",
  parameter CTLE_EQ_M = "CTLE_EQ_NONE",
  parameter CTLE_EQ_S = "CTLE_EQ_NONE",
  parameter [0:0] CTLE_H1M_OFST_POL_M = 1'b0,
  parameter [0:0] CTLE_H1M_OFST_POL_S = 1'b0,
  parameter [5:0] CTLE_H1M_OFST_VAL_M = 6'b000000,
  parameter [5:0] CTLE_H1M_OFST_VAL_S = 6'b000000,
  parameter [0:0] CTLE_H1P_OFST_POL_M = 1'b0,
  parameter [0:0] CTLE_H1P_OFST_POL_S = 1'b0,
  parameter [5:0] CTLE_H1P_OFST_VAL_M = 6'b000000,
  parameter [5:0] CTLE_H1P_OFST_VAL_S = 6'b000000,
  parameter CTLE_OFST_M = "CTLE_OFST_NONE",
  parameter CTLE_OFST_S = "CTLE_OFST_NONE",
  parameter DFE_EQ_M = "DFE_NONE",
  parameter DFE_EQ_S = "DFE_NONE",
  parameter [0:0] DFE_H2_NEG_POL_M = 1'b0,
  parameter [0:0] DFE_H2_NEG_POL_S = 1'b0,
  parameter [4:0] DFE_H2_TAP_WEIGHT_M = 5'b00000,
  parameter [4:0] DFE_H2_TAP_WEIGHT_S = 5'b00000,
  parameter [0:0] DFE_H3_NEG_POL_M = 1'b0,
  parameter [0:0] DFE_H3_NEG_POL_S = 1'b0,
  parameter [4:0] DFE_H3_TAP_WEIGHT_M = 5'b00000,
  parameter [4:0] DFE_H3_TAP_WEIGHT_S = 5'b00000,
  parameter [0:0] DFE_H4_NEG_POL_M = 1'b0,
  parameter [0:0] DFE_H4_NEG_POL_S = 1'b0,
  parameter [3:0] DFE_H4_TAP_WEIGHT_M = 4'b0000,
  parameter [3:0] DFE_H4_TAP_WEIGHT_S = 4'b0000,
  parameter DFE_INIT_M = "RESET",
  parameter DFE_INIT_S = "RESET",
  parameter DIFF_PIN_SWAP = "FALSE",
  parameter DIFF_SLAVE_RX_EN = "FALSE",
  parameter DIFF_TERM = "FALSE",
  parameter DIV64CLK_EN = "FALSE",
  parameter DQS_ANA_DETECTION_M = "FALSE",
  parameter DQS_ANA_DETECTION_S = "FALSE",
  parameter DQS_BIAS_M = "FALSE",
  parameter DQS_BIAS_S = "FALSE",
  parameter integer DRIVE_M = 8,
  parameter integer DRIVE_S = 8,
  parameter DYNAMIC_DCI_TS_0 = "FALSE",
  parameter DYNAMIC_DCI_TS_1 = "FALSE",
  parameter EN_OMUX = "FALSE",
  parameter IO_TYPE_M = "OFF_TYPE",
  parameter IO_TYPE_S = "OFF_TYPE",
  parameter ISTANDARD_M = "UNUSED",
  parameter ISTANDARD_S = "UNUSED",
  parameter LL_2TO1_MODE_0 = "FALSE",
  parameter LL_2TO1_MODE_1 = "FALSE",
  parameter MIPI_ALPRX_EN_M = "FALSE",
  parameter MIPI_ALPRX_EN_S = "FALSE",
  parameter MIPI_ALPTX_EN_M = "FALSE",
  parameter MIPI_ALPTX_EN_S = "FALSE",
  parameter MIPI_CPHY_PAD_M = "MIPI_CPHY_PAD_A",
  parameter MIPI_CPHY_PAD_S = "MIPI_CPHY_PAD_A",
  parameter [1:0] ODLY_SRC_M = 2'b00,
  parameter [1:0] ODLY_SRC_S = 2'b00,
  parameter OSTANDARD_M = "UNUSED",
  parameter OSTANDARD_S = "UNUSED",
  parameter PHY2IOB_T_0 = "FALSE",
  parameter PHY2IOB_T_1 = "FALSE",
  parameter integer PHY2XCV_LATENCY = 8,
  parameter [7:0] RD_CTL_MUXSEL = 8'b00000000,
  parameter RIUCLK_DBLR_BYPASS = "FALSE",
  parameter ROUTETHRU_0 = "TRUE",
  parameter ROUTETHRU_1 = "TRUE",
  parameter RX2TX_LOOPBACK_M = "FALSE",
  parameter RX2TX_LOOPBACK_S = "FALSE",
  parameter RX_CLOCK = "BY_4",
  parameter RX_CLOCK_ALIGN_M = "RX_CLOCK_ALIGN_NONE",
  parameter RX_CLOCK_ALIGN_S = "RX_CLOCK_ALIGN_NONE",
  parameter integer RX_DATA_WIDTH_M = 16,
  parameter integer RX_DATA_WIDTH_S = 16,
  parameter RX_GATING = "DISABLE",
  parameter [1:0] RX_LOAD_DLY = 2'b00,
  parameter [0:0] SA_H1ME_OFST_POL_M = 1'b0,
  parameter [0:0] SA_H1ME_OFST_POL_S = 1'b0,
  parameter [5:0] SA_H1ME_OFST_VAL_M = 6'b000000,
  parameter [5:0] SA_H1ME_OFST_VAL_S = 6'b000000,
  parameter [0:0] SA_H1MO_OFST_POL_M = 1'b0,
  parameter [0:0] SA_H1MO_OFST_POL_S = 1'b0,
  parameter [5:0] SA_H1MO_OFST_VAL_M = 6'b000000,
  parameter [5:0] SA_H1MO_OFST_VAL_S = 6'b000000,
  parameter [0:0] SA_H1PE_OFST_POL_M = 1'b0,
  parameter [0:0] SA_H1PE_OFST_POL_S = 1'b0,
  parameter [5:0] SA_H1PE_OFST_VAL_M = 6'b000000,
  parameter [5:0] SA_H1PE_OFST_VAL_S = 6'b000000,
  parameter [0:0] SA_H1PO_OFST_POL_M = 1'b0,
  parameter [0:0] SA_H1PO_OFST_POL_S = 1'b0,
  parameter [5:0] SA_H1PO_OFST_VAL_M = 6'b000000,
  parameter [5:0] SA_H1PO_OFST_VAL_S = 6'b000000,
  parameter SA_OFST_CAL_M = "SA_OFST_NONE",
  parameter SA_OFST_CAL_S = "SA_OFST_NONE",
  parameter integer SIM_VERSION = 1,
  parameter SLEW_M = "FAST",
  parameter SLEW_S = "FAST",
  parameter SLV_WRLVL_MODE = "FALSE",
  parameter [7:0] TX0_ANALOG_SPARE0 = 8'b00000000,
  parameter [7:0] TX0_DIG_SPARE0 = 8'b00000000,
  parameter TX0_ODLY_CASC_EN = "FALSE",
  parameter TX0_OUTPUT_PHASE_90 = "FALSE",
  parameter [7:0] TX1_ANALOG_SPARE0 = 8'b00000000,
  parameter [7:0] TX1_DIG_SPARE0 = 8'b00000000,
  parameter TX1_ODLY_CASC_EN = "FALSE",
  parameter TX1_OUTPUT_PHASE_90 = "FALSE",
  parameter TX2RX_PREDRV_LOOPBACK_M = "FALSE",
  parameter TX2RX_PREDRV_LOOPBACK_S = "FALSE",
  parameter TX2RX_RETIMER_LOOPBACK_M = "FALSE",
  parameter TX2RX_RETIMER_LOOPBACK_S = "FALSE",
  parameter integer TX_DATA_WIDTH = 16,
  parameter TX_DRV_HP_EN_M = "FALSE",
  parameter TX_DRV_HP_EN_S = "FALSE",
  parameter TX_INIT_0 = "FALSE",
  parameter TX_INIT_1 = "FALSE",
  parameter TX_INIT_T = "FALSE",
  parameter USE_IBUFDISABLE_M = "FALSE_IBUFDIS",
  parameter USE_IBUFDISABLE_S = "FALSE_IBUFDIS",
  parameter [0:0] VREF_H1M_PER_OCTAD_M = 1'b0,
  parameter [0:0] VREF_H1M_PER_OCTAD_S = 1'b0,
  parameter [9:0] VREF_H1M_VALUE_M = 10'b0000000000,
  parameter [9:0] VREF_H1M_VALUE_S = 10'b0000000000,
  parameter [0:0] VREF_H1P_PER_OCTAD_M = 1'b0,
  parameter [0:0] VREF_H1P_PER_OCTAD_S = 1'b0,
  parameter [9:0] VREF_H1P_VALUE_M = 10'b0000000000,
  parameter [9:0] VREF_H1P_VALUE_S = 10'b0000000000,
  parameter [7:0] WR_CTL_MUXSEL = 8'b00000000,
  parameter [7:0] WR_DQ0_MUXSEL = 8'b00000000,
  parameter [7:0] WR_DQ1_MUXSEL = 8'b00000000,
  parameter [7:0] WR_EN0_MUXSEL = 8'b00000000,
  parameter [7:0] WR_EN1_MUXSEL = 8'b00000000
)(
  output [16:0] DCI_BUS_BUF_OUT,
  output DQS_DLY_OUT_M,
  output DQS_DLY_OUT_R,
  output XCV2CGL_RX0_RDQS_P_OUT_CLK,
  output XCV2CGL_RX1_RDQS_P_OUT_CLK,
  output XCV2CLK_DIV64_CLK,
  output [3:0] XCV2CLK_RIU_CLK0_DCD_ADJ,
  output XCV2CLK_RIU_CLK0_DCD_ADJ_SEL,
  output [3:0] XCV2CLK_RIU_CLK90_DCD_ADJ,
  output XCV2CLK_RIU_CLK90_DCD_ADJ_SEL,
  output XCV2PHYPLL_RX_OUT_M,
  output XCV2PHYPLL_RX_OUT_S,
  output [1:0] XCV2PHY_RD_CLK,
  output [15:0] XCV2PHY_RD_DQ,
  output XCV2PHY_WR_CLK,
  output XCV2RIU_CK,
  output [3:0] XCV2RIU_RD,
  output XCV2XCV_CPHY_CLK_OUT,
  output XCV2XCV_NDQS_DLY_O,
  output XCV2XCV_NDQS_O,
  output XCV2XCV_PDQS_DLY_O,
  output XCV2XCV_PDQS_O,
  output XCV2XCV_RX0_RDQS_OUT,
  output XCV2XCV_RX1_RDQS_OUT,
  output [1:0] XCV2XCV_RX2TX_DOUT,
  output XCV2XCV_VREF_H1M_O,
  output XCV2XCV_VREF_H1P_O,

  inout DIFF_N,
  inout DIFF_P,

  input [4:0] CFGXCV_SCAN_DATA_OUT_INT,
  input CFGXCV_SCAN_EN,
  input CFGXCV_SCAN_MODE,
  input CFGXCV_SCAN_MODE_RST,
  input CFGXCV_SCAN_RST_BYP,
  input [16:0] CMU2XCV_DCI,
  input DQS_IN_R,
  input PHY2XCV_2TO1_CLK,
  input [1:0] PHY2XCV_DYNAMIC_DCI_TS,
  input [1:0] PHY2XCV_IBUF_DIS_OR_HS_RX_DIS,
  input [7:0] PHY2XCV_RD_CTL,
  input [9:0] PHY2XCV_WR_CTL,
  input [31:0] PHY2XCV_WR_DQ,
  input PLL_CLK0,
  input PLL_CLK90,
  input RIU2XCV_CA,
  input RIU2XCV_CK,
  input RIU2XCV_RST,
  input RIU2XCV_WR,
  input XCV2CGL_RX1_NDQS_DLY_IN,
  input XCV2CGL_RX2_NDQS_DLY_IN,
  input XCV2XCV_CPHY_CLK_IN,
  input XCV2XCV_NDQS_IN,
  input XCV2XCV_PAD_N,
  input XCV2XCV_PAD_P,
  input XCV2XCV_PDQS_IN,
  input XCV2XCV_RX0_RDQS_IN,
  input XCV2XCV_RX1_RDQS_IN,
  input [1:0] XCV2XCV_RX2TX_DIN,
  input XCV2XCV_RX2_RDQS_IN,
  input XCV2XCV_VREF_H1M_I,
  input XCV2XCV_VREF_H1P_I
);

// define constants
  localparam MODULE_NAME = "X5PHIO_XCVR_X2";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "X5PHIO_XCVR_X2_dr.v"
`else
  reg [0:0] ADL_H1ME_OFST_POL_M_REG = ADL_H1ME_OFST_POL_M;
  reg [0:0] ADL_H1ME_OFST_POL_S_REG = ADL_H1ME_OFST_POL_S;
  reg [3:0] ADL_H1ME_OFST_VALUE_M_REG = ADL_H1ME_OFST_VALUE_M;
  reg [3:0] ADL_H1ME_OFST_VALUE_S_REG = ADL_H1ME_OFST_VALUE_S;
  reg [0:0] ADL_H1MO_OFST_POL_M_REG = ADL_H1MO_OFST_POL_M;
  reg [0:0] ADL_H1MO_OFST_POL_S_REG = ADL_H1MO_OFST_POL_S;
  reg [3:0] ADL_H1MO_OFST_VALUE_M_REG = ADL_H1MO_OFST_VALUE_M;
  reg [3:0] ADL_H1MO_OFST_VALUE_S_REG = ADL_H1MO_OFST_VALUE_S;
  reg [0:0] ADL_H1PE_OFST_POL_M_REG = ADL_H1PE_OFST_POL_M;
  reg [0:0] ADL_H1PE_OFST_POL_S_REG = ADL_H1PE_OFST_POL_S;
  reg [3:0] ADL_H1PE_OFST_VALUE_M_REG = ADL_H1PE_OFST_VALUE_M;
  reg [3:0] ADL_H1PE_OFST_VALUE_S_REG = ADL_H1PE_OFST_VALUE_S;
  reg [0:0] ADL_H1PO_OFST_POL_M_REG = ADL_H1PO_OFST_POL_M;
  reg [0:0] ADL_H1PO_OFST_POL_S_REG = ADL_H1PO_OFST_POL_S;
  reg [3:0] ADL_H1PO_OFST_VALUE_M_REG = ADL_H1PO_OFST_VALUE_M;
  reg [3:0] ADL_H1PO_OFST_VALUE_S_REG = ADL_H1PO_OFST_VALUE_S;
  reg [8:0] APBCLK_FREQ_REG = APBCLK_FREQ;
  reg [96:1] CASCADE_IDL_M_REG = CASCADE_IDL_M;
  reg [96:1] CASCADE_IDL_S_REG = CASCADE_IDL_S;
  reg [104:1] CASCADE_ODL_M_REG = CASCADE_ODL_M;
  reg [104:1] CASCADE_ODL_S_REG = CASCADE_ODL_S;
  reg [40:1] CCIO_EN_M_REG = CCIO_EN_M;
  reg [40:1] CCIO_EN_S_REG = CCIO_EN_S;
  reg [12:0] CLOCK_FREQ_REG = CLOCK_FREQ;
  reg [40:1] CONTINUOUS_DQS_REG = CONTINUOUS_DQS;
  reg [0:0] CPHY_MODE_CTRL_REG = CPHY_MODE_CTRL;
  reg [40:1] CPHY_TERM_M_REG = CPHY_TERM_M;
  reg [40:1] CPHY_TERM_S_REG = CPHY_TERM_S;
  reg [112:1] CTLE_EQ_M_REG = CTLE_EQ_M;
  reg [112:1] CTLE_EQ_S_REG = CTLE_EQ_S;
  reg [0:0] CTLE_H1M_OFST_POL_M_REG = CTLE_H1M_OFST_POL_M;
  reg [0:0] CTLE_H1M_OFST_POL_S_REG = CTLE_H1M_OFST_POL_S;
  reg [5:0] CTLE_H1M_OFST_VAL_M_REG = CTLE_H1M_OFST_VAL_M;
  reg [5:0] CTLE_H1M_OFST_VAL_S_REG = CTLE_H1M_OFST_VAL_S;
  reg [0:0] CTLE_H1P_OFST_POL_M_REG = CTLE_H1P_OFST_POL_M;
  reg [0:0] CTLE_H1P_OFST_POL_S_REG = CTLE_H1P_OFST_POL_S;
  reg [5:0] CTLE_H1P_OFST_VAL_M_REG = CTLE_H1P_OFST_VAL_M;
  reg [5:0] CTLE_H1P_OFST_VAL_S_REG = CTLE_H1P_OFST_VAL_S;
  reg [128:1] CTLE_OFST_M_REG = CTLE_OFST_M;
  reg [128:1] CTLE_OFST_S_REG = CTLE_OFST_S;
  reg [120:1] DFE_EQ_M_REG = DFE_EQ_M;
  reg [120:1] DFE_EQ_S_REG = DFE_EQ_S;
  reg [0:0] DFE_H2_NEG_POL_M_REG = DFE_H2_NEG_POL_M;
  reg [0:0] DFE_H2_NEG_POL_S_REG = DFE_H2_NEG_POL_S;
  reg [4:0] DFE_H2_TAP_WEIGHT_M_REG = DFE_H2_TAP_WEIGHT_M;
  reg [4:0] DFE_H2_TAP_WEIGHT_S_REG = DFE_H2_TAP_WEIGHT_S;
  reg [0:0] DFE_H3_NEG_POL_M_REG = DFE_H3_NEG_POL_M;
  reg [0:0] DFE_H3_NEG_POL_S_REG = DFE_H3_NEG_POL_S;
  reg [4:0] DFE_H3_TAP_WEIGHT_M_REG = DFE_H3_TAP_WEIGHT_M;
  reg [4:0] DFE_H3_TAP_WEIGHT_S_REG = DFE_H3_TAP_WEIGHT_S;
  reg [0:0] DFE_H4_NEG_POL_M_REG = DFE_H4_NEG_POL_M;
  reg [0:0] DFE_H4_NEG_POL_S_REG = DFE_H4_NEG_POL_S;
  reg [3:0] DFE_H4_TAP_WEIGHT_M_REG = DFE_H4_TAP_WEIGHT_M;
  reg [3:0] DFE_H4_TAP_WEIGHT_S_REG = DFE_H4_TAP_WEIGHT_S;
  reg [40:1] DFE_INIT_M_REG = DFE_INIT_M;
  reg [40:1] DFE_INIT_S_REG = DFE_INIT_S;
  reg [40:1] DIFF_PIN_SWAP_REG = DIFF_PIN_SWAP;
  reg [40:1] DIFF_SLAVE_RX_EN_REG = DIFF_SLAVE_RX_EN;
  reg [40:1] DIFF_TERM_REG = DIFF_TERM;
  reg [40:1] DIV64CLK_EN_REG = DIV64CLK_EN;
  reg [40:1] DQS_ANA_DETECTION_M_REG = DQS_ANA_DETECTION_M;
  reg [40:1] DQS_ANA_DETECTION_S_REG = DQS_ANA_DETECTION_S;
  reg [40:1] DQS_BIAS_M_REG = DQS_BIAS_M;
  reg [40:1] DQS_BIAS_S_REG = DQS_BIAS_S;
  reg [4:0] DRIVE_M_REG = DRIVE_M;
  reg [4:0] DRIVE_S_REG = DRIVE_S;
  reg [40:1] DYNAMIC_DCI_TS_0_REG = DYNAMIC_DCI_TS_0;
  reg [40:1] DYNAMIC_DCI_TS_1_REG = DYNAMIC_DCI_TS_1;
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [80:1] IO_TYPE_M_REG = IO_TYPE_M;
  reg [80:1] IO_TYPE_S_REG = IO_TYPE_S;
  reg [48:1] ISTANDARD_M_REG = ISTANDARD_M;
  reg [48:1] ISTANDARD_S_REG = ISTANDARD_S;
  reg [40:1] LL_2TO1_MODE_0_REG = LL_2TO1_MODE_0;
  reg [40:1] LL_2TO1_MODE_1_REG = LL_2TO1_MODE_1;
  reg [40:1] MIPI_ALPRX_EN_M_REG = MIPI_ALPRX_EN_M;
  reg [40:1] MIPI_ALPRX_EN_S_REG = MIPI_ALPRX_EN_S;
  reg [40:1] MIPI_ALPTX_EN_M_REG = MIPI_ALPTX_EN_M;
  reg [40:1] MIPI_ALPTX_EN_S_REG = MIPI_ALPTX_EN_S;
  reg [120:1] MIPI_CPHY_PAD_M_REG = MIPI_CPHY_PAD_M;
  reg [120:1] MIPI_CPHY_PAD_S_REG = MIPI_CPHY_PAD_S;
  reg [1:0] ODLY_SRC_M_REG = ODLY_SRC_M;
  reg [1:0] ODLY_SRC_S_REG = ODLY_SRC_S;
  //reg [48:1] OSTANDARD_M_REG = OSTANDARD_M;
  reg [18*8:1] OSTANDARD_M_REG = OSTANDARD_M;
  //reg [48:1] OSTANDARD_S_REG = OSTANDARD_S;
  reg [18*8:1] OSTANDARD_S_REG = OSTANDARD_S;
  reg [40:1] PHY2IOB_T_0_REG = PHY2IOB_T_0;
  reg [40:1] PHY2IOB_T_1_REG = PHY2IOB_T_1;
  reg [3:0] PHY2XCV_LATENCY_REG = PHY2XCV_LATENCY;
  reg [7:0] RD_CTL_MUXSEL_REG = RD_CTL_MUXSEL;
  reg [40:1] RIUCLK_DBLR_BYPASS_REG = RIUCLK_DBLR_BYPASS;
  reg [40:1] ROUTETHRU_0_REG = ROUTETHRU_0;
  reg [40:1] ROUTETHRU_1_REG = ROUTETHRU_1;
  reg [40:1] RX2TX_LOOPBACK_M_REG = RX2TX_LOOPBACK_M;
  reg [40:1] RX2TX_LOOPBACK_S_REG = RX2TX_LOOPBACK_S;
  reg [88:1] RX_CLOCK_REG = RX_CLOCK;
  reg [152:1] RX_CLOCK_ALIGN_M_REG = RX_CLOCK_ALIGN_M;
  reg [152:1] RX_CLOCK_ALIGN_S_REG = RX_CLOCK_ALIGN_S;
  reg [4:0] RX_DATA_WIDTH_M_REG = RX_DATA_WIDTH_M;
  reg [4:0] RX_DATA_WIDTH_S_REG = RX_DATA_WIDTH_S;
  reg [56:1] RX_GATING_REG = RX_GATING;
  reg [1:0] RX_LOAD_DLY_REG = RX_LOAD_DLY;
  reg [0:0] SA_H1ME_OFST_POL_M_REG = SA_H1ME_OFST_POL_M;
  reg [0:0] SA_H1ME_OFST_POL_S_REG = SA_H1ME_OFST_POL_S;
  reg [5:0] SA_H1ME_OFST_VAL_M_REG = SA_H1ME_OFST_VAL_M;
  reg [5:0] SA_H1ME_OFST_VAL_S_REG = SA_H1ME_OFST_VAL_S;
  reg [0:0] SA_H1MO_OFST_POL_M_REG = SA_H1MO_OFST_POL_M;
  reg [0:0] SA_H1MO_OFST_POL_S_REG = SA_H1MO_OFST_POL_S;
  reg [5:0] SA_H1MO_OFST_VAL_M_REG = SA_H1MO_OFST_VAL_M;
  reg [5:0] SA_H1MO_OFST_VAL_S_REG = SA_H1MO_OFST_VAL_S;
  reg [0:0] SA_H1PE_OFST_POL_M_REG = SA_H1PE_OFST_POL_M;
  reg [0:0] SA_H1PE_OFST_POL_S_REG = SA_H1PE_OFST_POL_S;
  reg [5:0] SA_H1PE_OFST_VAL_M_REG = SA_H1PE_OFST_VAL_M;
  reg [5:0] SA_H1PE_OFST_VAL_S_REG = SA_H1PE_OFST_VAL_S;
  reg [0:0] SA_H1PO_OFST_POL_M_REG = SA_H1PO_OFST_POL_M;
  reg [0:0] SA_H1PO_OFST_POL_S_REG = SA_H1PO_OFST_POL_S;
  reg [5:0] SA_H1PO_OFST_VAL_M_REG = SA_H1PO_OFST_VAL_M;
  reg [5:0] SA_H1PO_OFST_VAL_S_REG = SA_H1PO_OFST_VAL_S;
  reg [112:1] SA_OFST_CAL_M_REG = SA_OFST_CAL_M;
  reg [112:1] SA_OFST_CAL_S_REG = SA_OFST_CAL_S;
  reg [1:0] SIM_VERSION_REG = SIM_VERSION;
  reg [48:1] SLEW_M_REG = SLEW_M;
  reg [48:1] SLEW_S_REG = SLEW_S;
  reg [40:1] SLV_WRLVL_MODE_REG = SLV_WRLVL_MODE;
  reg [7:0] TX0_ANALOG_SPARE0_REG = TX0_ANALOG_SPARE0;
  reg [7:0] TX0_DIG_SPARE0_REG = TX0_DIG_SPARE0;
  reg [40:1] TX0_ODLY_CASC_EN_REG = TX0_ODLY_CASC_EN;
  reg [40:1] TX0_OUTPUT_PHASE_90_REG = TX0_OUTPUT_PHASE_90;
  reg [7:0] TX1_ANALOG_SPARE0_REG = TX1_ANALOG_SPARE0;
  reg [7:0] TX1_DIG_SPARE0_REG = TX1_DIG_SPARE0;
  reg [40:1] TX1_ODLY_CASC_EN_REG = TX1_ODLY_CASC_EN;
  reg [40:1] TX1_OUTPUT_PHASE_90_REG = TX1_OUTPUT_PHASE_90;
  reg [40:1] TX2RX_PREDRV_LOOPBACK_M_REG = TX2RX_PREDRV_LOOPBACK_M;
  reg [40:1] TX2RX_PREDRV_LOOPBACK_S_REG = TX2RX_PREDRV_LOOPBACK_S;
  reg [40:1] TX2RX_RETIMER_LOOPBACK_M_REG = TX2RX_RETIMER_LOOPBACK_M;
  reg [40:1] TX2RX_RETIMER_LOOPBACK_S_REG = TX2RX_RETIMER_LOOPBACK_S;
  reg [4:0] TX_DATA_WIDTH_REG = TX_DATA_WIDTH;
  reg [40:1] TX_DRV_HP_EN_M_REG = TX_DRV_HP_EN_M;
  reg [40:1] TX_DRV_HP_EN_S_REG = TX_DRV_HP_EN_S;
  reg [40:1] TX_INIT_0_REG = TX_INIT_0;
  reg [40:1] TX_INIT_1_REG = TX_INIT_1;
  reg [40:1] TX_INIT_T_REG = TX_INIT_T;
  reg [144:1] USE_IBUFDISABLE_M_REG = USE_IBUFDISABLE_M;
  reg [144:1] USE_IBUFDISABLE_S_REG = USE_IBUFDISABLE_S;
  reg [0:0] VREF_H1M_PER_OCTAD_M_REG = VREF_H1M_PER_OCTAD_M;
  reg [0:0] VREF_H1M_PER_OCTAD_S_REG = VREF_H1M_PER_OCTAD_S;
  reg [9:0] VREF_H1M_VALUE_M_REG = VREF_H1M_VALUE_M;
  reg [9:0] VREF_H1M_VALUE_S_REG = VREF_H1M_VALUE_S;
  reg [0:0] VREF_H1P_PER_OCTAD_M_REG = VREF_H1P_PER_OCTAD_M;
  reg [0:0] VREF_H1P_PER_OCTAD_S_REG = VREF_H1P_PER_OCTAD_S;
  reg [9:0] VREF_H1P_VALUE_M_REG = VREF_H1P_VALUE_M;
  reg [9:0] VREF_H1P_VALUE_S_REG = VREF_H1P_VALUE_S;
  reg [7:0] WR_CTL_MUXSEL_REG = WR_CTL_MUXSEL;
  reg [7:0] WR_DQ0_MUXSEL_REG = WR_DQ0_MUXSEL;
  reg [7:0] WR_DQ1_MUXSEL_REG = WR_DQ1_MUXSEL;
  reg [7:0] WR_EN0_MUXSEL_REG = WR_EN0_MUXSEL;
  reg [7:0] WR_EN1_MUXSEL_REG = WR_EN1_MUXSEL;
`endif

  reg [40:1] DCI_CAL_DISABLE_M_REG = "FALSE";
  reg [40:1] DCI_CAL_DISABLE_S_REG = "FALSE";
  reg [40:1] DFT_OBS_REG = "FALSE";
  reg [327:0] IPROGRAMMING_REG = 328'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [40:1] IS_RX_X5PHIO_REV2_REG = "TRUE";
  reg [64:1] LOOPBK_M_REG = "LPBK_OFF";
  reg [64:1] LOOPBK_S_REG = "LPBK_OFF";
  reg [40:1] OBSE_0_REG = "FALSE";
  reg [40:1] OBSE_1_REG = "FALSE";
  reg [40:1] OBSO_0_REG = "FALSE";
  reg [40:1] OBSO_1_REG = "FALSE";
  reg [208:0] OPROGRAMMING_REG = 209'b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
  reg [7:0] OTHER_SPARE_REG = 8'b00000000;
  reg [144:1] RX_CAL_MUX_SEL_REG = "RX_CAL_REPLICA_CLK";
  reg [40:1] RX_CLK_REPLICA_INV_REG = "FALSE";
  reg [40:1] RX_IGNORE_KEEPER_M_REG = "TRUE";
  reg [40:1] RX_IGNORE_KEEPER_S_REG = "TRUE";
  reg [40:1] RX_TRAINING_CLK_EN_REG = "FALSE";
  reg [96:1] TERM_OVERRIDE_M_REG = "OFF_OVERRIDE";
  reg [96:1] TERM_OVERRIDE_S_REG = "OFF_OVERRIDE";
  reg [7:0] TX0_ANALOG_SPARE_REG = 8'b00000000;
  reg [7:0] TX0_DIG_SPARE_REG = 8'b00000000;
  reg [40:1] TX0_ODLY_RST_REG = "FALSE";
  reg [7:0] TX1_ANALOG_SPARE_REG = 8'b00000000;
  reg [7:0] TX1_DIG_SPARE_REG = 8'b00000000;
  reg [40:1] TX1_ODLY_RST_REG = "FALSE";
  reg [40:1] TXDLYIN_INV_M_REG = "FALSE";
  reg [40:1] TXDLYIN_INV_S_REG = "FALSE";
  reg [40:1] TXIN_INV_M_REG = "FALSE";
  reg [40:1] TXIN_INV_S_REG = "FALSE";
  reg [152:1] X5PHIO_VCCAUX_REG = "X5PHIO_VCCAUX_1P5V";
  reg [128:1] X5PHIO_VCCINT_REG = "X5PHIO_VCCINT_V3";

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire DQS_DLY_OUT_M_out;
  wire DQS_DLY_OUT_R_out;
  wire XCV2CGL_RX0_RDQS_P_OUT_CLK_out;
  wire XCV2CGL_RX1_RDQS_P_OUT_CLK_out;
  wire XCV2CLK_DIV64_CLK_out;
  wire XCV2CLK_NDQS_DLY_REPLICA_out;
  wire XCV2CLK_RIU_CLK0_DCD_ADJ_SEL_out;
  wire XCV2CLK_RIU_CLK90_DCD_ADJ_SEL_out;
  wire XCV2PHYPLL_RX_OUT_M_out;
  wire XCV2PHYPLL_RX_OUT_S_out;
  wire XCV2PHY_WR_CLK_out;
  wire XCV2RIU_CK_out;
  wire XCV2XCV_CPHY_CLK_OUT_out;
  wire XCV2XCV_NDQS_DLY_O_out;
  wire XCV2XCV_NDQS_O_out;
  wire XCV2XCV_PDQS_DLY_O_out;
  wire XCV2XCV_PDQS_O_out;
  wire XCV2XCV_RX0_RDQS_OUT_out;
  wire XCV2XCV_RX1_RDQS_OUT_out;
  wire XCV2XCV_VREF_H1M_O_out;
  wire XCV2XCV_VREF_H1P_O_out;
  wire [15:0] XCV2PHY_RD_DQ_out;
  wire [16:0] DCI_BUS_BUF_OUT_out;
  wire [1:0] XCV2PHY_RD_CLK_out;
  wire [1:0] XCV2XCV_RX2TX_DOUT_out;
  wire [3:0] XCV2CLK_RIU_CLK0_DCD_ADJ_out;
  wire [3:0] XCV2CLK_RIU_CLK90_DCD_ADJ_out;
  wire [3:0] XCV2RIU_RD_out;

  wire CFGXCV_SCAN_EN_in;
  wire CFGXCV_SCAN_MODE_RST_in;
  wire CFGXCV_SCAN_MODE_in;
  wire CFGXCV_SCAN_RST_BYP_in;
  wire DQS_IN_R_in;
  wire PHY2XCV_2TO1_CLK_in;
  wire PLL_CLK0_in;
  wire PLL_CLK90_in;
  wire RIU2XCV_CA_in;
  wire RIU2XCV_CK_in;
  wire RIU2XCV_RST_in;
  wire RIU2XCV_WR_in;
  wire XCV2CGL_RX1_NDQS_DLY_IN_in;
  wire XCV2CGL_RX2_NDQS_DLY_IN_in;
  wire XCV2XCV_CPHY_CLK_IN_in;
  wire XCV2XCV_NDQS_IN_in;
  wire XCV2XCV_PAD_N_in;
  wire XCV2XCV_PAD_P_in;
  wire XCV2XCV_PDQS_IN_in;
  wire XCV2XCV_RX0_RDQS_IN_in;
  wire XCV2XCV_RX1_RDQS_IN_in;
  wire XCV2XCV_RX2_RDQS_IN_in;
  wire XCV2XCV_VREF_H1M_I_in;
  wire XCV2XCV_VREF_H1P_I_in;
  wire [16:0] CMU2XCV_DCI_in;
  wire [1:0] PHY2XCV_DYNAMIC_DCI_TS_in;
  wire [1:0] PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_in;
  wire [1:0] XCV2XCV_RX2TX_DIN_in;
  wire [1:0] XCVR_X2_ID_in;
  wire [31:0] PHY2XCV_WR_DQ_in;
  wire [4:0] CFGXCV_SCAN_DATA_OUT_INT_in;
  wire [7:0] PHY2XCV_RD_CTL_in;
  wire [9:0] PHY2XCV_WR_CTL_in;

  
  assign DCI_BUS_BUF_OUT = DCI_BUS_BUF_OUT_out;
  assign DQS_DLY_OUT_M = DQS_DLY_OUT_M_out;
  assign DQS_DLY_OUT_R = DQS_DLY_OUT_R_out;
  assign XCV2CGL_RX0_RDQS_P_OUT_CLK = XCV2CGL_RX0_RDQS_P_OUT_CLK_out;
  assign XCV2CGL_RX1_RDQS_P_OUT_CLK = XCV2CGL_RX1_RDQS_P_OUT_CLK_out;
  assign XCV2CLK_DIV64_CLK = XCV2CLK_DIV64_CLK_out;
  assign XCV2CLK_RIU_CLK0_DCD_ADJ = XCV2CLK_RIU_CLK0_DCD_ADJ_out;
  assign XCV2CLK_RIU_CLK0_DCD_ADJ_SEL = XCV2CLK_RIU_CLK0_DCD_ADJ_SEL_out;
  assign XCV2CLK_RIU_CLK90_DCD_ADJ = XCV2CLK_RIU_CLK90_DCD_ADJ_out;
  assign XCV2CLK_RIU_CLK90_DCD_ADJ_SEL = XCV2CLK_RIU_CLK90_DCD_ADJ_SEL_out;
  assign XCV2PHYPLL_RX_OUT_M = XCV2PHYPLL_RX_OUT_M_out;
  assign XCV2PHYPLL_RX_OUT_S = XCV2PHYPLL_RX_OUT_S_out;
  assign XCV2PHY_RD_CLK = XCV2PHY_RD_CLK_out;
  assign XCV2PHY_RD_DQ = XCV2PHY_RD_DQ_out;
  assign XCV2PHY_WR_CLK = XCV2PHY_WR_CLK_out;
  assign XCV2RIU_CK = XCV2RIU_CK_out;
  assign XCV2RIU_RD = XCV2RIU_RD_out;
  assign XCV2XCV_CPHY_CLK_OUT = XCV2XCV_CPHY_CLK_OUT_out;
  assign XCV2XCV_NDQS_DLY_O = XCV2XCV_NDQS_DLY_O_out;
  assign XCV2XCV_NDQS_O = XCV2XCV_NDQS_O_out;
  assign XCV2XCV_PDQS_DLY_O = XCV2XCV_PDQS_DLY_O_out;
  assign XCV2XCV_PDQS_O = XCV2XCV_PDQS_O_out;
  assign XCV2XCV_RX0_RDQS_OUT = XCV2XCV_RX0_RDQS_OUT_out;
  assign XCV2XCV_RX1_RDQS_OUT = XCV2XCV_RX1_RDQS_OUT_out;
  assign XCV2XCV_RX2TX_DOUT = XCV2XCV_RX2TX_DOUT_out;
  assign XCV2XCV_VREF_H1M_O = XCV2XCV_VREF_H1M_O_out;
  assign XCV2XCV_VREF_H1P_O = XCV2XCV_VREF_H1P_O_out;

  assign CFGXCV_SCAN_DATA_OUT_INT_in = CFGXCV_SCAN_DATA_OUT_INT;
  assign CFGXCV_SCAN_EN_in = (CFGXCV_SCAN_EN !== 1'bz) && CFGXCV_SCAN_EN; // rv 0
  assign CFGXCV_SCAN_MODE_RST_in = (CFGXCV_SCAN_MODE_RST === 1'bz) || CFGXCV_SCAN_MODE_RST; // rv 1
  assign CFGXCV_SCAN_MODE_in = (CFGXCV_SCAN_MODE !== 1'bz) && CFGXCV_SCAN_MODE; // rv 0
  assign CFGXCV_SCAN_RST_BYP_in = (CFGXCV_SCAN_RST_BYP !== 1'bz) && CFGXCV_SCAN_RST_BYP; // rv 0
  assign CMU2XCV_DCI_in = CMU2XCV_DCI;
  assign DQS_IN_R_in = DQS_IN_R;
  assign PHY2XCV_2TO1_CLK_in = PHY2XCV_2TO1_CLK;
  assign PHY2XCV_DYNAMIC_DCI_TS_in = PHY2XCV_DYNAMIC_DCI_TS;
  assign PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_in = PHY2XCV_IBUF_DIS_OR_HS_RX_DIS;
  assign PHY2XCV_RD_CTL_in = PHY2XCV_RD_CTL;
  assign PHY2XCV_WR_CTL_in = PHY2XCV_WR_CTL;
  assign PHY2XCV_WR_DQ_in = PHY2XCV_WR_DQ;
  assign PLL_CLK0_in = PLL_CLK0;
  assign PLL_CLK90_in = PLL_CLK90;
  assign RIU2XCV_CA_in = RIU2XCV_CA;
  assign RIU2XCV_CK_in = RIU2XCV_CK;
  assign RIU2XCV_RST_in = RIU2XCV_RST;
  assign RIU2XCV_WR_in = RIU2XCV_WR;
  assign XCV2CGL_RX1_NDQS_DLY_IN_in = XCV2CGL_RX1_NDQS_DLY_IN;
  assign XCV2CGL_RX2_NDQS_DLY_IN_in = XCV2CGL_RX2_NDQS_DLY_IN;
  assign XCV2XCV_CPHY_CLK_IN_in = XCV2XCV_CPHY_CLK_IN;
  assign XCV2XCV_NDQS_IN_in = XCV2XCV_NDQS_IN;
  //assign XCV2XCV_PAD_N_in = XCV2XCV_PAD_N;
  //assign XCV2XCV_PAD_P_in = XCV2XCV_PAD_P;
  assign XCV2XCV_PDQS_IN_in = XCV2XCV_PDQS_IN;
  assign XCV2XCV_RX0_RDQS_IN_in = XCV2XCV_RX0_RDQS_IN;
  assign XCV2XCV_RX1_RDQS_IN_in = XCV2XCV_RX1_RDQS_IN;
  assign XCV2XCV_RX2TX_DIN_in = XCV2XCV_RX2TX_DIN;
  assign XCV2XCV_RX2_RDQS_IN_in = XCV2XCV_RX2_RDQS_IN;
  assign XCV2XCV_VREF_H1M_I_in = XCV2XCV_VREF_H1M_I;
  assign XCV2XCV_VREF_H1P_I_in = XCV2XCV_VREF_H1P_I;

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
      $display("Error: [Unisim %s-121] APBCLK_FREQ attribute is set to %d.  Legal values for this attribute are 0 to 500. Instance: %m", MODULE_NAME, APBCLK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_IDL_M_REG != "UNUSED_CASC") &&
         (CASCADE_IDL_M_REG != "DL_TEST") &&
         (CASCADE_IDL_M_REG != "RX_IDLY_CASC") &&
         (CASCADE_IDL_M_REG != "RX_RO_TEST") &&
         (CASCADE_IDL_M_REG != "TX_ODLY_CASC"))) begin
      $display("Error: [Unisim %s-122] CASCADE_IDL_M attribute is set to %s.  Legal values for this attribute are UNUSED_CASC, DL_TEST, RX_IDLY_CASC, RX_RO_TEST or TX_ODLY_CASC. Instance: %m", MODULE_NAME, CASCADE_IDL_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_IDL_S_REG != "UNUSED_CASC") &&
         (CASCADE_IDL_S_REG != "DL_TEST") &&
         (CASCADE_IDL_S_REG != "RX_IDLY_CASC") &&
         (CASCADE_IDL_S_REG != "RX_RO_TEST") &&
         (CASCADE_IDL_S_REG != "TX_ODLY_CASC"))) begin
      $display("Error: [Unisim %s-123] CASCADE_IDL_S attribute is set to %s.  Legal values for this attribute are UNUSED_CASC, DL_TEST, RX_IDLY_CASC, RX_RO_TEST or TX_ODLY_CASC. Instance: %m", MODULE_NAME, CASCADE_IDL_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_ODL_M_REG != "UNUSED_CASC_O") &&
         (CASCADE_ODL_M_REG != "DL_TEST_O"))) begin
      $display("Error: [Unisim %s-124] CASCADE_ODL_M attribute is set to %s.  Legal values for this attribute are UNUSED_CASC_O or DL_TEST_O. Instance: %m", MODULE_NAME, CASCADE_ODL_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CASCADE_ODL_S_REG != "UNUSED_CASC_O") &&
         (CASCADE_ODL_S_REG != "DL_TEST_O"))) begin
      $display("Error: [Unisim %s-125] CASCADE_ODL_S attribute is set to %s.  Legal values for this attribute are UNUSED_CASC_O or DL_TEST_O. Instance: %m", MODULE_NAME, CASCADE_ODL_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CCIO_EN_M_REG != "FALSE") &&
         (CCIO_EN_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-126] CCIO_EN_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CCIO_EN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CCIO_EN_S_REG != "FALSE") &&
         (CCIO_EN_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-127] CCIO_EN_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CCIO_EN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLOCK_FREQ_REG < 200) || (CLOCK_FREQ_REG > 4320))) begin
      $display("Error: [Unisim %s-128] CLOCK_FREQ attribute is set to %d.  Legal values for this attribute are 200 to 4320. Instance: %m", MODULE_NAME, CLOCK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CONTINUOUS_DQS_REG != "FALSE") &&
         (CONTINUOUS_DQS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-129] CONTINUOUS_DQS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CONTINUOUS_DQS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_TERM_M_REG != "FALSE") &&
         (CPHY_TERM_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-133] CPHY_TERM_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_TERM_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_TERM_S_REG != "FALSE") &&
         (CPHY_TERM_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-134] CPHY_TERM_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_TERM_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_EQ_M_REG != "CTLE_EQ_NONE") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_AUTO") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL0") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL1") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL2") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL3") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL4") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL5") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL6") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL7") &&
         (CTLE_EQ_M_REG != "CTLE_EQ_LEVEL8"))) begin
      $display("Error: [Unisim %s-135] CTLE_EQ_M attribute is set to %s.  Legal values for this attribute are CTLE_EQ_NONE, CTLE_EQ_AUTO, CTLE_EQ_LEVEL0, CTLE_EQ_LEVEL1, CTLE_EQ_LEVEL2, CTLE_EQ_LEVEL3, CTLE_EQ_LEVEL4, CTLE_EQ_LEVEL5, CTLE_EQ_LEVEL6, CTLE_EQ_LEVEL7 or CTLE_EQ_LEVEL8. Instance: %m", MODULE_NAME, CTLE_EQ_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_EQ_S_REG != "CTLE_EQ_NONE") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_AUTO") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL0") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL1") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL2") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL3") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL4") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL5") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL6") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL7") &&
         (CTLE_EQ_S_REG != "CTLE_EQ_LEVEL8"))) begin
      $display("Error: [Unisim %s-136] CTLE_EQ_S attribute is set to %s.  Legal values for this attribute are CTLE_EQ_NONE, CTLE_EQ_AUTO, CTLE_EQ_LEVEL0, CTLE_EQ_LEVEL1, CTLE_EQ_LEVEL2, CTLE_EQ_LEVEL3, CTLE_EQ_LEVEL4, CTLE_EQ_LEVEL5, CTLE_EQ_LEVEL6, CTLE_EQ_LEVEL7 or CTLE_EQ_LEVEL8. Instance: %m", MODULE_NAME, CTLE_EQ_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_M_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_M_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_M_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-145] CTLE_OFST_M attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_S_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_S_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_S_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-146] CTLE_OFST_S attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DFE_EQ_M_REG != "DFE_NONE") &&
         (DFE_EQ_M_REG != "DFE_1TAP_AUTO") &&
         (DFE_EQ_M_REG != "DFE_1TAP_MANUAL") &&
         (DFE_EQ_M_REG != "DFE_2TAP_AUTO") &&
         (DFE_EQ_M_REG != "DFE_2TAP_MANUAL") &&
         (DFE_EQ_M_REG != "DFE_3TAP_AUTO") &&
         (DFE_EQ_M_REG != "DFE_3TAP_MANUAL") &&
         (DFE_EQ_M_REG != "DFE_4TAP_AUTO") &&
         (DFE_EQ_M_REG != "DFE_4TAP_MANUAL"))) begin
      $display("Error: [Unisim %s-151] DFE_EQ_M attribute is set to %s.  Legal values for this attribute are DFE_NONE, DFE_1TAP_AUTO, DFE_1TAP_MANUAL, DFE_2TAP_AUTO, DFE_2TAP_MANUAL, DFE_3TAP_AUTO, DFE_3TAP_MANUAL, DFE_4TAP_AUTO or DFE_4TAP_MANUAL. Instance: %m", MODULE_NAME, DFE_EQ_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DFE_EQ_S_REG != "DFE_NONE") &&
         (DFE_EQ_S_REG != "DFE_1TAP_AUTO") &&
         (DFE_EQ_S_REG != "DFE_1TAP_MANUAL") &&
         (DFE_EQ_S_REG != "DFE_2TAP_AUTO") &&
         (DFE_EQ_S_REG != "DFE_2TAP_MANUAL") &&
         (DFE_EQ_S_REG != "DFE_3TAP_AUTO") &&
         (DFE_EQ_S_REG != "DFE_3TAP_MANUAL") &&
         (DFE_EQ_S_REG != "DFE_4TAP_AUTO") &&
         (DFE_EQ_S_REG != "DFE_4TAP_MANUAL"))) begin
      $display("Error: [Unisim %s-152] DFE_EQ_S attribute is set to %s.  Legal values for this attribute are DFE_NONE, DFE_1TAP_AUTO, DFE_1TAP_MANUAL, DFE_2TAP_AUTO, DFE_2TAP_MANUAL, DFE_3TAP_AUTO, DFE_3TAP_MANUAL, DFE_4TAP_AUTO or DFE_4TAP_MANUAL. Instance: %m", MODULE_NAME, DFE_EQ_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DFE_INIT_M_REG != "RESET") &&
         (DFE_INIT_M_REG != "SET"))) begin
      $display("Error: [Unisim %s-165] DFE_INIT_M attribute is set to %s.  Legal values for this attribute are RESET or SET. Instance: %m", MODULE_NAME, DFE_INIT_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DFE_INIT_S_REG != "RESET") &&
         (DFE_INIT_S_REG != "SET"))) begin
      $display("Error: [Unisim %s-166] DFE_INIT_S attribute is set to %s.  Legal values for this attribute are RESET or SET. Instance: %m", MODULE_NAME, DFE_INIT_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIFF_PIN_SWAP_REG != "FALSE") &&
         (DIFF_PIN_SWAP_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-168] DIFF_PIN_SWAP attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_PIN_SWAP_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIFF_SLAVE_RX_EN_REG != "FALSE") &&
         (DIFF_SLAVE_RX_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-169] DIFF_SLAVE_RX_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_SLAVE_RX_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIFF_TERM_REG != "FALSE") &&
         (DIFF_TERM_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-170] DIFF_TERM attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_TERM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DIV64CLK_EN_REG != "FALSE") &&
         (DIV64CLK_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-172] DIV64CLK_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIV64CLK_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_ANA_DETECTION_M_REG != "FALSE") &&
         (DQS_ANA_DETECTION_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-173] DQS_ANA_DETECTION_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_ANA_DETECTION_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_ANA_DETECTION_S_REG != "FALSE") &&
         (DQS_ANA_DETECTION_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-174] DQS_ANA_DETECTION_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_ANA_DETECTION_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_M_REG != "FALSE") &&
         (DQS_BIAS_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-175] DQS_BIAS_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_S_REG != "FALSE") &&
         (DQS_BIAS_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-176] DQS_BIAS_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DRIVE_M_REG < 2) || (DRIVE_M_REG > 24))) begin
      $display("Error: [Unisim %s-179] DRIVE_M attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DRIVE_S_REG < 2) || (DRIVE_S_REG > 24))) begin
      $display("Error: [Unisim %s-180] DRIVE_S attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DYNAMIC_DCI_TS_0_REG != "FALSE") &&
         (DYNAMIC_DCI_TS_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-181] DYNAMIC_DCI_TS_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DYNAMIC_DCI_TS_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DYNAMIC_DCI_TS_1_REG != "FALSE") &&
         (DYNAMIC_DCI_TS_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-182] DYNAMIC_DCI_TS_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DYNAMIC_DCI_TS_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-183] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IO_TYPE_M_REG != "OFF_TYPE") &&
         (IO_TYPE_M_REG != "BIDIR") &&
         (IO_TYPE_M_REG != "INPUT") &&
         (IO_TYPE_M_REG != "IPAD") &&
         (IO_TYPE_M_REG != "OUTPUT") &&
         (IO_TYPE_M_REG != "REFIO") &&
         (IO_TYPE_M_REG != "SYSMON_AUX") &&
         (IO_TYPE_M_REG != "VR") &&
         (IO_TYPE_M_REG != "VREF") &&
         (IO_TYPE_M_REG != "VRN") &&
         (IO_TYPE_M_REG != "VRP"))) begin
      $display("Error: [Unisim %s-186] IO_TYPE_M attribute is set to %s.  Legal values for this attribute are OFF_TYPE, BIDIR, INPUT, IPAD, OUTPUT, REFIO, SYSMON_AUX, VR, VREF, VRN or VRP. Instance: %m", MODULE_NAME, IO_TYPE_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IO_TYPE_S_REG != "OFF_TYPE") &&
         (IO_TYPE_S_REG != "BIDIR") &&
         (IO_TYPE_S_REG != "INPUT") &&
         (IO_TYPE_S_REG != "IPAD") &&
         (IO_TYPE_S_REG != "OUTPUT") &&
         (IO_TYPE_S_REG != "REFIO") &&
         (IO_TYPE_S_REG != "SYSMON_AUX") &&
         (IO_TYPE_S_REG != "VR") &&
         (IO_TYPE_S_REG != "VREF") &&
         (IO_TYPE_S_REG != "VRN") &&
         (IO_TYPE_S_REG != "VRP"))) begin
      $display("Error: [Unisim %s-187] IO_TYPE_S attribute is set to %s.  Legal values for this attribute are OFF_TYPE, BIDIR, INPUT, IPAD, OUTPUT, REFIO, SYSMON_AUX, VR, VREF, VRN or VRP. Instance: %m", MODULE_NAME, IO_TYPE_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LL_2TO1_MODE_0_REG != "FALSE") &&
         (LL_2TO1_MODE_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-192] LL_2TO1_MODE_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LL_2TO1_MODE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LL_2TO1_MODE_1_REG != "FALSE") &&
         (LL_2TO1_MODE_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-193] LL_2TO1_MODE_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LL_2TO1_MODE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPRX_EN_M_REG != "FALSE") &&
         (MIPI_ALPRX_EN_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-197] MIPI_ALPRX_EN_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPRX_EN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPRX_EN_S_REG != "FALSE") &&
         (MIPI_ALPRX_EN_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-198] MIPI_ALPRX_EN_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPRX_EN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPTX_EN_M_REG != "FALSE") &&
         (MIPI_ALPTX_EN_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-199] MIPI_ALPTX_EN_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPTX_EN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPTX_EN_S_REG != "FALSE") &&
         (MIPI_ALPTX_EN_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-200] MIPI_ALPTX_EN_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPTX_EN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_CPHY_PAD_M_REG != "MIPI_CPHY_PAD_A") &&
         (MIPI_CPHY_PAD_M_REG != "MIPI_CPHY_PAD_B") &&
         (MIPI_CPHY_PAD_M_REG != "MIPI_CPHY_PAD_C"))) begin
      $display("Error: [Unisim %s-201] MIPI_CPHY_PAD_M attribute is set to %s.  Legal values for this attribute are MIPI_CPHY_PAD_A, MIPI_CPHY_PAD_B or MIPI_CPHY_PAD_C. Instance: %m", MODULE_NAME, MIPI_CPHY_PAD_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_CPHY_PAD_S_REG != "MIPI_CPHY_PAD_A") &&
         (MIPI_CPHY_PAD_S_REG != "MIPI_CPHY_PAD_B") &&
         (MIPI_CPHY_PAD_S_REG != "MIPI_CPHY_PAD_C"))) begin
      $display("Error: [Unisim %s-202] MIPI_CPHY_PAD_S attribute is set to %s.  Legal values for this attribute are MIPI_CPHY_PAD_A, MIPI_CPHY_PAD_B or MIPI_CPHY_PAD_C. Instance: %m", MODULE_NAME, MIPI_CPHY_PAD_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PHY2IOB_T_0_REG != "FALSE") &&
         (PHY2IOB_T_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-219] PHY2IOB_T_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PHY2IOB_T_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PHY2IOB_T_1_REG != "FALSE") &&
         (PHY2IOB_T_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-220] PHY2IOB_T_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PHY2IOB_T_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PHY2XCV_LATENCY_REG != 8) &&
         (PHY2XCV_LATENCY_REG != 2) &&
         (PHY2XCV_LATENCY_REG != 4) &&
         (PHY2XCV_LATENCY_REG != 6))) begin
      $display("Error: [Unisim %s-221] PHY2XCV_LATENCY attribute is set to %d.  Legal values for this attribute are 8, 2, 4 or 6. Instance: %m", MODULE_NAME, PHY2XCV_LATENCY_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RIUCLK_DBLR_BYPASS_REG != "FALSE") &&
         (RIUCLK_DBLR_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-229] RIUCLK_DBLR_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RIUCLK_DBLR_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_0_REG != "TRUE") &&
         (ROUTETHRU_0_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-230] ROUTETHRU_0 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_1_REG != "TRUE") &&
         (ROUTETHRU_1_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-231] ROUTETHRU_1 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX2TX_LOOPBACK_M_REG != "FALSE") &&
         (RX2TX_LOOPBACK_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-232] RX2TX_LOOPBACK_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RX2TX_LOOPBACK_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX2TX_LOOPBACK_S_REG != "FALSE") &&
         (RX2TX_LOOPBACK_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-233] RX2TX_LOOPBACK_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RX2TX_LOOPBACK_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLOCK_REG != "BY_4") &&
         (RX_CLOCK_REG != "BY_HALFBANK") &&
         (RX_CLOCK_REG != "BY_8"))) begin
      $display("Error: [Unisim %s-236] RX_CLOCK attribute is set to %s.  Legal values for this attribute are BY_4, BY_HALFBANK or BY_8. Instance: %m", MODULE_NAME, RX_CLOCK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLOCK_ALIGN_M_REG != "RX_CLOCK_ALIGN_NONE") &&
         (RX_CLOCK_ALIGN_M_REG != "CLK90_TEST") &&
         (RX_CLOCK_ALIGN_M_REG != "CLOCK_CNTR") &&
         (RX_CLOCK_ALIGN_M_REG != "CPHY_DATA_CNTR") &&
         (RX_CLOCK_ALIGN_M_REG != "DATA_CNTR") &&
         (RX_CLOCK_ALIGN_M_REG != "DQS_DELAYED") &&
         (RX_CLOCK_ALIGN_M_REG != "DQS_NON_DELAYED"))) begin
      $display("Error: [Unisim %s-237] RX_CLOCK_ALIGN_M attribute is set to %s.  Legal values for this attribute are RX_CLOCK_ALIGN_NONE, CLK90_TEST, CLOCK_CNTR, CPHY_DATA_CNTR, DATA_CNTR, DQS_DELAYED or DQS_NON_DELAYED. Instance: %m", MODULE_NAME, RX_CLOCK_ALIGN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLOCK_ALIGN_S_REG != "RX_CLOCK_ALIGN_NONE") &&
         (RX_CLOCK_ALIGN_S_REG != "CLK90_TEST") &&
         (RX_CLOCK_ALIGN_S_REG != "CLOCK_CNTR") &&
         (RX_CLOCK_ALIGN_S_REG != "CPHY_DATA_CNTR") &&
         (RX_CLOCK_ALIGN_S_REG != "DATA_CNTR") &&
         (RX_CLOCK_ALIGN_S_REG != "DQS_DELAYED") &&
         (RX_CLOCK_ALIGN_S_REG != "DQS_NON_DELAYED"))) begin
      $display("Error: [Unisim %s-238] RX_CLOCK_ALIGN_S attribute is set to %s.  Legal values for this attribute are RX_CLOCK_ALIGN_NONE, CLK90_TEST, CLOCK_CNTR, CPHY_DATA_CNTR, DATA_CNTR, DQS_DELAYED or DQS_NON_DELAYED. Instance: %m", MODULE_NAME, RX_CLOCK_ALIGN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_DATA_WIDTH_M_REG != 16) &&
         (RX_DATA_WIDTH_M_REG != 2) &&
         (RX_DATA_WIDTH_M_REG != 4) &&
         (RX_DATA_WIDTH_M_REG != 8))) begin
      $display("Error: [Unisim %s-239] RX_DATA_WIDTH_M attribute is set to %d.  Legal values for this attribute are 16, 2, 4 or 8. Instance: %m", MODULE_NAME, RX_DATA_WIDTH_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_DATA_WIDTH_S_REG != 16) &&
         (RX_DATA_WIDTH_S_REG != 2) &&
         (RX_DATA_WIDTH_S_REG != 4) &&
         (RX_DATA_WIDTH_S_REG != 8))) begin
      $display("Error: [Unisim %s-240] RX_DATA_WIDTH_S attribute is set to %d.  Legal values for this attribute are 16, 2, 4 or 8. Instance: %m", MODULE_NAME, RX_DATA_WIDTH_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_GATING_REG != "DISABLE") &&
         (RX_GATING_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-241] RX_GATING attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, RX_GATING_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_M_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_M_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_M_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-262] SA_OFST_CAL_M attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_S_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_S_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_S_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-263] SA_OFST_CAL_S attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_VERSION_REG < 1) || (SIM_VERSION_REG > 3))) begin
      $display("Error: [Unisim %s-264] SIM_VERSION attribute is set to %d.  Legal values for this attribute are 1 to 3. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_M_REG != "FAST") &&
         (SLEW_M_REG != "MEDIUM") &&
         (SLEW_M_REG != "SLOW"))) begin
      $display("Error: [Unisim %s-265] SLEW_M attribute is set to %s.  Legal values for this attribute are FAST, MEDIUM or SLOW. Instance: %m", MODULE_NAME, SLEW_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_S_REG != "FAST") &&
         (SLEW_S_REG != "MEDIUM") &&
         (SLEW_S_REG != "SLOW"))) begin
      $display("Error: [Unisim %s-266] SLEW_S attribute is set to %s.  Legal values for this attribute are FAST, MEDIUM or SLOW. Instance: %m", MODULE_NAME, SLEW_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLV_WRLVL_MODE_REG != "FALSE") &&
         (SLV_WRLVL_MODE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-267] SLV_WRLVL_MODE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SLV_WRLVL_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX0_ODLY_CASC_EN_REG != "FALSE") &&
         (TX0_ODLY_CASC_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-274] TX0_ODLY_CASC_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX0_ODLY_CASC_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX0_OUTPUT_PHASE_90_REG != "FALSE") &&
         (TX0_OUTPUT_PHASE_90_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-276] TX0_OUTPUT_PHASE_90 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX0_OUTPUT_PHASE_90_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX1_ODLY_CASC_EN_REG != "FALSE") &&
         (TX1_ODLY_CASC_EN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-281] TX1_ODLY_CASC_EN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX1_ODLY_CASC_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX1_OUTPUT_PHASE_90_REG != "FALSE") &&
         (TX1_OUTPUT_PHASE_90_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-283] TX1_OUTPUT_PHASE_90 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX1_OUTPUT_PHASE_90_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX2RX_PREDRV_LOOPBACK_M_REG != "FALSE") &&
         (TX2RX_PREDRV_LOOPBACK_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-284] TX2RX_PREDRV_LOOPBACK_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX2RX_PREDRV_LOOPBACK_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX2RX_PREDRV_LOOPBACK_S_REG != "FALSE") &&
         (TX2RX_PREDRV_LOOPBACK_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-285] TX2RX_PREDRV_LOOPBACK_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX2RX_PREDRV_LOOPBACK_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX2RX_RETIMER_LOOPBACK_M_REG != "FALSE") &&
         (TX2RX_RETIMER_LOOPBACK_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-286] TX2RX_RETIMER_LOOPBACK_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX2RX_RETIMER_LOOPBACK_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX2RX_RETIMER_LOOPBACK_S_REG != "FALSE") &&
         (TX2RX_RETIMER_LOOPBACK_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-287] TX2RX_RETIMER_LOOPBACK_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX2RX_RETIMER_LOOPBACK_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_DATA_WIDTH_REG != 16) &&
         (TX_DATA_WIDTH_REG != 2) &&
         (TX_DATA_WIDTH_REG != 4) &&
         (TX_DATA_WIDTH_REG != 8))) begin
      $display("Error: [Unisim %s-292] TX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 16, 2, 4 or 8. Instance: %m", MODULE_NAME, TX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_DRV_HP_EN_M_REG != "FALSE") &&
         (TX_DRV_HP_EN_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-293] TX_DRV_HP_EN_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_DRV_HP_EN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_DRV_HP_EN_S_REG != "FALSE") &&
         (TX_DRV_HP_EN_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-294] TX_DRV_HP_EN_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_DRV_HP_EN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_0_REG != "FALSE") &&
         (TX_INIT_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-295] TX_INIT_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_1_REG != "FALSE") &&
         (TX_INIT_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-296] TX_INIT_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_T_REG != "FALSE") &&
         (TX_INIT_T_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-297] TX_INIT_T attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_T_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_M_REG != "FALSE_IBUFDIS") &&
         (USE_IBUFDISABLE_M_REG != "T_CONTROL_MODE0") &&
         (USE_IBUFDISABLE_M_REG != "T_CONTROL_MODE1") &&
         (USE_IBUFDISABLE_M_REG != "T_CONTROL_MODE2") &&
         (USE_IBUFDISABLE_M_REG != "TRUE_IBUFDIS_MODE0") &&
         (USE_IBUFDISABLE_M_REG != "TRUE_IBUFDIS_MODE1") &&
         (USE_IBUFDISABLE_M_REG != "TRUE_IBUFDIS_MODE2"))) begin
      $display("Error: [Unisim %s-298] USE_IBUFDISABLE_M attribute is set to %s.  Legal values for this attribute are FALSE_IBUFDIS, T_CONTROL_MODE0, T_CONTROL_MODE1, T_CONTROL_MODE2, TRUE_IBUFDIS_MODE0, TRUE_IBUFDIS_MODE1 or TRUE_IBUFDIS_MODE2. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_S_REG != "FALSE_IBUFDIS") &&
         (USE_IBUFDISABLE_S_REG != "T_CONTROL_MODE0") &&
         (USE_IBUFDISABLE_S_REG != "T_CONTROL_MODE1") &&
         (USE_IBUFDISABLE_S_REG != "T_CONTROL_MODE2") &&
         (USE_IBUFDISABLE_S_REG != "TRUE_IBUFDIS_MODE0") &&
         (USE_IBUFDISABLE_S_REG != "TRUE_IBUFDIS_MODE1") &&
         (USE_IBUFDISABLE_S_REG != "TRUE_IBUFDIS_MODE2"))) begin
      $display("Error: [Unisim %s-299] USE_IBUFDISABLE_S attribute is set to %s.  Legal values for this attribute are FALSE_IBUFDIS, T_CONTROL_MODE0, T_CONTROL_MODE1, T_CONTROL_MODE2, TRUE_IBUFDIS_MODE0, TRUE_IBUFDIS_MODE1 or TRUE_IBUFDIS_MODE2. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_S_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif



assign XCVR_X2_ID_in = 2'b11; // tie off

  SIP_X5PHIO_XCVR_X2 SIP_X5PHIO_XCVR_X2_INST (
    .ADL_H1ME_OFST_POL_M (ADL_H1ME_OFST_POL_M_REG),
    .ADL_H1ME_OFST_POL_S (ADL_H1ME_OFST_POL_S_REG),
    .ADL_H1ME_OFST_VALUE_M (ADL_H1ME_OFST_VALUE_M_REG),
    .ADL_H1ME_OFST_VALUE_S (ADL_H1ME_OFST_VALUE_S_REG),
    .ADL_H1MO_OFST_POL_M (ADL_H1MO_OFST_POL_M_REG),
    .ADL_H1MO_OFST_POL_S (ADL_H1MO_OFST_POL_S_REG),
    .ADL_H1MO_OFST_VALUE_M (ADL_H1MO_OFST_VALUE_M_REG),
    .ADL_H1MO_OFST_VALUE_S (ADL_H1MO_OFST_VALUE_S_REG),
    .ADL_H1PE_OFST_POL_M (ADL_H1PE_OFST_POL_M_REG),
    .ADL_H1PE_OFST_POL_S (ADL_H1PE_OFST_POL_S_REG),
    .ADL_H1PE_OFST_VALUE_M (ADL_H1PE_OFST_VALUE_M_REG),
    .ADL_H1PE_OFST_VALUE_S (ADL_H1PE_OFST_VALUE_S_REG),
    .ADL_H1PO_OFST_POL_M (ADL_H1PO_OFST_POL_M_REG),
    .ADL_H1PO_OFST_POL_S (ADL_H1PO_OFST_POL_S_REG),
    .ADL_H1PO_OFST_VALUE_M (ADL_H1PO_OFST_VALUE_M_REG),
    .ADL_H1PO_OFST_VALUE_S (ADL_H1PO_OFST_VALUE_S_REG),
    .APBCLK_FREQ (APBCLK_FREQ_REG),
    .CASCADE_IDL_M (CASCADE_IDL_M_REG),
    .CASCADE_IDL_S (CASCADE_IDL_S_REG),
    .CASCADE_ODL_M (CASCADE_ODL_M_REG),
    .CASCADE_ODL_S (CASCADE_ODL_S_REG),
    .CCIO_EN_M (CCIO_EN_M_REG),
    .CCIO_EN_S (CCIO_EN_S_REG),
    .CLOCK_FREQ (CLOCK_FREQ_REG),
    .CONTINUOUS_DQS (CONTINUOUS_DQS_REG),
    .CPHY_MODE_CTRL (CPHY_MODE_CTRL_REG),
    .CPHY_TERM_M (CPHY_TERM_M_REG),
    .CPHY_TERM_S (CPHY_TERM_S_REG),
    .CTLE_EQ_M (CTLE_EQ_M_REG),
    .CTLE_EQ_S (CTLE_EQ_S_REG),
    .CTLE_H1M_OFST_POL_M (CTLE_H1M_OFST_POL_M_REG),
    .CTLE_H1M_OFST_POL_S (CTLE_H1M_OFST_POL_S_REG),
    .CTLE_H1M_OFST_VAL_M (CTLE_H1M_OFST_VAL_M_REG),
    .CTLE_H1M_OFST_VAL_S (CTLE_H1M_OFST_VAL_S_REG),
    .CTLE_H1P_OFST_POL_M (CTLE_H1P_OFST_POL_M_REG),
    .CTLE_H1P_OFST_POL_S (CTLE_H1P_OFST_POL_S_REG),
    .CTLE_H1P_OFST_VAL_M (CTLE_H1P_OFST_VAL_M_REG),
    .CTLE_H1P_OFST_VAL_S (CTLE_H1P_OFST_VAL_S_REG),
    .CTLE_OFST_M (CTLE_OFST_M_REG),
    .CTLE_OFST_S (CTLE_OFST_S_REG),
    .DCI_CAL_DISABLE_M (DCI_CAL_DISABLE_M_REG),
    .DCI_CAL_DISABLE_S (DCI_CAL_DISABLE_S_REG),
    .DFE_EQ_M (DFE_EQ_M_REG),
    .DFE_EQ_S (DFE_EQ_S_REG),
    .DFE_H2_NEG_POL_M (DFE_H2_NEG_POL_M_REG),
    .DFE_H2_NEG_POL_S (DFE_H2_NEG_POL_S_REG),
    .DFE_H2_TAP_WEIGHT_M (DFE_H2_TAP_WEIGHT_M_REG),
    .DFE_H2_TAP_WEIGHT_S (DFE_H2_TAP_WEIGHT_S_REG),
    .DFE_H3_NEG_POL_M (DFE_H3_NEG_POL_M_REG),
    .DFE_H3_NEG_POL_S (DFE_H3_NEG_POL_S_REG),
    .DFE_H3_TAP_WEIGHT_M (DFE_H3_TAP_WEIGHT_M_REG),
    .DFE_H3_TAP_WEIGHT_S (DFE_H3_TAP_WEIGHT_S_REG),
    .DFE_H4_NEG_POL_M (DFE_H4_NEG_POL_M_REG),
    .DFE_H4_NEG_POL_S (DFE_H4_NEG_POL_S_REG),
    .DFE_H4_TAP_WEIGHT_M (DFE_H4_TAP_WEIGHT_M_REG),
    .DFE_H4_TAP_WEIGHT_S (DFE_H4_TAP_WEIGHT_S_REG),
    .DFE_INIT_M (DFE_INIT_M_REG),
    .DFE_INIT_S (DFE_INIT_S_REG),
    .DFT_OBS (DFT_OBS_REG),
    .DIFF_PIN_SWAP (DIFF_PIN_SWAP_REG),
    .DIFF_SLAVE_RX_EN (DIFF_SLAVE_RX_EN_REG),
    .DIFF_TERM (DIFF_TERM_REG),
    .DIV64CLK_EN (DIV64CLK_EN_REG),
    .DQS_ANA_DETECTION_M (DQS_ANA_DETECTION_M_REG),
    .DQS_ANA_DETECTION_S (DQS_ANA_DETECTION_S_REG),
    .DQS_BIAS_M (DQS_BIAS_M_REG),
    .DQS_BIAS_S (DQS_BIAS_S_REG),
    .DRIVE_M (DRIVE_M_REG),
    .DRIVE_S (DRIVE_S_REG),
    .DYNAMIC_DCI_TS_0 (DYNAMIC_DCI_TS_0_REG),
    .DYNAMIC_DCI_TS_1 (DYNAMIC_DCI_TS_1_REG),
    .EN_OMUX (EN_OMUX_REG),
    .IO_TYPE_M (IO_TYPE_M_REG),
    .IO_TYPE_S (IO_TYPE_S_REG),
    .IPROGRAMMING (IPROGRAMMING_REG),
    .ISTANDARD_M (ISTANDARD_M_REG),
    .ISTANDARD_S (ISTANDARD_S_REG),
    .IS_RX_X5PHIO_REV2 (IS_RX_X5PHIO_REV2_REG),
    .LL_2TO1_MODE_0 (LL_2TO1_MODE_0_REG),
    .LL_2TO1_MODE_1 (LL_2TO1_MODE_1_REG),
    .LOOPBK_M (LOOPBK_M_REG),
    .LOOPBK_S (LOOPBK_S_REG),
    .MIPI_ALPRX_EN_M (MIPI_ALPRX_EN_M_REG),
    .MIPI_ALPRX_EN_S (MIPI_ALPRX_EN_S_REG),
    .MIPI_ALPTX_EN_M (MIPI_ALPTX_EN_M_REG),
    .MIPI_ALPTX_EN_S (MIPI_ALPTX_EN_S_REG),
    .MIPI_CPHY_PAD_M (MIPI_CPHY_PAD_M_REG),
    .MIPI_CPHY_PAD_S (MIPI_CPHY_PAD_S_REG),
    .OBSE_0 (OBSE_0_REG),
    .OBSE_1 (OBSE_1_REG),
    .OBSO_0 (OBSO_0_REG),
    .OBSO_1 (OBSO_1_REG),
    .ODLY_SRC_M (ODLY_SRC_M_REG),
    .ODLY_SRC_S (ODLY_SRC_S_REG),
    .OPROGRAMMING (OPROGRAMMING_REG),
    .OSTANDARD_M (OSTANDARD_M_REG),
    .OSTANDARD_S (OSTANDARD_S_REG),
    .OTHER_SPARE (OTHER_SPARE_REG),
    .PHY2IOB_T_0 (PHY2IOB_T_0_REG),
    .PHY2IOB_T_1 (PHY2IOB_T_1_REG),
    .PHY2XCV_LATENCY (PHY2XCV_LATENCY_REG),
    .RD_CTL_MUXSEL (RD_CTL_MUXSEL_REG),
    .RIUCLK_DBLR_BYPASS (RIUCLK_DBLR_BYPASS_REG),
    .ROUTETHRU_0 (ROUTETHRU_0_REG),
    .ROUTETHRU_1 (ROUTETHRU_1_REG),
    .RX2TX_LOOPBACK_M (RX2TX_LOOPBACK_M_REG),
    .RX2TX_LOOPBACK_S (RX2TX_LOOPBACK_S_REG),
    .RX_CAL_MUX_SEL (RX_CAL_MUX_SEL_REG),
    .RX_CLK_REPLICA_INV (RX_CLK_REPLICA_INV_REG),
    .RX_CLOCK (RX_CLOCK_REG),
    .RX_CLOCK_ALIGN_M (RX_CLOCK_ALIGN_M_REG),
    .RX_CLOCK_ALIGN_S (RX_CLOCK_ALIGN_S_REG),
    .RX_DATA_WIDTH_M (RX_DATA_WIDTH_M_REG),
    .RX_DATA_WIDTH_S (RX_DATA_WIDTH_S_REG),
    .RX_GATING (RX_GATING_REG),
    .RX_IGNORE_KEEPER_M (RX_IGNORE_KEEPER_M_REG),
    .RX_IGNORE_KEEPER_S (RX_IGNORE_KEEPER_S_REG),
    .RX_LOAD_DLY (RX_LOAD_DLY_REG),
    .RX_TRAINING_CLK_EN (RX_TRAINING_CLK_EN_REG),
    .SA_H1ME_OFST_POL_M (SA_H1ME_OFST_POL_M_REG),
    .SA_H1ME_OFST_POL_S (SA_H1ME_OFST_POL_S_REG),
    .SA_H1ME_OFST_VAL_M (SA_H1ME_OFST_VAL_M_REG),
    .SA_H1ME_OFST_VAL_S (SA_H1ME_OFST_VAL_S_REG),
    .SA_H1MO_OFST_POL_M (SA_H1MO_OFST_POL_M_REG),
    .SA_H1MO_OFST_POL_S (SA_H1MO_OFST_POL_S_REG),
    .SA_H1MO_OFST_VAL_M (SA_H1MO_OFST_VAL_M_REG),
    .SA_H1MO_OFST_VAL_S (SA_H1MO_OFST_VAL_S_REG),
    .SA_H1PE_OFST_POL_M (SA_H1PE_OFST_POL_M_REG),
    .SA_H1PE_OFST_POL_S (SA_H1PE_OFST_POL_S_REG),
    .SA_H1PE_OFST_VAL_M (SA_H1PE_OFST_VAL_M_REG),
    .SA_H1PE_OFST_VAL_S (SA_H1PE_OFST_VAL_S_REG),
    .SA_H1PO_OFST_POL_M (SA_H1PO_OFST_POL_M_REG),
    .SA_H1PO_OFST_POL_S (SA_H1PO_OFST_POL_S_REG),
    .SA_H1PO_OFST_VAL_M (SA_H1PO_OFST_VAL_M_REG),
    .SA_H1PO_OFST_VAL_S (SA_H1PO_OFST_VAL_S_REG),
    .SA_OFST_CAL_M (SA_OFST_CAL_M_REG),
    .SA_OFST_CAL_S (SA_OFST_CAL_S_REG),
    .SIM_VERSION (SIM_VERSION_REG),
    .SLEW_M (SLEW_M_REG),
    .SLEW_S (SLEW_S_REG),
    .SLV_WRLVL_MODE (SLV_WRLVL_MODE_REG),
    .TERM_OVERRIDE_M (TERM_OVERRIDE_M_REG),
    .TERM_OVERRIDE_S (TERM_OVERRIDE_S_REG),
    .TX0_ANALOG_SPARE (TX0_ANALOG_SPARE_REG),
    .TX0_ANALOG_SPARE0 (TX0_ANALOG_SPARE0_REG),
    .TX0_DIG_SPARE (TX0_DIG_SPARE_REG),
    .TX0_DIG_SPARE0 (TX0_DIG_SPARE0_REG),
    .TX0_ODLY_CASC_EN (TX0_ODLY_CASC_EN_REG),
    .TX0_ODLY_RST (TX0_ODLY_RST_REG),
    .TX0_OUTPUT_PHASE_90 (TX0_OUTPUT_PHASE_90_REG),
    .TX1_ANALOG_SPARE (TX1_ANALOG_SPARE_REG),
    .TX1_ANALOG_SPARE0 (TX1_ANALOG_SPARE0_REG),
    .TX1_DIG_SPARE (TX1_DIG_SPARE_REG),
    .TX1_DIG_SPARE0 (TX1_DIG_SPARE0_REG),
    .TX1_ODLY_CASC_EN (TX1_ODLY_CASC_EN_REG),
    .TX1_ODLY_RST (TX1_ODLY_RST_REG),
    .TX1_OUTPUT_PHASE_90 (TX1_OUTPUT_PHASE_90_REG),
    .TX2RX_PREDRV_LOOPBACK_M (TX2RX_PREDRV_LOOPBACK_M_REG),
    .TX2RX_PREDRV_LOOPBACK_S (TX2RX_PREDRV_LOOPBACK_S_REG),
    .TX2RX_RETIMER_LOOPBACK_M (TX2RX_RETIMER_LOOPBACK_M_REG),
    .TX2RX_RETIMER_LOOPBACK_S (TX2RX_RETIMER_LOOPBACK_S_REG),
    .TXDLYIN_INV_M (TXDLYIN_INV_M_REG),
    .TXDLYIN_INV_S (TXDLYIN_INV_S_REG),
    .TXIN_INV_M (TXIN_INV_M_REG),
    .TXIN_INV_S (TXIN_INV_S_REG),
    .TX_DATA_WIDTH (TX_DATA_WIDTH_REG),
    .TX_DRV_HP_EN_M (TX_DRV_HP_EN_M_REG),
    .TX_DRV_HP_EN_S (TX_DRV_HP_EN_S_REG),
    .TX_INIT_0 (TX_INIT_0_REG),
    .TX_INIT_1 (TX_INIT_1_REG),
    .TX_INIT_T (TX_INIT_T_REG),
    .USE_IBUFDISABLE_M (USE_IBUFDISABLE_M_REG),
    .USE_IBUFDISABLE_S (USE_IBUFDISABLE_S_REG),
    .VREF_H1M_PER_OCTAD_M (VREF_H1M_PER_OCTAD_M_REG),
    .VREF_H1M_PER_OCTAD_S (VREF_H1M_PER_OCTAD_S_REG),
    .VREF_H1M_VALUE_M (VREF_H1M_VALUE_M_REG),
    .VREF_H1M_VALUE_S (VREF_H1M_VALUE_S_REG),
    .VREF_H1P_PER_OCTAD_M (VREF_H1P_PER_OCTAD_M_REG),
    .VREF_H1P_PER_OCTAD_S (VREF_H1P_PER_OCTAD_S_REG),
    .VREF_H1P_VALUE_M (VREF_H1P_VALUE_M_REG),
    .VREF_H1P_VALUE_S (VREF_H1P_VALUE_S_REG),
    .WR_CTL_MUXSEL (WR_CTL_MUXSEL_REG),
    .WR_DQ0_MUXSEL (WR_DQ0_MUXSEL_REG),
    .WR_DQ1_MUXSEL (WR_DQ1_MUXSEL_REG),
    .WR_EN0_MUXSEL (WR_EN0_MUXSEL_REG),
    .WR_EN1_MUXSEL (WR_EN1_MUXSEL_REG),
    .X5PHIO_VCCAUX (X5PHIO_VCCAUX_REG),
    .X5PHIO_VCCINT (X5PHIO_VCCINT_REG),
    .DCI_BUS_BUF_OUT (DCI_BUS_BUF_OUT_out),
    .DQS_DLY_OUT_M (DQS_DLY_OUT_M_out),
    .DQS_DLY_OUT_R (DQS_DLY_OUT_R_out),
    .XCV2CGL_RX0_RDQS_P_OUT_CLK (XCV2CGL_RX0_RDQS_P_OUT_CLK_out),
    .XCV2CGL_RX1_RDQS_P_OUT_CLK (XCV2CGL_RX1_RDQS_P_OUT_CLK_out),
    .XCV2CLK_DIV64_CLK (XCV2CLK_DIV64_CLK_out),
    .XCV2CLK_NDQS_DLY_REPLICA (XCV2CLK_NDQS_DLY_REPLICA_out),
    .XCV2CLK_RIU_CLK0_DCD_ADJ (XCV2CLK_RIU_CLK0_DCD_ADJ_out),
    .XCV2CLK_RIU_CLK0_DCD_ADJ_SEL (XCV2CLK_RIU_CLK0_DCD_ADJ_SEL_out),
    .XCV2CLK_RIU_CLK90_DCD_ADJ (XCV2CLK_RIU_CLK90_DCD_ADJ_out),
    .XCV2CLK_RIU_CLK90_DCD_ADJ_SEL (XCV2CLK_RIU_CLK90_DCD_ADJ_SEL_out),
    .XCV2PHYPLL_RX_OUT_M (XCV2PHYPLL_RX_OUT_M_out),
    .XCV2PHYPLL_RX_OUT_S (XCV2PHYPLL_RX_OUT_S_out),
    .XCV2PHY_RD_CLK (XCV2PHY_RD_CLK_out),
    .XCV2PHY_RD_DQ (XCV2PHY_RD_DQ_out),
    .XCV2PHY_WR_CLK (XCV2PHY_WR_CLK_out),
    .XCV2RIU_CK (XCV2RIU_CK_out),
    .XCV2RIU_RD (XCV2RIU_RD_out),
    .XCV2XCV_CPHY_CLK_OUT (XCV2XCV_CPHY_CLK_OUT_out),
    .XCV2XCV_NDQS_DLY_O (XCV2XCV_NDQS_DLY_O_out),
    .XCV2XCV_NDQS_O (XCV2XCV_NDQS_O_out),
    .XCV2XCV_PDQS_DLY_O (XCV2XCV_PDQS_DLY_O_out),
    .XCV2XCV_PDQS_O (XCV2XCV_PDQS_O_out),
    .XCV2XCV_RX0_RDQS_OUT (XCV2XCV_RX0_RDQS_OUT_out),
    .XCV2XCV_RX1_RDQS_OUT (XCV2XCV_RX1_RDQS_OUT_out),
    .XCV2XCV_RX2TX_DOUT (XCV2XCV_RX2TX_DOUT_out),
    .XCV2XCV_VREF_H1M_O (XCV2XCV_VREF_H1M_O_out),
    .XCV2XCV_VREF_H1P_O (XCV2XCV_VREF_H1P_O_out),
    .DIFF_N (DIFF_N),
    .DIFF_P (DIFF_P),
    .CFGXCV_SCAN_DATA_OUT_INT (CFGXCV_SCAN_DATA_OUT_INT_in),
    .CFGXCV_SCAN_EN (CFGXCV_SCAN_EN_in),
    .CFGXCV_SCAN_MODE (CFGXCV_SCAN_MODE_in),
    .CFGXCV_SCAN_MODE_RST (CFGXCV_SCAN_MODE_RST_in),
    .CFGXCV_SCAN_RST_BYP (CFGXCV_SCAN_RST_BYP_in),
    .CMU2XCV_DCI (CMU2XCV_DCI_in),
    .DQS_IN_R (DQS_IN_R_in),
    .PHY2XCV_2TO1_CLK (PHY2XCV_2TO1_CLK_in),
    .PHY2XCV_DYNAMIC_DCI_TS (PHY2XCV_DYNAMIC_DCI_TS_in),
    .PHY2XCV_IBUF_DIS_OR_HS_RX_DIS (PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_in),
    .PHY2XCV_RD_CTL (PHY2XCV_RD_CTL_in),
    .PHY2XCV_WR_CTL (PHY2XCV_WR_CTL_in),
    .PHY2XCV_WR_DQ (PHY2XCV_WR_DQ_in),
    .PLL_CLK0 (PLL_CLK0_in),
    .PLL_CLK90 (PLL_CLK90_in),
    .RIU2XCV_CA (RIU2XCV_CA_in),
    .RIU2XCV_CK (RIU2XCV_CK_in),
    .RIU2XCV_RST (RIU2XCV_RST_in),
    .RIU2XCV_WR (RIU2XCV_WR_in),
    .XCV2CGL_RX1_NDQS_DLY_IN (XCV2CGL_RX1_NDQS_DLY_IN_in),
    .XCV2CGL_RX2_NDQS_DLY_IN (XCV2CGL_RX2_NDQS_DLY_IN_in),
    .XCV2XCV_CPHY_CLK_IN (XCV2XCV_CPHY_CLK_IN_in),
    .XCV2XCV_NDQS_IN (XCV2XCV_NDQS_IN_in),
    //.XCV2XCV_PAD_N (XCV2XCV_PAD_N_in),
    .XCV2XCV_PAD_N (XCV2XCV_PAD_N),
    //.XCV2XCV_PAD_P (XCV2XCV_PAD_P_in),
    .XCV2XCV_PAD_P (XCV2XCV_PAD_P),
    .XCV2XCV_PDQS_IN (XCV2XCV_PDQS_IN_in),
    .XCV2XCV_RX0_RDQS_IN (XCV2XCV_RX0_RDQS_IN_in),
    .XCV2XCV_RX1_RDQS_IN (XCV2XCV_RX1_RDQS_IN_in),
    .XCV2XCV_RX2TX_DIN (XCV2XCV_RX2TX_DIN_in),
    .XCV2XCV_RX2_RDQS_IN (XCV2XCV_RX2_RDQS_IN_in),
    .XCV2XCV_VREF_H1M_I (XCV2XCV_VREF_H1M_I_in),
    .XCV2XCV_VREF_H1P_I (XCV2XCV_VREF_H1P_I_in),
    .XCVR_X2_ID (XCVR_X2_ID_in),
    .GSR (glblGSR)
  );

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  // begin timing section
  specify
    (CMU2XCV_DCI[0] => DCI_BUS_BUF_OUT[0]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[10] => DCI_BUS_BUF_OUT[10]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[11] => DCI_BUS_BUF_OUT[11]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[12] => DCI_BUS_BUF_OUT[12]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[13] => DCI_BUS_BUF_OUT[13]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[14] => DCI_BUS_BUF_OUT[14]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[15] => DCI_BUS_BUF_OUT[15]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[16] => DCI_BUS_BUF_OUT[16]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[1] => DCI_BUS_BUF_OUT[1]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[2] => DCI_BUS_BUF_OUT[2]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[3] => DCI_BUS_BUF_OUT[3]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[4] => DCI_BUS_BUF_OUT[4]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[5] => DCI_BUS_BUF_OUT[5]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[6] => DCI_BUS_BUF_OUT[6]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[7] => DCI_BUS_BUF_OUT[7]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[8] => DCI_BUS_BUF_OUT[8]) = (0:0:0, 0:0:0);
    (CMU2XCV_DCI[9] => DCI_BUS_BUF_OUT[9]) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2PHYPLL_RX_OUT_M) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2PHYPLL_RX_OUT_S) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2PHY_RD_CLK[1]) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_NDQS_DLY_O) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_NDQS_O) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_PDQS_DLY_O) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_PDQS_O) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_RX0_RDQS_OUT) = (0:0:0, 0:0:0);
    (DIFF_N => XCV2XCV_RX1_RDQS_OUT) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2PHYPLL_RX_OUT_M) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2PHYPLL_RX_OUT_S) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2PHY_RD_CLK[0]) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_NDQS_DLY_O) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_NDQS_O) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_PDQS_DLY_O) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_PDQS_O) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_RX0_RDQS_OUT) = (0:0:0, 0:0:0);
    (DIFF_P => XCV2XCV_RX1_RDQS_OUT) = (0:0:0, 0:0:0);
    (PHY2XCV_2TO1_CLK => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_2TO1_CLK => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_DYNAMIC_DCI_TS[0] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_DYNAMIC_DCI_TS[0] => DIFF_P) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_DYNAMIC_DCI_TS[1] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_DYNAMIC_DCI_TS[1] => DIFF_N) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[0] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[1] => XCV2PHYPLL_RX_OUT_S) = (0:0:0, 0:0:0);
    (PHY2XCV_RD_CTL[3] => XCV2PHYPLL_RX_OUT_M) = (0:0:0, 0:0:0);
    (PHY2XCV_RD_CTL[3] => XCV2PHYPLL_RX_OUT_S) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[0] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[0] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[16] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[16] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[17] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[17] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[17] => DIFF_P) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[1] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[1] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[24] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[24] => DIFF_N) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[24] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[24] => DIFF_P) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[8] => DIFF_N) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[8] => DIFF_N) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[8] => DIFF_P) = (0:0:0, 0:0:0);
    (PHY2XCV_WR_DQ[8] => DIFF_P) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (XCV2XCV_NDQS_IN => XCV2PHY_RD_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2XCV_NDQS_IN => XCV2PHY_RD_CLK[1]) = (0:0:0, 0:0:0);
    (XCV2XCV_NDQS_IN => XCV2PHY_RD_DQ[0]) = (0:0:0, 0:0:0);
    (XCV2XCV_PDQS_IN => XCV2PHY_RD_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2XCV_PDQS_IN => XCV2PHY_RD_DQ[0]) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
`endif
endmodule

`endcelldefine
