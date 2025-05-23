// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFGCE_DEFINES_VH
`else
`define B_BUFGCE_DEFINES_VH

// Look-up table parameters
//

`define BUFGCE_ADDR_N  5
`define BUFGCE_ADDR_SZ 32
`define BUFGCE_DATA_SZ 144

// Attribute addresses
//

`define BUFGCE__CE_TYPE    32'h00000000
`define BUFGCE__CE_TYPE_SZ 64

`define BUFGCE__IS_CE_INVERTED    32'h00000001
`define BUFGCE__IS_CE_INVERTED_SZ 1

`define BUFGCE__IS_I_INVERTED    32'h00000002
`define BUFGCE__IS_I_INVERTED_SZ 1

`define BUFGCE__SIM_DEVICE    32'h00000003
`define BUFGCE__SIM_DEVICE_SZ 144

`define BUFGCE__STARTUP_SYNC    32'h00000004
`define BUFGCE__STARTUP_SYNC_SZ 40

`endif  // B_BUFGCE_DEFINES_VH
