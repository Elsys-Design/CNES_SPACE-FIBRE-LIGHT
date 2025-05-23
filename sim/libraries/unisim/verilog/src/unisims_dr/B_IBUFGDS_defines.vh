// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFGDS_DEFINES_VH
`else
`define B_IBUFGDS_DEFINES_VH

// Look-up table parameters
//

`define IBUFGDS_ADDR_N  3
`define IBUFGDS_ADDR_SZ 32
`define IBUFGDS_DATA_SZ 56

// Attribute addresses
//

`define IBUFGDS__DIFF_TERM    32'h00000000
`define IBUFGDS__DIFF_TERM_SZ 40

`define IBUFGDS__IBUF_LOW_PWR    32'h00000001
`define IBUFGDS__IBUF_LOW_PWR_SZ 40

`define IBUFGDS__IOSTANDARD    32'h00000002
`define IBUFGDS__IOSTANDARD_SZ 56

`endif  // B_IBUFGDS_DEFINES_VH