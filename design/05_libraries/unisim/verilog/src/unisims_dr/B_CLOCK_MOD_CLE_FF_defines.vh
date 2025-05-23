// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CLOCK_MOD_CLE_FF_DEFINES_VH
`else
`define B_CLOCK_MOD_CLE_FF_DEFINES_VH

// Look-up table parameters
//

`define CLOCK_MOD_CLE_FF_ADDR_N  4
`define CLOCK_MOD_CLE_FF_ADDR_SZ 32
`define CLOCK_MOD_CLE_FF_DATA_SZ 48

// Attribute addresses
//

`define CLOCK_MOD_CLE_FF__CLK_DLY_VAL    32'h00000000
`define CLOCK_MOD_CLE_FF__CLK_DLY_VAL_SZ 4

`define CLOCK_MOD_CLE_FF__FF_CLK_DUAL    32'h00000001
`define CLOCK_MOD_CLE_FF__FF_CLK_DUAL_SZ 40

`define CLOCK_MOD_CLE_FF__FF_CLK_EN    32'h00000002
`define CLOCK_MOD_CLE_FF__FF_CLK_EN_SZ 40

`define CLOCK_MOD_CLE_FF__IMUX_CLK_MODE    32'h00000003
`define CLOCK_MOD_CLE_FF__IMUX_CLK_MODE_SZ 48

`endif  // B_CLOCK_MOD_CLE_FF_DEFINES_VH