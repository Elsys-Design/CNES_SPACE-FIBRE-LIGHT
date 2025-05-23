// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CFGLUT5_DEFINES_VH
`else
`define B_CFGLUT5_DEFINES_VH

// Look-up table parameters
//

`define CFGLUT5_ADDR_N  2
`define CFGLUT5_ADDR_SZ 32
`define CFGLUT5_DATA_SZ 32

// Attribute addresses
//

`define CFGLUT5__INIT    32'h00000000
`define CFGLUT5__INIT_SZ 32

`define CFGLUT5__IS_CLK_INVERTED    32'h00000001
`define CFGLUT5__IS_CLK_INVERTED_SZ 1

`endif  // B_CFGLUT5_DEFINES_VH