// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_DPHY_DEFINES_VH
`else
`define B_OBUFDS_DPHY_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_DPHY_ADDR_N  1
`define OBUFDS_DPHY_ADDR_SZ 32
`define OBUFDS_DPHY_DATA_SZ 56

// Attribute addresses
//

`define OBUFDS_DPHY__IOSTANDARD    32'h00000000
`define OBUFDS_DPHY__IOSTANDARD_SZ 56

`endif  // B_OBUFDS_DPHY_DEFINES_VH