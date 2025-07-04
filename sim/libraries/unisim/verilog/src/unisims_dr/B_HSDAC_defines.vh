// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HSDAC_DEFINES_VH
`else
`define B_HSDAC_DEFINES_VH

// Look-up table parameters
//

`define HSDAC_ADDR_N  7
`define HSDAC_ADDR_SZ 32
`define HSDAC_DATA_SZ 152

// Attribute addresses
//

`define HSDAC__SIM_DEVICE    32'h00000000
`define HSDAC__SIM_DEVICE_SZ 152

`define HSDAC__XPA_CFG0    32'h00000001
`define HSDAC__XPA_CFG0_SZ 16

`define HSDAC__XPA_CFG1    32'h00000002
`define HSDAC__XPA_CFG1_SZ 16

`define HSDAC__XPA_NUM_DACS    32'h00000003
`define HSDAC__XPA_NUM_DACS_SZ 3

`define HSDAC__XPA_NUM_DUCS    32'h00000004
`define HSDAC__XPA_NUM_DUCS_SZ 3

`define HSDAC__XPA_PLL_USED    32'h00000005
`define HSDAC__XPA_PLL_USED_SZ 24

`define HSDAC__XPA_SAMPLE_RATE_MSPS    32'h00000006
`define HSDAC__XPA_SAMPLE_RATE_MSPS_SZ 14

`endif  // B_HSDAC_DEFINES_VH