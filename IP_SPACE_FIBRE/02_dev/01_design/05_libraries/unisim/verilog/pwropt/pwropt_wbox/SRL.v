
//-------------------------------------
// SRL support
//`include "../../xeclib/unisims/SRLC16E.v"
//`include "../../xeclib/unisims/SRL16E.v"
// Inherited from ISE model - note that the address bus is bit-blasted which
// seems to be consistent with the Rodin unisims version of this model
// 4/12/11: add parameter CE_1 for CE = 1 based optimization.

module SRLC16E (Q, Q15, A0, A1, A2, A3, CE, CLK, D);

    parameter INIT = 16'h0000;
    parameter MAX_ADDR_VAL = 15;
    parameter CE_1 = 1'b0;

    output Q, Q15;

    input  A0, A1, A2, A3, CE, CLK, D;

    reg  [MAX_ADDR_VAL:0] data;
    wire [3:0]  addr;

    buf b_a3 (addr[3], A3);
    buf b_a2 (addr[2], A2);
    buf b_a1 (addr[1], A1);
    buf b_a0 (addr[0], A0);

    assign Q = data[addr];
    assign Q15 = data[MAX_ADDR_VAL];

    generate
      if (MAX_ADDR_VAL < 1) begin
        always @(posedge CLK) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= D;
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= D;
              end
            end
        end
      end
      else begin
        always @(posedge CLK) begin
            if (CE_1 == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0], D};
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0], D};
              end
            end
        end
      end
    endgenerate

    /* Can try this later once MapLib functionality is in - no need for
       generate block 

    always @(posedge CLK) begin
       if (CE == 1'b1) begin
         {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0], D};
        end 
    end
    */

endmodule

module SRL16E (Q, A0, A1, A2, A3, CE, CLK, D);

    parameter INIT = 16'h0000;
    parameter MAX_ADDR_VAL = 15;
    parameter CE_1 = 1'b0;

    output Q;

    input  A0, A1, A2, A3, CE, CLK, D;

    reg  [MAX_ADDR_VAL:0] data;
    wire [3:0]  addr;

    buf b_a3 (addr[3], A3);
    buf b_a2 (addr[2], A2);
    buf b_a1 (addr[1], A1);
    buf b_a0 (addr[0], A0);

    assign Q = data[addr];

    generate
      if (MAX_ADDR_VAL < 1) begin
        always @(posedge CLK) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= D;
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= D;
              end
            end
        end
      end
      else begin
        always @(posedge CLK) begin
            if (CE_1 == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0], D};
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0], D};
              end
            end
        end
      end
    endgenerate

endmodule

// This used to be our X_SRLC32E which had a bussed address input. The Rodin
// version of the 32-bit SRL also has a bussed address input and hence
// renaming this as SRLC32E

module SRLC32E (Q, Q31, A, CE, CLK, D);

  parameter INIT = 32'h00000000;
  parameter MAX_ADDR_VAL = 31;
  parameter CE_1 = 1'b0;
  output Q;
  output Q31;

  input  [4:0] A;
  input  CE, CLK, D;

  reg  [MAX_ADDR_VAL:0] data;

  wire [4:0]  addr;
  wire d_in, clk_in;

  buf b_clk (clk_in, CLK);
  buf b_d (d_in, D);
  buf b_a0 (addr[0], A[0]);
  buf b_a1 (addr[1], A[1]);
  buf b_a2 (addr[2], A[2]);
  buf b_a3 (addr[3], A[3]);
  buf b_a4 (addr[4], A[4]);

  assign Q = data[addr];
  assign Q31 = data[MAX_ADDR_VAL];

  generate
      if (MAX_ADDR_VAL < 1) begin
        always @(posedge clk_in) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= d_in;
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= d_in;
              end
            end
        end
      end
      else begin
        always @(posedge clk_in) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0],d_in};
            end 
            else begin 
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0],d_in};
              end
            end
        end
      end
  endgenerate

  /* Can try this later once MapLib functionality is in - no need
     for generate block
  always @(posedge clk_in) 
    if (CE == 1'b1) 
      data[MAX_ADDR_VAL:0] <=  {data[(MAX_ADDR_VAL-1):0], d_in};
  */

endmodule

module SRL32E (Q, A, CE, CLK, D);

  parameter INIT = 32'h00000000;
  parameter MAX_ADDR_VAL = 31;
  parameter CE_1 = 1'b0;
  output Q;

  input  [4:0] A;
  input  CE, CLK, D;

  reg  [MAX_ADDR_VAL:0] data;

  wire [4:0]  addr;
  wire d_in, clk_in;

  buf b_clk (clk_in, CLK);
  buf b_d (d_in, D);
  buf b_a0 (addr[0], A[0]);
  buf b_a1 (addr[1], A[1]);
  buf b_a2 (addr[2], A[2]);
  buf b_a3 (addr[3], A[3]);
  buf b_a4 (addr[4], A[4]);

  assign Q = data[addr];

  generate
      if (MAX_ADDR_VAL < 1) begin
        always @(posedge clk_in) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= d_in;
            end
            else begin
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= d_in;
              end
            end
        end
      end
      else begin
        always @(posedge clk_in) begin
            if (CE_1 == 1'b1) begin
              {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0],d_in};
            end 
            else begin 
              if (CE == 1'b1) begin
                {data[MAX_ADDR_VAL:0]} <= {data[(MAX_ADDR_VAL-1):0],d_in};
              end
            end
        end
      end
  endgenerate

  /* Can try this later once MapLib functionality is in - no need
     for generate block
  always @(posedge clk_in) 
    if (CE == 1'b1) 
      data[MAX_ADDR_VAL:0] <=  {data[(MAX_ADDR_VAL-1):0], d_in};
  */

endmodule
/* This was our SRLC32E as used in ISE - note that the address bus is
   bit-blasted.  Commenting it out for now.

module SRLC32E (Q, Q31, A4, A3, A2, A1, A0, CE, CLK, D);
  parameter INIT = 32'h00000000;
  parameter MAX_ADDR_VAL = 31;
  output Q;
  output Q31;
  input  A4, A3, A2, A1, A0;
  input  CE, CLK, D;
  wire  [4:0] ADDR;

  buf b_a0 (ADDR[0], A0);
  buf b_a1 (ADDR[1], A1);
  buf b_a2 (ADDR[2], A2);
  buf b_a3 (ADDR[3], A3);
  buf b_a4 (ADDR[4], A4);

  X_SRLC32E SRLC32E_O ( .Q(Q), .Q31(Q31), .A(ADDR), .CE(CE), .CLK(CLK), .D(D));
  defparam SRLC32E_O.INIT = INIT;
  defparam SRLC32E_O.MAX_ADDR_VAL = MAX_ADDR_VAL;
endmodule
*/
//-------------------------------------

