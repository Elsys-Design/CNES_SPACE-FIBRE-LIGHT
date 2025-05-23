// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFT_DEFINES_VH
`else
`define B_OBUFT_DEFINES_VH

// Look-up table parameters
//

`define OBUFT_ADDR_N  3
`define OBUFT_ADDR_SZ 32
`define OBUFT_DATA_SZ 56

// Attribute addresses
//

`define OBUFT__DRIVE    32'h00000000
`define OBUFT__DRIVE_SZ 32

`define OBUFT__IOSTANDARD    32'h00000001
`define OBUFT__IOSTANDARD_SZ 56

`define OBUFT__SLEW    32'h00000002
`define OBUFT__SLEW_SZ 48

`endif  // B_OBUFT_DEFINES_VH