// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_ODDR_DEFINES_VH
`else
`define B_OBUFDS_ODDR_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_ODDR_ADDR_N  3
`define OBUFDS_ODDR_ADDR_SZ 32
`define OBUFDS_ODDR_DATA_SZ 56

// Attribute addresses
//

`define OBUFDS_ODDR__EN_OMUX    32'h00000000
`define OBUFDS_ODDR__EN_OMUX_SZ 40

`define OBUFDS_ODDR__IOSTANDARD    32'h00000001
`define OBUFDS_ODDR__IOSTANDARD_SZ 56

`define OBUFDS_ODDR__SLEW    32'h00000002
`define OBUFDS_ODDR__SLEW_SZ 48

`endif  // B_OBUFDS_ODDR_DEFINES_VH