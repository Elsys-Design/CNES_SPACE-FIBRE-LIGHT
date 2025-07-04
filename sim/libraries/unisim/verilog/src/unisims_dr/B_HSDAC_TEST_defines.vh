// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HSDAC_TEST_DEFINES_VH
`else
`define B_HSDAC_TEST_DEFINES_VH

// Look-up table parameters
//

`define HSDAC_TEST_ADDR_N  6
`define HSDAC_TEST_ADDR_SZ 32
`define HSDAC_TEST_DATA_SZ 24

// Attribute addresses
//

`define HSDAC_TEST__XPA_CFG0    32'h0000
`define HSDAC_TEST__XPA_CFG0_SZ 32

`define HSDAC_TEST__XPA_CFG1    32'h0001
`define HSDAC_TEST__XPA_CFG1_SZ 32

`define HSDAC_TEST__XPA_NUM_DACS    32'h0002
`define HSDAC_TEST__XPA_NUM_DACS_SZ 32

`define HSDAC_TEST__XPA_NUM_DUCS    32'h0003
`define HSDAC_TEST__XPA_NUM_DUCS_SZ 32

`define HSDAC_TEST__XPA_PLL_USED    32'h0004
`define HSDAC_TEST__XPA_PLL_USED_SZ 24

`define HSDAC_TEST__XPA_SAMPLE_RATE_MSPS    32'h0005
`define HSDAC_TEST__XPA_SAMPLE_RATE_MSPS_SZ 32

`endif  // B_HSDAC_TEST_DEFINES_VH