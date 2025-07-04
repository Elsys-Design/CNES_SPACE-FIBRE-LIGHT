onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_N
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_TXCLK_N
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK_DL
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_N_DL
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWADDR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWVALID
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWREADY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WDATA
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WSTRB
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WVALID
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WREADY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BREADY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BRESP
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BVALID
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARADDR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARVALID
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARREADY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RREADY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RDATA
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RRESP
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RVALID
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INTERFACE_RST
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_MODE
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PAUSE_VC
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CONTINUOUS_VC
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_START
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/AUTOSTART
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_RESET
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PARALLEL_LOOPBACK_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/STANDBY_REASON
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_SERIAL_LB_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/VC_CREDIT
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_CREDIT_OVERFLOW
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_LONG_ERROR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_SHORT_ERROR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_ERROR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_ERROR
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_LINK_RST
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INPUT_BUFFER_OVFL
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_FINISHED
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_TX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FULL_COUNTER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RETRY_COUNTER_RX
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CURRENT_TIME_SLOT
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST_ASSERTED
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_SEQ_NUM
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_SEQ_NUM
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_STATE
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_CNT
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_OVF
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LOSS_SIGNAL
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_CAPA
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_POLARITY
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_DUT_N
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DL_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_SPY_EN
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RESET_PARAM_DL
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_wr_state
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_rd_state
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_param
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_err_mngt
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_1
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_2
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_1
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_2
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_param
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_status
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_phy_param
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_global
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/vc_credit_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_credit_overflow_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_long_error_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_short_error_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_error_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_error_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_link_rst_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/input_buffer_ovfl_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_start_pulse
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_state_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_cnt_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_ovf_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/loss_signal_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_capa_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_polarity_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_sync_lane
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_dut_lane
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_sync_dl
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_dut_dl
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_sync
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_model
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_finished_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_tx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/full_counter_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/retry_counter_rx_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/current_time_slot_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/link_rst_asserted_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reset_param_dl_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/clear_error_flag
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_seq_num_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_seq_num_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/dl_en_i
add wave -noupdate -group CONFIGURATOR /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_spy_en_i
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/CLK
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/RST_N
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/DATA_RX
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/VALID_K_CHARAC_RX_PPL
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_EMPTY_PPL
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/FIFO_RX_RD_EN_PPL
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/FAR_END_CAPA_DL
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/generation_state
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/control_word_state
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/rxerr_state
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/frame_number
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/frame_size
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/inter_pkt_delay
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/gen_data
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/model_start
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/data_mode
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/busy
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/test_end
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/err_counter
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/busy_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/init_val
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/mask
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_frame
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/val_data
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/prbs_data
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/data_verif
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_start
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/busy_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/test_end_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/err_counter_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/data_verif_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_cont_word
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/busy_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/test_end_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/err_counter_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/data_verif_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/fifo_rx_rd_en_ppl_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_delay_rxerr
add wave -noupdate -expand -group ANALYZERS -group LANE_ANA /configuration_2_bench/I_LANE_ANALYZER/cnt_data_valid
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/tready_i
add wave -noupdate -expand -group ANALYZERS -group DL_ANA_BC /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/eep_detected
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/CLK
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/RST_N
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/DATA_TX
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/NEW_DATA_TX_PPL
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/FIFO_TX_FULL_PPL
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/LANE_RESET_DL
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/VALID_K_CHARAC_TX_PPL
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/CAPABILITY_TX_PPL
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/generation_state
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/control_word_state
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/reg_data_tx_k_charact
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/frame_number
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/frame_size
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/inter_pkt_delay
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/gen_data
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/model_start
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/data_mode
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/busy
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/test_end
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/err_counter
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/busy_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/test_end_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/data_tx_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/init_val
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/cnt_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/cnt_byte
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/mask
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/cnt_delay_frame
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/val_data
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/prbs_data
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/busy_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/test_end_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/err_counter_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/data_tx_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/cnt_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/cnt_delay_cont_word
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/busy_k_charact
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/test_end_k_charact
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/data_tx_k_charact
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/new_data_tx_ppl_k_charact
add wave -noupdate -expand -group GENERATORS -group LANE_GEN /configuration_2_bench/I_LANE_GENERATOR/valid_k_charac_tx_ppl_k_charact
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -expand -group GENERATORS -group DL_GEN_BC /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RST_N
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CLK
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CLK_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RST_TXCLK_N
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CLK_GTY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/TX_POS
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/TX_NEG
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RX_POS
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RX_NEG
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_ACLK_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TREADY_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TDATA_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TUSER_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TLAST_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TVALID_TX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_ACLK_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TREADY_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TDATA_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TUSER_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TLAST_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AXIS_TVALID_RX_DL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CURRENT_TIME_SLOT_NW
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/INTERFACE_RESET
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LINK_RESET
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_RST_EN
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_RST_MODE
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/PAUSE_VC
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CONTINUOUS_VC
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CREDIT_VC
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/INPUT_BUF_OVF_VC
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FCT_CREDIT_OVERFLOW
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CRC_LONG_ERROR
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CRC_SHORT_ERROR
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FRAME_ERROR
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/SEQUENCE_ERROR
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FAR_END_LINK_RESET
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FRAME_FINISHED
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FRAME_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/DATA_COUNTER_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/DATA_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ACK_COUNTER_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_COUNTER_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FCT_COUNTER_TX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ACK_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FCT_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FULL_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RETRY_COUNTER_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CURRENT_TIME_SLOT
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RESET_PARAM
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LINK_RST_ASSERTED
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_SEQ_NUM
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ACK_SEQ_NUM
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/DATA_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ACK_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NACK_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FCT_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FULL_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RETRY_PULSE_RX
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ENABLE_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/DATA_TX_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/CAPABILITY_TX_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NEW_DATA_TX_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/VALID_K_CHARAC_TX_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FIFO_TX_FULL_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LANE_RESET_INJ
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ENABLE_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FIFO_RX_RD_EN_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/DATA_RX_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FIFO_RX_EMPTY_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FIFO_RX_DATA_VALID_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/VALID_K_CHARAC_RX_SPY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LANE_START
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/AUTOSTART
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LANE_RESET
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/STANDBY_REASON
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/NEAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LANE_STATE
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RX_ERROR_CNT
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RX_ERROR_OVF
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/LOSS_SIGNAL
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/FAR_END_CAPA
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/RX_POLARITY
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/rst_sync_gty_n
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/clk_tx_i
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/rst_tx_done
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/capability_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/new_data_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/valid_k_charac_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_tx_full_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_rx_rd_en_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_rx_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_rx_empty_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_rx_data_valid_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/valid_k_charac_rx_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/far_end_capa_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/far_end_capa_dl_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_active_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_reset_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_start_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/autostart_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_reset_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/parallel_loopback_en_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/standby_reason_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/near_end_serial_lb_en_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/far_end_serial_lb_en_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_state_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/rx_error_cnt_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/rx_error_ovf_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/loss_signal_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/rx_polarity_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/interface_reset_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/link_reset_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_rst_en_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_rst_mode_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/pause_vc_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/continuous_vc_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/seq_number_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/seq_number_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/credit_vc_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/input_buf_ovf_vc_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fct_credit_overflow_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/crc_long_error_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/crc_short_error_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/frame_error_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/sequence_error_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/far_end_link_reset_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/frame_finished_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/frame_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_counter_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ack_counter_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_counter_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fct_counter_tx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ack_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fct_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/full_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/retry_counter_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/current_time_slot_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/reset_param_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/link_rst_asserted_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_seq_num_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ack_seq_num_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/ack_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/nack_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fct_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/full_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/retry_pulse_rx_dl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/data_tx_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/capability_tx_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/new_data_tx_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/valid_k_charac_tx_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_tx_full_ppl
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/lane_reset_mux
add wave -noupdate -expand -group DUT -group IP_TOP /configuration_2_bench/spacefibre_instance/fifo_rx_rd_en_demux
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/RST_N
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/CLK
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/RST_TX_DONE
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/INTERNAL_SYNC_RST_N
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/reset_gen_r_n
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/reset_gen_rr_n
add wave -noupdate -expand -group DUT -group RST_RESYNCHRO /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/rst_tx_done_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ARSTN_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ACLK_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TREADY_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TDATA_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TUSER_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TLAST_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TVALID_TX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ARSTN_RX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ACLK_RX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TREADY_RX_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TDATA_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TUSER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TLAST_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TVALID_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CURRENT_TIME_SLOT_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CAPABILITY_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NEW_DATA_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/VALID_K_CHARAC_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_TX_FULL_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_RD_EN_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_RX_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_EMPTY_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/VALID_K_CHARAC_RX_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FAR_END_CAPA_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/LANE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/INTERFACE_RESET_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/LINK_RESET_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_RST_EN_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_RST_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/PAUSE_VC_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CONTINUOUS_VC_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/SEQ_NUMBER_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/SEQ_NUMBER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CREDIT_VC_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/INPUT_BUF_OVF_VC_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_CREDIT_OVERFLOW_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CRC_LONG_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CRC_SHORT_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/SEQUENCE_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FAR_END_LINK_RESET_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_FINISHED_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FULL_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/RETRY_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/CURRENT_TIME_SLOT_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/RESET_PARAM_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/LINK_RST_ASSERTED_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_SEQ_NUM_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_SEQ_NUM_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/FULL_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/RETRY_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/link_reset_dlre
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_ready_dobuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_data_dobuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_valid_k_charac_dobuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_data_valid_dobuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_end_packet_dobuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/req_fct_done_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_done_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_rd_en_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_packet_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/virtual_channel_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/bc_type_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/bc_channel_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/bc_status_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/mult_channel_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_ack_dmac
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_ack_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_denc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dscom
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dscom
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dscom
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dscom
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dscom
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/near_end_rpf_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/req_nack_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/link_reset_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_ack_derrm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_16b_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_8b_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/multiplier_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_all_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxnothing_active_dwi
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/multiplier_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/vc_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_err_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_all_dccheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_fifo_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_err_data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_err_data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_fifo_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_err_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_err_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/fct_far_end_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/m_val_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_err_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/wr_data_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_ack_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/crc_err_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dmbuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_rd_dmbuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_valid_dmbuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/status_busy_flush_dmbuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_fifo_mid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_ddes
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_en_ddes
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/wr_data_bc_dscheck
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_dmbufbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_rd_dmbufbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_valid_dmbufbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/status_busy_flush_dmbufbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/fifo_full_dmbufbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err_fifo_mid_bc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_rd_ddesbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_ddesbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/data_en_ddesbc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/req_fct_dibuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_LINK_TOP /configuration_2_bench/spacefibre_instance/inst_data_link/link_reset_dibuf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(0)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(1)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(2)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(3)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(4)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(5)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(6)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/INPUT_BUF_OVF_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/current_state_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/last_k_char_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/last_k_char_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/req_fct_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/axis_data_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/axis_data_valid_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/axis_data_valid_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/link_reset_dlre_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/fct_send_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_in_buff(7)/inst_data_in_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_TVALID_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_TDATA_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_TLAST_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_TREADY_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/M_AXIS_TUSER_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/DATA_DDESBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/DATA_EN_DDESBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/link_reset_cmd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/data_in
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/data_in_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/cnt_req_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/m_axis_tvalid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/m_axis_tdata
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/m_axis_tlast
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/m_axis_tready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/m_axis_tuser
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INPUT_BUFFERS -group INPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_in_bc_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/DATA_DMBUFBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/DATA_RD_DDESBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/DATA_VALID_DMBUFBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/DATA_DDESBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/DATA_EN_DDESBC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group BC_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation_bc/broadcast_detected
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/WR_CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/WR_DATA
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/FRAME_ERROR
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/END_FRAME
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/RD_CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/RD_DATA
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ram
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ram_level
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/wr_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/full_prev
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_last_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf_bc/ptr_last_valid_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_DMBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_RD_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_VALID_DMBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_EN_DDES
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/data_detected
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_DESENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/vc_nb
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_DATA
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/FRAME_ERROR
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/END_FRAME
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ram
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ram_level
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/wr_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/full_prev
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_last_valid
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group INTERNAL_BUFFER_DATA /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_last_valid_gray
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/RXERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TYPE_FRAME_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/END_FRAME_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/SEQ_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/SEQ_NUM_ACK_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/FAR_END_RPF_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NEAR_END_RPF_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/CRC_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/FRAME_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_ACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_NACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TRANS_POL_FLG_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/SEQ_NUM_ACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_ACK_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/LINK_RESET_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NACK_RST_EN_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NACK_RST_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_nack_request
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_ack_request
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/nack_request_fsm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/ack_request_fsm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/nack_request_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/ack_request_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_far_end_rpf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_seq_err
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/flg_nack_rst_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_seq_num_request
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_seq_num_fsm
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_seq_num_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/near_end_rpf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/trans_pol_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group ERROR_MANAGEMENT /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/ack_pol_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/DATA_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VALID_K_CHARAC_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/TYPE_FRAME_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEW_WORD_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CRC_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FRAME_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/MULTIPLIER_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VC_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RXERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RXERR_ALL_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEAR_END_RPF_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_ACK_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/TYPE_FRAME_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/TRANS_POL_FLG_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CRC_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FRAME_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RXERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/DATA_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VALID_K_CHARAC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEW_WORD_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_FIFO_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FRAME_ERR_DATA_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_ERR_DATA_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CRC_ERR_DATA_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RXERR_DATA_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/DATA_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VALID_K_CHARAC_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEW_WORD_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_FIFO_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FRAME_ERR_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_ERR_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CRC_ERR_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RXERR_BC_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NACK_SEQ_NUM_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/ACK_SEQ_NUM_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/ACK_COUNTER_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NACK_COUNTER_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FCT_COUNTER_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FULL_COUNTER_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/ACK_PULSE_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NACK_PULSE_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FCT_PULSE_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FULL_PULSE_RX_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/seq_num_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/ack_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/nack_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/fct_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/full_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/DATA_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VALID_K_CHARAC_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/NEW_WORD_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/END_FRAME_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/SEQ_NUM_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_16B_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_8B_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/TYPE_FRAME_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/FRAME_ERR_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/MULTIPLIER_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VC_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXERR_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXERR_ALL_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXNOTHING_ACTIVE_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/NEW_WORD_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/DATA_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VALID_K_CHARAC_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/END_FRAME_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/TYPE_FRAME_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/SEQ_NUM_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/FRAME_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/MULTIPLIER_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VC_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXERR_ALL_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_LONG_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_SHORT_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices_tier
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices_dem
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_reg_16b_comp
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_long_err
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_reg_8b_comp
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_CHECKER /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_short_err
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FIFO_RX_RD_EN_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_RX_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/VALID_K_CHARAC_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/TYPE_FRAME_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/NEW_WORD_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/END_FRAME_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/VALID_K_CHARAC_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/SEQ_NUM_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_16B_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_8B_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/MULTIPLIER_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/VC_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RXNOTHING_ACTIVE_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RXERR_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RXERR_ALL_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_ERR_DCCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/SEQ_ERR_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FRAME_ERR_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_COUNTER_RX_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RETRY_COUNTER_RX_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_PULSE_RX_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RETRY_PULSE_RX_DWI
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/current_state_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/receiving_frame
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/type_incom_frame
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/data_word_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/bc_word_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/retry_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sdf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_edf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sbf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_ebf
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sif
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_fct
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_nack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_retry
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_IDENTIFICATION_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_rxerr_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/RESET_PARAM_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LANE_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/NEAR_END_CAPA_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/FAR_END_CAPA_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/INTERFACE_RESET_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/cnt_link_reset
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group LINK_RESET_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/lane_active_ppl_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_1 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(1)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_2 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(2)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_3 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(3)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_4 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(4)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_5 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(5)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_6 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(6)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/M_VAL_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/FCT_FAR_END_DSCHECK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tready_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/s_axis_tready_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/last_k_char
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cmd_flush_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cmd_flush_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/eip_in_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/eip_in_req_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/eip_in_req_reg2
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/eip_out_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cnt_eip
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cnt_eip_out_reg
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/data_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/status_level_rd
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/m_value_for_credit
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/fct_credit_cnt_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/vc_ready
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/rd_en
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/link_reset_dlre_reg1
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/link_reset_dlre_sync
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/flag_last_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_7 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(7)/inst_data_out_buff/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/RST_N
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_ARSTN_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_ACLK_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_TREADY_DL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_TDATA_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_TUSER_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_TLAST_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/S_AXIS_TVALID_NW
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/VALID_K_CHARAC_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/rd_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/rd_data_vld
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/status_busy_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/status_threshold_high
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/status_threshold_low
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/status_full
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/status_empty
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/cnt_cmd_flush
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/vc_end_packet
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/cnt_word_sent
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group OUTPUT_BUFFERS -group OUTPUT_BUFFER_BC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_out_bc_buf/rst_n_fifo
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_ACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_NACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TRANS_POL_FLG_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_ACK_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/SEQ_NUM_ACK_DERRM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_FCT_DIBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_READY_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_DATA_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_VALID_K_CHAR_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_DATA_VALID_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_END_PACKET_DOBUF
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_RD_EN_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_PAUSE_MIB
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_END_EMISSION_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_RUN_EMISSION_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/DATA_COUNTER_TX_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/ACK_COUNTER_TX_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/NACK_COUNTER_TX_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/FCT_COUNTER_TX_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/DATA_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VALID_K_CHAR_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/NEW_WORD_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/END_PACKET_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TYPE_FRAME_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VIRTUAL_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_TYPE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_STATUS_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/MULT_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TRANS_POL_FLG_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/SEQ_NUM_ACK_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_state_vc
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_state_req
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/type_frame
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/idle_data
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/idle_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/ack_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/nack_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/fct_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/data_counter
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/req_ack_done
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/cnt_wait_ack
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/cnt_wait
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_channel
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/DATA_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/VALID_K_CHAR_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/NEW_WORD_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/END_PACKET_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/TYPE_FRAME_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/VIRTUAL_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/BC_TYPE_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/BC_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/BC_STATUS_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/MULT_CHANNEL_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/SEQ_NUM_ACK_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/TRANS_POL_FLG_DMAC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/NEW_WORD_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/DATA_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/VALID_K_CHARAC_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/TYPE_FRAME_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/END_FRAME_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/SEQ_NUM_ACK_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/TRANS_POL_FLG_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/current_state
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/current_state_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/sif_done
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group DATA_ENCAPSULATION /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encapsulation/type_frame_denc_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/NEW_WORD_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/DATA_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/VALID_K_CHARAC_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/TYPE_FRAME_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/END_FRAME_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/SEQ_NUM_ACK_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/TRANS_POL_FLG_DENC
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/NEW_WORD_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/DATA_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/VALID_K_CHARAC_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/TYPE_FRAME_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/END_FRAME_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/SEQ_NUM_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group SEQ_NUM_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/trans_seq_cnt
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/CLK
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/LINK_RESET_DLRE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/LANE_ACTIVE_PPL
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/NEW_WORD_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/DATA_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/VALID_K_CHARAC_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/TYPE_FRAME_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/END_FRAME_DSCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/FIFO_FULL_TX_LANE
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/VALID_K_CHARAC_DCCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/DATA_DCCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/NEW_WORD_DCCOM
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices_tier
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices_dem
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_16b
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_16b_comp
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_to_inv_16b
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_8b
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_8b_comp
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_to_inv_8b
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/end_frame_dscom_prev
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/new_word_dccom_i
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/type_frame_dscom_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/data_dscom_r
add wave -noupdate -expand -group DUT -expand -group DATA_LINK -group CRC_COMPUTE /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/valid_k_charac_dscom_r
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/RST_N
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/CLK
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/ENABLE_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/DATA_TX_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/CAPABILITY_TX_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/NEW_DATA_TX_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/VALID_K_CHARAC_TX_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/FIFO_TX_FULL_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/LANE_RESET_INJ
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/DATA_TX_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/CAPABILITY_TX_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/NEW_DATA_TX_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/VALID_K_CHARAC_TX_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/FIFO_TX_FULL_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/LANE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/DATA_TX_MUX
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/CAPABILITY_TX_MUX
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/NEW_DATA_TX_MUX
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/VALID_K_CHARAC_TX_MUX
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/FIFO_TX_FULL_PPL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group MUX /configuration_2_bench/spacefibre_instance/inst_mux_tx/LANE_RESET_MUX
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/RST_N
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/CLK
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/ENABLE_SPY
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/FIFO_RX_RD_EN_DL
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/FIFO_RX_RD_EN_SPY
add wave -noupdate -expand -group DUT -expand -group INTERLAYER -group DEMUX /configuration_2_bench/spacefibre_instance/inst_demux_rx/FIFO_RX_RD_EN_DEMUX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TXCLK_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_TX_OUT
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TX_DONE
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_GTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_TX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CAPABILITY_TX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEW_DATA_TX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_TX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_TX_FULL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_RD_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_RX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_EMPTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_DATA_VALID
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_RX
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_ACTIVE_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_POS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_NEG
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_NEG
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_START
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/AUTOSTART
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/STANDBY_REASON
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_STATE
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POLARITY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/transmitter_dis_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init1_ctrl_word_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init2_ctrl_word_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init3_ctrl_word_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/enable_transm_data_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_standby_ctrl_words_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_loss_signal_ctrl_word_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_cause_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_state_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_cnt_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_ovf_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/receiver_dis_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/cdr_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_rxerr_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/invert_rx_bits_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_detection_enabled_from_lif
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_from_dl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_fifo
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_empty
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_data_valid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rd_data_en_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/standby_signal_x32_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_signal_x32_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/new_data_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/wait_send_data_from_si
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_si
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_si
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_plb
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_plb
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_plb
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_rsf
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_rsf
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_rsf
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_dl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_fifo_rx
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_new_word_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init1_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init2_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init3_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init1_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init2_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_rxerr_word_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_lost_signal_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_standby_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/comma_k287_rxed_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_lcwd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/far_end_capa_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_TX0_outclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/reset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_ch0_loopback
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrhold
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrovrden
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdata
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdatavalid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxbyterealign
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_hsclk0_lcplllock
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_TX0_ch_txpd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxpd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_rst_tx_done_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/clk_tx
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_in_dl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_in_dl_sync
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_out_dl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/ctrl_out_dl_sync
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_reset_dl_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/capability_tx_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_active_dl_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_in_ctrl_data_valid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -group PHY_PLUS_LANE_TOP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_out_ctrl_data_valid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LANE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/NO_SIGNAL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/RX_NEW_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INIT3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INV_INIT1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_INV_INIT2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_RXERR_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_LOSS_SIGNAL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/DETECTED_STANDBY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/COMMA_K287_RXED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/RECEIVER_DISABLED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/CDR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_RXERR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/INVERT_RX_BITS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/NO_SIGNAL_DETECTION_ENABLED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/STANDBY_SIGNAL_X32
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LOST_SIGNAL_X32
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/TRANSMITTER_DISABLED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT1_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT2_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_INIT3_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/ENABLE_TRANSM_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_32_STANDBY_CTRL_WORDS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/SEND_32_LOSS_SIGNAL_CTRL_WORDS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LOST_CAUSE
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LANE_START
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/AUTOSTART
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LANE_RESET
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/LANE_STATE
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/RX_ERROR_CNT
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/RX_ERROR_OVF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/current_state
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/current_state_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/clear_line_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/clear_line_done
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/cdr_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/enable_init_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rx_words_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rx_new_word_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rx_error_cnt_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rx_error_cnt_ovf_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_rxerr_word_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init_timeout_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init_timeout_reaches
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/loss_signal_x3_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/lost_signal_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/standby_signal_x3_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/standby_signal_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/inv_init1_rxed_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init1_rxed
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init1_rxed_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/inv_init1_rxed_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_init1_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_inv_init1_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/inv_init2_rxed_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/inv_init2_rxed_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init2_rxed
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_init2_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_inv_init2_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init3_rxed_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/init3_rxed_x3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/detected_init3_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/comma_k287_rxed_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rxed_1023_word_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group LANE_INITIALISATON_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_init_fsm/rxed_1023_word
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/WR_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/WR_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/RD_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/RD_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/ram_level
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/wr_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/rd_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/full
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/full_prev
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_FROM_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_in_ctrl/empty
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/WR_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/WR_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/RD_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/ram_level
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/wr_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/rd_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/full
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/full_prev
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_TX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_tx_data/empty
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/RD_DATA_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/RD_DATA_VALID_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/CAPABILITY_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/DATA_TX_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/VALID_K_CHARAC_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/NO_DATA_FROM_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/WAIT_SEND_DATA_FROM_SKIP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/NEW_DATA_TO_SKIP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/DATA_TX_TO_SKIP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/VALID_K_CHARAC_TO_SKIP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT1_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT2_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_INIT3_CTRL_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/ENABLE_TRANSM_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_32_STANDBY_CTRL_WORDS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/STANDBY_REASON
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/SEND_32_LOSS_SIGNAL_CTRL_WORDS
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/LOST_CAUSE
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/STANDBY_SIGNAL_X32
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/LOST_SIGNAL_X32
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/prbs_counter
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/init_word_sent
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/send_stdby_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/send_loss_sig_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_insert/no_data_from_dl_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/NEW_DATA_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/DATA_TX_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/VALID_K_CHARAC_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/WAIT_SEND_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/DATA_TX_TO_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/VALID_K_CHARAC_TO_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/ENABLE_TRANSM_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/words_x5000_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group SKIP_INSERTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_skip_insertion/new_data_from_tcwi_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CARAC_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_FROM_LCWI
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CARAC_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/WAIT_SKIP_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_TX_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/VALID_K_CARAC_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/DATA_RDY_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/wait_skip_data_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/wait_skip_data_rr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group PARALLELE_LOOPBACK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_parallel_loopback/wait_skip_data_rrr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/LANE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RX_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/VALID_K_CARAC_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RDY_TO_LCWD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RX_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/VALID_K_CARAC_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/DATA_RDY_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/INVALID_CHAR_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/DISPARITY_ERR_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/RX_WORD_REALIGN_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/COMMA_DET_FROM_IP
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/LANE_RESET
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/current_state
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/comma_det_from_ip_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/rx_word_realign_from_ip_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/rx_word_realign_from_ip_rr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/data_rx_to_lcwd_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/valid_k_charac_to_lcwd_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/data_rdy_to_lcwd_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/err_word_cnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/err_word_x5
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/valid_symb
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/invalid_symb
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group RX_SYNCHRONISATION_FSM /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_rx_sync_fsm/disparity_err
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/NO_SIGNAL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/RX_NEW_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INIT3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INV_INIT1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_INV_INIT2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_RXERR_WORD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_LOSS_SIGNAL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DETECTED_STANDBY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/COMMA_K287_RXED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/CAPABILITY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/SEND_RXERR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/NO_SIGNAL_DETECTION_ENABLED
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/ENABLE_TRANSM_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RX_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/VALID_K_CARAC_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RDY_FROM_RSF
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RX_TO_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/VALID_K_CARAC_TO_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/DATA_RDY_TO_DL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/data_rx_to_dl_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/valid_k_charac_to_dl_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/data_rdy_to_dl_i
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/enable_transm_data_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group CONTROL_WORD_DETECTION /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_lane_ctrl_word_detect/enable_transm_data_rr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/WR_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/WR_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/RD_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/ram_level
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/wr_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/rd_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/full
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/full_prev
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_DATA_RX /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_rx_data/empty
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/RST_N
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/WR_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/WR_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/WR_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/RD_CLK
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/RD_DATA
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/RD_DATA_EN
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/RD_DATA_VLD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/CMD_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_BUSY_FLUSH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_THRESHOLD_HIGH
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_THRESHOLD_LOW
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_FULL
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_EMPTY
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_LEVEL_WR
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/STATUS_LEVEL_RD
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_wr_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_wr_inc2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_rd_inc
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_wr_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_rd_gray
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_wr_in_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ptr_rd_in_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/ram_level
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/cmd_flush_req
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/cmd_flush_inv
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/cmd_flush_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/cmd_flush_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_inv_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_inv_wr_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_inv_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_inv_rd_r
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_wr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/flush_ack_rd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/wr_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/rd_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/full
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/full_prev
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group LANE -group FIFO_CTRL_TO_DL /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_fifo_out_ctrl/empty
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtce_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtcemask_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtclr_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtclrmask_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/gt_bufgtdiv_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/outclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group BUFFER_GT_CLK /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_bufg_gt_tx_clock/usrclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbufstatus_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyteisaligned_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyterealign_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrhold_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrovrden_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcomsasdet_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl0_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl1_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl2_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl3_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdata_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdatavalid_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpd_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpolarity_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxrate_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clr_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clrb_leaf_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txbufstatus_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl0_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl1_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl2_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txdata
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txpd_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txrate_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clr_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clrb_leaf_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_all_in_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_datapath_in_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_done_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_pll_and_datapath_in_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_datapath_in_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_done_out_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_pll_and_datapath_in_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GTREFCLK0_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpo
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_outclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_usrclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_outclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_usrclk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_hsclk0_lcplllock_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_CH0_DEBUG_0_ch_loopback
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_n
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_p
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_n
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_p
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtpowergood_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group PHY_LAYER_WRAPPER /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtwiz_freerun_clk_0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/gtpowergood
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/gtwiz_freerun_clk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_GTREFCLK0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_TX0_outclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_RX0_outclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_rxp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_rxn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_txp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_txn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_ch0_loopback
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_gpi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_gpo
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_hsclk0_lcplllock
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_TX0_usrclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/QUAD0_RX0_usrclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdata
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txbufstatus
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdccdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_gttxreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdebugpcsout
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprogdivresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txinhibit
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txlatclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmaincursor
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpcsresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpisopd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpmaresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpolarity
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpostcursor
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprbsforceerr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprbssel
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprecursor
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txprogdivreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txrate
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txresetmode
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txheader
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsequence
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcominit
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomsas
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomwake
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapicodeovrden
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapicodereset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdetectrx
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlytstclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txelecidle
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmldchaindone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmldchainreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txoneszeros
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpausedelayalign
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlypd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlyreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphsetinitreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphshift180
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpicodeovrden
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpicodereset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpippmen
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswing
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsyncallin
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_tx10gstat
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txcomfinish
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignerr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdlyalignprog
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphaligndone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignerr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphalignoutrsvd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphdlyresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphsetinitdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txphshift180done
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txsyncdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txctrl2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdeemph
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txmargin
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdiffctrl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txpippmstepsize
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapiresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpisenn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpisenp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswingouthigh
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txswingoutlow
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapireset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txdapiresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpibiasen
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX0_ch_txqpiweakpu
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbufstatus
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrlock
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdebugpcsout
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbserr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbslocked
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrhold
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrovrden
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxlatclk
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpcsresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpmaresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpolarity
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbscntreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxrate
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxresetmode
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdata
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rx10gstat
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdatavalid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxheader
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanisaligned
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanrealign
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchbondi
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchbondo
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxclkcorcnt
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcominitdet
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcommadet
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbyteisaligned
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxbyterealign
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcomsasdet
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcomwakedet
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl0
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl1
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl2
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxctrl3
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapicodeovrden
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapicodereset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignerr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignprog
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdlyalignreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxelecidle
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxeqtraining
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxfinealigndone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxgearboxslip
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxheadervalid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxlpmen
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmldchaindone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmldchainreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxmlfinealignreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxoobreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxosintdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphaligndone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignerr
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphalignresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlypd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlyreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphdlyresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphsetinitreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphshift180
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphshift180done
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxphsetinitdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxslide
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsliderdy
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxstartofseq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxstatus
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsyncallin
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsyncdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxtermination
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxvalid
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbondseq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_busy
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_en
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_master
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_slave
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxchanbond_level
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrbmcdrreq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrfreqos
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrincpctrl
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepdir
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepsq
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_cdrstepsx
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescanreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescantrigger
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_eyescandataerror
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_refdebugout
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapiresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxpkdet
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpisenn
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpisenp
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxsimplexphystatus
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxslipdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_dfehold
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_dfeovrd
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapireset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxdapiresetmask
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxqpien
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrphdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_gtrxreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprogdivresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxresetdone
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxcdrreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprbssel
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX0_ch_rxprogdivreset
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX_clr_out
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_TX_clrb_leaf_out
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX_clr_out
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_RX_clrb_leaf_out
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_all_in
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_pll_and_datapath_in
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_datapath_in
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_tx_done_out
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_pll_and_datapath_in
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_datapath_in
add wave -noupdate -expand -group DUT -expand -group PHY_PLUS_LANE -expand -group PHY -group GTY_IP /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/extended_phy_layer_i/gtwiz_versal_0/INTF0_rst_rx_done_out
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INTERFACE_RESET
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RESET
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_EN
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_MODE
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/PAUSE_VC
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CONTINUOUS_VC
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INTERFACE_RESET_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RESET_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_EN_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_MODE_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/PAUSE_VC_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CONTINUOUS_VC_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CREDIT_VC_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INPUT_BUF_OVF_VC_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_CREDIT_OVERFLOW_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_LONG_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_SHORT_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQUENCE_ERROR_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FAR_END_LINK_RESET_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_FINISHED_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_TX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_COUNTER_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CURRENT_TIME_SLOT_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RESET_PARAM_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RST_ASSERTED_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_SEQ_NUM_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_SEQ_NUM_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_PULSE_RX_DL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CREDIT_VC
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INPUT_BUF_OVF_VC
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_CREDIT_OVERFLOW
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_LONG_ERROR
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_SHORT_ERROR
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_ERROR
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQUENCE_ERROR
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FAR_END_LINK_RESET
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_FINISHED
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_TX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_COUNTER_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CURRENT_TIME_SLOT
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RESET_PARAM
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RST_ASSERTED
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_SEQ_NUM
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_SEQ_NUM
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_DATA_LINK /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_PULSE_RX
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_START
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/AUTOSTART
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_RESET
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/STANDBY_REASON
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_STATE
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_POLARITY
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_START_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/AUTOSTART_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_RESET_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/STANDBY_REASON_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_STATE_FROM_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_CNT_FROM_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_OVF_FROM_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LOSS_SIGNAL_FROM_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_CAPA_FROM_MOD
add wave -noupdate -expand -group DUT -expand -group MIB -group MIB_PHY_PLUS_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_POLARITY_FROM_MOD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {282482558559 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 344
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
WaveRestoreZoom {282414163528 fs} {282570232727 fs}
