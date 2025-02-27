///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Boundary Scan Logic Control Circuit for SPARTAN3A
// /___/   /\     Filename : BSCAN_SPARTAN3A.v
// \   \  /  \    Timestamp : Thu Aug 4 09:41:40 PDT 2011
//  \___\/\___\
//
// Revision:
//    08/04/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BSCAN_SPARTAN3A (CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TCK, TDI, TMS, UPDATE, TDO1, TDO2);

    output CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TCK, TDI, TMS, UPDATE;
    input TDO1, TDO2;

initial begin
    $display ("ERROR : The following component BSCAN_SPARTAN3A at instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com.");
    $finish;
end

endmodule // BSCAN_SPARTAN3A
