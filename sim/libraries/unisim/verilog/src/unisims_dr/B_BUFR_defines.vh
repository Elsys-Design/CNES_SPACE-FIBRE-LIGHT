// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_BUFR_DEFINES_VH
`else
`define B_BUFR_DEFINES_VH

// Look-up table parameters
//

`define BUFR_ADDR_N  2
`define BUFR_ADDR_SZ 32
`define BUFR_DATA_SZ 56

// Attribute addresses
//

`define BUFR__BUFR_DIVIDE    32'h00000000
`define BUFR__BUFR_DIVIDE_SZ 48

`define BUFR__SIM_DEVICE    32'h00000001
`define BUFR__SIM_DEVICE_SZ 56

`endif  // B_BUFR_DEFINES_VH