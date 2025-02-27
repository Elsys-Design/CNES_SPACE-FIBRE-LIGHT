///////////////////////////////////////////////////////
//  Copyright (c) 2008 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     : 
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : MMCM_ADV.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
//    05/27/10 - Initial version
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module MMCM_ADV (
  CLKFBOUT,
  CLKFBOUTB,
  CLKFBSTOPPED,
  CLKINSTOPPED,
  CLKOUT0,
  CLKOUT0B,
  CLKOUT1,
  CLKOUT1B,
  CLKOUT2,
  CLKOUT2B,
  CLKOUT3,
  CLKOUT3B,
  CLKOUT4,
  CLKOUT5,
  CLKOUT6,
  DO,
  DRDY,
  LOCKED,
  PSDONE,
  CLKFBIN,
  CLKIN1,
  CLKIN2,
  CLKINSEL,
  DADDR,
  DCLK,
  DEN,
  DI,
  DWE,
  PSCLK,
  PSEN,
  PSINCDEC,
  PWRDWN,
  RST
);
  parameter BANDWIDTH = "OPTIMIZED";
  parameter CLKFBOUT_USE_FINE_PS = "FALSE";
  parameter CLKOUT0_USE_FINE_PS = "FALSE";
  parameter CLKOUT1_USE_FINE_PS = "FALSE";
  parameter CLKOUT2_USE_FINE_PS = "FALSE";
  parameter CLKOUT3_USE_FINE_PS = "FALSE";
  parameter CLKOUT4_CASCADE = "FALSE";
  parameter CLKOUT4_USE_FINE_PS = "FALSE";
  parameter CLKOUT5_USE_FINE_PS = "FALSE";
  parameter CLKOUT6_USE_FINE_PS = "FALSE";
  parameter CLOCK_HOLD = "FALSE";
  parameter COMPENSATION = "ZHOLD";
  parameter STARTUP_WAIT = "FALSE";
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter integer CLKOUT6_DIVIDE = 1;
  parameter integer DIVCLK_DIVIDE = 1;
  parameter real CLKFBOUT_MULT_F = 5.000;
  parameter real CLKFBOUT_PHASE = 0.000;
  parameter real CLKIN1_PERIOD = 0.000;
  parameter real CLKIN2_PERIOD = 0.000;
  parameter real CLKOUT0_DIVIDE_F = 1.000;
  parameter real CLKOUT0_DUTY_CYCLE = 0.500;
  parameter real CLKOUT0_PHASE = 0.000;
  parameter real CLKOUT1_DUTY_CYCLE = 0.500;
  parameter real CLKOUT1_PHASE = 0.000;
  parameter real CLKOUT2_DUTY_CYCLE = 0.500;
  parameter real CLKOUT2_PHASE = 0.000;
  parameter real CLKOUT3_DUTY_CYCLE = 0.500;
  parameter real CLKOUT3_PHASE = 0.000;
  parameter real CLKOUT4_DUTY_CYCLE = 0.500;
  parameter real CLKOUT4_PHASE = 0.000;
  parameter real CLKOUT5_DUTY_CYCLE = 0.500;
  parameter real CLKOUT5_PHASE = 0.000;
  parameter real CLKOUT6_DUTY_CYCLE = 0.500;
  parameter real CLKOUT6_PHASE = 0.000;
  parameter real REF_JITTER1 = 0.010;
  parameter real REF_JITTER2 = 0.010;
  parameter [0:0] IS_PSINCDEC_INVERTED = 1'b0;


  output CLKFBOUT;
  output CLKFBOUTB;
  output CLKFBSTOPPED;
  output CLKINSTOPPED;
  output CLKOUT0;
  output CLKOUT0B;
  output CLKOUT1;
  output CLKOUT1B;
  output CLKOUT2;
  output CLKOUT2B;
  output CLKOUT3;
  output CLKOUT3B;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output DRDY;
  output LOCKED;
  output PSDONE;
  output [15:0] DO;
  input CLKFBIN;
  input CLKIN1;
  input CLKIN2;
  input CLKINSEL;
  input DCLK;
  input DEN;
  input DWE;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  input PWRDWN;
  input RST;
  input [15:0] DI;
  input [6:0] DADDR;


  MMCME2_ADV #(
            .BANDWIDTH(BANDWIDTH),
            .COMPENSATION(COMPENSATION),
            .CLKOUT4_CASCADE(CLKOUT4_CASCADE),
            .STARTUP_WAIT(STARTUP_WAIT),
            .CLKFBOUT_USE_FINE_PS(CLKFBOUT_USE_FINE_PS),
            .CLKOUT0_USE_FINE_PS(CLKOUT0_USE_FINE_PS),
            .CLKOUT1_USE_FINE_PS(CLKOUT1_USE_FINE_PS),
            .CLKOUT2_USE_FINE_PS(CLKOUT2_USE_FINE_PS),
            .CLKOUT3_USE_FINE_PS(CLKOUT3_USE_FINE_PS),
            .CLKOUT4_USE_FINE_PS(CLKOUT4_USE_FINE_PS),
            .CLKOUT5_USE_FINE_PS(CLKOUT5_USE_FINE_PS),
            .CLKOUT6_USE_FINE_PS(CLKOUT6_USE_FINE_PS),
            .CLKOUT1_DIVIDE(CLKOUT1_DIVIDE),
            .CLKOUT2_DIVIDE(CLKOUT2_DIVIDE),
            .CLKOUT3_DIVIDE(CLKOUT3_DIVIDE),
            .CLKOUT4_DIVIDE(CLKOUT4_DIVIDE),
            .CLKOUT5_DIVIDE(CLKOUT5_DIVIDE),
            .CLKOUT6_DIVIDE(CLKOUT6_DIVIDE),
            .DIVCLK_DIVIDE(DIVCLK_DIVIDE),
            .IS_PSINCDEC_INVERTED(IS_PSINCDEC_INVERTED),
            .CLKFBOUT_MULT_F(CLKFBOUT_MULT_F),
            .CLKFBOUT_PHASE(CLKFBOUT_PHASE),
            .CLKIN1_PERIOD(CLKIN1_PERIOD),
            .CLKIN2_PERIOD(CLKIN2_PERIOD),
            .CLKOUT0_DIVIDE_F(CLKOUT0_DIVIDE_F),
            .CLKOUT0_DUTY_CYCLE(CLKOUT0_DUTY_CYCLE),
            .CLKOUT0_PHASE(CLKOUT0_PHASE),
            .CLKOUT1_DUTY_CYCLE(CLKOUT1_DUTY_CYCLE),
            .CLKOUT1_PHASE(CLKOUT1_PHASE),
            .CLKOUT2_DUTY_CYCLE(CLKOUT2_DUTY_CYCLE),
            .CLKOUT2_PHASE(CLKOUT2_PHASE),
            .CLKOUT3_DUTY_CYCLE(CLKOUT3_DUTY_CYCLE),
            .CLKOUT3_PHASE(CLKOUT3_PHASE),
            .CLKOUT4_DUTY_CYCLE(CLKOUT4_DUTY_CYCLE),
            .CLKOUT4_PHASE(CLKOUT4_PHASE),
            .CLKOUT5_DUTY_CYCLE(CLKOUT5_DUTY_CYCLE),
            .CLKOUT5_PHASE(CLKOUT5_PHASE),
            .CLKOUT6_DUTY_CYCLE(CLKOUT6_DUTY_CYCLE),
            .CLKOUT6_PHASE(CLKOUT6_PHASE),
            .REF_JITTER1(REF_JITTER1), 
            .REF_JITTER2(REF_JITTER2) 
      )
      mmcm_adv_1 (
        .CLKFBIN (CLKFBIN),
        .CLKFBOUT (CLKFBOUT),
        .CLKFBOUTB (CLKFBOUTB),
        .CLKIN1 (CLKIN1),
        .CLKIN2 (CLKIN2),
        .CLKOUT0 (CLKOUT0),
        .CLKOUT0B (CLKOUT0B),
        .CLKOUT1 (CLKOUT1),
        .CLKOUT1B (CLKOUT1B),
        .CLKOUT2 (CLKOUT2),
        .CLKOUT2B (CLKOUT2B),
        .CLKOUT3 (CLKOUT3),
        .CLKOUT3B (CLKOUT3B),
        .CLKOUT4 (CLKOUT4),
        .CLKOUT5 (CLKOUT5),
        .CLKOUT6 (CLKOUT6),
        .DADDR (DADDR),
        .DCLK (DCLK),
        .DEN (DEN),
        .DI (DI),
        .DO (DO),
        .DRDY (DRDY),
        .DWE (DWE),
        .LOCKED (LOCKED),
        .CLKINSEL(CLKINSEL),
        .CLKFBSTOPPED(CLKFBSTOPPED),
        .CLKINSTOPPED(CLKINSTOPPED),
        .PSDONE(PSDONE),
        .PSCLK(PSCLK),
        .PSEN(PSEN),
        .PSINCDEC(PSINCDEC),
        .PWRDWN(PWRDWN),
        .RST (RST)
    );

  specify

      specparam PATHPULSE$ = 0;

  endspecify
endmodule
