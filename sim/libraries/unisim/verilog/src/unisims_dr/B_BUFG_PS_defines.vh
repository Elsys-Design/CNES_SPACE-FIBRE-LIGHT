// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFG_PS_DEFINES_VH
`else
`define B_BUFG_PS_DEFINES_VH

// Look-up table parameters
//

`define BUFG_PS_ADDR_N  2
`define BUFG_PS_ADDR_SZ 32
`define BUFG_PS_DATA_SZ 144

// Attribute addresses
//

`define BUFG_PS__SIM_DEVICE    32'h00000000
`define BUFG_PS__SIM_DEVICE_SZ 144

`define BUFG_PS__STARTUP_SYNC    32'h00000001
`define BUFG_PS__STARTUP_SYNC_SZ 40

`endif  // B_BUFG_PS_DEFINES_VH
