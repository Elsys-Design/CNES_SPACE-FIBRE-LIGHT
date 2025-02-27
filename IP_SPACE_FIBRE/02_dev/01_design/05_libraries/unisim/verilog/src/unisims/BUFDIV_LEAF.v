///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2020 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2020.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        BUFDIV_LEAF
// /___/   /\      Filename    : BUFDIV_LEAF.v
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

module BUFDIV_LEAF #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter integer DIVIDE = 1,
  parameter [0:0] IS_I_INVERTED = 1'b0
)(
  output O,

  input CLR_B,
  input I
);

// define constants
  localparam MODULE_NAME = "BUFDIV_LEAF";
  
  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "BUFDIV_LEAF_dr.v"
`else
  reg [31:0] DIVIDE_REG = DIVIDE;
  reg [0:0] IS_I_INVERTED_REG = IS_I_INVERTED;
`endif

`ifdef XIL_XECLIB
  wire [3:0] DIVIDE_BIN;
`else
  reg [3:0] DIVIDE_BIN;
`endif

`ifdef XIL_XECLIB
reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CLR_B_in;
  wire I_in;

`ifdef XIL_TIMING
  wire CLR_B_delay;
  wire I_delay;
`endif

`ifdef XIL_TIMING
  assign CLR_B_in = (CLR_B === 1'bz) || CLR_B_delay; // rv 1
  assign I_in = I_delay ^ IS_I_INVERTED_REG;
`else
  assign CLR_B_in = (CLR_B === 1'bz) || CLR_B; // rv 1
  assign I_in = I ^ IS_I_INVERTED_REG;
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
  assign DIVIDE_BIN = DIVIDE_REG[3:0];
  
`else
  always @ (trig_attr) begin
  #1;
  DIVIDE_BIN = DIVIDE_REG[3:0];
  
  end
`endif

`ifndef XIL_XECLIB
always @ (trig_attr) begin
  #1;
  if ((attr_test == 1'b1) ||
      ((DIVIDE_REG != 1) &&
       (DIVIDE_REG != 2) &&
       (DIVIDE_REG != 4) &&
       (DIVIDE_REG != 8))) begin
    $display("Error: [Unisim %s-101] DIVIDE attribute is set to %d.  Legal values for this attribute are 1, 2, 4 or 8. Instance: %m", MODULE_NAME, DIVIDE_REG);
    attr_err = 1'b1;
  end
  
  if (attr_err == 1'b1) #1 $finish;
end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

reg O_out = 1'b0;
reg [2:0] count = 3'b001;

assign O = ~glblGSR && CLR_B_in && (((DIVIDE_BIN == 4'b0001) && I_in) || O_out);

always @ (posedge I_in or negedge CLR_B_in) begin
  if (~CLR_B_in || glblGSR || (DIVIDE_BIN == 4'b0001)) begin
    count <= 3'b001;
  end else if (DIVIDE_BIN[3:1] == count) begin
    count <= 3'b001;
  end else begin
    count <= count + 3'b001;
  end
end

always @ (posedge I_in or negedge CLR_B_in) begin
  if (~CLR_B_in || glblGSR || (DIVIDE_BIN == 4'b0001)) begin
    O_out = 1'b0;
  end else if (count == 3'b001) begin
    O_out = ~O_out;
  end else begin
    O_out = O_out;
  end
end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  
  wire i_en_n;
  wire i_en_p;
  
  assign i_en_n =  IS_I_INVERTED_REG;
  assign i_en_p = ~IS_I_INVERTED_REG;

`endif

  specify
    (I => O) = (0:0:0, 0:0:0);
    (negedge CLR_B => (O +: 0)) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $period (negedge I, 0:0:0, notifier);
    $period (posedge I, 0:0:0, notifier);
    $recrem (negedge CLR_B, negedge I, 0:0:0, 0:0:0, notifier, i_en_n, i_en_n, CLR_B_delay, I_delay);
    $recrem (negedge CLR_B, posedge I, 0:0:0, 0:0:0, notifier, i_en_p, i_en_p, CLR_B_delay, I_delay);
    $recrem (posedge CLR_B, negedge I, 0:0:0, 0:0:0, notifier, i_en_n, i_en_n, CLR_B_delay, I_delay);
    $recrem (posedge CLR_B, posedge I, 0:0:0, 0:0:0, notifier, i_en_p, i_en_p, CLR_B_delay, I_delay);
    $width (negedge CLR_B, 0:0:0, 0, notifier);
    $width (negedge I, 0:0:0, 0, notifier);
    $width (posedge CLR_B, 0:0:0, 0, notifier);
    $width (posedge I, 0:0:0, 0, notifier);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
