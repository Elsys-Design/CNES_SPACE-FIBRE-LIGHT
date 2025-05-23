// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IDDRE1_DEFINES_VH
`else
`define B_IDDRE1_DEFINES_VH

// Look-up table parameters
//

`define IDDRE1_ADDR_N  3
`define IDDRE1_ADDR_SZ 32
`define IDDRE1_DATA_SZ 152

// Attribute addresses
//

`define IDDRE1__DDR_CLK_EDGE    32'h00000000
`define IDDRE1__DDR_CLK_EDGE_SZ 152

`define IDDRE1__IS_CB_INVERTED    32'h00000001
`define IDDRE1__IS_CB_INVERTED_SZ 1

`define IDDRE1__IS_C_INVERTED    32'h00000002
`define IDDRE1__IS_C_INVERTED_SZ 1

`endif  // B_IDDRE1_DEFINES_VH