// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     blh_composer 3.0001
//    Built On:     Mon Apr  1 15:06:27 2013
//    Bundle:       GTHE3_COMMON
//    Architecture: olympus
//    Snapshot Dir: /tmp/03mQrwppEY
// Environment Variables:
//    XILENV="/build/xfndry/HEAD/env"
//    MYXILENV=""
//

`ifdef B_OBUFDS_GTE3_DEFINES_VH
`else
`define B_OBUFDS_GTE3_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_GTE3_ADDR_N  3
`define OBUFDS_GTE3_ADDR_SZ 32
`define OBUFDS_GTE3_DATA_SZ 5

// Attribute addresses
//

`define OBUFDS_GTE3__REFCLK_CLKOUT_SEL   	32'h0000	// Type=BINARY; Min=2'b00, Max=2'b11
`define OBUFDS_GTE3__REFCLK_CLKOUT_SEL_SZ	2

`define OBUFDS_GTE3__REFCLK_EN_TX_PATH   	32'h0001	// Type=BINARY; Min=1'b0, Max=1'b1
`define OBUFDS_GTE3__REFCLK_EN_TX_PATH_SZ	1

`define OBUFDS_GTE3__REFCLK_ICNTL_TX   	32'h0002	// Type=BINARY; Min=5'b00000, Max=5'b11111
`define OBUFDS_GTE3__REFCLK_ICNTL_TX_SZ	5

`endif  // B_OBUFDS_GTE3_DEFINES_VH
