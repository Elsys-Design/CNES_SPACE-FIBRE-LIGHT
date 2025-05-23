///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUFDS_INTERMDISABLE_ODDR
// /___/   /\      Filename    : IOBUFDS_INTERMDISABLE_ODDR.v
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

module IOBUFDS_INTERMDISABLE_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter USE_IBUFDISABLE = "TRUE"
)(
  output O,

  inout IO,
  inout IOB,

  input C,
  input IBUFDISABLE,
  input INTERMDISABLE,
  input I_0,
  input I_1,
  input T
);

// define constants
  localparam MODULE_NAME = "IOBUFDS_INTERMDISABLE_ODDR";
  
// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_INTERMDISABLE_ODDR_dr.v"
`else
  reg [40:1] DIFF_TERM_REG = DIFF_TERM;
  reg [40:1] DQS_BIAS_REG = DQS_BIAS;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg [40:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;
`endif

`ifdef XIL_XECLIB
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire USE_IBUFDISABLE_BIN;
`else
  reg DIFF_TERM_BIN;
  reg DQS_BIAS_BIN;
  reg USE_IBUFDISABLE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
tri0 glblGSR = glbl.GSR;
`endif

  wire C_in;
  wire IBUFDISABLE_in;
  wire INTERMDISABLE_in;
  wire I_0_in;
  wire I_1_in;
  wire T_in;

  assign C_in = C;
  assign IBUFDISABLE_in = (IBUFDISABLE !== 1'bz) && IBUFDISABLE; // rv 0
  assign INTERMDISABLE_in = (INTERMDISABLE !== 1'bz) && INTERMDISABLE; // rv 0
  assign I_0_in = I_0;
  assign I_1_in = I_1;
  assign T_in = T;

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
  
  assign USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
       USE_IBUFDISABLE_TRUE;
  
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
  
  USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
       USE_IBUFDISABLE_TRUE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DIFF_TERM_REG != "FALSE") &&
         (DIFF_TERM_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] DIFF_TERM attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DIFF_TERM_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "TRUE") &&
         (USE_IBUFDISABLE_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-108] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
    wire I_muxed;
    wire io_in;
    wire iob_in;
    reg  o_out;
    reg  io_out;
    reg  iob_out;
    reg  O_int;
    wire out_val;

    reg  DQS_BIAS_BINARY = 1'b0;

    wire t_or_gts;
    wire not_t_or_ibufdisable;

    tri0 GTS = glbl.GTS;

    assign not_t_or_ibufdisable = ~T_in || IBUFDISABLE_in;
    // assign disable_out = INTERMDISABLE_in && IBUFDISABLE_in;
    
    assign O  =  (USE_IBUFDISABLE_BIN == USE_IBUFDISABLE_FALSE) ? o_out :
                 ((not_t_or_ibufdisable === 1'b1) ? out_val : ((not_t_or_ibufdisable === 1'b0) ? o_out : 1'bx));

    
    assign I_muxed   = (C_in==1'b1) ? I_0_in : I_1_in; 


    assign io_in = IO;
    assign iob_in = IOB;

    assign t_or_gts = GTS || T_in;
    assign IO  = t_or_gts ? 1'bz :  I_muxed;
    assign IOB = t_or_gts ? 1'bz : ~I_muxed;


    assign out_val = 1'b0;

    always @(io_in or iob_in or DQS_BIAS_BINARY) begin
        if (io_in == 1'b1 && iob_in == 1'b0)
          o_out <= 1'b1;
        else if (io_in == 1'b0 && iob_in == 1'b1)
          o_out <= 1'b0;
        else if ((io_in === 1'bz || io_in == 1'b0) && (iob_in === 1'bz || iob_in == 1'b1))
          if (DQS_BIAS_BINARY == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if (io_in === 1'bx || iob_in === 1'bx)
          o_out <= 1'bx;
        end



// end behavioral model

endmodule

`endcelldefine
