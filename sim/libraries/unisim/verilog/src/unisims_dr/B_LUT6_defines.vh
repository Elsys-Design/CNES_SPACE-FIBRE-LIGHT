// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT6_DEFINES_VH
`else
`define B_LUT6_DEFINES_VH

// Look-up table parameters
//

`define LUT6_ADDR_N  1
`define LUT6_ADDR_SZ 32
`define LUT6_DATA_SZ 64

// Attribute addresses
//

`define LUT6__INIT    32'h00000000
`define LUT6__INIT_SZ 64

`endif  // B_LUT6_DEFINES_VH