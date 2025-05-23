// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_SRL16E_DEFINES_VH
`else
`define B_SRL16E_DEFINES_VH

// Look-up table parameters
//

`define SRL16E_ADDR_N  2
`define SRL16E_ADDR_SZ 32
`define SRL16E_DATA_SZ 16

// Attribute addresses
//

`define SRL16E__INIT    32'h00000000
`define SRL16E__INIT_SZ 16

`define SRL16E__IS_CLK_INVERTED    32'h00000001
`define SRL16E__IS_CLK_INVERTED_SZ 1

`endif  // B_SRL16E_DEFINES_VH