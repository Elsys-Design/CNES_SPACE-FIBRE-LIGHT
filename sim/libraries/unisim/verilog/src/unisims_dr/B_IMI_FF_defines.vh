// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IMI_FF_DEFINES_VH
`else
`define B_IMI_FF_DEFINES_VH

// Look-up table parameters
//

`define IMI_FF_ADDR_N  4
`define IMI_FF_ADDR_SZ 32
`define IMI_FF_DATA_SZ 48

// Attribute addresses
//

`define IMI_FF__CLK_MODE    32'h00000000
`define IMI_FF__CLK_MODE_SZ 48

`define IMI_FF__IMR_REG    32'h00000001
`define IMI_FF__IMR_REG_SZ 48

`define IMI_FF__INIT_MODE    32'h00000002
`define IMI_FF__INIT_MODE_SZ 48

`define IMI_FF__SYNC_VAL    32'h00000003
`define IMI_FF__SYNC_VAL_SZ 40

`endif  // B_IMI_FF_DEFINES_VH