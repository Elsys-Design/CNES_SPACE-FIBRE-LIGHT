// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFE3_DEFINES_VH
`else
`define B_IBUFE3_DEFINES_VH

// Look-up table parameters
//

`define IBUFE3_ADDR_N  5
`define IBUFE3_ADDR_SZ 32
`define IBUFE3_DATA_SZ 144

// Attribute addresses
//

`define IBUFE3__IBUF_LOW_PWR    32'h00000000
`define IBUFE3__IBUF_LOW_PWR_SZ 40

`define IBUFE3__IOSTANDARD    32'h00000001
`define IBUFE3__IOSTANDARD_SZ 56

`define IBUFE3__SIM_DEVICE    32'h00000002
`define IBUFE3__SIM_DEVICE_SZ 144

`define IBUFE3__SIM_INPUT_BUFFER_OFFSET    32'h00000003
`define IBUFE3__SIM_INPUT_BUFFER_OFFSET_SZ 32

`define IBUFE3__USE_IBUFDISABLE    32'h00000004
`define IBUFE3__USE_IBUFDISABLE_SZ 72

`endif  // B_IBUFE3_DEFINES_VH