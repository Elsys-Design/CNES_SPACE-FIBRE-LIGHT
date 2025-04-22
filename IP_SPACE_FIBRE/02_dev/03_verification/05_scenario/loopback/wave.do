onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_N
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TXCLK_N
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_TX_OUT
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TX_DONE
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_GTY
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_TX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET_DL
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CAPABILITY_TX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEW_DATA_TX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_TX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_TX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_TX_FULL
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_RD_EN
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_RX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_EMPTY
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_DATA_VALID
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_RX
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA_DL
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_ACTIVE_DL
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_POS
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_NEG
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POS
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_NEG
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_START
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/AUTOSTART
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/STANDBY_REASON
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_STATE
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POLARITY
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/transmitter_dis_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init1_ctrl_word_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init2_ctrl_word_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init3_ctrl_word_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/enable_transm_data_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_standby_ctrl_words_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_loss_signal_ctrl_word_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_cause_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_state_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_cnt_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_ovf_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/receiver_dis_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/cdr_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_rxerr_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/invert_rx_bits_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_detection_enabled_from_lif
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_from_dl
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_fifo
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_empty
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_data_valid
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rd_data_en_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/standby_signal_x32_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_signal_x32_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/new_data_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwi
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/wait_send_data_from_si
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_si
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_si
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_plb
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_plb
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_plb
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_rsf
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_rsf
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_rsf
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_dl
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_fifo_rx
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_new_word_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init1_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init2_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init3_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init1_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init2_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_rxerr_word_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_lost_signal_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_standby_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/comma_k287_rxed_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_lcwd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/far_end_capa_i
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_TX0_outclk
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/reset
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxp
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxn
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txp
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txn
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_ch0_loopback
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrhold
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrovrden
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdata
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdatavalid
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxbyterealign
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl0
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl1
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl2
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl3
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_hsclk0_lcplllock
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_TX0_ch_txpd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxpd
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_rst_tx_done_out_0
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/clk_tx
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_in_dl
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_in_dl_sync
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_out_dl
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_out_dl_sync
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_reset_dl_i
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/capability_tx_i
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_active_dl_i
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_in_ctrl_data_valid
add wave -noupdate -expand -group phy_plus_lane /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_out_ctrl_data_valid
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RST_N
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CLK
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CLK_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RST_TXCLK_N
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CLK_GTY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/TX_POS
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/TX_NEG
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RX_POS
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RX_NEG
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_ACLK_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TREADY_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TDATA_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TUSER_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TLAST_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TVALID_TX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_ACLK_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TREADY_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TDATA_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TUSER_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TLAST_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AXIS_TVALID_RX_DL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CURRENT_TIME_SLOT_NW
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/INTERFACE_RESET
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LINK_RESET
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_RST_EN
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_RST_MODE
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/PAUSE_VC
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CONTINUOUS_VC
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CREDIT_VC
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/INPUT_BUF_OVF_VC
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FCT_CREDIT_OVERFLOW
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CRC_LONG_ERROR
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CRC_SHORT_ERROR
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FRAME_ERROR
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/SEQUENCE_ERROR
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FAR_END_LINK_RESET
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FRAME_FINISHED
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FRAME_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/DATA_COUNTER_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/DATA_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ACK_COUNTER_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_COUNTER_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FCT_COUNTER_TX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ACK_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FCT_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FULL_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RETRY_COUNTER_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CURRENT_TIME_SLOT
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RESET_PARAM
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LINK_RST_ASSERTED
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_SEQ_NUM
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ACK_SEQ_NUM
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/DATA_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ACK_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NACK_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FCT_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FULL_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RETRY_PULSE_RX
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ENABLE_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/DATA_TX_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/CAPABILITY_TX_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NEW_DATA_TX_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/VALID_K_CHARAC_TX_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FIFO_TX_FULL_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LANE_RESET_INJ
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ENABLE_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FIFO_RX_RD_EN_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/DATA_RX_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FIFO_RX_EMPTY_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FIFO_RX_DATA_VALID_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/VALID_K_CHARAC_RX_SPY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LANE_START
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/AUTOSTART
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LANE_RESET
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/PARALLEL_LOOPBACK_EN
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/STANDBY_REASON
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FAR_END_SERIAL_LB_EN
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LANE_STATE
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RX_ERROR_CNT
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RX_ERROR_OVF
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/LOSS_SIGNAL
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/FAR_END_CAPA
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/RX_POLARITY
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/rst_sync_gty_n
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/clk_tx_i
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/rst_tx_done
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/capability_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/new_data_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/valid_k_charac_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_tx_full_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_rx_rd_en_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_rx_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_rx_empty_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_rx_data_valid_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/valid_k_charac_rx_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/far_end_capa_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/far_end_capa_dl_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_active_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_reset_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_start_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/autostart_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_reset_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/parallel_loopback_en_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/standby_reason_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/near_end_serial_lb_en_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/far_end_serial_lb_en_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_state_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/rx_error_cnt_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/rx_error_ovf_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/loss_signal_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/rx_polarity_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/interface_reset_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/link_reset_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_rst_en_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_rst_mode_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/pause_vc_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/continuous_vc_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/seq_number_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/seq_number_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/credit_vc_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/input_buf_ovf_vc_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fct_credit_overflow_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/crc_long_error_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/crc_short_error_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/frame_error_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/sequence_error_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/far_end_link_reset_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/frame_finished_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/frame_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_counter_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ack_counter_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_counter_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fct_counter_tx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ack_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fct_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/full_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/retry_counter_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/current_time_slot_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/reset_param_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/link_rst_asserted_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_seq_num_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ack_seq_num_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/ack_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/nack_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fct_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/full_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/retry_pulse_rx_dl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/data_tx_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/capability_tx_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/new_data_tx_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/valid_k_charac_tx_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_tx_full_ppl
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/lane_reset_mux
add wave -noupdate -group spacefibre_light /configuration_2_bench/spacefibre_instance/fifo_rx_rd_en_demux
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/CLK
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/RST_N
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWADDR
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWVALID
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWREADY
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WDATA
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WSTRB
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WVALID
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WREADY
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BREADY
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BRESP
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BVALID
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARADDR
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARVALID
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARREADY
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RREADY
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RDATA
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RRESP
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RVALID
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/VALID_K_CHARAC_RX_PPL
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_EMPTY_PPL
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_RD_EN_PPL
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -expand -group lane_analyzer -radix unsigned /configuration_2_bench/I_LANE_ANALYZER/DATA_RX
add wave -noupdate -expand -group lane_analyzer -radix unsigned /configuration_2_bench/I_LANE_ANALYZER/data_verif
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/err_counter_frame
add wave -noupdate -expand -group lane_analyzer -radix unsigned /configuration_2_bench/I_LANE_ANALYZER/val_data
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/FAR_END_CAPA_DL
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/axi_wr_state
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/axi_rd_state
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/generation_state
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/control_word_state
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/rxerr_state
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/reg_la_config
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/reg_la_control
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/reg_la_status
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/reg_la_init_val
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/frame_number
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/frame_size
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/inter_pkt_delay
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/gen_data
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/model_start
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/data_mode
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/busy
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/test_end
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/err_counter
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/busy_frame
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/test_end_frame
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_frame
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/init_val
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_frame
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_byte
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/mask
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_frame
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/prbs_data
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_start
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/busy_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/test_end_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/err_counter_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/data_verif_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_cont_word
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/busy_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/test_end_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/err_counter_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/data_verif_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_rxerr
add wave -noupdate -expand -group lane_analyzer /configuration_2_bench/I_LANE_ANALYZER/cnt_data_valid
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/CLK
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/RST_N
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWADDR
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_k_charact
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWVALID
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWREADY
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WDATA
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WSTRB
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WVALID
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WREADY
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BREADY
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BRESP
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BVALID
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARADDR
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARVALID
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARREADY
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RREADY
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RDATA
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RRESP
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RVALID
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/DATA_TX
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/NEW_DATA_TX_PPL
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/FIFO_TX_FULL_PPL
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/LANE_RESET_DL
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/VALID_K_CHARAC_TX_PPL
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/CAPABILITY_TX_PPL
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/axi_wr_state
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/axi_rd_state
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/generation_state
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/control_word_state
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_lg_config
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_lg_control
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_lg_status
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_lg_init_val
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_k_charact
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/frame_number
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/frame_size
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/inter_pkt_delay
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/gen_data
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/model_start
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/data_mode
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/busy
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/test_end
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/err_counter
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/busy_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/test_end_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/err_counter_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/data_tx_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/init_val
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/cnt_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/cnt_byte
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/mask
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/cnt_delay_frame
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/val_data
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/prbs_data
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/busy_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/test_end_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/err_counter_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/data_tx_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/cnt_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/cnt_delay_cont_word
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/busy_k_charact
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/test_end_k_charact
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/data_tx_k_charact
add wave -noupdate -expand -group Lane_generator /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_k_charact
add wave -noupdate -expand -group workspace -radix unsigned /configuration_2_bench/I_LANE_GENERATOR/DATA_TX
add wave -noupdate -expand -group workspace /configuration_2_bench/I_LANE_GENERATOR/NEW_DATA_TX_PPL
add wave -noupdate -expand -group workspace /configuration_2_bench/I_LANE_GENERATOR/VALID_K_CHARAC_TX_PPL
add wave -noupdate -expand -group workspace /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -expand -group workspace /configuration_2_bench/I_LANE_ANALYZER/VALID_K_CHARAC_RX_PPL
add wave -noupdate -expand -group workspace /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_RX
add wave -noupdate -expand -group workspace -radix unsigned /configuration_2_bench/I_LANE_ANALYZER/DATA_RX
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {87169713826 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 257
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits fs
update
WaveRestoreZoom {87061746940 fs} {87409350138 fs}
