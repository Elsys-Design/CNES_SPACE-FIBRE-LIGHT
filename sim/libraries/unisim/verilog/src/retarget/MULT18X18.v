// $Header:  $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  18X18 Signed Multiplier
// /___/   /\     Filename : MULT18X18.v
// \   \  /  \    Timestamp : Thu Aug 11 04:39:40 PST 2009
//  \___\/\___\
//
// Revision:
//    08/11/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module MULT18X18 (P, A, B);

    output [35:0] P;

    input  [17:0] A;
    input  [17:0] B;

    wire   [11:0] p_temp;
DSP48E1 #(	.ACASCREG(1'b0),
	  	.ADREG(1'b0),			
	  	.ALUMODEREG(1'b0),			
	  	.AREG(1'b0),			
	  	.BCASCREG(1'b0),			
	  	.BREG(1'b0),			
	  	.CARRYINSELREG(1'b0),			
	  	.CARRYINREG(1'b0),			
	  	.CREG(1'b0),			
	  	.DREG(1'b0),			
	  	.MREG(1'b0),			
	  	.PREG(1'b0),			
                .OPMODEREG(1'b0),
                .INMODEREG(1'b0)
	) D1 (  .ACOUT(), 
		.BCOUT(), 
		.CARRYCASCOUT(), 
		.CARRYOUT(), 
		.MULTSIGNOUT(), 
		.OVERFLOW(), 
		.P({p_temp, P[35:0]}), 
	 	.PATTERNBDETECT(), 
		.PATTERNDETECT(), 
		.PCOUT(), 
		.UNDERFLOW(),
		.A({{12{A[17]}},A[17:0]}), 
                .ACIN(30'b0), 
		.ALUMODE(4'b0),
		.B(B[17:0]), 
                .BCIN(18'b0),
                .C(48'b0),
		.CLK(1'b0), 
	        .CARRYCASCIN(1'b0), 
		.CARRYIN(1'b0), 
		.CARRYINSEL(3'b0), 
		.CEA1(1'b0), 
		.CEA2(1'b0), 
		.CEAD(1'b0), 
		.CEALUMODE(1'b0), 
		.CEB1(1'b0), 
		.CEB2(1'b0), 
		.CEC(1'b0), 
		.CECARRYIN(1'b0), 
		.CECTRL(1'b0), 
		.CED(1'b0), 
		.CEINMODE(1'b0),
		.CEM(1'b0), 
	        .CEP(1'b0), 
		.D(25'b0), 
		.INMODE(5'b0), 
		.MULTSIGNIN(1'b0), 
		.PCIN(48'b0), 
		.RSTA(1'b0), 
		.RSTALLCARRYIN(1'b0), 
		.RSTALUMODE(1'b0), 
		.RSTB(1'b0), 
		.RSTC(1'b0), 
		.RSTCTRL(1'b0), 
		.RSTD(1'b0), 
		.RSTINMODE(1'b0),
		.RSTM(1'b0), 
                .OPMODE(7'b0000101),
		.RSTP(1'b0));

endmodule
