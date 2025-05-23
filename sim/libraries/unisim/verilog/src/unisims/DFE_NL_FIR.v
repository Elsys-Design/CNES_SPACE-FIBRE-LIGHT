///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DFE_NL_FIR
// /___/   /\      Filename    : DFE_NL_FIR.v
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

module DFE_NL_FIR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter real ACTIVE_DUTYCYCLE = 100.00,
  parameter real CLK_FREQ = 500.00,
  parameter real NUM_DUAL_TERMS = 16.00,
  parameter real NUM_PHASES = 2.00,
  parameter real NUM_UNITS = 16.00,
  parameter integer XPA_CFG0 = 0
)(
  output [99:0] M_AXIS_DOUT_TDATA,
  output [7:0] M_AXIS_DOUT_TUSER,
  output M_AXIS_DOUT_TVALID,
  output [19:0] M_AXIS_INDEX_DL_TDATA,
  output M_AXIS_INDEX_DL_TVALID,
  output [32:0] M_AXIS_MEM_TDATA,
  output M_AXIS_MEM_TVALID,
  output [63:0] M_AXIS_SIGNAL_DL_TDATA,
  output M_AXIS_SIGNAL_DL_TVALID,
  output SHUTDOWN_OUT,
  output [47:0] STATUS,
  output S_AXIS_DIN_TREADY,
  output S_AXIS_MEM_CONFIG_TREADY,
  output S_AXI_PARAM_ARREADY,
  output S_AXI_PARAM_AWREADY,
  output S_AXI_PARAM_BVALID,
  output [31:0] S_AXI_PARAM_RDATA,
  output S_AXI_PARAM_RVALID,
  output S_AXI_PARAM_WREADY,
  output [544:0] XO_OUT,

  input CLK,
  input [116:0] CONTROL,
  input D_CLK,
  input ENABLE,
  input [19:0] INDEX_BYPASS,
  input RESET_N,
  input SHUTDOWN_IN,
  input [63:0] SIGNAL_BYPASS,
  input [127:0] S_AXIS_DIN_TDATA,
  input [47:0] S_AXIS_DIN_TUSER,
  input S_AXIS_DIN_TVALID,
  input [48:0] S_AXIS_MEM_CONFIG_TDATA,
  input S_AXIS_MEM_CONFIG_TVALID,
  input S_AXI_PARAM_ACLK,
  input [17:0] S_AXI_PARAM_ARADDR,
  input S_AXI_PARAM_ARESETN,
  input S_AXI_PARAM_ARVALID,
  input [17:0] S_AXI_PARAM_AWADDR,
  input S_AXI_PARAM_AWVALID,
  input S_AXI_PARAM_BREADY,
  input S_AXI_PARAM_RREADY,
  input [31:0] S_AXI_PARAM_WDATA,
  input S_AXI_PARAM_WVALID,
  input [335:0] XO_IN
);

// define constants
  localparam MODULE_NAME = "DFE_NL_FIR";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DFE_NL_FIR_dr.v"
`else
  real ACTIVE_DUTYCYCLE_REG = ACTIVE_DUTYCYCLE;
  real CLK_FREQ_REG = CLK_FREQ;
  real NUM_DUAL_TERMS_REG = NUM_DUAL_TERMS;
  real NUM_PHASES_REG = NUM_PHASES;
  real NUM_UNITS_REG = NUM_UNITS;
  reg [15:0] XPA_CFG0_REG = XPA_CFG0;
`endif

`ifdef XIL_XECLIB
  wire [63:0] ACTIVE_DUTYCYCLE_BIN;
  wire [63:0] CLK_FREQ_BIN;
  wire [63:0] NUM_DUAL_TERMS_BIN;
  wire [63:0] NUM_PHASES_BIN;
  wire [63:0] NUM_UNITS_BIN;
`else
  reg [63:0] ACTIVE_DUTYCYCLE_BIN;
  reg [63:0] CLK_FREQ_BIN;
  reg [63:0] NUM_DUAL_TERMS_BIN;
  reg [63:0] NUM_PHASES_BIN;
  reg [63:0] NUM_UNITS_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire M_AXIS_DOUT_TVALID_out;
  wire M_AXIS_INDEX_DL_TVALID_out;
  wire M_AXIS_MEM_TVALID_out;
  wire M_AXIS_SIGNAL_DL_TVALID_out;
  wire SHUTDOWN_OUT_out;
  wire S_AXIS_DIN_TREADY_out;
  wire S_AXIS_MEM_CONFIG_TREADY_out;
  wire S_AXI_PARAM_ARREADY_out;
  wire S_AXI_PARAM_AWREADY_out;
  wire S_AXI_PARAM_BVALID_out;
  wire S_AXI_PARAM_RVALID_out;
  wire S_AXI_PARAM_WREADY_out;
  wire [11:0] TEST_OUT_out;
  wire [149:0] SCAN_DATA_OUT_out;
  wire [19:0] M_AXIS_INDEX_DL_TDATA_out;
  wire [1:0] MBIST_OUT_out;
  wire [31:0] S_AXI_PARAM_RDATA_out;
  wire [32:0] M_AXIS_MEM_TDATA_out;
  wire [47:0] STATUS_out;
  wire [544:0] XO_OUT_out;
  wire [63:0] M_AXIS_SIGNAL_DL_TDATA_out;
  wire [7:0] M_AXIS_DOUT_TUSER_out;
  wire [99:0] M_AXIS_DOUT_TDATA_out;

  wire CLK_in;
  wire D_CLK_in;
  wire ENABLE_in;
  wire JTAG_CLK_in;
  wire RESET_N_in;
  wire SCAN_CHOP_CLK_in;
  wire SHUTDOWN_IN_in;
  wire S_AXIS_DIN_TVALID_in;
  wire S_AXIS_MEM_CONFIG_TVALID_in;
  wire S_AXI_PARAM_ACLK_in;
  wire S_AXI_PARAM_ARESETN_in;
  wire S_AXI_PARAM_ARVALID_in;
  wire S_AXI_PARAM_AWVALID_in;
  wire S_AXI_PARAM_BREADY_in;
  wire S_AXI_PARAM_RREADY_in;
  wire S_AXI_PARAM_WVALID_in;
  wire [116:0] CONTROL_in;
  wire [127:0] S_AXIS_DIN_TDATA_in;
  wire [149:0] SCAN_DATA_IN_in;
  wire [15:0] TEST_IN_in;
  wire [17:0] S_AXI_PARAM_ARADDR_in;
  wire [17:0] S_AXI_PARAM_AWADDR_in;
  wire [19:0] INDEX_BYPASS_in;
  wire [31:0] S_AXI_PARAM_WDATA_in;
  wire [335:0] XO_IN_in;
  wire [47:0] S_AXIS_DIN_TUSER_in;
  wire [48:0] S_AXIS_MEM_CONFIG_TDATA_in;
  wire [63:0] SIGNAL_BYPASS_in;
  wire [7:0] MBIST_IN_in;

  assign M_AXIS_DOUT_TDATA = M_AXIS_DOUT_TDATA_out;
  assign M_AXIS_DOUT_TUSER = M_AXIS_DOUT_TUSER_out;
  assign M_AXIS_DOUT_TVALID = M_AXIS_DOUT_TVALID_out;
  assign M_AXIS_INDEX_DL_TDATA = M_AXIS_INDEX_DL_TDATA_out;
  assign M_AXIS_INDEX_DL_TVALID = M_AXIS_INDEX_DL_TVALID_out;
  assign M_AXIS_MEM_TDATA = M_AXIS_MEM_TDATA_out;
  assign M_AXIS_MEM_TVALID = M_AXIS_MEM_TVALID_out;
  assign M_AXIS_SIGNAL_DL_TDATA = M_AXIS_SIGNAL_DL_TDATA_out;
  assign M_AXIS_SIGNAL_DL_TVALID = M_AXIS_SIGNAL_DL_TVALID_out;
  assign SHUTDOWN_OUT = SHUTDOWN_OUT_out;
  assign STATUS = STATUS_out;
  assign S_AXIS_DIN_TREADY = S_AXIS_DIN_TREADY_out;
  assign S_AXIS_MEM_CONFIG_TREADY = S_AXIS_MEM_CONFIG_TREADY_out;
  assign S_AXI_PARAM_ARREADY = S_AXI_PARAM_ARREADY_out;
  assign S_AXI_PARAM_AWREADY = S_AXI_PARAM_AWREADY_out;
  assign S_AXI_PARAM_BVALID = S_AXI_PARAM_BVALID_out;
  assign S_AXI_PARAM_RDATA = S_AXI_PARAM_RDATA_out;
  assign S_AXI_PARAM_RVALID = S_AXI_PARAM_RVALID_out;
  assign S_AXI_PARAM_WREADY = S_AXI_PARAM_WREADY_out;
  assign XO_OUT = XO_OUT_out;

  assign CLK_in = CLK;
  assign CONTROL_in = CONTROL;
  assign D_CLK_in = D_CLK;
  assign ENABLE_in = ENABLE;
  assign INDEX_BYPASS_in = INDEX_BYPASS;
  assign RESET_N_in = RESET_N;
  assign SHUTDOWN_IN_in = SHUTDOWN_IN;
  assign SIGNAL_BYPASS_in = SIGNAL_BYPASS;
  assign S_AXIS_DIN_TDATA_in = S_AXIS_DIN_TDATA;
  assign S_AXIS_DIN_TUSER_in = S_AXIS_DIN_TUSER;
  assign S_AXIS_DIN_TVALID_in = S_AXIS_DIN_TVALID;
  assign S_AXIS_MEM_CONFIG_TDATA_in = S_AXIS_MEM_CONFIG_TDATA;
  assign S_AXIS_MEM_CONFIG_TVALID_in = S_AXIS_MEM_CONFIG_TVALID;
  assign S_AXI_PARAM_ACLK_in = S_AXI_PARAM_ACLK;
  assign S_AXI_PARAM_ARADDR_in = S_AXI_PARAM_ARADDR;
  assign S_AXI_PARAM_ARESETN_in = S_AXI_PARAM_ARESETN;
  assign S_AXI_PARAM_ARVALID_in = S_AXI_PARAM_ARVALID;
  assign S_AXI_PARAM_AWADDR_in = S_AXI_PARAM_AWADDR;
  assign S_AXI_PARAM_AWVALID_in = S_AXI_PARAM_AWVALID;
  assign S_AXI_PARAM_BREADY_in = S_AXI_PARAM_BREADY;
  assign S_AXI_PARAM_RREADY_in = S_AXI_PARAM_RREADY;
  assign S_AXI_PARAM_WDATA_in = S_AXI_PARAM_WDATA;
  assign S_AXI_PARAM_WVALID_in = S_AXI_PARAM_WVALID;
  assign XO_IN_in = XO_IN;

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
  
  assign NUM_DUAL_TERMS_BIN = NUM_DUAL_TERMS_REG * 1000;
  
  assign NUM_PHASES_BIN = NUM_PHASES_REG * 1000;
  
  assign NUM_UNITS_BIN = NUM_UNITS_REG * 1000;
  
`else
  always @ (trig_attr) begin
  #1;
  ACTIVE_DUTYCYCLE_BIN = ACTIVE_DUTYCYCLE_REG * 1000;
  
  CLK_FREQ_BIN = CLK_FREQ_REG * 1000;
  
  NUM_DUAL_TERMS_BIN = NUM_DUAL_TERMS_REG * 1000;
  
  NUM_PHASES_BIN = NUM_PHASES_REG * 1000;
  
  NUM_UNITS_BIN = NUM_UNITS_REG * 1000;
  
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
        (NUM_DUAL_TERMS_REG < 0.00 || NUM_DUAL_TERMS_REG > 16.00)) begin
      $display("Error: [Unisim %s-103] NUM_DUAL_TERMS attribute is set to %f.  Legal values for this attribute are 0.00 to 16.00. Instance: %m", MODULE_NAME, NUM_DUAL_TERMS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (NUM_PHASES_REG < 1.00 || NUM_PHASES_REG > 2.00)) begin
      $display("Error: [Unisim %s-104] NUM_PHASES attribute is set to %f.  Legal values for this attribute are 1.00 to 2.00. Instance: %m", MODULE_NAME, NUM_PHASES_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        (NUM_UNITS_REG < 1.00 || NUM_UNITS_REG > 16.00)) begin
      $display("Error: [Unisim %s-105] NUM_UNITS attribute is set to %f.  Legal values for this attribute are 1.00 to 16.00. Instance: %m", MODULE_NAME, NUM_UNITS_REG);
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
assign SCAN_CHOP_CLK_in = 1'b1; // tie off

assign MBIST_IN_in = 8'b11111111; // tie off
assign SCAN_DATA_IN_in = 150'b111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111; // tie off
assign TEST_IN_in = 16'b1111111111111111; // tie off

  SIP_DFE_NL_FIR SIP_DFE_NL_FIR_INST (
    .ACTIVE_DUTYCYCLE (ACTIVE_DUTYCYCLE_BIN),
    .CLK_FREQ (CLK_FREQ_BIN),
    .NUM_DUAL_TERMS (NUM_DUAL_TERMS_BIN),
    .NUM_PHASES (NUM_PHASES_BIN),
    .NUM_UNITS (NUM_UNITS_BIN),
    .XPA_CFG0 (XPA_CFG0_REG),
    .MBIST_OUT (MBIST_OUT_out),
    .M_AXIS_DOUT_TDATA (M_AXIS_DOUT_TDATA_out),
    .M_AXIS_DOUT_TUSER (M_AXIS_DOUT_TUSER_out),
    .M_AXIS_DOUT_TVALID (M_AXIS_DOUT_TVALID_out),
    .M_AXIS_INDEX_DL_TDATA (M_AXIS_INDEX_DL_TDATA_out),
    .M_AXIS_INDEX_DL_TVALID (M_AXIS_INDEX_DL_TVALID_out),
    .M_AXIS_MEM_TDATA (M_AXIS_MEM_TDATA_out),
    .M_AXIS_MEM_TVALID (M_AXIS_MEM_TVALID_out),
    .M_AXIS_SIGNAL_DL_TDATA (M_AXIS_SIGNAL_DL_TDATA_out),
    .M_AXIS_SIGNAL_DL_TVALID (M_AXIS_SIGNAL_DL_TVALID_out),
    .SCAN_DATA_OUT (SCAN_DATA_OUT_out),
    .SHUTDOWN_OUT (SHUTDOWN_OUT_out),
    .STATUS (STATUS_out),
    .S_AXIS_DIN_TREADY (S_AXIS_DIN_TREADY_out),
    .S_AXIS_MEM_CONFIG_TREADY (S_AXIS_MEM_CONFIG_TREADY_out),
    .S_AXI_PARAM_ARREADY (S_AXI_PARAM_ARREADY_out),
    .S_AXI_PARAM_AWREADY (S_AXI_PARAM_AWREADY_out),
    .S_AXI_PARAM_BVALID (S_AXI_PARAM_BVALID_out),
    .S_AXI_PARAM_RDATA (S_AXI_PARAM_RDATA_out),
    .S_AXI_PARAM_RVALID (S_AXI_PARAM_RVALID_out),
    .S_AXI_PARAM_WREADY (S_AXI_PARAM_WREADY_out),
    .TEST_OUT (TEST_OUT_out),
    .XO_OUT (XO_OUT_out),
    .CLK (CLK_in),
    .CONTROL (CONTROL_in),
    .D_CLK (D_CLK_in),
    .ENABLE (ENABLE_in),
    .INDEX_BYPASS (INDEX_BYPASS_in),
    .JTAG_CLK (JTAG_CLK_in),
    .MBIST_IN (MBIST_IN_in),
    .RESET_N (RESET_N_in),
    .SCAN_CHOP_CLK (SCAN_CHOP_CLK_in),
    .SCAN_DATA_IN (SCAN_DATA_IN_in),
    .SHUTDOWN_IN (SHUTDOWN_IN_in),
    .SIGNAL_BYPASS (SIGNAL_BYPASS_in),
    .S_AXIS_DIN_TDATA (S_AXIS_DIN_TDATA_in),
    .S_AXIS_DIN_TUSER (S_AXIS_DIN_TUSER_in),
    .S_AXIS_DIN_TVALID (S_AXIS_DIN_TVALID_in),
    .S_AXIS_MEM_CONFIG_TDATA (S_AXIS_MEM_CONFIG_TDATA_in),
    .S_AXIS_MEM_CONFIG_TVALID (S_AXIS_MEM_CONFIG_TVALID_in),
    .S_AXI_PARAM_ACLK (S_AXI_PARAM_ACLK_in),
    .S_AXI_PARAM_ARADDR (S_AXI_PARAM_ARADDR_in),
    .S_AXI_PARAM_ARESETN (S_AXI_PARAM_ARESETN_in),
    .S_AXI_PARAM_ARVALID (S_AXI_PARAM_ARVALID_in),
    .S_AXI_PARAM_AWADDR (S_AXI_PARAM_AWADDR_in),
    .S_AXI_PARAM_AWVALID (S_AXI_PARAM_AWVALID_in),
    .S_AXI_PARAM_BREADY (S_AXI_PARAM_BREADY_in),
    .S_AXI_PARAM_RREADY (S_AXI_PARAM_RREADY_in),
    .S_AXI_PARAM_WDATA (S_AXI_PARAM_WDATA_in),
    .S_AXI_PARAM_WVALID (S_AXI_PARAM_WVALID_in),
    .TEST_IN (TEST_IN_in),
    .XO_IN (XO_IN_in),
    .GSR (glblGSR)
  );

endmodule

`endcelldefine
