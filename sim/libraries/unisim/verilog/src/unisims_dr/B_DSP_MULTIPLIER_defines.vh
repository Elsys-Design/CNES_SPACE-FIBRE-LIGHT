// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_MULTIPLIER_DEFINES_VH
`else
`define B_DSP_MULTIPLIER_DEFINES_VH

// Look-up table parameters
//

`define DSP_MULTIPLIER_ADDR_N  3
`define DSP_MULTIPLIER_ADDR_SZ 32
`define DSP_MULTIPLIER_DATA_SZ 64

// Attribute addresses
//

`define DSP_MULTIPLIER__AMULTSEL    32'h00000000
`define DSP_MULTIPLIER__AMULTSEL_SZ 16

`define DSP_MULTIPLIER__BMULTSEL    32'h00000001
`define DSP_MULTIPLIER__BMULTSEL_SZ 16

`define DSP_MULTIPLIER__USE_MULT    32'h00000002
`define DSP_MULTIPLIER__USE_MULT_SZ 64

`endif  // B_DSP_MULTIPLIER_DEFINES_VH