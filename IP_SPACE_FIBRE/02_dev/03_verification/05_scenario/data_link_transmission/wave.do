onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_N
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CLK_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_TXCLK_N
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWADDR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWVALID
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_AWREADY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WDATA
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WSTRB
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WVALID
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_WREADY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BREADY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BRESP
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_BVALID
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARADDR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARVALID
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_ARREADY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RREADY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RDATA
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RRESP
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/S_AXI_RVALID
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INTERFACE_RST
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_EN
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_RST_MODE
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PAUSE_VC
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CONTINUOUS_VC
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_START
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/AUTOSTART
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_RESET
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/PARALLEL_LOOPBACK_EN
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/STANDBY_REASON
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NEAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_SERIAL_LB_EN
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/VC_CREDIT
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_CREDIT_OVERFLOW
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_LONG_ERROR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CRC_SHORT_ERROR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_ERROR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_ERROR
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_LINK_RST
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/SEQ_NUMBER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/INPUT_BUFFER_OVFL
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FRAME_FINISHED
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/DATA_CNT_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_TX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ACK_COUNTER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/NACK_COUNTER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FCT_COUNTER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FULL_COUNTER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RETRY_COUNTER_RX
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/CURRENT_TIME_SLOT
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LINK_RST_ASSERTED
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LANE_STATE
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_CNT
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_ERROR_OVF
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/LOSS_SIGNAL
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/FAR_END_CAPA
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RX_POLARITY
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RST_DUT_N
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/RESET_PARAM_DL
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_wr_state
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/axi_rd_state
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_param
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_1
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_status_2
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_1
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_dl_qos_2
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_param
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_lane_status
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_phy_param
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reg_global
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/vc_credit_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_credit_overflow_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_long_error_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/crc_short_error_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_error_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_error_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_link_rst_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/seq_number_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/input_buffer_ovfl_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_start_pulse
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/lane_state_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_cnt_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_error_ovf_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/loss_signal_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/far_end_capa_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/rx_polarity_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_sync
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/outputs_to_dut
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_sync
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/inputs_to_model
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/frame_finished_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/data_cnt_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_tx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/ack_counter_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/nack_counter_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/fct_counter_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/full_counter_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/retry_counter_rx_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/current_time_slot_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/link_rst_asserted_i
add wave -noupdate -expand -group CON /configuration_2_bench/DATA_LINK_CONFIGURATOR_INST/reset_param_dl_i
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
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/RST_N_PPL
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/CLK_PPL
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
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/frame_err
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/rxerr_dwi
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_nack_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/trans_pol_flg_derrm
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/req_ack_done_dmac
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/link_reset_dlre
add wave -noupdate -group DL_top /configuration_2_bench/spacefibre_instance/inst_data_link/near_end_capa_dlre
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61827511330 fs} 0}
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
WaveRestoreZoom {36118890499 fs} {127134718750 fs}
