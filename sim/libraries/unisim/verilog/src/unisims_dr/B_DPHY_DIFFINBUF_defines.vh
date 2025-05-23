// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DPHY_DIFFINBUF_DEFINES_VH
`else
`define B_DPHY_DIFFINBUF_DEFINES_VH

// Look-up table parameters
//

`define DPHY_DIFFINBUF_ADDR_N  2
`define DPHY_DIFFINBUF_ADDR_SZ 32
`define DPHY_DIFFINBUF_DATA_SZ 56

// Attribute addresses
//

`define DPHY_DIFFINBUF__DIFF_TERM    32'h00000000
`define DPHY_DIFFINBUF__DIFF_TERM_SZ 40

`define DPHY_DIFFINBUF__ISTANDARD    32'h00000001
`define DPHY_DIFFINBUF__ISTANDARD_SZ 56

`endif  // B_DPHY_DIFFINBUF_DEFINES_VH