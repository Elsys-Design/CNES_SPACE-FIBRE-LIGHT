// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_C_DATA58_DEFINES_VH
`else
`define B_DSP_C_DATA58_DEFINES_VH

// Look-up table parameters
//

`define DSP_C_DATA58_ADDR_N  4
`define DSP_C_DATA58_ADDR_SZ 32
`define DSP_C_DATA58_DATA_SZ 48

// Attribute addresses
//

`define DSP_C_DATA58__CREG    32'h00000000
`define DSP_C_DATA58__CREG_SZ 32

`define DSP_C_DATA58__DSP_MODE    32'h00000001
`define DSP_C_DATA58__DSP_MODE_SZ 48

`define DSP_C_DATA58__IS_RSTC_INVERTED    32'h00000002
`define DSP_C_DATA58__IS_RSTC_INVERTED_SZ 1

`define DSP_C_DATA58__RESET_MODE    32'h00000003
`define DSP_C_DATA58__RESET_MODE_SZ 40

`endif  // B_DSP_C_DATA58_DEFINES_VH