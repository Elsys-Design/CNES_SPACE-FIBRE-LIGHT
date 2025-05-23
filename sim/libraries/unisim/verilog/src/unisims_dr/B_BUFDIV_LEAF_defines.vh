// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFDIV_LEAF_DEFINES_VH
`else
`define B_BUFDIV_LEAF_DEFINES_VH

// Look-up table parameters
//

`define BUFDIV_LEAF_ADDR_N  2
`define BUFDIV_LEAF_ADDR_SZ 32
`define BUFDIV_LEAF_DATA_SZ 32

// Attribute addresses
//

`define BUFDIV_LEAF__DIVIDE    32'h00000000
`define BUFDIV_LEAF__DIVIDE_SZ 32

`define BUFDIV_LEAF__IS_I_INVERTED    32'h00000001
`define BUFDIV_LEAF__IS_I_INVERTED_SZ 1

`endif  // B_BUFDIV_LEAF_DEFINES_VH