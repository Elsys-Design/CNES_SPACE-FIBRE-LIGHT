// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HNICX_DEFINES_VH
`else
`define B_HNICX_DEFINES_VH

// Look-up table parameters
//

`define HNICX_ADDR_N  6
`define HNICX_ADDR_SZ 32
`define HNICX_DATA_SZ 112

// Attribute addresses
//

`define HNICX__HNICX_DATA_RATE    32'h00000000
`define HNICX__HNICX_DATA_RATE_SZ 72

`define HNICX__HNICX_DPU_MODE_CRYPTO_OPTIONS    32'h00000001
`define HNICX__HNICX_DPU_MODE_CRYPTO_OPTIONS_SZ 112

`define HNICX__HNICX_PACKET_SIZE    32'h00000002
`define HNICX__HNICX_PACKET_SIZE_SZ 11

`define HNICX__SIM_AES_EN    32'h00000003
`define HNICX__SIM_AES_EN_SZ 40

`define HNICX__SIM_CM_EN    32'h00000004
`define HNICX__SIM_CM_EN_SZ 40

`define HNICX__SIM_VERSION    32'h00000005
`define HNICX__SIM_VERSION_SZ 2

`endif  // B_HNICX_DEFINES_VH