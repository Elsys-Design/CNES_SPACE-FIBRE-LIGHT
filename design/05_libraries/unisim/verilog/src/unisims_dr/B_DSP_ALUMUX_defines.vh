// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_ALUMUX_DEFINES_VH
`else
`define B_DSP_ALUMUX_DEFINES_VH

// Look-up table parameters
//

`define DSP_ALUMUX_ADDR_N  3
`define DSP_ALUMUX_ADDR_SZ 32
`define DSP_ALUMUX_DATA_SZ 58

// Attribute addresses
//

`define DSP_ALUMUX__DSP_MODE    32'h00000000
`define DSP_ALUMUX__DSP_MODE_SZ 48

`define DSP_ALUMUX__LEGACY    32'h00000001
`define DSP_ALUMUX__LEGACY_SZ 40

`define DSP_ALUMUX__RND    32'h00000002
`define DSP_ALUMUX__RND_SZ 58

`endif  // B_DSP_ALUMUX_DEFINES_VH