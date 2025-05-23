`timescale 1 ps / 1 ps
module URAM288 (addra, addrb, dina, dinb, douta, doutb, clka, clkb, ena, enb, wea, web,
                dbiterra, dbiterrb, injectdbiterra, injectdbiterrb, injectsbiterra, injectsbiterrb,
                regcea, regceb, rsta, rstb, sbiterra, sbiterrb, sleep);
   parameter AWIDTH = 24;
   parameter DWIDTH = 72;
   parameter SIZE   = 1 << AWIDTH;
   parameter integer LATENCY_A = 0;
   parameter integer LATENCY_B = 0;
   parameter integer WE_A = 1;
   parameter integer WE_B = 1;
   parameter integer NO_CHANGE_A = 1;
   parameter integer NO_CHANGE_B = 1;
   parameter integer USE_CLK_A = 1;
   parameter integer WE_DANGLING_A = 0;
   parameter integer WE_DANGLING_B = 0;
   parameter integer INFER_PORT_A = 1;
   parameter integer INFER_PORT_B = 1;

   input clka;
   input clkb;
   input ena;
   input enb;
   input [AWIDTH-1:0] addra;
   input [AWIDTH-1:0] addrb;
   input [DWIDTH-1:0] dina;
   input [DWIDTH-1:0] dinb;
   input [8:0] wea;
   input [8:0] web;
   output [DWIDTH-1:0] douta;
   output [DWIDTH-1:0] doutb;
   reg [DWIDTH-1:0] mem [SIZE-1:0];

   output dbiterra, dbiterrb, injectdbiterra, injectdbiterrb, injectsbiterra, injectsbiterrb,
          regcea, regceb, rsta, rstb, sbiterra, sbiterrb, sleep;

   // Really needed? Forgot the reason to create double TRI's.
   wire cg_one = 1'b1;
   wire [AWIDTH-1:0] addra_bus;
   assign addra_bus = cg_one ? addra : {AWIDTH{1'bz}};

   wire [AWIDTH-1:0] addrb_bus;
   assign addrb_bus = cg_one ? addrb : {AWIDTH{1'bz}};

   URAM288_INT #(.AWIDTH(AWIDTH), .DWIDTH(DWIDTH), .SIZE(SIZE), .LATENCY_A(LATENCY_A), .LATENCY_B(LATENCY_B), .WE_A(WE_A), .WE_B(WE_B), .NO_CHANGE_A(NO_CHANGE_A), .NO_CHANGE_B(NO_CHANGE_B), .USE_CLK_A(USE_CLK_A), .WE_DANGLING_A(WE_DANGLING_A), .WE_DANGLING_B(WE_DANGLING_B), .INFER_PORT_A(INFER_PORT_A), .INFER_PORT_B(INFER_PORT_B))
     URAM288_i (
       .addra(addra_bus), .addrb(addrb_bus), .dina(dina), .dinb(dinb), .douta(douta), .doutb(doutb),
       .clka(clka), .clkb(clkb), .ena(ena), .enb(enb), .wea(wea), .web(web),
       .dbiterra(dbiterra), .dbiterrb(dbiterrb), .injectdbiterra(injectdbiterra), .injectdbiterrb(injectdbiterrb),
       .injectsbiterra(injectsbiterra), .injectsbiterrb(injectsbiterrb), .regcea(regcea), .regceb(regceb),
       .rsta(rsta), .rstb(rstb), .sbiterra(sbiterra), .sbiterrb(sbiterrb), .sleep(sleep));

endmodule

`timescale 1 ps / 1 ps
module URAM288_INT(addra, addrb, dina, dinb, douta, doutb, clka, clkb, ena, enb, wea, web, dbiterra, dbiterrb, injectdbiterra, injectdbiterrb, injectsbiterra, injectsbiterrb, regcea, regceb, rsta, rstb, sbiterra, sbiterrb, sleep);
   parameter AWIDTH = 24;
   parameter DWIDTH = 72;
   parameter SIZE   = 1 << AWIDTH;
   parameter integer LATENCY_A = 0;
   parameter integer LATENCY_B = 0;
   parameter integer WE_A = 1;
   parameter integer WE_B = 1;
   parameter integer NO_CHANGE_A = 1;
   parameter integer NO_CHANGE_B = 1;
   parameter integer USE_CLK_A = 1;  
   parameter integer WE_DANGLING_A = 0;
   parameter integer WE_DANGLING_B = 0;
   parameter integer INFER_PORT_A = 1;
   parameter integer INFER_PORT_B = 1;
   
   input clka;
   input clkb;
   input ena;
   input enb;
   input [AWIDTH-1:0] addra;
   input [AWIDTH-1:0] addrb;
   input [DWIDTH-1:0] dina;
   input [DWIDTH-1:0] dinb;
   input [8:0] wea;
   input [8:0] web;
   output reg [DWIDTH-1:0] douta;
   output reg [DWIDTH-1:0] doutb;
   reg [DWIDTH-1:0] mem [SIZE-1:0];
   reg [DWIDTH-1:0] flops_a_pwropt_internal; 
   reg [DWIDTH-1:0] flops_b_pwropt_internal; 
   reg [DWIDTH-1:0] flops_a_pwropt_latency [LATENCY_A-1:0]; 
   reg [DWIDTH-1:0] flops_b_pwropt_latency [LATENCY_B-1:0];

   output dbiterra, dbiterrb, injectdbiterra, injectdbiterrb, injectsbiterra, injectsbiterrb,
          regcea, regceb, rsta, rstb, sbiterra, sbiterrb, sleep;

   //* 2017-02-15: to handle the case when opt_design makes wea/web dangling
   wire [8:0] wea_int;
   wire [8:0] web_int;
   assign     wea_int = (WE_DANGLING_A==1) ? 8'b0 : wea;
   assign     web_int = (WE_DANGLING_B==1) ? 8'b0 : web;

   //* 2017-02-15: controlability over whether EN of the port shall be inferred
   //* -- Always write into the port --> the port would get inferred EN as T
   wire [8:0] wea_final;
   wire [8:0] web_final;
   assign     wea_final = (INFER_PORT_A) ? wea_int : 8'b1;
   assign     web_final = (INFER_PORT_B) ? web_int : 8'b1; 
   
   //* 2017-01-26 
   //* To generate pulse when WE turns on: P(WE)|WE. This is important for NO_CHANGE
   //* mode for latching the last read cycle data to be propagated
   wire   we_ena = |wea_int[WE_A-1:0];
   wire   we_enb = |web_int[WE_B-1:0];
   wire   rd_ena;
   wire   rd_enb;
   assign rd_ena = (NO_CHANGE_A==1) ? ena&&(~we_ena) : ena;
   assign rd_enb = (NO_CHANGE_B==1) ? enb&&(~we_enb) : enb;

   //* 2017-02-14
   //* Internally URAM has only one CLK port
   wire   clk = (USE_CLK_A==1) ? clka : clkb;
   
   // Reading on port A
   always @(posedge clk) begin
     if (rd_ena) begin
       flops_a_pwropt_internal <= mem[addra];
     end
   end

   generate 
     if (LATENCY_A == 0) begin
	always @(flops_a_pwropt_internal)
         douta = flops_a_pwropt_internal;
     end
     else if (LATENCY_A == 1) begin
       always @(posedge clk) 
         flops_a_pwropt_latency[0] <= flops_a_pwropt_internal;
       always @(flops_a_pwropt_latency[0])
         douta = flops_a_pwropt_latency[0];
     end
     else begin
       always @(posedge clk) begin : SR
         integer i;
         flops_a_pwropt_latency[0] <= flops_a_pwropt_internal;
         for (i = 1; i <= LATENCY_A - 1; i = i + 1) 
           flops_a_pwropt_latency[i] <= flops_a_pwropt_latency[i-1];
       end
       always @(flops_a_pwropt_latency[LATENCY_A - 1])
         douta = flops_a_pwropt_latency[LATENCY_A - 1];
     end
  endgenerate

  // Writing on port A
  integer 	 i_a;
  always @(posedge clk) begin
    if (ena) begin
      for(i_a = 0; i_a < WE_A; i_a = i_a + 1) begin
        if (wea_final[i_a] == 1'b1) begin
          mem[addra][((i_a*8)+7) -: 8] = dina[((i_a*8)+7) -: 8];
        end
      end
    end
  end

  // Reading on port B
  always @(posedge clk) begin
    if (rd_enb) begin
      flops_b_pwropt_internal <= mem[addrb];
    end
  end

  generate 
    if (LATENCY_B == 0) begin
      always @(flops_b_pwropt_internal)
        doutb = flops_b_pwropt_internal;
    end
    else if (LATENCY_B == 1) begin
      always @(posedge clk) 
        flops_b_pwropt_latency[0] <= flops_b_pwropt_internal;
      always @(flops_b_pwropt_latency[0])
        doutb = flops_b_pwropt_latency[0];
    end
    else begin
      always @(posedge clk) begin : SR
        integer i;
        flops_b_pwropt_latency[0] <= flops_b_pwropt_internal;
        for (i = 1; i <= LATENCY_B - 1; i = i + 1) 
          flops_b_pwropt_latency[i] <= flops_b_pwropt_latency[i-1];
      end
      always @(flops_b_pwropt_latency[LATENCY_B - 1])
        doutb = flops_b_pwropt_latency[LATENCY_B - 1];
    end
  endgenerate

  // Writing on port B
  integer 	i_b;
  always @(posedge clk) begin
    if (enb) begin
      for(i_b = 0; i_b < WE_B; i_b = i_b + 1) begin
        if (web_final[i_b] == 1'b1) begin
          mem[addrb][((i_b*8)+7) -: 8] = dinb[((i_b*8)+7) -: 8];
        end
      end
    end
  end
endmodule
