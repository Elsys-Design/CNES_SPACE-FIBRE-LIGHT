// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IDDR_2CLK_DEFINES_VH
`else
`define B_IDDR_2CLK_DEFINES_VH

// Look-up table parameters
//

`define IDDR_2CLK_ADDR_N  7
`define IDDR_2CLK_ADDR_SZ 32
`define IDDR_2CLK_DATA_SZ 152

// Attribute addresses
//

`define IDDR_2CLK__DDR_CLK_EDGE    32'h00000000
`define IDDR_2CLK__DDR_CLK_EDGE_SZ 152

`define IDDR_2CLK__INIT_Q1    32'h00000001
`define IDDR_2CLK__INIT_Q1_SZ 1

`define IDDR_2CLK__INIT_Q2    32'h00000002
`define IDDR_2CLK__INIT_Q2_SZ 1

`define IDDR_2CLK__IS_CB_INVERTED    32'h00000003
`define IDDR_2CLK__IS_CB_INVERTED_SZ 1

`define IDDR_2CLK__IS_C_INVERTED    32'h00000004
`define IDDR_2CLK__IS_C_INVERTED_SZ 1

`define IDDR_2CLK__IS_D_INVERTED    32'h00000005
`define IDDR_2CLK__IS_D_INVERTED_SZ 1

`define IDDR_2CLK__SRTYPE    32'h00000006
`define IDDR_2CLK__SRTYPE_SZ 40

`endif  // B_IDDR_2CLK_DEFINES_VH