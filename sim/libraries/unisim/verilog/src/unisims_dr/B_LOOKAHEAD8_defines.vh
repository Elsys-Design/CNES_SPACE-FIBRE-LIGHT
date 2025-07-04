// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LOOKAHEAD8_DEFINES_VH
`else
`define B_LOOKAHEAD8_DEFINES_VH

// Look-up table parameters
//

`define LOOKAHEAD8_ADDR_N  4
`define LOOKAHEAD8_ADDR_SZ 32
`define LOOKAHEAD8_DATA_SZ 40

// Attribute addresses
//

`define LOOKAHEAD8__LOOKB    32'h00000000
`define LOOKAHEAD8__LOOKB_SZ 40

`define LOOKAHEAD8__LOOKD    32'h00000001
`define LOOKAHEAD8__LOOKD_SZ 40

`define LOOKAHEAD8__LOOKF    32'h00000002
`define LOOKAHEAD8__LOOKF_SZ 40

`define LOOKAHEAD8__LOOKH    32'h00000003
`define LOOKAHEAD8__LOOKH_SZ 40

`endif  // B_LOOKAHEAD8_DEFINES_VH