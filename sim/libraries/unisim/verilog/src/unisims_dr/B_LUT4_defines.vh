// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT4_DEFINES_VH
`else
`define B_LUT4_DEFINES_VH

// Look-up table parameters
//

`define LUT4_ADDR_N  1
`define LUT4_ADDR_SZ 32
`define LUT4_DATA_SZ 16

// Attribute addresses
//

`define LUT4__INIT    32'h00000000
`define LUT4__INIT_SZ 16

`endif  // B_LUT4_DEFINES_VH