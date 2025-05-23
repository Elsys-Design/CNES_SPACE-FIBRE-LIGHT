// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FDRE_DEFINES_VH
`else
`define B_FDRE_DEFINES_VH

// Look-up table parameters
//

`define FDRE_ADDR_N  4
`define FDRE_ADDR_SZ 32
`define FDRE_DATA_SZ 1

// Attribute addresses
//

`define FDRE__INIT    32'h00000000
`define FDRE__INIT_SZ 1

`define FDRE__IS_C_INVERTED    32'h00000001
`define FDRE__IS_C_INVERTED_SZ 1

`define FDRE__IS_D_INVERTED    32'h00000002
`define FDRE__IS_D_INVERTED_SZ 1

`define FDRE__IS_R_INVERTED    32'h00000003
`define FDRE__IS_R_INVERTED_SZ 1

`endif  // B_FDRE_DEFINES_VH