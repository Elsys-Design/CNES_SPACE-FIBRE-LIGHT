///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_CPLX_STAGE0
// /___/   /\      Filename    : DSP_CPLX_STAGE0.v
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

module DSP_CPLX_STAGE0
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [9:0] AD_CPLX_DSPL,
  output [9:0] AD_CPLX_DSPR,
  output CONJ_DSP_L_MULT_OUT,
  output CONJ_DSP_L_PREADD_OUT,
  output CONJ_DSP_R_MULT_OUT,
  output CONJ_DSP_R_PREADD_OUT,

  input [17:0] B2B1_CPLX_L,
  input [17:0] B2B1_CPLX_R,
  input CONJ_DSP_L_IN,
  input CONJ_DSP_R_IN
);
  
// define constants
  localparam MODULE_NAME = "DSP_CPLX_STAGE0";

// begin behavioral model

wire [18:0] STAGE0_PREADD;

assign CONJ_DSP_L_MULT_OUT   =  CONJ_DSP_L_IN;
assign CONJ_DSP_R_MULT_OUT   = ~CONJ_DSP_R_IN;
assign CONJ_DSP_L_PREADD_OUT = ~CONJ_DSP_L_IN;
assign CONJ_DSP_R_PREADD_OUT =  CONJ_DSP_L_IN;

assign STAGE0_PREADD = CONJ_DSP_R_IN ?
                       {B2B1_CPLX_L[17], B2B1_CPLX_L} - {B2B1_CPLX_R[17], B2B1_CPLX_R} :
                       {B2B1_CPLX_L[17], B2B1_CPLX_L} + {B2B1_CPLX_R[17], B2B1_CPLX_R};

assign AD_CPLX_DSPL = {1'b0, STAGE0_PREADD[18:10]};
assign AD_CPLX_DSPR = STAGE0_PREADD[9:0];

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (B2B1_CPLX_L *> AD_CPLX_DSPL) = (0:0:0, 0:0:0);
    (B2B1_CPLX_L *> AD_CPLX_DSPR) = (0:0:0, 0:0:0);
    (B2B1_CPLX_R *> AD_CPLX_DSPL) = (0:0:0, 0:0:0);
    (B2B1_CPLX_R *> AD_CPLX_DSPR) = (0:0:0, 0:0:0);
    (CONJ_DSP_L_IN => CONJ_DSP_L_MULT_OUT) = (0:0:0, 0:0:0);
    (CONJ_DSP_L_IN => CONJ_DSP_L_PREADD_OUT) = (0:0:0, 0:0:0);
    (CONJ_DSP_L_IN => CONJ_DSP_R_PREADD_OUT) = (0:0:0, 0:0:0);
    (CONJ_DSP_R_IN *> AD_CPLX_DSPL) = (0:0:0, 0:0:0);
    (CONJ_DSP_R_IN *> AD_CPLX_DSPR) = (0:0:0, 0:0:0);
    (CONJ_DSP_R_IN => CONJ_DSP_R_MULT_OUT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
