// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT6CY_DEFINES_VH
`else
`define B_LUT6CY_DEFINES_VH

// Look-up table parameters
//

`define LUT6CY_ADDR_N  1
`define LUT6CY_ADDR_SZ 32
`define LUT6CY_DATA_SZ 64

// Attribute addresses
//

`define LUT6CY__INIT    32'h00000000
`define LUT6CY__INIT_SZ 64

`endif  // B_LUT6CY_DEFINES_VH