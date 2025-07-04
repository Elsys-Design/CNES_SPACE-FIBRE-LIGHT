// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DNA_PORTE2_DEFINES_VH
`else
`define B_DNA_PORTE2_DEFINES_VH

// Look-up table parameters
//

`define DNA_PORTE2_ADDR_N  1
`define DNA_PORTE2_ADDR_SZ 32
`define DNA_PORTE2_DATA_SZ 96

// Attribute addresses
//

`define DNA_PORTE2__SIM_DNA_VALUE    32'h00000000
`define DNA_PORTE2__SIM_DNA_VALUE_SZ 96

`endif  // B_DNA_PORTE2_DEFINES_VH