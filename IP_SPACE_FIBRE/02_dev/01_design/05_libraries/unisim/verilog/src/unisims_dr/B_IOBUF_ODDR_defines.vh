// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IOBUF_ODDR_DEFINES_VH
`else
`define B_IOBUF_ODDR_DEFINES_VH

// Look-up table parameters
//

`define IOBUF_ODDR_ADDR_N  5
`define IOBUF_ODDR_ADDR_SZ 32
`define IOBUF_ODDR_DATA_SZ 72

// Attribute addresses
//

`define IOBUF_ODDR__DRIVE    32'h00000000
`define IOBUF_ODDR__DRIVE_SZ 32

`define IOBUF_ODDR__EN_OMUX    32'h00000001
`define IOBUF_ODDR__EN_OMUX_SZ 40

`define IOBUF_ODDR__IOSTANDARD    32'h00000002
`define IOBUF_ODDR__IOSTANDARD_SZ 56

`define IOBUF_ODDR__SIM_INPUT_BUFFER_OFFSET    32'h00000003
`define IOBUF_ODDR__SIM_INPUT_BUFFER_OFFSET_SZ 32

`define IOBUF_ODDR__USE_IBUFDISABLE    32'h00000004
`define IOBUF_ODDR__USE_IBUFDISABLE_SZ 72

`endif  // B_IOBUF_ODDR_DEFINES_VH