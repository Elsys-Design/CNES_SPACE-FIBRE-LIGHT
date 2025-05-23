// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HSADC_TEST_DEFINES_VH
`else
`define B_HSADC_TEST_DEFINES_VH

// Look-up table parameters
//

`define HSADC_TEST_ADDR_N  6
`define HSADC_TEST_ADDR_SZ 32
`define HSADC_TEST_DATA_SZ 24

// Attribute addresses
//

`define HSADC_TEST__XPA_CFG0    32'h0000
`define HSADC_TEST__XPA_CFG0_SZ 32

`define HSADC_TEST__XPA_CFG1    32'h0001
`define HSADC_TEST__XPA_CFG1_SZ 32

`define HSADC_TEST__XPA_NUM_ADCS    32'h0002
`define HSADC_TEST__XPA_NUM_ADCS_SZ 16

`define HSADC_TEST__XPA_NUM_DDCS    32'h0003
`define HSADC_TEST__XPA_NUM_DDCS_SZ 32

`define HSADC_TEST__XPA_PLL_USED    32'h0004
`define HSADC_TEST__XPA_PLL_USED_SZ 24

`define HSADC_TEST__XPA_SAMPLE_RATE_MSPS    32'h0005
`define HSADC_TEST__XPA_SAMPLE_RATE_MSPS_SZ 32

`endif  // B_HSADC_TEST_DEFINES_VH