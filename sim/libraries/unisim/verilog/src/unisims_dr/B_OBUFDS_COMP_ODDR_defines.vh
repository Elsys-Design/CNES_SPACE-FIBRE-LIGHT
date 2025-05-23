// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFDS_COMP_ODDR_DEFINES_VH
`else
`define B_OBUFDS_COMP_ODDR_DEFINES_VH

// Look-up table parameters
//

`define OBUFDS_COMP_ODDR_ADDR_N  2
`define OBUFDS_COMP_ODDR_ADDR_SZ 32
`define OBUFDS_COMP_ODDR_DATA_SZ 56

// Attribute addresses
//

`define OBUFDS_COMP_ODDR__EN_OMUX    32'h00000000
`define OBUFDS_COMP_ODDR__EN_OMUX_SZ 40

`define OBUFDS_COMP_ODDR__IOSTANDARD    32'h00000001
`define OBUFDS_COMP_ODDR__IOSTANDARD_SZ 56

`endif  // B_OBUFDS_COMP_ODDR_DEFINES_VH