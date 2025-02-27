// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_VDU_DEFINES_VH
`else
`define B_VDU_DEFINES_VH

// Look-up table parameters
//

`define VDU_ADDR_N  8
`define VDU_ADDR_SZ 32
`define VDU_DATA_SZ 72

// Attribute addresses
//

`define VDU__CORE_CODING_STANDARD    32'h00000000
`define VDU__CORE_CODING_STANDARD_SZ 32

`define VDU__CORE_COLOR_DEPTH    32'h00000001
`define VDU__CORE_COLOR_DEPTH_SZ 32

`define VDU__CORE_COLOR_FORMAT    32'h00000002
`define VDU__CORE_COLOR_FORMAT_SZ 32

`define VDU__CORE_FRAME_PER_SECOND    32'h00000003
`define VDU__CORE_FRAME_PER_SECOND_SZ 32

`define VDU__CORE_FRAME_TYPE    32'h00000004
`define VDU__CORE_FRAME_TYPE_SZ 72

`define VDU__CORE_FREQUENCY    32'h00000005
`define VDU__CORE_FREQUENCY_SZ 64

`define VDU__CORE_NO_OF_STREAMS    32'h00000006
`define VDU__CORE_NO_OF_STREAMS_SZ 32

`define VDU__CORE_RESOLUTION    32'h00000007
`define VDU__CORE_RESOLUTION_SZ 72

`endif  // B_VDU_DEFINES_VH