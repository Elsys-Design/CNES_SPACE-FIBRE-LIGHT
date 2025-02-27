// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_EFUSE_USR_DEFINES_VH
`else
`define B_EFUSE_USR_DEFINES_VH

// Look-up table parameters
//

`define EFUSE_USR_ADDR_N  1
`define EFUSE_USR_ADDR_SZ 32
`define EFUSE_USR_DATA_SZ 32

// Attribute addresses
//

`define EFUSE_USR__SIM_EFUSE_VALUE    32'h00000000
`define EFUSE_USR__SIM_EFUSE_VALUE_SZ 32

`endif  // B_EFUSE_USR_DEFINES_VH