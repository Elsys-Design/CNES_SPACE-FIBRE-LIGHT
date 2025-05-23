// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LDCE_DEFINES_VH
`else
`define B_LDCE_DEFINES_VH

// Look-up table parameters
//

`define LDCE_ADDR_N  3
`define LDCE_ADDR_SZ 32
`define LDCE_DATA_SZ 1

// Attribute addresses
//

`define LDCE__INIT    32'h00000000
`define LDCE__INIT_SZ 1

`define LDCE__IS_CLR_INVERTED    32'h00000001
`define LDCE__IS_CLR_INVERTED_SZ 1

`define LDCE__IS_G_INVERTED    32'h00000002
`define LDCE__IS_G_INVERTED_SZ 1

`endif  // B_LDCE_DEFINES_VH