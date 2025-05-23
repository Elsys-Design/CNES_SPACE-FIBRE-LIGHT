// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CLOCK_MOD_IRI_FF_DEFINES_VH
`else
`define B_CLOCK_MOD_IRI_FF_DEFINES_VH

// Look-up table parameters
//

`define CLOCK_MOD_IRI_FF_ADDR_N  3
`define CLOCK_MOD_IRI_FF_ADDR_SZ 32
`define CLOCK_MOD_IRI_FF_DATA_SZ 64

// Attribute addresses
//

`define CLOCK_MOD_IRI_FF__CLK_DLY_VAL_COE    32'h00000000
`define CLOCK_MOD_IRI_FF__CLK_DLY_VAL_COE_SZ 4

`define CLOCK_MOD_IRI_FF__CLK_EN    32'h00000001
`define CLOCK_MOD_IRI_FF__CLK_EN_SZ 40

`define CLOCK_MOD_IRI_FF__CLK_SEL    32'h00000002
`define CLOCK_MOD_IRI_FF__CLK_SEL_SZ 64

`endif  // B_CLOCK_MOD_IRI_FF_DEFINES_VH