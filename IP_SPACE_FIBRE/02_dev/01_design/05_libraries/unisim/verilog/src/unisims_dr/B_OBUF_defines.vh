// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUF_DEFINES_VH
`else
`define B_OBUF_DEFINES_VH

// Look-up table parameters
//

`define OBUF_ADDR_N  3
`define OBUF_ADDR_SZ 32
`define OBUF_DATA_SZ 56

// Attribute addresses
//

`define OBUF__DRIVE    32'h00000000
`define OBUF__DRIVE_SZ 32

`define OBUF__IOSTANDARD    32'h00000001
`define OBUF__IOSTANDARD_SZ 56

`define OBUF__SLEW    32'h00000002
`define OBUF__SLEW_SZ 48

`endif  // B_OBUF_DEFINES_VH