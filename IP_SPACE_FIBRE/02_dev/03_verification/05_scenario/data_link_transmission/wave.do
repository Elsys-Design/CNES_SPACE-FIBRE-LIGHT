onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_N
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_TXCLK_N
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWADDR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWVALID
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWREADY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WDATA
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WSTRB
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WVALID
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WREADY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BREADY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BRESP
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BVALID
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARADDR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARVALID
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARREADY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RREADY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RDATA
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RRESP
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RVALID
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INTERFACE_RST
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_EN
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_MODE
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PAUSE_VC
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CONTINUOUS_VC
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_START
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/AUTOSTART
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_RESET
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PARALLEL_LOOPBACK_EN
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/STANDBY_REASON
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_SERIAL_LB_EN
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/VC_CREDIT
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_CREDIT_OVERFLOW
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_LONG_ERROR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_SHORT_ERROR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_ERROR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_ERROR
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_LINK_RST
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INPUT_BUFFER_OVFL
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_FINISHED
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_TX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FULL_COUNTER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RETRY_COUNTER_RX
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CURRENT_TIME_SLOT
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST_ASSERTED
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_STATE
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_CNT
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_OVF
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LOSS_SIGNAL
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_CAPA
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_POLARITY
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_DUT_N
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RESET_PARAM_DL
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_wr_state
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_rd_state
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_param
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_1
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_2
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_1
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_2
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_param
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_status
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_phy_param
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_global
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/vc_credit_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_credit_overflow_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_long_error_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_short_error_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_error_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_error_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_link_rst_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/input_buffer_ovfl_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_start_pulse
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_state_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_cnt_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_ovf_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/loss_signal_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_capa_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_polarity_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_sync
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_dut
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_sync
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_model
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_finished_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_tx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/full_counter_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/retry_counter_rx_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/current_time_slot_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/link_rst_asserted_i
add wave -noupdate -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reset_param_dl_i
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_8 /configuration_2_bench/gen_data_link_analyzer(8)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_7 /configuration_2_bench/gen_data_link_analyzer(7)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_6 /configuration_2_bench/gen_data_link_analyzer(6)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_5 /configuration_2_bench/gen_data_link_analyzer(5)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_4 /configuration_2_bench/gen_data_link_analyzer(4)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_3 /configuration_2_bench/gen_data_link_analyzer(3)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_2 /configuration_2_bench/gen_data_link_analyzer(2)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_1 /configuration_2_bench/gen_data_link_analyzer(1)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/CLK
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/RST_N
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWADDR
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_AWREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WDATA
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WSTRB
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_WREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BRESP
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_BVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARADDR
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_ARREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RDATA
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RRESP
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/S_AXI_RVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TDATA
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TVALID
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TREADY
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TLAST
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/TUSER
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/axi_wr_state
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/axi_rd_state
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/generation_state
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_config
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_control
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_status
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_la_init_val
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/reg_data_rx_frame
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/packet_number
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/packet_size
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/gen_data
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/model_start
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/data_mode
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/busy
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/test_end
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/err_counter
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/busy_frame
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/test_end_frame
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/err_counter_frame
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/init_val
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/cnt_packet
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/cnt_byte
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/val_data
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/prbs_data
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/tdata_i
add wave -noupdate -group ANA -group ANA_0 /configuration_2_bench/gen_data_link_analyzer(0)/DATA_LINK_ANALYZER_INST/tuser_i
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_8 /configuration_2_bench/gen_data_link_generator(8)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_7 /configuration_2_bench/gen_data_link_generator(7)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_6 /configuration_2_bench/gen_data_link_generator(6)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_5 /configuration_2_bench/gen_data_link_generator(5)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_4 /configuration_2_bench/gen_data_link_generator(4)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_3 /configuration_2_bench/gen_data_link_generator(3)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_2 /configuration_2_bench/gen_data_link_generator(2)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_1 /configuration_2_bench/gen_data_link_generator(1)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/CLK
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/RST_N
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWADDR
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_AWREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WDATA
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WSTRB
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_WREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BRESP
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_BVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARADDR
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_ARREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RDATA
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RRESP
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/S_AXI_RVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TDATA
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TVALID
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TREADY
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TLAST
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/TUSER
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/axi_wr_state
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/axi_rd_state
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/generation_state
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_config
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_control
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_status
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_lg_init_val
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/reg_data_tx_frame
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/packet_number
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/packet_size
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/gen_data
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/model_start
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/data_mode
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/busy
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/test_end
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/err_counter
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/busy_frame
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/test_end_frame
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/err_counter_frame
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/init_val
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/cnt_byte
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/cnt_packet
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/val_data
add wave -noupdate -group GEN -group GEN_0 /configuration_2_bench/gen_data_link_generator(0)/DATA_LINK_GENERATOR_INST/prbs_data
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RST_N
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CLK
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CLK_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RST_TXCLK_N
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CLK_GTY
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/TX_POS
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/TX_NEG
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RX_POS
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RX_NEG
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_ACLK_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TREADY_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TDATA_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TUSER_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TLAST_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TVALID_TX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_ARSTN_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_ACLK_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TREADY_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TDATA_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TUSER_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TLAST_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AXIS_TVALID_RX_DL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/INTERFACE_RESET
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LINK_RESET
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/NACK_RST_EN
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/NACK_RST_MODE
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/PAUSE_VC
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CONTINUOUS_VC
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/SEQ_NUMBER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CREDIT_VC
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/INPUT_BUF_OVF_VC
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FCT_CREDIT_OVERFLOW
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CRC_LONG_ERROR
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CRC_SHORT_ERROR
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FRAME_ERROR
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/SEQUENCE_ERROR
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FAR_END_LINK_RESET
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FRAME_FINISHED
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FRAME_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/DATA_COUNTER_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/DATA_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/ACK_COUNTER_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/NACK_COUNTER_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FCT_COUNTER_TX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/ACK_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/NACK_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FCT_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FULL_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RETRY_COUNTER_RX
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/CURRENT_TIME_SLOT
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RESET_PARAM
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LINK_RST_ASSERTED
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LANE_START
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/AUTOSTART
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LANE_RESET
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/PARALLEL_LOOPBACK_EN
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/STANDBY_REASON
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FAR_END_SERIAL_LB_EN
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LANE_STATE
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RX_ERROR_CNT
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RX_ERROR_OVF
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/LOSS_SIGNAL
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/FAR_END_CAPA
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/RX_POLARITY
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/rst_sync_gty_n
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/clk_tx_i
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/rst_tx_done
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/data_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/capability_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/new_data_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/valid_k_charac_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fifo_tx_full_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fifo_rx_rd_en_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/data_rx_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fifo_rx_empty_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fifo_rx_data_valid_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/valid_k_charac_rx_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/far_end_capa_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/lane_active_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/lane_reset_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/lane_start_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/autostart_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/lane_reset_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/parallel_loopback_en_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/standby_reason_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/near_end_serial_lb_en_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/far_end_serial_lb_en_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/lane_state_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/rx_error_cnt_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/rx_error_ovf_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/loss_signal_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/rx_polarity_ppl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/interface_reset_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/link_reset_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/nack_rst_en_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/nack_rst_mode_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/pause_vc_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/continuous_vc_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/seq_number_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/seq_number_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/credit_vc_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/input_buf_ovf_vc_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fct_credit_overflow_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/crc_long_error_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/crc_short_error_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/frame_error_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/sequence_error_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/far_end_link_reset_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/frame_finished_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/frame_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/data_counter_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/data_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/ack_counter_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/nack_counter_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fct_counter_tx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/ack_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/nack_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/fct_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/full_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/retry_counter_rx_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/current_time_slot_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/reset_param_dl
add wave -noupdate -group IP_top /configuration_2_bench/spacefibre_instance/link_rst_asserted_dl
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ARSTN_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ACLK_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TREADY_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TDATA_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TUSER_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TLAST_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TVALID_TX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ARSTN_RX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_ACLK_RX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TREADY_RX_NW
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TDATA_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TUSER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TLAST_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/AXIS_TVALID_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CAPABILITY_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/NEW_DATA_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/VALID_K_CHARAC_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_TX_FULL_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_RD_EN_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_RX_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_EMPTY_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/VALID_K_CHARAC_RX_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FAR_END_CAPA_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/LANE_ACTIVE_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/LANE_RESET_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/INTERFACE_RESET_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/LINK_RESET_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_RST_EN_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_RST_MODE_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/PAUSE_VC_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CONTINUOUS_VC_MIB
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/SEQ_NUMBER_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/SEQ_NUMBER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CREDIT_VC_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/INPUT_BUF_OVF_VC_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_CREDIT_OVERFLOW_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CRC_LONG_ERROR_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CRC_SHORT_ERROR_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_ERROR_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/SEQUENCE_ERROR_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FAR_END_LINK_RESET_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_FINISHED_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FRAME_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_COUNTER_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/DATA_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_COUNTER_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_COUNTER_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_COUNTER_TX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/ACK_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/NACK_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FCT_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/FULL_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/RETRY_COUNTER_RX_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CURRENT_TIME_SLOT_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/RESET_PARAM_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/LINK_RST_ASSERTED_DL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_fct_dibuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_fct_done_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_ddes
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_en_ddes
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dmbuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_rd_dmbuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_valid_dmbuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/fct_far_end_ddes
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/m_val_ddes
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dscheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dscheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dscheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dscheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/status_busy_flush_dmbuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/fifo_full_dmbuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/near_end_rpf_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_err_dscheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/seq_num_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/crc_16b_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/crc_8b_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/crc_err_dccheck
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_nack_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_done_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/link_reset_dlre
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_ready_dobuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_data_dobuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_valid_k_charac_dobuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_data_valid_dobuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_end_packet_dobuf
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/vc_rd_en_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_packet_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/virtual_channel_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/bc_type_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/bc_channel_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/bc_status_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/mult_channel_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_denc
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_denc
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_denc
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_denc
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_denc
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/new_word_dscom
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/data_dscom
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/valid_k_charac_dscom
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/type_frame_dscom
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/end_frame_dscom
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/wr_data_dmbuf
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_N
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TXCLK_N
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_TX_OUT
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RST_TX_DONE
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CLK_GTY
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_TX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET_DL
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/CAPABILITY_TX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEW_DATA_TX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_TX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_TX_FULL
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_RD_EN
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/DATA_RX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_EMPTY
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FIFO_RX_DATA_VALID
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/VALID_K_CHARAC_RX
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA_DL
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_ACTIVE_DL
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_POS
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/TX_NEG
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POS
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_NEG
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_START
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/AUTOSTART
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_RESET
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/STANDBY_REASON
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LANE_STATE
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/RX_POLARITY
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/transmitter_dis_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init1_ctrl_word_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init2_ctrl_word_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_init3_ctrl_word_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/enable_transm_data_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_standby_ctrl_words_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_32_loss_signal_ctrl_word_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_cause_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lane_state_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_cnt_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_error_ovf_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/receiver_dis_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/cdr_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/send_rxerr_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/invert_rx_bits_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_detection_enabled_from_lif
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_from_dl
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_fifo
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_empty
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/fifo_tx_data_valid
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rd_data_en_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/standby_signal_x32_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/lost_signal_x32_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/new_data_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwi
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/wait_send_data_from_si
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_si
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_si
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_tx_from_plb
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_plb
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_plb
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_rsf
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_rsf
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_rsf
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_dl
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_plus_k_char_to_fifo_rx
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/no_signal_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/rx_new_word_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init1_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init2_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_init3_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init1_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_inv_init2_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_rxerr_word_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_lost_signal_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/detected_standby_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/comma_k287_rxed_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rx_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/valid_k_charac_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/data_rdy_from_lcwd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/far_end_capa_i
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_TX0_outclk
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/reset
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxp
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_rxn
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txp
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_txn
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_ch0_loopback
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrhold
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxcdrovrden
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdata
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxdatavalid
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxbyterealign
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl0
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl1
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl2
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxctrl3
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/QUAD0_hsclk0_lcplllock
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_TX0_ch_txpd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_RX0_ch_rxpd
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/INTF0_rst_tx_done_out_0
add wave -noupdate -group LANE /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/clk_tx
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbufstatus_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyteisaligned_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxbyterealign_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrhold_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcdrovrden_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxcomsasdet_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl0_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl1_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl2_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxctrl3_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdata_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxdatavalid_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpd_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxpolarity_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX0_ch_rxrate_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clr_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_RX_clrb_leaf_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txbufstatus_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl0_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl1_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txctrl2_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txdata
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txpd_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX0_ch_txrate_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clr_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_TX_clrb_leaf_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_all_in_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_datapath_in_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_done_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_rx_pll_and_datapath_in_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_datapath_in_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_done_out_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/INTF0_rst_tx_pll_and_datapath_in_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GTREFCLK0_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpi
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_GT_DEBUG_0_gpo
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_outclk_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_RX0_usrclk_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_outclk_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_TX0_usrclk_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/QUAD0_hsclk0_lcplllock_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_CH0_DEBUG_0_ch_loopback
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_n
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_grx_p
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_n
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/Quad0_GT_Serial_0_gtx_p
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtpowergood_0
add wave -noupdate -group PHY_wrapper /configuration_2_bench/spacefibre_instance/inst_phy_plus_lane/inst_extended_phy_layer_wrapper/gtwiz_freerun_clk_0
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INTERFACE_RESET
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RESET
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_EN
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_MODE
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/PAUSE_VC
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CONTINUOUS_VC
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INTERFACE_RESET_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RESET_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_EN_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_RST_MODE_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/PAUSE_VC_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CONTINUOUS_VC_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CREDIT_VC_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INPUT_BUF_OVF_VC_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_CREDIT_OVERFLOW_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_LONG_ERROR_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_SHORT_ERROR_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_ERROR_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQUENCE_ERROR_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FAR_END_LINK_RESET_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_FINISHED_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_TX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_COUNTER_RX_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CURRENT_TIME_SLOT_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RESET_PARAM_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RST_ASSERTED_DL
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQ_NUMBER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CREDIT_VC
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/INPUT_BUF_OVF_VC
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_CREDIT_OVERFLOW
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_LONG_ERROR
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CRC_SHORT_ERROR
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_ERROR
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/SEQUENCE_ERROR
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FAR_END_LINK_RESET
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_FINISHED
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FRAME_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/DATA_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_TX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/ACK_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/NACK_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FCT_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/FULL_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RETRY_COUNTER_RX
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/CURRENT_TIME_SLOT
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/RESET_PARAM
add wave -noupdate -group MIB_DL /configuration_2_bench/spacefibre_instance/inst_mib_data_link/LINK_RST_ASSERTED
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_START
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/AUTOSTART
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_RESET
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/STANDBY_REASON
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_STATE
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_CNT
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_OVF
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LOSS_SIGNAL
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_CAPA
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_POLARITY
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_START_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/AUTOSTART_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_RESET_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/PARALLEL_LOOPBACK_EN_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/STANDBY_REASON_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/NEAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_SERIAL_LB_EN_TO_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LANE_STATE_FROM_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_CNT_FROM_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_ERROR_OVF_FROM_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/LOSS_SIGNAL_FROM_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/FAR_END_CAPA_FROM_MOD
add wave -noupdate -group MIB_LANE /configuration_2_bench/spacefibre_instance/inst_mib_phy_plus_lane/RX_POLARITY_FROM_MOD
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/RST_N
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/CLK
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/RST_TX_DONE
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/INTERNAL_SYNC_RST_N
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/reset_gen_r_n
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/reset_gen_rr_n
add wave -noupdate -group Resync /configuration_2_bench/spacefibre_instance/inst_reset_sync_clk_from_GTY/rst_tx_done_r
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/RST_N
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/CLK
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/NEW_WORD_DENC
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/DATA_DENC
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/VALID_K_CHARAC_DENC
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/TYPE_FRAME_DENC
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/END_FRAME_DENC
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/NEW_WORD_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/DATA_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/VALID_K_CHARAC_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/TYPE_FRAME_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/END_FRAME_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/SEQ_NUM_DSCOM
add wave -noupdate -group SEQ_NUM_Compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_compute/trans_seq_cnt
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/RST_N
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/CLK
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/DATA_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/VALID_K_CHAR_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/NEW_WORD_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/END_PACKET_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/TYPE_FRAME_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/VIRTUAL_CHANNEL_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/BC_TYPE_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/BC_CHANNEL_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/BC_STATUS_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/MULT_CHANNEL_DMAC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/NEW_WORD_DENC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/DATA_DENC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/VALID_K_CHARAC_DENC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/TYPE_FRAME_DENC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/END_FRAME_DENC
add wave -noupdate -group Data_Encapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_encpasulation/current_state
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/RST_N
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/CLK
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/LINK_RESET_DLRE
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_ARSTN_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_ACLK_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TREADY_DL
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TDATA_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TUSER_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TLAST_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/S_AXIS_TVALID_NW
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_READY_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/DATA_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VALID_K_CHARAC_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/DATA_VALID_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/END_PACKET_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_RD_EN_DMAC
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/M_VAL_DDES
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/FCT_FAR_END_DDES
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/LANE_ACTIVE_ST_PPL
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/FCT_CC_OVF_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/CREDIT_VC_DOBUF
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/VC_CONT_MODE_MIB
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/current_state
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rd_data
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/rd_data_vld
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_busy_flush
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_threshold_high
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_threshold_low
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_full
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/status_empty
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tdata_i
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tuser_i
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tlast_i
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/s_axis_tvalid_i
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cont_mode_flg
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/last_k_char
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cmd_flush
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/fct_credit_cnt
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_out
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_in_req
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/eip_out_ack
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_eip
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_eip_out
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/data_out
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/valid_k_char_out
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/vc_end_packet
add wave -noupdate -group Output_Buf_0 /configuration_2_bench/spacefibre_instance/inst_data_link/gen_data_out_buff(0)/inst_data_out_buff/cnt_word_sent
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/RST_N
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/CLK
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DLRE
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/RESET_PARAM_DLRE
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DIBUF
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_DERRM
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LANE_RESET_DLRE
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/NEAR_END_CAPA_DLRE
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LANE_ACTIVE_PPL
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/FAR_END_CAPA_PPL
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/INTERFACE_RESET_MIB
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/LINK_RESET_MIB
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/current_state
add wave -noupdate -group Link_Reset_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_link_reset/cnt_link_reset
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/CLK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/RST_N
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TYPE_FRAME_DWI
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/RXERR_DWI
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TYPE_FRAME_DCCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TYPE_FRAME_DSCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/END_FRAME_DSCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/SEQ_ERR_DSCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/FAR_END_RPF_DSCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NEAR_END_RPF_DERRM
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/FRAME_ERR_DSCHECK
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_ACK_DERRM
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_NACK_DERRM
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/TRANS_POL_FLG_DERRM
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/REQ_ACK_DONE_DMAC
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/LINK_RESET_DERRM
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NACK_RST_EN_MIB
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/NACK_RST_MODE_MIB
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/state
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_nack_request
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_ack_request
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/nack_request_fsm
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/ack_request_fsm
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/nack_request_out
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/ack_request_out
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_far_end_rpf
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/s_seq_err
add wave -noupdate -group Error_Mngmt /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_err_management/flg_nack_rst_flg
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RST_N
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CLK
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/LINK_RESET_DLRE
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FIFO_RX_DATA_VALID_PPL
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FIFO_RX_RD_EN_DL
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_RX_PPL
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/VALID_K_CHARAC_PPL
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/TYPE_FRAME_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/NEW_WORD_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/END_FRAME_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/VALID_K_CHARAC_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/SEQ_NUM_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_16B_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_8B_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/CRC_ERR_DCCHECK
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/SEQ_ERR_DSCHECK
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FRAME_ERR_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RXERR_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/DATA_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/ACK_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/NACK_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FCT_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/FULL_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/RETRY_COUNTER_RX_DWI
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/current_state
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/current_state_r
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/receiving_frame
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/type_incom_frame
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/data_word_cnt
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/bc_word_cnt
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sdf
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_edf
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sbf
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_ebf
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_sif
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_fct
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_ack
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_nack
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_full
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_retry
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/detected_rxerr_i
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/ack_counter
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/nack_counter
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/fct_counter
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/full_counter
add wave -noupdate -group word_id_FSM /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_word_id_fsm/retry_counter
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/RST_N
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CLK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/DATA_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VALID_K_CHARAC_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/TYPE_FRAME_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEW_WORD_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/CRC_ERR_DCCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEAR_END_RPF_DERRM
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_ERR_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/DATA_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/VALID_K_CHARAC_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/NEW_WORD_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/END_FRAME_FIFO_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FIFO_FULL_DMBUF
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/FRAME_ERR_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/SEQ_NUM_DSCHECK
add wave -noupdate -group SEQ_NUM_Check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_seq_check/seq_num_cnt
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RST_N
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_CLK
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_DATA
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/WR_DATA_EN
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/FRAME_ERROR
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/END_FRAME
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_CLK
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA_EN
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/RD_DATA_VLD
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/CMD_FLUSH
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_BUSY_FLUSH
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_THRESHOLD_HIGH
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_THRESHOLD_LOW
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_FULL
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_EMPTY
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_LEVEL_WR
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/STATUS_LEVEL_RD
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ram
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_inc
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_inc2
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_inc
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_gray
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_gray
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_wr_in_rd
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_rd_in_wr
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ram_level
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_req
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv_wr
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/cmd_flush_inv_rd
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_wr
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_wr_r
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_rd
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_inv_rd_r
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_wr
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/flush_ack_rd
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/wr_en
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/rd_en
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/full
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/full_prev
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/empty
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/bad_frame
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_last_valid
add wave -noupdate -group Buffer_interne /configuration_2_bench/spacefibre_instance/inst_data_link/inst_mid_buf/ptr_last_valid_gray
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/RST_N
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/CLK
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_DMBUF
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_RD_DDES
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_VALID_DMBUF
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/FCT_FAR_END_DDES
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/M_VAL_DDES
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_DDES
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/DATA_EN_DDES
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/data_detected
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/broadcast_detected
add wave -noupdate -group Data_Desencapsulation /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_desencapsulation/vc_nb
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/RST_N
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/CLK
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/LANE_ACTIVE_PPL
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_ACK_DERRM
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_NACK_DERRM
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TRANS_POL_FLG_DERRM
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_ACK_DONE_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/SEQ_NUM_ACK_DERRM
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_FCT_DIBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/REQ_FCT_DONE_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_READY_DOBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_DATA_DOBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_VALID_K_CHAR_DOBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_DATA_VALID_DOBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_END_PACKET_DOBUF
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_RD_EN_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_PAUSE_MIB
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_END_EMISSION_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VC_RUN_EMISSION_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/DATA_COUNTER_TX_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/ACK_COUNTER_TX_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/NACK_COUNTER_TX_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/FCT_COUNTER_TX_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/DATA_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VALID_K_CHAR_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/NEW_WORD_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/END_PACKET_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TYPE_FRAME_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/VIRTUAL_CHANNEL_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_TYPE_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_CHANNEL_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/BC_STATUS_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/MULT_CHANNEL_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/TRANS_POL_FLG_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/SEQ_NUM_ACK_DMAC
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_state_vc
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_state_req
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/type_frame
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/idle_data
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/idle_cnt
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/ack_counter
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/nack_counter
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/fct_counter
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/data_counter
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/req_ack_done
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/cnt_wait_ack
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/cnt_wait
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/test
add wave -noupdate -expand -group MAC /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_mac/current_channel
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RST_N
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CLK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/DATA_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VALID_K_CHARAC_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/NEW_WORD_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/END_FRAME_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/SEQ_NUM_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_16B_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_8B_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/TYPE_FRAME_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/FRAME_ERR_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/RXNOTHING_ACTIVE_DWI
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/NEW_WORD_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/DATA_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/VALID_K_CHARAC_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/END_FRAME_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/TYPE_FRAME_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/SEQ_NUM_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_ERR_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/FRAME_ERR_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_LONG_ERR_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/CRC_SHORT_ERR_DCCHECK
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices_tier
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/indices_dem
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_reg_16b_comp
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_long_err
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_reg_8b_comp
add wave -noupdate -group CRC_check /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_check/crc_short_err
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/RST_N
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/CLK
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/LANE_ACTIVE_PPL
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/NEW_WORD_DSCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/DATA_DSCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/VALID_K_CHARAC_DSCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/TYPE_FRAME_DSCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/END_FRAME_DSCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/FIFO_FULL_TX_LANE
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/VALID_K_CHARAC_DCCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/DATA_DCCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/NEW_WORD_DCCOM
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices_tier
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/indices_dem
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_16b
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_16b_comp
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_16b_check
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_to_inv_16b
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_8b
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_reg_8b_comp
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/crc_to_inv_8b
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/end_frame_dscom_prev
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/new_word_dccom_i
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/type_frame_dscom_r
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/data_dscom_r
add wave -noupdate -expand -group CRC_compute /configuration_2_bench/spacefibre_instance/inst_data_link/inst_data_crc_compute/valid_k_charac_dscom_r
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {188724497992 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 210
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
WaveRestoreZoom {188724497992 fs} {191502008032 fs}
