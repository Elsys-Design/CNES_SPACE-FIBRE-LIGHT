///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUFDS_DIFF_OUT_INTERMDISABLE_ODDR
// /___/   /\      Filename    : IOBUFDS_DIFF_OUT_INTERMDISABLE_ODDR.v
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

module IOBUFDS_DIFF_OUT_INTERMDISABLE_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter USE_IBUFDISABLE = "TRUE"
)(
  output O,
  output OB,

  inout IO,
  inout IOB,

  input C,
  input IBUFDISABLE,
  input INTERMDISABLE,
  input I_0,
  input I_1,
  input TM,
  input TS
);

// define constants
  localparam MODULE_NAME = "IOBUFDS_DIFF_OUT_INTERMDISABLE_ODDR";
  
// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam USE_IBUFDISABLE_FALSE = 1;
  localparam USE_IBUFDISABLE_TRUE = 0;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_DIFF_OUT_INTERMDISABLE_ODDR_dr.v"
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
  wire TM_in;
  wire TS_in;

  assign C_in = C;
  assign IBUFDISABLE_in = (IBUFDISABLE !== 1'bz) && IBUFDISABLE; // rv 0
  assign INTERMDISABLE_in = (INTERMDISABLE !== 1'bz) && INTERMDISABLE; // rv 0
  assign I_0_in = I_0;
  assign I_1_in = I_1;
  assign TM_in = TM;
  assign TS_in = TS;

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
      $display("Error: [Unisim %s-107] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are TRUE or FALSE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire      t1;
  wire      t2;
  wire      out_val;
  wire      out_b_val;
  wire      T_OR_IBUFDISABLE_1;
  wire      T_OR_IBUFDISABLE_2;
  reg       DQS_BIAS_BINARY = 1'b0;
  tri0      GTS = glbl.GTS;
  wire      I_muxed;

  assign I_muxed   = (C_in==1'b1) ? I_0_in : I_1_in; 

  or O1 (t1, GTS, TM);
  bufif0 B1 (IO, I_muxed, t1);

  or O2 (t2, GTS, TS);
  notif0 N2 (IOB, I_muxed, t2);

  reg O_int, OB_int;
  //generate
  //     case (SIM_DEVICE)
  //       "7SERIES" : begin
  //                      assign out_val = 1'b1;
  //                      assign out_b_val = 1'b1;
  //                   end
  //       "ULTRASCALE" : begin
  //                      assign out_val = 1'b0;
  //                      assign out_b_val = 1'bx;
  //                   end
  //       default : begin
  //        assign out_val = 1'b0;
  //        assign out_b_val = 1'b0;
  //               end
  //      endcase
  // endgenerate
  assign out_val   = 1'b0; // Versal behavior
  assign out_b_val = 1'b0; // Versal behavior

  always @(IO or IOB or DQS_BIAS_BINARY) begin
    if (IO == 1'b1 && IOB == 1'b0) begin
        O_int  <= IO;
        OB_int <= ~IO;
    end
    else if (IO == 1'b0 && IOB == 1'b1) begin
        O_int  <= IO;
        OB_int <= ~IO;
    end
    else if ((IO === 1'bz || IO == 1'b0) && (IOB === 1'bz || IOB == 1'b1)) begin
      if (DQS_BIAS_BINARY == 1'b1) begin
        O_int <= 1'b0;
        OB_int <= 1'b1;
      end else begin
        O_int <= 1'bx;
        OB_int <= 1'bx;
      end
    end
    else begin
      O_int  <= 1'bx;
      OB_int <= 1'bx;
    end
  end

  generate
    case (USE_IBUFDISABLE)
      "TRUE" :  begin
                  assign T_OR_IBUFDISABLE_1 = ~TM || IBUFDISABLE;
                  assign T_OR_IBUFDISABLE_2 = ~TS || IBUFDISABLE;
                  assign O = (T_OR_IBUFDISABLE_1 == 1'b1) ? out_val : (T_OR_IBUFDISABLE_1 == 1'b0) ? O_int : 1'bx;
                  assign OB = (T_OR_IBUFDISABLE_2 == 1'b1) ? out_b_val : (T_OR_IBUFDISABLE_2 == 1'b0) ? OB_int : 1'bx;
                end
      "FALSE" : begin
                  assign O = O_int;
                  assign OB = OB_int;
                end
    endcase
  endgenerate

// end behavioral model

endmodule

`endcelldefine
