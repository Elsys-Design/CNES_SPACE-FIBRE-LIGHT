// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FDSE_DEFINES_VH
`else
`define B_FDSE_DEFINES_VH

// Look-up table parameters
//

`define FDSE_ADDR_N  4
`define FDSE_ADDR_SZ 32
`define FDSE_DATA_SZ 1

// Attribute addresses
//

`define FDSE__INIT    32'h00000000
`define FDSE__INIT_SZ 1

`define FDSE__IS_C_INVERTED    32'h00000001
`define FDSE__IS_C_INVERTED_SZ 1

`define FDSE__IS_D_INVERTED    32'h00000002
`define FDSE__IS_D_INVERTED_SZ 1

`define FDSE__IS_S_INVERTED    32'h00000003
`define FDSE__IS_S_INVERTED_SZ 1

`endif  // B_FDSE_DEFINES_VH