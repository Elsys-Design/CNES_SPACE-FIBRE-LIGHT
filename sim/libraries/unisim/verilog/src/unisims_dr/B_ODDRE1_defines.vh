// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ODDRE1_DEFINES_VH
`else
`define B_ODDRE1_DEFINES_VH

// Look-up table parameters
//

`define ODDRE1_ADDR_N  5
`define ODDRE1_ADDR_SZ 32
`define ODDRE1_DATA_SZ 152

// Attribute addresses
//

`define ODDRE1__IS_C_INVERTED    32'h00000000
`define ODDRE1__IS_C_INVERTED_SZ 1

`define ODDRE1__IS_D1_INVERTED    32'h00000001
`define ODDRE1__IS_D1_INVERTED_SZ 1

`define ODDRE1__IS_D2_INVERTED    32'h00000002
`define ODDRE1__IS_D2_INVERTED_SZ 1

`define ODDRE1__SIM_DEVICE    32'h00000003
`define ODDRE1__SIM_DEVICE_SZ 152

`define ODDRE1__SRVAL    32'h00000004
`define ODDRE1__SRVAL_SZ 1

`endif  // B_ODDRE1_DEFINES_VH
