// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FE_DEFINES_VH
`else
`define B_FE_DEFINES_VH

// Look-up table parameters
//

`define FE_ADDR_N  5
`define FE_ADDR_SZ 32
`define FE_DATA_SZ 152

// Attribute addresses
//

`define FE__MODE    32'h00000000
`define FE__MODE_SZ 96

`define FE__PHYSICAL_UTILIZATION    32'h00000001
`define FE__PHYSICAL_UTILIZATION_SZ 64

`define FE__SIM_DEVICE    32'h00000002
`define FE__SIM_DEVICE_SZ 152

`define FE__STANDARD    32'h00000003
`define FE__STANDARD_SZ 48

`define FE__THROUGHPUT_UTILIZATION    32'h00000004
`define FE__THROUGHPUT_UTILIZATION_SZ 64

`endif  // B_FE_DEFINES_VH