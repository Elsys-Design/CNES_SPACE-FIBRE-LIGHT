// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LCLK_DELAY_DEFINES_VH
`else
`define B_LCLK_DELAY_DEFINES_VH

// Look-up table parameters
//

`define LCLK_DELAY_ADDR_N  3
`define LCLK_DELAY_ADDR_SZ 32
`define LCLK_DELAY_DATA_SZ 40

// Attribute addresses
//

`define LCLK_DELAY__DELAY    32'h00000000
`define LCLK_DELAY__DELAY_SZ 32

`define LCLK_DELAY__GEN_PULSE    32'h00000001
`define LCLK_DELAY__GEN_PULSE_SZ 40

`define LCLK_DELAY__USE_CASC_IN    32'h00000002
`define LCLK_DELAY__USE_CASC_IN_SZ 40

`endif  // B_LCLK_DELAY_DEFINES_VH