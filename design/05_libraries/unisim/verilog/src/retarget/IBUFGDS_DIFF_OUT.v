// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2012 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 14.3
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /                  Differential Signaling Input Clock Buffer with Differential Outputs
// /___/   /\     Filename : IBUFGDS_DIFF_OUT.v
// \   \  /  \    
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    02/10/09 - CR 430124 -- Added attribute DIFF_TERM.
//    06/02/09 - CR 523083 -- Added attribute IBUF_LOW_PWR.
//    11/03/10 - CR 576577 -- changed default value of IOSTANDARD from LVDS_25 to DEFAULT.
//    09/30/11 - CR 626400 -- Added PATHPULSE
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    07/30/12 - 669140 - retarget to IBUF variant
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module IBUFGDS_DIFF_OUT (O, OB, I, IB);

    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O, OB;

    input  I, IB;

    wire O, OB;

    IBUFDS_DIFF_OUT # (
        .DIFF_TERM(DIFF_TERM),
        .DQS_BIAS(DQS_BIAS),
        .IBUF_LOW_PWR(IBUF_LOW_PWR),
        .IOSTANDARD(IOSTANDARD)
) B1 (
        .O (O),
        .OB (OB),
        .I (I),
        .IB (IB)
);

endmodule

`endcelldefine
