// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_CFR_DEFINES_VH
`else
`define B_DFE_CFR_DEFINES_VH

// Look-up table parameters
//

`define DFE_CFR_ADDR_N  7
`define DFE_CFR_ADDR_SZ 32
`define DFE_CFR_DATA_SZ 64

// Attribute addresses
//

`define DFE_CFR__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_CFR__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_CFR__CLK_FREQ    32'h00000001
`define DFE_CFR__CLK_FREQ_SZ 64

`define DFE_CFR__PC_IT0_NUM_CPG    32'h00000002
`define DFE_CFR__PC_IT0_NUM_CPG_SZ 64

`define DFE_CFR__PC_IT1_NUM_CPG    32'h00000003
`define DFE_CFR__PC_IT1_NUM_CPG_SZ 64

`define DFE_CFR__PC_IT2_NUM_CPG    32'h00000004
`define DFE_CFR__PC_IT2_NUM_CPG_SZ 64

`define DFE_CFR__WIN_ENABLED    32'h00000005
`define DFE_CFR__WIN_ENABLED_SZ 24

`define DFE_CFR__XPA_CFG0    32'h00000006
`define DFE_CFR__XPA_CFG0_SZ 16

`endif  // B_DFE_CFR_DEFINES_VH