// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LDPE_DEFINES_VH
`else
`define B_LDPE_DEFINES_VH

// Look-up table parameters
//

`define LDPE_ADDR_N  3
`define LDPE_ADDR_SZ 32
`define LDPE_DATA_SZ 1

// Attribute addresses
//

`define LDPE__INIT    32'h00000000
`define LDPE__INIT_SZ 1

`define LDPE__IS_G_INVERTED    32'h00000001
`define LDPE__IS_G_INVERTED_SZ 1

`define LDPE__IS_PRE_INVERTED    32'h00000002
`define LDPE__IS_PRE_INVERTED_SZ 1

`endif  // B_LDPE_DEFINES_VH