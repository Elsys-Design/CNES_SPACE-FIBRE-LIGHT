// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_NPI_NIR_DEFINES_VH
`else
`define B_NPI_NIR_DEFINES_VH

// Look-up table parameters
//

`define NPI_NIR_ADDR_N  3
`define NPI_NIR_ADDR_SZ 32
`define NPI_NIR_DATA_SZ 30

// Attribute addresses
//

`define NPI_NIR__REG_CNTL    32'h00000000
`define NPI_NIR__REG_CNTL_SZ 23

`define NPI_NIR__REG_SRVC    32'h00000001
`define NPI_NIR__REG_SRVC_SZ 3

`define NPI_NIR__REG_TIMEBASE_SEL    32'h00000002
`define NPI_NIR__REG_TIMEBASE_SEL_SZ 30

`endif  // B_NPI_NIR_DEFINES_VH