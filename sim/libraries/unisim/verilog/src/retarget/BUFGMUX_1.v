// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/BUFGMUX_1.v,v 1.15 2009/08/21 23:55:43 harikr Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Global Clock Mux Buffer with Output State 1
// /___/   /\     Filename : BUFGMUX_1.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:14 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    01/11/08 - Add CLK_SEL_TYPE attribute.
//    12/13/11 - Added `celldefine and `endcelldefine (CR 524859).
//    03/02/12 - model retargets to BUFGCTRL (CR 647981)
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module BUFGMUX_1 (O, I0, I1, S);

    parameter CLK_SEL_TYPE = "SYNC";
    output O;

    input  I0, I1, S;

    pullup P1 (O);

    wire NS;
    wire IG0, IG1;

     assign IG0 = (CLK_SEL_TYPE == "SYNC") ? 1'b0 : 1'b1;
     assign IG1 = (CLK_SEL_TYPE == "SYNC") ? 1'b0 : 1'b1;

    BUFGCTRL #(
    .INIT_OUT (1),
    .PRESELECT_I0 ("TRUE"),
    .PRESELECT_I1 ("FALSE"))
    BUFGCTRL_BUFGMUX_1
    (.O (O),
    .CE0 (NS),
    .CE1 (S),
    .I0 (I0),
    .I1 (I1),
    .IGNORE0 (IG0),
    .IGNORE1 (IG1),
    .S0 (1'b1),
    .S1 (1'b1));

    INV INV_S (
    .O (NS),
    .I (S)
    );

  specify

      specparam PATHPULSE$ = 0;

  endspecify

endmodule

`endcelldefine
