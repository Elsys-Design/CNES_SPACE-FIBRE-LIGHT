// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Thu Jan 23 16:52:43 2025
// Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top extended_phy_layer_gtwiz_versal_0_0 -prefix
//               extended_phy_layer_gtwiz_versal_0_0_ extended_phy_layer_gtwiz_versal_0_0_stub.v
// Design      : extended_phy_layer_gtwiz_versal_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcve2802-vsvh1760-2MP-e-S
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "extended_phy_layer_gtwiz_versal_0_0_inst,Vivado 2024.1" *)
module extended_phy_layer_gtwiz_versal_0_0(gtpowergood, gtwiz_freerun_clk, 
  QUAD0_GTREFCLK0, QUAD0_TX0_outclk, QUAD0_RX0_outclk, QUAD0_rxp, QUAD0_rxn, QUAD0_txp, 
  QUAD0_txn, QUAD0_ch0_loopback, QUAD0_gpi, QUAD0_gpo, QUAD0_hsclk0_lcplllock, 
  QUAD0_TX0_usrclk, QUAD0_RX0_usrclk, INTF0_TX0_ch_txdata, INTF0_TX0_ch_txbufstatus, 
  INTF0_TX0_ch_txdccdone, INTF0_TX0_ch_gttxreset, INTF0_TX0_ch_txdebugpcsout, 
  INTF0_TX0_ch_txprogdivresetdone, INTF0_TX0_ch_txresetdone, INTF0_TX0_ch_txinhibit, 
  INTF0_TX0_ch_txlatclk, INTF0_TX0_ch_txmaincursor, INTF0_TX0_ch_txpcsresetmask, 
  INTF0_TX0_ch_txpd, INTF0_TX0_ch_txpisopd, INTF0_TX0_ch_txpmaresetmask, 
  INTF0_TX0_ch_txpolarity, INTF0_TX0_ch_txpostcursor, INTF0_TX0_ch_txprbsforceerr, 
  INTF0_TX0_ch_txprbssel, INTF0_TX0_ch_txprecursor, INTF0_TX0_ch_txprogdivreset, 
  INTF0_TX0_ch_txrate, INTF0_TX0_ch_txresetmode, INTF0_TX0_ch_txheader, 
  INTF0_TX0_ch_txsequence, INTF0_TX0_ch_txphalignresetmask, INTF0_TX0_ch_txcominit, 
  INTF0_TX0_ch_txcomsas, INTF0_TX0_ch_txcomwake, INTF0_TX0_ch_txdapicodeovrden, 
  INTF0_TX0_ch_txdapicodereset, INTF0_TX0_ch_txdetectrx, INTF0_TX0_ch_txphdlytstclk, 
  INTF0_TX0_ch_txdlyalignreq, INTF0_TX0_ch_txelecidle, INTF0_TX0_ch_txmldchaindone, 
  INTF0_TX0_ch_txmldchainreq, INTF0_TX0_ch_txoneszeros, INTF0_TX0_ch_txpausedelayalign, 
  INTF0_TX0_ch_txphalignreq, INTF0_TX0_ch_txphdlypd, INTF0_TX0_ch_txphdlyreset, 
  INTF0_TX0_ch_txphsetinitreq, INTF0_TX0_ch_txphshift180, INTF0_TX0_ch_txpicodeovrden, 
  INTF0_TX0_ch_txpicodereset, INTF0_TX0_ch_txpippmen, INTF0_TX0_ch_txswing, 
  INTF0_TX0_ch_txsyncallin, INTF0_TX0_ch_tx10gstat, INTF0_TX0_ch_txcomfinish, 
  INTF0_TX0_ch_txdlyalignerr, INTF0_TX0_ch_txdlyalignprog, INTF0_TX0_ch_txphaligndone, 
  INTF0_TX0_ch_txphalignerr, INTF0_TX0_ch_txphalignoutrsvd, 
  INTF0_TX0_ch_txphdlyresetdone, INTF0_TX0_ch_txphsetinitdone, 
  INTF0_TX0_ch_txphshift180done, INTF0_TX0_ch_txsyncdone, INTF0_TX0_ch_txctrl0, 
  INTF0_TX0_ch_txctrl1, INTF0_TX0_ch_txctrl2, INTF0_TX0_ch_txdeemph, 
  INTF0_TX0_ch_txmargin, INTF0_TX0_ch_txdiffctrl, INTF0_TX0_ch_txpippmstepsize, 
  INTF0_TX0_ch_txdapiresetdone, INTF0_TX0_ch_txqpisenn, INTF0_TX0_ch_txqpisenp, 
  INTF0_TX0_ch_txswingouthigh, INTF0_TX0_ch_txswingoutlow, INTF0_TX0_ch_txdapireset, 
  INTF0_TX0_ch_txdapiresetmask, INTF0_TX0_ch_txqpibiasen, INTF0_TX0_ch_txqpiweakpu, 
  INTF0_RX0_ch_rxbufstatus, INTF0_RX0_ch_rxcdrlock, INTF0_RX0_ch_rxdebugpcsout, 
  INTF0_RX0_ch_rxprbserr, INTF0_RX0_ch_rxprbslocked, INTF0_RX0_ch_rxcdrhold, 
  INTF0_RX0_ch_rxcdrovrden, INTF0_RX0_ch_rxlatclk, INTF0_RX0_ch_rxpcsresetmask, 
  INTF0_RX0_ch_rxpd, INTF0_RX0_ch_rxpmaresetmask, INTF0_RX0_ch_rxpolarity, 
  INTF0_RX0_ch_rxprbscntreset, INTF0_RX0_ch_rxrate, INTF0_RX0_ch_rxresetmode, 
  INTF0_RX0_ch_rxdata, INTF0_RX0_ch_rx10gstat, INTF0_RX0_ch_rxdatavalid, 
  INTF0_RX0_ch_rxheader, INTF0_RX0_ch_rxchanisaligned, INTF0_RX0_ch_rxchanrealign, 
  INTF0_RX0_ch_rxchbondi, INTF0_RX0_ch_rxchbondo, INTF0_RX0_ch_rxclkcorcnt, 
  INTF0_RX0_ch_rxcominitdet, INTF0_RX0_ch_rxcommadet, INTF0_RX0_ch_rxbyteisaligned, 
  INTF0_RX0_ch_rxbyterealign, INTF0_RX0_ch_rxcomsasdet, INTF0_RX0_ch_rxcomwakedet, 
  INTF0_RX0_ch_rxctrl0, INTF0_RX0_ch_rxctrl1, INTF0_RX0_ch_rxctrl2, INTF0_RX0_ch_rxctrl3, 
  INTF0_RX0_ch_rxdapicodeovrden, INTF0_RX0_ch_rxdapicodereset, 
  INTF0_RX0_ch_rxdlyalignerr, INTF0_RX0_ch_rxdlyalignprog, INTF0_RX0_ch_rxdlyalignreq, 
  INTF0_RX0_ch_rxelecidle, INTF0_RX0_ch_rxeqtraining, INTF0_RX0_ch_rxfinealigndone, 
  INTF0_RX0_ch_rxgearboxslip, INTF0_RX0_ch_rxheadervalid, INTF0_RX0_ch_rxlpmen, 
  INTF0_RX0_ch_rxmldchaindone, INTF0_RX0_ch_rxmldchainreq, 
  INTF0_RX0_ch_rxmlfinealignreq, INTF0_RX0_ch_rxoobreset, INTF0_RX0_ch_rxosintdone, 
  INTF0_RX0_ch_rxphaligndone, INTF0_RX0_ch_rxphalignerr, INTF0_RX0_ch_rxphalignreq, 
  INTF0_RX0_ch_rxphalignresetmask, INTF0_RX0_ch_rxphdlypd, INTF0_RX0_ch_rxphdlyreset, 
  INTF0_RX0_ch_rxphdlyresetdone, INTF0_RX0_ch_rxphsetinitreq, 
  INTF0_RX0_ch_rxphshift180, INTF0_RX0_ch_rxphshift180done, 
  INTF0_RX0_ch_rxphsetinitdone, INTF0_RX0_ch_rxslide, INTF0_RX0_ch_rxsliderdy, 
  INTF0_RX0_ch_rxstartofseq, INTF0_RX0_ch_rxstatus, INTF0_RX0_ch_rxsyncallin, 
  INTF0_RX0_ch_rxsyncdone, INTF0_RX0_ch_rxtermination, INTF0_RX0_ch_rxvalid, 
  INTF0_RX0_ch_rxchanbondseq, INTF0_RX0_ch_rxchanbond_busy, INTF0_RX0_ch_rxchanbond_en, 
  INTF0_RX0_ch_rxchanbond_master, INTF0_RX0_ch_rxchanbond_slave, 
  INTF0_RX0_ch_rxchanbond_level, INTF0_RX0_ch_cdrbmcdrreq, INTF0_RX0_ch_cdrfreqos, 
  INTF0_RX0_ch_cdrincpctrl, INTF0_RX0_ch_cdrstepdir, INTF0_RX0_ch_cdrstepsq, 
  INTF0_RX0_ch_cdrstepsx, INTF0_RX0_ch_eyescanreset, INTF0_RX0_ch_eyescantrigger, 
  INTF0_RX0_ch_eyescandataerror, INTF0_RX0_ch_refdebugout, 
  INTF0_RX0_ch_rxdapiresetdone, INTF0_RX0_ch_rxpkdet, INTF0_RX0_ch_rxqpisenn, 
  INTF0_RX0_ch_rxqpisenp, INTF0_RX0_ch_rxsimplexphystatus, INTF0_RX0_ch_rxslipdone, 
  INTF0_RX0_ch_dfehold, INTF0_RX0_ch_dfeovrd, INTF0_RX0_ch_rxdapireset, 
  INTF0_RX0_ch_rxdapiresetmask, INTF0_RX0_ch_rxqpien, INTF0_RX0_ch_rxcdrphdone, 
  INTF0_RX0_ch_gtrxreset, INTF0_RX0_ch_rxprogdivresetdone, INTF0_RX0_ch_rxresetdone, 
  INTF0_RX0_ch_rxcdrreset, INTF0_RX0_ch_rxprbssel, INTF0_RX0_ch_rxprogdivreset, 
  INTF0_TX_clr_out, INTF0_TX_clrb_leaf_out, INTF0_RX_clr_out, INTF0_RX_clrb_leaf_out, 
  INTF0_rst_all_in, INTF0_rst_tx_pll_and_datapath_in, INTF0_rst_tx_datapath_in, 
  INTF0_rst_tx_done_out, INTF0_rst_rx_pll_and_datapath_in, INTF0_rst_rx_datapath_in, 
  INTF0_rst_rx_done_out)
/* synthesis syn_black_box black_box_pad_pin="gtpowergood,QUAD0_GTREFCLK0,QUAD0_TX0_outclk,QUAD0_RX0_outclk,QUAD0_rxp[3:0],QUAD0_rxn[3:0],QUAD0_txp[3:0],QUAD0_txn[3:0],QUAD0_ch0_loopback[2:0],QUAD0_gpi[31:0],QUAD0_gpo[31:0],QUAD0_hsclk0_lcplllock,INTF0_TX0_ch_txdata[127:0],INTF0_TX0_ch_txbufstatus[1:0],INTF0_TX0_ch_txdccdone[0:0],INTF0_TX0_ch_gttxreset[0:0],INTF0_TX0_ch_txdebugpcsout[0:0],INTF0_TX0_ch_txprogdivresetdone[0:0],INTF0_TX0_ch_txresetdone[0:0],INTF0_TX0_ch_txinhibit[0:0],INTF0_TX0_ch_txlatclk[0:0],INTF0_TX0_ch_txmaincursor[6:0],INTF0_TX0_ch_txpcsresetmask[0:0],INTF0_TX0_ch_txpd[1:0],INTF0_TX0_ch_txpisopd[0:0],INTF0_TX0_ch_txpmaresetmask[2:0],INTF0_TX0_ch_txpolarity[0:0],INTF0_TX0_ch_txpostcursor[4:0],INTF0_TX0_ch_txprbsforceerr[0:0],INTF0_TX0_ch_txprbssel[3:0],INTF0_TX0_ch_txprecursor[4:0],INTF0_TX0_ch_txprogdivreset[0:0],INTF0_TX0_ch_txrate[7:0],INTF0_TX0_ch_txresetmode[1:0],INTF0_TX0_ch_txheader[5:0],INTF0_TX0_ch_txsequence[6:0],INTF0_TX0_ch_txphalignresetmask[1:0],INTF0_TX0_ch_txcominit[0:0],INTF0_TX0_ch_txcomsas[0:0],INTF0_TX0_ch_txcomwake[0:0],INTF0_TX0_ch_txdapicodeovrden[0:0],INTF0_TX0_ch_txdapicodereset[0:0],INTF0_TX0_ch_txdetectrx[0:0],INTF0_TX0_ch_txphdlytstclk[0:0],INTF0_TX0_ch_txdlyalignreq[0:0],INTF0_TX0_ch_txelecidle[0:0],INTF0_TX0_ch_txmldchaindone[0:0],INTF0_TX0_ch_txmldchainreq[0:0],INTF0_TX0_ch_txoneszeros[0:0],INTF0_TX0_ch_txpausedelayalign[0:0],INTF0_TX0_ch_txphalignreq[0:0],INTF0_TX0_ch_txphdlypd[0:0],INTF0_TX0_ch_txphdlyreset[0:0],INTF0_TX0_ch_txphsetinitreq[0:0],INTF0_TX0_ch_txphshift180[0:0],INTF0_TX0_ch_txpicodeovrden[0:0],INTF0_TX0_ch_txpicodereset[0:0],INTF0_TX0_ch_txpippmen[0:0],INTF0_TX0_ch_txswing[0:0],INTF0_TX0_ch_txsyncallin[0:0],INTF0_TX0_ch_tx10gstat[0:0],INTF0_TX0_ch_txcomfinish[0:0],INTF0_TX0_ch_txdlyalignerr[0:0],INTF0_TX0_ch_txdlyalignprog[0:0],INTF0_TX0_ch_txphaligndone[0:0],INTF0_TX0_ch_txphalignerr[0:0],INTF0_TX0_ch_txphalignoutrsvd[0:0],INTF0_TX0_ch_txphdlyresetdone[0:0],INTF0_TX0_ch_txphsetinitdone[0:0],INTF0_TX0_ch_txphshift180done[0:0],INTF0_TX0_ch_txsyncdone[0:0],INTF0_TX0_ch_txctrl0[15:0],INTF0_TX0_ch_txctrl1[15:0],INTF0_TX0_ch_txctrl2[7:0],INTF0_TX0_ch_txdeemph[1:0],INTF0_TX0_ch_txmargin[2:0],INTF0_TX0_ch_txdiffctrl[4:0],INTF0_TX0_ch_txpippmstepsize[4:0],INTF0_TX0_ch_txdapiresetdone[0:0],INTF0_TX0_ch_txqpisenn[0:0],INTF0_TX0_ch_txqpisenp[0:0],INTF0_TX0_ch_txswingouthigh[0:0],INTF0_TX0_ch_txswingoutlow[0:0],INTF0_TX0_ch_txdapireset[0:0],INTF0_TX0_ch_txdapiresetmask[1:0],INTF0_TX0_ch_txqpibiasen[0:0],INTF0_TX0_ch_txqpiweakpu[0:0],INTF0_RX0_ch_rxbufstatus[2:0],INTF0_RX0_ch_rxcdrlock[0:0],INTF0_RX0_ch_rxdebugpcsout[0:0],INTF0_RX0_ch_rxprbserr[0:0],INTF0_RX0_ch_rxprbslocked[0:0],INTF0_RX0_ch_rxcdrhold[0:0],INTF0_RX0_ch_rxcdrovrden[0:0],INTF0_RX0_ch_rxlatclk[0:0],INTF0_RX0_ch_rxpcsresetmask[4:0],INTF0_RX0_ch_rxpd[1:0],INTF0_RX0_ch_rxpmaresetmask[6:0],INTF0_RX0_ch_rxpolarity[0:0],INTF0_RX0_ch_rxprbscntreset[0:0],INTF0_RX0_ch_rxrate[7:0],INTF0_RX0_ch_rxresetmode[1:0],INTF0_RX0_ch_rxdata[127:0],INTF0_RX0_ch_rx10gstat[7:0],INTF0_RX0_ch_rxdatavalid[1:0],INTF0_RX0_ch_rxheader[5:0],INTF0_RX0_ch_rxchanisaligned[0:0],INTF0_RX0_ch_rxchanrealign[0:0],INTF0_RX0_ch_rxchbondi[4:0],INTF0_RX0_ch_rxchbondo[4:0],INTF0_RX0_ch_rxclkcorcnt[1:0],INTF0_RX0_ch_rxcominitdet[0:0],INTF0_RX0_ch_rxcommadet[0:0],INTF0_RX0_ch_rxbyteisaligned[0:0],INTF0_RX0_ch_rxbyterealign[0:0],INTF0_RX0_ch_rxcomsasdet[0:0],INTF0_RX0_ch_rxcomwakedet[0:0],INTF0_RX0_ch_rxctrl0[15:0],INTF0_RX0_ch_rxctrl1[15:0],INTF0_RX0_ch_rxctrl2[7:0],INTF0_RX0_ch_rxctrl3[7:0],INTF0_RX0_ch_rxdapicodeovrden[0:0],INTF0_RX0_ch_rxdapicodereset[0:0],INTF0_RX0_ch_rxdlyalignerr[0:0],INTF0_RX0_ch_rxdlyalignprog[0:0],INTF0_RX0_ch_rxdlyalignreq[0:0],INTF0_RX0_ch_rxelecidle[0:0],INTF0_RX0_ch_rxeqtraining[0:0],INTF0_RX0_ch_rxfinealigndone[0:0],INTF0_RX0_ch_rxgearboxslip[0:0],INTF0_RX0_ch_rxheadervalid[1:0],INTF0_RX0_ch_rxlpmen[0:0],INTF0_RX0_ch_rxmldchaindone[0:0],INTF0_RX0_ch_rxmldchainreq[0:0],INTF0_RX0_ch_rxmlfinealignreq[0:0],INTF0_RX0_ch_rxoobreset[0:0],INTF0_RX0_ch_rxosintdone[0:0],INTF0_RX0_ch_rxphaligndone[0:0],INTF0_RX0_ch_rxphalignerr[0:0],INTF0_RX0_ch_rxphalignreq[0:0],INTF0_RX0_ch_rxphalignresetmask[1:0],INTF0_RX0_ch_rxphdlypd[0:0],INTF0_RX0_ch_rxphdlyreset[0:0],INTF0_RX0_ch_rxphdlyresetdone[0:0],INTF0_RX0_ch_rxphsetinitreq[0:0],INTF0_RX0_ch_rxphshift180[0:0],INTF0_RX0_ch_rxphshift180done[0:0],INTF0_RX0_ch_rxphsetinitdone[0:0],INTF0_RX0_ch_rxslide[0:0],INTF0_RX0_ch_rxsliderdy[0:0],INTF0_RX0_ch_rxstartofseq[1:0],INTF0_RX0_ch_rxstatus[2:0],INTF0_RX0_ch_rxsyncallin[0:0],INTF0_RX0_ch_rxsyncdone[0:0],INTF0_RX0_ch_rxtermination[0:0],INTF0_RX0_ch_rxvalid[0:0],INTF0_RX0_ch_rxchanbondseq[0:0],INTF0_RX0_ch_rxchanbond_busy[0:0],INTF0_RX0_ch_rxchanbond_en[0:0],INTF0_RX0_ch_rxchanbond_master[0:0],INTF0_RX0_ch_rxchanbond_slave[0:0],INTF0_RX0_ch_rxchanbond_level[2:0],INTF0_RX0_ch_cdrbmcdrreq[0:0],INTF0_RX0_ch_cdrfreqos[0:0],INTF0_RX0_ch_cdrincpctrl[0:0],INTF0_RX0_ch_cdrstepdir[0:0],INTF0_RX0_ch_cdrstepsq[0:0],INTF0_RX0_ch_cdrstepsx[0:0],INTF0_RX0_ch_eyescanreset[0:0],INTF0_RX0_ch_eyescantrigger[0:0],INTF0_RX0_ch_eyescandataerror[0:0],INTF0_RX0_ch_refdebugout[1:0],INTF0_RX0_ch_rxdapiresetdone[0:0],INTF0_RX0_ch_rxpkdet[0:0],INTF0_RX0_ch_rxqpisenn[0:0],INTF0_RX0_ch_rxqpisenp[0:0],INTF0_RX0_ch_rxsimplexphystatus[0:0],INTF0_RX0_ch_rxslipdone[0:0],INTF0_RX0_ch_dfehold[0:0],INTF0_RX0_ch_dfeovrd[0:0],INTF0_RX0_ch_rxdapireset[0:0],INTF0_RX0_ch_rxdapiresetmask[1:0],INTF0_RX0_ch_rxqpien[0:0],INTF0_RX0_ch_rxcdrphdone[0:0],INTF0_RX0_ch_gtrxreset[0:0],INTF0_RX0_ch_rxprogdivresetdone[0:0],INTF0_RX0_ch_rxresetdone[0:0],INTF0_RX0_ch_rxcdrreset[0:0],INTF0_RX0_ch_rxprbssel[3:0],INTF0_RX0_ch_rxprogdivreset[0:0],INTF0_TX_clr_out,INTF0_TX_clrb_leaf_out,INTF0_RX_clr_out,INTF0_RX_clrb_leaf_out,INTF0_rst_all_in,INTF0_rst_tx_pll_and_datapath_in,INTF0_rst_tx_datapath_in,INTF0_rst_tx_done_out,INTF0_rst_rx_pll_and_datapath_in,INTF0_rst_rx_datapath_in,INTF0_rst_rx_done_out" */
/* synthesis syn_force_seq_prim="gtwiz_freerun_clk" */
/* synthesis syn_force_seq_prim="QUAD0_TX0_usrclk" */
/* synthesis syn_force_seq_prim="QUAD0_RX0_usrclk" */;
  output gtpowergood;
  input gtwiz_freerun_clk /* synthesis syn_isclock = 1 */;
  input QUAD0_GTREFCLK0;
  output QUAD0_TX0_outclk;
  output QUAD0_RX0_outclk;
  input [3:0]QUAD0_rxp;
  input [3:0]QUAD0_rxn;
  output [3:0]QUAD0_txp;
  output [3:0]QUAD0_txn;
  input [2:0]QUAD0_ch0_loopback;
  input [31:0]QUAD0_gpi;
  output [31:0]QUAD0_gpo;
  output QUAD0_hsclk0_lcplllock;
  input QUAD0_TX0_usrclk /* synthesis syn_isclock = 1 */;
  input QUAD0_RX0_usrclk /* synthesis syn_isclock = 1 */;
  input [127:0]INTF0_TX0_ch_txdata;
  output [1:0]INTF0_TX0_ch_txbufstatus;
  output [0:0]INTF0_TX0_ch_txdccdone;
  input [0:0]INTF0_TX0_ch_gttxreset;
  output [0:0]INTF0_TX0_ch_txdebugpcsout;
  output [0:0]INTF0_TX0_ch_txprogdivresetdone;
  output [0:0]INTF0_TX0_ch_txresetdone;
  input [0:0]INTF0_TX0_ch_txinhibit;
  input [0:0]INTF0_TX0_ch_txlatclk;
  input [6:0]INTF0_TX0_ch_txmaincursor;
  input [0:0]INTF0_TX0_ch_txpcsresetmask;
  input [1:0]INTF0_TX0_ch_txpd;
  input [0:0]INTF0_TX0_ch_txpisopd;
  input [2:0]INTF0_TX0_ch_txpmaresetmask;
  input [0:0]INTF0_TX0_ch_txpolarity;
  input [4:0]INTF0_TX0_ch_txpostcursor;
  input [0:0]INTF0_TX0_ch_txprbsforceerr;
  input [3:0]INTF0_TX0_ch_txprbssel;
  input [4:0]INTF0_TX0_ch_txprecursor;
  input [0:0]INTF0_TX0_ch_txprogdivreset;
  input [7:0]INTF0_TX0_ch_txrate;
  input [1:0]INTF0_TX0_ch_txresetmode;
  input [5:0]INTF0_TX0_ch_txheader;
  input [6:0]INTF0_TX0_ch_txsequence;
  input [1:0]INTF0_TX0_ch_txphalignresetmask;
  input [0:0]INTF0_TX0_ch_txcominit;
  input [0:0]INTF0_TX0_ch_txcomsas;
  input [0:0]INTF0_TX0_ch_txcomwake;
  input [0:0]INTF0_TX0_ch_txdapicodeovrden;
  input [0:0]INTF0_TX0_ch_txdapicodereset;
  input [0:0]INTF0_TX0_ch_txdetectrx;
  input [0:0]INTF0_TX0_ch_txphdlytstclk;
  input [0:0]INTF0_TX0_ch_txdlyalignreq;
  input [0:0]INTF0_TX0_ch_txelecidle;
  input [0:0]INTF0_TX0_ch_txmldchaindone;
  input [0:0]INTF0_TX0_ch_txmldchainreq;
  input [0:0]INTF0_TX0_ch_txoneszeros;
  input [0:0]INTF0_TX0_ch_txpausedelayalign;
  input [0:0]INTF0_TX0_ch_txphalignreq;
  input [0:0]INTF0_TX0_ch_txphdlypd;
  input [0:0]INTF0_TX0_ch_txphdlyreset;
  input [0:0]INTF0_TX0_ch_txphsetinitreq;
  input [0:0]INTF0_TX0_ch_txphshift180;
  input [0:0]INTF0_TX0_ch_txpicodeovrden;
  input [0:0]INTF0_TX0_ch_txpicodereset;
  input [0:0]INTF0_TX0_ch_txpippmen;
  input [0:0]INTF0_TX0_ch_txswing;
  input [0:0]INTF0_TX0_ch_txsyncallin;
  output [0:0]INTF0_TX0_ch_tx10gstat;
  output [0:0]INTF0_TX0_ch_txcomfinish;
  output [0:0]INTF0_TX0_ch_txdlyalignerr;
  output [0:0]INTF0_TX0_ch_txdlyalignprog;
  output [0:0]INTF0_TX0_ch_txphaligndone;
  output [0:0]INTF0_TX0_ch_txphalignerr;
  output [0:0]INTF0_TX0_ch_txphalignoutrsvd;
  output [0:0]INTF0_TX0_ch_txphdlyresetdone;
  output [0:0]INTF0_TX0_ch_txphsetinitdone;
  output [0:0]INTF0_TX0_ch_txphshift180done;
  output [0:0]INTF0_TX0_ch_txsyncdone;
  input [15:0]INTF0_TX0_ch_txctrl0;
  input [15:0]INTF0_TX0_ch_txctrl1;
  input [7:0]INTF0_TX0_ch_txctrl2;
  input [1:0]INTF0_TX0_ch_txdeemph;
  input [2:0]INTF0_TX0_ch_txmargin;
  input [4:0]INTF0_TX0_ch_txdiffctrl;
  input [4:0]INTF0_TX0_ch_txpippmstepsize;
  output [0:0]INTF0_TX0_ch_txdapiresetdone;
  output [0:0]INTF0_TX0_ch_txqpisenn;
  output [0:0]INTF0_TX0_ch_txqpisenp;
  output [0:0]INTF0_TX0_ch_txswingouthigh;
  output [0:0]INTF0_TX0_ch_txswingoutlow;
  input [0:0]INTF0_TX0_ch_txdapireset;
  input [1:0]INTF0_TX0_ch_txdapiresetmask;
  input [0:0]INTF0_TX0_ch_txqpibiasen;
  input [0:0]INTF0_TX0_ch_txqpiweakpu;
  output [2:0]INTF0_RX0_ch_rxbufstatus;
  output [0:0]INTF0_RX0_ch_rxcdrlock;
  output [0:0]INTF0_RX0_ch_rxdebugpcsout;
  output [0:0]INTF0_RX0_ch_rxprbserr;
  output [0:0]INTF0_RX0_ch_rxprbslocked;
  input [0:0]INTF0_RX0_ch_rxcdrhold;
  input [0:0]INTF0_RX0_ch_rxcdrovrden;
  input [0:0]INTF0_RX0_ch_rxlatclk;
  input [4:0]INTF0_RX0_ch_rxpcsresetmask;
  input [1:0]INTF0_RX0_ch_rxpd;
  input [6:0]INTF0_RX0_ch_rxpmaresetmask;
  input [0:0]INTF0_RX0_ch_rxpolarity;
  input [0:0]INTF0_RX0_ch_rxprbscntreset;
  input [7:0]INTF0_RX0_ch_rxrate;
  input [1:0]INTF0_RX0_ch_rxresetmode;
  output [127:0]INTF0_RX0_ch_rxdata;
  output [7:0]INTF0_RX0_ch_rx10gstat;
  output [1:0]INTF0_RX0_ch_rxdatavalid;
  output [5:0]INTF0_RX0_ch_rxheader;
  output [0:0]INTF0_RX0_ch_rxchanisaligned;
  output [0:0]INTF0_RX0_ch_rxchanrealign;
  input [4:0]INTF0_RX0_ch_rxchbondi;
  output [4:0]INTF0_RX0_ch_rxchbondo;
  output [1:0]INTF0_RX0_ch_rxclkcorcnt;
  output [0:0]INTF0_RX0_ch_rxcominitdet;
  output [0:0]INTF0_RX0_ch_rxcommadet;
  output [0:0]INTF0_RX0_ch_rxbyteisaligned;
  output [0:0]INTF0_RX0_ch_rxbyterealign;
  output [0:0]INTF0_RX0_ch_rxcomsasdet;
  output [0:0]INTF0_RX0_ch_rxcomwakedet;
  output [15:0]INTF0_RX0_ch_rxctrl0;
  output [15:0]INTF0_RX0_ch_rxctrl1;
  output [7:0]INTF0_RX0_ch_rxctrl2;
  output [7:0]INTF0_RX0_ch_rxctrl3;
  input [0:0]INTF0_RX0_ch_rxdapicodeovrden;
  input [0:0]INTF0_RX0_ch_rxdapicodereset;
  output [0:0]INTF0_RX0_ch_rxdlyalignerr;
  output [0:0]INTF0_RX0_ch_rxdlyalignprog;
  input [0:0]INTF0_RX0_ch_rxdlyalignreq;
  output [0:0]INTF0_RX0_ch_rxelecidle;
  input [0:0]INTF0_RX0_ch_rxeqtraining;
  output [0:0]INTF0_RX0_ch_rxfinealigndone;
  input [0:0]INTF0_RX0_ch_rxgearboxslip;
  output [1:0]INTF0_RX0_ch_rxheadervalid;
  input [0:0]INTF0_RX0_ch_rxlpmen;
  input [0:0]INTF0_RX0_ch_rxmldchaindone;
  input [0:0]INTF0_RX0_ch_rxmldchainreq;
  input [0:0]INTF0_RX0_ch_rxmlfinealignreq;
  input [0:0]INTF0_RX0_ch_rxoobreset;
  output [0:0]INTF0_RX0_ch_rxosintdone;
  output [0:0]INTF0_RX0_ch_rxphaligndone;
  output [0:0]INTF0_RX0_ch_rxphalignerr;
  input [0:0]INTF0_RX0_ch_rxphalignreq;
  input [1:0]INTF0_RX0_ch_rxphalignresetmask;
  input [0:0]INTF0_RX0_ch_rxphdlypd;
  input [0:0]INTF0_RX0_ch_rxphdlyreset;
  output [0:0]INTF0_RX0_ch_rxphdlyresetdone;
  input [0:0]INTF0_RX0_ch_rxphsetinitreq;
  input [0:0]INTF0_RX0_ch_rxphshift180;
  output [0:0]INTF0_RX0_ch_rxphshift180done;
  output [0:0]INTF0_RX0_ch_rxphsetinitdone;
  input [0:0]INTF0_RX0_ch_rxslide;
  output [0:0]INTF0_RX0_ch_rxsliderdy;
  output [1:0]INTF0_RX0_ch_rxstartofseq;
  output [2:0]INTF0_RX0_ch_rxstatus;
  input [0:0]INTF0_RX0_ch_rxsyncallin;
  output [0:0]INTF0_RX0_ch_rxsyncdone;
  input [0:0]INTF0_RX0_ch_rxtermination;
  output [0:0]INTF0_RX0_ch_rxvalid;
  output [0:0]INTF0_RX0_ch_rxchanbondseq;
  output [0:0]INTF0_RX0_ch_rxchanbond_busy;
  input [0:0]INTF0_RX0_ch_rxchanbond_en;
  input [0:0]INTF0_RX0_ch_rxchanbond_master;
  input [0:0]INTF0_RX0_ch_rxchanbond_slave;
  input [2:0]INTF0_RX0_ch_rxchanbond_level;
  input [0:0]INTF0_RX0_ch_cdrbmcdrreq;
  input [0:0]INTF0_RX0_ch_cdrfreqos;
  input [0:0]INTF0_RX0_ch_cdrincpctrl;
  input [0:0]INTF0_RX0_ch_cdrstepdir;
  input [0:0]INTF0_RX0_ch_cdrstepsq;
  input [0:0]INTF0_RX0_ch_cdrstepsx;
  input [0:0]INTF0_RX0_ch_eyescanreset;
  input [0:0]INTF0_RX0_ch_eyescantrigger;
  output [0:0]INTF0_RX0_ch_eyescandataerror;
  output [1:0]INTF0_RX0_ch_refdebugout;
  output [0:0]INTF0_RX0_ch_rxdapiresetdone;
  output [0:0]INTF0_RX0_ch_rxpkdet;
  output [0:0]INTF0_RX0_ch_rxqpisenn;
  output [0:0]INTF0_RX0_ch_rxqpisenp;
  output [0:0]INTF0_RX0_ch_rxsimplexphystatus;
  output [0:0]INTF0_RX0_ch_rxslipdone;
  input [0:0]INTF0_RX0_ch_dfehold;
  input [0:0]INTF0_RX0_ch_dfeovrd;
  input [0:0]INTF0_RX0_ch_rxdapireset;
  input [1:0]INTF0_RX0_ch_rxdapiresetmask;
  input [0:0]INTF0_RX0_ch_rxqpien;
  output [0:0]INTF0_RX0_ch_rxcdrphdone;
  input [0:0]INTF0_RX0_ch_gtrxreset;
  output [0:0]INTF0_RX0_ch_rxprogdivresetdone;
  output [0:0]INTF0_RX0_ch_rxresetdone;
  input [0:0]INTF0_RX0_ch_rxcdrreset;
  input [3:0]INTF0_RX0_ch_rxprbssel;
  input [0:0]INTF0_RX0_ch_rxprogdivreset;
  output INTF0_TX_clr_out;
  output INTF0_TX_clrb_leaf_out;
  output INTF0_RX_clr_out;
  output INTF0_RX_clrb_leaf_out;
  input INTF0_rst_all_in;
  input INTF0_rst_tx_pll_and_datapath_in;
  input INTF0_rst_tx_datapath_in;
  output INTF0_rst_tx_done_out;
  input INTF0_rst_rx_pll_and_datapath_in;
  input INTF0_rst_rx_datapath_in;
  output INTF0_rst_rx_done_out;
endmodule
