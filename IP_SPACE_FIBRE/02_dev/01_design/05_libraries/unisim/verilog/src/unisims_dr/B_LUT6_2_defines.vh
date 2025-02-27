// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT6_2_DEFINES_VH
`else
`define B_LUT6_2_DEFINES_VH

// Look-up table parameters
//

`define LUT6_2_ADDR_N  1
`define LUT6_2_ADDR_SZ 32
`define LUT6_2_DATA_SZ 64

// Attribute addresses
//

`define LUT6_2__INIT   	32'h0001	// Type=HEX; Min=64'h0000000000000000, Max=64'hffffffffffffffff
`define LUT6_2__INIT_SZ	64

`endif  // B_LUT6_2_DEFINES_VH
