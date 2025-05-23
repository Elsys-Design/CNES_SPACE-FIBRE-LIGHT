// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUF_DEFINES_VH
`else
`define B_IBUF_DEFINES_VH

// Look-up table parameters
//

`define IBUF_ADDR_N  2
`define IBUF_ADDR_SZ 32
`define IBUF_DATA_SZ 56

// Attribute addresses
//

`define IBUF__IBUF_LOW_PWR    32'h00000000
`define IBUF__IBUF_LOW_PWR_SZ 40

`define IBUF__IOSTANDARD    32'h00000001
`define IBUF__IOSTANDARD_SZ 56

`endif  // B_IBUF_DEFINES_VH