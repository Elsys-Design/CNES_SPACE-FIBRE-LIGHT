// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_XPIO_VREF_DEFINES_VH
`else
`define B_XPIO_VREF_DEFINES_VH

// Look-up table parameters
//

`define XPIO_VREF_ADDR_N  3
`define XPIO_VREF_ADDR_SZ 32
`define XPIO_VREF_DATA_SZ 88

// Attribute addresses
//

`define XPIO_VREF__ISTANDARD    32'h00000000
`define XPIO_VREF__ISTANDARD_SZ 48

`define XPIO_VREF__VOH    32'h00000001
`define XPIO_VREF__VOH_SZ 32

`define XPIO_VREF__VREF_NIB    32'h00000002
`define XPIO_VREF__VREF_NIB_SZ 88

`endif  // B_XPIO_VREF_DEFINES_VH