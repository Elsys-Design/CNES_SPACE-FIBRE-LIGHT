// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HARD_SYNC_DEFINES_VH
`else
`define B_HARD_SYNC_DEFINES_VH

// Look-up table parameters
//

`define HARD_SYNC_ADDR_N  3
`define HARD_SYNC_ADDR_SZ 32
`define HARD_SYNC_DATA_SZ 32

// Attribute addresses
//

`define HARD_SYNC__INIT    32'h00000000
`define HARD_SYNC__INIT_SZ 1

`define HARD_SYNC__IS_CLK_INVERTED    32'h00000001
`define HARD_SYNC__IS_CLK_INVERTED_SZ 1

`define HARD_SYNC__LATENCY    32'h00000002
`define HARD_SYNC__LATENCY_SZ 32

`endif  // B_HARD_SYNC_DEFINES_VH