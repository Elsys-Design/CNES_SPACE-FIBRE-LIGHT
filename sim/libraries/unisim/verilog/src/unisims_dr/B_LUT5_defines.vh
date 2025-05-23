// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT5_DEFINES_VH
`else
`define B_LUT5_DEFINES_VH

// Look-up table parameters
//

`define LUT5_ADDR_N  1
`define LUT5_ADDR_SZ 32
`define LUT5_DATA_SZ 32

// Attribute addresses
//

`define LUT5__INIT    32'h00000000
`define LUT5__INIT_SZ 32

`endif  // B_LUT5_DEFINES_VH