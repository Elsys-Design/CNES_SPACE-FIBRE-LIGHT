///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_CPLX_STAGE1
// /___/   /\      Filename    : DSP_CPLX_STAGE1.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  10/01/16 - Migrate from DSP48E2
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_CPLX_STAGE1
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [36:0] U_CPLX,
  output [36:0] V_CPLX,

  input [9:0] AD_DATA_CPLX_DSPL,
  input [9:0] AD_DATA_CPLX_DSPR,
  input [17:0] A_CPLX_L
);
  
// define constants
  localparam MODULE_NAME = "DSP_CPLX_STAGE1";

// begin behavioral model

  reg [36:0] mult = {37{1'b0}};
  reg [35:0] ps_u_mask = {18{2'b01}};
  reg [35:0] ps_v_mask = {18{2'b10}};

// initialize regs
`ifndef XIL_XECLIB
initial begin
  mult = {37{1'b0}};
  ps_u_mask = {18{2'b01}};
  ps_v_mask = {18{2'b10}};
end
`endif

// U[36],V[36]  11 when mult[36]=0,  10 when mult[36]=1
// AD_DATA_CPLX_IM[9] dummy
  wire signed [17:0] a_mult;
  wire signed [18:0] b_mult;

  assign a_mult = A_CPLX_L;
  assign b_mult = {AD_DATA_CPLX_DSPL[8:0], AD_DATA_CPLX_DSPR};

  always @(*) begin
     mult = a_mult * b_mult;
  end

  assign U_CPLX = {1'b1,      mult[35:0] & ps_u_mask};
  assign V_CPLX = {~mult[36], mult[35:0] & ps_v_mask};

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (AD_DATA_CPLX_DSPL *> U_CPLX) = (0:0:0, 0:0:0);
    (AD_DATA_CPLX_DSPR *> U_CPLX) = (0:0:0, 0:0:0);
    (AD_DATA_CPLX_DSPR *> V_CPLX) = (0:0:0, 0:0:0);
    (A_CPLX_L *> U_CPLX) = (0:0:0, 0:0:0);
    (A_CPLX_L *> V_CPLX) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
