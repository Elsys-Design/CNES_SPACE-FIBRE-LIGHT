// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_LUT3_DEFINES_VH
`else
`define B_LUT3_DEFINES_VH

// Look-up table parameters
//

`define LUT3_ADDR_N  1
`define LUT3_ADDR_SZ 32
`define LUT3_DATA_SZ 8

// Attribute addresses
//

`define LUT3__INIT    32'h00000000
`define LUT3__INIT_SZ 8

`endif  // B_LUT3_DEFINES_VH