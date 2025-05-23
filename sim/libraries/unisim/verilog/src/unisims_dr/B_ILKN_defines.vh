// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     mk_defines_vh 3.0001
//    Built On:     Thu Sep 18 13:16:45 2014
//    Bundle:       ILMAC
//    Architecture: olympus
//    Snapshot Dir: /tmp/g0pXRpvWTC
// Environment Variables:
//    XILENV=""
//    MYXILENV=""
//

`ifdef B_ILKN_DEFINES_VH
`else
`define B_ILKN_DEFINES_VH

// Look-up table parameters
//

`define ILKN_ADDR_N  26
`define ILKN_ADDR_SZ 32
`define ILKN_DATA_SZ 40

// Attribute addresses
//

`define ILKN__BYPASS   	32'h0000	// Type=BOOLSTRING; Values=FALSE,TRUE
`define ILKN__BYPASS_SZ	40

`define ILKN__CTL_RX_BURSTMAX   	32'h0001	// Type=HEX; Min=2'h0, Max=2'h3
`define ILKN__CTL_RX_BURSTMAX_SZ	2

`define ILKN__CTL_RX_CHAN_EXT   	32'h0002	// Type=HEX; Min=2'h0, Max=2'h3
`define ILKN__CTL_RX_CHAN_EXT_SZ	2

`define ILKN__CTL_RX_LAST_LANE   	32'h0003	// Type=HEX; Min=4'h0, Max=4'hb
`define ILKN__CTL_RX_LAST_LANE_SZ	4

`define ILKN__CTL_RX_MFRAMELEN_MINUS1   	32'h0004	// Type=HEX; Min=16'h00ff, Max=16'h1fff
`define ILKN__CTL_RX_MFRAMELEN_MINUS1_SZ	16

`define ILKN__CTL_RX_PACKET_MODE   	32'h0005	// Type=BOOLSTRING; Values=TRUE,FALSE
`define ILKN__CTL_RX_PACKET_MODE_SZ	40

`define ILKN__CTL_RX_RETRANS_MULT   	32'h0006	// Type=HEX; Min=3'h0, Max=3'h5
`define ILKN__CTL_RX_RETRANS_MULT_SZ	3

`define ILKN__CTL_RX_RETRANS_RETRY   	32'h0007	// Type=HEX; Min=4'h2, Max=4'hf
`define ILKN__CTL_RX_RETRANS_RETRY_SZ	4

`define ILKN__CTL_RX_RETRANS_TIMER1   	32'h0008	// Type=HEX; Min=16'h0000, Max=16'hffff
`define ILKN__CTL_RX_RETRANS_TIMER1_SZ	16

`define ILKN__CTL_RX_RETRANS_TIMER2   	32'h0009	// Type=HEX; Min=16'h0000, Max=16'hffff
`define ILKN__CTL_RX_RETRANS_TIMER2_SZ	16

`define ILKN__CTL_RX_RETRANS_WDOG   	32'h000a	// Type=HEX; Min=12'h000, Max=12'hfff
`define ILKN__CTL_RX_RETRANS_WDOG_SZ	12

`define ILKN__CTL_RX_RETRANS_WRAP_TIMER   	32'h000b	// Type=HEX; Min=8'h00, Max=8'hff
`define ILKN__CTL_RX_RETRANS_WRAP_TIMER_SZ	8

`define ILKN__CTL_TEST_MODE_PIN_CHAR   	32'h000c	// Type=BOOLSTRING; Values=FALSE,TRUE
`define ILKN__CTL_TEST_MODE_PIN_CHAR_SZ	40

`define ILKN__CTL_TX_BURSTMAX   	32'h000d	// Type=HEX; Min=2'h0, Max=2'h3
`define ILKN__CTL_TX_BURSTMAX_SZ	2

`define ILKN__CTL_TX_BURSTSHORT   	32'h000e	// Type=HEX; Min=3'h1, Max=3'h7
`define ILKN__CTL_TX_BURSTSHORT_SZ	3

`define ILKN__CTL_TX_CHAN_EXT   	32'h000f	// Type=HEX; Min=2'h0, Max=2'h3
`define ILKN__CTL_TX_CHAN_EXT_SZ	2

`define ILKN__CTL_TX_DISABLE_SKIPWORD   	32'h0010	// Type=BOOLSTRING; Values=TRUE,FALSE
`define ILKN__CTL_TX_DISABLE_SKIPWORD_SZ	40

`define ILKN__CTL_TX_FC_CALLEN   	32'h0011	// Type=HEX; Min=7'h00, Max=7'h0f
`define ILKN__CTL_TX_FC_CALLEN_SZ	7

`define ILKN__CTL_TX_LAST_LANE   	32'h0012	// Type=HEX; Min=4'h0, Max=4'hb
`define ILKN__CTL_TX_LAST_LANE_SZ	4

`define ILKN__CTL_TX_MFRAMELEN_MINUS1   	32'h0013	// Type=HEX; Min=16'h00ff, Max=16'h1fff
`define ILKN__CTL_TX_MFRAMELEN_MINUS1_SZ	16

`define ILKN__CTL_TX_RETRANS_DEPTH   	32'h0014	// Type=HEX; Min=14'h0200, Max=14'h0800
`define ILKN__CTL_TX_RETRANS_DEPTH_SZ	14

`define ILKN__CTL_TX_RETRANS_MULT   	32'h0015	// Type=HEX; Min=3'h0, Max=3'h5
`define ILKN__CTL_TX_RETRANS_MULT_SZ	3

`define ILKN__CTL_TX_RETRANS_RAM_BANKS   	32'h0016	// Type=HEX; Min=2'h0, Max=2'h3
`define ILKN__CTL_TX_RETRANS_RAM_BANKS_SZ	2

`define ILKN__MODE   	32'h0017	// Type=BOOLSTRING; Values=TRUE,FALSE
`define ILKN__MODE_SZ	40

`define ILKN__SIM_VERSION   	32'h0018	// Type=STRING; Values=2.0,1.0
`define ILKN__SIM_VERSION_SZ	24

`define ILKN__TEST_MODE_PIN_CHAR   	32'h0019	// Type=BOOLSTRING; Values=FALSE,TRUE
`define ILKN__TEST_MODE_PIN_CHAR_SZ	40

`endif  // B_ILKN_DEFINES_VH
