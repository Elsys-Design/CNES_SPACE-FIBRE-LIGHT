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
//  /   /             Digital Clock Manager with Basic Features (Discontinue in 13.1)
// /___/   /\     Filename : DCM_BASE.v
// \   \  /  \    Timestamp : Thu Aug 27 03:43:09 PST 2009
//  \___\/\___\
//
// Revision:
//    08/27/09 - Initial version

`timescale  1 ps / 1 ps

module DCM_BASE (
	CLK0,
	CLK180,
	CLK270,
	CLK2X,
	CLK2X180,
	CLK90,
	CLKDV,
	CLKFX,
	CLKFX180,
	LOCKED,
	CLKFB,
	CLKIN,
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

input CLKFB;
input CLKIN;
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
		 .DO (),
		 .DRDY (),
		 .LOCKED (LOCKED),
		 .PSDONE (),
		 .CLKFB (CLKFB),
		 .CLKIN (CLKIN),
		 .DADDR (7'b0000000),
		 .DCLK (1'b0),
		 .DEN (1'b0),
		 .DI (16'h0000),
		 .DWE (1'b0),
		 .PSCLK (1'b0),
		 .PSEN (1'b0),
		 .PSINCDEC (1'b0),
		 .RST (RST));

endmodule
