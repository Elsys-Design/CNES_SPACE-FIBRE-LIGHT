// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_PREADD58_DEFINES_VH
`else
`define B_DSP_PREADD58_DEFINES_VH

// Look-up table parameters
//

`define DSP_PREADD58_ADDR_N  1
`define DSP_PREADD58_ADDR_SZ 32
`define DSP_PREADD58_DATA_SZ 48

// Attribute addresses
//

`define DSP_PREADD58__DSP_MODE    32'h00000000
`define DSP_PREADD58__DSP_MODE_SZ 48

`endif  // B_DSP_PREADD58_DEFINES_VH