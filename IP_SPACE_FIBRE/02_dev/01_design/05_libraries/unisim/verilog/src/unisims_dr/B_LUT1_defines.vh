// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT1_DEFINES_VH
`else
`define B_LUT1_DEFINES_VH

// Look-up table parameters
//

`define LUT1_ADDR_N  1
`define LUT1_ADDR_SZ 32
`define LUT1_DATA_SZ 2

// Attribute addresses
//

`define LUT1__INIT    32'h00000000
`define LUT1__INIT_SZ 2

`endif  // B_LUT1_DEFINES_VH