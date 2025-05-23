// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IMC_FF_DEFINES_VH
`else
`define B_IMC_FF_DEFINES_VH

// Look-up table parameters
//

`define IMC_FF_ADDR_N  3
`define IMC_FF_ADDR_SZ 32
`define IMC_FF_DATA_SZ 48

// Attribute addresses
//

`define IMC_FF__CLK_MODE    32'h00000000
`define IMC_FF__CLK_MODE_SZ 48

`define IMC_FF__IMR_REG    32'h00000001
`define IMC_FF__IMR_REG_SZ 48

`define IMC_FF__INIT_MODE    32'h00000002
`define IMC_FF__INIT_MODE_SZ 48

`endif  // B_IMC_FF_DEFINES_VH