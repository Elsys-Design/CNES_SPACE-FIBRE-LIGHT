///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUFDS_COMP
// /___/   /\      Filename    : IOBUFDS_COMP.v
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

module IOBUFDS_COMP #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DQS_BIAS = "FALSE",
  parameter IBUF_LOW_PWR = "TRUE",
  parameter IOSTANDARD = "DEFAULT",
  parameter USE_IBUFDISABLE = "TRUE"
)(
  output O,

  inout IO,
  inout IOB,

  input DCITERMDISABLE,
  input I,
  input IBUFDISABLE,
  input T
);

// define constants
  localparam MODULE_NAME = "IOBUFDS_COMP";
  
// Parameter encodings and registers
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam IBUF_LOW_PWR_FALSE = 1;
  localparam IBUF_LOW_PWR_TRUE = 0;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;
  localparam USE_IBUFDISABLE_T_CONTROL = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_COMP_dr.v"
`else
  reg [40:1] DQS_BIAS_REG = DQS_BIAS;
  reg [40:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg [72:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;
`endif

`ifdef XIL_XECLIB
  wire DQS_BIAS_BIN;
  wire IBUF_LOW_PWR_BIN;
  wire [1:0] USE_IBUFDISABLE_BIN;
`else
  reg DQS_BIAS_BIN;
  reg IBUF_LOW_PWR_BIN;
  reg [1:0] USE_IBUFDISABLE_BIN;
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
  assign DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  assign IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
       IBUF_LOW_PWR_TRUE;
  
  assign USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
       USE_IBUFDISABLE_TRUE;
  
`else
  always @ (trig_attr) begin
  #1;
  DQS_BIAS_BIN =
      (DQS_BIAS_REG == "FALSE") ? DQS_BIAS_FALSE :
      (DQS_BIAS_REG == "TRUE") ? DQS_BIAS_TRUE :
       DQS_BIAS_FALSE;
  
  IBUF_LOW_PWR_BIN =
      (IBUF_LOW_PWR_REG == "TRUE") ? IBUF_LOW_PWR_TRUE :
      (IBUF_LOW_PWR_REG == "FALSE") ? IBUF_LOW_PWR_FALSE :
       IBUF_LOW_PWR_TRUE;
  
  USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
       USE_IBUFDISABLE_TRUE;
  
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DQS_BIAS_REG != "FALSE") &&
         (DQS_BIAS_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-101] DQS_BIAS attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, DQS_BIAS_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((IBUF_LOW_PWR_REG != "TRUE") &&
         (IBUF_LOW_PWR_REG != "FALSE"))) begin
      $display("Error: [Unisim %s-102] IBUF_LOW_PWR attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, IBUF_LOW_PWR_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "TRUE") &&
         (USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "T_CONTROL"))) begin
      $display("Error: [Unisim %s-105] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are TRUE, FALSE or T_CONTROL. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
    wire i_in, io_in, iob_in, ibufdisable_in, dcitermdisable_in, t_in, out_val;
    reg o_out, io_out, iob_out;
    reg O_int;

    wire t_or_gts;
    wire not_t_or_ibufdisable;

    tri0 GTS = glbl.GTS;

    assign O =  (USE_IBUFDISABLE_BIN == 2'b00) ? o_out :
                ((USE_IBUFDISABLE_BIN == 2'b10) ? ((t_in == 1'b1) ? io_in : ((t_in == 1'b0) ? 1'b0 : 1'bx)) :((not_t_or_ibufdisable === 1'b1) ? 1'b0 : ((not_t_or_ibufdisable === 1'b0) ? o_out : 1'bx)));

    assign dcitermdisable_in = DCITERMDISABLE;
    assign i_in = I;
    assign ibufdisable_in = IBUFDISABLE;
    assign t_in = T;
    assign io_in = IO; 
    assign iob_in = IOB;

    assign t_or_gts = GTS || t_in;
    assign IO  = t_or_gts ? 1'bz :  ~i_in; //As this is complement of IOBUFDS unisim.
    assign IOB = t_or_gts ? 1'bz : i_in;

    assign not_t_or_ibufdisable = ~t_in || ibufdisable_in;

    always @(io_in or iob_in or DQS_BIAS_BIN) begin
        if (io_in == 1'b1 && iob_in == 1'b0)
          o_out <= 1'b1;
        else if (io_in == 1'b0 && iob_in == 1'b1)
          o_out <= 1'b0;
        else if ((io_in === 1'bz || io_in == 1'b0) && (iob_in === 1'bz || iob_in == 1'b1))
          if (DQS_BIAS_BIN == 1'b1)
            o_out <= 1'b0;
          else
            o_out <= 1'bx;
        else if (io_in === 1'bx || iob_in === 1'bx)
          o_out <= 1'bx;
        end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (DCITERMDISABLE => IO) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (I => IO) = (0:0:0, 0:0:0);
    (I => IOB) = (0:0:0, 0:0:0);
    (IBUFDISABLE => O) = (0:0:0, 0:0:0);
    (IO => O) = (0:0:0, 0:0:0);
    (IOB => O) = (0:0:0, 0:0:0);
    (T => IO) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    (T => IOB) = (0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
