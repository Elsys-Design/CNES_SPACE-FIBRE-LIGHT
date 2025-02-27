// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ICAPE3_DEFINES_VH
`else
`define B_ICAPE3_DEFINES_VH

// Look-up table parameters
//

`define ICAPE3_ADDR_N  3
`define ICAPE3_ADDR_SZ 32
`define ICAPE3_DATA_SZ 56

// Attribute addresses
//

`define ICAPE3__DEVICE_ID    32'h00000000
`define ICAPE3__DEVICE_ID_SZ 32

`define ICAPE3__ICAP_AUTO_SWITCH    32'h00000001
`define ICAPE3__ICAP_AUTO_SWITCH_SZ 56

`define ICAPE3__SIM_CFG_FILE_NAME    32'h00000002
`define ICAPE3__SIM_CFG_FILE_NAME_SZ 32

`endif  // B_ICAPE3_DEFINES_VH