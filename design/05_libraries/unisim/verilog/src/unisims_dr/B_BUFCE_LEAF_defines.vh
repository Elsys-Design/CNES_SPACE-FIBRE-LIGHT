// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFCE_LEAF_DEFINES_VH
`else
`define B_BUFCE_LEAF_DEFINES_VH

// Look-up table parameters
//

`define BUFCE_LEAF_ADDR_N  3
`define BUFCE_LEAF_ADDR_SZ 32
`define BUFCE_LEAF_DATA_SZ 40

// Attribute addresses
//

`define BUFCE_LEAF__CE_TYPE    32'h00000000
`define BUFCE_LEAF__CE_TYPE_SZ 40

`define BUFCE_LEAF__IS_CE_INVERTED    32'h00000001
`define BUFCE_LEAF__IS_CE_INVERTED_SZ 1

`define BUFCE_LEAF__IS_I_INVERTED    32'h00000002
`define BUFCE_LEAF__IS_I_INVERTED_SZ 1

`endif  // B_BUFCE_LEAF_DEFINES_VH