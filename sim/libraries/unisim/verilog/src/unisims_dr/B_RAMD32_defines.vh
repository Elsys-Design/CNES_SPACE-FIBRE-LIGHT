// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMD32_DEFINES_VH
`else
`define B_RAMD32_DEFINES_VH

// Look-up table parameters
//

`define RAMD32_ADDR_N  2
`define RAMD32_ADDR_SZ 32
`define RAMD32_DATA_SZ 32

// Attribute addresses
//

`define RAMD32__INIT    32'h00000000
`define RAMD32__INIT_SZ 32

`define RAMD32__IS_CLK_INVERTED    32'h00000001
`define RAMD32__IS_CLK_INVERTED_SZ 1

`endif  // B_RAMD32_DEFINES_VH