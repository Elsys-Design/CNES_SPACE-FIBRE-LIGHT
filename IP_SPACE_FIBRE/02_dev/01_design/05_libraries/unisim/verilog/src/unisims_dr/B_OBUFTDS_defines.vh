// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFTDS_DEFINES_VH
`else
`define B_OBUFTDS_DEFINES_VH

// Look-up table parameters
//

`define OBUFTDS_ADDR_N  2
`define OBUFTDS_ADDR_SZ 32
`define OBUFTDS_DATA_SZ 56

// Attribute addresses
//

`define OBUFTDS__IOSTANDARD    32'h00000000
`define OBUFTDS__IOSTANDARD_SZ 56

`define OBUFTDS__SLEW    32'h00000001
`define OBUFTDS__SLEW_SZ 48

`endif  // B_OBUFTDS_DEFINES_VH