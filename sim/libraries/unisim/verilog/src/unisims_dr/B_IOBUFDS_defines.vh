// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IOBUFDS_DEFINES_VH
`else
`define B_IOBUFDS_DEFINES_VH

// Look-up table parameters
//

`define IOBUFDS_ADDR_N  5
`define IOBUFDS_ADDR_SZ 32
`define IOBUFDS_DATA_SZ 56

// Attribute addresses
//

`define IOBUFDS__DIFF_TERM    32'h00000000
`define IOBUFDS__DIFF_TERM_SZ 40

`define IOBUFDS__DQS_BIAS    32'h00000001
`define IOBUFDS__DQS_BIAS_SZ 40

`define IOBUFDS__IBUF_LOW_PWR    32'h00000002
`define IOBUFDS__IBUF_LOW_PWR_SZ 40

`define IOBUFDS__IOSTANDARD    32'h00000003
`define IOBUFDS__IOSTANDARD_SZ 56

`define IOBUFDS__SLEW    32'h00000004
`define IOBUFDS__SLEW_SZ 48

`endif  // B_IOBUFDS_DEFINES_VH