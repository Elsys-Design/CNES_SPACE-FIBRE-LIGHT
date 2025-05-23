// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CARRY8_DEFINES_VH
`else
`define B_CARRY8_DEFINES_VH

// Look-up table parameters
//

`define CARRY8_ADDR_N  1
`define CARRY8_ADDR_SZ 32
`define CARRY8_DATA_SZ 80

// Attribute addresses
//

`define CARRY8__CARRY_TYPE    32'h00000000
`define CARRY8__CARRY_TYPE_SZ 80

`endif  // B_CARRY8_DEFINES_VH