// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFDS_DPHY_DEFINES_VH
`else
`define B_IBUFDS_DPHY_DEFINES_VH

// Look-up table parameters
//

`define IBUFDS_DPHY_ADDR_N  3
`define IBUFDS_DPHY_ADDR_SZ 32
`define IBUFDS_DPHY_DATA_SZ 152

// Attribute addresses
//

`define IBUFDS_DPHY__DIFF_TERM    32'h00000000
`define IBUFDS_DPHY__DIFF_TERM_SZ 40

`define IBUFDS_DPHY__IOSTANDARD    32'h00000001
`define IBUFDS_DPHY__IOSTANDARD_SZ 56

`define IBUFDS_DPHY__SIM_DEVICE    32'h00000002
`define IBUFDS_DPHY__SIM_DEVICE_SZ 152

`endif  // B_IBUFDS_DPHY_DEFINES_VH