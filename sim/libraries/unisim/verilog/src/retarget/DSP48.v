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
//  /   /                  18X18 Signed Multiplier Followed by Three-Input Adder plus ALU with Pipeline Registers
// /___/   /\     Filename : DSP48.v
// \   \  /  \    Timestamp : Thu Aug 12 12:27:30 PST 2009
//  \___\/\___\
//
// Revision:
//    08/12/09 - Initial version.
// End Revision
`timescale 1 ps/1 ps

module DSP48 (BCOUT, P, PCOUT, A, B, BCIN, C, CARRYIN, CARRYINSEL, CEA, CEB, CEC, CECARRYIN, CECINSUB, CECTRL, CEM, CEP, CLK, OPMODE, PCIN, RSTA, RSTB, RSTC, RSTCARRYIN, RSTCTRL, RSTM, RSTP, SUBTRACT); 

    output [17:0] BCOUT; 
    output [47:0] P; 
    output [47:0] PCOUT;

    input [17:0] A;
    input [17:0] B;
    input [17:0] BCIN;
    input [47:0] C;
    input CARRYIN;
    input [1:0] CARRYINSEL;
    input CEA;
    input CEB;
    input CEC;
    input CECARRYIN;
    input CECINSUB;
    input CECTRL;
    input CEM;
    input CEP;
    input CLK;
    input [6:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTB;
    input RSTC;
    input RSTCARRYIN;
    input RSTCTRL;
    input RSTM;  
    input RSTP;
    input SUBTRACT; 

    parameter integer AREG = 1;
    parameter integer BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter integer CARRYINREG = 1;
    parameter integer CARRYINSELREG = 1;
    parameter integer CREG = 1;
    parameter LEGACY_MODE = "MULT18X18S";
    parameter integer MREG = 1;
    parameter integer OPMODEREG = 1;
    parameter integer PREG = 1;
    parameter integer SUBTRACTREG = 1;
    localparam LEGACY_MODE_E1 = (LEGACY_MODE == "MULT18X18S" || LEGACY_MODE == "MULT18X18") ? "MULTIPLY" : "NONE";

    wire [3:0] SUBTRACT_E1 = (SUBTRACT == 1'b0) ? 4'h0 : 4'h3;


DSP48E1 #(	
                .ACASCREG(AREG),
	  	.ADREG(1'b0),			
	  	.ALUMODEREG(SUBTRACTREG),			
	  	.AREG(AREG),			
	  	.BCASCREG(BREG),			
	  	.BREG(BREG),			

	  	.B_INPUT(B_INPUT),			
	  	.CARRYINREG(CARRYINREG),			
	  	.CARRYINSELREG(CARRYINSELREG),			
	  	.CREG(CREG),			
	  	.DREG(1'b0),			
	  	.INMODEREG(1'b0),			

	  	.MREG(MREG),			
	  	.OPMODEREG(OPMODEREG),			
	  	.PREG(PREG),			

	  	.USE_MULT(LEGACY_MODE_E1)			
	) D1 (  .ACOUT(), 
		.BCOUT(BCOUT), 
		.CARRYCASCOUT(), 
		.CARRYOUT(), 
		.MULTSIGNOUT(), 
		.OVERFLOW(), 
		.P(P), 
		.PATTERNBDETECT(), 
		.PATTERNDETECT(), 
		.PCOUT(PCOUT), 
		.UNDERFLOW(), 
		.A({{12{A[17]}},A}), 
		.ACIN(30'b0), 
		.ALUMODE(SUBTRACT_E1), 
		.B(B), 
		.BCIN(BCIN), 
		.C(C), 
		.CARRYCASCIN(1'b0), 
		.CARRYIN(CARRYIN), 
		.CARRYINSEL({1'b0,CARRYINSEL}), 
		.CEA1(CEA), 
		.CEA2(CEA), 
		.CEAD(1'b0), 
		.CEALUMODE(CECINSUB), 
		.CEB1(CEB), 
		.CEB2(CEB), 
		.CEC(CEC), 
		.CECARRYIN(CECINSUB), 
		.CECTRL(CECTRL), 
		.CED(1'b0), 
		.CEINMODE(1'b0), 
		.CEM(CEM), 
		.CEP(CEP), 
		.CLK(CLK), 
		.D(25'b0), 
		.INMODE(5'b0), 
		.MULTSIGNIN(1'b0), 
		.OPMODE(OPMODE), 
		.PCIN(PCIN), 
		.RSTA(RSTA), 
		.RSTALLCARRYIN(RSTCARRYIN), 
		.RSTALUMODE(RSTCTRL), 
		.RSTB(RSTB), 
		.RSTC(RSTC), 
		.RSTCTRL(RSTCTRL), 
		.RSTD(1'b0), 
		.RSTINMODE(1'b0), 
		.RSTM(RSTM), 
		.RSTP(RSTP));

endmodule

