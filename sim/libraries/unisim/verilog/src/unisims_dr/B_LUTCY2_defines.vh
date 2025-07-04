// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUTCY2_DEFINES_VH
`else
`define B_LUTCY2_DEFINES_VH

// Look-up table parameters
//

`define LUTCY2_ADDR_N  1
`define LUTCY2_ADDR_SZ 32
`define LUTCY2_DATA_SZ 32

// Attribute addresses
//

`define LUTCY2__INIT    32'h00000000
`define LUTCY2__INIT_SZ 32

`endif  // B_LUTCY2_DEFINES_VH