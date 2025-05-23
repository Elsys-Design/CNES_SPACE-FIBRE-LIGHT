// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_FIR_DEFINES_VH
`else
`define B_DFE_FIR_DEFINES_VH

// Look-up table parameters
//

`define DFE_FIR_ADDR_N  5
`define DFE_FIR_ADDR_SZ 32
`define DFE_FIR_DATA_SZ 64

// Attribute addresses
//

`define DFE_FIR__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_FIR__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_FIR__CLK_FREQ    32'h00000001
`define DFE_FIR__CLK_FREQ_SZ 64

`define DFE_FIR__N_TAPS    32'h00000002
`define DFE_FIR__N_TAPS_SZ 64

`define DFE_FIR__SLOTS_PER_PERIOD    32'h00000003
`define DFE_FIR__SLOTS_PER_PERIOD_SZ 64

`define DFE_FIR__XPA_CFG0    32'h00000004
`define DFE_FIR__XPA_CFG0_SZ 16

`endif  // B_DFE_FIR_DEFINES_VH