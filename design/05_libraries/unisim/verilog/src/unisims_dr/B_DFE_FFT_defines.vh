// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DFE_FFT_DEFINES_VH
`else
`define B_DFE_FFT_DEFINES_VH

// Look-up table parameters
//

`define DFE_FFT_ADDR_N  6
`define DFE_FFT_ADDR_SZ 32
`define DFE_FFT_DATA_SZ 64

// Attribute addresses
//

`define DFE_FFT__ACTIVE_DUTYCYCLE    32'h00000000
`define DFE_FFT__ACTIVE_DUTYCYCLE_SZ 64

`define DFE_FFT__CLK_FREQ    32'h00000001
`define DFE_FFT__CLK_FREQ_SZ 64

`define DFE_FFT__MAX_POINT_SIZE    32'h00000002
`define DFE_FFT__MAX_POINT_SIZE_SZ 32

`define DFE_FFT__POINT_SIZE    32'h00000003
`define DFE_FFT__POINT_SIZE_SZ 32

`define DFE_FFT__THROUGHPUT    32'h00000004
`define DFE_FFT__THROUGHPUT_SZ 64

`define DFE_FFT__XPA_CFG0    32'h00000005
`define DFE_FFT__XPA_CFG0_SZ 16

`endif  // B_DFE_FFT_DEFINES_VH