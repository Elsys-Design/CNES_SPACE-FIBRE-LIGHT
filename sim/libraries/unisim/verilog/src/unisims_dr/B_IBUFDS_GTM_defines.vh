// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFDS_GTM_DEFINES_VH
`else
`define B_IBUFDS_GTM_DEFINES_VH

// Look-up table parameters
//

`define IBUFDS_GTM_ADDR_N  3
`define IBUFDS_GTM_ADDR_SZ 32
`define IBUFDS_GTM_DATA_SZ 32

// Attribute addresses
//

`define IBUFDS_GTM__REFCLK_EN_TX_PATH    32'h00000000
`define IBUFDS_GTM__REFCLK_EN_TX_PATH_SZ 1

`define IBUFDS_GTM__REFCLK_HROW_CK_SEL    32'h00000001
`define IBUFDS_GTM__REFCLK_HROW_CK_SEL_SZ 32

`define IBUFDS_GTM__REFCLK_ICNTL_RX    32'h00000002
`define IBUFDS_GTM__REFCLK_ICNTL_RX_SZ 32

`endif  // B_IBUFDS_GTM_DEFINES_VH
