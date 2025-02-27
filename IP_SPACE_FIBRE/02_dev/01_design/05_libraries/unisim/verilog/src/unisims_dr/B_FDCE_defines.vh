// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FDCE_DEFINES_VH
`else
`define B_FDCE_DEFINES_VH

// Look-up table parameters
//

`define FDCE_ADDR_N  4
`define FDCE_ADDR_SZ 32
`define FDCE_DATA_SZ 1

// Attribute addresses
//

`define FDCE__INIT    32'h00000000
`define FDCE__INIT_SZ 1

`define FDCE__IS_CLR_INVERTED    32'h00000001
`define FDCE__IS_CLR_INVERTED_SZ 1

`define FDCE__IS_C_INVERTED    32'h00000002
`define FDCE__IS_C_INVERTED_SZ 1

`define FDCE__IS_D_INVERTED    32'h00000003
`define FDCE__IS_D_INVERTED_SZ 1

`endif  // B_FDCE_DEFINES_VH