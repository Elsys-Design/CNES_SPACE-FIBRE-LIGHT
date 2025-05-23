// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HBM_IO_CHNL_DEFINES_VH
`else
`define B_HBM_IO_CHNL_DEFINES_VH

// Look-up table parameters
//

`define HBM_IO_CHNL_ADDR_N  1
`define HBM_IO_CHNL_ADDR_SZ 32
`define HBM_IO_CHNL_DATA_SZ 24

// Attribute addresses
//

`define HBM_IO_CHNL__SIM_MODEL_TYPE    32'h00000000
`define HBM_IO_CHNL__SIM_MODEL_TYPE_SZ 24

`endif  // B_HBM_IO_CHNL_DEFINES_VH