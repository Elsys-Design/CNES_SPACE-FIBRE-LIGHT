///////////////////////////////////////////////////////////////////////////////
//  Copyright (c) 1995/2018 Xilinx, Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /     Vendor      : Xilinx
// \   \   \/      Version     : 2018.1
//  \   \          Description : Xilinx Unified Simulation Library Component
//  /   /                        DSP_FP_ADDER
// /___/   /\      Filename    : DSP_FP_ADDER.v
// \   \  /  \
//  \___\/\___\
//
///////////////////////////////////////////////////////////////////////////////
//  Revision:
//  05/30/17 - Initial
//  End Revision:
///////////////////////////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps

`celldefine

module DSP_FP_ADDER
`ifdef XIL_TIMING
#(
  parameter LOC = "UNPLACED"
)
`endif
(
  output [31:0] FPA_INT,
  output FPA_INVALID_INT,
  output FPA_OVERFLOW_INT,
  output FPA_UNDERFLOW_INT,

  input [31:0] C3_FP_DATA,
  input [31:0] D_FP_DATA,
  input [31:0] FPA_FDBK,
  input [31:0] FPM_DATA,
  input [6:0] FPOPMODE_DATA,
  input [31:0] PCIN
);
  
// define constants
  localparam MODULE_NAME = "DSP_FP_ADDER";

`ifdef XIL_XECLIB
  reg glblGSR = 1'b0;
`else
  tri0 glblGSR = glbl.GSR;
`endif

`ifndef XIL_TIMING
  initial begin
    $display("Error: [Unisim %s-100] SIMPRIM primitive is not intended for direct instantiation in RTL or functional netlists. This primitive is only available in the SIMPRIM library for implemented netlists, please ensure you are pointing to the correct library. Instance %m", MODULE_NAME);
    #1 $finish;
  end
`endif

// begin behavioral model

  reg [31:0] P0;
  reg [31:0] P1;
  reg P_sign;
  reg [7:0] P_exp;
  reg [23:0] P_man;
  real P0_real;
  reg P0_sign;
  reg [7:0] P0_exp;
  reg [22:0] P0_man;
  real P1_real;
  reg P1_sign;
  reg [7:0] P1_exp;
  reg [22:0] P1_man;
  reg [31:0] P_out;
  real P_out_real;
  reg [63:0] P_out64;
  reg FPA_INVALID_INT_out;
  reg FPA_OVERFLOW_INT_out;
  reg FPA_UNDERFLOW_INT_out;

  assign FPA_INT = P_out;
  assign FPA_INVALID_INT = FPA_INVALID_INT_out;
  assign FPA_OVERFLOW_INT = FPA_OVERFLOW_INT_out;
  assign FPA_UNDERFLOW_INT = FPA_UNDERFLOW_INT_out;

  always @ (*) begin
    case (FPOPMODE_DATA[1:0]) 
      2'b00 : P0 = 32'b0;
      2'b01 : P0 = FPM_DATA;
      2'b10 : P0 = PCIN;
      2'b11 : P0 = D_FP_DATA;
    endcase
  end
  
  always @ (*) begin
    casex (FPOPMODE_DATA[4:2]) 
      3'b0xx : P1 = 32'b0;
      3'b10x : P1 = FPA_FDBK;
      3'b110 : P1 = C3_FP_DATA;
      3'b111 : P1 = PCIN;
    endcase
  end

  always @ (*) begin
    if ( ~|P0[31:0] ) begin
      P0_real = 0.0;
    end else if ( ~|P0[30:0] ) begin
      P0_real = -0.0;
    end else begin
      P0_real = $bitstoreal({P0[31],P0[30],{3{~P0[30]}}, P0[29:23], P0[22:0], 29'b0});
    end
  end

  always @ (*) begin
    if ( ~|P1[31:0] ) begin
      P1_real = 0.0;
    end else if ( ~|P1[30:0] ) begin
      P1_real = -0.0;
    end else begin
      P1_real = $bitstoreal({P1[31],P1[30],{3{~P1[30]}}, P1[29:23], P1[22:0], 29'b0});
    end
  end

  wire p0_inf, p0_qnan, p0_snan, p0_zd;
  wire p1_inf, p1_qnan, p1_snan, p1_zd;

  assign p0_zd = ~|P0[30:23];

  assign p0_inf = &P0[30:23] && ~|P0[22:0];

  assign p0_qnan = &P0[30:23] &&  P0[22] && |P0[22:0];

  assign p0_snan = &P0[30:23] && ~P0[22] && |P0[21:0];

  assign p1_zd = ~|P1[30:23];

  assign p1_inf = &P1[30:23] && ~|P1[22:0];

  assign p1_qnan = &P1[30:23] &&  P1[22] && |P1[22:0];

  assign p1_snan = &P1[30:23] && ~P1[22] && |P1[21:0];

  always @ (*) begin
    FPA_INVALID_INT_out = 1'b0;
    FPA_OVERFLOW_INT_out = 1'b0;
    FPA_UNDERFLOW_INT_out = 1'b0;
    if (p0_zd && p1_zd) begin // both zero or denormal
      P_out = {((P0[31] ^ FPOPMODE_DATA[5]) && (P1[31]^ FPOPMODE_DATA[6])), 31'b0}; // zero
    end else if (p0_snan | p0_qnan | p1_snan | p1_qnan) begin // either NaN
      if (p0_snan | p1_snan) begin // one sNaN
        FPA_INVALID_INT_out = 1'b1;
      end
      P_out = {1'b0, 8'hff, 1'b1, 22'b0}; // qNaN sign don't care = 0
    end else if (p0_inf || p1_inf) begin // either infinity
      if (p0_inf && p1_inf) begin // both infinity
        if (P0[31] ^ FPOPMODE_DATA[5] != P1[31] ^ FPOPMODE_DATA[6]) begin // opposite signs
          FPA_INVALID_INT_out = 1'b1;
          P_out = {1'b0, 8'hff, 1'b1, 22'b0}; // q-nan
        end else begin
          P_out =  {P0[31] ^ FPOPMODE_DATA[5], P0[30:0]}; // inf
        end
      end else if (p0_inf) begin
        P_out =  {P0[31] ^ FPOPMODE_DATA[5], P0[30:0]}; // inf
      end else begin // p1_inf
        P_out =  {P1[31] ^ FPOPMODE_DATA[6], P1[30:0]}; // inf
      end
    end else if (p0_zd) begin // P0 denormal
      case (FPOPMODE_DATA[6])
        1'b0 : P_out =  P1;
        1'b1 : P_out =  {~P1[31], P1[30:0]};
      endcase
    end else if (p1_zd) begin // P1 denormal
      case (FPOPMODE_DATA[5])
        1'b0 : P_out =  P0;
        1'b1 : P_out =  {~P0[31], P0[30:0]};
      endcase
    end else begin
      case (FPOPMODE_DATA[6:5])
        2'b00 : P_out_real =  P0_real + P1_real;
        2'b01 : P_out_real = -P0_real + P1_real;
        2'b10 : P_out_real =  P0_real - P1_real;
        2'b11 : P_out_real = -P0_real - P1_real;
      endcase
      P_out64 = $realtobits(P_out_real);
      P_out = {P_out64[63], P_out64[62], P_out64[58:52], P_out64[51:29]};
      P_out = (P_out64[28] & (P_out64[29] | P_out64[27] | |P_out64[26:0])) ? P_out + 32'd1 : P_out;
      if (&P_out[30:23]) begin // result inf or nan
        P_out[22:0] = 23'd0;
        FPA_OVERFLOW_INT_out = 1'b1;
      end else if ((P_out_real == 0.0) && (P0[31] ^ FPOPMODE_DATA[5] != P1[31] ^ FPOPMODE_DATA[6])) begin // result zero/denormal with opposite signs
//      end else if ((PO[30:0] === P1[30:0]) && (P0[31] ^ P1[31])) begin // result zero/denormal with opposite signs
        P_out[31] = 1'b0; // +0
      end else if ((~((P_out64[61:59]===3'b000 || P_out64[61:59]===3'b111) && (P_out64[62] !== P_out64[61])) || (~|{P_out64[62], P_out64[58:52]})) && (P_out_real != 0.0)) begin // underflow conditions
        FPA_UNDERFLOW_INT_out = 1'b1;
        P_out[30:0] = 31'd0;
      end
    end
  end

// end behavioral model

`ifndef XIL_XECLIB
`ifdef XIL_TIMING
  specify
    (C3_FP_DATA *> FPA_INT) = (0:0:0, 0:0:0);
    (C3_FP_DATA *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (C3_FP_DATA *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (C3_FP_DATA *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (D_FP_DATA *> FPA_INT) = (0:0:0, 0:0:0);
    (D_FP_DATA *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (D_FP_DATA *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (D_FP_DATA *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (FPA_FDBK *> FPA_INT) = (0:0:0, 0:0:0);
    (FPA_FDBK *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (FPA_FDBK *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (FPA_FDBK *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (FPM_DATA *> FPA_INT) = (0:0:0, 0:0:0);
    (FPM_DATA *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (FPM_DATA *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (FPM_DATA *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (FPOPMODE_DATA *> FPA_INT) = (0:0:0, 0:0:0);
    (FPOPMODE_DATA *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (FPOPMODE_DATA *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (FPOPMODE_DATA *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    (PCIN *> FPA_INT) = (0:0:0, 0:0:0);
    (PCIN *> FPA_INVALID_INT) = (0:0:0, 0:0:0);
    (PCIN *> FPA_OVERFLOW_INT) = (0:0:0, 0:0:0);
    (PCIN *> FPA_UNDERFLOW_INT) = (0:0:0, 0:0:0);
    specparam PATHPULSE$ = 0;
  endspecify
`endif
`endif
endmodule

`endcelldefine
