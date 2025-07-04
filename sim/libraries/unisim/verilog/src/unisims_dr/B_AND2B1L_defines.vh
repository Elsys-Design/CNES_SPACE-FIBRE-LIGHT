// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_AND2B1L_DEFINES_VH
`else
`define B_AND2B1L_DEFINES_VH

// Look-up table parameters
//

`define AND2B1L_ADDR_N  1
`define AND2B1L_ADDR_SZ 32
`define AND2B1L_DATA_SZ 1

// Attribute addresses
//

`define AND2B1L__IS_SRI_INVERTED    32'h00000000
`define AND2B1L__IS_SRI_INVERTED_SZ 1

`endif  // B_AND2B1L_DEFINES_VH