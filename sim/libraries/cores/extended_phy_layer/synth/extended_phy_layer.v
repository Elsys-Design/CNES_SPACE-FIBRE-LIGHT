//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
//Date        : Fri Jan 24 18:32:28 2025
//Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target extended_phy_layer.bd
//Design      : extended_phy_layer
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "extended_phy_layer,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=extended_phy_layer,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "extended_phy_layer.hwdef" *) 
module extended_phy_layer
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.INTF0_TX0_CH_TXDATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.INTF0_TX0_CH_TXDATA, LAYERED_METADATA undef" *) input [127:0]INTF0_TX0_ch_txdata;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.QUAD0_GTREFCLK0_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.QUAD0_GTREFCLK0_0, CLK_DOMAIN extended_phy_layer_QUAD0_GTREFCLK0_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input QUAD0_GTREFCLK0_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG_0 gpi" *) input [31:0]QUAD0_GT_DEBUG_0_gpi;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG_0 gpo" *) output [31:0]QUAD0_GT_DEBUG_0_gpo;
  (* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 GT_OUTCLK.QUAD0_RX0_OUTCLK_0 GT_OUTCLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_OUTCLK.QUAD0_RX0_OUTCLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_versal_0_0_QUAD0_RX0_outclk, FREQ_HZ 322266000.0, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *) output QUAD0_RX0_outclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 GT_USRCLK.QUAD0_RX0_USRCLK_0 GT_USRCLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_USRCLK.QUAD0_RX0_USRCLK_0, CLK_DOMAIN extended_phy_layer_QUAD0_RX0_usrclk_0, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *) input QUAD0_RX0_usrclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 GT_OUTCLK.QUAD0_TX0_OUTCLK_0 GT_OUTCLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_OUTCLK.QUAD0_TX0_OUTCLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_versal_0_0_QUAD0_TX0_outclk, FREQ_HZ 322266000.0, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *) output QUAD0_TX0_outclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 GT_USRCLK.QUAD0_TX0_USRCLK_0 GT_USRCLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_USRCLK.QUAD0_TX0_USRCLK_0, CLK_DOMAIN extended_phy_layer_QUAD0_TX0_usrclk_0, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *) input QUAD0_TX0_usrclk_0;
  output QUAD0_hsclk0_lcplllock_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 Quad0_CH0_DEBUG_0 ch_loopback" *) input [2:0]Quad0_CH0_DEBUG_0_ch_loopback;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_GT_Serial_0, CAN_DEBUG false" *) input [3:0]Quad0_GT_Serial_0_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GRX_P" *) input [3:0]Quad0_GT_Serial_0_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GTX_N" *) output [3:0]Quad0_GT_Serial_0_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial_0 GTX_P" *) output [3:0]Quad0_GT_Serial_0_gtx_p;
  output gtpowergood_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.GTWIZ_FREERUN_CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.GTWIZ_FREERUN_CLK_0, CLK_DOMAIN extended_phy_layer_gtwiz_freerun_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input gtwiz_freerun_clk_0;

  wire [0:0]INTF0_RX0_ch_rxcdrhold_0_1;
  wire [0:0]INTF0_RX0_ch_rxcdrovrden_0_1;
  wire [1:0]INTF0_RX0_ch_rxpd_0_1;
  wire [0:0]INTF0_RX0_ch_rxpolarity_0_1;
  wire [7:0]INTF0_RX0_ch_rxrate_0_1;
  wire [15:0]INTF0_TX0_ch_txctrl0_0_1;
  wire [15:0]INTF0_TX0_ch_txctrl1_0_1;
  wire [7:0]INTF0_TX0_ch_txctrl2_0_1;
  wire [127:0]INTF0_TX0_ch_txdata_1;
  wire [1:0]INTF0_TX0_ch_txpd_0_1;
  wire [7:0]INTF0_TX0_ch_txrate_0_1;
  wire INTF0_rst_all_in_0_1;
  wire INTF0_rst_rx_datapath_in_0_1;
  wire INTF0_rst_rx_pll_and_datapath_in_0_1;
  wire INTF0_rst_tx_datapath_in_0_1;
  wire INTF0_rst_tx_pll_and_datapath_in_0_1;
  wire QUAD0_GTREFCLK0_0_1;
  wire [31:0]QUAD0_GT_DEBUG_0_1_gpi;
  wire [31:0]QUAD0_GT_DEBUG_0_1_gpo;
  wire QUAD0_RX0_usrclk_0_1;
  wire QUAD0_TX0_usrclk_0_1;
  wire [2:0]Quad0_CH0_DEBUG_0_1_ch_loopback;
  wire gtwiz_freerun_clk_0_1;
  wire [2:0]gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus;
  wire [0:0]gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned;
  wire [0:0]gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign;
  wire [0:0]gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet;
  wire [15:0]gtwiz_versal_0_INTF0_RX0_ch_rxctrl0;
  wire [15:0]gtwiz_versal_0_INTF0_RX0_ch_rxctrl1;
  wire [7:0]gtwiz_versal_0_INTF0_RX0_ch_rxctrl2;
  wire [7:0]gtwiz_versal_0_INTF0_RX0_ch_rxctrl3;
  wire [127:0]gtwiz_versal_0_INTF0_RX0_ch_rxdata;
  wire [1:0]gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid;
  wire gtwiz_versal_0_INTF0_RX_clr_out;
  wire gtwiz_versal_0_INTF0_RX_clrb_leaf_out;
  wire [1:0]gtwiz_versal_0_INTF0_TX0_ch_txbufstatus;
  wire gtwiz_versal_0_INTF0_TX_clr_out;
  wire gtwiz_versal_0_INTF0_TX_clrb_leaf_out;
  wire gtwiz_versal_0_INTF0_rst_rx_done_out;
  wire gtwiz_versal_0_INTF0_rst_tx_done_out;
  wire gtwiz_versal_0_QUAD0_RX0_outclk;
  wire gtwiz_versal_0_QUAD0_TX0_outclk;
  wire gtwiz_versal_0_QUAD0_hsclk0_lcplllock;
  wire [3:0]gtwiz_versal_0_Quad0_GT_Serial_GRX_N;
  wire [3:0]gtwiz_versal_0_Quad0_GT_Serial_GRX_P;
  wire [3:0]gtwiz_versal_0_Quad0_GT_Serial_GTX_N;
  wire [3:0]gtwiz_versal_0_Quad0_GT_Serial_GTX_P;
  wire gtwiz_versal_0_gtpowergood;

  assign INTF0_RX0_ch_rxbufstatus_0[2:0] = gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus;
  assign INTF0_RX0_ch_rxbyteisaligned_0[0] = gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned;
  assign INTF0_RX0_ch_rxbyterealign_0[0] = gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign;
  assign INTF0_RX0_ch_rxcdrhold_0_1 = INTF0_RX0_ch_rxcdrhold_0[0];
  assign INTF0_RX0_ch_rxcdrovrden_0_1 = INTF0_RX0_ch_rxcdrovrden_0[0];
  assign INTF0_RX0_ch_rxcomsasdet_0[0] = gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet;
  assign INTF0_RX0_ch_rxctrl0_0[15:0] = gtwiz_versal_0_INTF0_RX0_ch_rxctrl0;
  assign INTF0_RX0_ch_rxctrl1_0[15:0] = gtwiz_versal_0_INTF0_RX0_ch_rxctrl1;
  assign INTF0_RX0_ch_rxctrl2_0[7:0] = gtwiz_versal_0_INTF0_RX0_ch_rxctrl2;
  assign INTF0_RX0_ch_rxctrl3_0[7:0] = gtwiz_versal_0_INTF0_RX0_ch_rxctrl3;
  assign INTF0_RX0_ch_rxdata_0[127:0] = gtwiz_versal_0_INTF0_RX0_ch_rxdata;
  assign INTF0_RX0_ch_rxdatavalid_0[1:0] = gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid;
  assign INTF0_RX0_ch_rxpd_0_1 = INTF0_RX0_ch_rxpd_0[1:0];
  assign INTF0_RX0_ch_rxpolarity_0_1 = INTF0_RX0_ch_rxpolarity_0[0];
  assign INTF0_RX0_ch_rxrate_0_1 = INTF0_RX0_ch_rxrate_0[7:0];
  assign INTF0_RX_clr_out_0 = gtwiz_versal_0_INTF0_RX_clr_out;
  assign INTF0_RX_clrb_leaf_out_0 = gtwiz_versal_0_INTF0_RX_clrb_leaf_out;
  assign INTF0_TX0_ch_txbufstatus_0[1:0] = gtwiz_versal_0_INTF0_TX0_ch_txbufstatus;
  assign INTF0_TX0_ch_txctrl0_0_1 = INTF0_TX0_ch_txctrl0_0[15:0];
  assign INTF0_TX0_ch_txctrl1_0_1 = INTF0_TX0_ch_txctrl1_0[15:0];
  assign INTF0_TX0_ch_txctrl2_0_1 = INTF0_TX0_ch_txctrl2_0[7:0];
  assign INTF0_TX0_ch_txdata_1 = INTF0_TX0_ch_txdata[127:0];
  assign INTF0_TX0_ch_txpd_0_1 = INTF0_TX0_ch_txpd_0[1:0];
  assign INTF0_TX0_ch_txrate_0_1 = INTF0_TX0_ch_txrate_0[7:0];
  assign INTF0_TX_clr_out_0 = gtwiz_versal_0_INTF0_TX_clr_out;
  assign INTF0_TX_clrb_leaf_out_0 = gtwiz_versal_0_INTF0_TX_clrb_leaf_out;
  assign INTF0_rst_all_in_0_1 = INTF0_rst_all_in_0;
  assign INTF0_rst_rx_datapath_in_0_1 = INTF0_rst_rx_datapath_in_0;
  assign INTF0_rst_rx_done_out_0 = gtwiz_versal_0_INTF0_rst_rx_done_out;
  assign INTF0_rst_rx_pll_and_datapath_in_0_1 = INTF0_rst_rx_pll_and_datapath_in_0;
  assign INTF0_rst_tx_datapath_in_0_1 = INTF0_rst_tx_datapath_in_0;
  assign INTF0_rst_tx_done_out_0 = gtwiz_versal_0_INTF0_rst_tx_done_out;
  assign INTF0_rst_tx_pll_and_datapath_in_0_1 = INTF0_rst_tx_pll_and_datapath_in_0;
  assign QUAD0_GTREFCLK0_0_1 = QUAD0_GTREFCLK0_0;
  assign QUAD0_GT_DEBUG_0_1_gpi = QUAD0_GT_DEBUG_0_gpi[31:0];
  assign QUAD0_GT_DEBUG_0_gpo[31:0] = QUAD0_GT_DEBUG_0_1_gpo;
  assign QUAD0_RX0_outclk_0 = gtwiz_versal_0_QUAD0_RX0_outclk;
  assign QUAD0_RX0_usrclk_0_1 = QUAD0_RX0_usrclk_0;
  assign QUAD0_TX0_outclk_0 = gtwiz_versal_0_QUAD0_TX0_outclk;
  assign QUAD0_TX0_usrclk_0_1 = QUAD0_TX0_usrclk_0;
  assign QUAD0_hsclk0_lcplllock_0 = gtwiz_versal_0_QUAD0_hsclk0_lcplllock;
  assign Quad0_CH0_DEBUG_0_1_ch_loopback = Quad0_CH0_DEBUG_0_ch_loopback[2:0];
  assign Quad0_GT_Serial_0_gtx_n[3:0] = gtwiz_versal_0_Quad0_GT_Serial_GTX_N;
  assign Quad0_GT_Serial_0_gtx_p[3:0] = gtwiz_versal_0_Quad0_GT_Serial_GTX_P;
  assign gtpowergood_0 = gtwiz_versal_0_gtpowergood;
  assign gtwiz_freerun_clk_0_1 = gtwiz_freerun_clk_0;
  assign gtwiz_versal_0_Quad0_GT_Serial_GRX_N = Quad0_GT_Serial_0_grx_n[3:0];
  assign gtwiz_versal_0_Quad0_GT_Serial_GRX_P = Quad0_GT_Serial_0_grx_p[3:0];
  extended_phy_layer_gtwiz_versal_0_0 gtwiz_versal_0
       (.INTF0_RX0_ch_cdrbmcdrreq(1'b0),
        .INTF0_RX0_ch_cdrfreqos(1'b0),
        .INTF0_RX0_ch_cdrincpctrl(1'b0),
        .INTF0_RX0_ch_cdrstepdir(1'b0),
        .INTF0_RX0_ch_cdrstepsq(1'b0),
        .INTF0_RX0_ch_cdrstepsx(1'b0),
        .INTF0_RX0_ch_dfehold(1'b0),
        .INTF0_RX0_ch_dfeovrd(1'b0),
        .INTF0_RX0_ch_eyescanreset(1'b0),
        .INTF0_RX0_ch_eyescantrigger(1'b0),
        .INTF0_RX0_ch_gtrxreset(1'b0),
        .INTF0_RX0_ch_rxbufstatus(gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus),
        .INTF0_RX0_ch_rxbyteisaligned(gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned),
        .INTF0_RX0_ch_rxbyterealign(gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign),
        .INTF0_RX0_ch_rxcdrhold(INTF0_RX0_ch_rxcdrhold_0_1),
        .INTF0_RX0_ch_rxcdrovrden(INTF0_RX0_ch_rxcdrovrden_0_1),
        .INTF0_RX0_ch_rxcdrreset(1'b0),
        .INTF0_RX0_ch_rxchanbond_en(1'b0),
        .INTF0_RX0_ch_rxchanbond_level({1'b0,1'b0,1'b0}),
        .INTF0_RX0_ch_rxchanbond_master(1'b0),
        .INTF0_RX0_ch_rxchanbond_slave(1'b0),
        .INTF0_RX0_ch_rxchbondi({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_RX0_ch_rxcomsasdet(gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet),
        .INTF0_RX0_ch_rxctrl0(gtwiz_versal_0_INTF0_RX0_ch_rxctrl0),
        .INTF0_RX0_ch_rxctrl1(gtwiz_versal_0_INTF0_RX0_ch_rxctrl1),
        .INTF0_RX0_ch_rxctrl2(gtwiz_versal_0_INTF0_RX0_ch_rxctrl2),
        .INTF0_RX0_ch_rxctrl3(gtwiz_versal_0_INTF0_RX0_ch_rxctrl3),
        .INTF0_RX0_ch_rxdapicodeovrden(1'b0),
        .INTF0_RX0_ch_rxdapicodereset(1'b0),
        .INTF0_RX0_ch_rxdapireset(1'b0),
        .INTF0_RX0_ch_rxdapiresetmask({1'b0,1'b0}),
        .INTF0_RX0_ch_rxdata(gtwiz_versal_0_INTF0_RX0_ch_rxdata),
        .INTF0_RX0_ch_rxdatavalid(gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid),
        .INTF0_RX0_ch_rxdlyalignreq(1'b0),
        .INTF0_RX0_ch_rxeqtraining(1'b0),
        .INTF0_RX0_ch_rxgearboxslip(1'b0),
        .INTF0_RX0_ch_rxlatclk(1'b0),
        .INTF0_RX0_ch_rxlpmen(1'b0),
        .INTF0_RX0_ch_rxmldchaindone(1'b0),
        .INTF0_RX0_ch_rxmldchainreq(1'b0),
        .INTF0_RX0_ch_rxmlfinealignreq(1'b0),
        .INTF0_RX0_ch_rxoobreset(1'b0),
        .INTF0_RX0_ch_rxpcsresetmask({1'b1,1'b1,1'b1,1'b1,1'b1}),
        .INTF0_RX0_ch_rxpd(INTF0_RX0_ch_rxpd_0_1),
        .INTF0_RX0_ch_rxphalignreq(1'b0),
        .INTF0_RX0_ch_rxphalignresetmask({1'b1,1'b1}),
        .INTF0_RX0_ch_rxphdlypd(1'b0),
        .INTF0_RX0_ch_rxphdlyreset(1'b0),
        .INTF0_RX0_ch_rxphsetinitreq(1'b0),
        .INTF0_RX0_ch_rxphshift180(1'b0),
        .INTF0_RX0_ch_rxpmaresetmask({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .INTF0_RX0_ch_rxpolarity(INTF0_RX0_ch_rxpolarity_0_1),
        .INTF0_RX0_ch_rxprbscntreset(1'b0),
        .INTF0_RX0_ch_rxprbssel({1'b0,1'b0,1'b0,1'b0}),
        .INTF0_RX0_ch_rxprogdivreset(1'b0),
        .INTF0_RX0_ch_rxqpien(1'b0),
        .INTF0_RX0_ch_rxrate(INTF0_RX0_ch_rxrate_0_1),
        .INTF0_RX0_ch_rxresetmode({1'b0,1'b0}),
        .INTF0_RX0_ch_rxslide(1'b0),
        .INTF0_RX0_ch_rxsyncallin(1'b0),
        .INTF0_RX0_ch_rxtermination(1'b0),
        .INTF0_RX_clr_out(gtwiz_versal_0_INTF0_RX_clr_out),
        .INTF0_RX_clrb_leaf_out(gtwiz_versal_0_INTF0_RX_clrb_leaf_out),
        .INTF0_TX0_ch_gttxreset(1'b0),
        .INTF0_TX0_ch_txbufstatus(gtwiz_versal_0_INTF0_TX0_ch_txbufstatus),
        .INTF0_TX0_ch_txcominit(1'b0),
        .INTF0_TX0_ch_txcomsas(1'b0),
        .INTF0_TX0_ch_txcomwake(1'b0),
        .INTF0_TX0_ch_txctrl0(INTF0_TX0_ch_txctrl0_0_1),
        .INTF0_TX0_ch_txctrl1(INTF0_TX0_ch_txctrl1_0_1),
        .INTF0_TX0_ch_txctrl2(INTF0_TX0_ch_txctrl2_0_1),
        .INTF0_TX0_ch_txdapicodeovrden(1'b0),
        .INTF0_TX0_ch_txdapicodereset(1'b0),
        .INTF0_TX0_ch_txdapireset(1'b0),
        .INTF0_TX0_ch_txdapiresetmask({1'b0,1'b0}),
        .INTF0_TX0_ch_txdata(INTF0_TX0_ch_txdata_1),
        .INTF0_TX0_ch_txdeemph({1'b0,1'b0}),
        .INTF0_TX0_ch_txdetectrx(1'b0),
        .INTF0_TX0_ch_txdiffctrl({1'b1,1'b1,1'b0,1'b0,1'b1}),
        .INTF0_TX0_ch_txdlyalignreq(1'b0),
        .INTF0_TX0_ch_txelecidle(1'b0),
        .INTF0_TX0_ch_txheader({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txinhibit(1'b0),
        .INTF0_TX0_ch_txlatclk(1'b0),
        .INTF0_TX0_ch_txmaincursor({1'b1,1'b0,1'b0,1'b1,1'b1,1'b0,1'b1}),
        .INTF0_TX0_ch_txmargin({1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txmldchaindone(1'b0),
        .INTF0_TX0_ch_txmldchainreq(1'b0),
        .INTF0_TX0_ch_txoneszeros(1'b0),
        .INTF0_TX0_ch_txpausedelayalign(1'b0),
        .INTF0_TX0_ch_txpcsresetmask(1'b1),
        .INTF0_TX0_ch_txpd(INTF0_TX0_ch_txpd_0_1),
        .INTF0_TX0_ch_txphalignreq(1'b0),
        .INTF0_TX0_ch_txphalignresetmask({1'b1,1'b1}),
        .INTF0_TX0_ch_txphdlypd(1'b0),
        .INTF0_TX0_ch_txphdlyreset(1'b0),
        .INTF0_TX0_ch_txphdlytstclk(1'b0),
        .INTF0_TX0_ch_txphsetinitreq(1'b0),
        .INTF0_TX0_ch_txphshift180(1'b0),
        .INTF0_TX0_ch_txpicodeovrden(1'b0),
        .INTF0_TX0_ch_txpicodereset(1'b0),
        .INTF0_TX0_ch_txpippmen(1'b0),
        .INTF0_TX0_ch_txpippmstepsize({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txpisopd(1'b0),
        .INTF0_TX0_ch_txpmaresetmask({1'b1,1'b1,1'b1}),
        .INTF0_TX0_ch_txpolarity(1'b0),
        .INTF0_TX0_ch_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txprbsforceerr(1'b0),
        .INTF0_TX0_ch_txprbssel({1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txprecursor({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txprogdivreset(1'b0),
        .INTF0_TX0_ch_txqpibiasen(1'b0),
        .INTF0_TX0_ch_txqpiweakpu(1'b0),
        .INTF0_TX0_ch_txrate(INTF0_TX0_ch_txrate_0_1),
        .INTF0_TX0_ch_txresetmode({1'b0,1'b0}),
        .INTF0_TX0_ch_txsequence({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INTF0_TX0_ch_txswing(1'b0),
        .INTF0_TX0_ch_txsyncallin(1'b0),
        .INTF0_TX_clr_out(gtwiz_versal_0_INTF0_TX_clr_out),
        .INTF0_TX_clrb_leaf_out(gtwiz_versal_0_INTF0_TX_clrb_leaf_out),
        .INTF0_rst_all_in(INTF0_rst_all_in_0_1),
        .INTF0_rst_rx_datapath_in(INTF0_rst_rx_datapath_in_0_1),
        .INTF0_rst_rx_done_out(gtwiz_versal_0_INTF0_rst_rx_done_out),
        .INTF0_rst_rx_pll_and_datapath_in(INTF0_rst_rx_pll_and_datapath_in_0_1),
        .INTF0_rst_tx_datapath_in(INTF0_rst_tx_datapath_in_0_1),
        .INTF0_rst_tx_done_out(gtwiz_versal_0_INTF0_rst_tx_done_out),
        .INTF0_rst_tx_pll_and_datapath_in(INTF0_rst_tx_pll_and_datapath_in_0_1),
        .QUAD0_GTREFCLK0(QUAD0_GTREFCLK0_0_1),
        .QUAD0_RX0_outclk(gtwiz_versal_0_QUAD0_RX0_outclk),
        .QUAD0_RX0_usrclk(QUAD0_RX0_usrclk_0_1),
        .QUAD0_TX0_outclk(gtwiz_versal_0_QUAD0_TX0_outclk),
        .QUAD0_TX0_usrclk(QUAD0_TX0_usrclk_0_1),
        .QUAD0_ch0_loopback(Quad0_CH0_DEBUG_0_1_ch_loopback),
        .QUAD0_gpi(QUAD0_GT_DEBUG_0_1_gpi),
        .QUAD0_gpo(QUAD0_GT_DEBUG_0_1_gpo),
        .QUAD0_hsclk0_lcplllock(gtwiz_versal_0_QUAD0_hsclk0_lcplllock),
        .QUAD0_rxn(gtwiz_versal_0_Quad0_GT_Serial_GRX_N),
        .QUAD0_rxp(gtwiz_versal_0_Quad0_GT_Serial_GRX_P),
        .QUAD0_txn(gtwiz_versal_0_Quad0_GT_Serial_GTX_N),
        .QUAD0_txp(gtwiz_versal_0_Quad0_GT_Serial_GTX_P),
        .gtpowergood(gtwiz_versal_0_gtpowergood),
        .gtwiz_freerun_clk(gtwiz_freerun_clk_0_1));
endmodule
