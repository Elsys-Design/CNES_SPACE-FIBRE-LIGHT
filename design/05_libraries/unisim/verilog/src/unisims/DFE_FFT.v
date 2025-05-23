///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DFE_FFT
// /___/   /\      Filename    : DFE_FFT.v
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

module DFE_FFT #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter real ACTIVE_DUTYCYCLE = 100.00,
  parameter real CLK_FREQ = 500.00,
  parameter MAX_POINT_SIZE = "4096",
  parameter POINT_SIZE = "4096",
  parameter real THROUGHPUT = 0.00,
  parameter integer XPA_CFG0 = 0
)(
  output [57:0] M_AXIS_DOUT_TDATA,
  output M_AXIS_DOUT_TLAST,
  output [32:0] M_AXIS_DOUT_TUSER,
  output M_AXIS_DOUT_TVALID,
  output SHUTDOWN_OUT,
  output [22:0] STATUS,
  output S_AXIS_DIN_TREADY,

  input CLK,
  input [15:0] CONTROL,
  input ENABLE,
  input RESET_N,
  input SHUTDOWN_IN,
  input [31:0] S_AXIS_DIN_TDATA,
  input S_AXIS_DIN_TLAST,
  input [24:0] S_AXIS_DIN_TUSER,
  input S_AXIS_DIN_TVALID
);

// define constants
  localparam MODULE_NAME = "DFE_FFT";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DFE_FFT_dr.v"
`else
  real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
  real CLK_FREQ_REG = CLK_FREQ;
  reg [32:1] MAX_POINT_SIZE_REG = MAX_POINT_SIZE;
  reg [32:1] POINT_SIZE_REG = POINT_SIZE;
  real THROUGHPUT_REG = THROUGHPUT;
  reg [15:0] XPA_CFG0_REG = XPA_CFG0;
`endif

`ifdef XIL_XECLIB
  wire [63:0] ACTIVE_DUTYCYCLE_BIN;
  wire [63:0] CLK_FREQ_BIN;
  wire [63:0] THROUGHPUT_BIN;
`else
  reg [63:0] ACTIVE_DUTYCYCLE_BIN;
  reg [63:0] CLK_FREQ_BIN;
  reg [63:0] THROUGHPUT_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire M_AXIS_DOUT_TLAST_out;
  wire M_AXIS_DOUT_TVALID_out;
  wire SHUTDOWN_OUT_out;
  wire S_AXIS_DIN_TREADY_out;
  wire [1:0] MBIST_OUT_out;
  wire [22:0] STATUS_out;
  wire [31:0] TEST_OUT_out;
  wire [32:0] M_AXIS_DOUT_TUSER_out;
  wire [39:0] SCAN_DATA_OUT_out;
  wire [57:0] M_AXIS_DOUT_TDATA_out;

  wire CLK_in;
  wire ENABLE_in;
  wire JTAG_CLK_in;
  wire RESET_N_in;
  wire SHUTDOWN_IN_in;
  wire S_AXIS_DIN_TLAST_in;
  wire S_AXIS_DIN_TVALID_in;
  wire [15:0] CONTROL_in;
  wire [15:0] TEST_IN_in;
  wire [24:0] S_AXIS_DIN_TUSER_in;
  wire [31:0] S_AXIS_DIN_TDATA_in;
  wire [39:0] SCAN_DATA_IN_in;
  wire [7:0] MBIST_IN_in;

`ifdef XIL_TIMING
  wire CLK_delay;
  wire ENABLE_delay;
  wire RESET_N_delay;
  wire S_AXIS_DIN_TLAST_delay;
  wire S_AXIS_DIN_TVALID_delay;
  wire [24:0] S_AXIS_DIN_TUSER_delay;
  wire [31:0] S_AXIS_DIN_TDATA_delay;
`endif

  assign M_AXIS_DOUT_TDATA = M_AXIS_DOUT_TDATA_out;
  assign M_AXIS_DOUT_TLAST = M_AXIS_DOUT_TLAST_out;
  assign M_AXIS_DOUT_TUSER = M_AXIS_DOUT_TUSER_out;
  assign M_AXIS_DOUT_TVALID = M_AXIS_DOUT_TVALID_out;
  assign SHUTDOWN_OUT = SHUTDOWN_OUT_out;
  assign STATUS = STATUS_out;
  assign S_AXIS_DIN_TREADY = S_AXIS_DIN_TREADY_out;

`ifdef XIL_TIMING
  assign CLK_in = CLK_delay;
  assign ENABLE_in = ENABLE_delay;
  assign RESET_N_in = RESET_N_delay;
  assign S_AXIS_DIN_TDATA_in = S_AXIS_DIN_TDATA_delay;
  assign S_AXIS_DIN_TLAST_in = S_AXIS_DIN_TLAST_delay;
  assign S_AXIS_DIN_TUSER_in = S_AXIS_DIN_TUSER_delay;
  assign S_AXIS_DIN_TVALID_in = S_AXIS_DIN_TVALID_delay;
`else
  assign CLK_in = CLK;
  assign ENABLE_in = ENABLE;
  assign RESET_N_in = RESET_N;
  assign S_AXIS_DIN_TDATA_in = S_AXIS_DIN_TDATA;
  assign S_AXIS_DIN_TLAST_in = S_AXIS_DIN_TLAST;
  assign S_AXIS_DIN_TUSER_in = S_AXIS_DIN_TUSER;
  assign S_AXIS_DIN_TVALID_in = S_AXIS_DIN_TVALID;
`endif

  assign CONTROL_in = CONTROL;
  assign SHUTDOWN_IN_in = SHUTDOWN_IN;

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
  
  assign THROUGHPUT_BIN = THROUGHPUT_REG * 1000;
  
`else
  always @ (trig_attr) begin
  #1;
  ACTIVE_DUTYCYCLE_BIN = ACTIVE_DUTYCYCLE_REG * 1000;
  
  CLK_FREQ_BIN = CLK_FREQ_REG * 1000;
  
  THROUGHPUT_BIN = THROUGHPUT_REG * 1000;
  
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
        ((MAX_POINT_SIZE_REG != "4096") &&
         (MAX_POINT_SIZE_REG != "256") &&
         (MAX_POINT_SIZE_REG != "512") &&
         (MAX_POINT_SIZE_REG != "1024") &&
         (MAX_POINT_SIZE_REG != "2048"))) begin
      $display("Error: [Unisim %s-103] MAX_POINT_SIZE attribute is set to %s.  Legal values for this attribute are 4096, 256, 512, 1024 or 2048. Instance: %m", MODULE_NAME, MAX_POINT_SIZE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((POINT_SIZE_REG != "4096") &&
         (POINT_SIZE_REG != "256") &&
         (POINT_SIZE_REG != "512") &&
         (POINT_SIZE_REG != "1024") &&
         (POINT_SIZE_REG != "2048"))) begin
      $display("Error: [Unisim %s-104] POINT_SIZE attribute is set to %s.  Legal values for this attribute are 4096, 256, 512, 1024 or 2048. Instance: %m", MODULE_NAME, POINT_SIZE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (THROUGHPUT_REG < 0.00 || THROUGHPUT_REG > 100.00)) begin
      $display("Error: [Unisim %s-105] THROUGHPUT attribute is set to %f.  Legal values for this attribute are 0.00 to 100.00. Instance: %m", MODULE_NAME, THROUGHPUT_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((XPA_CFG0_REG < 0) || (XPA_CFG0_REG > 65535))) begin
      $display("Error: [Unisim %s-106] XPA_CFG0 attribute is set to %d.  Legal values for this attribute are 0 to 65535. Instance: %m", MODULE_NAME, XPA_CFG0_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif


assign JTAG_CLK_in = 1'b1; // tie off

assign MBIST_IN_in = 8'b11111111; // tie off
assign SCAN_DATA_IN_in = 40'b1111111111111111111111111111111111111111; // tie off
assign TEST_IN_in = 16'b1111111111111111; // tie off

  SIP_DFE_FFT SIP_DFE_FFT_INST (
    .ACTIVE_DUTYCYCLE (ACTIVE_DUTYCYCLE_BIN),
    .CLK_FREQ (CLK_FREQ_BIN),
    .MAX_POINT_SIZE (MAX_POINT_SIZE_REG),
    .POINT_SIZE (POINT_SIZE_REG),
    .XPA_CFG0 (XPA_CFG0_REG),
    .MBIST_OUT (MBIST_OUT_out),
    .M_AXIS_DOUT_TDATA (M_AXIS_DOUT_TDATA_out),
    .M_AXIS_DOUT_TLAST (M_AXIS_DOUT_TLAST_out),
    .M_AXIS_DOUT_TUSER (M_AXIS_DOUT_TUSER_out),
    .M_AXIS_DOUT_TVALID (M_AXIS_DOUT_TVALID_out),
    .SCAN_DATA_OUT (SCAN_DATA_OUT_out),
    .SHUTDOWN_OUT (SHUTDOWN_OUT_out),
    .STATUS (STATUS_out),
    .S_AXIS_DIN_TREADY (S_AXIS_DIN_TREADY_out),
    .TEST_OUT (TEST_OUT_out),
    .CLK (CLK_in),
    .CONTROL (CONTROL_in),
    .ENABLE (ENABLE_in),
    .JTAG_CLK (JTAG_CLK_in),
    .MBIST_IN (MBIST_IN_in),
    .RESET_N (RESET_N_in),
    .SCAN_DATA_IN (SCAN_DATA_IN_in),
    .SHUTDOWN_IN (SHUTDOWN_IN_in),
    .S_AXIS_DIN_TDATA (S_AXIS_DIN_TDATA_in),
    .S_AXIS_DIN_TLAST (S_AXIS_DIN_TLAST_in),
    .S_AXIS_DIN_TUSER (S_AXIS_DIN_TUSER_in),
    .S_AXIS_DIN_TVALID (S_AXIS_DIN_TVALID_in),
    .TEST_IN (TEST_IN_in),
    .GSR (glblGSR)
  );

`ifdef XIL_TIMING
  reg notifier;
`endif

`ifndef XIL_XECLIB
  specify
    (CLK => M_AXIS_DOUT_TDATA[0]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[10]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[11]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[12]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[13]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[14]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[15]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[16]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[17]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[18]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[19]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[1]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[20]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[21]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[22]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[23]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[24]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[25]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[26]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[27]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[28]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[29]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[2]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[30]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[31]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[32]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[33]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[34]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[35]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[36]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[37]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[38]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[39]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[3]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[40]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[41]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[42]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[43]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[44]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[45]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[46]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[47]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[48]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[49]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[4]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[50]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[51]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[52]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[53]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[54]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[55]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[56]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[57]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[5]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[6]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[7]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[8]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TDATA[9]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TLAST) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[0]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[10]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[11]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[12]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[13]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[14]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[15]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[16]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[17]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[18]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[19]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[1]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[20]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[21]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[22]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[23]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[24]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[25]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[26]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[27]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[28]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[29]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[2]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[30]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[31]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[32]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[3]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[4]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[5]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[6]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[7]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[8]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TUSER[9]) = (100:100:100, 100:100:100);
    (CLK => M_AXIS_DOUT_TVALID) = (100:100:100, 100:100:100);
    (CLK => STATUS[0]) = (100:100:100, 100:100:100);
    (CLK => STATUS[10]) = (100:100:100, 100:100:100);
    (CLK => STATUS[11]) = (100:100:100, 100:100:100);
    (CLK => STATUS[12]) = (100:100:100, 100:100:100);
    (CLK => STATUS[13]) = (100:100:100, 100:100:100);
    (CLK => STATUS[14]) = (100:100:100, 100:100:100);
    (CLK => STATUS[15]) = (100:100:100, 100:100:100);
    (CLK => STATUS[1]) = (100:100:100, 100:100:100);
    (CLK => STATUS[2]) = (100:100:100, 100:100:100);
    (CLK => STATUS[3]) = (100:100:100, 100:100:100);
    (CLK => STATUS[4]) = (100:100:100, 100:100:100);
    (CLK => STATUS[5]) = (100:100:100, 100:100:100);
    (CLK => STATUS[6]) = (100:100:100, 100:100:100);
    (CLK => STATUS[7]) = (100:100:100, 100:100:100);
    (CLK => STATUS[8]) = (100:100:100, 100:100:100);
    (CLK => STATUS[9]) = (100:100:100, 100:100:100);
    (CLK => S_AXIS_DIN_TREADY) = (100:100:100, 100:100:100);
`ifdef XIL_TIMING
    $period (negedge CLK, 0:0:0, notifier);
    $period (posedge CLK, 0:0:0, notifier);
    $setuphold (posedge CLK, negedge ENABLE, 0:0:0, 0:0:0, notifier, , , CLK_delay, ENABLE_delay);
    $setuphold (posedge CLK, negedge RESET_N, 0:0:0, 0:0:0, notifier, , , CLK_delay, RESET_N_delay);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[0]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[10]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[11]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[12]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[13]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[14]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[15]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[16], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[16]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[17], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[17]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[18], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[18]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[19], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[19]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[1]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[20], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[20]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[21], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[21]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[22], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[22]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[23], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[23]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[24], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[24]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[25], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[25]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[26], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[26]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[27], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[27]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[28], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[28]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[29], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[29]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[2]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[30], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[30]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[31], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[31]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[3]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[4]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[5]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[6]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[7]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[8]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TDATA[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[9]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TLAST, 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TLAST_delay);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[0]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[10]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[11]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[12]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[13]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[14]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[15]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[16], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[16]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[17], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[17]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[18], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[18]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[19], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[19]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[1]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[20], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[20]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[21], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[21]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[22], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[22]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[23], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[23]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[24], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[24]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[2]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[3]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[4]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[5]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[6]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[7]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[8]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TUSER[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[9]);
    $setuphold (posedge CLK, negedge S_AXIS_DIN_TVALID, 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TVALID_delay);
    $setuphold (posedge CLK, posedge ENABLE, 0:0:0, 0:0:0, notifier, , , CLK_delay, ENABLE_delay);
    $setuphold (posedge CLK, posedge RESET_N, 0:0:0, 0:0:0, notifier, , , CLK_delay, RESET_N_delay);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[0]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[10]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[11]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[12]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[13]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[14]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[15]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[16], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[16]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[17], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[17]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[18], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[18]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[19], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[19]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[1]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[20], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[20]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[21], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[21]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[22], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[22]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[23], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[23]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[24], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[24]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[25], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[25]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[26], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[26]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[27], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[27]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[28], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[28]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[29], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[29]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[2]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[30], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[30]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[31], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[31]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[3]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[4]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[5]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[6]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[7]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[8]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TDATA[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TDATA_delay[9]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TLAST, 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TLAST_delay);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[0], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[0]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[10], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[10]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[11], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[11]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[12], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[12]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[13], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[13]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[14], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[14]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[15], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[15]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[16], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[16]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[17], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[17]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[18], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[18]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[19], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[19]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[1], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[1]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[20], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[20]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[21], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[21]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[22], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[22]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[23], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[23]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[24], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[24]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[2], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[2]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[3], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[3]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[4], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[4]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[5], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[5]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[6], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[6]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[7], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[7]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[8], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[8]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TUSER[9], 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TUSER_delay[9]);
    $setuphold (posedge CLK, posedge S_AXIS_DIN_TVALID, 0:0:0, 0:0:0, notifier, , , CLK_delay, S_AXIS_DIN_TVALID_delay);
    $width (negedge CLK, 0:0:0, 0, notifier);
    $width (posedge CLK, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
