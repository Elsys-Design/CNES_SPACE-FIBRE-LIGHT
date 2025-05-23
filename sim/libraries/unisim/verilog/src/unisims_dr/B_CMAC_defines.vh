// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     mk_defines_vh 3.0001
//    Built On:     Thu Sep 18 13:16:14 2014
//    Bundle:       CMAC
//    Architecture: olympus
//    Snapshot Dir: /tmp/_sdJTys676
// Environment Variables:
//    XILENV=""
//    MYXILENV=""
//

`ifdef B_CMAC_DEFINES_VH
`else
`define B_CMAC_DEFINES_VH

// Look-up table parameters
//

`define CMAC_ADDR_N  80
`define CMAC_ADDR_SZ 32
`define CMAC_DATA_SZ 64

// Attribute addresses
//

`define CMAC__CTL_PTP_TRANSPCLK_MODE   	32'h0000	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_PTP_TRANSPCLK_MODE_SZ	40

`define CMAC__CTL_RX_CHECK_ACK   	32'h0001	// Type=BOOLSTRING; Values=TRUE,FALSE
`define CMAC__CTL_RX_CHECK_ACK_SZ	40

`define CMAC__CTL_RX_CHECK_PREAMBLE   	32'h0002	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_RX_CHECK_PREAMBLE_SZ	40

`define CMAC__CTL_RX_CHECK_SFD   	32'h0003	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_RX_CHECK_SFD_SZ	40

`define CMAC__CTL_RX_DELETE_FCS   	32'h0004	// Type=BOOLSTRING; Values=TRUE,FALSE
`define CMAC__CTL_RX_DELETE_FCS_SZ	40

`define CMAC__CTL_RX_ETYPE_GCP   	32'h0005	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_ETYPE_GCP_SZ	16

`define CMAC__CTL_RX_ETYPE_GPP   	32'h0006	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_ETYPE_GPP_SZ	16

`define CMAC__CTL_RX_ETYPE_PCP   	32'h0007	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_ETYPE_PCP_SZ	16

`define CMAC__CTL_RX_ETYPE_PPP   	32'h0008	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_ETYPE_PPP_SZ	16

`define CMAC__CTL_RX_FORWARD_CONTROL   	32'h0009	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_RX_FORWARD_CONTROL_SZ	40

`define CMAC__CTL_RX_IGNORE_FCS   	32'h000a	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_RX_IGNORE_FCS_SZ	40

`define CMAC__CTL_RX_MAX_PACKET_LEN   	32'h000b	// Type=HEX; Min=15'h0000, Max=15'h3fff
`define CMAC__CTL_RX_MAX_PACKET_LEN_SZ	15

`define CMAC__CTL_RX_MIN_PACKET_LEN   	32'h000c	// Type=HEX; Min=8'h00, Max=8'hff
`define CMAC__CTL_RX_MIN_PACKET_LEN_SZ	8

`define CMAC__CTL_RX_OPCODE_GPP   	32'h000d	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_GPP_SZ	16

`define CMAC__CTL_RX_OPCODE_MAX_GCP   	32'h000e	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_MAX_GCP_SZ	16

`define CMAC__CTL_RX_OPCODE_MAX_PCP   	32'h000f	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_MAX_PCP_SZ	16

`define CMAC__CTL_RX_OPCODE_MIN_GCP   	32'h0010	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_MIN_GCP_SZ	16

`define CMAC__CTL_RX_OPCODE_MIN_PCP   	32'h0011	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_MIN_PCP_SZ	16

`define CMAC__CTL_RX_OPCODE_PPP   	32'h0012	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_OPCODE_PPP_SZ	16

`define CMAC__CTL_RX_PAUSE_DA_MCAST   	32'h0013	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_RX_PAUSE_DA_MCAST_SZ	48

`define CMAC__CTL_RX_PAUSE_DA_UCAST   	32'h0014	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_RX_PAUSE_DA_UCAST_SZ	48

`define CMAC__CTL_RX_PAUSE_SA   	32'h0015	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_RX_PAUSE_SA_SZ	48

`define CMAC__CTL_RX_PROCESS_LFI   	32'h0016	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_RX_PROCESS_LFI_SZ	40

`define CMAC__CTL_RX_VL_LENGTH_MINUS1   	32'h0017	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_RX_VL_LENGTH_MINUS1_SZ	16

`define CMAC__CTL_RX_VL_MARKER_ID0   	32'h0018	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID0_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID1   	32'h0019	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID1_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID10   	32'h001a	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID10_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID11   	32'h001b	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID11_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID12   	32'h001c	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID12_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID13   	32'h001d	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID13_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID14   	32'h001e	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID14_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID15   	32'h001f	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID15_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID16   	32'h0020	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID16_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID17   	32'h0021	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID17_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID18   	32'h0022	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID18_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID19   	32'h0023	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID19_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID2   	32'h0024	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID2_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID3   	32'h0025	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID3_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID4   	32'h0026	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID4_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID5   	32'h0027	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID5_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID6   	32'h0028	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID6_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID7   	32'h0029	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID7_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID8   	32'h002a	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID8_SZ	64

`define CMAC__CTL_RX_VL_MARKER_ID9   	32'h002b	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_RX_VL_MARKER_ID9_SZ	64

`define CMAC__CTL_TEST_MODE_PIN_CHAR   	32'h002c	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_TEST_MODE_PIN_CHAR_SZ	40

`define CMAC__CTL_TX_DA_GPP   	32'h002d	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_TX_DA_GPP_SZ	48

`define CMAC__CTL_TX_DA_PPP   	32'h002e	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_TX_DA_PPP_SZ	48

`define CMAC__CTL_TX_ETHERTYPE_GPP   	32'h002f	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_TX_ETHERTYPE_GPP_SZ	16

`define CMAC__CTL_TX_ETHERTYPE_PPP   	32'h0030	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_TX_ETHERTYPE_PPP_SZ	16

`define CMAC__CTL_TX_FCS_INS_ENABLE   	32'h0031	// Type=BOOLSTRING; Values=TRUE,FALSE
`define CMAC__CTL_TX_FCS_INS_ENABLE_SZ	40

`define CMAC__CTL_TX_IGNORE_FCS   	32'h0032	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_TX_IGNORE_FCS_SZ	40

`define CMAC__CTL_TX_OPCODE_GPP   	32'h0033	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_TX_OPCODE_GPP_SZ	16

`define CMAC__CTL_TX_OPCODE_PPP   	32'h0034	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_TX_OPCODE_PPP_SZ	16

`define CMAC__CTL_TX_PTP_1STEP_ENABLE   	32'h0035	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__CTL_TX_PTP_1STEP_ENABLE_SZ	40

`define CMAC__CTL_TX_PTP_LATENCY_ADJUST   	32'h0036	// Type=HEX; Min=11'h000, Max=11'h7ff
`define CMAC__CTL_TX_PTP_LATENCY_ADJUST_SZ	11

`define CMAC__CTL_TX_SA_GPP   	32'h0037	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_TX_SA_GPP_SZ	48

`define CMAC__CTL_TX_SA_PPP   	32'h0038	// Type=HEX; Min=48'h000000000000, Max=48'hffffffffffff
`define CMAC__CTL_TX_SA_PPP_SZ	48

`define CMAC__CTL_TX_VL_LENGTH_MINUS1   	32'h0039	// Type=HEX; Min=16'h0000, Max=16'hffff
`define CMAC__CTL_TX_VL_LENGTH_MINUS1_SZ	16

`define CMAC__CTL_TX_VL_MARKER_ID0   	32'h003a	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID0_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID1   	32'h003b	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID1_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID10   	32'h003c	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID10_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID11   	32'h003d	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID11_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID12   	32'h003e	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID12_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID13   	32'h003f	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID13_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID14   	32'h0040	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID14_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID15   	32'h0041	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID15_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID16   	32'h0042	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID16_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID17   	32'h0043	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID17_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID18   	32'h0044	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID18_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID19   	32'h0045	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID19_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID2   	32'h0046	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID2_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID3   	32'h0047	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID3_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID4   	32'h0048	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID4_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID5   	32'h0049	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID5_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID6   	32'h004a	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID6_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID7   	32'h004b	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID7_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID8   	32'h004c	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID8_SZ	64

`define CMAC__CTL_TX_VL_MARKER_ID9   	32'h004d	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define CMAC__CTL_TX_VL_MARKER_ID9_SZ	64

`define CMAC__SIM_VERSION   	32'h004e	// Type=STRING; Values=2.0,1.0
`define CMAC__SIM_VERSION_SZ	24

`define CMAC__TEST_MODE_PIN_CHAR   	32'h004f	// Type=BOOLSTRING; Values=FALSE,TRUE
`define CMAC__TEST_MODE_PIN_CHAR_SZ	40

`endif  // B_CMAC_DEFINES_VH
