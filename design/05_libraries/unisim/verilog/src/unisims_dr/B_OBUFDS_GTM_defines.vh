// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_GTM_DEFINES_VH
`else
`define B_OBUFDS_GTM_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_GTM_ADDR_N  2
`define OBUFDS_GTM_ADDR_SZ 32
`define OBUFDS_GTM_DATA_SZ 32

// Attribute addresses
//

`define OBUFDS_GTM__REFCLK_EN_TX_PATH    32'h00000000
`define OBUFDS_GTM__REFCLK_EN_TX_PATH_SZ 1

`define OBUFDS_GTM__REFCLK_ICNTL_TX    32'h00000001
`define OBUFDS_GTM__REFCLK_ICNTL_TX_SZ 32

`endif  // B_OBUFDS_GTM_DEFINES_VH
