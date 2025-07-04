// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFDS_GTE4_DEFINES_VH
`else
`define B_IBUFDS_GTE4_DEFINES_VH

// Look-up table parameters
//

`define IBUFDS_GTE4_ADDR_N  3
`define IBUFDS_GTE4_ADDR_SZ 32
`define IBUFDS_GTE4_DATA_SZ 2

// Attribute addresses
//

`define IBUFDS_GTE4__REFCLK_EN_TX_PATH    32'h00000000
`define IBUFDS_GTE4__REFCLK_EN_TX_PATH_SZ 1

`define IBUFDS_GTE4__REFCLK_HROW_CK_SEL    32'h00000001
`define IBUFDS_GTE4__REFCLK_HROW_CK_SEL_SZ 2

`define IBUFDS_GTE4__REFCLK_ICNTL_RX    32'h00000002
`define IBUFDS_GTE4__REFCLK_ICNTL_RX_SZ 2

`endif  // B_IBUFDS_GTE4_DEFINES_VH