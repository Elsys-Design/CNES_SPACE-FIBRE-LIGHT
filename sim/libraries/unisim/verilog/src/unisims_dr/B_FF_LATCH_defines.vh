// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_FF_LATCH_DEFINES_VH
`else
`define B_FF_LATCH_DEFINES_VH

// Look-up table parameters
//

`define FF_LATCH_ADDR_N  7
`define FF_LATCH_ADDR_SZ 32
`define FF_LATCH_DATA_SZ 48

// Attribute addresses
//

`define FF_LATCH__FFORLATCH    32'h00000000
`define FF_LATCH__FFORLATCH_SZ 40

`define FF_LATCH__FFSR    32'h00000001
`define FF_LATCH__FFSR_SZ 48

`define FF_LATCH__INIT    32'h00000002
`define FF_LATCH__INIT_SZ 1

`define FF_LATCH__IS_CLK_INVERTED    32'h00000003
`define FF_LATCH__IS_CLK_INVERTED_SZ 1

`define FF_LATCH__IS_D_INVERTED    32'h00000004
`define FF_LATCH__IS_D_INVERTED_SZ 1

`define FF_LATCH__IS_SR_INVERTED    32'h00000005
`define FF_LATCH__IS_SR_INVERTED_SZ 1

`define FF_LATCH__SYNC_ATTR    32'h00000006
`define FF_LATCH__SYNC_ATTR_SZ 40

`endif  // B_FF_LATCH_DEFINES_VH