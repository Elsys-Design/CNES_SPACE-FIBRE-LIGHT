// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_FPM_STAGE1_DEFINES_VH
`else
`define B_DSP_FPM_STAGE1_DEFINES_VH

// Look-up table parameters
//

`define DSP_FPM_STAGE1_ADDR_N  1
`define DSP_FPM_STAGE1_ADDR_SZ 32
`define DSP_FPM_STAGE1_DATA_SZ 40

// Attribute addresses
//

`define DSP_FPM_STAGE1__LEGACY    32'h00000000
`define DSP_FPM_STAGE1__LEGACY_SZ 40

`endif  // B_DSP_FPM_STAGE1_DEFINES_VH