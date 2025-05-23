// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUF_ODDR_DEFINES_VH
`else
`define B_OBUF_ODDR_DEFINES_VH

// Look-up table parameters
//

`define OBUF_ODDR_ADDR_N  4
`define OBUF_ODDR_ADDR_SZ 32
`define OBUF_ODDR_DATA_SZ 56

// Attribute addresses
//

`define OBUF_ODDR__DRIVE    32'h00000000
`define OBUF_ODDR__DRIVE_SZ 32

`define OBUF_ODDR__EN_OMUX    32'h00000001
`define OBUF_ODDR__EN_OMUX_SZ 40

`define OBUF_ODDR__IOSTANDARD    32'h00000002
`define OBUF_ODDR__IOSTANDARD_SZ 56

`define OBUF_ODDR__SLEW    32'h00000003
`define OBUF_ODDR__SLEW_SZ 48

`endif  // B_OBUF_ODDR_DEFINES_VH