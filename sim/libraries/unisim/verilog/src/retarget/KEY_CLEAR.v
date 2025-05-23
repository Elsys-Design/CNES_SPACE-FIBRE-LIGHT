///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /
// /___/   /\     Filename : KEY_CLEAR.v 
// \   \  /  \    Timestamp : Wed Aug 28 10:57:43 PDT 2010
//  \___\/\___\
//
// Revision:
//    07/28/10 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module KEY_CLEAR (
	KEYCLEARB
);

input KEYCLEARB;

STARTUPE2 S7 ( .CFGCLK(), .CFGMCLK(), .EOS(), .PREQ(), .CLK(1'b0), .GSR(1'b0), .GTS(1'b0), .KEYCLEARB(KEYCLEARB), .PACK(1'b0), .USRCCLKO(1'b0), .USRCCLKTS(1'b0), .USRDONEO(1'b0), .USRDONETS(1'b0));

endmodule
