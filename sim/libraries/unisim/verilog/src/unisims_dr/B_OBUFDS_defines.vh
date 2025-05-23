// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_DEFINES_VH
`else
`define B_OBUFDS_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_ADDR_N  2
`define OBUFDS_ADDR_SZ 32
`define OBUFDS_DATA_SZ 56

// Attribute addresses
//

`define OBUFDS__IOSTANDARD    32'h00000000
`define OBUFDS__IOSTANDARD_SZ 56

`define OBUFDS__SLEW    32'h00000001
`define OBUFDS__SLEW_SZ 48

`endif  // B_OBUFDS_DEFINES_VH