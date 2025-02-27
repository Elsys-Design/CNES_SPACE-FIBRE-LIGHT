// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMS64E1_DEFINES_VH
`else
`define B_RAMS64E1_DEFINES_VH

// Look-up table parameters
//

`define RAMS64E1_ADDR_N  4
`define RAMS64E1_ADDR_SZ 32
`define RAMS64E1_DATA_SZ 64

// Attribute addresses
//

`define RAMS64E1__INIT    32'h00000000
`define RAMS64E1__INIT_SZ 64

`define RAMS64E1__IS_CLK_INVERTED    32'h00000001
`define RAMS64E1__IS_CLK_INVERTED_SZ 1

`define RAMS64E1__RAM_ADDRESS_MASK    32'h00000002
`define RAMS64E1__RAM_ADDRESS_MASK_SZ 3

`define RAMS64E1__RAM_ADDRESS_SPACE    32'h00000003
`define RAMS64E1__RAM_ADDRESS_SPACE_SZ 3

`endif  // B_RAMS64E1_DEFINES_VH