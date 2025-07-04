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
//  /   /             Digital Clock Manager  (Discontinue in 13.1)
// /___/   /\     Filename : DCM.v
// \   \  /  \    Timestamp : Thu Aug 31 03:47:30 PST 2009
//  \___\/\___\
//
// Revision:
//    08/31/09 - Initial version

`timescale  1 ps / 1 ps

module DCM (
	CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90,
	CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE, STATUS,
	CLKFB, CLKIN, DSSEN, PSCLK, PSEN, PSINCDEC, RST);

parameter real CLKDV_DIVIDE = 2.0;
parameter integer CLKFX_DIVIDE = 1;
parameter integer CLKFX_MULTIPLY = 4;
parameter CLKIN_DIVIDE_BY_2 = "FALSE";
parameter real CLKIN_PERIOD = 10.0;			// non-simulatable
parameter CLKOUT_PHASE_SHIFT = "NONE";
parameter CLK_FEEDBACK = "1X";
parameter DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";	// non-simulatable
parameter DFS_FREQUENCY_MODE = "LOW";
parameter DLL_FREQUENCY_MODE = "LOW";
parameter DSS_MODE = "NONE";			// non-simulatable
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter [15:0] FACTORY_JF = 16'hC080;		// non-simulatable
localparam integer MAXPERCLKIN = 1000000;		// non-modifiable simulation parameter
localparam integer MAXPERPSCLK = 100000000;		// non-modifiable simulation parameter
parameter integer PHASE_SHIFT = 0;
localparam integer SIM_CLKIN_CYCLE_JITTER = 300;		// non-modifiable simulation parameter
localparam integer SIM_CLKIN_PERIOD_JITTER = 1000;	// non-modifiable simulation parameter
parameter SIM_MODE = "SAFE";
parameter STARTUP_WAIT = "FALSE";		// non-simulatable


input CLKFB, CLKIN, DSSEN;
input PSCLK, PSEN, PSINCDEC, RST;

output CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90;
output CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE;
output [7:0] STATUS;
wire [7:0] open_sig;

DCM_ADV #(.CLKDV_DIVIDE(CLKDV_DIVIDE),
          .CLKFX_DIVIDE(CLKFX_DIVIDE),
          .CLKFX_MULTIPLY(CLKFX_MULTIPLY),
          .CLKIN_DIVIDE_BY_2(CLKIN_DIVIDE_BY_2),
          .CLKIN_PERIOD(CLKIN_PERIOD),
          .CLKOUT_PHASE_SHIFT(CLKOUT_PHASE_SHIFT),
          .CLK_FEEDBACK(CLK_FEEDBACK),
          .DESKEW_ADJUST(DESKEW_ADJUST),
          .DFS_FREQUENCY_MODE(DFS_FREQUENCY_MODE),
          .DLL_FREQUENCY_MODE(DLL_FREQUENCY_MODE),
          .DUTY_CYCLE_CORRECTION(DUTY_CYCLE_CORRECTION),
          .FACTORY_JF(16'hF0F0),
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
		 .DO ({open_sig, STATUS[7:0]}),
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
