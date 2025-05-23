// $Header: $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Retarget Simulation Library Component
//  /   /             Digital Clock Manager with Basic and Phase Shift Features (Discontinue in 13.1)
// /___/   /\     Filename : DCM_PS.v
// \   \  /  \    Timestamp : Thu Aug 31 03:40:09 PST 2009
//  \___\/\___\
//
// Revision:
//    08/31/09 - Initial version

`timescale  1 ps / 1 ps

module DCM_PS (
	CLK0,
	CLK180,
	CLK270,
	CLK2X,
	CLK2X180,
	CLK90,
	CLKDV,
	CLKFX,
	CLKFX180,
	DO,
	LOCKED,
	PSDONE,
	CLKFB,
	CLKIN,
	PSCLK,
	PSEN,
	PSINCDEC,
	RST
);

parameter real CLKDV_DIVIDE = 2.0;
parameter integer CLKFX_DIVIDE = 1;
parameter integer CLKFX_MULTIPLY = 4;
parameter CLKIN_DIVIDE_BY_2 = "FALSE";
parameter real CLKIN_PERIOD = 10.0;
parameter CLKOUT_PHASE_SHIFT = "NONE";
parameter CLK_FEEDBACK = "1X";
parameter DCM_AUTOCALIBRATION = "TRUE";
parameter DCM_PERFORMANCE_MODE = "MAX_SPEED";
parameter DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";
parameter DFS_FREQUENCY_MODE = "LOW";
parameter DLL_FREQUENCY_MODE = "LOW";
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter [15:0] FACTORY_JF = 16'hF0F0;
parameter integer PHASE_SHIFT = 0;
parameter STARTUP_WAIT = "FALSE";


output CLK0;
output CLK180;
output CLK270;
output CLK2X180;
output CLK2X;
output CLK90;
output CLKDV;
output CLKFX180;
output CLKFX;
output LOCKED;
output PSDONE;
output [15:0] DO;

input CLKFB;
input CLKIN;
input PSCLK;
input PSEN;
input PSINCDEC;
input RST;

DCM_ADV #(.CLKDV_DIVIDE(CLKDV_DIVIDE),
          .CLKFX_DIVIDE(CLKFX_DIVIDE),
          .CLKFX_MULTIPLY(CLKFX_MULTIPLY),
          .CLKIN_DIVIDE_BY_2(CLKIN_DIVIDE_BY_2),
          .CLKIN_PERIOD(CLKIN_PERIOD),
          .CLKOUT_PHASE_SHIFT(CLKOUT_PHASE_SHIFT),
          .CLK_FEEDBACK(CLK_FEEDBACK),
          .DCM_AUTOCALIBRATION(DCM_AUTOCALIBRATION),
          .DCM_PERFORMANCE_MODE(DCM_PERFORMANCE_MODE),
          .DESKEW_ADJUST(DESKEW_ADJUST),
          .DFS_FREQUENCY_MODE(DFS_FREQUENCY_MODE),
          .DLL_FREQUENCY_MODE(DLL_FREQUENCY_MODE),
          .DUTY_CYCLE_CORRECTION(DUTY_CYCLE_CORRECTION),
          .FACTORY_JF(FACTORY_JF),
          .PHASE_SHIFT(PHASE_SHIFT),
          .STARTUP_WAIT(STARTUP_WAIT)
	  ) D0 (
		 .CLK0 (CLK0),
		 .CLK180 (CLK180),
		 .CLK270 (CLK270),
		 .CLK2X (CLK2X),
		 .CLK2X180 (CLK2X180),
		 .CLK90 (CLK90),
		 .CLKDV (CLKDV),
		 .CLKFX (CLKFX),
		 .CLKFX180 (CLKFX180),
		 .DO (DO),
		 .DRDY (),
		 .LOCKED (LOCKED),
		 .PSDONE (PSDONE),
		 .CLKFB (CLKFB),
		 .CLKIN (CLKIN),
		 .DADDR (),
		 .DCLK (1'b0),
		 .DEN (1'b0),
		 .DI (),
		 .DWE (),
		 .PSCLK (PSCLK),
		 .PSEN (PSEN),
		 .PSINCDEC (PSINCDEC),
		 .RST (RST));

endmodule
