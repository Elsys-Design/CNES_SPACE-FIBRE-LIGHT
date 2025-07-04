// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT2_DEFINES_VH
`else
`define B_LUT2_DEFINES_VH

// Look-up table parameters
//

`define LUT2_ADDR_N  1
`define LUT2_ADDR_SZ 32
`define LUT2_DATA_SZ 4

// Attribute addresses
//

`define LUT2__INIT    32'h00000000
`define LUT2__INIT_SZ 4

`endif  // B_LUT2_DEFINES_VH