// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MMI_DEFINES_VH
`else
`define B_MMI_DEFINES_VH

// Look-up table parameters
//

`define MMI_ADDR_N  3
`define MMI_ADDR_SZ 32
`define MMI_DATA_SZ 88

// Attribute addresses
//

`define MMI__SIM_MMI_CDO_FILE_NAME    32'h00000000
`define MMI__SIM_MMI_CDO_FILE_NAME_SZ 88

`define MMI__SIM_MMI_CDO_MODE    32'h00000001
`define MMI__SIM_MMI_CDO_MODE_SZ 32

`define MMI__SIM_VERSION    32'h00000002
`define MMI__SIM_VERSION_SZ 32

`endif  // B_MMI_DEFINES_VH