// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_COMP_DEFINES_VH
`else
`define B_OBUFDS_COMP_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_COMP_ADDR_N  1
`define OBUFDS_COMP_ADDR_SZ 32
`define OBUFDS_COMP_DATA_SZ 56

// Attribute addresses
//

`define OBUFDS_COMP__IOSTANDARD    32'h00000000
`define OBUFDS_COMP__IOSTANDARD_SZ 56

`endif  // B_OBUFDS_COMP_DEFINES_VH