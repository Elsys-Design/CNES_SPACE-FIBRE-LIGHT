///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.3
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_M_DATA
// /___/   /\      Filename    : DSP_M_DATA.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  07/15/12 - Migrate from E1.
//  12/10/12 - Add dynamic registers
//  04/22/13 - 713695 - Zero mult result on USE_SIMD
//  04/23/13 - 714772 - remove sensitivity to negedge GSR
//  10/22/14 - 808642 - Added #1 to $finish
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_M_DATA #(
`ifdef XIL_TIMING
  parameter LOC = "UNPLACED",
`endif
  parameter [0:0] IS_CLK_INVERTED = 1'b0,
  parameter [0:0] IS_RSTM_INVERTED = 1'b0,
  parameter integer MREG = 1
)(
  output [44:0] U_DATA,
  output [44:0] V_DATA,

  input CEM,
  input CLK,
  input RSTM,
  input [44:0] U,
  input [44:0] V
);
  
// define constants
  localparam MODULE_NAME = "DSP_M_DATA";

  reg trig_attr;
// include dynamic registers - XILINX test only
`ifdef XIL_DR
  `include "DSP_M_DATA_dr.v"
`else
  reg [0:0] IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
  reg [0:0] IS_RSTM_INVERTED_REG = IS_RSTM_INVERTED;
  reg [31:0] MREG_REG = MREG;
`endif

`ifdef XIL_XECLIB
  wire MREG_BIN;
`else
  reg MREG_BIN;
`endif

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

  wire CEM_in;
  wire CLK_in;
  wire RSTM_in;
  wire [44:0] U_in;
  wire [44:0] V_in;

`ifdef XIL_TIMING
  wire CEM_delay;
  wire CLK_delay;
  wire RSTM_delay;
  wire [44:0] U_delay;
  wire [44:0] V_delay;
`endif
/*  
`ifdef XIL_TIMING
// bus inputs with only partial timing checks 
  assign U_delay[44] = U[44];
  assign V_delay[1] = V[1];
  assign V_delay[2] = V[2];
  assign V_delay[3] = V[3];
  assign V_delay[44] = V[44];
`endif
*/
`ifdef XIL_TIMING
  assign CEM_in = (CEM !== 1'bz) && CEM_delay; // rv 0
  assign CLK_in = (CLK !== 1'bz) && (CLK_delay ^ IS_CLK_INVERTED_REG); // rv 0
  assign RSTM_in = (RSTM !== 1'bz) && (RSTM_delay ^ IS_RSTM_INVERTED_REG); // rv 0
  assign U_in = U_delay;
  assign V_in = V_delay;
`else
  assign CEM_in = (CEM !== 1'bz) && CEM; // rv 0
  assign CLK_in = (CLK !== 1'bz) && (CLK ^ IS_CLK_INVERTED_REG); // rv 0
  assign RSTM_in = (RSTM !== 1'bz) && (RSTM ^ IS_RSTM_INVERTED_REG); // rv 0
  assign U_in = U;
  assign V_in = V;
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
  assign MREG_BIN = MREG_REG[0];

`else
always @(trig_attr) begin
#1;
  MREG_BIN = MREG_REG[0];

end
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

`ifndef XIL_XECLIB
  always @(trig_attr) begin
  #1;
    if ((attr_test == 1'b1) ||
        ((MREG_REG != 1) &&
         (MREG_REG != 0))) begin
      $display("Error: [Unisim %s-103] MREG attribute is set to %d.  Legal values for this attribute are 1 or 0. Instance: %m", MODULE_NAME, MREG_REG);
      attr_err = 1'b1;
    end

    if (attr_err == 1'b1) #1 $finish;
  end
`endif

`ifdef XIL_TIMING
  reg notifier;
`endif

// begin behavioral model

  localparam M_WIDTH   = 45;
  reg [M_WIDTH-1:0] U_DATA_reg;
  reg [M_WIDTH-1:0] V_DATA_reg;

// initialize regs
`ifndef XIL_XECLIB
initial begin
  U_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
  V_DATA_reg = {1'b0, {M_WIDTH-1{1'b0}}};
end
`endif

//*********************************************************
//*** Multiplier outputs U, V  with 1 level deep of register
//*********************************************************

   always @(posedge CLK_in) begin
      if  (RSTM_in || (MREG_BIN == 1'b0) || glblGSR) begin
         U_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
         V_DATA_reg <= {1'b0, {M_WIDTH-1{1'b0}}};
      end else if (CEM_in)  begin
         U_DATA_reg <= U_in;
         V_DATA_reg <= V_in;
      end
   end

   assign U_DATA = (MREG_BIN == 1'b1) ? U_DATA_reg    : U_in;
   assign V_DATA = (MREG_BIN == 1'b1) ? V_DATA_reg    : V_in;

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  wire clk_en_n;
  wire clk_en_p;

  assign clk_en_n = IS_CLK_INVERTED_REG;
  assign clk_en_p = ~IS_CLK_INVERTED_REG;

`endif
  specify
    (CLK *> U_DATA) = (100:100:100, 100:100:100);
    (CLK *> V_DATA) = (100:100:100, 100:100:100);
    (U *> U_DATA) = (0:0:0, 0:0:0);
    (V *> V_DATA) = (0:0:0, 0:0:0);
`ifdef XIL_TIMING
    $setuphold (negedge CLK, negedge CEM, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CEM_delay);
    $setuphold (negedge CLK, negedge RSTM, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, RSTM_delay);
    $setuphold (negedge CLK, negedge U, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, U_delay);
    $setuphold (negedge CLK, negedge V, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, V_delay);
    $setuphold (negedge CLK, posedge CEM, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, CEM_delay);
    $setuphold (negedge CLK, posedge RSTM, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, RSTM_delay);
    $setuphold (negedge CLK, posedge U, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, U_delay);
    $setuphold (negedge CLK, posedge V, 0:0:0, 0:0:0, notifier, clk_en_n, clk_en_n, CLK_delay, V_delay);
    $setuphold (posedge CLK, negedge CEM, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CEM_delay);
    $setuphold (posedge CLK, negedge RSTM, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, RSTM_delay);
    $setuphold (posedge CLK, negedge U, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, U_delay);
    $setuphold (posedge CLK, negedge V, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, V_delay);
    $setuphold (posedge CLK, posedge CEM, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, CEM_delay);
    $setuphold (posedge CLK, posedge RSTM, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, RSTM_delay);
    $setuphold (posedge CLK, posedge U, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, U_delay);
    $setuphold (posedge CLK, posedge V, 0:0:0, 0:0:0, notifier, clk_en_p, clk_en_p, CLK_delay, V_delay);
`endif
    specparam PATHPULSE$ = 0;
  endspecify
`endif
endmodule

`endcelldefine
