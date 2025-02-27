// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_ALUADD_DEFINES_VH
`else
`define B_DSP_ALUADD_DEFINES_VH

// Look-up table parameters
//

`define DSP_ALUADD_ADDR_N  4
`define DSP_ALUADD_ADDR_SZ 32
`define DSP_ALUADD_DATA_SZ 120

// Attribute addresses
//

`define DSP_ALUADD__LEGACY    32'h00000000
`define DSP_ALUADD__LEGACY_SZ 40

`define DSP_ALUADD__USE_SIMD    32'h00000001
`define DSP_ALUADD__USE_SIMD_SZ 48

`define DSP_ALUADD__USE_WIDEXOR    32'h00000002
`define DSP_ALUADD__USE_WIDEXOR_SZ 40

`define DSP_ALUADD__XORSIMD    32'h00000003
`define DSP_ALUADD__XORSIMD_SZ 120

`endif  // B_DSP_ALUADD_DEFINES_VH