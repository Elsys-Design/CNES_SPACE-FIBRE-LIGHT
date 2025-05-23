///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DFE_MATRIX_FIR
// /___/   /\      Filename    : DFE_MATRIX_FIR.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DFE_MATRIX_FIR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter real ACTIVE_DUTYCYCLE = 100.00,
  parameter real CLK_FREQ = 500.00,
  parameter MODE = "Real mode",
  parameter real N_TAPS = 24.00,
  parameter integer XPA_CFG0 = 0
)(
  output [71:0] M_AXIS_DOUT_TDATA,
  output [3:0] M_AXIS_DOUT_TUSER,
  output M_AXIS_DOUT_TVALID,
  output [7:0] STATUS,
  output S_AXIS_COEFF_TREADY,
  output S_AXIS_DIN_TREADY,

  input CLK,
  input [10:0] CONTROL,
  input ENABLE,
  input RESET_N,
  input [15:0] S_AXIS_COEFF_TDATA,
  input S_AXIS_COEFF_TLAST,
  input [1:0] S_AXIS_COEFF_TUSER,
  input S_AXIS_COEFF_TVALID,
  input [71:0] S_AXIS_DIN_TDATA,
  input [3:0] S_AXIS_DIN_TUSER,
  input S_AXIS_DIN_TVALID
);

// define constants
  localparam MODULE_NAME = "DFE_MATRIX_FIR";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DFE_MATRIX_FIR_dr.v"
`else
  real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
  real CLK_FREQ_REG = CLK_FREQ;
  reg [96:1] MODE_REG = MODE;
  real N_TAPS_REG = N_TAPS;
  reg [15:0] XPA_CFG0_REG = XPA_CFG0;
`endif

`ifdef XIL_XECLIB
  wire [63:0] ACTIVE_DUTYCYCLE_BIN;
  wire [63:0] CLK_FREQ_BIN;
  wire [63:0] N_TAPS_BIN;
`else
  reg [63:0] ACTIVE_DUTYCYCLE_BIN;
  reg [63:0] CLK_FREQ_BIN;
  reg [63:0] N_TAPS_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire M_AXIS_DOUT_TVALID_out;
  wire S_AXIS_COEFF_TREADY_out;
  wire S_AXIS_DIN_TREADY_out;
  wire TEST_OUT_out;
  wire [3:0] M_AXIS_DOUT_TUSER_out;
  wire [71:0] M_AXIS_DOUT_TDATA_out;
  wire [7:0] STATUS_out;
  wire [8:0] SCAN_DATA_OUT_out;

  wire CLK_in;
  wire ENABLE_in;
  wire RESET_N_in;
  wire S_AXIS_COEFF_TLAST_in;
  wire S_AXIS_COEFF_TVALID_in;
  wire S_AXIS_DIN_TVALID_in;
  wire [10:0] CONTROL_in;
  wire [15:0] S_AXIS_COEFF_TDATA_in;
  wire [15:0] TEST_IN_in;
  wire [1:0] S_AXIS_COEFF_TUSER_in;
  wire [3:0] S_AXIS_DIN_TUSER_in;
  wire [71:0] S_AXIS_DIN_TDATA_in;
  wire [8:0] SCAN_DATA_IN_in;

  assign M_AXIS_DOUT_TDATA = M_AXIS_DOUT_TDATA_out;
  assign M_AXIS_DOUT_TUSER = M_AXIS_DOUT_TUSER_out;
  assign M_AXIS_DOUT_TVALID = M_AXIS_DOUT_TVALID_out;
  assign STATUS = STATUS_out;
  assign S_AXIS_COEFF_TREADY = S_AXIS_COEFF_TREADY_out;
  assign S_AXIS_DIN_TREADY = S_AXIS_DIN_TREADY_out;

  assign CLK_in = CLK;
  assign CONTROL_in = CONTROL;
  assign ENABLE_in = ENABLE;
  assign RESET_N_in = RESET_N;
  assign S_AXIS_COEFF_TDATA_in = S_AXIS_COEFF_TDATA;
  assign S_AXIS_COEFF_TLAST_in = S_AXIS_COEFF_TLAST;
  assign S_AXIS_COEFF_TUSER_in = S_AXIS_COEFF_TUSER;
  assign S_AXIS_COEFF_TVALID_in = S_AXIS_COEFF_TVALID;
  assign S_AXIS_DIN_TDATA_in = S_AXIS_DIN_TDATA;
  assign S_AXIS_DIN_TUSER_in = S_AXIS_DIN_TUSER;
  assign S_AXIS_DIN_TVALID_in = S_AXIS_DIN_TVALID;

`ifndef XIL_XECLIB
  reg attr_test;
  reg attr_err;
  
  initial begin
  trig_attr = 1'b0;
  `ifdef XIL_ATTR_TEST
    attr_test = 1'b1;
  `else
    attr_test = 1'b0;
  `endif
    attr_err = 1'b0;
    #1;
    trig_attr = ~trig_attr;
  end
`endif

`ifdef XIL_XECLIB
  assign ACTIVE_DUTYCYCLE_BIN = ACTIVE_DUTYCYCLE_REG * 1000;
  
  assign CLK_FREQ_BIN = CLK_FREQ_REG * 1000;
  
  assign N_TAPS_BIN = N_TAPS_REG * 1000;
  
`else
  always @ (trig_attr) begin
  #1;
  ACTIVE_DUTYCYCLE_BIN = ACTIVE_DUTYCYCLE_REG * 1000;
  
  CLK_FREQ_BIN = CLK_FREQ_REG * 1000;
  
  N_TAPS_BIN = N_TAPS_REG * 1000;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        (ACTIVE_DUTYCYCLE_REG < 0.00 || ACTIVE_DUTYCYCLE_REG > 100.00)) begin
      $display("Error: [Unisim %s-101] ACTIVE_DUTYCYCLE attribute is set to %f.  Legal values for this attribute are 0.00 to 100.00. Instance: %m", MODULE_NAME, ACTIVE_DUTYCYCLE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (CLK_FREQ_REG < 0.00 || CLK_FREQ_REG > 500.00)) begin
      $display("Error: [Unisim %s-102] CLK_FREQ attribute is set to %f.  Legal values for this attribute are 0.00 to 500.00. Instance: %m", MODULE_NAME, CLK_FREQ_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((MODE_REG != "Real mode") &&
         (MODE_REG != "Complex mode"))) begin
      $display("Error: [Unisim %s-103] MODE attribute is set to %s.  Legal values for this attribute are Real mode or Complex mode. Instance: %m", MODULE_NAME, MODE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (N_TAPS_REG < 0.00 || N_TAPS_REG > 24.00)) begin
      $display("Error: [Unisim %s-104] N_TAPS attribute is set to %f.  Legal values for this attribute are 0.00 to 24.00. Instance: %m", MODULE_NAME, N_TAPS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_CFG0_REG < 0) || (XPA_CFG0_REG > 65535))) begin
      $display("Error: [Unisim %s-105] XPA_CFG0 attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, XPA_CFG0_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif



assign SCAN_DATA_IN_in = 9'b111111111; // tie off
assign TEST_IN_in = 16'b1111111111111111; // tie off

  SIP_DFE_MATRIX_FIR SIP_DFE_MATRIX_FIR_INST (
    .ACTIVE_DUTYCYCLE (ACTIVE_DUTYCYCLE_BIN),
    .CLK_FREQ (CLK_FREQ_BIN),
    .MODE (MODE_REG),
    .N_TAPS (N_TAPS_BIN),
    .XPA_CFG0 (XPA_CFG0_REG),
    .M_AXIS_DOUT_TDATA (M_AXIS_DOUT_TDATA_out),
    .M_AXIS_DOUT_TUSER (M_AXIS_DOUT_TUSER_out),
    .M_AXIS_DOUT_TVALID (M_AXIS_DOUT_TVALID_out),
    .SCAN_DATA_OUT (SCAN_DATA_OUT_out),
    .STATUS (STATUS_out),
    .S_AXIS_COEFF_TREADY (S_AXIS_COEFF_TREADY_out),
    .S_AXIS_DIN_TREADY (S_AXIS_DIN_TREADY_out),
    .TEST_OUT (TEST_OUT_out),
    .CLK (CLK_in),
    .CONTROL (CONTROL_in),
    .ENABLE (ENABLE_in),
    .RESET_N (RESET_N_in),
    .SCAN_DATA_IN (SCAN_DATA_IN_in),
    .S_AXIS_COEFF_TDATA (S_AXIS_COEFF_TDATA_in),
    .S_AXIS_COEFF_TLAST (S_AXIS_COEFF_TLAST_in),
    .S_AXIS_COEFF_TUSER (S_AXIS_COEFF_TUSER_in),
    .S_AXIS_COEFF_TVALID (S_AXIS_COEFF_TVALID_in),
    .S_AXIS_DIN_TDATA (S_AXIS_DIN_TDATA_in),
    .S_AXIS_DIN_TUSER (S_AXIS_DIN_TUSER_in),
    .S_AXIS_DIN_TVALID (S_AXIS_DIN_TVALID_in),
    .TEST_IN (TEST_IN_in),
    .GSR (glblGSR)
  );

endmodule

`endcelldefine
