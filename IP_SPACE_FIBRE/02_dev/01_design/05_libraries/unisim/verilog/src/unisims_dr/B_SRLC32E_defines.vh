// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_SRLC32E_DEFINES_VH
`else
`define B_SRLC32E_DEFINES_VH

// Look-up table parameters
//

`define SRLC32E_ADDR_N  2
`define SRLC32E_ADDR_SZ 32
`define SRLC32E_DATA_SZ 32

// Attribute addresses
//

`define SRLC32E__INIT    32'h00000000
`define SRLC32E__INIT_SZ 32

`define SRLC32E__IS_CLK_INVERTED    32'h00000001
`define SRLC32E__IS_CLK_INVERTED_SZ 1

`endif  // B_SRLC32E_DEFINES_VH