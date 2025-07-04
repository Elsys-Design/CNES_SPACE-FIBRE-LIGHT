// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMD64E_DEFINES_VH
`else
`define B_RAMD64E_DEFINES_VH

// Look-up table parameters
//

`define RAMD64E_ADDR_N  4
`define RAMD64E_ADDR_SZ 32
`define RAMD64E_DATA_SZ 64

// Attribute addresses
//

`define RAMD64E__INIT    32'h00000000
`define RAMD64E__INIT_SZ 64

`define RAMD64E__IS_CLK_INVERTED    32'h00000001
`define RAMD64E__IS_CLK_INVERTED_SZ 1

`define RAMD64E__RAM_ADDRESS_MASK    32'h00000002
`define RAMD64E__RAM_ADDRESS_MASK_SZ 2

`define RAMD64E__RAM_ADDRESS_SPACE    32'h00000003
`define RAMD64E__RAM_ADDRESS_SPACE_SZ 2

`endif  // B_RAMD64E_DEFINES_VH