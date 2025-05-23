// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_C_DATA_DEFINES_VH
`else
`define B_DSP_C_DATA_DEFINES_VH

// Look-up table parameters
//

`define DSP_C_DATA_ADDR_N  3
`define DSP_C_DATA_ADDR_SZ 32
`define DSP_C_DATA_DATA_SZ 32

// Attribute addresses
//

`define DSP_C_DATA__CREG    32'h00000000
`define DSP_C_DATA__CREG_SZ 32

`define DSP_C_DATA__IS_CLK_INVERTED    32'h00000001
`define DSP_C_DATA__IS_CLK_INVERTED_SZ 1

`define DSP_C_DATA__IS_RSTC_INVERTED    32'h00000002
`define DSP_C_DATA__IS_RSTC_INVERTED_SZ 1

`endif  // B_DSP_C_DATA_DEFINES_VH