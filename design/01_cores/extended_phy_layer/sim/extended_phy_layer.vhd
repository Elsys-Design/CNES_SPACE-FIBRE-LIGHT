--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Thu Dec 12 13:30:35 2024
--Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
--Command     : generate_target extended_phy_layer.bd
--Design      : extended_phy_layer
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity extended_phy_layer is
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
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of extended_phy_layer : entity is "extended_phy_layer,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=extended_phy_layer,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of extended_phy_layer : entity is "extended_phy_layer.hwdef";
end extended_phy_layer;

architecture STRUCTURE of extended_phy_layer is
  component extended_phy_layer_gtwiz_versal_0_0 is
  port (
    gtpowergood : out STD_LOGIC;
    gtwiz_freerun_clk : in STD_LOGIC;
    QUAD0_GTREFCLK0 : in STD_LOGIC;
    QUAD0_TX0_outclk : out STD_LOGIC;
    QUAD0_RX0_outclk : out STD_LOGIC;
    QUAD0_rxp : in STD_LOGIC_VECTOR ( 3 downto 0 );
    QUAD0_rxn : in STD_LOGIC_VECTOR ( 3 downto 0 );
    QUAD0_txp : out STD_LOGIC_VECTOR ( 3 downto 0 );
    QUAD0_txn : out STD_LOGIC_VECTOR ( 3 downto 0 );
    QUAD0_gpi : in STD_LOGIC_VECTOR ( 31 downto 0 );
    QUAD0_gpo : out STD_LOGIC_VECTOR ( 31 downto 0 );
    QUAD0_TX0_usrclk : in STD_LOGIC;
    QUAD0_RX0_usrclk : in STD_LOGIC;
    INTF0_TX0_ch_txdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_TX0_ch_txbufstatus : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txdccdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_gttxreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdebugpcsout : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txprogdivresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txinhibit : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txlatclk : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txmaincursor : in STD_LOGIC_VECTOR ( 6 downto 0 );
    INTF0_TX0_ch_txpcsresetmask : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txpisopd : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpmaresetmask : in STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_TX0_ch_txpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpostcursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_TX0_ch_txprbsforceerr : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    INTF0_TX0_ch_txprecursor : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_TX0_ch_txprogdivreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txrate : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX0_ch_txresetmode : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txheader : in STD_LOGIC_VECTOR ( 5 downto 0 );
    INTF0_TX0_ch_txsequence : in STD_LOGIC_VECTOR ( 6 downto 0 );
    INTF0_TX0_ch_txphalignresetmask : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txcominit : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txcomsas : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txcomwake : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdapicodeovrden : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdapicodereset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdetectrx : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphdlytstclk : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdlyalignreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txelecidle : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txmldchaindone : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txmldchainreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txoneszeros : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpausedelayalign : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphalignreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphdlypd : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphdlyreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphsetinitreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphshift180 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpicodeovrden : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpicodereset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txpippmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txswing : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txsyncallin : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_tx10gstat : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txcomfinish : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdlyalignerr : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdlyalignprog : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphaligndone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphalignerr : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphalignoutrsvd : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphdlyresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphsetinitdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txphshift180done : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txsyncdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txctrl0 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_TX0_ch_txctrl1 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_TX0_ch_txctrl2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_TX0_ch_txdeemph : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txmargin : in STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_TX0_ch_txdiffctrl : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_TX0_ch_txpippmstepsize : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_TX0_ch_txdapiresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txqpisenn : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txqpisenp : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txswingouthigh : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txswingoutlow : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdapireset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txdapiresetmask : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_TX0_ch_txqpibiasen : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX0_ch_txqpiweakpu : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbufstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_RX0_ch_rxcdrlock : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdebugpcsout : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxprbserr : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxprbslocked : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrhold : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrovrden : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxlatclk : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxpcsresetmask : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_RX0_ch_rxpd : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxpmaresetmask : in STD_LOGIC_VECTOR ( 6 downto 0 );
    INTF0_RX0_ch_rxpolarity : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxprbscntreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxrate : in STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxresetmode : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    INTF0_RX0_ch_rx10gstat : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxdatavalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxheader : out STD_LOGIC_VECTOR ( 5 downto 0 );
    INTF0_RX0_ch_rxchanisaligned : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanrealign : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchbondi : in STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_RX0_ch_rxchbondo : out STD_LOGIC_VECTOR ( 4 downto 0 );
    INTF0_RX0_ch_rxclkcorcnt : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxcominitdet : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcommadet : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbyteisaligned : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxbyterealign : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcomsasdet : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcomwakedet : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxctrl0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    INTF0_RX0_ch_rxctrl2 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxctrl3 : out STD_LOGIC_VECTOR ( 7 downto 0 );
    INTF0_RX0_ch_rxdapicodeovrden : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdapicodereset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdlyalignerr : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdlyalignprog : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdlyalignreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxelecidle : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxeqtraining : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxfinealigndone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxgearboxslip : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxheadervalid : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxlpmen : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxmldchaindone : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxmldchainreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxmlfinealignreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxoobreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxosintdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphaligndone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphalignerr : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphalignreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphalignresetmask : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxphdlypd : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphdlyreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphdlyresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphsetinitreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphshift180 : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphshift180done : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxphsetinitdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxslide : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxsliderdy : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxstartofseq : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxstatus : out STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_RX0_ch_rxsyncallin : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxsyncdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxtermination : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxvalid : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbondseq : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbond_busy : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbond_en : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbond_master : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbond_slave : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxchanbond_level : in STD_LOGIC_VECTOR ( 2 downto 0 );
    INTF0_RX0_ch_cdrbmcdrreq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_cdrfreqos : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_cdrincpctrl : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_cdrstepdir : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_cdrstepsq : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_cdrstepsx : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_eyescanreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_eyescantrigger : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_eyescandataerror : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_refdebugout : out STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxdapiresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxpkdet : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxqpisenn : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxqpisenp : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxsimplexphystatus : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxslipdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_dfehold : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_dfeovrd : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdapireset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxdapiresetmask : in STD_LOGIC_VECTOR ( 1 downto 0 );
    INTF0_RX0_ch_rxqpien : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrphdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_gtrxreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxprogdivresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxresetdone : out STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxcdrreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_RX0_ch_rxprbssel : in STD_LOGIC_VECTOR ( 3 downto 0 );
    INTF0_RX0_ch_rxprogdivreset : in STD_LOGIC_VECTOR ( 0 to 0 );
    INTF0_TX_clr_out : out STD_LOGIC;
    INTF0_TX_clrb_leaf_out : out STD_LOGIC;
    INTF0_RX_clr_out : out STD_LOGIC;
    INTF0_RX_clrb_leaf_out : out STD_LOGIC;
    INTF0_rst_all_in : in STD_LOGIC;
    INTF0_rst_tx_pll_and_datapath_in : in STD_LOGIC;
    INTF0_rst_tx_datapath_in : in STD_LOGIC;
    INTF0_rst_tx_done_out : out STD_LOGIC;
    INTF0_rst_rx_pll_and_datapath_in : in STD_LOGIC;
    INTF0_rst_rx_datapath_in : in STD_LOGIC;
    INTF0_rst_rx_done_out : out STD_LOGIC;
    QUAD0_ch0_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
    QUAD0_hsclk0_lcplllock : out STD_LOGIC
  );
  end component extended_phy_layer_gtwiz_versal_0_0;
  signal INTF0_RX0_ch_rxcdrhold_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTF0_RX0_ch_rxcdrovrden_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTF0_RX0_ch_rxpd_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTF0_RX0_ch_rxpolarity_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal INTF0_RX0_ch_rxrate_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal INTF0_TX0_ch_txctrl0_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal INTF0_TX0_ch_txctrl1_0_1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal INTF0_TX0_ch_txctrl2_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal INTF0_TX0_ch_txdata_1 : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal INTF0_TX0_ch_txpd_0_1 : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal INTF0_TX0_ch_txrate_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal INTF0_rst_all_in_0_1 : STD_LOGIC;
  signal INTF0_rst_rx_datapath_in_0_1 : STD_LOGIC;
  signal INTF0_rst_rx_pll_and_datapath_in_0_1 : STD_LOGIC;
  signal INTF0_rst_tx_datapath_in_0_1 : STD_LOGIC;
  signal INTF0_rst_tx_pll_and_datapath_in_0_1 : STD_LOGIC;
  signal QUAD0_GTREFCLK0_0_1 : STD_LOGIC;
  signal QUAD0_GT_DEBUG_0_1_gpi : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal QUAD0_GT_DEBUG_0_1_gpo : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal QUAD0_RX0_usrclk_0_1 : STD_LOGIC;
  signal QUAD0_TX0_usrclk_0_1 : STD_LOGIC;
  signal Quad0_CH0_DEBUG_0_1_ch_loopback : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal gtwiz_freerun_clk_0_1 : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet : STD_LOGIC_VECTOR ( 0 to 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxctrl0 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxctrl1 : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxctrl2 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxctrl3 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxdata : STD_LOGIC_VECTOR ( 127 downto 0 );
  signal gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal gtwiz_versal_0_INTF0_RX_clr_out : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_RX_clrb_leaf_out : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_TX0_ch_txbufstatus : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal gtwiz_versal_0_INTF0_TX_clr_out : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_TX_clrb_leaf_out : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_rst_rx_done_out : STD_LOGIC;
  signal gtwiz_versal_0_INTF0_rst_tx_done_out : STD_LOGIC;
  signal gtwiz_versal_0_QUAD0_RX0_outclk : STD_LOGIC;
  signal gtwiz_versal_0_QUAD0_TX0_outclk : STD_LOGIC;
  signal gtwiz_versal_0_QUAD0_hsclk0_lcplllock : STD_LOGIC;
  signal gtwiz_versal_0_Quad0_GT_Serial_GRX_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal gtwiz_versal_0_Quad0_GT_Serial_GRX_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal gtwiz_versal_0_Quad0_GT_Serial_GTX_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal gtwiz_versal_0_Quad0_GT_Serial_GTX_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal gtwiz_versal_0_gtpowergood : STD_LOGIC;
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_eyescandataerror_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_refdebugout_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rx10gstat_UNCONNECTED : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcdrlock_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcdrphdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanbond_busy_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanbondseq_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanisaligned_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanrealign_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchbondo_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxclkcorcnt_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcominitdet_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcommadet_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcomwakedet_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdapiresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdebugpcsout_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdlyalignerr_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdlyalignprog_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxelecidle_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxfinealigndone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxheader_UNCONNECTED : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxheadervalid_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxosintdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphaligndone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphalignerr_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphdlyresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphsetinitdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphshift180done_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxpkdet_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprbserr_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprbslocked_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprogdivresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxqpisenn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxqpisenp_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsimplexphystatus_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsliderdy_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxslipdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxstartofseq_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxstatus_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsyncdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_RX0_ch_rxvalid_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_tx10gstat_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txcomfinish_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txdapiresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txdccdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txdebugpcsout_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txdlyalignerr_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txdlyalignprog_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphaligndone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphalignerr_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphalignoutrsvd_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphdlyresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphsetinitdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txphshift180done_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txprogdivresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txqpisenn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txqpisenp_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txresetdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txswingouthigh_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txswingoutlow_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_gtwiz_versal_0_INTF0_TX0_ch_txsyncdone_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of QUAD0_GTREFCLK0_0 : signal is "xilinx.com:signal:clock:1.0 CLK.QUAD0_GTREFCLK0_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of QUAD0_GTREFCLK0_0 : signal is "XIL_INTERFACENAME CLK.QUAD0_GTREFCLK0_0, CLK_DOMAIN extended_phy_layer_QUAD0_GTREFCLK0_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of QUAD0_RX0_outclk_0 : signal is "xilinx.com:signal:gt_outclk:1.0 GT_OUTCLK.QUAD0_RX0_OUTCLK_0 GT_OUTCLK";
  attribute X_INTERFACE_PARAMETER of QUAD0_RX0_outclk_0 : signal is "XIL_INTERFACENAME GT_OUTCLK.QUAD0_RX0_OUTCLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_versal_0_0_QUAD0_RX0_outclk, FREQ_HZ 322266000.0, IS_MASTER false, PARENT_ID undef, PHASE 0.0";
  attribute X_INTERFACE_INFO of QUAD0_RX0_usrclk_0 : signal is "xilinx.com:signal:gt_usrclk:1.0 GT_USRCLK.QUAD0_RX0_USRCLK_0 GT_USRCLK";
  attribute X_INTERFACE_PARAMETER of QUAD0_RX0_usrclk_0 : signal is "XIL_INTERFACENAME GT_USRCLK.QUAD0_RX0_USRCLK_0, CLK_DOMAIN extended_phy_layer_QUAD0_RX0_usrclk_0, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0";
  attribute X_INTERFACE_INFO of QUAD0_TX0_outclk_0 : signal is "xilinx.com:signal:gt_outclk:1.0 GT_OUTCLK.QUAD0_TX0_OUTCLK_0 GT_OUTCLK";
  attribute X_INTERFACE_PARAMETER of QUAD0_TX0_outclk_0 : signal is "XIL_INTERFACENAME GT_OUTCLK.QUAD0_TX0_OUTCLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_versal_0_0_QUAD0_TX0_outclk, FREQ_HZ 322266000.0, IS_MASTER false, PARENT_ID undef, PHASE 0.0";
  attribute X_INTERFACE_INFO of QUAD0_TX0_usrclk_0 : signal is "xilinx.com:signal:gt_usrclk:1.0 GT_USRCLK.QUAD0_TX0_USRCLK_0 GT_USRCLK";
  attribute X_INTERFACE_PARAMETER of QUAD0_TX0_usrclk_0 : signal is "XIL_INTERFACENAME GT_USRCLK.QUAD0_TX0_USRCLK_0, CLK_DOMAIN extended_phy_layer_QUAD0_TX0_usrclk_0, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0";
  attribute X_INTERFACE_INFO of gtwiz_freerun_clk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.GTWIZ_FREERUN_CLK_0 CLK";
  attribute X_INTERFACE_PARAMETER of gtwiz_freerun_clk_0 : signal is "XIL_INTERFACENAME CLK.GTWIZ_FREERUN_CLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_freerun_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of INTF0_TX0_ch_txdata : signal is "xilinx.com:signal:data:1.0 DATA.INTF0_TX0_CH_TXDATA DATA";
  attribute X_INTERFACE_PARAMETER of INTF0_TX0_ch_txdata : signal is "XIL_INTERFACENAME DATA.INTF0_TX0_CH_TXDATA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of QUAD0_GT_DEBUG_0_gpi : signal is "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG_0 gpi";
  attribute X_INTERFACE_INFO of QUAD0_GT_DEBUG_0_gpo : signal is "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG_0 gpo";
  attribute X_INTERFACE_INFO of Quad0_CH0_DEBUG_0_ch_loopback : signal is "xilinx.com:interface:gt_channel_debug:1.0 Quad0_CH0_DEBUG_0 ch_loopback";
  attribute X_INTERFACE_INFO of Quad0_GT_Serial_0_grx_n : signal is "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GRX_N";
  attribute X_INTERFACE_PARAMETER of Quad0_GT_Serial_0_grx_n : signal is "XIL_INTERFACENAME Quad0_GT_Serial_0, CAN_DEBUG false";
  attribute X_INTERFACE_INFO of Quad0_GT_Serial_0_grx_p : signal is "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GRX_P";
  attribute X_INTERFACE_INFO of Quad0_GT_Serial_0_gtx_n : signal is "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GTX_N";
  attribute X_INTERFACE_INFO of Quad0_GT_Serial_0_gtx_p : signal is "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GTX_P";
begin
  INTF0_RX0_ch_rxbufstatus_0(2 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus(2 downto 0);
  INTF0_RX0_ch_rxbyteisaligned_0(0) <= gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned(0);
  INTF0_RX0_ch_rxbyterealign_0(0) <= gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign(0);
  INTF0_RX0_ch_rxcdrhold_0_1(0) <= INTF0_RX0_ch_rxcdrhold_0(0);
  INTF0_RX0_ch_rxcdrovrden_0_1(0) <= INTF0_RX0_ch_rxcdrovrden_0(0);
  INTF0_RX0_ch_rxcomsasdet_0(0) <= gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet(0);
  INTF0_RX0_ch_rxctrl0_0(15 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxctrl0(15 downto 0);
  INTF0_RX0_ch_rxctrl1_0(15 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxctrl1(15 downto 0);
  INTF0_RX0_ch_rxctrl2_0(7 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxctrl2(7 downto 0);
  INTF0_RX0_ch_rxctrl3_0(7 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxctrl3(7 downto 0);
  INTF0_RX0_ch_rxdata_0(127 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxdata(127 downto 0);
  INTF0_RX0_ch_rxdatavalid_0(1 downto 0) <= gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid(1 downto 0);
  INTF0_RX0_ch_rxpd_0_1(1 downto 0) <= INTF0_RX0_ch_rxpd_0(1 downto 0);
  INTF0_RX0_ch_rxpolarity_0_1(0) <= INTF0_RX0_ch_rxpolarity_0(0);
  INTF0_RX0_ch_rxrate_0_1(7 downto 0) <= INTF0_RX0_ch_rxrate_0(7 downto 0);
  INTF0_RX_clr_out_0 <= gtwiz_versal_0_INTF0_RX_clr_out;
  INTF0_RX_clrb_leaf_out_0 <= gtwiz_versal_0_INTF0_RX_clrb_leaf_out;
  INTF0_TX0_ch_txbufstatus_0(1 downto 0) <= gtwiz_versal_0_INTF0_TX0_ch_txbufstatus(1 downto 0);
  INTF0_TX0_ch_txctrl0_0_1(15 downto 0) <= INTF0_TX0_ch_txctrl0_0(15 downto 0);
  INTF0_TX0_ch_txctrl1_0_1(15 downto 0) <= INTF0_TX0_ch_txctrl1_0(15 downto 0);
  INTF0_TX0_ch_txctrl2_0_1(7 downto 0) <= INTF0_TX0_ch_txctrl2_0(7 downto 0);
  INTF0_TX0_ch_txdata_1(127 downto 0) <= INTF0_TX0_ch_txdata(127 downto 0);
  INTF0_TX0_ch_txpd_0_1(1 downto 0) <= INTF0_TX0_ch_txpd_0(1 downto 0);
  INTF0_TX0_ch_txrate_0_1(7 downto 0) <= INTF0_TX0_ch_txrate_0(7 downto 0);
  INTF0_TX_clr_out_0 <= gtwiz_versal_0_INTF0_TX_clr_out;
  INTF0_TX_clrb_leaf_out_0 <= gtwiz_versal_0_INTF0_TX_clrb_leaf_out;
  INTF0_rst_all_in_0_1 <= INTF0_rst_all_in_0;
  INTF0_rst_rx_datapath_in_0_1 <= INTF0_rst_rx_datapath_in_0;
  INTF0_rst_rx_done_out_0 <= gtwiz_versal_0_INTF0_rst_rx_done_out;
  INTF0_rst_rx_pll_and_datapath_in_0_1 <= INTF0_rst_rx_pll_and_datapath_in_0;
  INTF0_rst_tx_datapath_in_0_1 <= INTF0_rst_tx_datapath_in_0;
  INTF0_rst_tx_done_out_0 <= gtwiz_versal_0_INTF0_rst_tx_done_out;
  INTF0_rst_tx_pll_and_datapath_in_0_1 <= INTF0_rst_tx_pll_and_datapath_in_0;
  QUAD0_GTREFCLK0_0_1 <= QUAD0_GTREFCLK0_0;
  QUAD0_GT_DEBUG_0_1_gpi(31 downto 0) <= QUAD0_GT_DEBUG_0_gpi(31 downto 0);
  QUAD0_GT_DEBUG_0_gpo(31 downto 0) <= QUAD0_GT_DEBUG_0_1_gpo(31 downto 0);
  QUAD0_RX0_outclk_0 <= gtwiz_versal_0_QUAD0_RX0_outclk;
  QUAD0_RX0_usrclk_0_1 <= QUAD0_RX0_usrclk_0;
  QUAD0_TX0_outclk_0 <= gtwiz_versal_0_QUAD0_TX0_outclk;
  QUAD0_TX0_usrclk_0_1 <= QUAD0_TX0_usrclk_0;
  QUAD0_hsclk0_lcplllock_0 <= gtwiz_versal_0_QUAD0_hsclk0_lcplllock;
  Quad0_CH0_DEBUG_0_1_ch_loopback(2 downto 0) <= Quad0_CH0_DEBUG_0_ch_loopback(2 downto 0);
  Quad0_GT_Serial_0_gtx_n(3 downto 0) <= gtwiz_versal_0_Quad0_GT_Serial_GTX_N(3 downto 0);
  Quad0_GT_Serial_0_gtx_p(3 downto 0) <= gtwiz_versal_0_Quad0_GT_Serial_GTX_P(3 downto 0);
  gtpowergood_0 <= gtwiz_versal_0_gtpowergood;
  gtwiz_freerun_clk_0_1 <= gtwiz_freerun_clk_0;
  gtwiz_versal_0_Quad0_GT_Serial_GRX_N(3 downto 0) <= Quad0_GT_Serial_0_grx_n(3 downto 0);
  gtwiz_versal_0_Quad0_GT_Serial_GRX_P(3 downto 0) <= Quad0_GT_Serial_0_grx_p(3 downto 0);
gtwiz_versal_0: component extended_phy_layer_gtwiz_versal_0_0
     port map (
      INTF0_RX0_ch_cdrbmcdrreq(0) => '0',
      INTF0_RX0_ch_cdrfreqos(0) => '0',
      INTF0_RX0_ch_cdrincpctrl(0) => '0',
      INTF0_RX0_ch_cdrstepdir(0) => '0',
      INTF0_RX0_ch_cdrstepsq(0) => '0',
      INTF0_RX0_ch_cdrstepsx(0) => '0',
      INTF0_RX0_ch_dfehold(0) => '0',
      INTF0_RX0_ch_dfeovrd(0) => '0',
      INTF0_RX0_ch_eyescandataerror(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_eyescandataerror_UNCONNECTED(0),
      INTF0_RX0_ch_eyescanreset(0) => '0',
      INTF0_RX0_ch_eyescantrigger(0) => '0',
      INTF0_RX0_ch_gtrxreset(0) => '0',
      INTF0_RX0_ch_refdebugout(1 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_refdebugout_UNCONNECTED(1 downto 0),
      INTF0_RX0_ch_rx10gstat(7 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rx10gstat_UNCONNECTED(7 downto 0),
      INTF0_RX0_ch_rxbufstatus(2 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus(2 downto 0),
      INTF0_RX0_ch_rxbyteisaligned(0) => gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned(0),
      INTF0_RX0_ch_rxbyterealign(0) => gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign(0),
      INTF0_RX0_ch_rxcdrhold(0) => INTF0_RX0_ch_rxcdrhold_0_1(0),
      INTF0_RX0_ch_rxcdrlock(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcdrlock_UNCONNECTED(0),
      INTF0_RX0_ch_rxcdrovrden(0) => INTF0_RX0_ch_rxcdrovrden_0_1(0),
      INTF0_RX0_ch_rxcdrphdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcdrphdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxcdrreset(0) => '0',
      INTF0_RX0_ch_rxchanbond_busy(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanbond_busy_UNCONNECTED(0),
      INTF0_RX0_ch_rxchanbond_en(0) => '0',
      INTF0_RX0_ch_rxchanbond_level(2 downto 0) => B"000",
      INTF0_RX0_ch_rxchanbond_master(0) => '0',
      INTF0_RX0_ch_rxchanbond_slave(0) => '0',
      INTF0_RX0_ch_rxchanbondseq(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanbondseq_UNCONNECTED(0),
      INTF0_RX0_ch_rxchanisaligned(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanisaligned_UNCONNECTED(0),
      INTF0_RX0_ch_rxchanrealign(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchanrealign_UNCONNECTED(0),
      INTF0_RX0_ch_rxchbondi(4 downto 0) => B"00000",
      INTF0_RX0_ch_rxchbondo(4 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxchbondo_UNCONNECTED(4 downto 0),
      INTF0_RX0_ch_rxclkcorcnt(1 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxclkcorcnt_UNCONNECTED(1 downto 0),
      INTF0_RX0_ch_rxcominitdet(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcominitdet_UNCONNECTED(0),
      INTF0_RX0_ch_rxcommadet(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcommadet_UNCONNECTED(0),
      INTF0_RX0_ch_rxcomsasdet(0) => gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet(0),
      INTF0_RX0_ch_rxcomwakedet(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxcomwakedet_UNCONNECTED(0),
      INTF0_RX0_ch_rxctrl0(15 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxctrl0(15 downto 0),
      INTF0_RX0_ch_rxctrl1(15 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxctrl1(15 downto 0),
      INTF0_RX0_ch_rxctrl2(7 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxctrl2(7 downto 0),
      INTF0_RX0_ch_rxctrl3(7 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxctrl3(7 downto 0),
      INTF0_RX0_ch_rxdapicodeovrden(0) => '0',
      INTF0_RX0_ch_rxdapicodereset(0) => '0',
      INTF0_RX0_ch_rxdapireset(0) => '0',
      INTF0_RX0_ch_rxdapiresetdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdapiresetdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxdapiresetmask(1 downto 0) => B"00",
      INTF0_RX0_ch_rxdata(127 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxdata(127 downto 0),
      INTF0_RX0_ch_rxdatavalid(1 downto 0) => gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid(1 downto 0),
      INTF0_RX0_ch_rxdebugpcsout(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdebugpcsout_UNCONNECTED(0),
      INTF0_RX0_ch_rxdlyalignerr(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdlyalignerr_UNCONNECTED(0),
      INTF0_RX0_ch_rxdlyalignprog(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxdlyalignprog_UNCONNECTED(0),
      INTF0_RX0_ch_rxdlyalignreq(0) => '0',
      INTF0_RX0_ch_rxelecidle(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxelecidle_UNCONNECTED(0),
      INTF0_RX0_ch_rxeqtraining(0) => '0',
      INTF0_RX0_ch_rxfinealigndone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxfinealigndone_UNCONNECTED(0),
      INTF0_RX0_ch_rxgearboxslip(0) => '0',
      INTF0_RX0_ch_rxheader(5 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxheader_UNCONNECTED(5 downto 0),
      INTF0_RX0_ch_rxheadervalid(1 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxheadervalid_UNCONNECTED(1 downto 0),
      INTF0_RX0_ch_rxlatclk(0) => '0',
      INTF0_RX0_ch_rxlpmen(0) => '0',
      INTF0_RX0_ch_rxmldchaindone(0) => '0',
      INTF0_RX0_ch_rxmldchainreq(0) => '0',
      INTF0_RX0_ch_rxmlfinealignreq(0) => '0',
      INTF0_RX0_ch_rxoobreset(0) => '0',
      INTF0_RX0_ch_rxosintdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxosintdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxpcsresetmask(4 downto 0) => B"11111",
      INTF0_RX0_ch_rxpd(1 downto 0) => INTF0_RX0_ch_rxpd_0_1(1 downto 0),
      INTF0_RX0_ch_rxphaligndone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphaligndone_UNCONNECTED(0),
      INTF0_RX0_ch_rxphalignerr(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphalignerr_UNCONNECTED(0),
      INTF0_RX0_ch_rxphalignreq(0) => '0',
      INTF0_RX0_ch_rxphalignresetmask(1 downto 0) => B"11",
      INTF0_RX0_ch_rxphdlypd(0) => '0',
      INTF0_RX0_ch_rxphdlyreset(0) => '0',
      INTF0_RX0_ch_rxphdlyresetdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphdlyresetdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxphsetinitdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphsetinitdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxphsetinitreq(0) => '0',
      INTF0_RX0_ch_rxphshift180(0) => '0',
      INTF0_RX0_ch_rxphshift180done(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxphshift180done_UNCONNECTED(0),
      INTF0_RX0_ch_rxpkdet(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxpkdet_UNCONNECTED(0),
      INTF0_RX0_ch_rxpmaresetmask(6 downto 0) => B"1111111",
      INTF0_RX0_ch_rxpolarity(0) => INTF0_RX0_ch_rxpolarity_0_1(0),
      INTF0_RX0_ch_rxprbscntreset(0) => '0',
      INTF0_RX0_ch_rxprbserr(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprbserr_UNCONNECTED(0),
      INTF0_RX0_ch_rxprbslocked(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprbslocked_UNCONNECTED(0),
      INTF0_RX0_ch_rxprbssel(3 downto 0) => B"0000",
      INTF0_RX0_ch_rxprogdivreset(0) => '0',
      INTF0_RX0_ch_rxprogdivresetdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxprogdivresetdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxqpien(0) => '0',
      INTF0_RX0_ch_rxqpisenn(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxqpisenn_UNCONNECTED(0),
      INTF0_RX0_ch_rxqpisenp(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxqpisenp_UNCONNECTED(0),
      INTF0_RX0_ch_rxrate(7 downto 0) => INTF0_RX0_ch_rxrate_0_1(7 downto 0),
      INTF0_RX0_ch_rxresetdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxresetdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxresetmode(1 downto 0) => B"00",
      INTF0_RX0_ch_rxsimplexphystatus(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsimplexphystatus_UNCONNECTED(0),
      INTF0_RX0_ch_rxslide(0) => '0',
      INTF0_RX0_ch_rxsliderdy(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsliderdy_UNCONNECTED(0),
      INTF0_RX0_ch_rxslipdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxslipdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxstartofseq(1 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxstartofseq_UNCONNECTED(1 downto 0),
      INTF0_RX0_ch_rxstatus(2 downto 0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxstatus_UNCONNECTED(2 downto 0),
      INTF0_RX0_ch_rxsyncallin(0) => '0',
      INTF0_RX0_ch_rxsyncdone(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxsyncdone_UNCONNECTED(0),
      INTF0_RX0_ch_rxtermination(0) => '0',
      INTF0_RX0_ch_rxvalid(0) => NLW_gtwiz_versal_0_INTF0_RX0_ch_rxvalid_UNCONNECTED(0),
      INTF0_RX_clr_out => gtwiz_versal_0_INTF0_RX_clr_out,
      INTF0_RX_clrb_leaf_out => gtwiz_versal_0_INTF0_RX_clrb_leaf_out,
      INTF0_TX0_ch_gttxreset(0) => '0',
      INTF0_TX0_ch_tx10gstat(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_tx10gstat_UNCONNECTED(0),
      INTF0_TX0_ch_txbufstatus(1 downto 0) => gtwiz_versal_0_INTF0_TX0_ch_txbufstatus(1 downto 0),
      INTF0_TX0_ch_txcomfinish(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txcomfinish_UNCONNECTED(0),
      INTF0_TX0_ch_txcominit(0) => '0',
      INTF0_TX0_ch_txcomsas(0) => '0',
      INTF0_TX0_ch_txcomwake(0) => '0',
      INTF0_TX0_ch_txctrl0(15 downto 0) => INTF0_TX0_ch_txctrl0_0_1(15 downto 0),
      INTF0_TX0_ch_txctrl1(15 downto 0) => INTF0_TX0_ch_txctrl1_0_1(15 downto 0),
      INTF0_TX0_ch_txctrl2(7 downto 0) => INTF0_TX0_ch_txctrl2_0_1(7 downto 0),
      INTF0_TX0_ch_txdapicodeovrden(0) => '0',
      INTF0_TX0_ch_txdapicodereset(0) => '0',
      INTF0_TX0_ch_txdapireset(0) => '0',
      INTF0_TX0_ch_txdapiresetdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txdapiresetdone_UNCONNECTED(0),
      INTF0_TX0_ch_txdapiresetmask(1 downto 0) => B"00",
      INTF0_TX0_ch_txdata(127 downto 0) => INTF0_TX0_ch_txdata_1(127 downto 0),
      INTF0_TX0_ch_txdccdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txdccdone_UNCONNECTED(0),
      INTF0_TX0_ch_txdebugpcsout(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txdebugpcsout_UNCONNECTED(0),
      INTF0_TX0_ch_txdeemph(1 downto 0) => B"00",
      INTF0_TX0_ch_txdetectrx(0) => '0',
      INTF0_TX0_ch_txdiffctrl(4 downto 0) => B"11001",
      INTF0_TX0_ch_txdlyalignerr(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txdlyalignerr_UNCONNECTED(0),
      INTF0_TX0_ch_txdlyalignprog(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txdlyalignprog_UNCONNECTED(0),
      INTF0_TX0_ch_txdlyalignreq(0) => '0',
      INTF0_TX0_ch_txelecidle(0) => '0',
      INTF0_TX0_ch_txheader(5 downto 0) => B"000000",
      INTF0_TX0_ch_txinhibit(0) => '0',
      INTF0_TX0_ch_txlatclk(0) => '0',
      INTF0_TX0_ch_txmaincursor(6 downto 0) => B"1001101",
      INTF0_TX0_ch_txmargin(2 downto 0) => B"000",
      INTF0_TX0_ch_txmldchaindone(0) => '0',
      INTF0_TX0_ch_txmldchainreq(0) => '0',
      INTF0_TX0_ch_txoneszeros(0) => '0',
      INTF0_TX0_ch_txpausedelayalign(0) => '0',
      INTF0_TX0_ch_txpcsresetmask(0) => '1',
      INTF0_TX0_ch_txpd(1 downto 0) => INTF0_TX0_ch_txpd_0_1(1 downto 0),
      INTF0_TX0_ch_txphaligndone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphaligndone_UNCONNECTED(0),
      INTF0_TX0_ch_txphalignerr(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphalignerr_UNCONNECTED(0),
      INTF0_TX0_ch_txphalignoutrsvd(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphalignoutrsvd_UNCONNECTED(0),
      INTF0_TX0_ch_txphalignreq(0) => '0',
      INTF0_TX0_ch_txphalignresetmask(1 downto 0) => B"11",
      INTF0_TX0_ch_txphdlypd(0) => '0',
      INTF0_TX0_ch_txphdlyreset(0) => '0',
      INTF0_TX0_ch_txphdlyresetdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphdlyresetdone_UNCONNECTED(0),
      INTF0_TX0_ch_txphdlytstclk(0) => '0',
      INTF0_TX0_ch_txphsetinitdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphsetinitdone_UNCONNECTED(0),
      INTF0_TX0_ch_txphsetinitreq(0) => '0',
      INTF0_TX0_ch_txphshift180(0) => '0',
      INTF0_TX0_ch_txphshift180done(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txphshift180done_UNCONNECTED(0),
      INTF0_TX0_ch_txpicodeovrden(0) => '0',
      INTF0_TX0_ch_txpicodereset(0) => '0',
      INTF0_TX0_ch_txpippmen(0) => '0',
      INTF0_TX0_ch_txpippmstepsize(4 downto 0) => B"00000",
      INTF0_TX0_ch_txpisopd(0) => '0',
      INTF0_TX0_ch_txpmaresetmask(2 downto 0) => B"111",
      INTF0_TX0_ch_txpolarity(0) => '0',
      INTF0_TX0_ch_txpostcursor(4 downto 0) => B"00000",
      INTF0_TX0_ch_txprbsforceerr(0) => '0',
      INTF0_TX0_ch_txprbssel(3 downto 0) => B"0000",
      INTF0_TX0_ch_txprecursor(4 downto 0) => B"00000",
      INTF0_TX0_ch_txprogdivreset(0) => '0',
      INTF0_TX0_ch_txprogdivresetdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txprogdivresetdone_UNCONNECTED(0),
      INTF0_TX0_ch_txqpibiasen(0) => '0',
      INTF0_TX0_ch_txqpisenn(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txqpisenn_UNCONNECTED(0),
      INTF0_TX0_ch_txqpisenp(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txqpisenp_UNCONNECTED(0),
      INTF0_TX0_ch_txqpiweakpu(0) => '0',
      INTF0_TX0_ch_txrate(7 downto 0) => INTF0_TX0_ch_txrate_0_1(7 downto 0),
      INTF0_TX0_ch_txresetdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txresetdone_UNCONNECTED(0),
      INTF0_TX0_ch_txresetmode(1 downto 0) => B"00",
      INTF0_TX0_ch_txsequence(6 downto 0) => B"0000000",
      INTF0_TX0_ch_txswing(0) => '0',
      INTF0_TX0_ch_txswingouthigh(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txswingouthigh_UNCONNECTED(0),
      INTF0_TX0_ch_txswingoutlow(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txswingoutlow_UNCONNECTED(0),
      INTF0_TX0_ch_txsyncallin(0) => '0',
      INTF0_TX0_ch_txsyncdone(0) => NLW_gtwiz_versal_0_INTF0_TX0_ch_txsyncdone_UNCONNECTED(0),
      INTF0_TX_clr_out => gtwiz_versal_0_INTF0_TX_clr_out,
      INTF0_TX_clrb_leaf_out => gtwiz_versal_0_INTF0_TX_clrb_leaf_out,
      INTF0_rst_all_in => INTF0_rst_all_in_0_1,
      INTF0_rst_rx_datapath_in => INTF0_rst_rx_datapath_in_0_1,
      INTF0_rst_rx_done_out => gtwiz_versal_0_INTF0_rst_rx_done_out,
      INTF0_rst_rx_pll_and_datapath_in => INTF0_rst_rx_pll_and_datapath_in_0_1,
      INTF0_rst_tx_datapath_in => INTF0_rst_tx_datapath_in_0_1,
      INTF0_rst_tx_done_out => gtwiz_versal_0_INTF0_rst_tx_done_out,
      INTF0_rst_tx_pll_and_datapath_in => INTF0_rst_tx_pll_and_datapath_in_0_1,
      QUAD0_GTREFCLK0 => QUAD0_GTREFCLK0_0_1,
      QUAD0_RX0_outclk => gtwiz_versal_0_QUAD0_RX0_outclk,
      QUAD0_RX0_usrclk => QUAD0_RX0_usrclk_0_1,
      QUAD0_TX0_outclk => gtwiz_versal_0_QUAD0_TX0_outclk,
      QUAD0_TX0_usrclk => QUAD0_TX0_usrclk_0_1,
      QUAD0_ch0_loopback(2 downto 0) => Quad0_CH0_DEBUG_0_1_ch_loopback(2 downto 0),
      QUAD0_gpi(31 downto 0) => QUAD0_GT_DEBUG_0_1_gpi(31 downto 0),
      QUAD0_gpo(31 downto 0) => QUAD0_GT_DEBUG_0_1_gpo(31 downto 0),
      QUAD0_hsclk0_lcplllock => gtwiz_versal_0_QUAD0_hsclk0_lcplllock,
      QUAD0_rxn(3 downto 0) => gtwiz_versal_0_Quad0_GT_Serial_GRX_N(3 downto 0),
      QUAD0_rxp(3 downto 0) => gtwiz_versal_0_Quad0_GT_Serial_GRX_P(3 downto 0),
      QUAD0_txn(3 downto 0) => gtwiz_versal_0_Quad0_GT_Serial_GTX_N(3 downto 0),
      QUAD0_txp(3 downto 0) => gtwiz_versal_0_Quad0_GT_Serial_GTX_P(3 downto 0),
      gtpowergood => gtwiz_versal_0_gtpowergood,
      gtwiz_freerun_clk => gtwiz_freerun_clk_0_1
    );
end STRUCTURE;
