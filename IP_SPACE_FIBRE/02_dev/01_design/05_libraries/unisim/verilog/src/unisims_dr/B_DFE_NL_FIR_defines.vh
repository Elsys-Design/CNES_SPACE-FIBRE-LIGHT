// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_NL_FIR_DEFINES_VH
`else
`define B_DFE_NL_FIR_DEFINES_VH

// Look-up table parameters
//

`define DFE_NL_FIR_ADDR_N  6
`define DFE_NL_FIR_ADDR_SZ 32
`define DFE_NL_FIR_DATA_SZ 64

// Attribute addresses
//

`define DFE_NL_FIR__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_NL_FIR__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_NL_FIR__CLK_FREQ    32'h00000001
`define DFE_NL_FIR__CLK_FREQ_SZ 64

`define DFE_NL_FIR__NUM_DUAL_TERMS    32'h00000002
`define DFE_NL_FIR__NUM_DUAL_TERMS_SZ 64

`define DFE_NL_FIR__NUM_PHASES    32'h00000003
`define DFE_NL_FIR__NUM_PHASES_SZ 64

`define DFE_NL_FIR__NUM_UNITS    32'h00000004
`define DFE_NL_FIR__NUM_UNITS_SZ 64

`define DFE_NL_FIR__XPA_CFG0    32'h00000005
`define DFE_NL_FIR__XPA_CFG0_SZ 16

`endif  // B_DFE_NL_FIR_DEFINES_VH