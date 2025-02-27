// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IBUFG_DEFINES_VH
`else
`define B_IBUFG_DEFINES_VH

// Look-up table parameters
//

`define IBUFG_ADDR_N  2
`define IBUFG_ADDR_SZ 32
`define IBUFG_DATA_SZ 56

// Attribute addresses
//

`define IBUFG__IBUF_LOW_PWR    32'h00000000
`define IBUFG__IBUF_LOW_PWR_SZ 40

`define IBUFG__IOSTANDARD    32'h00000001
`define IBUFG__IOSTANDARD_SZ 56

`endif  // B_IBUFG_DEFINES_VH