// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MBUFG_GT_DEFINES_VH
`else
`define B_MBUFG_GT_DEFINES_VH

// Look-up table parameters
//

`define MBUFG_GT_ADDR_N  3
`define MBUFG_GT_ADDR_SZ 32
`define MBUFG_GT_DATA_SZ 144

// Attribute addresses
//

`define MBUFG_GT__MODE    32'h00000000
`define MBUFG_GT__MODE_SZ 88

`define MBUFG_GT__SIM_DEVICE    32'h00000001
`define MBUFG_GT__SIM_DEVICE_SZ 144

`define MBUFG_GT__STARTUP_SYNC    32'h00000002
`define MBUFG_GT__STARTUP_SYNC_SZ 40

`endif  // B_MBUFG_GT_DEFINES_VH
