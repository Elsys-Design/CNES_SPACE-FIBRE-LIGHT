// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OR2L_DEFINES_VH
`else
`define B_OR2L_DEFINES_VH

// Look-up table parameters
//

`define OR2L_ADDR_N  1
`define OR2L_ADDR_SZ 32
`define OR2L_DATA_SZ 1

// Attribute addresses
//

`define OR2L__IS_SRI_INVERTED    32'h00000000
`define OR2L__IS_SRI_INVERTED_SZ 1

`endif  // B_OR2L_DEFINES_VH