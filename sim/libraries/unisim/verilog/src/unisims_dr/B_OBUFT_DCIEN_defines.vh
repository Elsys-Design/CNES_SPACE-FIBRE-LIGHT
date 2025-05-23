// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFT_DCIEN_DEFINES_VH
`else
`define B_OBUFT_DCIEN_DEFINES_VH

// Look-up table parameters
//

`define OBUFT_DCIEN_ADDR_N  3
`define OBUFT_DCIEN_ADDR_SZ 32
`define OBUFT_DCIEN_DATA_SZ 56

// Attribute addresses
//

`define OBUFT_DCIEN__DRIVE    32'h00000000
`define OBUFT_DCIEN__DRIVE_SZ 32

`define OBUFT_DCIEN__IOSTANDARD    32'h00000001
`define OBUFT_DCIEN__IOSTANDARD_SZ 56

`define OBUFT_DCIEN__SLEW    32'h00000002
`define OBUFT_DCIEN__SLEW_SZ 48

`endif  // B_OBUFT_DCIEN_DEFINES_VH