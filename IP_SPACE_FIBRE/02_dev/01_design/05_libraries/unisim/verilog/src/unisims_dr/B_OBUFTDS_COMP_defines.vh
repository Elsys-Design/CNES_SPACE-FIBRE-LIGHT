// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFTDS_COMP_DEFINES_VH
`else
`define B_OBUFTDS_COMP_DEFINES_VH

// Look-up table parameters
//

`define OBUFTDS_COMP_ADDR_N  1
`define OBUFTDS_COMP_ADDR_SZ 32
`define OBUFTDS_COMP_DATA_SZ 56

// Attribute addresses
//

`define OBUFTDS_COMP__IOSTANDARD    32'h00000000
`define OBUFTDS_COMP__IOSTANDARD_SZ 56

`endif  // B_OBUFTDS_COMP_DEFINES_VH