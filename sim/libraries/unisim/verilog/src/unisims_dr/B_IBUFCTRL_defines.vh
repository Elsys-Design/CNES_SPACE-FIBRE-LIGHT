// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFCTRL_DEFINES_VH
`else
`define B_IBUFCTRL_DEFINES_VH

// Look-up table parameters
//

`define IBUFCTRL_ADDR_N  2
`define IBUFCTRL_ADDR_SZ 32
`define IBUFCTRL_DATA_SZ 48

// Attribute addresses
//

`define IBUFCTRL__ISTANDARD    32'h00000000
`define IBUFCTRL__ISTANDARD_SZ 48

`define IBUFCTRL__USE_IBUFDISABLE    32'h00000001
`define IBUFCTRL__USE_IBUFDISABLE_SZ 40

`endif  // B_IBUFCTRL_DEFINES_VH