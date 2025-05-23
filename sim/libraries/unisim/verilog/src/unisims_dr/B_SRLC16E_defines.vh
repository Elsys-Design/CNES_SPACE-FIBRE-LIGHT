// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_SRLC16E_DEFINES_VH
`else
`define B_SRLC16E_DEFINES_VH

// Look-up table parameters
//

`define SRLC16E_ADDR_N  2
`define SRLC16E_ADDR_SZ 32
`define SRLC16E_DATA_SZ 16

// Attribute addresses
//

`define SRLC16E__INIT    32'h00000000
`define SRLC16E__INIT_SZ 16

`define SRLC16E__IS_CLK_INVERTED    32'h00000001
`define SRLC16E__IS_CLK_INVERTED_SZ 1

`endif  // B_SRLC16E_DEFINES_VH