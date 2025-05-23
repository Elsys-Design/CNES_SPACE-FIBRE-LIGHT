///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUFDS_DIFF_OUT_ODDR
// /___/   /\      Filename    : IOBUFDS_DIFF_OUT_ODDR.v
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

module IOBUFDS_DIFF_OUT_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter EN_OMUX = "FALSE",
  parameter IOSTANDARD = "DEFAULT"
)(
  output O,
  output OB,

  inout IO,
  inout IOB,

  input C,
  input I_0,
  input I_1,
  input TM,
  input TS
);

// define constants
  localparam MODULE_NAME = "IOBUFDS_DIFF_OUT_ODDR";
  
// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam EN_OMUX_FALSE = 0;
  localparam EN_OMUX_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_DIFF_OUT_ODDR_dr.v"
`else
  reg [40:1] DIFF_TERM_REG = DIFF_TERM;
  reg [40:1] DQS_BIAS_REG = DQS_BIAS;
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
`endif

`ifdef XIL_XECLIB
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire EN_OMUX_BIN;
`else
  reg DIFF_TERM_BIN;
  reg DQS_BIAS_BIN;
  reg EN_OMUX_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

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
  assign DIFF_TERM_BIN =
      (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
      (DIFF_TERM_REG == "TRUE") ? DIFF_TERM_TRUE :
       DIFF_TERM_FALSE;
  
  assign DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  assign EN_OMUX_BIN =
      (EN_OMUX_REG == "FALSE") ? EN_OMUX_FALSE :
      (EN_OMUX_REG == "TRUE") ? EN_OMUX_TRUE :
       EN_OMUX_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  DIFF_TERM_BIN =
      (DIFF_TERM_REG == "FALSE") ? DIFF_TERM_FALSE :
      (DIFF_TERM_REG == "TRUE") ? DIFF_TERM_TRUE :
       DIFF_TERM_FALSE;
  
  DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  EN_OMUX_BIN =
      (EN_OMUX_REG == "FALSE") ? EN_OMUX_FALSE :
      (EN_OMUX_REG == "TRUE") ? EN_OMUX_TRUE :
       EN_OMUX_FALSE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DIFF_TERM_REG != "FALSE") &&
         (DIFF_TERM_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DIFF_TERM attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_TERM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-104] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire      t1;
  wire      t2;
  reg       DQS_BIAS_BINARY = 1'b0;
  tri0      GTS = glbl.GTS;
  reg       O_out;
  reg       OB_out;
  wire      I_muxed;

  assign    I_muxed   = (C==1'b1) ? I_0 : I_1; 

    
  or O1 (t1, GTS, TM);
  bufif0 B1 (IO, I_muxed, t1);

  or O2 (t2, GTS, TS);
  notif0 N2 (IOB, I_muxed, t2);

  assign O = O_out;
  assign OB = OB_out;

  always @(IO or IOB or DQS_BIAS_BINARY) begin
    if (IO == 1'b1 && IOB == 1'b0) begin
        O_out  <= IO;
        OB_out <= ~IO;
    end
    else if (IO == 1'b0 && IOB == 1'b1) begin
        O_out  <= IO;
        OB_out <= ~IO;
    end
    else if ((IO === 1'bz || IO == 1'b0) && (IOB === 1'bz || IOB == 1'b1)) begin
      if (DQS_BIAS_BINARY == 1'b1) begin
        O_out <= 1'b0;
        OB_out <= 1'b1;
      end else begin
        O_out <= 1'bx;
        OB_out <= 1'bx;
      end
    end
    else begin
      O_out  <= 1'bx;
      OB_out <= 1'bx;
    end
  end


// end behavioral model

endmodule

`endcelldefine
