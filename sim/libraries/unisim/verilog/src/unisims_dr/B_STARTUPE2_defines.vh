// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_STARTUPE2_DEFINES_VH
`else
`define B_STARTUPE2_DEFINES_VH

// Look-up table parameters
//

`define STARTUPE2_ADDR_N  2
`define STARTUPE2_ADDR_SZ 32
`define STARTUPE2_DATA_SZ 64

// Attribute addresses
//

`define STARTUPE2__PROG_USR    32'h00000000
`define STARTUPE2__PROG_USR_SZ 40

`define STARTUPE2__SIM_CCLK_FREQ    32'h00000001
`define STARTUPE2__SIM_CCLK_FREQ_SZ 64

`endif  // B_STARTUPE2_DEFINES_VH