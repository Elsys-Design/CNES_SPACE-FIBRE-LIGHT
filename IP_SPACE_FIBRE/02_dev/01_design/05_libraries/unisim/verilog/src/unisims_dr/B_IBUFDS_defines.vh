// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFDS_DEFINES_VH
`else
`define B_IBUFDS_DEFINES_VH

// Look-up table parameters
//

`define IBUFDS_ADDR_N  4
`define IBUFDS_ADDR_SZ 32
`define IBUFDS_DATA_SZ 56

// Attribute addresses
//

`define IBUFDS__DIFF_TERM    32'h00000000
`define IBUFDS__DIFF_TERM_SZ 40

`define IBUFDS__DQS_BIAS    32'h00000001
`define IBUFDS__DQS_BIAS_SZ 40

`define IBUFDS__IBUF_LOW_PWR    32'h00000002
`define IBUFDS__IBUF_LOW_PWR_SZ 40

`define IBUFDS__IOSTANDARD    32'h00000003
`define IBUFDS__IOSTANDARD_SZ 56

`endif  // B_IBUFDS_DEFINES_VH