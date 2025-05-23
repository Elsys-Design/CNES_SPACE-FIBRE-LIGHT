// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_DUC_DDC_DEFINES_VH
`else
`define B_DFE_DUC_DDC_DEFINES_VH

// Look-up table parameters
//

`define DFE_DUC_DDC_ADDR_N  13
`define DFE_DUC_DDC_ADDR_SZ 32
`define DFE_DUC_DDC_DATA_SZ 64

// Attribute addresses
//

`define DFE_DUC_DDC__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_DUC_DDC__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_DUC_DDC__CLK_FREQ    32'h00000001
`define DFE_DUC_DDC__CLK_FREQ_SZ 64

`define DFE_DUC_DDC__MIXER_RATE    32'h00000002
`define DFE_DUC_DDC__MIXER_RATE_SZ 32

`define DFE_DUC_DDC__NUM_NCO    32'h00000003
`define DFE_DUC_DDC__NUM_NCO_SZ 3

`define DFE_DUC_DDC__N_CH_X1    32'h00000004
`define DFE_DUC_DDC__N_CH_X1_SZ 4

`define DFE_DUC_DDC__N_CH_X16    32'h00000005
`define DFE_DUC_DDC__N_CH_X16_SZ 5

`define DFE_DUC_DDC__N_CH_X2    32'h00000006
`define DFE_DUC_DDC__N_CH_X2_SZ 4

`define DFE_DUC_DDC__N_CH_X4    32'h00000007
`define DFE_DUC_DDC__N_CH_X4_SZ 5

`define DFE_DUC_DDC__N_CH_X8    32'h00000008
`define DFE_DUC_DDC__N_CH_X8_SZ 5

`define DFE_DUC_DDC__N_CMULT    32'h00000009
`define DFE_DUC_DDC__N_CMULT_SZ 64

`define DFE_DUC_DDC__RATE    32'h0000000a
`define DFE_DUC_DDC__RATE_SZ 24

`define DFE_DUC_DDC__SLOTS_PER_PERIOD    32'h0000000b
`define DFE_DUC_DDC__SLOTS_PER_PERIOD_SZ 64

`define DFE_DUC_DDC__XPA_CFG0    32'h0000000c
`define DFE_DUC_DDC__XPA_CFG0_SZ 16

`endif  // B_DFE_DUC_DDC_DEFINES_VH