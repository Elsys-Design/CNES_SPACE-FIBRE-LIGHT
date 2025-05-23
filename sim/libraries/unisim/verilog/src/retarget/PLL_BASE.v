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
//  /   /             Phase Lock Loop Clock (Discontinue in 13.1)
// /___/   /\     Filename : PLL_BASE.v
// \   \  /  \    Timestamp : Wed Jul 28 05:29:19 PST 2010
//  \___\/\___\
//
// Revision:
//    07/28/10 - Initial version

`timescale  1 ps / 1 ps

  module PLL_BASE (
    CLKFBOUT,
    CLKOUT0,
    CLKOUT1,
    CLKOUT2,
    CLKOUT3,
    CLKOUT4,
    CLKOUT5,
    LOCKED,
    CLKFBIN,
    CLKIN,
    RST
  );

  parameter BANDWIDTH = "OPTIMIZED";
  parameter integer CLKFBOUT_MULT = 1;
  parameter real CLKFBOUT_PHASE = 0.0;
  parameter real CLKIN_PERIOD = 0.000;
  parameter integer CLKOUT0_DIVIDE = 1;
  parameter real CLKOUT0_DUTY_CYCLE = 0.5;
  parameter real CLKOUT0_PHASE = 0.0;
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter real CLKOUT1_DUTY_CYCLE = 0.5;
  parameter real CLKOUT1_PHASE = 0.0;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter real CLKOUT2_DUTY_CYCLE = 0.5;
  parameter real CLKOUT2_PHASE = 0.0;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter real CLKOUT3_DUTY_CYCLE = 0.5;
  parameter real CLKOUT3_PHASE = 0.0;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter real CLKOUT4_DUTY_CYCLE = 0.5;
  parameter real CLKOUT4_PHASE = 0.0;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter real CLKOUT5_DUTY_CYCLE = 0.5;
  parameter real CLKOUT5_PHASE = 0.0;
  parameter CLK_FEEDBACK = "CLKFBOUT";
  parameter COMPENSATION = "SYSTEM_SYNCHRONOUS";
  parameter integer DIVCLK_DIVIDE = 1;
  parameter real REF_JITTER = 0.100;
  parameter RESET_ON_LOSS_OF_LOCK = "FALSE";

  output CLKFBOUT;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output LOCKED;
  
  input CLKFBIN;
  input CLKIN;
  input RST;
  

  wire OPEN_CLKFBOUTB;
  wire OPEN_CLKOUT0B;
  wire OPEN_CLKOUT1B;
  wire OPEN_CLKOUT2B;
  wire OPEN_CLKOUT3B;
  wire OPEN_CLKOUT6;
 initial begin
  if ((CLK_FEEDBACK == "CLKOUT0")) begin
  $display ("Attribute Syntax Error: CLK_FEEDBACK not supported");
  $finish;
  end  
 end

     MMCME2_BASE #(
		.BANDWIDTH(BANDWIDTH), 
		.CLKFBOUT_MULT_F(CLKFBOUT_MULT), 
		.CLKFBOUT_PHASE(CLKFBOUT_PHASE), 
		.CLKIN1_PERIOD(CLKIN_PERIOD), 
		.CLKOUT0_DIVIDE_F(CLKOUT0_DIVIDE),		  .CLKOUT0_DUTY_CYCLE(CLKOUT0_DUTY_CYCLE), 
		.CLKOUT0_PHASE(CLKOUT0_PHASE), 
		.CLKOUT1_DIVIDE(CLKOUT1_DIVIDE), 
		.CLKOUT1_DUTY_CYCLE(CLKOUT1_DUTY_CYCLE), 
		.CLKOUT1_PHASE(CLKOUT1_PHASE), 
		.CLKOUT2_DIVIDE(CLKOUT2_DIVIDE), 
		.CLKOUT2_DUTY_CYCLE(CLKOUT2_DUTY_CYCLE), 
		.CLKOUT2_PHASE(CLKOUT2_PHASE), 
		.CLKOUT3_DIVIDE(CLKOUT3_DIVIDE), 
		.CLKOUT3_DUTY_CYCLE(CLKOUT3_DUTY_CYCLE), 
		.CLKOUT3_PHASE(CLKOUT3_PHASE), 
		.CLKOUT4_DIVIDE(CLKOUT4_DIVIDE), 
		.CLKOUT4_DUTY_CYCLE(CLKOUT4_DUTY_CYCLE), 
		.CLKOUT4_PHASE(CLKOUT4_PHASE), 
		.CLKOUT5_DIVIDE(CLKOUT5_DIVIDE), 
		.CLKOUT5_DUTY_CYCLE(CLKOUT5_DUTY_CYCLE), 
		.CLKOUT5_PHASE(CLKOUT5_PHASE), 
		.DIVCLK_DIVIDE(DIVCLK_DIVIDE), 
		.REF_JITTER1(REF_JITTER)
    )
    M7 ( 
		.CLKFBOUT (CLKFBOUT), 
		.CLKFBOUTB(OPEN_CLKFBOUTB), 
		.CLKOUT0 (CLKOUT0), 
		.CLKOUT0B (OPEN_CLKOUT0B), 
		.CLKOUT1 (CLKOUT1), 
		.CLKOUT1B (OPEN_CLKOUT1B), 
		.CLKOUT2 (CLKOUT2), 
		.CLKOUT2B (OPEN_CLKOUT2B), 
		.CLKOUT3 (CLKOUT3), 
		.CLKOUT3B (OPEN_CLKOUT3B), 
		.CLKOUT4 (CLKOUT4), 
		.CLKOUT5 (CLKOUT5), 
		.CLKOUT6(OPEN_CLKOUT6), 
		.LOCKED (LOCKED), 
		.CLKFBIN(CLKFBIN), 
		.CLKIN1(CLKIN), 
		.PWRDWN(1'b0), 
		.RST (RST));

endmodule
