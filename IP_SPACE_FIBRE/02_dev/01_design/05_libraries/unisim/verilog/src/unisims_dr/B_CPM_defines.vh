// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_CPM_DEFINES_VH
`else
`define B_CPM_DEFINES_VH

// Look-up table parameters
//

`define CPM_ADDR_N  8
`define CPM_ADDR_SZ 32
`define CPM_DATA_SZ 128

// Attribute addresses
//

`define CPM__CPM_MODE_0    32'h00000000
`define CPM__CPM_MODE_0_SZ 128

`define CPM__CPM_MODE_1    32'h00000001
`define CPM__CPM_MODE_1_SZ 80

`define CPM__LINK_SPEED_0    32'h00000002
`define CPM__LINK_SPEED_0_SZ 48

`define CPM__LINK_SPEED_1    32'h00000003
`define CPM__LINK_SPEED_1_SZ 48

`define CPM__LINK_WIDTH_0    32'h00000004
`define CPM__LINK_WIDTH_0_SZ 32

`define CPM__LINK_WIDTH_1    32'h00000005
`define CPM__LINK_WIDTH_1_SZ 32

`define CPM__PCI_CHANNELS    32'h00000006
`define CPM__PCI_CHANNELS_SZ 32

`define CPM__SIM_CPM_CDO_FILE_NAME    32'h00000007
`define CPM__SIM_CPM_CDO_FILE_NAME_SZ 88

`endif  // B_CPM_DEFINES_VH