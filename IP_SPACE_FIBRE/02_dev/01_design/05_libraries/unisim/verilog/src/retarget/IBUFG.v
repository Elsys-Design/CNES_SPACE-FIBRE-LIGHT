// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 14.3
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /                  Input Clock Buffer
// /___/   /\     Filename : IBUFG.v
// \   \  /  \    
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    07/16/08 - Added IBUF_LOW_PWR attribute.
//    04/22/09 - CR 519127 - Changed IBUF_LOW_PWR default to TRUE.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/30/12 - 669140 - retarget to IBUF variant
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module IBUFG (O, I);

    parameter CAPACITANCE = "DONT_CARE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O;
    input  I;

    wire O;

    IBUF # (
        .CAPACITANCE(CAPACITANCE),
        .IBUF_DELAY_VALUE(IBUF_DELAY_VALUE),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IFD_DELAY_VALUE("AUTO"),
        .IOSTANDARD(IOSTANDARD)
) B1 (
        .O (O),
        .I (I)
);
    
endmodule

`endcelldefine
