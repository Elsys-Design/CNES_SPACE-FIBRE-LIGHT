// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BSCANE2_DEFINES_VH
`else
`define B_BSCANE2_DEFINES_VH

// Look-up table parameters
//

`define BSCANE2_ADDR_N  2
`define BSCANE2_ADDR_SZ 32
`define BSCANE2_DATA_SZ 40

// Attribute addresses
//

`define BSCANE2__DISABLE_JTAG    32'h00000000
`define BSCANE2__DISABLE_JTAG_SZ 40

`define BSCANE2__JTAG_CHAIN    32'h00000001
`define BSCANE2__JTAG_CHAIN_SZ 32

`endif  // B_BSCANE2_DEFINES_VH