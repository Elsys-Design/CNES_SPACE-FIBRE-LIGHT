///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1i (M48)
//  \   \         Description : Xilinx Timing Simulation Library Component
//  /   /                 System Monitor 
// /___/   /\     Filename  : SYSMON.v
// \   \  /  \    Timestamp : Tue Sep 7 15:55:27 PST 2010
//  \___\/\___\
//
// Revision:
//    09/07/10 - Initial version.


`timescale 1ps / 1ps

module SYSMON (
        ALM,
        BUSY,
        CHANNEL,
        DO,
        DRDY,
        EOC,
        EOS,
        JTAGBUSY,
        JTAGLOCKED,
        JTAGMODIFIED,
        OT,
        CONVST,
        CONVSTCLK,
        DADDR,
        DCLK,
        DEN,
        DI,
        DWE,
        RESET,
        VAUXN,
        VAUXP,
        VN,
        VP

);

output BUSY;
output DRDY;
output EOC;
output EOS;
output JTAGBUSY;
output JTAGLOCKED;
output JTAGMODIFIED;
output OT;
output [15:0] DO;
output [2:0] ALM;
output [4:0] CHANNEL;

input CONVST;
input CONVSTCLK;
input DCLK;
input DEN;
input DWE;
input RESET;
input VN;
input VP;
input [15:0] DI;
input [15:0] VAUXN;
input [15:0] VAUXP;
input [6:0] DADDR;

    parameter  [15:0] INIT_40 = 16'h0;
    parameter  [15:0] INIT_41 = 16'h0;
    parameter  [15:0] INIT_42 = 16'h0800;
    parameter  [15:0] INIT_43 = 16'h0;
    parameter  [15:0] INIT_44 = 16'h0;
    parameter  [15:0] INIT_45 = 16'h0;
    parameter  [15:0] INIT_46 = 16'h0;
    parameter  [15:0] INIT_47 = 16'h0;
    parameter  [15:0] INIT_48 = 16'h0;
    parameter  [15:0] INIT_49 = 16'h0;
    parameter  [15:0] INIT_4A = 16'h0;
    parameter  [15:0] INIT_4B = 16'h0;
    parameter  [15:0] INIT_4C = 16'h0;
    parameter  [15:0] INIT_4D = 16'h0;
    parameter  [15:0] INIT_4E = 16'h0;
    parameter  [15:0] INIT_4F = 16'h0;
    parameter  [15:0] INIT_50 = 16'h0;
    parameter  [15:0] INIT_51 = 16'h0;
    parameter  [15:0] INIT_52 = 16'h0;
    parameter  [15:0] INIT_53 = 16'h0;
    parameter  [15:0] INIT_54 = 16'h0;
    parameter  [15:0] INIT_55 = 16'h0;
    parameter  [15:0] INIT_56 = 16'h0;
    parameter  [15:0] INIT_57 = 16'h0;
    parameter SIM_DEVICE = "VIRTEX5";
    parameter SIM_MONITOR_FILE = "design.txt";

    wire [4:0] dummy_ALM;

XADC #(	        .INIT_40(INIT_40),			
	  	.INIT_41(INIT_41),			
	  	.INIT_42(INIT_42),			
	  	.INIT_43(INIT_43),			
	  	.INIT_44(INIT_44),			
	  	.INIT_45(INIT_45),			
	  	.INIT_46(INIT_46),			
	  	.INIT_47(INIT_47),			
	  	.INIT_48(INIT_48),			
	  	.INIT_49(INIT_49),			
	  	.INIT_4A(INIT_4A),			
	  	.INIT_4B(INIT_4B),			
	  	.INIT_4C(INIT_4C),			
	  	.INIT_4D(INIT_4D),			
	  	.INIT_4E(INIT_4E),			
	  	.INIT_4F(INIT_4F),			
	  	.INIT_50(INIT_50),			
	  	.INIT_51(INIT_51),			
	  	.INIT_52(INIT_52),			
	  	.INIT_53(INIT_53),			
	  	.INIT_54(INIT_54),			
	  	.INIT_55(INIT_55),			
	  	.INIT_56(INIT_56),			
	  	.INIT_57(INIT_57),			
	  	.SIM_MONITOR_FILE(SIM_MONITOR_FILE)			
	) X1 (  .ALM({dummy_ALM[4:0], ALM[2:0]}), 
		.BUSY(BUSY),
		.CHANNEL(CHANNEL),
		.DO(DO),
		.DRDY(DRDY),
		.EOC(EOC),
		.EOS(EOS),
		.JTAGBUSY(JTAGBUSY),
		.JTAGLOCKED(JTAGLOCKED),
		.JTAGMODIFIED(JTAGMODIFIED),
		.MUXADDR(),
		.OT(OT),
		.CONVST(CONVST),
		.CONVSTCLK(CONVSTCLK),
		.DADDR(DADDR),
		.DCLK(DCLK),
		.DEN(DEN),
		.DI(DI),
		.DWE(DWE),
		.RESET(RESET),
		.VAUXN(VAUXN),
		.VAUXP(VAUXP),
		.VN(VN),
	        .VP(VP));

endmodule
