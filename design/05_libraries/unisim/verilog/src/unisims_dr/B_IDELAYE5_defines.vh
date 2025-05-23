// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IDELAYE5_DEFINES_VH
`else
`define B_IDELAYE5_DEFINES_VH

// Look-up table parameters
//

`define IDELAYE5_ADDR_N  3
`define IDELAYE5_ADDR_SZ 32
`define IDELAYE5_DATA_SZ 40

// Attribute addresses
//

`define IDELAYE5__CASCADE    32'h00000000
`define IDELAYE5__CASCADE_SZ 40

`define IDELAYE5__IS_CLK_INVERTED    32'h00000001
`define IDELAYE5__IS_CLK_INVERTED_SZ 1

`define IDELAYE5__IS_RST_INVERTED    32'h00000002
`define IDELAYE5__IS_RST_INVERTED_SZ 1

`endif  // B_IDELAYE5_DEFINES_VH