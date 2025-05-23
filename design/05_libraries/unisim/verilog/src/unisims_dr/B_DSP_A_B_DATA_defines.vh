// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_A_B_DATA_DEFINES_VH
`else
`define B_DSP_A_B_DATA_DEFINES_VH

// Look-up table parameters
//

`define DSP_A_B_DATA_ADDR_N  9
`define DSP_A_B_DATA_ADDR_SZ 32
`define DSP_A_B_DATA_DATA_SZ 56

// Attribute addresses
//

`define DSP_A_B_DATA__ACASCREG    32'h00000000
`define DSP_A_B_DATA__ACASCREG_SZ 32

`define DSP_A_B_DATA__AREG    32'h00000001
`define DSP_A_B_DATA__AREG_SZ 32

`define DSP_A_B_DATA__A_INPUT    32'h00000002
`define DSP_A_B_DATA__A_INPUT_SZ 56

`define DSP_A_B_DATA__BCASCREG    32'h00000003
`define DSP_A_B_DATA__BCASCREG_SZ 32

`define DSP_A_B_DATA__BREG    32'h00000004
`define DSP_A_B_DATA__BREG_SZ 32

`define DSP_A_B_DATA__B_INPUT    32'h00000005
`define DSP_A_B_DATA__B_INPUT_SZ 56

`define DSP_A_B_DATA__IS_CLK_INVERTED    32'h00000006
`define DSP_A_B_DATA__IS_CLK_INVERTED_SZ 1

`define DSP_A_B_DATA__IS_RSTA_INVERTED    32'h00000007
`define DSP_A_B_DATA__IS_RSTA_INVERTED_SZ 1

`define DSP_A_B_DATA__IS_RSTB_INVERTED    32'h00000008
`define DSP_A_B_DATA__IS_RSTB_INVERTED_SZ 1

`endif  // B_DSP_A_B_DATA_DEFINES_VH