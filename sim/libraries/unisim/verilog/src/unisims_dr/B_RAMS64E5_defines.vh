// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMS64E5_DEFINES_VH
`else
`define B_RAMS64E5_DEFINES_VH

// Look-up table parameters
//

`define RAMS64E5_ADDR_N  2
`define RAMS64E5_ADDR_SZ 32
`define RAMS64E5_DATA_SZ 64

// Attribute addresses
//

`define RAMS64E5__INIT    32'h00000000
`define RAMS64E5__INIT_SZ 64

`define RAMS64E5__IS_CLK_INVERTED    32'h00000001
`define RAMS64E5__IS_CLK_INVERTED_SZ 1

`endif  // B_RAMS64E5_DEFINES_VH