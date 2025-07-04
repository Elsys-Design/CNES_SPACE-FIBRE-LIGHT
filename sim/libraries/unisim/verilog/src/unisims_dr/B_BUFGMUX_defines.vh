// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFGMUX_DEFINES_VH
`else
`define B_BUFGMUX_DEFINES_VH

// Look-up table parameters
//

`define BUFGMUX_ADDR_N  1
`define BUFGMUX_ADDR_SZ 32
`define BUFGMUX_DATA_SZ 40

// Attribute addresses
//

`define BUFGMUX__CLK_SEL_TYPE    32'h00000000
`define BUFGMUX__CLK_SEL_TYPE_SZ 40

`endif  // B_BUFGMUX_DEFINES_VH