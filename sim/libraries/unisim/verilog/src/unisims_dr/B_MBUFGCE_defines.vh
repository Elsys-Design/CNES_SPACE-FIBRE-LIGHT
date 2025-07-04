// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MBUFGCE_DEFINES_VH
`else
`define B_MBUFGCE_DEFINES_VH

// Look-up table parameters
//

`define MBUFGCE_ADDR_N  6
`define MBUFGCE_ADDR_SZ 32
`define MBUFGCE_DATA_SZ 144

// Attribute addresses
//

`define MBUFGCE__CE_TYPE    32'h00000000
`define MBUFGCE__CE_TYPE_SZ 64

`define MBUFGCE__IS_CE_INVERTED    32'h00000001
`define MBUFGCE__IS_CE_INVERTED_SZ 1

`define MBUFGCE__IS_I_INVERTED    32'h00000002
`define MBUFGCE__IS_I_INVERTED_SZ 1

`define MBUFGCE__MODE    32'h00000003
`define MBUFGCE__MODE_SZ 88

`define MBUFGCE__SIM_DEVICE    32'h00000004
`define MBUFGCE__SIM_DEVICE_SZ 144

`define MBUFGCE__STARTUP_SYNC    32'h00000005
`define MBUFGCE__STARTUP_SYNC_SZ 40

`endif  // B_MBUFGCE_DEFINES_VH
