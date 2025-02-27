// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFT_ODDR_DEFINES_VH
`else
`define B_OBUFT_ODDR_DEFINES_VH

// Look-up table parameters
//

`define OBUFT_ODDR_ADDR_N  4
`define OBUFT_ODDR_ADDR_SZ 32
`define OBUFT_ODDR_DATA_SZ 56

// Attribute addresses
//

`define OBUFT_ODDR__DRIVE    32'h00000000
`define OBUFT_ODDR__DRIVE_SZ 32

`define OBUFT_ODDR__EN_OMUX    32'h00000001
`define OBUFT_ODDR__EN_OMUX_SZ 40

`define OBUFT_ODDR__IOSTANDARD    32'h00000002
`define OBUFT_ODDR__IOSTANDARD_SZ 56

`define OBUFT_ODDR__SLEW    32'h00000003
`define OBUFT_ODDR__SLEW_SZ 48

`endif  // B_OBUFT_ODDR_DEFINES_VH