// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RIU_OR_DEFINES_VH
`else
`define B_RIU_OR_DEFINES_VH

// Look-up table parameters
//

`define RIU_OR_ADDR_N  2
`define RIU_OR_ADDR_SZ 32
`define RIU_OR_DATA_SZ 152

// Attribute addresses
//

`define RIU_OR__SIM_DEVICE    32'h00000000
`define RIU_OR__SIM_DEVICE_SZ 152

`define RIU_OR__SIM_VERSION    32'h00000001
`define RIU_OR__SIM_VERSION_SZ 64

`endif  // B_RIU_OR_DEFINES_VH