// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_PQ_INTERP_DEFINES_VH
`else
`define B_DFE_PQ_INTERP_DEFINES_VH

// Look-up table parameters
//

`define DFE_PQ_INTERP_ADDR_N  4
`define DFE_PQ_INTERP_ADDR_SZ 32
`define DFE_PQ_INTERP_DATA_SZ 64

// Attribute addresses
//

`define DFE_PQ_INTERP__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_PQ_INTERP__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_PQ_INTERP__CLK_FREQ    32'h00000001
`define DFE_PQ_INTERP__CLK_FREQ_SZ 64

`define DFE_PQ_INTERP__RESAMPLE_RATE    32'h00000002
`define DFE_PQ_INTERP__RESAMPLE_RATE_SZ 24

`define DFE_PQ_INTERP__XPA_CFG0    32'h00000003
`define DFE_PQ_INTERP__XPA_CFG0_SZ 16

`endif  // B_DFE_PQ_INTERP_DEFINES_VH