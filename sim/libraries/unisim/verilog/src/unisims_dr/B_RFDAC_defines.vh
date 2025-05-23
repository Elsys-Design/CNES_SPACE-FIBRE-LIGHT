// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RFDAC_DEFINES_VH
`else
`define B_RFDAC_DEFINES_VH

// Look-up table parameters
//

`define RFDAC_ADDR_N  10
`define RFDAC_ADDR_SZ 32
`define RFDAC_DATA_SZ 152

// Attribute addresses
//

`define RFDAC__OPT_CLK_DIST    32'h00000000
`define RFDAC__OPT_CLK_DIST_SZ 16

`define RFDAC__SIM_DEVICE    32'h00000001
`define RFDAC__SIM_DEVICE_SZ 152

`define RFDAC__XPA_ACTIVE_DUTYCYCLE    32'h00000002
`define RFDAC__XPA_ACTIVE_DUTYCYCLE_SZ 7

`define RFDAC__XPA_CFG0    32'h00000003
`define RFDAC__XPA_CFG0_SZ 16

`define RFDAC__XPA_CFG1    32'h00000004
`define RFDAC__XPA_CFG1_SZ 16

`define RFDAC__XPA_CFG2    32'h00000005
`define RFDAC__XPA_CFG2_SZ 16

`define RFDAC__XPA_NUM_DACS    32'h00000006
`define RFDAC__XPA_NUM_DACS_SZ 3

`define RFDAC__XPA_NUM_DUCS    32'h00000007
`define RFDAC__XPA_NUM_DUCS_SZ 3

`define RFDAC__XPA_PLL_USED    32'h00000008
`define RFDAC__XPA_PLL_USED_SZ 112

`define RFDAC__XPA_SAMPLE_RATE_MSPS    32'h00000009
`define RFDAC__XPA_SAMPLE_RATE_MSPS_SZ 14

`endif  // B_RFDAC_DEFINES_VH