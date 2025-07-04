// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_FPA_CREG_DEFINES_VH
`else
`define B_DSP_FPA_CREG_DEFINES_VH

// Look-up table parameters
//

`define DSP_FPA_CREG_ADDR_N  4
`define DSP_FPA_CREG_ADDR_SZ 32
`define DSP_FPA_CREG_DATA_SZ 40

// Attribute addresses
//

`define DSP_FPA_CREG__FPCREG    32'h00000000
`define DSP_FPA_CREG__FPCREG_SZ 32

`define DSP_FPA_CREG__IS_RSTC_INVERTED    32'h00000001
`define DSP_FPA_CREG__IS_RSTC_INVERTED_SZ 1

`define DSP_FPA_CREG__LEGACY    32'h00000002
`define DSP_FPA_CREG__LEGACY_SZ 40

`define DSP_FPA_CREG__RESET_MODE    32'h00000003
`define DSP_FPA_CREG__RESET_MODE_SZ 40

`endif  // B_DSP_FPA_CREG_DEFINES_VH