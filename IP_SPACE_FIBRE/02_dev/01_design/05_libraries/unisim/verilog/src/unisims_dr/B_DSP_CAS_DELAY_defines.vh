// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_CAS_DELAY_DEFINES_VH
`else
`define B_DSP_CAS_DELAY_DEFINES_VH

// Look-up table parameters
//

`define DSP_CAS_DELAY_ADDR_N  1
`define DSP_CAS_DELAY_ADDR_SZ 32
`define DSP_CAS_DELAY_DATA_SZ 32

// Attribute addresses
//

`define DSP_CAS_DELAY__DELAY    32'h00000000
`define DSP_CAS_DELAY__DELAY_SZ 32

`endif  // B_DSP_CAS_DELAY_DEFINES_VH