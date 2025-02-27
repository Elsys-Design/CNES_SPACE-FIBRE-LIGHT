// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MBUFG_HM_DEFINES_VH
`else
`define B_MBUFG_HM_DEFINES_VH

// Look-up table parameters
//

`define MBUFG_HM_ADDR_N  2
`define MBUFG_HM_ADDR_SZ 32
`define MBUFG_HM_DATA_SZ 88

// Attribute addresses
//

`define MBUFG_HM__MODE    32'h00000000
`define MBUFG_HM__MODE_SZ 88

`define MBUFG_HM__STARTUP_SYNC    32'h00000001
`define MBUFG_HM__STARTUP_SYNC_SZ 40

`endif  // B_MBUFG_HM_DEFINES_VH