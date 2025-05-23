// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_M_DATA_DEFINES_VH
`else
`define B_DSP_M_DATA_DEFINES_VH

// Look-up table parameters
//

`define DSP_M_DATA_ADDR_N  3
`define DSP_M_DATA_ADDR_SZ 32
`define DSP_M_DATA_DATA_SZ 32

// Attribute addresses
//

`define DSP_M_DATA__IS_CLK_INVERTED    32'h00000000
`define DSP_M_DATA__IS_CLK_INVERTED_SZ 1

`define DSP_M_DATA__IS_RSTM_INVERTED    32'h00000001
`define DSP_M_DATA__IS_RSTM_INVERTED_SZ 1

`define DSP_M_DATA__MREG    32'h00000002
`define DSP_M_DATA__MREG_SZ 32

`endif  // B_DSP_M_DATA_DEFINES_VH