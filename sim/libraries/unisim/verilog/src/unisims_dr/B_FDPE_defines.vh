// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FDPE_DEFINES_VH
`else
`define B_FDPE_DEFINES_VH

// Look-up table parameters
//

`define FDPE_ADDR_N  4
`define FDPE_ADDR_SZ 32
`define FDPE_DATA_SZ 1

// Attribute addresses
//

`define FDPE__INIT    32'h00000000
`define FDPE__INIT_SZ 1

`define FDPE__IS_C_INVERTED    32'h00000001
`define FDPE__IS_C_INVERTED_SZ 1

`define FDPE__IS_D_INVERTED    32'h00000002
`define FDPE__IS_D_INVERTED_SZ 1

`define FDPE__IS_PRE_INVERTED    32'h00000003
`define FDPE__IS_PRE_INVERTED_SZ 1

`endif  // B_FDPE_DEFINES_VH