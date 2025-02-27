///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2022.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        IOBUF_ODDR
// /___/   /\      Filename    : IOBUF_ODDR.v
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

module IOBUF_ODDR #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DRIVE = 8,
  parameter EN_OMUX = "FALSE",
  parameter IOSTANDARD = "DEFAULT",
  parameter integer SIM_INPUT_BUFFER_OFFSET = 0,
  parameter USE_IBUFDISABLE = "FALSE"
)(
  output O,

  inout IO,

  input C,
  input DCITERMDISABLE,
  input IBUFDISABLE,
  input I_0,
  input I_1,
  input [3:0] OSC,
  input OSC_EN,
  input T,
  input VREF
);

// define constants
  localparam MODULE_NAME = "IOBUF_ODDR";
  
// Parameter encodings and registers
  localparam EN_OMUX_FALSE = 0;
  localparam EN_OMUX_TRUE = 1;
  localparam USE_IBUFDISABLE_FALSE = 0;
  localparam USE_IBUFDISABLE_TRUE = 1;
  localparam USE_IBUFDISABLE_T_CONTROL = 2;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "IOBUF_ODDR_dr.v"
`else
  reg [31:0] DRIVE_REG = DRIVE;
  reg [40:1] EN_OMUX_REG = EN_OMUX;
  reg [56:1] IOSTANDARD_REG = IOSTANDARD;
  reg signed [31:0] SIM_INPUT_BUFFER_OFFSET_REG = SIM_INPUT_BUFFER_OFFSET;
  reg [72:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;
`endif

`ifdef XIL_XECLIB
  wire [4:0] DRIVE_BIN;
  wire EN_OMUX_BIN;
  wire [6:0] SIM_INPUT_BUFFER_OFFSET_BIN;
  wire [1:0] USE_IBUFDISABLE_BIN;
`else
  reg [4:0] DRIVE_BIN;
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
  assign DRIVE_BIN = DRIVE_REG[4:0];
  
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
  DRIVE_BIN = DRIVE_REG[4:0];
  
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
        ((DRIVE_REG < 2) || (DRIVE_REG > 24))) begin
      $display("Error: [Unisim %s-101] DRIVE attribute is set to %d.  Legal values for this attribute are 2 to 24. Instance: %m", MODULE_NAME, DRIVE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((EN_OMUX_REG != "FALSE") &&
         (EN_OMUX_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] EN_OMUX attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, EN_OMUX_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((SIM_INPUT_BUFFER_OFFSET_REG < -50) || (SIM_INPUT_BUFFER_OFFSET_REG > 50))) begin
      $display("Error: [Unisim %s-105] SIM_INPUT_BUFFER_OFFSET attribute is set to %d.  Legal values for this attribute are -50 to 50. Instance: %m", MODULE_NAME, SIM_INPUT_BUFFER_OFFSET_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_IBUFDISABLE_REG != "FALSE") &&
         (USE_IBUFDISABLE_REG != "T_CONTROL") &&
         (USE_IBUFDISABLE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-107] USE_IBUFDISABLE attribute is set to %s.  Legal values for this attribute are FALSE, T_CONTROL or TRUE. Instance: %m", MODULE_NAME, USE_IBUFDISABLE_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model
  wire          not_t_or_ibufdisable;
  wire          ts;
  wire          I_muxed;

  assign I_muxed   = (C==1'b1) ? I_0 : I_1; 

  or O1 (ts, glbl.GTS, T);
  bufif0 T1 (IO, I_muxed, ts);



  assign not_t_or_ibufdisable = ~T || IBUFDISABLE;

  generate
    case (USE_IBUFDISABLE)
      "TRUE":  
        assign O = (IBUFDISABLE==1) ? 1'b0 : ((IO === 1'bz) ? 1'bx : IO);  //CR-1134125
      "FALSE": 
  	    assign O = (IO === 1'bz) ? 1'bx : IO; //CR-1134125
	  "T_CONTROL": 
	    assign O = (not_t_or_ibufdisable == 1'b1) ?  1'b0 :  ((IO === 1'bz) ? 1'bx : IO); //CR-1134125
    endcase
  endgenerate
 
 
// end behavioral model

endmodule

`endcelldefine
