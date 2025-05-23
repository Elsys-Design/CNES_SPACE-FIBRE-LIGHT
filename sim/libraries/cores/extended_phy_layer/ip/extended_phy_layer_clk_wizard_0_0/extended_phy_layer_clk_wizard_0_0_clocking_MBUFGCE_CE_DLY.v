`timescale 1ps/1ps
module extended_phy_layer_clk_wizard_0_0_clocking_MBUFGCE_CE_DLY #(
    parameter CE_DLY_REG = "TRUE",
    parameter HARD_SYNC = "TRUE",
    parameter RAM_INIT = 32'hfffffff0
  )
(clk, clr, ce, ce_dly, clrb_leaf);
  input      clk;
  input      clr;
  input      ce;
  output     ce_dly;
  output     clrb_leaf;


   wire data_o;
   wire cnt_clr;
   wire cnt_en;
   wire ce_o;
   wire ce_dly_wire;
   reg ce_dly_reg = 1'b1;
   wire ce_dly;
   wire clrb_leaf;
   wire clrb_leaf_wire;
   reg clr_rise_det = 1'b0;
   reg clrb_leaf_hsync0;
   reg clrb_leaf_hsync1;
   reg clrb_leaf_hsync2;
   reg clrb_leaf_hsync3;
   wire clr_lh;
   reg clrb_leaf_del = 1'b1;
   reg clrb_leaf_pulse = 1'b1;
   wire syncd_clr;
   reg clr_dly = 1'b0;
   
   assign cnt_clr = !cnt_en;

   reg [4:0] addr_cnt = 5'b0;

   always @(posedge clk)
   begin
      if (cnt_clr)
         addr_cnt <= 5'b0;
      else if (cnt_en)
         addr_cnt <= addr_cnt + 1'b1;
   end
  
   localparam idle = 1'b0;
   localparam count = 1'b1;

   reg state = idle;

   always @(posedge clk or posedge clr)
   begin
      if (clr == 1'b1)
         clr_rise_det <= 1'b1;
      else 
      	 clr_rise_det <= clr;
   end
    xpm_cdc_sync_rst #(
     .DEST_SYNC_FF(3), // DECIMAL; range: 2-10
     .INIT(0), // DECIMAL; 0=initialize synchronization registers to 0, 1=initialize synchronization registers to 1
     .INIT_SYNC_FF(0), // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
     .SIM_ASSERT_CHK(0) // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
    )
    xpm_cdc_sync_rst_inst (
     .dest_rst(syncd_clr), // 1-bit output: src_rst synchronized to the destination clock domain. This output is registered.
     .dest_clk(clk), // 1-bit input: Destination clock.
     .src_rst(clr_rise_det) // 1-bit input: Source reset signal.
    );
   always @(posedge clk)
   begin
	clr_dly <= syncd_clr;
   end
   assign clr_lh = ~clr_dly & syncd_clr;
    
       

   always @(posedge clk)
   case (state)
   idle : begin
       if (clr_lh == 1)
          state <= count;
       else
          state <= idle;
   end
   count : begin
       if (data_o == 1)
          state <= idle;
       else
          state <= count;
   end
   default : begin  // Fault Recovery
       state <= idle;
   end
   endcase
    
   assign cnt_en = state == count;
   assign ce_o = state == idle;
   always @(posedge clk)
   begin
      clrb_leaf_pulse <= ~clr_lh;
   end
   
   generate
     if (CE_DLY_REG == "TRUE") 
       begin
       LUT2 #(.INIT(4'h8)) LUT2_inst (.I0(ce), .I1(ce_o), .O(ce_dly_wire));
        always @ (posedge clk)
        begin
        ce_dly_reg <= ce_dly_wire;
        clrb_leaf_del <= clrb_leaf_pulse;
        end
           assign clrb_leaf_wire = clrb_leaf_del;
           assign ce_dly = ce_dly_reg;
       if (HARD_SYNC == "TRUE")
         begin
         always @ (posedge clk)
         begin
         clrb_leaf_hsync0 <= clrb_leaf_wire;
         clrb_leaf_hsync1 <= clrb_leaf_hsync0;
         clrb_leaf_hsync2 <= clrb_leaf_hsync1;
         clrb_leaf_hsync3 <= clrb_leaf_hsync2;
         end
        assign clrb_leaf = clrb_leaf_hsync3;
         end
       else
         begin
                assign clrb_leaf = clrb_leaf_wire;
         end
       end
     else
       begin 
       LUT2 #(.INIT(4'h8)) LUT2_inst (.I0(ce), .I1(ce_o), .O(ce_dly));
           assign clrb_leaf_wire = clrb_leaf_pulse;
       
       if (HARD_SYNC == "TRUE")
         begin
         always @ (posedge clk)
         begin
         clrb_leaf_hsync0 <= clrb_leaf_wire;
         clrb_leaf_hsync1 <= clrb_leaf_hsync0;
         clrb_leaf_hsync2 <= clrb_leaf_hsync1;
         clrb_leaf_hsync3 <= clrb_leaf_hsync2;
         end
         assign clrb_leaf = clrb_leaf_hsync3;
         end
       else
         begin
                assign clrb_leaf = clrb_leaf_wire;
         end
       end
   endgenerate

RAM32X1S #(
 .INIT(RAM_INIT), // Initial contents of RAM
 .IS_WCLK_INVERTED(1'b0) // Specifies active high/low WCLK
) MBUFG_CE_DLY_RAM (
 .O(data_o), // RAM output
 .A0(addr_cnt[0]), // RAM address[0] input
 .A1(addr_cnt[1]), // RAM address[1] input
 .A2(addr_cnt[2]), // RAM address[2] input
 .A3(addr_cnt[3]), // RAM address[3] input
 .A4(addr_cnt[4]), // RAM address[4] input
 .D(1'b0), // RAM data input
 .WCLK(1'b0), // Write clock input
 .WE(1'b0) // Write enable input
);
						
endmodule
