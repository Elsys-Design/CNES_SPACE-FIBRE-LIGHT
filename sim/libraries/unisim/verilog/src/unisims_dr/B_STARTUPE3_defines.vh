// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_STARTUPE3_DEFINES_VH
`else
`define B_STARTUPE3_DEFINES_VH

// Look-up table parameters
//

`define STARTUPE3_ADDR_N  2
`define STARTUPE3_ADDR_SZ 32
`define STARTUPE3_DATA_SZ 64

// Attribute addresses
//

`define STARTUPE3__PROG_USR    32'h00000000
`define STARTUPE3__PROG_USR_SZ 40

`define STARTUPE3__SIM_CCLK_FREQ    32'h00000001
`define STARTUPE3__SIM_CCLK_FREQ_SZ 64

`endif  // B_STARTUPE3_DEFINES_VH