// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MBUFG_PS_DEFINES_VH
`else
`define B_MBUFG_PS_DEFINES_VH

// Look-up table parameters
//

`define MBUFG_PS_ADDR_N  2
`define MBUFG_PS_ADDR_SZ 32
`define MBUFG_PS_DATA_SZ 88

// Attribute addresses
//

`define MBUFG_PS__MODE    32'h00000000
`define MBUFG_PS__MODE_SZ 88

`define MBUFG_PS__STARTUP_SYNC    32'h00000001
`define MBUFG_PS__STARTUP_SYNC_SZ 40

`endif  // B_MBUFG_PS_DEFINES_VH