// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_GTE5_ADV_DEFINES_VH
`else
`define B_OBUFDS_GTE5_ADV_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_GTE5_ADV_ADDR_N  2
`define OBUFDS_GTE5_ADV_ADDR_SZ 32
`define OBUFDS_GTE5_ADV_DATA_SZ 1

// Attribute addresses
//

`define OBUFDS_GTE5_ADV__REFCLK_EN_DRV    32'h00000000
`define OBUFDS_GTE5_ADV__REFCLK_EN_DRV_SZ 1

`define OBUFDS_GTE5_ADV__REFCLK_EN_TX_PATH    32'h00000001
`define OBUFDS_GTE5_ADV__REFCLK_EN_TX_PATH_SZ 1

`endif  // B_OBUFDS_GTE5_ADV_DEFINES_VH