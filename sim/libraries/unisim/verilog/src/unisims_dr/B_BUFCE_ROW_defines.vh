// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFCE_ROW_DEFINES_VH
`else
`define B_BUFCE_ROW_DEFINES_VH

// Look-up table parameters
//

`define BUFCE_ROW_ADDR_N  3
`define BUFCE_ROW_ADDR_SZ 32
`define BUFCE_ROW_DATA_SZ 64

// Attribute addresses
//

`define BUFCE_ROW__CE_TYPE    32'h00000000
`define BUFCE_ROW__CE_TYPE_SZ 64

`define BUFCE_ROW__IS_CE_INVERTED    32'h00000001
`define BUFCE_ROW__IS_CE_INVERTED_SZ 1

`define BUFCE_ROW__IS_I_INVERTED    32'h00000002
`define BUFCE_ROW__IS_I_INVERTED_SZ 1

`endif  // B_BUFCE_ROW_DEFINES_VH