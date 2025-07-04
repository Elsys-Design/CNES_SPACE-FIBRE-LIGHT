// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_PATDET_DEFINES_VH
`else
`define B_DSP_PATDET_DEFINES_VH

// Look-up table parameters
//

`define DSP_PATDET_ADDR_N  5
`define DSP_PATDET_ADDR_SZ 32
`define DSP_PATDET_DATA_SZ 112

// Attribute addresses
//

`define DSP_PATDET__MASK    32'h00000000
`define DSP_PATDET__MASK_SZ 58

`define DSP_PATDET__PATTERN    32'h00000001
`define DSP_PATDET__PATTERN_SZ 58

`define DSP_PATDET__SEL_MASK    32'h00000002
`define DSP_PATDET__SEL_MASK_SZ 112

`define DSP_PATDET__SEL_PATTERN    32'h00000003
`define DSP_PATDET__SEL_PATTERN_SZ 56

`define DSP_PATDET__USE_PATTERN_DETECT    32'h00000004
`define DSP_PATDET__USE_PATTERN_DETECT_SZ 72

`endif  // B_DSP_PATDET_DEFINES_VH