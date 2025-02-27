// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HPIO_VREF_DEFINES_VH
`else
`define B_HPIO_VREF_DEFINES_VH

// Look-up table parameters
//

`define HPIO_VREF_ADDR_N  1
`define HPIO_VREF_ADDR_SZ 32
`define HPIO_VREF_DATA_SZ 104

// Attribute addresses
//

`define HPIO_VREF__VREF_CNTR    32'h00000000
`define HPIO_VREF__VREF_CNTR_SZ 104

`endif  // B_HPIO_VREF_DEFINES_VH