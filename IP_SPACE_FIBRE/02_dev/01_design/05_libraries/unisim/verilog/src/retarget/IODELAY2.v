// $Header: $
///////////////////////////////////////////////////////
//  Copyright (c) 2011 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 10.1
//  \  \           Description : Xilinx Functional Simulation Library Component
//  /  /                         Input/Output Fixed or Variable Delay Element.
// /__/   /\       Filename    : IODELAY2.v
// \  \  /  \ 
//  \__\/\__ \                      
//                                   
// Revision:
//    08/16/11 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module IODELAY2 (
  BUSY,
  DATAOUT,
  DATAOUT2,
  DOUT,
  TOUT,
  CAL,
  CE,
  CLK,
  IDATAIN,
  INC,
  IOCLK0,
  IOCLK1,
  ODATAIN,
  RST,
  T
);

  parameter COUNTER_WRAPAROUND = "WRAPAROUND"; // "WRAPAROUND", "STAY_AT_LIMIT"
  parameter DATA_RATE = "SDR";       // "SDR", "DDR"
  parameter DELAY_SRC = "IO";        // "IO", "IDATAIN", "ODATAIN"
  parameter integer IDELAY2_VALUE = 0;  // 0 to 255 inclusive
  parameter IDELAY_MODE = "NORMAL";  // "NORMAL", "PCI"
  parameter IDELAY_TYPE = "DEFAULT";    // "DEFAULT", "DIFF_PHASE_DETECTOR", "FIXED", "VARIABLE_FROM_HALF_MAX", "VARIABLE_FROM_ZERO"
  parameter integer IDELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter integer ODELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter SERDES_MODE = "NONE";       // "NONE", "MASTER", "SLAVE"
  parameter integer SIM_TAPDELAY_VALUE = 75; // 10 to 90 inclusive

  localparam integer SIM_IDATAIN_INDELAY = 110; 
  localparam integer SIM_ODATAIN_INDELAY = 110; 
  localparam WRAPAROUND = 1'b0;
  localparam STAY_AT_LIMIT = 1'b1;
  localparam SDR = 1'b1;
  localparam DDR = 1'b0;
  localparam IO = 2'b00;
  localparam I = 2'b01;
  localparam O = 2'b11;
  localparam PCI = 1'b0;
  localparam NORMAL = 1'b1;
  localparam DEFAULT = 4'b1001;
  localparam FIXED = 4'b1000;
  localparam VAR = 4'b1100;
  localparam DIFF_PHASE_DETECTOR = 4'b1111;
  localparam NONE = 1'b1;
  localparam MASTER = 1'b1;
  localparam SLAVE = 1'b0;

  output BUSY;
  output DATAOUT2;
  output DATAOUT;
  output DOUT;
  output TOUT;

  input CAL;
  input CE;
  input CLK;
  input IDATAIN;
  input INC;
  input IOCLK0;
  input IOCLK1;
  input ODATAIN;
  input RST;
  input T;

    initial begin
	$display ("ERROR : The following component IODELAY2 at instance %m is not supported for retargeting in this architecture.  Please modify your source code to use supported primitives.  The complete list of supported primitives for this architectures is provided in the 7 Series HDL Libraries Guide available on www.xilinx.com.");
	$finish;
    end

    
endmodule // IODELAY2
