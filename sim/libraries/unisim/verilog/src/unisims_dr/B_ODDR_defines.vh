// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ODDR_DEFINES_VH
`else
`define B_ODDR_DEFINES_VH

// Look-up table parameters
//

`define ODDR_ADDR_N  6
`define ODDR_ADDR_SZ 32
`define ODDR_DATA_SZ 104

// Attribute addresses
//

`define ODDR__DDR_CLK_EDGE    32'h00000000
`define ODDR__DDR_CLK_EDGE_SZ 104

`define ODDR__INIT    32'h00000001
`define ODDR__INIT_SZ 1

`define ODDR__IS_C_INVERTED    32'h00000002
`define ODDR__IS_C_INVERTED_SZ 1

`define ODDR__IS_D1_INVERTED    32'h00000003
`define ODDR__IS_D1_INVERTED_SZ 1

`define ODDR__IS_D2_INVERTED    32'h00000004
`define ODDR__IS_D2_INVERTED_SZ 1

`define ODDR__SRTYPE    32'h00000005
`define ODDR__SRTYPE_SZ 40

`endif  // B_ODDR_DEFINES_VH