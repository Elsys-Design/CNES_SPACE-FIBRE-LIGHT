// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ODELAYE5_DEFINES_VH
`else
`define B_ODELAYE5_DEFINES_VH

// Look-up table parameters
//

`define ODELAYE5_ADDR_N  3
`define ODELAYE5_ADDR_SZ 32
`define ODELAYE5_DATA_SZ 40

// Attribute addresses
//

`define ODELAYE5__CASCADE    32'h00000000
`define ODELAYE5__CASCADE_SZ 40

`define ODELAYE5__IS_CLK_INVERTED    32'h00000001
`define ODELAYE5__IS_CLK_INVERTED_SZ 1

`define ODELAYE5__IS_RST_INVERTED    32'h00000002
`define ODELAYE5__IS_RST_INVERTED_SZ 1

`endif  // B_ODELAYE5_DEFINES_VH