///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2021 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2021.2
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        LCLK_DELAY
// /___/   /\      Filename    : LCLK_DELAY.v
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

module LCLK_DELAY #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter DELAY = "VAL0",
  parameter GEN_PULSE = "FALSE",
  parameter USE_CASC_IN = "FALSE"
)(
  output O,
  output O_CASC,

  input I,
  input I_CASC
);

// define constants
  localparam MODULE_NAME = "LCLK_DELAY";
  
// Parameter encodings and registers
  localparam DELAY_VAL0 = 0;
  localparam DELAY_VAL4 = 1;
  localparam DELAY_VAL8 = 2;
  localparam GEN_PULSE_FALSE = 0;
  localparam GEN_PULSE_TRUE = 1;
  localparam USE_CASC_IN_FALSE = 0;
  localparam USE_CASC_IN_TRUE = 1;

  localparam D4_DELAY = 160;
  localparam D8_DELAY = 320;

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "LCLK_DELAY_dr.v"
`else
  reg [32:1] DELAY_REG = DELAY;
  reg [40:1] GEN_PULSE_REG = GEN_PULSE;
  reg [40:1] USE_CASC_IN_REG = USE_CASC_IN;
`endif

`ifdef XIL_XECLIB
  wire [1:0] DELAY_BIN;
  wire GEN_PULSE_BIN;
  wire USE_CASC_IN_BIN;
`else
  reg [1:0] DELAY_BIN;
  reg GEN_PULSE_BIN;
  reg USE_CASC_IN_BIN;
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
  assign DELAY_BIN =
      (DELAY_REG == "VAL0") ? DELAY_VAL0 :
      (DELAY_REG == "VAL4") ? DELAY_VAL4 :
      (DELAY_REG == "VAL8") ? DELAY_VAL8 :
       DELAY_VAL0;
  
  assign GEN_PULSE_BIN =
      (GEN_PULSE_REG == "FALSE") ? GEN_PULSE_FALSE :
      (GEN_PULSE_REG == "TRUE") ? GEN_PULSE_TRUE :
       GEN_PULSE_FALSE;
  
  assign USE_CASC_IN_BIN =
      (USE_CASC_IN_REG == "FALSE") ? USE_CASC_IN_FALSE :
      (USE_CASC_IN_REG == "TRUE") ? USE_CASC_IN_TRUE :
       USE_CASC_IN_FALSE;
  
`else
  always @ (trig_attr) begin
  #1;
  DELAY_BIN =
      (DELAY_REG == "VAL0") ? DELAY_VAL0 :
      (DELAY_REG == "VAL4") ? DELAY_VAL4 :
      (DELAY_REG == "VAL8") ? DELAY_VAL8 :
       DELAY_VAL0;
  
  GEN_PULSE_BIN =
      (GEN_PULSE_REG == "FALSE") ? GEN_PULSE_FALSE :
      (GEN_PULSE_REG == "TRUE") ? GEN_PULSE_TRUE :
       GEN_PULSE_FALSE;
  
  USE_CASC_IN_BIN =
      (USE_CASC_IN_REG == "FALSE") ? USE_CASC_IN_FALSE :
      (USE_CASC_IN_REG == "TRUE") ? USE_CASC_IN_TRUE :
       USE_CASC_IN_FALSE;
  
  end
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
  always @ (trig_attr) begin
    #1;
    if ((attr_test == 1'b1) ||
        ((DELAY_REG != "VAL0") &&
         (DELAY_REG != "VAL4") &&
         (DELAY_REG != "VAL8"))) begin
      $display("Error: [Unisim %s-101] DELAY attribute is set to %s.  Legal values for this attribute are VAL0, VAL4 or VAL8. Instance: %m", MODULE_NAME, DELAY_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((GEN_PULSE_REG != "FALSE") &&
         (GEN_PULSE_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-102] GEN_PULSE attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, GEN_PULSE_REG);
      attr_err = 1'b1;
    end
    
    if ((attr_test == 1'b1) ||
        ((USE_CASC_IN_REG != "FALSE") &&
         (USE_CASC_IN_REG != "TRUE"))) begin
      $display("Error: [Unisim %s-103] USE_CASC_IN attribute is set to %s.  Legal values for this attribute are FALSE or TRUE. Instance: %m", MODULE_NAME, USE_CASC_IN_REG);
      attr_err = 1'b1;
    end
    
    if (attr_err == 1'b1) #1 $finish;
  end
`endif

// begin behavioral model

always @(trig_attr) begin
    #1;
    if (GEN_PULSE_REG == "FALSE")  begin
      $display("Info: [Unisim %s-200] GEN_PULSE  attribute is set to %s. Please note that the O_CASC output will be invalid. Instance: %m", MODULE_NAME, GEN_PULSE_REG);
    end
    if (GEN_PULSE_REG == "TRUE" && USE_CASC_IN_REG=="TRUE")  begin
      $display("Info: [Unisim %s-201] GEN_PULSE  attribute is set to %s and USE_CASC_IN attribute is set to %s. Please note that the O output will be invalid. Instance: %m", MODULE_NAME, GEN_PULSE_REG,USE_CASC_IN_REG);
    end
end

reg   I_in_d4;
reg   I_in_d8;
reg   I_CASC_in_d4;
reg   I_CASC_in_d8;
wire  I_in_pe; 
reg   O_out;
reg   O_CASC_out;

initial begin
  I_in_d4      = 0;
  I_in_d8      = 0;
  I_CASC_in_d4 = 0;
  I_CASC_in_d8 = 0;

end

always @(*) I_in_d4      <= #D4_DELAY I;
always @(*) I_in_d8      <= #D8_DELAY I;
always @(*) I_CASC_in_d4 <= #D4_DELAY I_CASC;
always @(*) I_CASC_in_d8 <= #D8_DELAY I_CASC;

assign I_in_pe = I & ~I_in_d8;

always @(*) begin
  //GEN_PULSE DELAY USE_CASC_IN clk_out casc_out    
  //FALSE VAL0        FALSE   clkin       invalid -0  
  //FALSE VAL0        TRUE    clkin       invalid -0  
  //FALSE VAL4        FALSE   clkin-d4    invalid -0 
  //FALSE VAL4        TRUE    cascin-d4   invalid -0 
  //FALSE VAL8        FALSE   clkin-d8    clkin-d8  
  //FALSE VAL8        TRUE    cascin-d8   cascin-d8
  //TRUE  DON'T CARE  FALSE   clkin-pulse clkin-d8 
  //TRUE  DON'T CARE  TRUE    *invalid -0 cascin-d8
  if (GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL0 && USE_CASC_IN_BIN==USE_CASC_IN_FALSE) begin
    O_out       <= I;
    O_CASC_out  <= 0;
  end  
  else if(GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL0 && USE_CASC_IN_BIN==USE_CASC_IN_TRUE) begin
    O_out       <= I;
    O_CASC_out  <= 0;
    end 
  else if(GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL4 && USE_CASC_IN_BIN==USE_CASC_IN_FALSE) begin
    O_out       <= I_in_d4;
    O_CASC_out  <= 0;
  end 
  else if(GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL4 && USE_CASC_IN_BIN==USE_CASC_IN_TRUE) begin
    O_out       <= I_CASC_in_d4;
    O_CASC_out  <= 0;
  end 
  else if(GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL8 && USE_CASC_IN_BIN==USE_CASC_IN_FALSE) begin
    O_out       <= I_in_d8;
    O_CASC_out  <= I_in_d8;
  end 
  else if(GEN_PULSE_BIN==GEN_PULSE_FALSE && DELAY_BIN==DELAY_VAL8 && USE_CASC_IN_BIN==USE_CASC_IN_TRUE) begin
    O_out       <= I_CASC_in_d8;
    O_CASC_out  <= I_CASC_in_d8;
  end 
  else if(GEN_PULSE_BIN==GEN_PULSE_TRUE && USE_CASC_IN_BIN==USE_CASC_IN_FALSE) begin
    O_out       <= I_in_pe;
    O_CASC_out  <= I_in_d8;
  end 
  else if(GEN_PULSE_BIN==GEN_PULSE_TRUE && USE_CASC_IN_BIN==USE_CASC_IN_TRUE) begin
    O_out       <= 0;
    O_CASC_out  <= I_CASC_in_d8;
  end 
end //always

assign O = O_out;
assign O_CASC = O_CASC_out;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (I => O) = (0:0:0, 0:0:0);
    (I => O_CASC) = (0:0:0, 0:0:0);
    (I_CASC => O) = (0:0:0, 0:0:0);
    (I_CASC => O_CASC) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
