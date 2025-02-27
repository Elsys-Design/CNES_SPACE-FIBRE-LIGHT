// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMD32M64_DEFINES_VH
`else
`define B_RAMD32M64_DEFINES_VH

// Look-up table parameters
//

`define RAMD32M64_ADDR_N  2
`define RAMD32M64_ADDR_SZ 32
`define RAMD32M64_DATA_SZ 64

// Attribute addresses
//

`define RAMD32M64__INIT    32'h00000000
`define RAMD32M64__INIT_SZ 64

`define RAMD32M64__IS_CLK_INVERTED    32'h00000001
`define RAMD32M64__IS_CLK_INVERTED_SZ 1

`endif  // B_RAMD32M64_DEFINES_VH