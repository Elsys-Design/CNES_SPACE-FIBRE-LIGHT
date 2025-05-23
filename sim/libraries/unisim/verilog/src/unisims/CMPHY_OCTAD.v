///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2023 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2023.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        CMPHY_OCTAD
// /___/   /\      Filename    : CMPHY_OCTAD.v
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

module CMPHY_OCTAD #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter ACC_FAST_LOCK = "DISABLE",
  parameter integer APBCLK_FREQ = 100,
  parameter CAL_DQS_SRC = "INTERNAL",
  parameter [1:0] CAL_REFCLK_EN = 2'b10,
  parameter [9:0] CAL_VT_OFST_C = 10'b0000000000,
  parameter CAL_VT_OFST_EN = "DISABLE",
  parameter [9:0] CAL_VT_OFST_M0 = 10'b0000000001,
  parameter [9:0] CAL_VT_OFST_M1 = 10'b0000000001,
  parameter CAL_VT_SRC = "OCTAD0",
  parameter [2:0] CLB_CLK_DBL_DCC = 3'b000,
  parameter [0:0] CLK_SRC = 1'b1,
  parameter integer CLOCK_FREQ = 200,
  parameter CN_EXT_DISABLE = "FALSE",
  parameter CN_LEGACY = "FALSE",
  parameter CONTINUOUS_DQS = "FALSE",
  parameter CPHY_RX_EN_0 = "FALSE",
  parameter CPHY_RX_EN_1 = "FALSE",
  parameter CPHY_TX_EN_0 = "FALSE",
  parameter CPHY_TX_EN_1 = "FALSE",
  parameter CTLE_OFST_CAL_0 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_1 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_2 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_3 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_4 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_5 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_6 = "CTLE_OFST_NONE",
  parameter CTLE_OFST_CAL_7 = "CTLE_OFST_NONE",
  parameter [11:0] DCC_CAL_RANGE = 12'b000000000000,
  parameter DCC_CAL_TIME_SEL = "DCC_CAL_TIME_DUMMY1",
  parameter [11:0] DCC_CONV_RANGE = 12'b000000000000,
  parameter DCC_CONV_TIME_SEL = "DCC_CONV_TIME_DUMMY1",
  parameter [8:0] DCC_RO_DLY0 = 9'b000000000,
  parameter [8:0] DCC_RO_DLY1 = 9'b000000000,
  parameter [8:0] DCC_RO_DLY2 = 9'b000000000,
  parameter DMC_APB_SEL = "FALSE",
  parameter DMC_BIT_SEL_0 = "FALSE",
  parameter DMC_BIT_SEL_1 = "FALSE",
  parameter DMC_BIT_SEL_2 = "FALSE",
  parameter DMC_BIT_SEL_3 = "FALSE",
  parameter DMC_BIT_SEL_4 = "FALSE",
  parameter DMC_BIT_SEL_5 = "FALSE",
  parameter DMC_BIT_SEL_6 = "FALSE",
  parameter DMC_BIT_SEL_7 = "FALSE",
  parameter DMC_CTL_SEL = "FALSE",
  parameter DPHY_RX_EN_0 = "FALSE",
  parameter DPHY_RX_EN_1 = "FALSE",
  parameter DPHY_RX_EN_2 = "FALSE",
  parameter DPHY_RX_EN_3 = "FALSE",
  parameter DPHY_TX_EN_0 = "FALSE",
  parameter DPHY_TX_EN_1 = "FALSE",
  parameter DPHY_TX_EN_2 = "FALSE",
  parameter DPHY_TX_EN_3 = "FALSE",
  parameter [2:0] DQS_MODE = 3'b001,
  parameter EN_CK90_CAL = "FALSE",
  parameter EN_DCC_CAL = "FALSE",
  parameter EN_FIX_DELAY_CAL = "FALSE",
  parameter EN_PRIMARY_DLL_CAL = "FALSE",
  parameter EN_SEQ_CAL = "FALSE",
  parameter [0:0] FD_NORD = 1'b0,
  parameter GT_VT_SRC = "INTERNAL",
  parameter GT_VT_SRC_OCTAD = "OCTAD0",
  parameter [12:0] HISTO_DELTA_ADJ = 13'h0000,
  parameter [9:0] HISTO_F0_TH = 10'h000,
  parameter [9:0] HISTO_F1_TH = 10'h000,
  parameter HISTO_NO_RU = "FALSE",
  parameter [6:0] HISTO_NPI_NS = 7'h00,
  parameter [9:0] HISTO_R0_TH = 10'h000,
  parameter [9:0] HISTO_R1_TH = 10'h000,
  parameter IBUF_DIS_EXT_SRC_0 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_1 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_2 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_3 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_4 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_5 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_6 = "FALSE",
  parameter IBUF_DIS_EXT_SRC_7 = "FALSE",
  parameter IBUF_DIS_SRC_0 = "EXTERNAL",
  parameter IBUF_DIS_SRC_1 = "EXTERNAL",
  parameter IBUF_DIS_SRC_2 = "EXTERNAL",
  parameter IBUF_DIS_SRC_3 = "EXTERNAL",
  parameter IBUF_DIS_SRC_4 = "EXTERNAL",
  parameter IBUF_DIS_SRC_5 = "EXTERNAL",
  parameter IBUF_DIS_SRC_6 = "EXTERNAL",
  parameter IBUF_DIS_SRC_7 = "EXTERNAL",
  parameter LEG_F_HISTO_E = "FALSE",
  parameter LEG_F_LGY_E = "FALSE",
  parameter MIPI_ALPRX_EN_M = "FALSE",
  parameter MIPI_ALPRX_EN_S = "FALSE",
  parameter integer NQTR_DELAY_VALUE_0 = 0,
  parameter integer NQTR_DELAY_VALUE_1 = 0,
  parameter integer NQTR_DELAY_VALUE_2 = 0,
  parameter integer NQTR_DELAY_VALUE_3 = 0,
  parameter integer NQTR_DELAY_VALUE_4 = 0,
  parameter integer NQTR_DELAY_VALUE_5 = 0,
  parameter integer NQTR_DELAY_VALUE_6 = 0,
  parameter integer NQTR_DELAY_VALUE_7 = 0,
  parameter integer O_DELAY_VALUE_0 = 0,
  parameter integer O_DELAY_VALUE_1 = 0,
  parameter integer O_DELAY_VALUE_2 = 0,
  parameter integer O_DELAY_VALUE_3 = 0,
  parameter integer O_DELAY_VALUE_4 = 0,
  parameter integer O_DELAY_VALUE_5 = 0,
  parameter integer O_DELAY_VALUE_6 = 0,
  parameter integer O_DELAY_VALUE_7 = 0,
  parameter PDL_CASCADE = "FALSE",
  parameter PDL_HISTOGRAM_MODE = "DISABLE",
  parameter integer PQTR_DELAY_VALUE_0 = 0,
  parameter integer PQTR_DELAY_VALUE_1 = 0,
  parameter integer PQTR_DELAY_VALUE_2 = 0,
  parameter integer PQTR_DELAY_VALUE_3 = 0,
  parameter integer PQTR_DELAY_VALUE_4 = 0,
  parameter integer PQTR_DELAY_VALUE_5 = 0,
  parameter integer PQTR_DELAY_VALUE_6 = 0,
  parameter integer PQTR_DELAY_VALUE_7 = 0,
  parameter PRIMARY_DLL_CONFIG = "MODEA",
  parameter RIUCLK_DBLR_BYPASS = "FALSE",
  parameter [2:0] RIU_CLK_DBL_DCC = 3'b000,
  parameter ROUTETHRU_0 = "TRUE",
  parameter ROUTETHRU_1 = "TRUE",
  parameter ROUTETHRU_2 = "TRUE",
  parameter ROUTETHRU_3 = "TRUE",
  parameter ROUTETHRU_4 = "TRUE",
  parameter ROUTETHRU_5 = "TRUE",
  parameter ROUTETHRU_6 = "TRUE",
  parameter ROUTETHRU_7 = "TRUE",
  parameter RXFIFO_MODE_0 = "ASYNC",
  parameter RXFIFO_MODE_1 = "ASYNC",
  parameter RXFIFO_MODE_2 = "ASYNC",
  parameter RXFIFO_MODE_3 = "ASYNC",
  parameter RXFIFO_MODE_4 = "ASYNC",
  parameter RXFIFO_MODE_5 = "ASYNC",
  parameter RXFIFO_MODE_6 = "ASYNC",
  parameter RXFIFO_MODE_7 = "ASYNC",
  parameter RXFIFO_WRCLK_SEL = "CLK0",
  parameter [3:0] RXOFST_CAL_START = 4'b0000,
  parameter [7:0] RXOFST_END_CODE = 8'b01111111,
  parameter [0:0] RXOFST_EN_BIN_SRCH = 1'b1,
  parameter [0:0] RXOFST_EN_HIST_SRCH = 1'b1,
  parameter [0:0] RXOFST_EN_LIN_SRCH = 1'b1,
  parameter RXOFST_EXTEND_OFSC_RANGE = "TRUE",
  parameter [6:0] RXOFST_EXTRANGE_STEPSIZE = 7'b0000000,
  parameter [4:0] RXOFST_LIN_SRCH_RANGE = 5'b10000,
  parameter [1:0] RXOFST_LIN_SRCH_STEPSIZE = 2'b01,
  parameter [10:0] RXOFST_NUM_SAMPLES = 11'b00100000000,
  parameter [4:0] RXOFST_SETTELE_INTERVAL = 5'b10000,
  parameter [7:0] RXOFST_START_CODE = 8'b00000000,
  parameter [7:0] RXOFST_THRESHOLD = 8'b00000000,
  parameter RX_CLOCK_ALIGN = "RX_CLOCK_ALIGN_NONE",
  parameter integer RX_DATA_WIDTH = 16,
  parameter RX_PATH_RESET = "DISABLE",
  parameter SA_OFST_CAL_0 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_1 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_2 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_3 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_4 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_5 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_6 = "SA_OFST_NONE",
  parameter SA_OFST_CAL_7 = "SA_OFST_NONE",
  parameter SEQ_DIS_0 = "FALSE",
  parameter SEQ_DIS_1 = "FALSE",
  parameter SEQ_DIS_2 = "FALSE",
  parameter SEQ_DIS_3 = "FALSE",
  parameter SEQ_DIS_4 = "FALSE",
  parameter SEQ_DIS_5 = "FALSE",
  parameter SEQ_DIS_6 = "FALSE",
  parameter SEQ_DIS_7 = "FALSE",
  parameter [3:0] SEQ_DONE_MASK = 4'b1111,
  parameter [1:0] SEQ_DQS_CENTER = 2'b00,
  parameter SEQ_HISTROGRAM_MODE = "DISABLE",
  parameter integer SIM_VERSION = 1,
  parameter SLEW_MODE = "MODE0",
  parameter TBYTE_CTL_0 = "T",
  parameter TBYTE_CTL_1 = "T",
  parameter TBYTE_CTL_2 = "T",
  parameter TBYTE_CTL_3 = "T",
  parameter TBYTE_CTL_4 = "T",
  parameter TBYTE_CTL_5 = "T",
  parameter TBYTE_CTL_6 = "T",
  parameter TBYTE_CTL_7 = "T",
  parameter integer TX_DATA_WIDTH = 16,
  parameter integer TX_FIFO_PD_OFFSET = 1,
  parameter TX_FIFO_SYNC_BYPASS = "FALSE",
  parameter TX_INIT_0 = "FALSE",
  parameter TX_INIT_1 = "FALSE",
  parameter TX_INIT_2 = "FALSE",
  parameter TX_INIT_3 = "FALSE",
  parameter TX_INIT_4 = "FALSE",
  parameter TX_INIT_5 = "FALSE",
  parameter TX_INIT_6 = "FALSE",
  parameter TX_INIT_7 = "FALSE",
  parameter TX_INIT_T = "TRUE",
  parameter VTC_NOT_SPD = "FALSE",
  parameter WREN_CS_OVERRIDE_0 = "FALSE",
  parameter WREN_CS_OVERRIDE_1 = "FALSE",
  parameter WREN_CS_OVERRIDE_2 = "FALSE",
  parameter WREN_CS_OVERRIDE_3 = "FALSE",
  parameter WREN_CS_OVERRIDE_4 = "FALSE",
  parameter WREN_CS_OVERRIDE_5 = "FALSE",
  parameter WREN_CS_OVERRIDE_6 = "FALSE",
  parameter WREN_CS_OVERRIDE_7 = "FALSE",
  parameter [7:0] WR_CTL_MUXSEL = 8'b00000000,
  parameter [7:0] WR_DQ0_MUXSEL = 8'b00000000,
  parameter [7:0] WR_DQ1_MUXSEL = 8'b00000000,
  parameter [7:0] WR_EN0_MUXSEL = 8'b00000000,
  parameter [7:0] WR_EN1_MUXSEL = 8'b00000000
)(
  output DLY_RDY,
  output PHY2XCV_2TO1_CLK,
  output [7:0] PHY2XCV_DYNAMIC_DCI_TS,
  output [7:0] PHY2XCV_IBUF_DIS_OR_HS_RX_DIS,
  output [7:0] PHY2XCV_RD_CTL0,
  output [7:0] PHY2XCV_RD_CTL1,
  output [7:0] PHY2XCV_RD_CTL2,
  output [7:0] PHY2XCV_RD_CTL3,
  output [9:0] PHY2XCV_WR_CTL0,
  output [9:0] PHY2XCV_WR_CTL1,
  output [9:0] PHY2XCV_WR_CTL2,
  output [9:0] PHY2XCV_WR_CTL3,
  output [31:0] PHY2XCV_WR_DQ0,
  output [31:0] PHY2XCV_WR_DQ1,
  output [31:0] PHY2XCV_WR_DQ2,
  output [31:0] PHY2XCV_WR_DQ3,
  output [1:0] PHY_FIFO_EMPTY,
  output [3:0] PHY_LP_I_0,
  output [3:0] PHY_LP_I_1,
  output PHY_PD,
  output [15:0] PHY_Q0,
  output [15:0] PHY_Q1,
  output [15:0] PHY_Q2,
  output [15:0] PHY_Q3,
  output [15:0] PHY_Q4,
  output [15:0] PHY_Q5,
  output [15:0] PHY_Q6,
  output [15:0] PHY_Q7,
  output PHY_RDY,
  output PHY_STATUS,
  output [15:0] PRDATA,
  output PREADY,
  output PSLVERR,
  output RIU2XCV_CA0,
  output RIU2XCV_CA1,
  output RIU2XCV_CA2,
  output RIU2XCV_CA3,
  output RIU2XCV_CK0,
  output RIU2XCV_CK1,
  output RIU2XCV_CK2,
  output RIU2XCV_CK3,
  output RIU2XCV_RST0,
  output RIU2XCV_RST1,
  output RIU2XCV_RST2,
  output RIU2XCV_RST3,
  output RIU2XCV_WR0,
  output RIU2XCV_WR1,
  output RIU2XCV_WR2,
  output RIU2XCV_WR3,
  output [1:0] RXFIFO_WR_CLK,
  output SEQ_DONE,
  output [20:0] VT_DLY_OUT,
  output [20:0] VT_DRFT_OUT,

  input [7:0] DYN_DCI_IN,
  input [7:0] IBUFDISABLE,
  input [9:0] PADDR,
  input PCLK,
  input PENABLE,
  input PHY_2TO1_CLK,
  input PHY_CLK,
  input [15:0] PHY_D0,
  input [15:0] PHY_D1,
  input [15:0] PHY_D2,
  input [15:0] PHY_D3,
  input [15:0] PHY_D4,
  input [15:0] PHY_D5,
  input [15:0] PHY_D6,
  input [15:0] PHY_D7,
  input [1:0] PHY_FIFO_RDEN,
  input [7:0] PHY_KEEPER_EN,
  input [3:0] PHY_LP_RX_DIS_OR_TERM_EN,
  input [3:0] PHY_LP_TX_O_0,
  input [3:0] PHY_LP_TX_O_1,
  input [3:0] PHY_LP_TX_T,
  input [7:0] PHY_RDCS0,
  input [7:0] PHY_RDCS1,
  input [7:0] PHY_RDEN,
  input PHY_RST,
  input [1:0] PHY_RXFIFO_RDCLK,
  input [7:0] PHY_WRCS0,
  input [7:0] PHY_WRCS1,
  input [7:0] PHY_WREN,
  input PRESETN,
  input PSEL,
  input [15:0] PWDATA,
  input PWRITE,
  input [7:0] RX_RST,
  input [3:0] SEQ_DONE_I,
  input [7:0] T,
  input [7:0] TX_RST,
  input [20:0] VT_DLY_IN0,
  input [20:0] VT_DLY_IN1,
  input [20:0] VT_DLY_IN2,
  input [20:0] VT_DLY_IN3,
  input [20:0] VT_DRFT_IN0,
  input [20:0] VT_DRFT_IN1,
  input [20:0] VT_DRFT_IN2,
  input [20:0] VT_DRFT_IN3,
  input [3:0] XCV2PHY_LP_I_0,
  input [3:0] XCV2PHY_LP_I_1,
  input [1:0] XCV2PHY_RD_CLK0,
  input [1:0] XCV2PHY_RD_CLK1,
  input [1:0] XCV2PHY_RD_CLK2,
  input [1:0] XCV2PHY_RD_CLK3,
  input [15:0] XCV2PHY_RD_DQ0,
  input [15:0] XCV2PHY_RD_DQ1,
  input [15:0] XCV2PHY_RD_DQ2,
  input [15:0] XCV2PHY_RD_DQ3,
  input XCV2PHY_WR_CLK0,
  input XCV2PHY_WR_CLK1,
  input XCV2PHY_WR_CLK2,
  input XCV2PHY_WR_CLK3,
  input XCV2RIU_CK0,
  input XCV2RIU_CK1,
  input XCV2RIU_CK2,
  input XCV2RIU_CK3,
  input [3:0] XCV2RIU_RD0,
  input [3:0] XCV2RIU_RD1,
  input [3:0] XCV2RIU_RD2,
  input [3:0] XCV2RIU_RD3
);

// define constants
  localparam MODULE_NAME = "CMPHY_OCTAD";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "CMPHY_OCTAD_dr.v"
`else
  reg [56:1] ACC_FAST_LOCK_REG = ACC_FAST_LOCK;
  reg [8:0] APBCLK_FREQ_REG = APBCLK_FREQ;
  reg [64:1] CAL_DQS_SRC_REG = CAL_DQS_SRC;
  reg [1:0] CAL_REFCLK_EN_REG = CAL_REFCLK_EN;
  reg [9:0] CAL_VT_OFST_C_REG = CAL_VT_OFST_C;
  reg [56:1] CAL_VT_OFST_EN_REG = CAL_VT_OFST_EN;
  reg [9:0] CAL_VT_OFST_M0_REG = CAL_VT_OFST_M0;
  reg [9:0] CAL_VT_OFST_M1_REG = CAL_VT_OFST_M1;
  reg [48:1] CAL_VT_SRC_REG = CAL_VT_SRC;
  reg [2:0] CLB_CLK_DBL_DCC_REG = CLB_CLK_DBL_DCC;
  reg [0:0] CLK_SRC_REG = CLK_SRC;
  reg [12:0] CLOCK_FREQ_REG = CLOCK_FREQ;
  reg [40:1] CN_EXT_DISABLE_REG = CN_EXT_DISABLE;
  reg [40:1] CN_LEGACY_REG = CN_LEGACY;
  reg [40:1] CONTINUOUS_DQS_REG = CONTINUOUS_DQS;
  reg [40:1] CPHY_RX_EN_0_REG = CPHY_RX_EN_0;
  reg [40:1] CPHY_RX_EN_1_REG = CPHY_RX_EN_1;
  reg [40:1] CPHY_TX_EN_0_REG = CPHY_TX_EN_0;
  reg [40:1] CPHY_TX_EN_1_REG = CPHY_TX_EN_1;
  reg [128:1] CTLE_OFST_CAL_0_REG = CTLE_OFST_CAL_0;
  reg [128:1] CTLE_OFST_CAL_1_REG = CTLE_OFST_CAL_1;
  reg [128:1] CTLE_OFST_CAL_2_REG = CTLE_OFST_CAL_2;
  reg [128:1] CTLE_OFST_CAL_3_REG = CTLE_OFST_CAL_3;
  reg [128:1] CTLE_OFST_CAL_4_REG = CTLE_OFST_CAL_4;
  reg [128:1] CTLE_OFST_CAL_5_REG = CTLE_OFST_CAL_5;
  reg [128:1] CTLE_OFST_CAL_6_REG = CTLE_OFST_CAL_6;
  reg [128:1] CTLE_OFST_CAL_7_REG = CTLE_OFST_CAL_7;
  reg [11:0] DCC_CAL_RANGE_REG = DCC_CAL_RANGE;
  reg [152:1] DCC_CAL_TIME_SEL_REG = DCC_CAL_TIME_SEL;
  reg [11:0] DCC_CONV_RANGE_REG = DCC_CONV_RANGE;
  reg [160:1] DCC_CONV_TIME_SEL_REG = DCC_CONV_TIME_SEL;
  reg [8:0] DCC_RO_DLY0_REG = DCC_RO_DLY0;
  reg [8:0] DCC_RO_DLY1_REG = DCC_RO_DLY1;
  reg [8:0] DCC_RO_DLY2_REG = DCC_RO_DLY2;
  reg [40:1] DMC_APB_SEL_REG = DMC_APB_SEL;
  reg [40:1] DMC_BIT_SEL_0_REG = DMC_BIT_SEL_0;
  reg [40:1] DMC_BIT_SEL_1_REG = DMC_BIT_SEL_1;
  reg [40:1] DMC_BIT_SEL_2_REG = DMC_BIT_SEL_2;
  reg [40:1] DMC_BIT_SEL_3_REG = DMC_BIT_SEL_3;
  reg [40:1] DMC_BIT_SEL_4_REG = DMC_BIT_SEL_4;
  reg [40:1] DMC_BIT_SEL_5_REG = DMC_BIT_SEL_5;
  reg [40:1] DMC_BIT_SEL_6_REG = DMC_BIT_SEL_6;
  reg [40:1] DMC_BIT_SEL_7_REG = DMC_BIT_SEL_7;
  reg [40:1] DMC_CTL_SEL_REG = DMC_CTL_SEL;
  reg [40:1] DPHY_RX_EN_0_REG = DPHY_RX_EN_0;
  reg [40:1] DPHY_RX_EN_1_REG = DPHY_RX_EN_1;
  reg [40:1] DPHY_RX_EN_2_REG = DPHY_RX_EN_2;
  reg [40:1] DPHY_RX_EN_3_REG = DPHY_RX_EN_3;
  reg [40:1] DPHY_TX_EN_0_REG = DPHY_TX_EN_0;
  reg [40:1] DPHY_TX_EN_1_REG = DPHY_TX_EN_1;
  reg [40:1] DPHY_TX_EN_2_REG = DPHY_TX_EN_2;
  reg [40:1] DPHY_TX_EN_3_REG = DPHY_TX_EN_3;
  reg [2:0] DQS_MODE_REG = DQS_MODE;
  reg [40:1] EN_CK90_CAL_REG = EN_CK90_CAL;
  reg [40:1] EN_DCC_CAL_REG = EN_DCC_CAL;
  reg [40:1] EN_FIX_DELAY_CAL_REG = EN_FIX_DELAY_CAL;
  reg [40:1] EN_PRIMARY_DLL_CAL_REG = EN_PRIMARY_DLL_CAL;
  reg [40:1] EN_SEQ_CAL_REG = EN_SEQ_CAL;
  reg [0:0] FD_NORD_REG = FD_NORD;
  reg [64:1] GT_VT_SRC_REG = GT_VT_SRC;
  reg [48:1] GT_VT_SRC_OCTAD_REG = GT_VT_SRC_OCTAD;
  reg [12:0] HISTO_DELTA_ADJ_REG = HISTO_DELTA_ADJ;
  reg [9:0] HISTO_F0_TH_REG = HISTO_F0_TH;
  reg [9:0] HISTO_F1_TH_REG = HISTO_F1_TH;
  reg [40:1] HISTO_NO_RU_REG = HISTO_NO_RU;
  reg [6:0] HISTO_NPI_NS_REG = HISTO_NPI_NS;
  reg [9:0] HISTO_R0_TH_REG = HISTO_R0_TH;
  reg [9:0] HISTO_R1_TH_REG = HISTO_R1_TH;
  reg [40:1] IBUF_DIS_EXT_SRC_0_REG = IBUF_DIS_EXT_SRC_0;
  reg [40:1] IBUF_DIS_EXT_SRC_1_REG = IBUF_DIS_EXT_SRC_1;
  reg [40:1] IBUF_DIS_EXT_SRC_2_REG = IBUF_DIS_EXT_SRC_2;
  reg [40:1] IBUF_DIS_EXT_SRC_3_REG = IBUF_DIS_EXT_SRC_3;
  reg [40:1] IBUF_DIS_EXT_SRC_4_REG = IBUF_DIS_EXT_SRC_4;
  reg [40:1] IBUF_DIS_EXT_SRC_5_REG = IBUF_DIS_EXT_SRC_5;
  reg [40:1] IBUF_DIS_EXT_SRC_6_REG = IBUF_DIS_EXT_SRC_6;
  reg [40:1] IBUF_DIS_EXT_SRC_7_REG = IBUF_DIS_EXT_SRC_7;
  reg [64:1] IBUF_DIS_SRC_0_REG = IBUF_DIS_SRC_0;
  reg [64:1] IBUF_DIS_SRC_1_REG = IBUF_DIS_SRC_1;
  reg [64:1] IBUF_DIS_SRC_2_REG = IBUF_DIS_SRC_2;
  reg [64:1] IBUF_DIS_SRC_3_REG = IBUF_DIS_SRC_3;
  reg [64:1] IBUF_DIS_SRC_4_REG = IBUF_DIS_SRC_4;
  reg [64:1] IBUF_DIS_SRC_5_REG = IBUF_DIS_SRC_5;
  reg [64:1] IBUF_DIS_SRC_6_REG = IBUF_DIS_SRC_6;
  reg [64:1] IBUF_DIS_SRC_7_REG = IBUF_DIS_SRC_7;
  reg [40:1] LEG_F_HISTO_E_REG = LEG_F_HISTO_E;
  reg [40:1] LEG_F_LGY_E_REG = LEG_F_LGY_E;
  reg [40:1] MIPI_ALPRX_EN_M_REG = MIPI_ALPRX_EN_M;
  reg [40:1] MIPI_ALPRX_EN_S_REG = MIPI_ALPRX_EN_S;
  reg [9:0] NQTR_DELAY_VALUE_0_REG = NQTR_DELAY_VALUE_0;
  reg [9:0] NQTR_DELAY_VALUE_1_REG = NQTR_DELAY_VALUE_1;
  reg [9:0] NQTR_DELAY_VALUE_2_REG = NQTR_DELAY_VALUE_2;
  reg [9:0] NQTR_DELAY_VALUE_3_REG = NQTR_DELAY_VALUE_3;
  reg [9:0] NQTR_DELAY_VALUE_4_REG = NQTR_DELAY_VALUE_4;
  reg [9:0] NQTR_DELAY_VALUE_5_REG = NQTR_DELAY_VALUE_5;
  reg [9:0] NQTR_DELAY_VALUE_6_REG = NQTR_DELAY_VALUE_6;
  reg [9:0] NQTR_DELAY_VALUE_7_REG = NQTR_DELAY_VALUE_7;
  reg [9:0] O_DELAY_VALUE_0_REG = O_DELAY_VALUE_0;
  reg [9:0] O_DELAY_VALUE_1_REG = O_DELAY_VALUE_1;
  reg [9:0] O_DELAY_VALUE_2_REG = O_DELAY_VALUE_2;
  reg [9:0] O_DELAY_VALUE_3_REG = O_DELAY_VALUE_3;
  reg [9:0] O_DELAY_VALUE_4_REG = O_DELAY_VALUE_4;
  reg [9:0] O_DELAY_VALUE_5_REG = O_DELAY_VALUE_5;
  reg [9:0] O_DELAY_VALUE_6_REG = O_DELAY_VALUE_6;
  reg [9:0] O_DELAY_VALUE_7_REG = O_DELAY_VALUE_7;
  reg [40:1] PDL_CASCADE_REG = PDL_CASCADE;
  reg [56:1] PDL_HISTOGRAM_MODE_REG = PDL_HISTOGRAM_MODE;
  reg [9:0] PQTR_DELAY_VALUE_0_REG = PQTR_DELAY_VALUE_0;
  reg [9:0] PQTR_DELAY_VALUE_1_REG = PQTR_DELAY_VALUE_1;
  reg [9:0] PQTR_DELAY_VALUE_2_REG = PQTR_DELAY_VALUE_2;
  reg [9:0] PQTR_DELAY_VALUE_3_REG = PQTR_DELAY_VALUE_3;
  reg [9:0] PQTR_DELAY_VALUE_4_REG = PQTR_DELAY_VALUE_4;
  reg [9:0] PQTR_DELAY_VALUE_5_REG = PQTR_DELAY_VALUE_5;
  reg [9:0] PQTR_DELAY_VALUE_6_REG = PQTR_DELAY_VALUE_6;
  reg [9:0] PQTR_DELAY_VALUE_7_REG = PQTR_DELAY_VALUE_7;
  reg [48:1] PRIMARY_DLL_CONFIG_REG = PRIMARY_DLL_CONFIG;
  reg [40:1] RIUCLK_DBLR_BYPASS_REG = RIUCLK_DBLR_BYPASS;
  reg [2:0] RIU_CLK_DBL_DCC_REG = RIU_CLK_DBL_DCC;
  reg [40:1] ROUTETHRU_0_REG = ROUTETHRU_0;
  reg [40:1] ROUTETHRU_1_REG = ROUTETHRU_1;
  reg [40:1] ROUTETHRU_2_REG = ROUTETHRU_2;
  reg [40:1] ROUTETHRU_3_REG = ROUTETHRU_3;
  reg [40:1] ROUTETHRU_4_REG = ROUTETHRU_4;
  reg [40:1] ROUTETHRU_5_REG = ROUTETHRU_5;
  reg [40:1] ROUTETHRU_6_REG = ROUTETHRU_6;
  reg [40:1] ROUTETHRU_7_REG = ROUTETHRU_7;
  reg [48:1] RXFIFO_MODE_0_REG = RXFIFO_MODE_0;
  reg [48:1] RXFIFO_MODE_1_REG = RXFIFO_MODE_1;
  reg [48:1] RXFIFO_MODE_2_REG = RXFIFO_MODE_2;
  reg [48:1] RXFIFO_MODE_3_REG = RXFIFO_MODE_3;
  reg [48:1] RXFIFO_MODE_4_REG = RXFIFO_MODE_4;
  reg [48:1] RXFIFO_MODE_5_REG = RXFIFO_MODE_5;
  reg [48:1] RXFIFO_MODE_6_REG = RXFIFO_MODE_6;
  reg [48:1] RXFIFO_MODE_7_REG = RXFIFO_MODE_7;
  reg [32:1] RXFIFO_WRCLK_SEL_REG = RXFIFO_WRCLK_SEL;
  reg [3:0] RXOFST_CAL_START_REG = RXOFST_CAL_START;
  reg [7:0] RXOFST_END_CODE_REG = RXOFST_END_CODE;
  reg [0:0] RXOFST_EN_BIN_SRCH_REG = RXOFST_EN_BIN_SRCH;
  reg [0:0] RXOFST_EN_HIST_SRCH_REG = RXOFST_EN_HIST_SRCH;
  reg [0:0] RXOFST_EN_LIN_SRCH_REG = RXOFST_EN_LIN_SRCH;
  reg [40:1] RXOFST_EXTEND_OFSC_RANGE_REG = RXOFST_EXTEND_OFSC_RANGE;
  reg [6:0] RXOFST_EXTRANGE_STEPSIZE_REG = RXOFST_EXTRANGE_STEPSIZE;
  reg [4:0] RXOFST_LIN_SRCH_RANGE_REG = RXOFST_LIN_SRCH_RANGE;
  reg [1:0] RXOFST_LIN_SRCH_STEPSIZE_REG = RXOFST_LIN_SRCH_STEPSIZE;
  reg [10:0] RXOFST_NUM_SAMPLES_REG = RXOFST_NUM_SAMPLES;
  reg [4:0] RXOFST_SETTELE_INTERVAL_REG = RXOFST_SETTELE_INTERVAL;
  reg [7:0] RXOFST_START_CODE_REG = RXOFST_START_CODE;
  reg [7:0] RXOFST_THRESHOLD_REG = RXOFST_THRESHOLD;
  reg [152:1] RX_CLOCK_ALIGN_REG = RX_CLOCK_ALIGN;
  reg [4:0] RX_DATA_WIDTH_REG = RX_DATA_WIDTH;
  reg [56:1] RX_PATH_RESET_REG = RX_PATH_RESET;
  reg [112:1] SA_OFST_CAL_0_REG = SA_OFST_CAL_0;
  reg [112:1] SA_OFST_CAL_1_REG = SA_OFST_CAL_1;
  reg [112:1] SA_OFST_CAL_2_REG = SA_OFST_CAL_2;
  reg [112:1] SA_OFST_CAL_3_REG = SA_OFST_CAL_3;
  reg [112:1] SA_OFST_CAL_4_REG = SA_OFST_CAL_4;
  reg [112:1] SA_OFST_CAL_5_REG = SA_OFST_CAL_5;
  reg [112:1] SA_OFST_CAL_6_REG = SA_OFST_CAL_6;
  reg [112:1] SA_OFST_CAL_7_REG = SA_OFST_CAL_7;
  reg [40:1] SEQ_DIS_0_REG = SEQ_DIS_0;
  reg [40:1] SEQ_DIS_1_REG = SEQ_DIS_1;
  reg [40:1] SEQ_DIS_2_REG = SEQ_DIS_2;
  reg [40:1] SEQ_DIS_3_REG = SEQ_DIS_3;
  reg [40:1] SEQ_DIS_4_REG = SEQ_DIS_4;
  reg [40:1] SEQ_DIS_5_REG = SEQ_DIS_5;
  reg [40:1] SEQ_DIS_6_REG = SEQ_DIS_6;
  reg [40:1] SEQ_DIS_7_REG = SEQ_DIS_7;
  reg [3:0] SEQ_DONE_MASK_REG = SEQ_DONE_MASK;
  reg [1:0] SEQ_DQS_CENTER_REG = SEQ_DQS_CENTER;
  reg [56:1] SEQ_HISTROGRAM_MODE_REG = SEQ_HISTROGRAM_MODE;
  reg [1:0] SIM_VERSION_REG = SIM_VERSION;
  reg [40:1] SLEW_MODE_REG = SLEW_MODE;
  reg [64:1] TBYTE_CTL_0_REG = TBYTE_CTL_0;
  reg [64:1] TBYTE_CTL_1_REG = TBYTE_CTL_1;
  reg [64:1] TBYTE_CTL_2_REG = TBYTE_CTL_2;
  reg [64:1] TBYTE_CTL_3_REG = TBYTE_CTL_3;
  reg [64:1] TBYTE_CTL_4_REG = TBYTE_CTL_4;
  reg [64:1] TBYTE_CTL_5_REG = TBYTE_CTL_5;
  reg [64:1] TBYTE_CTL_6_REG = TBYTE_CTL_6;
  reg [64:1] TBYTE_CTL_7_REG = TBYTE_CTL_7;
  reg [4:0] TX_DATA_WIDTH_REG = TX_DATA_WIDTH;
  reg [2:0] TX_FIFO_PD_OFFSET_REG = TX_FIFO_PD_OFFSET;
  reg [40:1] TX_FIFO_SYNC_BYPASS_REG = TX_FIFO_SYNC_BYPASS;
  reg [40:1] TX_INIT_0_REG = TX_INIT_0;
  reg [40:1] TX_INIT_1_REG = TX_INIT_1;
  reg [40:1] TX_INIT_2_REG = TX_INIT_2;
  reg [40:1] TX_INIT_3_REG = TX_INIT_3;
  reg [40:1] TX_INIT_4_REG = TX_INIT_4;
  reg [40:1] TX_INIT_5_REG = TX_INIT_5;
  reg [40:1] TX_INIT_6_REG = TX_INIT_6;
  reg [40:1] TX_INIT_7_REG = TX_INIT_7;
  reg [40:1] TX_INIT_T_REG = TX_INIT_T;
  reg [40:1] VTC_NOT_SPD_REG = VTC_NOT_SPD;
  reg [40:1] WREN_CS_OVERRIDE_0_REG = WREN_CS_OVERRIDE_0;
  reg [40:1] WREN_CS_OVERRIDE_1_REG = WREN_CS_OVERRIDE_1;
  reg [40:1] WREN_CS_OVERRIDE_2_REG = WREN_CS_OVERRIDE_2;
  reg [40:1] WREN_CS_OVERRIDE_3_REG = WREN_CS_OVERRIDE_3;
  reg [40:1] WREN_CS_OVERRIDE_4_REG = WREN_CS_OVERRIDE_4;
  reg [40:1] WREN_CS_OVERRIDE_5_REG = WREN_CS_OVERRIDE_5;
  reg [40:1] WREN_CS_OVERRIDE_6_REG = WREN_CS_OVERRIDE_6;
  reg [40:1] WREN_CS_OVERRIDE_7_REG = WREN_CS_OVERRIDE_7;
  reg [7:0] WR_CTL_MUXSEL_REG = WR_CTL_MUXSEL;
  reg [7:0] WR_DQ0_MUXSEL_REG = WR_DQ0_MUXSEL;
  reg [7:0] WR_DQ1_MUXSEL_REG = WR_DQ1_MUXSEL;
  reg [7:0] WR_EN0_MUXSEL_REG = WR_EN0_MUXSEL;
  reg [7:0] WR_EN1_MUXSEL_REG = WR_EN1_MUXSEL;
`endif

  reg [3:0] ACC_WIAT_0_REG = 4'h0;
  reg [40:1] DIS_IDLY_VT_TRACK_REG = "FALSE";
  reg [40:1] DIS_ODLY_VT_TRACK_REG = "FALSE";
  reg [40:1] DIS_QDLY_VT_TRACK_REG = "FALSE";
  reg [40:1] EN_DYN_DLY_MODE_REG = "FALSE";
  reg [0:0] FAST_CK_REG = 1'b0;
  reg [0:0] FIFO_CLK_SRC_REG = 1'b0;
  reg [1:0] LOWER_FREQ_SWITCH_REG = 2'b00;
  reg [0:0] LP4_DQS_REG = 1'b0;
  reg [40:1] MUX2RDP_CLK_SEL_REG = "FALSE";
  reg [64:1] ODT_SRC_0_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_1_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_2_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_3_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_4_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_5_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_6_REG = "EXTERNAL";
  reg [64:1] ODT_SRC_7_REG = "EXTERNAL";
  reg [0:0] PRIME_VAL_REG = 1'b0;
  reg [7:0] RD_CTL_MUXSEL_REG = 8'b00000000;
  reg [7:0] RF_ROUNDING_FACTOR_REG = 8'b00010000;
  reg [64:1] RX_CLK_PHASE_N_REG = "SHIFT_0";
  reg [64:1] RX_CLK_PHASE_P_REG = "SHIFT_0";
  reg [0:0] RX_DDR_EN_DQS_REG = 1'b1;
  reg [56:1] RX_GATE_REG = "DISABLE";
  reg [56:1] SELF_CALIBRATE_REG = "ENABLE";
  reg [40:1] SHIFT_DQS_N_REG = "FALSE";
  reg [40:1] SHIFT_DQS_P_REG = "FALSE";
  reg [14:0] SPARE_REG = 15'b000000000000000;
  reg [40:1] TEST_MCT_REG = "FALSE";

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire APB2DMC_PREADY_out;
  wire APB2DMC_PSLVERR_out;
  wire DLY_RDY_out;
  wire DMC_FIFO_EMPTY_out;
  wire DMC_PD_out;
  wire MUX2APB_PCLK_out;
  wire MUX2WRP_CLK_out;
  wire PHY2CLB_STATUS_out;
  wire PHY2XCV_2TO1_CLK_out;
  wire PHY_PD_out;
  wire PHY_RDY_out;
  wire PHY_STATUS_out;
  wire PREADY_out;
  wire PSLVERR_out;
  wire RIU2XCV_CA0_out;
  wire RIU2XCV_CA1_out;
  wire RIU2XCV_CA2_out;
  wire RIU2XCV_CA3_out;
  wire RIU2XCV_CK0_out;
  wire RIU2XCV_CK1_out;
  wire RIU2XCV_CK2_out;
  wire RIU2XCV_CK3_out;
  wire RIU2XCV_RST0_out;
  wire RIU2XCV_RST1_out;
  wire RIU2XCV_RST2_out;
  wire RIU2XCV_RST3_out;
  wire RIU2XCV_WR0_out;
  wire RIU2XCV_WR1_out;
  wire RIU2XCV_WR2_out;
  wire RIU2XCV_WR3_out;
  wire SEQ_DONE_out;
  wire [15:0] DMC2APB_PRDATA_out;
  wire [15:0] PHY_Q0_out;
  wire [15:0] PHY_Q1_out;
  wire [15:0] PHY_Q2_out;
  wire [15:0] PHY_Q3_out;
  wire [15:0] PHY_Q4_out;
  wire [15:0] PHY_Q5_out;
  wire [15:0] PHY_Q6_out;
  wire [15:0] PHY_Q7_out;
  wire [15:0] PRDATA_out;
  wire [15:0] Q0_out;
  wire [15:0] Q1_out;
  wire [15:0] Q2_out;
  wire [15:0] Q3_out;
  wire [15:0] Q4_out;
  wire [15:0] Q5_out;
  wire [15:0] Q6_out;
  wire [15:0] Q7_out;
  wire [1:0] FIFO_EMPTY_out;
  wire [1:0] MUX2RDP_CLK_out;
  wire [1:0] PHY_FIFO_EMPTY_out;
  wire [1:0] RXFIFO_WR_CLK_out;
  wire [20:0] VT_DLY_OUT_out;
  wire [20:0] VT_DRFT_OUT_out;
  wire [31:0] PHY2XCV_WR_DQ0_out;
  wire [31:0] PHY2XCV_WR_DQ1_out;
  wire [31:0] PHY2XCV_WR_DQ2_out;
  wire [31:0] PHY2XCV_WR_DQ3_out;
  wire [3:0] PHY2CLB_LP_I_0_out;
  wire [3:0] PHY2CLB_LP_I_1_out;
  wire [3:0] PHY_LP_I_0_out;
  wire [3:0] PHY_LP_I_1_out;
  wire [7:0] DMC_Q0_out;
  wire [7:0] DMC_Q1_out;
  wire [7:0] DMC_Q2_out;
  wire [7:0] DMC_Q3_out;
  wire [7:0] DMC_Q4_out;
  wire [7:0] DMC_Q5_out;
  wire [7:0] DMC_Q6_out;
  wire [7:0] DMC_Q7_out;
  wire [7:0] PHY2XCV_DYNAMIC_DCI_TS_out;
  wire [7:0] PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_out;
  wire [7:0] PHY2XCV_RD_CTL0_out;
  wire [7:0] PHY2XCV_RD_CTL1_out;
  wire [7:0] PHY2XCV_RD_CTL2_out;
  wire [7:0] PHY2XCV_RD_CTL3_out;
  wire [9:0] PHY2XCV_WR_CTL0_out;
  wire [9:0] PHY2XCV_WR_CTL1_out;
  wire [9:0] PHY2XCV_WR_CTL2_out;
  wire [9:0] PHY2XCV_WR_CTL3_out;

  wire DMC2APB_PCLK_in;
  wire DMC2APB_PENABLE_in;
  wire DMC2APB_PRESETN_in;
  wire DMC2APB_PSEL_in;
  wire DMC2APB_PWRITE_in;
  wire DMC_CLK_in;
  wire DMC_FIFO_RDCLK_in;
  wire DMC_FIFO_RDEN_in;
  wire DMC_RST_in;
  wire PCLK_in;
  wire PENABLE_in;
  wire PHY_2TO1_CLK_in;
  wire PHY_CLK_in;
  wire PHY_RST_in;
  wire PRESETN_in;
  wire PSEL_in;
  wire PWRITE_in;
  wire RST_in;
  wire SCAN_EN_in;
  wire SCAN_MODE_RST_N_in;
  wire SCAN_MODE_in;
  wire SCAN_RST_BYP_in;
  wire XCV2PHY_WR_CLK0_in;
  wire XCV2PHY_WR_CLK1_in;
  wire XCV2PHY_WR_CLK2_in;
  wire XCV2PHY_WR_CLK3_in;
  wire XCV2RIU_CK0_in;
  wire XCV2RIU_CK1_in;
  wire XCV2RIU_CK2_in;
  wire XCV2RIU_CK3_in;
  wire [15:0] D0_in;
  wire [15:0] D1_in;
  wire [15:0] D2_in;
  wire [15:0] D3_in;
  wire [15:0] D4_in;
  wire [15:0] D5_in;
  wire [15:0] D6_in;
  wire [15:0] D7_in;
  wire [15:0] DMC2APB_PWDATA_in;
  wire [15:0] PHY_D0_in;
  wire [15:0] PHY_D1_in;
  wire [15:0] PHY_D2_in;
  wire [15:0] PHY_D3_in;
  wire [15:0] PHY_D4_in;
  wire [15:0] PHY_D5_in;
  wire [15:0] PHY_D6_in;
  wire [15:0] PHY_D7_in;
  wire [15:0] PWDATA_in;
  wire [15:0] XCV2PHY_RD_DQ0_in;
  wire [15:0] XCV2PHY_RD_DQ1_in;
  wire [15:0] XCV2PHY_RD_DQ2_in;
  wire [15:0] XCV2PHY_RD_DQ3_in;
  wire [1:0] PHY_FIFO_RDEN_in;
  wire [1:0] PHY_RXFIFO_RDCLK_in;
  wire [1:0] RXFIFO_RDCLK_in;
  wire [1:0] RXFIFO_RDEN_in;
  wire [1:0] XCV2PHY_RD_CLK0_in;
  wire [1:0] XCV2PHY_RD_CLK1_in;
  wire [1:0] XCV2PHY_RD_CLK2_in;
  wire [1:0] XCV2PHY_RD_CLK3_in;
  wire [20:0] VT_DLY_IN0_in;
  wire [20:0] VT_DLY_IN1_in;
  wire [20:0] VT_DLY_IN2_in;
  wire [20:0] VT_DLY_IN3_in;
  wire [20:0] VT_DRFT_IN0_in;
  wire [20:0] VT_DRFT_IN1_in;
  wire [20:0] VT_DRFT_IN2_in;
  wire [20:0] VT_DRFT_IN3_in;
  wire [3:0] CLB2PHY_LP_RX_DIS_OR_TERM_EN_in;
  wire [3:0] CLB2PHY_LP_TX_O_0_in;
  wire [3:0] CLB2PHY_LP_TX_O_1_in;
  wire [3:0] CLB2PHY_LP_TX_T_in;
  wire [3:0] DMC_PHY_RDCS0_in;
  wire [3:0] DMC_PHY_RDCS1_in;
  wire [3:0] DMC_PHY_RDEN_in;
  wire [3:0] DMC_PHY_WRCS0_in;
  wire [3:0] DMC_PHY_WRCS1_in;
  wire [3:0] DMC_PHY_WREN_in;
  wire [3:0] PHY_LP_RX_DIS_OR_TERM_EN_in;
  wire [3:0] PHY_LP_TX_O_0_in;
  wire [3:0] PHY_LP_TX_O_1_in;
  wire [3:0] PHY_LP_TX_T_in;
  wire [3:0] SEQ_DONE_I_in;
  wire [3:0] XCV2PHY_LP_I_0_in;
  wire [3:0] XCV2PHY_LP_I_1_in;
  wire [3:0] XCV2RIU_RD0_in;
  wire [3:0] XCV2RIU_RD1_in;
  wire [3:0] XCV2RIU_RD2_in;
  wire [3:0] XCV2RIU_RD3_in;
  wire [7:0] CLB2PHY_KEEPER_EN_in;
  wire [7:0] DMC_D0_in;
  wire [7:0] DMC_D1_in;
  wire [7:0] DMC_D2_in;
  wire [7:0] DMC_D3_in;
  wire [7:0] DMC_D4_in;
  wire [7:0] DMC_D5_in;
  wire [7:0] DMC_D6_in;
  wire [7:0] DMC_D7_in;
  wire [7:0] DMC_IBUF_HS_RX_DIS_in;
  wire [7:0] DYN_DCI_IN_in;
  wire [7:0] IBUFDISABLEIN_in;
  wire [7:0] IBUFDISABLE_in;
  wire [7:0] PHY_KEEPER_EN_in;
  wire [7:0] PHY_RDCS0_in;
  wire [7:0] PHY_RDCS1_in;
  wire [7:0] PHY_RDEN_in;
  wire [7:0] PHY_WRCS0_in;
  wire [7:0] PHY_WRCS1_in;
  wire [7:0] PHY_WREN_in;
  wire [7:0] RX_RST_in;
  wire [7:0] TX_RST_in;
  wire [7:0] T_in;
  wire [9:0] DMC2APB_PADDR_in;
  wire [9:0] PADDR_in;

`ifdef XIL_TIMING
  wire PCLK_delay;
  wire PENABLE_delay;
  wire PHY_CLK_delay;
  wire PSEL_delay;
  wire PWRITE_delay;
  wire [15:0] PHY_D0_delay;
  wire [15:0] PHY_D1_delay;
  wire [15:0] PHY_D2_delay;
  wire [15:0] PHY_D3_delay;
  wire [15:0] PHY_D4_delay;
  wire [15:0] PHY_D5_delay;
  wire [15:0] PHY_D6_delay;
  wire [15:0] PHY_D7_delay;
  wire [15:0] PWDATA_delay;
  wire [1:0] PHY_FIFO_RDEN_delay;
  wire [1:0] PHY_RXFIFO_RDCLK_delay;
  wire [7:0] PHY_RDCS0_delay;
  wire [7:0] PHY_RDCS1_delay;
  wire [7:0] PHY_RDEN_delay;
  wire [7:0] PHY_WRCS0_delay;
  wire [7:0] PHY_WRCS1_delay;
  wire [7:0] PHY_WREN_delay;
  wire [9:0] PADDR_delay;
`endif

  //Manual edits for output ports with NoParents:TRUE
  assign PRDATA = PRDATA_out ;
  assign PREADY = PREADY_out ;
  assign PSLVERR = PSLVERR_out ;
  assign PHY_FIFO_EMPTY = PHY_FIFO_EMPTY_out ;
  assign PHY_Q0 = PHY_Q0_out ;
  assign PHY_Q1 = PHY_Q1_out ;
  assign PHY_Q2 = PHY_Q2_out ;
  assign PHY_Q3 = PHY_Q3_out ;
  assign PHY_Q4 = PHY_Q4_out ;
  assign PHY_Q5 = PHY_Q5_out ;
  assign PHY_Q6 = PHY_Q6_out ;
  assign PHY_Q7 = PHY_Q7_out ;

  assign DLY_RDY = DLY_RDY_out;
  assign PHY2XCV_2TO1_CLK = PHY2XCV_2TO1_CLK_out;
  assign PHY2XCV_DYNAMIC_DCI_TS = PHY2XCV_DYNAMIC_DCI_TS_out;
  assign PHY2XCV_IBUF_DIS_OR_HS_RX_DIS = PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_out;
  assign PHY2XCV_RD_CTL0 = PHY2XCV_RD_CTL0_out;
  assign PHY2XCV_RD_CTL1 = PHY2XCV_RD_CTL1_out;
  assign PHY2XCV_RD_CTL2 = PHY2XCV_RD_CTL2_out;
  assign PHY2XCV_RD_CTL3 = PHY2XCV_RD_CTL3_out;
  assign PHY2XCV_WR_CTL0 = PHY2XCV_WR_CTL0_out;
  assign PHY2XCV_WR_CTL1 = PHY2XCV_WR_CTL1_out;
  assign PHY2XCV_WR_CTL2 = PHY2XCV_WR_CTL2_out;
  assign PHY2XCV_WR_CTL3 = PHY2XCV_WR_CTL3_out;
  assign PHY2XCV_WR_DQ0 = PHY2XCV_WR_DQ0_out;
  assign PHY2XCV_WR_DQ1 = PHY2XCV_WR_DQ1_out;
  assign PHY2XCV_WR_DQ2 = PHY2XCV_WR_DQ2_out;
  assign PHY2XCV_WR_DQ3 = PHY2XCV_WR_DQ3_out;
  assign PHY_LP_I_0 = PHY_LP_I_0_out;
  assign PHY_LP_I_1 = PHY_LP_I_1_out;
  assign PHY_PD = PHY_PD_out;
  assign PHY_RDY = PHY_RDY_out;
  assign PHY_STATUS = PHY_STATUS_out;
  assign RIU2XCV_CA0 = RIU2XCV_CA0_out;
  assign RIU2XCV_CA1 = RIU2XCV_CA1_out;
  assign RIU2XCV_CA2 = RIU2XCV_CA2_out;
  assign RIU2XCV_CA3 = RIU2XCV_CA3_out;
  assign RIU2XCV_CK0 = RIU2XCV_CK0_out;
  assign RIU2XCV_CK1 = RIU2XCV_CK1_out;
  assign RIU2XCV_CK2 = RIU2XCV_CK2_out;
  assign RIU2XCV_CK3 = RIU2XCV_CK3_out;
  assign RIU2XCV_RST0 = RIU2XCV_RST0_out;
  assign RIU2XCV_RST1 = RIU2XCV_RST1_out;
  assign RIU2XCV_RST2 = RIU2XCV_RST2_out;
  assign RIU2XCV_RST3 = RIU2XCV_RST3_out;
  assign RIU2XCV_WR0 = RIU2XCV_WR0_out;
  assign RIU2XCV_WR1 = RIU2XCV_WR1_out;
  assign RIU2XCV_WR2 = RIU2XCV_WR2_out;
  assign RIU2XCV_WR3 = RIU2XCV_WR3_out;
  assign RXFIFO_WR_CLK = RXFIFO_WR_CLK_out;
  assign SEQ_DONE = SEQ_DONE_out;
  assign VT_DLY_OUT = VT_DLY_OUT_out;
  assign VT_DRFT_OUT = VT_DRFT_OUT_out;

`ifdef XIL_TIMING
  assign PADDR_in = PADDR_delay;
  assign PCLK_in = PCLK_delay;
  assign PENABLE_in = PENABLE_delay;
  assign PHY_CLK_in = PHY_CLK_delay;
  assign PHY_D0_in = PHY_D0_delay;
  assign PHY_D1_in = PHY_D1_delay;
  assign PHY_D2_in = PHY_D2_delay;
  assign PHY_D3_in = PHY_D3_delay;
  assign PHY_D4_in = PHY_D4_delay;
  assign PHY_D5_in = PHY_D5_delay;
  assign PHY_D6_in = PHY_D6_delay;
  assign PHY_D7_in = PHY_D7_delay;
  assign PHY_FIFO_RDEN_in = PHY_FIFO_RDEN_delay;
  assign PHY_RDCS0_in = PHY_RDCS0_delay;
  assign PHY_RDCS1_in = PHY_RDCS1_delay;
  assign PHY_RDEN_in = PHY_RDEN_delay;
  assign PHY_RXFIFO_RDCLK_in[0] = PHY_RXFIFO_RDCLK_delay[0];
  assign PHY_WRCS0_in = PHY_WRCS0_delay;
  assign PHY_WRCS1_in = PHY_WRCS1_delay;
  assign PHY_WREN_in = PHY_WREN_delay;
  assign PSEL_in = PSEL_delay;
  assign PWDATA_in = PWDATA_delay;
  assign PWRITE_in = PWRITE_delay;
`else
  assign PADDR_in = PADDR;
  assign PCLK_in = PCLK;
  assign PENABLE_in = PENABLE;
  assign PHY_CLK_in = PHY_CLK;
  assign PHY_D0_in = PHY_D0;
  assign PHY_D1_in = PHY_D1;
  assign PHY_D2_in = PHY_D2;
  assign PHY_D3_in = PHY_D3;
  assign PHY_D4_in = PHY_D4;
  assign PHY_D5_in = PHY_D5;
  assign PHY_D6_in = PHY_D6;
  assign PHY_D7_in = PHY_D7;
  assign PHY_FIFO_RDEN_in = PHY_FIFO_RDEN;
  assign PHY_RDCS0_in = PHY_RDCS0;
  assign PHY_RDCS1_in = PHY_RDCS1;
  assign PHY_RDEN_in = PHY_RDEN;
  assign PHY_RXFIFO_RDCLK_in[0] = PHY_RXFIFO_RDCLK[0];
  assign PHY_WRCS0_in = PHY_WRCS0;
  assign PHY_WRCS1_in = PHY_WRCS1;
  assign PHY_WREN_in = PHY_WREN;
  assign PSEL_in = PSEL;
  assign PWDATA_in = PWDATA;
  assign PWRITE_in = PWRITE;
`endif

  assign DYN_DCI_IN_in = DYN_DCI_IN;
  assign IBUFDISABLE_in = IBUFDISABLE;
  assign PHY_2TO1_CLK_in = PHY_2TO1_CLK;
  assign PHY_KEEPER_EN_in = PHY_KEEPER_EN;
  assign PHY_LP_RX_DIS_OR_TERM_EN_in = PHY_LP_RX_DIS_OR_TERM_EN;
  assign PHY_LP_TX_O_0_in = PHY_LP_TX_O_0;
  assign PHY_LP_TX_O_1_in = PHY_LP_TX_O_1;
  assign PHY_LP_TX_T_in = PHY_LP_TX_T;
  assign PHY_RST_in = PHY_RST;
  assign PHY_RXFIFO_RDCLK_in[1] = PHY_RXFIFO_RDCLK[1];
  assign PRESETN_in = PRESETN;
  assign RX_RST_in = RX_RST;
  assign SEQ_DONE_I_in = SEQ_DONE_I;
  assign TX_RST_in = TX_RST;
  assign T_in = T;
  assign VT_DLY_IN0_in = VT_DLY_IN0;
  assign VT_DLY_IN1_in = VT_DLY_IN1;
  assign VT_DLY_IN2_in = VT_DLY_IN2;
  assign VT_DLY_IN3_in = VT_DLY_IN3;
  assign VT_DRFT_IN0_in = VT_DRFT_IN0;
  assign VT_DRFT_IN1_in = VT_DRFT_IN1;
  assign VT_DRFT_IN2_in = VT_DRFT_IN2;
  assign VT_DRFT_IN3_in = VT_DRFT_IN3;
  assign XCV2PHY_LP_I_0_in = XCV2PHY_LP_I_0;
  assign XCV2PHY_LP_I_1_in = XCV2PHY_LP_I_1;
  assign XCV2PHY_RD_CLK0_in = XCV2PHY_RD_CLK0;
  assign XCV2PHY_RD_CLK1_in = XCV2PHY_RD_CLK1;
  assign XCV2PHY_RD_CLK2_in = XCV2PHY_RD_CLK2;
  assign XCV2PHY_RD_CLK3_in = XCV2PHY_RD_CLK3;
  assign XCV2PHY_RD_DQ0_in = XCV2PHY_RD_DQ0;
  assign XCV2PHY_RD_DQ1_in = XCV2PHY_RD_DQ1;
  assign XCV2PHY_RD_DQ2_in = XCV2PHY_RD_DQ2;
  assign XCV2PHY_RD_DQ3_in = XCV2PHY_RD_DQ3;
  assign XCV2PHY_WR_CLK0_in = XCV2PHY_WR_CLK0;
  assign XCV2PHY_WR_CLK1_in = XCV2PHY_WR_CLK1;
  assign XCV2PHY_WR_CLK2_in = XCV2PHY_WR_CLK2;
  assign XCV2PHY_WR_CLK3_in = XCV2PHY_WR_CLK3;
  assign XCV2RIU_CK0_in = XCV2RIU_CK0;
  assign XCV2RIU_CK1_in = XCV2RIU_CK1;
  assign XCV2RIU_CK2_in = XCV2RIU_CK2;
  assign XCV2RIU_CK3_in = XCV2RIU_CK3;
  assign XCV2RIU_RD0_in = XCV2RIU_RD0;
  assign XCV2RIU_RD1_in = XCV2RIU_RD1;
  assign XCV2RIU_RD2_in = XCV2RIU_RD2;
  assign XCV2RIU_RD3_in = XCV2RIU_RD3;

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
        ((ACC_FAST_LOCK_REG != "DISABLE") &&
         (ACC_FAST_LOCK_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-101] ACC_FAST_LOCK attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, ACC_FAST_LOCK_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((APBCLK_FREQ_REG < 0) || (APBCLK_FREQ_REG > 500))) begin
      $display("Error: [Unisim %s-103] APBCLK_FREQ attribute is set to %d.  Legal values for this attribute are 0 to 500. Instance: %m", MODULE_NAME, APBCLK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CAL_DQS_SRC_REG != "INTERNAL") &&
         (CAL_DQS_SRC_REG != "EXTERNAL"))) begin
      $display("Error: [Unisim %s-104] CAL_DQS_SRC attribute is set to %s.  Legal values for this attribute are INTERNAL or EXTERNAL. Instance: %m", MODULE_NAME, CAL_DQS_SRC_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CAL_VT_OFST_EN_REG != "DISABLE") &&
         (CAL_VT_OFST_EN_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-107] CAL_VT_OFST_EN attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, CAL_VT_OFST_EN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CAL_VT_SRC_REG != "OCTAD0") &&
         (CAL_VT_SRC_REG != "OCTAD1") &&
         (CAL_VT_SRC_REG != "OCTAD2") &&
         (CAL_VT_SRC_REG != "OCTAD3"))) begin
      $display("Error: [Unisim %s-110] CAL_VT_SRC attribute is set to %s.  Legal values for this attribute are OCTAD0, OCTAD1, OCTAD2 or OCTAD3. Instance: %m", MODULE_NAME, CAL_VT_SRC_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CLOCK_FREQ_REG < 200) || (CLOCK_FREQ_REG > 4320))) begin
      $display("Error: [Unisim %s-113] CLOCK_FREQ attribute is set to %d.  Legal values for this attribute are 200 to 4320. Instance: %m", MODULE_NAME, CLOCK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CN_EXT_DISABLE_REG != "FALSE") &&
         (CN_EXT_DISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-114] CN_EXT_DISABLE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CN_EXT_DISABLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CN_LEGACY_REG != "FALSE") &&
         (CN_LEGACY_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-115] CN_LEGACY attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CN_LEGACY_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CONTINUOUS_DQS_REG != "FALSE") &&
         (CONTINUOUS_DQS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-116] CONTINUOUS_DQS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CONTINUOUS_DQS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_RX_EN_0_REG != "FALSE") &&
         (CPHY_RX_EN_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-117] CPHY_RX_EN_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_RX_EN_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_RX_EN_1_REG != "FALSE") &&
         (CPHY_RX_EN_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-118] CPHY_RX_EN_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_RX_EN_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_TX_EN_0_REG != "FALSE") &&
         (CPHY_TX_EN_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-119] CPHY_TX_EN_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_TX_EN_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CPHY_TX_EN_1_REG != "FALSE") &&
         (CPHY_TX_EN_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-120] CPHY_TX_EN_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, CPHY_TX_EN_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_0_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_0_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_0_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-121] CTLE_OFST_CAL_0 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_1_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_1_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_1_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-122] CTLE_OFST_CAL_1 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_2_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_2_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_2_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-123] CTLE_OFST_CAL_2 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_3_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_3_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_3_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-124] CTLE_OFST_CAL_3 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_4_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_4_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_4_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-125] CTLE_OFST_CAL_4 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_5_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_5_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_5_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-126] CTLE_OFST_CAL_5 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_6_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_6_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_6_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-127] CTLE_OFST_CAL_6 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((CTLE_OFST_CAL_7_REG != "CTLE_OFST_NONE") &&
         (CTLE_OFST_CAL_7_REG != "CTLE_OFST_AUTO") &&
         (CTLE_OFST_CAL_7_REG != "CTLE_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-128] CTLE_OFST_CAL_7 attribute is set to %s.  Legal values for this attribute are CTLE_OFST_NONE, CTLE_OFST_AUTO or CTLE_OFST_MANUAL. Instance: %m", MODULE_NAME, CTLE_OFST_CAL_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCC_CAL_RANGE_REG < 12'b000000000000) || (DCC_CAL_RANGE_REG > 12'b000001111111))) begin
      $display("Error: [Unisim %s-129] DCC_CAL_RANGE attribute is set to %b.  Legal values for this attribute are 12'b000000000000 to 12'b000001111111. Instance: %m", MODULE_NAME, DCC_CAL_RANGE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCC_CAL_TIME_SEL_REG != "DCC_CAL_TIME_DUMMY1") &&
         (DCC_CAL_TIME_SEL_REG != "DCC_CAL_TIME_DUMMY2") &&
         (DCC_CAL_TIME_SEL_REG != "DCC_CAL_TIME_DUMMY3") &&
         (DCC_CAL_TIME_SEL_REG != "DCC_CAL_TIME_DUMMY4"))) begin
      $display("Error: [Unisim %s-130] DCC_CAL_TIME_SEL attribute is set to %s.  Legal values for this attribute are DCC_CAL_TIME_DUMMY1, DCC_CAL_TIME_DUMMY2, DCC_CAL_TIME_DUMMY3 or DCC_CAL_TIME_DUMMY4. Instance: %m", MODULE_NAME, DCC_CAL_TIME_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCC_CONV_RANGE_REG < 12'b000000000000) || (DCC_CONV_RANGE_REG > 12'b000001111111))) begin
      $display("Error: [Unisim %s-131] DCC_CONV_RANGE attribute is set to %b.  Legal values for this attribute are 12'b000000000000 to 12'b000001111111. Instance: %m", MODULE_NAME, DCC_CONV_RANGE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DCC_CONV_TIME_SEL_REG != "DCC_CONV_TIME_DUMMY1") &&
         (DCC_CONV_TIME_SEL_REG != "DCC_CONV_TIME_DUMMY2") &&
         (DCC_CONV_TIME_SEL_REG != "DCC_CONV_TIME_DUMMY3") &&
         (DCC_CONV_TIME_SEL_REG != "DCC_CONV_TIME_DUMMY4"))) begin
      $display("Error: [Unisim %s-132] DCC_CONV_TIME_SEL attribute is set to %s.  Legal values for this attribute are DCC_CONV_TIME_DUMMY1, DCC_CONV_TIME_DUMMY2, DCC_CONV_TIME_DUMMY3 or DCC_CONV_TIME_DUMMY4. Instance: %m", MODULE_NAME, DCC_CONV_TIME_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_APB_SEL_REG != "FALSE") &&
         (DMC_APB_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-139] DMC_APB_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_APB_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_0_REG != "FALSE") &&
         (DMC_BIT_SEL_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-140] DMC_BIT_SEL_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_1_REG != "FALSE") &&
         (DMC_BIT_SEL_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-141] DMC_BIT_SEL_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_2_REG != "FALSE") &&
         (DMC_BIT_SEL_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-142] DMC_BIT_SEL_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_3_REG != "FALSE") &&
         (DMC_BIT_SEL_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-143] DMC_BIT_SEL_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_4_REG != "FALSE") &&
         (DMC_BIT_SEL_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-144] DMC_BIT_SEL_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_5_REG != "FALSE") &&
         (DMC_BIT_SEL_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-145] DMC_BIT_SEL_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_6_REG != "FALSE") &&
         (DMC_BIT_SEL_6_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-146] DMC_BIT_SEL_6 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_BIT_SEL_7_REG != "FALSE") &&
         (DMC_BIT_SEL_7_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-147] DMC_BIT_SEL_7 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_BIT_SEL_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DMC_CTL_SEL_REG != "FALSE") &&
         (DMC_CTL_SEL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-148] DMC_CTL_SEL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DMC_CTL_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_RX_EN_0_REG != "FALSE") &&
         (DPHY_RX_EN_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-149] DPHY_RX_EN_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_RX_EN_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_RX_EN_1_REG != "FALSE") &&
         (DPHY_RX_EN_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-150] DPHY_RX_EN_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_RX_EN_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_RX_EN_2_REG != "FALSE") &&
         (DPHY_RX_EN_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-151] DPHY_RX_EN_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_RX_EN_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_RX_EN_3_REG != "FALSE") &&
         (DPHY_RX_EN_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-152] DPHY_RX_EN_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_RX_EN_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_TX_EN_0_REG != "FALSE") &&
         (DPHY_TX_EN_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-153] DPHY_TX_EN_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_TX_EN_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_TX_EN_1_REG != "FALSE") &&
         (DPHY_TX_EN_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-154] DPHY_TX_EN_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_TX_EN_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_TX_EN_2_REG != "FALSE") &&
         (DPHY_TX_EN_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-155] DPHY_TX_EN_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_TX_EN_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DPHY_TX_EN_3_REG != "FALSE") &&
         (DPHY_TX_EN_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-156] DPHY_TX_EN_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DPHY_TX_EN_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_CK90_CAL_REG != "FALSE") &&
         (EN_CK90_CAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-158] EN_CK90_CAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_CK90_CAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_DCC_CAL_REG != "FALSE") &&
         (EN_DCC_CAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-159] EN_DCC_CAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_DCC_CAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_FIX_DELAY_CAL_REG != "FALSE") &&
         (EN_FIX_DELAY_CAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-161] EN_FIX_DELAY_CAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_FIX_DELAY_CAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_PRIMARY_DLL_CAL_REG != "FALSE") &&
         (EN_PRIMARY_DLL_CAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-162] EN_PRIMARY_DLL_CAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_PRIMARY_DLL_CAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_SEQ_CAL_REG != "FALSE") &&
         (EN_SEQ_CAL_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-163] EN_SEQ_CAL attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_SEQ_CAL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((GT_VT_SRC_REG != "INTERNAL") &&
         (GT_VT_SRC_REG != "EXTERNAL"))) begin
      $display("Error: [Unisim %s-167] GT_VT_SRC attribute is set to %s.  Legal values for this attribute are INTERNAL or EXTERNAL. Instance: %m", MODULE_NAME, GT_VT_SRC_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((GT_VT_SRC_OCTAD_REG != "OCTAD0") &&
         (GT_VT_SRC_OCTAD_REG != "OCTAD1") &&
         (GT_VT_SRC_OCTAD_REG != "OCTAD2") &&
         (GT_VT_SRC_OCTAD_REG != "OCTAD3"))) begin
      $display("Error: [Unisim %s-168] GT_VT_SRC_OCTAD attribute is set to %s.  Legal values for this attribute are OCTAD0, OCTAD1, OCTAD2 or OCTAD3. Instance: %m", MODULE_NAME, GT_VT_SRC_OCTAD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_DELTA_ADJ_REG < 13'h0000) || (HISTO_DELTA_ADJ_REG > 13'h0FFF))) begin
        $display("Error: [Unisim %s-169] HISTO_DELTA_ADJ attribute is set to %h.  Legal values for this attribute are 13'h0000 to 13'h0FFF. Instance: %m", MODULE_NAME, HISTO_DELTA_ADJ_REG);
        attr_err = 1'b1;
      end
    
    if ((attr_test == 1'b1) ||
        ((HISTO_NO_RU_REG != "FALSE") &&
         (HISTO_NO_RU_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-172] HISTO_NO_RU attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, HISTO_NO_RU_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_0_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-176] IBUF_DIS_EXT_SRC_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_1_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-177] IBUF_DIS_EXT_SRC_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_2_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-178] IBUF_DIS_EXT_SRC_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_3_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-179] IBUF_DIS_EXT_SRC_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_4_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-180] IBUF_DIS_EXT_SRC_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_5_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-181] IBUF_DIS_EXT_SRC_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_6_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_6_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-182] IBUF_DIS_EXT_SRC_6 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_EXT_SRC_7_REG != "FALSE") &&
         (IBUF_DIS_EXT_SRC_7_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-183] IBUF_DIS_EXT_SRC_7 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, IBUF_DIS_EXT_SRC_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_0_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_0_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-184] IBUF_DIS_SRC_0 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_1_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_1_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-185] IBUF_DIS_SRC_1 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_2_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_2_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-186] IBUF_DIS_SRC_2 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_3_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_3_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-187] IBUF_DIS_SRC_3 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_4_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_4_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-188] IBUF_DIS_SRC_4 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_5_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_5_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-189] IBUF_DIS_SRC_5 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_6_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_6_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-190] IBUF_DIS_SRC_6 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_DIS_SRC_7_REG != "EXTERNAL") &&
         (IBUF_DIS_SRC_7_REG != "INTERNAL"))) begin
      $display("Error: [Unisim %s-191] IBUF_DIS_SRC_7 attribute is set to %s.  Legal values for this attribute are EXTERNAL or INTERNAL. Instance: %m", MODULE_NAME, IBUF_DIS_SRC_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LEG_F_HISTO_E_REG != "FALSE") &&
         (LEG_F_HISTO_E_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-192] LEG_F_HISTO_E attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LEG_F_HISTO_E_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((LEG_F_LGY_E_REG != "FALSE") &&
         (LEG_F_LGY_E_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-193] LEG_F_LGY_E attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, LEG_F_LGY_E_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPRX_EN_M_REG != "FALSE") &&
         (MIPI_ALPRX_EN_M_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-196] MIPI_ALPRX_EN_M attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPRX_EN_M_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MIPI_ALPRX_EN_S_REG != "FALSE") &&
         (MIPI_ALPRX_EN_S_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-197] MIPI_ALPRX_EN_S attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, MIPI_ALPRX_EN_S_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_0_REG < 0) || (NQTR_DELAY_VALUE_0_REG > 625))) begin
      $display("Error: [Unisim %s-199] NQTR_DELAY_VALUE_0 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_1_REG < 0) || (NQTR_DELAY_VALUE_1_REG > 625))) begin
      $display("Error: [Unisim %s-200] NQTR_DELAY_VALUE_1 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_2_REG < 0) || (NQTR_DELAY_VALUE_2_REG > 625))) begin
      $display("Error: [Unisim %s-201] NQTR_DELAY_VALUE_2 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_3_REG < 0) || (NQTR_DELAY_VALUE_3_REG > 625))) begin
      $display("Error: [Unisim %s-202] NQTR_DELAY_VALUE_3 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_4_REG < 0) || (NQTR_DELAY_VALUE_4_REG > 625))) begin
      $display("Error: [Unisim %s-203] NQTR_DELAY_VALUE_4 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_5_REG < 0) || (NQTR_DELAY_VALUE_5_REG > 625))) begin
      $display("Error: [Unisim %s-204] NQTR_DELAY_VALUE_5 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_6_REG < 0) || (NQTR_DELAY_VALUE_6_REG > 625))) begin
      $display("Error: [Unisim %s-205] NQTR_DELAY_VALUE_6 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((NQTR_DELAY_VALUE_7_REG < 0) || (NQTR_DELAY_VALUE_7_REG > 625))) begin
      $display("Error: [Unisim %s-206] NQTR_DELAY_VALUE_7 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, NQTR_DELAY_VALUE_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_0_REG < 0) || (O_DELAY_VALUE_0_REG > 625))) begin
      $display("Error: [Unisim %s-215] O_DELAY_VALUE_0 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_1_REG < 0) || (O_DELAY_VALUE_1_REG > 625))) begin
      $display("Error: [Unisim %s-216] O_DELAY_VALUE_1 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_2_REG < 0) || (O_DELAY_VALUE_2_REG > 625))) begin
      $display("Error: [Unisim %s-217] O_DELAY_VALUE_2 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_3_REG < 0) || (O_DELAY_VALUE_3_REG > 625))) begin
      $display("Error: [Unisim %s-218] O_DELAY_VALUE_3 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_4_REG < 0) || (O_DELAY_VALUE_4_REG > 625))) begin
      $display("Error: [Unisim %s-219] O_DELAY_VALUE_4 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_5_REG < 0) || (O_DELAY_VALUE_5_REG > 625))) begin
      $display("Error: [Unisim %s-220] O_DELAY_VALUE_5 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_6_REG < 0) || (O_DELAY_VALUE_6_REG > 625))) begin
      $display("Error: [Unisim %s-221] O_DELAY_VALUE_6 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((O_DELAY_VALUE_7_REG < 0) || (O_DELAY_VALUE_7_REG > 625))) begin
      $display("Error: [Unisim %s-222] O_DELAY_VALUE_7 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, O_DELAY_VALUE_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PDL_CASCADE_REG != "FALSE") &&
         (PDL_CASCADE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-223] PDL_CASCADE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, PDL_CASCADE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PDL_HISTOGRAM_MODE_REG != "DISABLE") &&
         (PDL_HISTOGRAM_MODE_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-224] PDL_HISTOGRAM_MODE attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, PDL_HISTOGRAM_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_0_REG < 0) || (PQTR_DELAY_VALUE_0_REG > 625))) begin
      $display("Error: [Unisim %s-225] PQTR_DELAY_VALUE_0 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_1_REG < 0) || (PQTR_DELAY_VALUE_1_REG > 625))) begin
      $display("Error: [Unisim %s-226] PQTR_DELAY_VALUE_1 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_2_REG < 0) || (PQTR_DELAY_VALUE_2_REG > 625))) begin
      $display("Error: [Unisim %s-227] PQTR_DELAY_VALUE_2 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_3_REG < 0) || (PQTR_DELAY_VALUE_3_REG > 625))) begin
      $display("Error: [Unisim %s-228] PQTR_DELAY_VALUE_3 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_4_REG < 0) || (PQTR_DELAY_VALUE_4_REG > 625))) begin
      $display("Error: [Unisim %s-229] PQTR_DELAY_VALUE_4 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_5_REG < 0) || (PQTR_DELAY_VALUE_5_REG > 625))) begin
      $display("Error: [Unisim %s-230] PQTR_DELAY_VALUE_5 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_6_REG < 0) || (PQTR_DELAY_VALUE_6_REG > 625))) begin
      $display("Error: [Unisim %s-231] PQTR_DELAY_VALUE_6 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PQTR_DELAY_VALUE_7_REG < 0) || (PQTR_DELAY_VALUE_7_REG > 625))) begin
      $display("Error: [Unisim %s-232] PQTR_DELAY_VALUE_7 attribute is set to %d.  Legal values for this attribute are 0 to 625. Instance: %m", MODULE_NAME, PQTR_DELAY_VALUE_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((PRIMARY_DLL_CONFIG_REG != "MODEA") &&
         (PRIMARY_DLL_CONFIG_REG != "MODEB1") &&
         (PRIMARY_DLL_CONFIG_REG != "MODEB2"))) begin
      $display("Error: [Unisim %s-233] PRIMARY_DLL_CONFIG attribute is set to %s.  Legal values for this attribute are MODEA, MODEB1 or MODEB2. Instance: %m", MODULE_NAME, PRIMARY_DLL_CONFIG_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RIUCLK_DBLR_BYPASS_REG != "FALSE") &&
         (RIUCLK_DBLR_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-237] RIUCLK_DBLR_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, RIUCLK_DBLR_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_0_REG != "TRUE") &&
         (ROUTETHRU_0_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-239] ROUTETHRU_0 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_1_REG != "TRUE") &&
         (ROUTETHRU_1_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-240] ROUTETHRU_1 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_2_REG != "TRUE") &&
         (ROUTETHRU_2_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-241] ROUTETHRU_2 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_3_REG != "TRUE") &&
         (ROUTETHRU_3_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-242] ROUTETHRU_3 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_4_REG != "TRUE") &&
         (ROUTETHRU_4_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-243] ROUTETHRU_4 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_5_REG != "TRUE") &&
         (ROUTETHRU_5_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-244] ROUTETHRU_5 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_6_REG != "TRUE") &&
         (ROUTETHRU_6_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-245] ROUTETHRU_6 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((ROUTETHRU_7_REG != "TRUE") &&
         (ROUTETHRU_7_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-246] ROUTETHRU_7 attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, ROUTETHRU_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_0_REG != "ASYNC") &&
         (RXFIFO_MODE_0_REG != "BYPASS") &&
         (RXFIFO_MODE_0_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-247] RXFIFO_MODE_0 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_1_REG != "ASYNC") &&
         (RXFIFO_MODE_1_REG != "BYPASS") &&
         (RXFIFO_MODE_1_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-248] RXFIFO_MODE_1 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_2_REG != "ASYNC") &&
         (RXFIFO_MODE_2_REG != "BYPASS") &&
         (RXFIFO_MODE_2_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-249] RXFIFO_MODE_2 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_3_REG != "ASYNC") &&
         (RXFIFO_MODE_3_REG != "BYPASS") &&
         (RXFIFO_MODE_3_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-250] RXFIFO_MODE_3 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_4_REG != "ASYNC") &&
         (RXFIFO_MODE_4_REG != "BYPASS") &&
         (RXFIFO_MODE_4_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-251] RXFIFO_MODE_4 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_5_REG != "ASYNC") &&
         (RXFIFO_MODE_5_REG != "BYPASS") &&
         (RXFIFO_MODE_5_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-252] RXFIFO_MODE_5 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_6_REG != "ASYNC") &&
         (RXFIFO_MODE_6_REG != "BYPASS") &&
         (RXFIFO_MODE_6_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-253] RXFIFO_MODE_6 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_MODE_7_REG != "ASYNC") &&
         (RXFIFO_MODE_7_REG != "BYPASS") &&
         (RXFIFO_MODE_7_REG != "SYNC"))) begin
      $display("Error: [Unisim %s-254] RXFIFO_MODE_7 attribute is set to %s.  Legal values for this attribute are ASYNC, BYPASS or SYNC. Instance: %m", MODULE_NAME, RXFIFO_MODE_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXFIFO_WRCLK_SEL_REG != "CLK0") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK1") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK2") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK3") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK4") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK5") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK6") &&
         (RXFIFO_WRCLK_SEL_REG != "CLK7"))) begin
      $display("Error: [Unisim %s-255] RXFIFO_WRCLK_SEL attribute is set to %s.  Legal values for this attribute are CLK0, CLK1, CLK2, CLK3, CLK4, CLK5, CLK6 or CLK7. Instance: %m", MODULE_NAME, RXFIFO_WRCLK_SEL_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RXOFST_EXTEND_OFSC_RANGE_REG != "TRUE") &&
         (RXOFST_EXTEND_OFSC_RANGE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-261] RXOFST_EXTEND_OFSC_RANGE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, RXOFST_EXTEND_OFSC_RANGE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_CLOCK_ALIGN_REG != "RX_CLOCK_ALIGN_NONE") &&
         (RX_CLOCK_ALIGN_REG != "CLK90_TEST") &&
         (RX_CLOCK_ALIGN_REG != "CLOCK_CNTR") &&
         (RX_CLOCK_ALIGN_REG != "CPHY_DATA_CNTR") &&
         (RX_CLOCK_ALIGN_REG != "DATA_CNTR") &&
         (RX_CLOCK_ALIGN_REG != "DQS_DELAYED") &&
         (RX_CLOCK_ALIGN_REG != "DQS_NON_DELAYED"))) begin
      $display("Error: [Unisim %s-271] RX_CLOCK_ALIGN attribute is set to %s.  Legal values for this attribute are RX_CLOCK_ALIGN_NONE, CLK90_TEST, CLOCK_CNTR, CPHY_DATA_CNTR, DATA_CNTR, DQS_DELAYED or DQS_NON_DELAYED. Instance: %m", MODULE_NAME, RX_CLOCK_ALIGN_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_DATA_WIDTH_REG != 16) &&
         (RX_DATA_WIDTH_REG != 2) &&
         (RX_DATA_WIDTH_REG != 4) &&
         (RX_DATA_WIDTH_REG != 8))) begin
      $display("Error: [Unisim %s-272] RX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 16, 2, 4 or 8. Instance: %m", MODULE_NAME, RX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((RX_PATH_RESET_REG != "DISABLE") &&
         (RX_PATH_RESET_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-275] RX_PATH_RESET attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, RX_PATH_RESET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_0_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_0_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_0_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-276] SA_OFST_CAL_0 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_1_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_1_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_1_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-277] SA_OFST_CAL_1 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_2_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_2_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_2_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-278] SA_OFST_CAL_2 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_3_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_3_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_3_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-279] SA_OFST_CAL_3 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_4_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_4_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_4_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-280] SA_OFST_CAL_4 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_5_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_5_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_5_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-281] SA_OFST_CAL_5 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_6_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_6_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_6_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-282] SA_OFST_CAL_6 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SA_OFST_CAL_7_REG != "SA_OFST_NONE") &&
         (SA_OFST_CAL_7_REG != "SA_OFST_AUTO") &&
         (SA_OFST_CAL_7_REG != "SA_OFST_MANUAL"))) begin
      $display("Error: [Unisim %s-283] SA_OFST_CAL_7 attribute is set to %s.  Legal values for this attribute are SA_OFST_NONE, SA_OFST_AUTO or SA_OFST_MANUAL. Instance: %m", MODULE_NAME, SA_OFST_CAL_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_0_REG != "FALSE") &&
         (SEQ_DIS_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-285] SEQ_DIS_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_1_REG != "FALSE") &&
         (SEQ_DIS_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-286] SEQ_DIS_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_2_REG != "FALSE") &&
         (SEQ_DIS_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-287] SEQ_DIS_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_3_REG != "FALSE") &&
         (SEQ_DIS_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-288] SEQ_DIS_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_4_REG != "FALSE") &&
         (SEQ_DIS_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-289] SEQ_DIS_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_5_REG != "FALSE") &&
         (SEQ_DIS_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-290] SEQ_DIS_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_6_REG != "FALSE") &&
         (SEQ_DIS_6_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-291] SEQ_DIS_6 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_DIS_7_REG != "FALSE") &&
         (SEQ_DIS_7_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-292] SEQ_DIS_7 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, SEQ_DIS_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SEQ_HISTROGRAM_MODE_REG != "DISABLE") &&
         (SEQ_HISTROGRAM_MODE_REG != "ENABLE"))) begin
      $display("Error: [Unisim %s-295] SEQ_HISTROGRAM_MODE attribute is set to %s.  Legal values for this attribute are DISABLE or ENABLE. Instance: %m", MODULE_NAME, SEQ_HISTROGRAM_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_VERSION_REG < 1) || (SIM_VERSION_REG > 3))) begin
      $display("Error: [Unisim %s-298] SIM_VERSION attribute is set to %d.  Legal values for this attribute are 1 to 3. Instance: %m", MODULE_NAME, SIM_VERSION_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SLEW_MODE_REG != "MODE0") &&
         (SLEW_MODE_REG != "MODE1") &&
         (SLEW_MODE_REG != "MODE2") &&
         (SLEW_MODE_REG != "MODE3"))) begin
      $display("Error: [Unisim %s-299] SLEW_MODE attribute is set to %s.  Legal values for this attribute are MODE0, MODE1, MODE2 or MODE3. Instance: %m", MODULE_NAME, SLEW_MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_0_REG != "T") &&
         (TBYTE_CTL_0_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-301] TBYTE_CTL_0 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_1_REG != "T") &&
         (TBYTE_CTL_1_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-302] TBYTE_CTL_1 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_2_REG != "T") &&
         (TBYTE_CTL_2_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-303] TBYTE_CTL_2 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_3_REG != "T") &&
         (TBYTE_CTL_3_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-304] TBYTE_CTL_3 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_4_REG != "T") &&
         (TBYTE_CTL_4_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-305] TBYTE_CTL_4 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_5_REG != "T") &&
         (TBYTE_CTL_5_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-306] TBYTE_CTL_5 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_6_REG != "T") &&
         (TBYTE_CTL_6_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-307] TBYTE_CTL_6 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TBYTE_CTL_7_REG != "T") &&
         (TBYTE_CTL_7_REG != "PHY_WREN"))) begin
      $display("Error: [Unisim %s-308] TBYTE_CTL_7 attribute is set to %s.  Legal values for this attribute are T or PHY_WREN. Instance: %m", MODULE_NAME, TBYTE_CTL_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_DATA_WIDTH_REG != 16) &&
         (TX_DATA_WIDTH_REG != 2) &&
         (TX_DATA_WIDTH_REG != 4) &&
         (TX_DATA_WIDTH_REG != 8))) begin
      $display("Error: [Unisim %s-310] TX_DATA_WIDTH attribute is set to %d.  Legal values for this attribute are 16, 2, 4 or 8. Instance: %m", MODULE_NAME, TX_DATA_WIDTH_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_FIFO_PD_OFFSET_REG < 1) || (TX_FIFO_PD_OFFSET_REG > 4))) begin
      $display("Error: [Unisim %s-311] TX_FIFO_PD_OFFSET attribute is set to %d.  Legal values for this attribute are 1 to 4. Instance: %m", MODULE_NAME, TX_FIFO_PD_OFFSET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_FIFO_SYNC_BYPASS_REG != "FALSE") &&
         (TX_FIFO_SYNC_BYPASS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-312] TX_FIFO_SYNC_BYPASS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_FIFO_SYNC_BYPASS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_0_REG != "FALSE") &&
         (TX_INIT_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-313] TX_INIT_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_1_REG != "FALSE") &&
         (TX_INIT_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-314] TX_INIT_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_2_REG != "FALSE") &&
         (TX_INIT_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-315] TX_INIT_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_3_REG != "FALSE") &&
         (TX_INIT_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-316] TX_INIT_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_4_REG != "FALSE") &&
         (TX_INIT_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-317] TX_INIT_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_5_REG != "FALSE") &&
         (TX_INIT_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-318] TX_INIT_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_6_REG != "FALSE") &&
         (TX_INIT_6_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-319] TX_INIT_6 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_7_REG != "FALSE") &&
         (TX_INIT_7_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-320] TX_INIT_7 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, TX_INIT_7_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((TX_INIT_T_REG != "TRUE") &&
         (TX_INIT_T_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-321] TX_INIT_T attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, TX_INIT_T_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((VTC_NOT_SPD_REG != "FALSE") &&
         (VTC_NOT_SPD_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-322] VTC_NOT_SPD attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, VTC_NOT_SPD_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_0_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_0_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-323] WREN_CS_OVERRIDE_0 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_0_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_1_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_1_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-324] WREN_CS_OVERRIDE_1 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_1_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_2_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_2_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-325] WREN_CS_OVERRIDE_2 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_2_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_3_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_3_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-326] WREN_CS_OVERRIDE_3 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_3_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_4_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_4_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-327] WREN_CS_OVERRIDE_4 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_4_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_5_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_5_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-328] WREN_CS_OVERRIDE_5 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_5_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_6_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_6_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-329] WREN_CS_OVERRIDE_6 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_6_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((WREN_CS_OVERRIDE_7_REG != "FALSE") &&
         (WREN_CS_OVERRIDE_7_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-330] WREN_CS_OVERRIDE_7 attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, WREN_CS_OVERRIDE_7_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign DMC2APB_PCLK_in = 1'b1; // tie off
assign DMC_CLK_in = 1'b1; // tie off
assign DMC_FIFO_RDCLK_in = 1'b1; // tie off
assign RXFIFO_RDCLK_in = 2'b11; // tie off

assign CLB2PHY_KEEPER_EN_in = 8'b11111111; // tie off
assign CLB2PHY_LP_RX_DIS_OR_TERM_EN_in = 4'b1111; // tie off
assign CLB2PHY_LP_TX_O_0_in = 4'b1111; // tie off
assign CLB2PHY_LP_TX_O_1_in = 4'b1111; // tie off
assign CLB2PHY_LP_TX_T_in = 4'b1111; // tie off
assign D0_in = 16'b1111111111111111; // tie off
assign D1_in = 16'b1111111111111111; // tie off
assign D2_in = 16'b1111111111111111; // tie off
assign D3_in = 16'b1111111111111111; // tie off
assign D4_in = 16'b1111111111111111; // tie off
assign D5_in = 16'b1111111111111111; // tie off
assign D6_in = 16'b1111111111111111; // tie off
assign D7_in = 16'b1111111111111111; // tie off
assign DMC2APB_PADDR_in = 10'b1111111111; // tie off
assign DMC2APB_PENABLE_in = 1'b1; // tie off
assign DMC2APB_PRESETN_in = 1'b1; // tie off
assign DMC2APB_PSEL_in = 1'b1; // tie off
assign DMC2APB_PWDATA_in = 16'b1111111111111111; // tie off
assign DMC2APB_PWRITE_in = 1'b1; // tie off
assign DMC_D0_in = 8'b11111111; // tie off
assign DMC_D1_in = 8'b11111111; // tie off
assign DMC_D2_in = 8'b11111111; // tie off
assign DMC_D3_in = 8'b11111111; // tie off
assign DMC_D4_in = 8'b11111111; // tie off
assign DMC_D5_in = 8'b11111111; // tie off
assign DMC_D6_in = 8'b11111111; // tie off
assign DMC_D7_in = 8'b11111111; // tie off
assign DMC_FIFO_RDEN_in = 1'b1; // tie off
assign DMC_IBUF_HS_RX_DIS_in = 8'b11111111; // tie off
assign DMC_PHY_RDCS0_in = 4'b1111; // tie off
assign DMC_PHY_RDCS1_in = 4'b1111; // tie off
assign DMC_PHY_RDEN_in = 4'b1111; // tie off
assign DMC_PHY_WRCS0_in = 4'b1111; // tie off
assign DMC_PHY_WRCS1_in = 4'b1111; // tie off
assign DMC_PHY_WREN_in = 4'b1111; // tie off
assign DMC_RST_in = 1'b1; // tie off
assign IBUFDISABLEIN_in = 8'b11111111; // tie off
assign RST_in = 1'b1; // tie off
assign RXFIFO_RDEN_in = 2'b11; // tie off
assign SCAN_EN_in = 1'b0; // tie off
assign SCAN_MODE_RST_N_in = 1'b1; // tie off
assign SCAN_MODE_in = 1'b0; // tie off
assign SCAN_RST_BYP_in = 1'b0; // tie off

  SIP_CMPHY_OCTAD SIP_CMPHY_OCTAD_INST (
    .ACC_FAST_LOCK (ACC_FAST_LOCK_REG),
    .ACC_WIAT_0 (ACC_WIAT_0_REG),
    //.APBCLK_FREQ (APBCLK_FREQ_REG),
    .CAL_DQS_SRC (CAL_DQS_SRC_REG),
    .CAL_REFCLK_EN (CAL_REFCLK_EN_REG),
    .CAL_VT_OFST_C (CAL_VT_OFST_C_REG),
    .CAL_VT_OFST_EN (CAL_VT_OFST_EN_REG),
    .CAL_VT_OFST_M0 (CAL_VT_OFST_M0_REG),
    .CAL_VT_OFST_M1 (CAL_VT_OFST_M1_REG),
    .CAL_VT_SRC (CAL_VT_SRC_REG),
    .CLB_CLK_DBL_DCC (CLB_CLK_DBL_DCC_REG),
    .CLK_SRC (CLK_SRC_REG),
    .CLOCK_FREQ (CLOCK_FREQ_REG),
    .CN_EXT_DISABLE (CN_EXT_DISABLE_REG),
    .CN_LEGACY (CN_LEGACY_REG),
    .CONTINUOUS_DQS (CONTINUOUS_DQS_REG),
    .CPHY_RX_EN_0 (CPHY_RX_EN_0_REG),
    .CPHY_RX_EN_1 (CPHY_RX_EN_1_REG),
    .CPHY_TX_EN_0 (CPHY_TX_EN_0_REG),
    .CPHY_TX_EN_1 (CPHY_TX_EN_1_REG),
    .CTLE_OFST_CAL_0 (CTLE_OFST_CAL_0_REG),
    .CTLE_OFST_CAL_1 (CTLE_OFST_CAL_1_REG),
    .CTLE_OFST_CAL_2 (CTLE_OFST_CAL_2_REG),
    .CTLE_OFST_CAL_3 (CTLE_OFST_CAL_3_REG),
    .CTLE_OFST_CAL_4 (CTLE_OFST_CAL_4_REG),
    .CTLE_OFST_CAL_5 (CTLE_OFST_CAL_5_REG),
    .CTLE_OFST_CAL_6 (CTLE_OFST_CAL_6_REG),
    .CTLE_OFST_CAL_7 (CTLE_OFST_CAL_7_REG),
    .DCC_CAL_RANGE (DCC_CAL_RANGE_REG),
    .DCC_CAL_TIME_SEL (DCC_CAL_TIME_SEL_REG),
    .DCC_CONV_RANGE (DCC_CONV_RANGE_REG),
    .DCC_CONV_TIME_SEL (DCC_CONV_TIME_SEL_REG),
    .DCC_RO_DLY0 (DCC_RO_DLY0_REG),
    .DCC_RO_DLY1 (DCC_RO_DLY1_REG),
    .DCC_RO_DLY2 (DCC_RO_DLY2_REG),
    .DIS_IDLY_VT_TRACK (DIS_IDLY_VT_TRACK_REG),
    .DIS_ODLY_VT_TRACK (DIS_ODLY_VT_TRACK_REG),
    .DIS_QDLY_VT_TRACK (DIS_QDLY_VT_TRACK_REG),
    .DMC_APB_SEL (DMC_APB_SEL_REG),
    .DMC_BIT_SEL_0 (DMC_BIT_SEL_0_REG),
    .DMC_BIT_SEL_1 (DMC_BIT_SEL_1_REG),
    .DMC_BIT_SEL_2 (DMC_BIT_SEL_2_REG),
    .DMC_BIT_SEL_3 (DMC_BIT_SEL_3_REG),
    .DMC_BIT_SEL_4 (DMC_BIT_SEL_4_REG),
    .DMC_BIT_SEL_5 (DMC_BIT_SEL_5_REG),
    .DMC_BIT_SEL_6 (DMC_BIT_SEL_6_REG),
    .DMC_BIT_SEL_7 (DMC_BIT_SEL_7_REG),
    .DMC_CTL_SEL (DMC_CTL_SEL_REG),
    .DPHY_RX_EN_0 (DPHY_RX_EN_0_REG),
    .DPHY_RX_EN_1 (DPHY_RX_EN_1_REG),
    .DPHY_RX_EN_2 (DPHY_RX_EN_2_REG),
    .DPHY_RX_EN_3 (DPHY_RX_EN_3_REG),
    .DPHY_TX_EN_0 (DPHY_TX_EN_0_REG),
    .DPHY_TX_EN_1 (DPHY_TX_EN_1_REG),
    .DPHY_TX_EN_2 (DPHY_TX_EN_2_REG),
    .DPHY_TX_EN_3 (DPHY_TX_EN_3_REG),
    .DQS_MODE (DQS_MODE_REG),
    .EN_CK90_CAL (EN_CK90_CAL_REG),
    .EN_DCC_CAL (EN_DCC_CAL_REG),
    .EN_DYN_DLY_MODE (EN_DYN_DLY_MODE_REG),
    .EN_FIX_DELAY_CAL (EN_FIX_DELAY_CAL_REG),
    .EN_PRIMARY_DLL_CAL (EN_PRIMARY_DLL_CAL_REG),
    .EN_SEQ_CAL (EN_SEQ_CAL_REG),
    .FAST_CK (FAST_CK_REG),
    .FD_NORD (FD_NORD_REG),
    .FIFO_CLK_SRC (FIFO_CLK_SRC_REG),
    .GT_VT_SRC (GT_VT_SRC_REG),
    .GT_VT_SRC_OCTAD (GT_VT_SRC_OCTAD_REG),
    .HISTO_DELTA_ADJ (HISTO_DELTA_ADJ_REG),
    .HISTO_F0_TH (HISTO_F0_TH_REG),
    .HISTO_F1_TH (HISTO_F1_TH_REG),
    .HISTO_NO_RU (HISTO_NO_RU_REG),
    .HISTO_NPI_NS (HISTO_NPI_NS_REG),
    .HISTO_R0_TH (HISTO_R0_TH_REG),
    .HISTO_R1_TH (HISTO_R1_TH_REG),
    .IBUF_DIS_EXT_SRC_0 (IBUF_DIS_EXT_SRC_0_REG),
    .IBUF_DIS_EXT_SRC_1 (IBUF_DIS_EXT_SRC_1_REG),
    .IBUF_DIS_EXT_SRC_2 (IBUF_DIS_EXT_SRC_2_REG),
    .IBUF_DIS_EXT_SRC_3 (IBUF_DIS_EXT_SRC_3_REG),
    .IBUF_DIS_EXT_SRC_4 (IBUF_DIS_EXT_SRC_4_REG),
    .IBUF_DIS_EXT_SRC_5 (IBUF_DIS_EXT_SRC_5_REG),
    .IBUF_DIS_EXT_SRC_6 (IBUF_DIS_EXT_SRC_6_REG),
    .IBUF_DIS_EXT_SRC_7 (IBUF_DIS_EXT_SRC_7_REG),
    .IBUF_DIS_SRC_0 (IBUF_DIS_SRC_0_REG),
    .IBUF_DIS_SRC_1 (IBUF_DIS_SRC_1_REG),
    .IBUF_DIS_SRC_2 (IBUF_DIS_SRC_2_REG),
    .IBUF_DIS_SRC_3 (IBUF_DIS_SRC_3_REG),
    .IBUF_DIS_SRC_4 (IBUF_DIS_SRC_4_REG),
    .IBUF_DIS_SRC_5 (IBUF_DIS_SRC_5_REG),
    .IBUF_DIS_SRC_6 (IBUF_DIS_SRC_6_REG),
    .IBUF_DIS_SRC_7 (IBUF_DIS_SRC_7_REG),
    .LEG_F_HISTO_E (LEG_F_HISTO_E_REG),
    .LEG_F_LGY_E (LEG_F_LGY_E_REG),
    .LOWER_FREQ_SWITCH (LOWER_FREQ_SWITCH_REG),
    .LP4_DQS (LP4_DQS_REG),
    .MIPI_ALPRX_EN_M (MIPI_ALPRX_EN_M_REG),
    .MIPI_ALPRX_EN_S (MIPI_ALPRX_EN_S_REG),
    .MUX2RDP_CLK_SEL (MUX2RDP_CLK_SEL_REG),
    .NQTR_DELAY_VALUE_0 (NQTR_DELAY_VALUE_0_REG),
    .NQTR_DELAY_VALUE_1 (NQTR_DELAY_VALUE_1_REG),
    .NQTR_DELAY_VALUE_2 (NQTR_DELAY_VALUE_2_REG),
    .NQTR_DELAY_VALUE_3 (NQTR_DELAY_VALUE_3_REG),
    .NQTR_DELAY_VALUE_4 (NQTR_DELAY_VALUE_4_REG),
    .NQTR_DELAY_VALUE_5 (NQTR_DELAY_VALUE_5_REG),
    .NQTR_DELAY_VALUE_6 (NQTR_DELAY_VALUE_6_REG),
    .NQTR_DELAY_VALUE_7 (NQTR_DELAY_VALUE_7_REG),
    .ODT_SRC_0 (ODT_SRC_0_REG),
    .ODT_SRC_1 (ODT_SRC_1_REG),
    .ODT_SRC_2 (ODT_SRC_2_REG),
    .ODT_SRC_3 (ODT_SRC_3_REG),
    .ODT_SRC_4 (ODT_SRC_4_REG),
    .ODT_SRC_5 (ODT_SRC_5_REG),
    .ODT_SRC_6 (ODT_SRC_6_REG),
    .ODT_SRC_7 (ODT_SRC_7_REG),
    .O_DELAY_VALUE_0 (O_DELAY_VALUE_0_REG),
    .O_DELAY_VALUE_1 (O_DELAY_VALUE_1_REG),
    .O_DELAY_VALUE_2 (O_DELAY_VALUE_2_REG),
    .O_DELAY_VALUE_3 (O_DELAY_VALUE_3_REG),
    .O_DELAY_VALUE_4 (O_DELAY_VALUE_4_REG),
    .O_DELAY_VALUE_5 (O_DELAY_VALUE_5_REG),
    .O_DELAY_VALUE_6 (O_DELAY_VALUE_6_REG),
    .O_DELAY_VALUE_7 (O_DELAY_VALUE_7_REG),
    .PDL_CASCADE (PDL_CASCADE_REG),
    .PDL_HISTOGRAM_MODE (PDL_HISTOGRAM_MODE_REG),
    .PQTR_DELAY_VALUE_0 (PQTR_DELAY_VALUE_0_REG),
    .PQTR_DELAY_VALUE_1 (PQTR_DELAY_VALUE_1_REG),
    .PQTR_DELAY_VALUE_2 (PQTR_DELAY_VALUE_2_REG),
    .PQTR_DELAY_VALUE_3 (PQTR_DELAY_VALUE_3_REG),
    .PQTR_DELAY_VALUE_4 (PQTR_DELAY_VALUE_4_REG),
    .PQTR_DELAY_VALUE_5 (PQTR_DELAY_VALUE_5_REG),
    .PQTR_DELAY_VALUE_6 (PQTR_DELAY_VALUE_6_REG),
    .PQTR_DELAY_VALUE_7 (PQTR_DELAY_VALUE_7_REG),
    .PRIMARY_DLL_CONFIG (PRIMARY_DLL_CONFIG_REG),
    .PRIME_VAL (PRIME_VAL_REG),
    .RD_CTL_MUXSEL (RD_CTL_MUXSEL_REG),
    .RF_ROUNDING_FACTOR (RF_ROUNDING_FACTOR_REG),
    .RIUCLK_DBLR_BYPASS (RIUCLK_DBLR_BYPASS_REG),
    .RIU_CLK_DBL_DCC (RIU_CLK_DBL_DCC_REG),
    .ROUTETHRU_0 (ROUTETHRU_0_REG),
    .ROUTETHRU_1 (ROUTETHRU_1_REG),
    .ROUTETHRU_2 (ROUTETHRU_2_REG),
    .ROUTETHRU_3 (ROUTETHRU_3_REG),
    .ROUTETHRU_4 (ROUTETHRU_4_REG),
    .ROUTETHRU_5 (ROUTETHRU_5_REG),
    .ROUTETHRU_6 (ROUTETHRU_6_REG),
    .ROUTETHRU_7 (ROUTETHRU_7_REG),
    .RXFIFO_MODE_0 (RXFIFO_MODE_0_REG),
    .RXFIFO_MODE_1 (RXFIFO_MODE_1_REG),
    .RXFIFO_MODE_2 (RXFIFO_MODE_2_REG),
    .RXFIFO_MODE_3 (RXFIFO_MODE_3_REG),
    .RXFIFO_MODE_4 (RXFIFO_MODE_4_REG),
    .RXFIFO_MODE_5 (RXFIFO_MODE_5_REG),
    .RXFIFO_MODE_6 (RXFIFO_MODE_6_REG),
    .RXFIFO_MODE_7 (RXFIFO_MODE_7_REG),
    .RXFIFO_WRCLK_SEL (RXFIFO_WRCLK_SEL_REG),
    .RXOFST_CAL_START (RXOFST_CAL_START_REG),
    .RXOFST_END_CODE (RXOFST_END_CODE_REG),
    .RXOFST_EN_BIN_SRCH (RXOFST_EN_BIN_SRCH_REG),
    .RXOFST_EN_HIST_SRCH (RXOFST_EN_HIST_SRCH_REG),
    .RXOFST_EN_LIN_SRCH (RXOFST_EN_LIN_SRCH_REG),
    .RXOFST_EXTEND_OFSC_RANGE (RXOFST_EXTEND_OFSC_RANGE_REG),
    .RXOFST_EXTRANGE_STEPSIZE (RXOFST_EXTRANGE_STEPSIZE_REG),
    .RXOFST_LIN_SRCH_RANGE (RXOFST_LIN_SRCH_RANGE_REG),
    .RXOFST_LIN_SRCH_STEPSIZE (RXOFST_LIN_SRCH_STEPSIZE_REG),
    .RXOFST_NUM_SAMPLES (RXOFST_NUM_SAMPLES_REG),
    .RXOFST_SETTELE_INTERVAL (RXOFST_SETTELE_INTERVAL_REG),
    .RXOFST_START_CODE (RXOFST_START_CODE_REG),
    .RXOFST_THRESHOLD (RXOFST_THRESHOLD_REG),
    .RX_CLK_PHASE_N (RX_CLK_PHASE_N_REG),
    .RX_CLK_PHASE_P (RX_CLK_PHASE_P_REG),
    .RX_CLOCK_ALIGN (RX_CLOCK_ALIGN_REG),
    .RX_DATA_WIDTH (RX_DATA_WIDTH_REG),
    .RX_DDR_EN_DQS (RX_DDR_EN_DQS_REG),
    .RX_GATE (RX_GATE_REG),
    .RX_PATH_RESET (RX_PATH_RESET_REG),
    .SA_OFST_CAL_0 (SA_OFST_CAL_0_REG),
    .SA_OFST_CAL_1 (SA_OFST_CAL_1_REG),
    .SA_OFST_CAL_2 (SA_OFST_CAL_2_REG),
    .SA_OFST_CAL_3 (SA_OFST_CAL_3_REG),
    .SA_OFST_CAL_4 (SA_OFST_CAL_4_REG),
    .SA_OFST_CAL_5 (SA_OFST_CAL_5_REG),
    .SA_OFST_CAL_6 (SA_OFST_CAL_6_REG),
    .SA_OFST_CAL_7 (SA_OFST_CAL_7_REG),
    .SELF_CALIBRATE (SELF_CALIBRATE_REG),
    .SEQ_DIS_0 (SEQ_DIS_0_REG),
    .SEQ_DIS_1 (SEQ_DIS_1_REG),
    .SEQ_DIS_2 (SEQ_DIS_2_REG),
    .SEQ_DIS_3 (SEQ_DIS_3_REG),
    .SEQ_DIS_4 (SEQ_DIS_4_REG),
    .SEQ_DIS_5 (SEQ_DIS_5_REG),
    .SEQ_DIS_6 (SEQ_DIS_6_REG),
    .SEQ_DIS_7 (SEQ_DIS_7_REG),
    .SEQ_DONE_MASK (SEQ_DONE_MASK_REG),
    .SEQ_DQS_CENTER (SEQ_DQS_CENTER_REG),
    .SEQ_HISTROGRAM_MODE (SEQ_HISTROGRAM_MODE_REG),
    .SHIFT_DQS_N (SHIFT_DQS_N_REG),
    .SHIFT_DQS_P (SHIFT_DQS_P_REG),
    .SIM_VERSION (SIM_VERSION_REG),
    .SLEW_MODE (SLEW_MODE_REG),
    .SPARE (SPARE_REG),
    .TBYTE_CTL_0 (TBYTE_CTL_0_REG),
    .TBYTE_CTL_1 (TBYTE_CTL_1_REG),
    .TBYTE_CTL_2 (TBYTE_CTL_2_REG),
    .TBYTE_CTL_3 (TBYTE_CTL_3_REG),
    .TBYTE_CTL_4 (TBYTE_CTL_4_REG),
    .TBYTE_CTL_5 (TBYTE_CTL_5_REG),
    .TBYTE_CTL_6 (TBYTE_CTL_6_REG),
    .TBYTE_CTL_7 (TBYTE_CTL_7_REG),
    .TEST_MCT (TEST_MCT_REG),
    .TX_DATA_WIDTH (TX_DATA_WIDTH_REG),
    .TX_FIFO_PD_OFFSET (TX_FIFO_PD_OFFSET_REG),
    .TX_FIFO_SYNC_BYPASS (TX_FIFO_SYNC_BYPASS_REG),
    .TX_INIT_0 (TX_INIT_0_REG),
    .TX_INIT_1 (TX_INIT_1_REG),
    .TX_INIT_2 (TX_INIT_2_REG),
    .TX_INIT_3 (TX_INIT_3_REG),
    .TX_INIT_4 (TX_INIT_4_REG),
    .TX_INIT_5 (TX_INIT_5_REG),
    .TX_INIT_6 (TX_INIT_6_REG),
    .TX_INIT_7 (TX_INIT_7_REG),
    .TX_INIT_T (TX_INIT_T_REG),
    .VTC_NOT_SPD (VTC_NOT_SPD_REG),
    .WREN_CS_OVERRIDE_0 (WREN_CS_OVERRIDE_0_REG),
    .WREN_CS_OVERRIDE_1 (WREN_CS_OVERRIDE_1_REG),
    .WREN_CS_OVERRIDE_2 (WREN_CS_OVERRIDE_2_REG),
    .WREN_CS_OVERRIDE_3 (WREN_CS_OVERRIDE_3_REG),
    .WREN_CS_OVERRIDE_4 (WREN_CS_OVERRIDE_4_REG),
    .WREN_CS_OVERRIDE_5 (WREN_CS_OVERRIDE_5_REG),
    .WREN_CS_OVERRIDE_6 (WREN_CS_OVERRIDE_6_REG),
    .WREN_CS_OVERRIDE_7 (WREN_CS_OVERRIDE_7_REG),
    .WR_CTL_MUXSEL (WR_CTL_MUXSEL_REG),
    .WR_DQ0_MUXSEL (WR_DQ0_MUXSEL_REG),
    .WR_DQ1_MUXSEL (WR_DQ1_MUXSEL_REG),
    .WR_EN0_MUXSEL (WR_EN0_MUXSEL_REG),
    .WR_EN1_MUXSEL (WR_EN1_MUXSEL_REG),
    //.APB2DMC_PREADY (APB2DMC_PREADY_out),
    //.APB2DMC_PSLVERR (APB2DMC_PSLVERR_out),
    .DLY_RDY (DLY_RDY_out),
    //.DMC2APB_PRDATA (DMC2APB_PRDATA_out),
    //.DMC_FIFO_EMPTY (DMC_FIFO_EMPTY_out),
    .DMC_PD (DMC_PD_out),
    //.DMC_Q0 (DMC_Q0_out),
    //.DMC_Q1 (DMC_Q1_out),
    //.DMC_Q2 (DMC_Q2_out),
    //.DMC_Q3 (DMC_Q3_out),
    //.DMC_Q4 (DMC_Q4_out),
    //.DMC_Q5 (DMC_Q5_out),
    //.DMC_Q6 (DMC_Q6_out),
    //.DMC_Q7 (DMC_Q7_out),
    //.FIFO_EMPTY (FIFO_EMPTY_out),
    .MUX2APB_PCLK (MUX2APB_PCLK_out),
    .MUX2RDP_CLK (MUX2RDP_CLK_out),
    .MUX2WRP_CLK (MUX2WRP_CLK_out),
    //.PHY2CLB_LP_I_0 (PHY2CLB_LP_I_0_out),
    //.PHY2CLB_LP_I_1 (PHY2CLB_LP_I_1_out),
    //.PHY2CLB_STATUS (PHY2CLB_STATUS_out),
    .PHY2XCV_2TO1_CLK (PHY2XCV_2TO1_CLK_out),
    .PHY2XCV_DYNAMIC_DCI_TS (PHY2XCV_DYNAMIC_DCI_TS_out),
    .PHY2XCV_IBUF_DIS_OR_HS_RX_DIS (PHY2XCV_IBUF_DIS_OR_HS_RX_DIS_out),
    .PHY2XCV_RD_CTL0 (PHY2XCV_RD_CTL0_out),
    .PHY2XCV_RD_CTL1 (PHY2XCV_RD_CTL1_out),
    .PHY2XCV_RD_CTL2 (PHY2XCV_RD_CTL2_out),
    .PHY2XCV_RD_CTL3 (PHY2XCV_RD_CTL3_out),
    .PHY2XCV_WR_CTL0 (PHY2XCV_WR_CTL0_out),
    .PHY2XCV_WR_CTL1 (PHY2XCV_WR_CTL1_out),
    .PHY2XCV_WR_CTL2 (PHY2XCV_WR_CTL2_out),
    .PHY2XCV_WR_CTL3 (PHY2XCV_WR_CTL3_out),
    .PHY2XCV_WR_DQ0 (PHY2XCV_WR_DQ0_out),
    .PHY2XCV_WR_DQ1 (PHY2XCV_WR_DQ1_out),
    .PHY2XCV_WR_DQ2 (PHY2XCV_WR_DQ2_out),
    .PHY2XCV_WR_DQ3 (PHY2XCV_WR_DQ3_out),
    .PHY_FIFO_EMPTY (PHY_FIFO_EMPTY_out),
    .PHY_LP_I_0 (PHY_LP_I_0_out),
    .PHY_LP_I_1 (PHY_LP_I_1_out),
    .PHY_PD (PHY_PD_out),
    .PHY_Q0 (PHY_Q0_out),
    .PHY_Q1 (PHY_Q1_out),
    .PHY_Q2 (PHY_Q2_out),
    .PHY_Q3 (PHY_Q3_out),
    .PHY_Q4 (PHY_Q4_out),
    .PHY_Q5 (PHY_Q5_out),
    .PHY_Q6 (PHY_Q6_out),
    .PHY_Q7 (PHY_Q7_out),
    .PHY_RDY (PHY_RDY_out),
    .PHY_STATUS (PHY_STATUS_out),
    .PRDATA (PRDATA_out),
    .PREADY (PREADY_out),
    .PSLVERR (PSLVERR_out),
    //.Q0 (Q0_out),
    //.Q1 (Q1_out),
    //.Q2 (Q2_out),
    //.Q3 (Q3_out),
    //.Q4 (Q4_out),
    //.Q5 (Q5_out),
    //.Q6 (Q6_out),
    //.Q7 (Q7_out),
    .RIU2XCV_CA0 (RIU2XCV_CA0_out),
    .RIU2XCV_CA1 (RIU2XCV_CA1_out),
    .RIU2XCV_CA2 (RIU2XCV_CA2_out),
    .RIU2XCV_CA3 (RIU2XCV_CA3_out),
    .RIU2XCV_CK0 (RIU2XCV_CK0_out),
    .RIU2XCV_CK1 (RIU2XCV_CK1_out),
    .RIU2XCV_CK2 (RIU2XCV_CK2_out),
    .RIU2XCV_CK3 (RIU2XCV_CK3_out),
    .RIU2XCV_RST0 (RIU2XCV_RST0_out),
    .RIU2XCV_RST1 (RIU2XCV_RST1_out),
    .RIU2XCV_RST2 (RIU2XCV_RST2_out),
    .RIU2XCV_RST3 (RIU2XCV_RST3_out),
    .RIU2XCV_WR0 (RIU2XCV_WR0_out),
    .RIU2XCV_WR1 (RIU2XCV_WR1_out),
    .RIU2XCV_WR2 (RIU2XCV_WR2_out),
    .RIU2XCV_WR3 (RIU2XCV_WR3_out),
    .RXFIFO_WR_CLK (RXFIFO_WR_CLK_out),
    .SEQ_DONE (SEQ_DONE_out),
    .VT_DLY_OUT (VT_DLY_OUT_out),
    .VT_DRFT_OUT (VT_DRFT_OUT_out),
    //.CLB2PHY_KEEPER_EN (CLB2PHY_KEEPER_EN_in),
    //.CLB2PHY_LP_RX_DIS_OR_TERM_EN (CLB2PHY_LP_RX_DIS_OR_TERM_EN_in),
    //.CLB2PHY_LP_TX_O_0 (CLB2PHY_LP_TX_O_0_in),
    //.CLB2PHY_LP_TX_O_1 (CLB2PHY_LP_TX_O_1_in),
    //.CLB2PHY_LP_TX_T (CLB2PHY_LP_TX_T_in),
    //.D0 (D0_in),
    //.D1 (D1_in),
    //.D2 (D2_in),
    //.D3 (D3_in),
    //.D4 (D4_in),
    //.D5 (D5_in),
    //.D6 (D6_in),
    //.D7 (D7_in),
    //.DMC2APB_PADDR (DMC2APB_PADDR_in),
    //.DMC2APB_PCLK (DMC2APB_PCLK_in),
    //.DMC2APB_PENABLE (DMC2APB_PENABLE_in),
    //.DMC2APB_PRESETN (DMC2APB_PRESETN_in),
    //.DMC2APB_PSEL (DMC2APB_PSEL_in),
    //.DMC2APB_PWDATA (DMC2APB_PWDATA_in),
    //.DMC2APB_PWRITE (DMC2APB_PWRITE_in),
    //.DMC_CLK (DMC_CLK_in),
    //.DMC_D0 (DMC_D0_in),
    //.DMC_D1 (DMC_D1_in),
    //.DMC_D2 (DMC_D2_in),
    //.DMC_D3 (DMC_D3_in),
    //.DMC_D4 (DMC_D4_in),
    //.DMC_D5 (DMC_D5_in),
    //.DMC_D6 (DMC_D6_in),
    //.DMC_D7 (DMC_D7_in),
    //.DMC_FIFO_RDCLK (DMC_FIFO_RDCLK_in),
    //.DMC_FIFO_RDEN (DMC_FIFO_RDEN_in),
    //.DMC_IBUF_HS_RX_DIS (DMC_IBUF_HS_RX_DIS_in),
    //.DMC_PHY_RDCS0 (DMC_PHY_RDCS0_in),
    //.DMC_PHY_RDCS1 (DMC_PHY_RDCS1_in),
    //.DMC_PHY_RDEN (DMC_PHY_RDEN_in),
    //.DMC_PHY_WRCS0 (DMC_PHY_WRCS0_in),
    //.DMC_PHY_WRCS1 (DMC_PHY_WRCS1_in),
    //.DMC_PHY_WREN (DMC_PHY_WREN_in),
    //.DMC_RST (DMC_RST_in),
    .DYN_DCI_IN (DYN_DCI_IN_in),
    .IBUFDISABLE (IBUFDISABLE_in),
    //.IBUFDISABLEIN (IBUFDISABLEIN_in),
    .PADDR (PADDR_in),
    .PCLK (PCLK_in),
    .PENABLE (PENABLE_in),
    .PHY_2TO1_CLK (PHY_2TO1_CLK_in),
    .PHY_CLK (PHY_CLK_in),
    .PHY_D0 (PHY_D0_in),
    .PHY_D1 (PHY_D1_in),
    .PHY_D2 (PHY_D2_in),
    .PHY_D3 (PHY_D3_in),
    .PHY_D4 (PHY_D4_in),
    .PHY_D5 (PHY_D5_in),
    .PHY_D6 (PHY_D6_in),
    .PHY_D7 (PHY_D7_in),
    .PHY_FIFO_RDEN (PHY_FIFO_RDEN_in),
    .PHY_KEEPER_EN (PHY_KEEPER_EN_in),
    .PHY_LP_RX_DIS_OR_TERM_EN (PHY_LP_RX_DIS_OR_TERM_EN_in),
    .PHY_LP_TX_O_0 (PHY_LP_TX_O_0_in),
    .PHY_LP_TX_O_1 (PHY_LP_TX_O_1_in),
    .PHY_LP_TX_T (PHY_LP_TX_T_in),
    .PHY_RDCS0 (PHY_RDCS0_in),
    .PHY_RDCS1 (PHY_RDCS1_in),
    .PHY_RDEN (PHY_RDEN_in),
    .PHY_RST (PHY_RST_in),
    .PHY_RXFIFO_RDCLK (PHY_RXFIFO_RDCLK_in),
    .PHY_WRCS0 (PHY_WRCS0_in),
    .PHY_WRCS1 (PHY_WRCS1_in),
    .PHY_WREN (PHY_WREN_in),
    .PRESETN (PRESETN_in),
    .PSEL (PSEL_in),
    .PWDATA (PWDATA_in),
    .PWRITE (PWRITE_in),
    //.RST (RST_in),
    //.RXFIFO_RDCLK (RXFIFO_RDCLK_in),
    //.RXFIFO_RDEN (RXFIFO_RDEN_in),
    .RX_RST (RX_RST_in),
    .SCAN_EN (SCAN_EN_in),
    .SCAN_MODE (SCAN_MODE_in),
    .SCAN_MODE_RST_N (SCAN_MODE_RST_N_in),
    .SCAN_RST_BYP (SCAN_RST_BYP_in),
    .SEQ_DONE_I (SEQ_DONE_I_in),
    .T (T_in),
    .TX_RST (TX_RST_in),
    .VT_DLY_IN0 (VT_DLY_IN0_in),
    .VT_DLY_IN1 (VT_DLY_IN1_in),
    .VT_DLY_IN2 (VT_DLY_IN2_in),
    .VT_DLY_IN3 (VT_DLY_IN3_in),
    .VT_DRFT_IN0 (VT_DRFT_IN0_in),
    .VT_DRFT_IN1 (VT_DRFT_IN1_in),
    .VT_DRFT_IN2 (VT_DRFT_IN2_in),
    .VT_DRFT_IN3 (VT_DRFT_IN3_in),
    .XCV2PHY_LP_I_0 (XCV2PHY_LP_I_0_in),
    .XCV2PHY_LP_I_1 (XCV2PHY_LP_I_1_in),
    .XCV2PHY_RD_CLK0 (XCV2PHY_RD_CLK0_in),
    .XCV2PHY_RD_CLK1 (XCV2PHY_RD_CLK1_in),
    .XCV2PHY_RD_CLK2 (XCV2PHY_RD_CLK2_in),
    .XCV2PHY_RD_CLK3 (XCV2PHY_RD_CLK3_in),
    .XCV2PHY_RD_DQ0 (XCV2PHY_RD_DQ0_in),
    .XCV2PHY_RD_DQ1 (XCV2PHY_RD_DQ1_in),
    .XCV2PHY_RD_DQ2 (XCV2PHY_RD_DQ2_in),
    .XCV2PHY_RD_DQ3 (XCV2PHY_RD_DQ3_in),
    .XCV2PHY_WR_CLK0 (XCV2PHY_WR_CLK0_in),
    .XCV2PHY_WR_CLK1 (XCV2PHY_WR_CLK1_in),
    .XCV2PHY_WR_CLK2 (XCV2PHY_WR_CLK2_in),
    .XCV2PHY_WR_CLK3 (XCV2PHY_WR_CLK3_in),
    .XCV2RIU_CK0 (XCV2RIU_CK0_in),
    .XCV2RIU_CK1 (XCV2RIU_CK1_in),
    .XCV2RIU_CK2 (XCV2RIU_CK2_in),
    .XCV2RIU_CK3 (XCV2RIU_CK3_in),
    .XCV2RIU_RD0 (XCV2RIU_RD0_in),
    .XCV2RIU_RD1 (XCV2RIU_RD1_in),
    .XCV2RIU_RD2 (XCV2RIU_RD2_in),
    .XCV2RIU_RD3 (XCV2RIU_RD3_in),
    .GSR (glblGSR)
  );

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_XECLIB
  // begin timing section
  specify
    (DYN_DCI_IN[0] => PHY2XCV_DYNAMIC_DCI_TS[0]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[1] => PHY2XCV_DYNAMIC_DCI_TS[1]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[2] => PHY2XCV_DYNAMIC_DCI_TS[2]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[3] => PHY2XCV_DYNAMIC_DCI_TS[3]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[4] => PHY2XCV_DYNAMIC_DCI_TS[4]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[5] => PHY2XCV_DYNAMIC_DCI_TS[5]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[6] => PHY2XCV_DYNAMIC_DCI_TS[6]) = (0:0:0, 0:0:0);
    (DYN_DCI_IN[7] => PHY2XCV_DYNAMIC_DCI_TS[7]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[0] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[0]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[1] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[1]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[2] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[2]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[3] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[3]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[4] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[4]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[5] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[5]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[6] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[6]) = (0:0:0, 0:0:0);
    (IBUFDISABLE[7] => PHY2XCV_IBUF_DIS_OR_HS_RX_DIS[7]) = (0:0:0, 0:0:0);
    (PCLK => DLY_RDY) = (100:100:100, 100:100:100);
    (PCLK => PHY_RDY) = (100:100:100, 100:100:100);
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
    (PHY_2TO1_CLK => PHY2XCV_2TO1_CLK) = (0:0:0, 0:0:0);
    (PHY_D0[0] => PHY2XCV_WR_DQ0[0]) = (0:0:0, 0:0:0);
    (PHY_D0[1] => PHY2XCV_WR_DQ0[1]) = (0:0:0, 0:0:0);
    (PHY_D1[0] => PHY2XCV_WR_DQ0[16]) = (0:0:0, 0:0:0);
    (PHY_D1[1] => PHY2XCV_WR_DQ0[17]) = (0:0:0, 0:0:0);
    (PHY_D2[0] => PHY2XCV_WR_DQ1[0]) = (0:0:0, 0:0:0);
    (PHY_D2[1] => PHY2XCV_WR_DQ1[1]) = (0:0:0, 0:0:0);
    (PHY_D3[0] => PHY2XCV_WR_DQ1[16]) = (0:0:0, 0:0:0);
    (PHY_D3[1] => PHY2XCV_WR_DQ1[17]) = (0:0:0, 0:0:0);
    (PHY_D4[0] => PHY2XCV_WR_DQ2[0]) = (0:0:0, 0:0:0);
    (PHY_D4[1] => PHY2XCV_WR_DQ2[1]) = (0:0:0, 0:0:0);
    (PHY_D5[0] => PHY2XCV_WR_DQ2[16]) = (0:0:0, 0:0:0);
    (PHY_D5[1] => PHY2XCV_WR_DQ2[17]) = (0:0:0, 0:0:0);
    (PHY_D6[0] => PHY2XCV_WR_DQ3[0]) = (0:0:0, 0:0:0);
    (PHY_D6[1] => PHY2XCV_WR_DQ3[1]) = (0:0:0, 0:0:0);
    (PHY_D7[0] => PHY2XCV_WR_DQ3[16]) = (0:0:0, 0:0:0);
    (PHY_D7[1] => PHY2XCV_WR_DQ3[17]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_FIFO_EMPTY[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_FIFO_EMPTY[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q0[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q1[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q2[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q3[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q4[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q5[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q6[9]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[0]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[10]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[11]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[12]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[13]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[14]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[15]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[1]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[2]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[3]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[4]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[5]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[6]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[7]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[8]) = (0:0:0, 0:0:0);
    (PHY_RXFIFO_RDCLK[0] => PHY_Q7[9]) = (0:0:0, 0:0:0);
    (T[0] => PHY2XCV_WR_DQ0[8]) = (0:0:0, 0:0:0);
    (T[1] => PHY2XCV_WR_DQ0[24]) = (0:0:0, 0:0:0);
    (T[2] => PHY2XCV_WR_DQ1[8]) = (0:0:0, 0:0:0);
    (T[3] => PHY2XCV_WR_DQ1[24]) = (0:0:0, 0:0:0);
    (T[4] => PHY2XCV_WR_DQ2[8]) = (0:0:0, 0:0:0);
    (T[5] => PHY2XCV_WR_DQ2[24]) = (0:0:0, 0:0:0);
    (T[6] => PHY2XCV_WR_DQ3[8]) = (0:0:0, 0:0:0);
    (T[7] => PHY2XCV_WR_DQ3[24]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[0] => PHY_LP_I_0[0]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[0] => PHY_Q0[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[1] => PHY_LP_I_0[1]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[1] => PHY_Q1[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[2] => PHY_LP_I_0[2]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[2] => PHY_Q2[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[3] => PHY_LP_I_0[3]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_0[3] => PHY_Q3[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[0] => PHY_Q4[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[1] => PHY_LP_I_1[1]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[1] => PHY_Q5[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[2] => PHY_LP_I_1[2]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[2] => PHY_Q6[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[3] => PHY_LP_I_1[3]) = (0:0:0, 0:0:0);
    (XCV2PHY_LP_I_1[3] => PHY_Q7[7]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK0[0] => RXFIFO_WR_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK0[1] => RXFIFO_WR_CLK[1]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK1[0] => RXFIFO_WR_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK1[1] => RXFIFO_WR_CLK[1]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK2[0] => RXFIFO_WR_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK2[1] => RXFIFO_WR_CLK[1]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK3[0] => RXFIFO_WR_CLK[0]) = (0:0:0, 0:0:0);
    (XCV2PHY_RD_CLK3[1] => RXFIFO_WR_CLK[1]) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge PCLK, 0:0:0, notifier);
    $period (negedge PHY_CLK, 0:0:0, notifier);
    $period (negedge PHY_RXFIFO_RDCLK[0], 0:0:0, notifier);
    $period (posedge PCLK, 0:0:0, notifier);
    $period (posedge PHY_CLK, 0:0:0, notifier);
    $period (posedge PHY_RXFIFO_RDCLK[0], 0:0:0, notifier);
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
    $setuphold (posedge PHY_CLK, negedge PHY_D0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D0[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D1[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D2[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D3[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D4[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D5[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D6[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[10]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[11]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[12]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[13]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[14]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[15]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[8]);
    $setuphold (posedge PHY_CLK, negedge PHY_D7[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[9]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDCS1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_RDEN[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_WRCS1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[7]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[0]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[1]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[2]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[3]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[4]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[5]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[6]);
    $setuphold (posedge PHY_CLK, negedge PHY_WREN[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D0[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D0_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D1[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D1_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D2[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D2_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D3[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D3_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D4[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D4_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D5[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D5_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D6[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D6_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[10], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[10]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[11], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[11]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[12], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[12]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[13], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[13]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[14], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[14]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[15], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[15]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[8], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[8]);
    $setuphold (posedge PHY_CLK, posedge PHY_D7[9], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_D7_delay[9]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS0_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDCS1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDCS1_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_RDEN[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_RDEN_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS0[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS0_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_WRCS1[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WRCS1_delay[7]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[0], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[0]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[1], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[1]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[2], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[2]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[3], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[3]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[4], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[4]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[5], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[5]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[6], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[6]);
    $setuphold (posedge PHY_CLK, posedge PHY_WREN[7], 0:0:0, 0:0:0, notifier, , , PHY_CLK_delay, PHY_WREN_delay[7]);
    $setuphold (posedge PHY_RXFIFO_RDCLK[0], negedge PHY_FIFO_RDEN[0], 0:0:0, 0:0:0, notifier, , , PHY_RXFIFO_RDCLK_delay[0], PHY_FIFO_RDEN_delay[0]);
    $setuphold (posedge PHY_RXFIFO_RDCLK[0], negedge PHY_FIFO_RDEN[1], 0:0:0, 0:0:0, notifier, , , PHY_RXFIFO_RDCLK_delay[0], PHY_FIFO_RDEN_delay[1]);
    $setuphold (posedge PHY_RXFIFO_RDCLK[0], posedge PHY_FIFO_RDEN[0], 0:0:0, 0:0:0, notifier, , , PHY_RXFIFO_RDCLK_delay[0], PHY_FIFO_RDEN_delay[0]);
    $setuphold (posedge PHY_RXFIFO_RDCLK[0], posedge PHY_FIFO_RDEN[1], 0:0:0, 0:0:0, notifier, , , PHY_RXFIFO_RDCLK_delay[0], PHY_FIFO_RDEN_delay[1]);
    $width (negedge PCLK, 0:0:0, 0, notifier);
    $width (negedge PHY_CLK, 0:0:0, 0, notifier);
    $width (negedge PHY_RXFIFO_RDCLK[0], 0:0:0, 0, notifier);
    $width (posedge PCLK, 0:0:0, 0, notifier);
    $width (posedge PHY_CLK, 0:0:0, 0, notifier);
    $width (posedge PHY_RXFIFO_RDCLK[0], 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
   // end timing section 
`endif
endmodule

`endcelldefine
