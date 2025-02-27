// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IDELAYCTRL_DEFINES_VH
`else
`define B_IDELAYCTRL_DEFINES_VH

// Look-up table parameters
//

`define IDELAYCTRL_ADDR_N  1
`define IDELAYCTRL_ADDR_SZ 32
`define IDELAYCTRL_DATA_SZ 80

// Attribute addresses
//

`define IDELAYCTRL__SIM_DEVICE    32'h00000000
`define IDELAYCTRL__SIM_DEVICE_SZ 80

`endif  // B_IDELAYCTRL_DEFINES_VH