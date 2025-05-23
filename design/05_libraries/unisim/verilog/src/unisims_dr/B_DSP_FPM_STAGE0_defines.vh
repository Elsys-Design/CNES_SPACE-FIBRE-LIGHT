// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_FPM_STAGE0_DEFINES_VH
`else
`define B_DSP_FPM_STAGE0_DEFINES_VH

// Look-up table parameters
//

`define DSP_FPM_STAGE0_ADDR_N  4
`define DSP_FPM_STAGE0_ADDR_SZ 32
`define DSP_FPM_STAGE0_DATA_SZ 64

// Attribute addresses
//

`define DSP_FPM_STAGE0__A_FPTYPE    32'h00000000
`define DSP_FPM_STAGE0__A_FPTYPE_SZ 24

`define DSP_FPM_STAGE0__B_D_FPTYPE    32'h00000001
`define DSP_FPM_STAGE0__B_D_FPTYPE_SZ 24

`define DSP_FPM_STAGE0__LEGACY    32'h00000002
`define DSP_FPM_STAGE0__LEGACY_SZ 40

`define DSP_FPM_STAGE0__USE_MULT    32'h00000003
`define DSP_FPM_STAGE0__USE_MULT_SZ 64

`endif  // B_DSP_FPM_STAGE0_DEFINES_VH