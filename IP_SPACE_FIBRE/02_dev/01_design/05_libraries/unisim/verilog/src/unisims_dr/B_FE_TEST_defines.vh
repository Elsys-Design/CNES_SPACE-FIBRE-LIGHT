// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FE_TEST_DEFINES_VH
`else
`define B_FE_TEST_DEFINES_VH

// Look-up table parameters
//

`define FE_TEST_ADDR_N  4
`define FE_TEST_ADDR_SZ 32
`define FE_TEST_DATA_SZ 152

// Attribute addresses
//

`define FE_TEST__LD_PERCENT_LOAD    32'h0000
`define FE_TEST__LD_PERCENT_LOAD_SZ 32

`define FE_TEST__LE_PERCENT_LOAD    32'h0001
`define FE_TEST__LE_PERCENT_LOAD_SZ 32

`define FE_TEST__SIM_DEVICE    32'h0002
`define FE_TEST__SIM_DEVICE_SZ 152

`define FE_TEST__TD_PERCENT_LOAD    32'h0003
`define FE_TEST__TD_PERCENT_LOAD_SZ 32

`endif  // B_FE_TEST_DEFINES_VH