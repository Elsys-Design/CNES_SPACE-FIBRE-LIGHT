// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUTCY1_DEFINES_VH
`else
`define B_LUTCY1_DEFINES_VH

// Look-up table parameters
//

`define LUTCY1_ADDR_N  1
`define LUTCY1_ADDR_SZ 32
`define LUTCY1_DATA_SZ 32

// Attribute addresses
//

`define LUTCY1__INIT    32'h00000000
`define LUTCY1__INIT_SZ 32

`endif  // B_LUTCY1_DEFINES_VH