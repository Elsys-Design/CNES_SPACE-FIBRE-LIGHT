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
// /___/   /\     Filename : DSP48E.v
// \   \  /  \    Timestamp : Thu Aug 10 2:58:16 PST 2009
//  \___\/\___\
//
// Revision:
//    08/10/09 - Initial version.
//    08/10/12 - 669725 change USE_MULT mapping
//    03/06/13 - 704308 change AUTORESET_PATDET mapping
//    03/06/13 - 703959 added SEL_MASK mapping
// End Revision
`timescale 1 ps/1 ps

module DSP48E (ACOUT, BCOUT, CARRYCASCOUT, CARRYOUT, MULTSIGNOUT, OVERFLOW, P, PATTERNBDETECT, PATTERNDETECT, PCOUT, UNDERFLOW, A, ACIN, ALUMODE, B, BCIN, C, CARRYCASCIN, CARRYIN, CARRYINSEL, CEA1, CEA2, CEALUMODE, CEB1, CEB2, CEC, CECARRYIN, CECTRL, CEM, CEMULTCARRYIN, CEP, CLK, MULTSIGNIN, OPMODE, PCIN, RSTA, RSTALLCARRYIN, RSTALUMODE, RSTB, RSTC, RSTCTRL, RSTM, RSTP); 

    parameter SIM_MODE = "SAFE";

    parameter integer ACASCREG = 1;
    parameter integer ALUMODEREG = 1;
    parameter integer AREG = 1;
    parameter AUTORESET_PATTERN_DETECT = "FALSE"; // Changed HHK
    parameter AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
    parameter A_INPUT = "DIRECT";
    parameter integer BCASCREG = 1;
    parameter integer BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter integer CARRYINREG = 1;
    parameter integer CARRYINSELREG = 1;
    parameter integer CREG = 1;
    parameter [47:0] MASK =  48'h3FFFFFFFFFFF;
    parameter integer MREG = 1;
    parameter integer MULTCARRYINREG = 1;
    parameter integer OPMODEREG = 1;
    parameter [47:0] PATTERN =  48'h000000000000;
    parameter integer PREG = 1;
    parameter SEL_MASK = "MASK";
    parameter SEL_PATTERN = "PATTERN";
    parameter SEL_ROUNDING_MASK = "SEL_MASK";
    parameter USE_MULT = "MULT_S"; //Changed HHK

    parameter USE_PATTERN_DETECT = "NO_PATDET";
    parameter USE_SIMD = "ONE48";

    output [29:0] ACOUT; 
    output [17:0] BCOUT; 
    output CARRYCASCOUT;
    output [3:0] CARRYOUT;
    output MULTSIGNOUT;
    output OVERFLOW;
    output [47:0] P; 
    output PATTERNBDETECT;
    output PATTERNDETECT;
    output [47:0] PCOUT;
    output UNDERFLOW;

    input [29:0] A;
    input [29:0] ACIN;
    input [3:0] ALUMODE;
    input [17:0] B;
    input [17:0] BCIN;
    input [47:0] C;
    input CARRYCASCIN;
    input CARRYIN;
    input [2:0] CARRYINSEL;
    input CEA1;
    input CEA2;
    input CEALUMODE;
    input CEB1;
    input CEB2;
    input CEC;
    input CECARRYIN;
    input CECTRL;
    input CEM;
    input CEMULTCARRYIN;
    input CEP;
    input CLK;
    input MULTSIGNIN;
    input [6:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTALLCARRYIN;
    input RSTALUMODE;
    input RSTB;
    input RSTC;
    input RSTCTRL;
    input RSTM;  
    input RSTP;

// 704308 - expand selection to include _OPTINV for RESET_NOT_MATCH
// and allow wrong values to fall through for checking in DSP48E1.
// was - localparam AUTORESET_PATTERN_DETECT_E1 = (AUTORESET_PATTERN_DETECT == "FALSE") ? "NO_RESET" : "RESET_MATCH";
// pass along AUTORESET_PATTERN_DETECT value if not == TRUE FALSE
// pass along AUTORESET_PATTERN_DETECT_OPTINV value if not == MATCH NOT_MATCH
    localparam AUTORESET_PATTERN_DETECT_E1 =
             (AUTORESET_PATTERN_DETECT == "FALSE") ?              "NO_RESET" :
             (AUTORESET_PATTERN_DETECT == "TRUE") ?
             ((AUTORESET_PATTERN_DETECT_OPTINV == "MATCH") ?     "RESET_MATCH" :
              (AUTORESET_PATTERN_DETECT_OPTINV == "NOT_MATCH") ? "RESET_NOT_MATCH" : 
             {"DSP48E_RETARGET_TRUE_",AUTORESET_PATTERN_DETECT_OPTINV}) :
             {"DSP48E_RETARGET_",AUTORESET_PATTERN_DETECT,"_",AUTORESET_PATTERN_DETECT_OPTINV};

    localparam USE_MULT_E1 = (USE_MULT == "MULT_S") ? "MULTIPLY" : ((USE_MULT == "MULT") ? "DYNAMIC" : USE_MULT);

// 703959 added
    localparam SEL_MASK_E1 = (SEL_ROUNDING_MASK == "SEL_MASK") ? SEL_MASK  :
                             (SEL_ROUNDING_MASK == "MODE1") ? "ROUNDING_MODE1"  :
                             (SEL_ROUNDING_MASK == "MODE2") ? "ROUNDING_MODE2"  :
                              SEL_ROUNDING_MASK;

DSP48E1 #(	.ACASCREG(ACASCREG),
	  	.ADREG(1'b0),			
	  	.ALUMODEREG(ALUMODEREG),			
	  	.AREG(AREG),			
	  	.AUTORESET_PATDET(AUTORESET_PATTERN_DETECT_E1),			
	  	.A_INPUT(A_INPUT),			
	  	.BCASCREG(BCASCREG),			
	  	.BREG(BREG),			
	  	.B_INPUT(B_INPUT),			
	  	.CARRYINREG(CARRYINREG),			
	  	.CARRYINSELREG(CARRYINSELREG),			
	  	.CREG(CREG),			
	  	.DREG(1'b0),			
	  	.INMODEREG(1'b0),			
	  	.MASK(MASK),			
	  	.MREG(MREG),			
	  	.OPMODEREG(OPMODEREG),			
	  	.PATTERN(PATTERN),			
	  	.PREG(PREG),			
	  	.SEL_MASK(SEL_MASK_E1),			
	  	.SEL_PATTERN(SEL_PATTERN),			
	  	.USE_MULT(USE_MULT_E1),			
	  	.USE_PATTERN_DETECT(USE_PATTERN_DETECT),			
	  	.USE_SIMD(USE_SIMD)			
	) D1 (  .ACOUT(ACOUT), 
		.BCOUT(BCOUT), 
		.CARRYCASCOUT(CARRYCASCOUT), 
		.CARRYOUT(CARRYOUT), 
		.MULTSIGNOUT(MULTSIGNOUT), 
		.OVERFLOW(OVERFLOW), 
		.P(P), 
		.PATTERNBDETECT(PATTERNBDETECT), 
		.PATTERNDETECT(PATTERNDETECT), 
		.PCOUT(PCOUT), 
		.UNDERFLOW(UNDERFLOW), 
		.A(A), 
		.ACIN(ACIN), 
		.ALUMODE(ALUMODE), 
		.B(B), 
		.BCIN(BCIN), 
		.C(C), 
		.CARRYCASCIN(CARRYCASCIN), 
		.CARRYIN(CARRYIN), 
		.CARRYINSEL(CARRYINSEL), 
		.CEA1(CEA1), 
		.CEA2(CEA2), 
		.CEAD(1'b0), 
		.CEALUMODE(CEALUMODE), 
		.CEB1(CEB1), 
		.CEB2(CEB2), 
		.CEC(CEC), 
		.CECARRYIN(CECARRYIN), 
		.CECTRL(CECTRL), 
		.CED(1'b0), 
		.CEINMODE(1'b0), 
		.CEM(CEM), 
		.CEP(CEP), 
		.CLK(CLK), 
		.D(25'b0), 
		.INMODE(5'b0), 
		.MULTSIGNIN(MULTSIGNIN), 
		.OPMODE(OPMODE), 
		.PCIN(PCIN), 
		.RSTA(RSTA), 
		.RSTALLCARRYIN(RSTALLCARRYIN), 
		.RSTALUMODE(RSTALUMODE), 
		.RSTB(RSTB), 
		.RSTC(RSTC), 
		.RSTCTRL(RSTCTRL), 
		.RSTD(1'b0), 
		.RSTINMODE(1'b0), 
		.RSTM(RSTM), 
		.RSTP(RSTP));

endmodule

