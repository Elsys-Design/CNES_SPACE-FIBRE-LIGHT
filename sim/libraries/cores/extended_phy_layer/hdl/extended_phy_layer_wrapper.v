//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Fri Jan 24 18:32:28 2025
//Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target extended_phy_layer_wrapper.bd
//Design      : extended_phy_layer_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module extended_phy_layer_wrapper
   (INTF0_RX0_ch_rxbufstatus_0,
    INTF0_RX0_ch_rxbyteisaligned_0,
    INTF0_RX0_ch_rxbyterealign_0,
    INTF0_RX0_ch_rxcdrhold_0,
    INTF0_RX0_ch_rxcdrovrden_0,
    INTF0_RX0_ch_rxcomsasdet_0,
    INTF0_RX0_ch_rxctrl0_0,
    INTF0_RX0_ch_rxctrl1_0,
    INTF0_RX0_ch_rxctrl2_0,
    INTF0_RX0_ch_rxctrl3_0,
    INTF0_RX0_ch_rxdata_0,
    INTF0_RX0_ch_rxdatavalid_0,
    INTF0_RX0_ch_rxpd_0,
    INTF0_RX0_ch_rxpolarity_0,
    INTF0_RX0_ch_rxrate_0,
    INTF0_RX_clr_out_0,
    INTF0_RX_clrb_leaf_out_0,
    INTF0_TX0_ch_txbufstatus_0,
    INTF0_TX0_ch_txctrl0_0,
    INTF0_TX0_ch_txctrl1_0,
    INTF0_TX0_ch_txctrl2_0,
    INTF0_TX0_ch_txdata,
    INTF0_TX0_ch_txpd_0,
    INTF0_TX0_ch_txrate_0,
    INTF0_TX_clr_out_0,
    INTF0_TX_clrb_leaf_out_0,
    INTF0_rst_all_in_0,
    INTF0_rst_rx_datapath_in_0,
    INTF0_rst_rx_done_out_0,
    INTF0_rst_rx_pll_and_datapath_in_0,
    INTF0_rst_tx_datapath_in_0,
    INTF0_rst_tx_done_out_0,
    INTF0_rst_tx_pll_and_datapath_in_0,
    QUAD0_GTREFCLK0_0,
    QUAD0_GT_DEBUG_0_gpi,
    QUAD0_GT_DEBUG_0_gpo,
    QUAD0_RX0_outclk_0,
    QUAD0_RX0_usrclk_0,
    QUAD0_TX0_outclk_0,
    QUAD0_TX0_usrclk_0,
    QUAD0_hsclk0_lcplllock_0,
    Quad0_CH0_DEBUG_0_ch_loopback,
    Quad0_GT_Serial_0_grx_n,
    Quad0_GT_Serial_0_grx_p,
    Quad0_GT_Serial_0_gtx_n,
    Quad0_GT_Serial_0_gtx_p,
    gtpowergood_0,
    gtwiz_freerun_clk_0);
  output [2:0]INTF0_RX0_ch_rxbufstatus_0;
  output [0:0]INTF0_RX0_ch_rxbyteisaligned_0;
  output [0:0]INTF0_RX0_ch_rxbyterealign_0;
  input [0:0]INTF0_RX0_ch_rxcdrhold_0;
  input [0:0]INTF0_RX0_ch_rxcdrovrden_0;
  output [0:0]INTF0_RX0_ch_rxcomsasdet_0;
  output [15:0]INTF0_RX0_ch_rxctrl0_0;
  output [15:0]INTF0_RX0_ch_rxctrl1_0;
  output [7:0]INTF0_RX0_ch_rxctrl2_0;
  output [7:0]INTF0_RX0_ch_rxctrl3_0;
  output [127:0]INTF0_RX0_ch_rxdata_0;
  output [1:0]INTF0_RX0_ch_rxdatavalid_0;
  input [1:0]INTF0_RX0_ch_rxpd_0;
  input [0:0]INTF0_RX0_ch_rxpolarity_0;
  input [7:0]INTF0_RX0_ch_rxrate_0;
  output INTF0_RX_clr_out_0;
  output INTF0_RX_clrb_leaf_out_0;
  output [1:0]INTF0_TX0_ch_txbufstatus_0;
  input [15:0]INTF0_TX0_ch_txctrl0_0;
  input [15:0]INTF0_TX0_ch_txctrl1_0;
  input [7:0]INTF0_TX0_ch_txctrl2_0;
  input [127:0]INTF0_TX0_ch_txdata;
  input [1:0]INTF0_TX0_ch_txpd_0;
  input [7:0]INTF0_TX0_ch_txrate_0;
  output INTF0_TX_clr_out_0;
  output INTF0_TX_clrb_leaf_out_0;
  input INTF0_rst_all_in_0;
  input INTF0_rst_rx_datapath_in_0;
  output INTF0_rst_rx_done_out_0;
  input INTF0_rst_rx_pll_and_datapath_in_0;
  input INTF0_rst_tx_datapath_in_0;
  output INTF0_rst_tx_done_out_0;
  input INTF0_rst_tx_pll_and_datapath_in_0;
  input QUAD0_GTREFCLK0_0;
  input [31:0]QUAD0_GT_DEBUG_0_gpi;
  output [31:0]QUAD0_GT_DEBUG_0_gpo;
  output QUAD0_RX0_outclk_0;
  input QUAD0_RX0_usrclk_0;
  output QUAD0_TX0_outclk_0;
  input QUAD0_TX0_usrclk_0;
  output QUAD0_hsclk0_lcplllock_0;
  input [2:0]Quad0_CH0_DEBUG_0_ch_loopback;
  input [3:0]Quad0_GT_Serial_0_grx_n;
  input [3:0]Quad0_GT_Serial_0_grx_p;
  output [3:0]Quad0_GT_Serial_0_gtx_n;
  output [3:0]Quad0_GT_Serial_0_gtx_p;
  output gtpowergood_0;
  input gtwiz_freerun_clk_0;

  wire [2:0]INTF0_RX0_ch_rxbufstatus_0;
  wire [0:0]INTF0_RX0_ch_rxbyteisaligned_0;
  wire [0:0]INTF0_RX0_ch_rxbyterealign_0;
  wire [0:0]INTF0_RX0_ch_rxcdrhold_0;
  wire [0:0]INTF0_RX0_ch_rxcdrovrden_0;
  wire [0:0]INTF0_RX0_ch_rxcomsasdet_0;
  wire [15:0]INTF0_RX0_ch_rxctrl0_0;
  wire [15:0]INTF0_RX0_ch_rxctrl1_0;
  wire [7:0]INTF0_RX0_ch_rxctrl2_0;
  wire [7:0]INTF0_RX0_ch_rxctrl3_0;
  wire [127:0]INTF0_RX0_ch_rxdata_0;
  wire [1:0]INTF0_RX0_ch_rxdatavalid_0;
  wire [1:0]INTF0_RX0_ch_rxpd_0;
  wire [0:0]INTF0_RX0_ch_rxpolarity_0;
  wire [7:0]INTF0_RX0_ch_rxrate_0;
  wire INTF0_RX_clr_out_0;
  wire INTF0_RX_clrb_leaf_out_0;
  wire [1:0]INTF0_TX0_ch_txbufstatus_0;
  wire [15:0]INTF0_TX0_ch_txctrl0_0;
  wire [15:0]INTF0_TX0_ch_txctrl1_0;
  wire [7:0]INTF0_TX0_ch_txctrl2_0;
  wire [127:0]INTF0_TX0_ch_txdata;
  wire [1:0]INTF0_TX0_ch_txpd_0;
  wire [7:0]INTF0_TX0_ch_txrate_0;
  wire INTF0_TX_clr_out_0;
  wire INTF0_TX_clrb_leaf_out_0;
  wire INTF0_rst_all_in_0;
  wire INTF0_rst_rx_datapath_in_0;
  wire INTF0_rst_rx_done_out_0;
  wire INTF0_rst_rx_pll_and_datapath_in_0;
  wire INTF0_rst_tx_datapath_in_0;
  wire INTF0_rst_tx_done_out_0;
  wire INTF0_rst_tx_pll_and_datapath_in_0;
  wire QUAD0_GTREFCLK0_0;
  wire [31:0]QUAD0_GT_DEBUG_0_gpi;
  wire [31:0]QUAD0_GT_DEBUG_0_gpo;
  wire QUAD0_RX0_outclk_0;
  wire QUAD0_RX0_usrclk_0;
  wire QUAD0_TX0_outclk_0;
  wire QUAD0_TX0_usrclk_0;
  wire QUAD0_hsclk0_lcplllock_0;
  wire [2:0]Quad0_CH0_DEBUG_0_ch_loopback;
  wire [3:0]Quad0_GT_Serial_0_grx_n;
  wire [3:0]Quad0_GT_Serial_0_grx_p;
  wire [3:0]Quad0_GT_Serial_0_gtx_n;
  wire [3:0]Quad0_GT_Serial_0_gtx_p;
  wire gtpowergood_0;
  wire gtwiz_freerun_clk_0;

  extended_phy_layer extended_phy_layer_i
       (.INTF0_RX0_ch_rxbufstatus_0(INTF0_RX0_ch_rxbufstatus_0),
        .INTF0_RX0_ch_rxbyteisaligned_0(INTF0_RX0_ch_rxbyteisaligned_0),
        .INTF0_RX0_ch_rxbyterealign_0(INTF0_RX0_ch_rxbyterealign_0),
        .INTF0_RX0_ch_rxcdrhold_0(INTF0_RX0_ch_rxcdrhold_0),
        .INTF0_RX0_ch_rxcdrovrden_0(INTF0_RX0_ch_rxcdrovrden_0),
        .INTF0_RX0_ch_rxcomsasdet_0(INTF0_RX0_ch_rxcomsasdet_0),
        .INTF0_RX0_ch_rxctrl0_0(INTF0_RX0_ch_rxctrl0_0),
        .INTF0_RX0_ch_rxctrl1_0(INTF0_RX0_ch_rxctrl1_0),
        .INTF0_RX0_ch_rxctrl2_0(INTF0_RX0_ch_rxctrl2_0),
        .INTF0_RX0_ch_rxctrl3_0(INTF0_RX0_ch_rxctrl3_0),
        .INTF0_RX0_ch_rxdata_0(INTF0_RX0_ch_rxdata_0),
        .INTF0_RX0_ch_rxdatavalid_0(INTF0_RX0_ch_rxdatavalid_0),
        .INTF0_RX0_ch_rxpd_0(INTF0_RX0_ch_rxpd_0),
        .INTF0_RX0_ch_rxpolarity_0(INTF0_RX0_ch_rxpolarity_0),
        .INTF0_RX0_ch_rxrate_0(INTF0_RX0_ch_rxrate_0),
        .INTF0_RX_clr_out_0(INTF0_RX_clr_out_0),
        .INTF0_RX_clrb_leaf_out_0(INTF0_RX_clrb_leaf_out_0),
        .INTF0_TX0_ch_txbufstatus_0(INTF0_TX0_ch_txbufstatus_0),
        .INTF0_TX0_ch_txctrl0_0(INTF0_TX0_ch_txctrl0_0),
        .INTF0_TX0_ch_txctrl1_0(INTF0_TX0_ch_txctrl1_0),
        .INTF0_TX0_ch_txctrl2_0(INTF0_TX0_ch_txctrl2_0),
        .INTF0_TX0_ch_txdata(INTF0_TX0_ch_txdata),
        .INTF0_TX0_ch_txpd_0(INTF0_TX0_ch_txpd_0),
        .INTF0_TX0_ch_txrate_0(INTF0_TX0_ch_txrate_0),
        .INTF0_TX_clr_out_0(INTF0_TX_clr_out_0),
        .INTF0_TX_clrb_leaf_out_0(INTF0_TX_clrb_leaf_out_0),
        .INTF0_rst_all_in_0(INTF0_rst_all_in_0),
        .INTF0_rst_rx_datapath_in_0(INTF0_rst_rx_datapath_in_0),
        .INTF0_rst_rx_done_out_0(INTF0_rst_rx_done_out_0),
        .INTF0_rst_rx_pll_and_datapath_in_0(INTF0_rst_rx_pll_and_datapath_in_0),
        .INTF0_rst_tx_datapath_in_0(INTF0_rst_tx_datapath_in_0),
        .INTF0_rst_tx_done_out_0(INTF0_rst_tx_done_out_0),
        .INTF0_rst_tx_pll_and_datapath_in_0(INTF0_rst_tx_pll_and_datapath_in_0),
        .QUAD0_GTREFCLK0_0(QUAD0_GTREFCLK0_0),
        .QUAD0_GT_DEBUG_0_gpi(QUAD0_GT_DEBUG_0_gpi),
        .QUAD0_GT_DEBUG_0_gpo(QUAD0_GT_DEBUG_0_gpo),
        .QUAD0_RX0_outclk_0(QUAD0_RX0_outclk_0),
        .QUAD0_RX0_usrclk_0(QUAD0_RX0_usrclk_0),
        .QUAD0_TX0_outclk_0(QUAD0_TX0_outclk_0),
        .QUAD0_TX0_usrclk_0(QUAD0_TX0_usrclk_0),
        .QUAD0_hsclk0_lcplllock_0(QUAD0_hsclk0_lcplllock_0),
        .Quad0_CH0_DEBUG_0_ch_loopback(Quad0_CH0_DEBUG_0_ch_loopback),
        .Quad0_GT_Serial_0_grx_n(Quad0_GT_Serial_0_grx_n),
        .Quad0_GT_Serial_0_grx_p(Quad0_GT_Serial_0_grx_p),
        .Quad0_GT_Serial_0_gtx_n(Quad0_GT_Serial_0_gtx_n),
        .Quad0_GT_Serial_0_gtx_p(Quad0_GT_Serial_0_gtx_p),
        .gtpowergood_0(gtpowergood_0),
        .gtwiz_freerun_clk_0(gtwiz_freerun_clk_0));
endmodule
