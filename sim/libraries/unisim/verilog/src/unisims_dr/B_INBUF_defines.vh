// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_INBUF_DEFINES_VH
`else
`define B_INBUF_DEFINES_VH

// Look-up table parameters
//

`define INBUF_ADDR_N  3
`define INBUF_ADDR_SZ 32
`define INBUF_DATA_SZ 48

// Attribute addresses
//

`define INBUF__IBUF_LOW_PWR    32'h00000000
`define INBUF__IBUF_LOW_PWR_SZ 40

`define INBUF__ISTANDARD    32'h00000001
`define INBUF__ISTANDARD_SZ 48

`define INBUF__SIM_INPUT_BUFFER_OFFSET    32'h00000002
`define INBUF__SIM_INPUT_BUFFER_OFFSET_SZ 32

`endif  // B_INBUF_DEFINES_VH