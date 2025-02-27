--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Thu Dec 12 13:30:35 2024
--Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
--Command     : generate_target extended_phy_layer_wrapper.bd
--Design      : extended_phy_layer_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity extended_phy_layer_wrapper is
  port (
    INTF0_RX0_ch_rxbufstatus_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_RX0_ch_rxbyteisaligned_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbyterealign_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrhold_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrovrden_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcomsasdet_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxctrl0_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl1_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl2_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxctrl3_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxdata_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_RX0_ch_rxdatavalid_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxpd_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxpolarity_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxrate_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX_clr_out_0 : out STD_LOGIC;
    INTF0_RX_clrb_leaf_out_0 : out STD_LOGIC;
    INTF0_TX0_ch_txbufstatus_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txctrl0_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_TX0_ch_txctrl1_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_TX0_ch_txctrl2_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX0_ch_txdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_TX0_ch_txpd_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txrate_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX_clr_out_0 : out STD_LOGIC;
    INTF0_TX_clrb_leaf_out_0 : out STD_LOGIC;
    INTF0_rst_all_in_0 : in STD_LOGIC;
    INTF0_rst_rx_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_rx_done_out_0 : out STD_LOGIC;
    INTF0_rst_rx_pll_and_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_tx_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_tx_done_out_0 : out STD_LOGIC;
    INTF0_rst_tx_pll_and_datapath_in_0 : in STD_LOGIC;
    QUAD0_GTREFCLK0_0 : in STD_LOGIC;
    QUAD0_GT_DEBUG_0_gpi : in STD_LOGIC_VECTOR ( 31 downto 0 );
    QUAD0_GT_DEBUG_0_gpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    QUAD0_RX0_outclk_0 : out STD_LOGIC;
    QUAD0_RX0_usrclk_0 : in STD_LOGIC;
    QUAD0_TX0_outclk_0 : out STD_LOGIC;
    QUAD0_TX0_usrclk_0 : in STD_LOGIC;
    QUAD0_hsclk0_lcplllock_0 : out STD_LOGIC;
    Quad0_CH0_DEBUG_0_ch_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Quad0_GT_Serial_0_grx_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_grx_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_gtx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_gtx_p : out STD_LOGIC_VECTOR ( 3 downto 0 );
    gtpowergood_0 : out STD_LOGIC;
    gtwiz_freerun_clk_0 : in STD_LOGIC
  );
end extended_phy_layer_wrapper;

architecture STRUCTURE of extended_phy_layer_wrapper is
  component extended_phy_layer is
  port (
    INTF0_RX_clr_out_0 : out STD_LOGIC;
    INTF0_RX_clrb_leaf_out_0 : out STD_LOGIC;
    INTF0_TX_clr_out_0 : out STD_LOGIC;
    INTF0_TX_clrb_leaf_out_0 : out STD_LOGIC;
    INTF0_rst_all_in_0 : in STD_LOGIC;
    INTF0_rst_rx_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_rx_done_out_0 : out STD_LOGIC;
    INTF0_rst_rx_pll_and_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_tx_datapath_in_0 : in STD_LOGIC;
    INTF0_rst_tx_done_out_0 : out STD_LOGIC;
    INTF0_rst_tx_pll_and_datapath_in_0 : in STD_LOGIC;
    QUAD0_GTREFCLK0_0 : in STD_LOGIC;
    QUAD0_RX0_outclk_0 : out STD_LOGIC;
    QUAD0_RX0_usrclk_0 : in STD_LOGIC;
    QUAD0_TX0_outclk_0 : out STD_LOGIC;
    QUAD0_TX0_usrclk_0 : in STD_LOGIC;
    QUAD0_hsclk0_lcplllock_0 : out STD_LOGIC;
    gtpowergood_0 : out STD_LOGIC;
    gtwiz_freerun_clk_0 : in STD_LOGIC;
    INTF0_TX0_ch_txdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_TX0_ch_txbufstatus_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txpd_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txrate_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX0_ch_txctrl2_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX0_ch_txctrl1_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_TX0_ch_txctrl0_0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxcdrhold_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbufstatus_0 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_RX0_ch_rxcdrovrden_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxpd_0 : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxdata_0 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_RX0_ch_rxpolarity_0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxrate_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxdatavalid_0 : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxcomsasdet_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbyteisaligned_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbyterealign_0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxctrl0_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl1_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl2_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxctrl3_0 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    QUAD0_GT_DEBUG_0_gpi : in STD_LOGIC_VECTOR ( 31 downto 0 );
    QUAD0_GT_DEBUG_0_gpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    Quad0_CH0_DEBUG_0_ch_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    Quad0_GT_Serial_0_grx_n : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_grx_p : in STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_gtx_n : out STD_LOGIC_VECTOR ( 3 downto 0 );
    Quad0_GT_Serial_0_gtx_p : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component extended_phy_layer;
begin
extended_phy_layer_i: component extended_phy_layer
     port map (
      INTF0_RX0_ch_rxbufstatus_0(2 downto 0) => INTF0_RX0_ch_rxbufstatus_0(2 downto 0),
      INTF0_RX0_ch_rxbyteisaligned_0(0) => INTF0_RX0_ch_rxbyteisaligned_0(0),
      INTF0_RX0_ch_rxbyterealign_0(0) => INTF0_RX0_ch_rxbyterealign_0(0),
      INTF0_RX0_ch_rxcdrhold_0(0) => INTF0_RX0_ch_rxcdrhold_0(0),
      INTF0_RX0_ch_rxcdrovrden_0(0) => INTF0_RX0_ch_rxcdrovrden_0(0),
      INTF0_RX0_ch_rxcomsasdet_0(0) => INTF0_RX0_ch_rxcomsasdet_0(0),
      INTF0_RX0_ch_rxctrl0_0(15 downto 0) => INTF0_RX0_ch_rxctrl0_0(15 downto 0),
      INTF0_RX0_ch_rxctrl1_0(15 downto 0) => INTF0_RX0_ch_rxctrl1_0(15 downto 0),
      INTF0_RX0_ch_rxctrl2_0(7 downto 0) => INTF0_RX0_ch_rxctrl2_0(7 downto 0),
      INTF0_RX0_ch_rxctrl3_0(7 downto 0) => INTF0_RX0_ch_rxctrl3_0(7 downto 0),
      INTF0_RX0_ch_rxdata_0(127 downto 0) => INTF0_RX0_ch_rxdata_0(127 downto 0),
      INTF0_RX0_ch_rxdatavalid_0(1 downto 0) => INTF0_RX0_ch_rxdatavalid_0(1 downto 0),
      INTF0_RX0_ch_rxpd_0(1 downto 0) => INTF0_RX0_ch_rxpd_0(1 downto 0),
      INTF0_RX0_ch_rxpolarity_0(0) => INTF0_RX0_ch_rxpolarity_0(0),
      INTF0_RX0_ch_rxrate_0(7 downto 0) => INTF0_RX0_ch_rxrate_0(7 downto 0),
      INTF0_RX_clr_out_0 => INTF0_RX_clr_out_0,
      INTF0_RX_clrb_leaf_out_0 => INTF0_RX_clrb_leaf_out_0,
      INTF0_TX0_ch_txbufstatus_0(1 downto 0) => INTF0_TX0_ch_txbufstatus_0(1 downto 0),
      INTF0_TX0_ch_txctrl0_0(15 downto 0) => INTF0_TX0_ch_txctrl0_0(15 downto 0),
      INTF0_TX0_ch_txctrl1_0(15 downto 0) => INTF0_TX0_ch_txctrl1_0(15 downto 0),
      INTF0_TX0_ch_txctrl2_0(7 downto 0) => INTF0_TX0_ch_txctrl2_0(7 downto 0),
      INTF0_TX0_ch_txdata(127 downto 0) => INTF0_TX0_ch_txdata(127 downto 0),
      INTF0_TX0_ch_txpd_0(1 downto 0) => INTF0_TX0_ch_txpd_0(1 downto 0),
      INTF0_TX0_ch_txrate_0(7 downto 0) => INTF0_TX0_ch_txrate_0(7 downto 0),
      INTF0_TX_clr_out_0 => INTF0_TX_clr_out_0,
      INTF0_TX_clrb_leaf_out_0 => INTF0_TX_clrb_leaf_out_0,
      INTF0_rst_all_in_0 => INTF0_rst_all_in_0,
      INTF0_rst_rx_datapath_in_0 => INTF0_rst_rx_datapath_in_0,
      INTF0_rst_rx_done_out_0 => INTF0_rst_rx_done_out_0,
      INTF0_rst_rx_pll_and_datapath_in_0 => INTF0_rst_rx_pll_and_datapath_in_0,
      INTF0_rst_tx_datapath_in_0 => INTF0_rst_tx_datapath_in_0,
      INTF0_rst_tx_done_out_0 => INTF0_rst_tx_done_out_0,
      INTF0_rst_tx_pll_and_datapath_in_0 => INTF0_rst_tx_pll_and_datapath_in_0,
      QUAD0_GTREFCLK0_0 => QUAD0_GTREFCLK0_0,
      QUAD0_GT_DEBUG_0_gpi(31 downto 0) => QUAD0_GT_DEBUG_0_gpi(31 downto 0),
      QUAD0_GT_DEBUG_0_gpo(31 downto 0) => QUAD0_GT_DEBUG_0_gpo(31 downto 0),
      QUAD0_RX0_outclk_0 => QUAD0_RX0_outclk_0,
      QUAD0_RX0_usrclk_0 => QUAD0_RX0_usrclk_0,
      QUAD0_TX0_outclk_0 => QUAD0_TX0_outclk_0,
      QUAD0_TX0_usrclk_0 => QUAD0_TX0_usrclk_0,
      QUAD0_hsclk0_lcplllock_0 => QUAD0_hsclk0_lcplllock_0,
      Quad0_CH0_DEBUG_0_ch_loopback(2 downto 0) => Quad0_CH0_DEBUG_0_ch_loopback(2 downto 0),
      Quad0_GT_Serial_0_grx_n(3 downto 0) => Quad0_GT_Serial_0_grx_n(3 downto 0),
      Quad0_GT_Serial_0_grx_p(3 downto 0) => Quad0_GT_Serial_0_grx_p(3 downto 0),
      Quad0_GT_Serial_0_gtx_n(3 downto 0) => Quad0_GT_Serial_0_gtx_n(3 downto 0),
      Quad0_GT_Serial_0_gtx_p(3 downto 0) => Quad0_GT_Serial_0_gtx_p(3 downto 0),
      gtpowergood_0 => gtpowergood_0,
      gtwiz_freerun_clk_0 => gtwiz_freerun_clk_0
    );
end STRUCTURE;
