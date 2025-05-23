///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUFDS_ODDR
// /___/   /\      Filename    : IOBUFDS_ODDR.v
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

module IOBUFDS_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DIFF_TERM = "FALSE",
  parameter DQS_BIAS = "FALSE",
  parameter EN_OMUX = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  inout IO,
  inout IOB,

  input C,
  input DCITERMDISABLE,
  input IBUFDISABLE,
  input I_0,
  input I_1,
  input [3:0] OSC,
  input [1:0] OSC_EN,
  input T
);

// define constants
  localparam MODULE_NAME = "IOBUFDS_ODDR";
  
// Parameter encodings and registers
  localparam DIFF_TERM_FALSE = 0;
  localparam DIFF_TERM_TRUE = 1;
  localparam DQS_BIAS_FALSE = 0;
  localparam DQS_BIAS_TRUE = 1;
  localparam EN_OMUX_FALSE = 0;
  localparam EN_OMUX_TRUE = 1;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;
  localparam USE_IBUFDISABLE_T_CONTROL = 2;

  
  //Not attribute related:
  localparam in_delay = 0;
  localparam out_delay = 0;
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUFDS_ODDR_dr.v"
`else
  reg [40:1] DIFF_TERM_REG = DIFF_TERM;
  reg [40:1] DQS_BIAS_REG = DQS_BIAS;
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg signed [31:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  reg [72:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;
`endif

`ifdef XIL_XECLIB
  wire DIFF_TERM_BIN;
  wire DQS_BIAS_BIN;
  wire EN_OMUX_BIN;
  wire [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  wire [1:0] USE_IBUFDISABLE_BIN;
`else
  reg DIFF_TERM_BIN;
  reg DQS_BIAS_BIN;
  reg EN_OMUX_BIN;
  reg [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
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
  
  assign SIM_INPUT_BUFFER_OFFSET_BIN = SIM_INPUT_BUFFER_OFFSET_REG[6:0];
  
  assign USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
       USE_IBUFDISABLE_FALSE;
  
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
  
  SIM_INPUT_BUFFER_OFFSET_BIN = SIM_INPUT_BUFFER_OFFSET_REG[6:0];
  
  USE_IBUFDISABLE_BIN =
      (USE_IBUFDISABLE_REG == "FALSE") ? USE_IBUFDISABLE_FALSE :
      (USE_IBUFDISABLE_REG == "T_CONTROL") ? USE_IBUFDISABLE_T_CONTROL :
      (USE_IBUFDISABLE_REG == "TRUE") ? USE_IBUFDISABLE_TRUE :
       USE_IBUFDISABLE_FALSE;
  
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
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-108] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "T_CONTROL") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-110] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE, T_CONTROL or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  reg           O_out;
  wire          IO_out;
  wire          IOB_out;
  reg           O_OSC_in;

  wire          O_delay;
  wire          DCITERMDISABLE_in;
  wire          IBUFDISABLE_in;
  wire          I_0_in;
  wire          I_1_in;
  wire          IO_in;
  wire          IOB_in;
  wire          T_in;
  wire [1:0]    OSC_EN_in;
  wire [3:0]    OSC_in;

  wire          DCITERMDISABLE_delay;
  wire          IBUFDISABLE_delay;
  wire          I_delay;
  wire          IOB_delay_I;
  wire          IO_delay_I;
  wire          IO_delay_O;
  wire          IOB_delay_O;
  wire          T_delay;
  wire [1:0]    OSC_EN_delay;
  wire [3:0]    OSC_delay;

  wire          ts;
  integer       OSC_int = 0;

  wire          not_t_or_ibufdisable;
  assign        not_t_or_ibufdisable = ~T_in || IBUFDISABLE_in;


  tri0          GTS = glbl.GTS;

  wire          I_muxed;
  assign        I_muxed   = (C==1'b1) ? I_0_in : I_1_in; 


  or O1 (ts, GTS, T_in);
  bufif0 B1 (IO_out, I_muxed, ts);
  notif0 N1 (IOB_out, I_muxed, ts); 
  assign #(out_delay) O = O_delay;
  assign #(out_delay) IO = IO_delay_O;
  assign #(out_delay) IOB = IOB_delay_O;

// inputs with no timing checks
  assign #(in_delay) IOB_delay_I = IOB;
  assign #(in_delay) DCITERMDISABLE_delay = DCITERMDISABLE;
  assign #(in_delay) IBUFDISABLE_delay = IBUFDISABLE;
  assign #(in_delay) I_0_delay = I_0;
  assign #(in_delay) I_1_delay = I_1;
  assign #(in_delay) IO_delay_I = IO;
  assign #(in_delay) OSC_EN_delay = OSC_EN;
  assign #(in_delay) OSC_delay = OSC;
  assign #(in_delay) T_delay = T;

//  assign O_delay = O_out;
  assign IO_delay_O = IO_out;
  assign IOB_delay_O = IOB_out;

  assign DCITERMDISABLE_in = DCITERMDISABLE_delay;
  assign IBUFDISABLE_in = IBUFDISABLE_delay;
  assign I_0_in = I_0_delay;
  assign I_1_in = I_1_delay;
  assign IO_in = IO_delay_I;
  assign IOB_in = IOB_delay_I;  
  assign OSC_EN_in = OSC_EN_delay;
  assign OSC_in = OSC_delay;
  assign T_in = T_delay;



  wire [1:0] OSC_EN_in_muxed;
  wire [3:0] OSC_in_muxed;

  assign OSC_in_muxed    = 4'd0;
  assign OSC_EN_in_muxed = 2'd0;


  assign O_delay = (OSC_EN_in_muxed === 2'b11) ? O_OSC_in : 
                   (OSC_EN_in_muxed === 2'b10 || OSC_EN_in_muxed === 2'b01) ? 1'bx : 
                   O_out;
 
  always @ (OSC_in_muxed or OSC_EN_in_muxed) begin
    OSC_int = OSC_in_muxed[2:0] * 5;
    if (OSC_in_muxed[3] == 1'b0 )
      OSC_int =  -1*OSC_int;
  
    if(OSC_EN_in_muxed == 1'b1) begin
      if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) < 0)
        O_OSC_in <= 1'b0;
      else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
        O_OSC_in <= 1'b1;
      else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
        O_OSC_in <= ~O_OSC_in;
    end
  end

  initial begin
    if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int)< 0)
      O_OSC_in <= 1'b0;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) > 0)  
      O_OSC_in <= 1'b1;
    else if ((SIM_INPUT_BUFFER_OFFSET_REG - OSC_int) == 0)
      O_OSC_in <= 1'bx;
  end 

  always @(IO_in or IOB_in or DQS_BIAS_BIN or not_t_or_ibufdisable or USE_IBUFDISABLE_BIN) begin
    if (USE_IBUFDISABLE_BIN == USE_IBUFDISABLE_TRUE  && not_t_or_ibufdisable == 1'b1)
      O_out <= 1'b0;
    else if ((USE_IBUFDISABLE_BIN == USE_IBUFDISABLE_TRUE && not_t_or_ibufdisable == 1'b0) || 
             (USE_IBUFDISABLE_BIN == USE_IBUFDISABLE_FALSE)) begin
      if (IO_in == 1'b1 && IOB_in == 1'b0)
        O_out <= 1'b1;
      else if (IO_in == 1'b0 && IOB_in == 1'b1)
        O_out <= 1'b0;
      else if ((IO_in === 1'bz || IO_in == 1'b0) && (IOB_in === 1'bz || IOB_in == 1'b1))
        if (DQS_BIAS_BIN == 1'b1)
          O_out <= 1'b0;
        else
          O_out <= 1'bx;
        else if ((IO_in === 1'bx) || (IOB_in === 1'bx))
          O_out <= 1'bx;
    end
    else if (USE_IBUFDISABLE_BIN == USE_IBUFDISABLE_T_CONTROL) begin
      if (T_in == 1'b1)
        O_out <= IO_in;
      else if (T_in == 1'b0)
        O_out <= 1'b0;
      else
        O_out <= 1'bx;
    end
    else begin
      O_out <= 1'bx;
    end
  end

// end behavioral model

endmodule

`endcelldefine
