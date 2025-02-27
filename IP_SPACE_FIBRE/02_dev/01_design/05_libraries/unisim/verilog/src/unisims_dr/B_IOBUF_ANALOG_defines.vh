// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     mk_defines_vh 3.0001
//    Built On:     Fri Sep 11 10:13:45 2015
//    Bundle:       HPIO
//    Architecture: diablo
//    Snapshot Dir: /tmp/sqMfCxkZ4L
// Environment Variables:
//    XILENV=""
//    MYXILENV=""
//

`ifdef B_IOBUF_ANALOG_DEFINES_VH
`else
`define B_IOBUF_ANALOG_DEFINES_VH

// Look-up table parameters
//

`define IOBUF_ANALOG_ADDR_N  4
`define IOBUF_ANALOG_ADDR_SZ 32
`define IOBUF_ANALOG_DATA_SZ 192

// Attribute addresses
//

`define IOBUF_ANALOG__DRIVE   	32'h0000	// Type=DECIMAL; Min=2, Max=24
`define IOBUF_ANALOG__DRIVE_SZ	32

`define IOBUF_ANALOG__IBUF_LOW_PWR          32'h0001        // Type=BOOLSTRING; Values=TRUE,FALSE
`define IOBUF_ANALOG__IBUF_LOW_PWR_SZ       40

`define IOBUF_ANALOG__IOSTANDARD   	32'h0002	// Type=STRING; Min=, Max=
`define IOBUF_ANALOG__IOSTANDARD_SZ	192

`define IOBUF_ANALOG__SLEW   	32'h0003	// Type=STRING; Values=SLOW,FAST,MEDIUM
`define IOBUF_ANALOG__SLEW_SZ	48

`endif  // B_IOBUF_ANALOG_DEFINES_VH
