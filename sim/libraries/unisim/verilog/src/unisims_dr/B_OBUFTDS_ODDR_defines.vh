// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OBUFTDS_ODDR_DEFINES_VH
`else
`define B_OBUFTDS_ODDR_DEFINES_VH

// Look-up table parameters
//

`define OBUFTDS_ODDR_ADDR_N  3
`define OBUFTDS_ODDR_ADDR_SZ 32
`define OBUFTDS_ODDR_DATA_SZ 56

// Attribute addresses
//

`define OBUFTDS_ODDR__EN_OMUX    32'h00000000
`define OBUFTDS_ODDR__EN_OMUX_SZ 40

`define OBUFTDS_ODDR__IOSTANDARD    32'h00000001
`define OBUFTDS_ODDR__IOSTANDARD_SZ 56

`define OBUFTDS_ODDR__SLEW    32'h00000002
`define OBUFTDS_ODDR__SLEW_SZ 48

`endif  // B_OBUFTDS_ODDR_DEFINES_VH