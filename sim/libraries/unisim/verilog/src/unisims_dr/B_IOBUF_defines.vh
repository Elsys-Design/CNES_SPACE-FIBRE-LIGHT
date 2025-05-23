// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IOBUF_DEFINES_VH
`else
`define B_IOBUF_DEFINES_VH

// Look-up table parameters
//

`define IOBUF_ADDR_N  4
`define IOBUF_ADDR_SZ 32
`define IOBUF_DATA_SZ 56

// Attribute addresses
//

`define IOBUF__DRIVE    32'h00000000
`define IOBUF__DRIVE_SZ 32

`define IOBUF__IBUF_LOW_PWR    32'h00000001
`define IOBUF__IBUF_LOW_PWR_SZ 40

`define IOBUF__IOSTANDARD    32'h00000002
`define IOBUF__IOSTANDARD_SZ 56

`define IOBUF__SLEW    32'h00000003
`define IOBUF__SLEW_SZ 48

`endif  // B_IOBUF_DEFINES_VH