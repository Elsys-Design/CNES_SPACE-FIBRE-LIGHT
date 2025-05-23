// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HSADC_DEFINES_VH
`else
`define B_HSADC_DEFINES_VH

// Look-up table parameters
//

`define HSADC_ADDR_N  7
`define HSADC_ADDR_SZ 32
`define HSADC_DATA_SZ 152

// Attribute addresses
//

`define HSADC__SIM_DEVICE    32'h00000000
`define HSADC__SIM_DEVICE_SZ 152

`define HSADC__XPA_CFG0    32'h00000001
`define HSADC__XPA_CFG0_SZ 16

`define HSADC__XPA_CFG1    32'h00000002
`define HSADC__XPA_CFG1_SZ 16

`define HSADC__XPA_NUM_ADCS    32'h00000003
`define HSADC__XPA_NUM_ADCS_SZ 16

`define HSADC__XPA_NUM_DDCS    32'h00000004
`define HSADC__XPA_NUM_DDCS_SZ 3

`define HSADC__XPA_PLL_USED    32'h00000005
`define HSADC__XPA_PLL_USED_SZ 24

`define HSADC__XPA_SAMPLE_RATE_MSPS    32'h00000006
`define HSADC__XPA_SAMPLE_RATE_MSPS_SZ 14

`endif  // B_HSADC_DEFINES_VH