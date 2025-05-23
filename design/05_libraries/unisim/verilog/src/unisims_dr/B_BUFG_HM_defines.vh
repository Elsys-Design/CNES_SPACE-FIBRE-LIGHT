// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFG_HM_DEFINES_VH
`else
`define B_BUFG_HM_DEFINES_VH

// Look-up table parameters
//

`define BUFG_HM_ADDR_N  1
`define BUFG_HM_ADDR_SZ 32
`define BUFG_HM_DATA_SZ 40

// Attribute addresses
//

`define BUFG_HM__STARTUP_SYNC    32'h00000000
`define BUFG_HM__STARTUP_SYNC_SZ 40

`endif  // B_BUFG_HM_DEFINES_VH