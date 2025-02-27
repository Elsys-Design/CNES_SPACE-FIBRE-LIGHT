`timescale 1ps/1ps
`define DEF_APB_LAG1           // den_int lag 1-clk cycle after daddr, di, dwe
//`define DEF_APB_LAG2           // den_int lag 1-clk cycle after daddr, di, dwe

`define DEFINE_EXTEND_RST       // rst_O assert extended til DPLL is in open-loop

// Eiether one of the two below
`define DEFINE_MIX_RESTORE
//`define DEFINE_NO_RESTORE      // back to mission mode but without restrore original value

`define DEFINE_SYNC_RST        // use syncrhonous reset
`define DEF_DCO_CODE_INIT      // DCO_CODE_INIT before calibration (would restort original values after SC)
`define DEF_DCO_CODE_FINAL     // DCO_CODE_FINAL after calibration is done
//`define DEBUG_RECORD_DCO_CNT // regB0/B4 used for dco_cnt_last/dco_cnt_3 for frquency measurements
//`define DEF_LOCKED           // locked_i port to stop SC when asserted
//`define JUMP_OFFSET 2 


module extended_phy_layer_clk_wizard_0_0_clocking_cmt_dpll_fd_cal #( parameter T_CAL         = 512    // ref clk counter for DCO calibration 
)(
	input  logic ref_clk,           //reference clock to   DPLL/CLKIN  (target frequency 600MHz or higher)
	input  logic dco_dclk,          //reference clock from DPLL/clkout0
	input  logic rst,               // Soft Cal rest

`ifdef DEF_LOCKED
	input  logic locked_i,          // tied 1, or control the SC to wait by set it low
`endif

	output logic rst_o,             // DPLL reset
	output logic sc_cal_done,       // DPLL SC done
	output logic sc_jump_fail,      // DPLL SC FAIL

  input logic pwrdwn,             // PWRDWN pin
  output logic pwrdwn_o,          // to DPLL 

       //--------------------------APB3
        //input  logic psclk, // sharing with ref_clk

        //output logic psel,             // unused (for APB3)
        output logic [6:0] daddr,      // to DPLL/APB
        output logic [15:0]  di,       // to DPLL/APB
        output logic  den,             // to DPLL/APB
        output logic dwe,              // to DPLL/APB
        input  logic drdy,             // from DPLL/APB
        input  logic [15:0]  dout      // from DPLL/APB


);

//--------------------------------- marklin
//parameter DCO_DCLK_DIV=   8;   // system clkout0 divisor  (ie clkout0=dco_dclk is 600MHz during calibration)
parameter DCO_DCLK_DIV  =  16;   // ATE/AFX clkout0 divisor (ie clkout0=dco_dclk is 300MHz during calibration)  

parameter DCNT_B     =   $clog2(T_CAL*6000/(DCO_DCLK_DIV*50))+1;  // DCO_CNT bit size  assuming 6G with 50MHz ref_clk + 1 extra bit  
// parameter DCNT_B        =  17;                                 // DCO_CNT bit sise
parameter DCO_CODE_INIT  = 128;                                    // initial DCO RO threshold kick-off  : open-loop addr_94
parameter DCO_CODE_FINAL = 800;                                    // final DCO lock threshold after SC done : close-loop addr_94
parameter BCODE_B    =  13 ;  // Base_code bit size
//parameter RCNT_B   =   16;   // ref_cnt bit size
parameter T_RST      = 256;        // rst  to assertion of rst_O
parameter T1_RST     = 256 + 32;   // rst_O pulse length 
parameter RCNT_B     =   $clog2(T_CAL + T_RST*2+T1_RST*4 +1024)+1;   // ref_cnt bit size
//--------- T_DCO=128 is working but risky--------------------------------------------------------------------------------------
//parameter T_DCO      = 256 ;       // working, fails below 110 
//parameter T_DCO      = 256 ;       // watit time after load DCO_code  
parameter T_DCO      = 256 ;       // watit time after load DCO_code  
//--------- T_DCO_SYN=3 is working in simulation only-<TBD : marklin can be shorten with lab test confirmation>  
//parameter T_DCO_SYN  = 128 ;   // APB3 to capture DCO_cnt to hold dco_cnt stable for base_cnt 
//parameter T_DCO_SYN  = 64 ;       // APB3 to capture DCO_cnt to hold dco_cnt stable for base_cnt 
parameter T_DCO_SYN  = 64 ;       // APB3 to capture DCO_cnt to hold dco_cnt stable for base_cnt 
//--------- T_CAL_STEP=3 is working in simulation only-<TBD : marklin can be shorten with lab test confirmation>  
//parameter T_CAL_STEP = T_CAL ; // state=S_1, Bound = 6, each calibration step for dco_cnt xclk to ref_cal for comparing
//parameter T_CAL_STEP = 64 ;       // 
parameter T_CAL_STEP = 64 ;       // state=S_1, Bound = 6, each calibration step for dco_cnt xclk to ref_cal for comparing
//-------------------------------------------------------------------------------------------------------------
parameter SESSION_END = 14 ;       // Last Calibration session
//parameter Boundary    = 1 ;         // Base_code = 32*Boundary -1


parameter	S_RST = 0,
		S_1 = 1,
		S_2 = 2,
		S_3 = 3,
		S_4 = 4,
		S_5 = 5,
		S_6 = 6,
		S_7 = 7,
		S_8 = 8,
		S_9 = 9,
		S_10 = 10,
		S_11 = 11,
		S_12 = 12,
		S_13 = 13,
		S_14 = 14,
		S_15 = 15,
		S_FINISH = 16,
		DONT_CARE_STATE = 4'bxxxx;

logic [15:0] flag_done;
logic        flag_loaded, flag_store;
logic skip;

//--- marklin calibration singal
logic [4:0] state, next_state;
logic [RCNT_B-1:0] ref_cnt;
logic rst_sync;
logic [BCODE_B-1:0]    Base_code;
logic [DCNT_B-1:0]     base_cnt;
logic [BCODE_B-1:0]    DCO_code;
logic [DCNT_B-1:0]     dco_cnt;
`ifdef DEBUG_RECORD_DCO_CNT
logic [DCNT_B-1:0]     dco_cnt_3;
`endif


//------------------------------------------------------------ ABP3 den lags
logic  den_int,den_int_d;
logic  den_o;
logic  drdy_d;

`ifndef DEF_APB_LAG1
   `ifndef DEF_APB_LAG2
     assign den = den_int;
   `else
   `endif
`else
 assign den = den_o;  // LAG1
`endif
//---------------------------------
//- lag den 1/2-cycle
//---------------------------------
   always @(posedge ref_clk or posedge rst_sync) begin
     if (rst_sync) begin
`ifdef DEF_APB_LAG2
       den       <= '0;
`endif
       den_o     <= '0;
       den_int_d <= '0;
       drdy_d    <= '0;
     end
     else begin
       den_int_d <= den_int;
       drdy_d    <= drdy;
   
`ifdef DEF_APB_LAG2
      den     <= den_o;
      if( ~drdy_d & drdy )        den     <= '0;
`endif
   
       den_o   <= den_o;
      if( den_int & ~den_int_d )  den_o     <= '1;
      if( ~drdy_d & drdy )        den_o     <= '0;
     end
   end
//------------------------------------------------------------ end: ABP3 den lags


logic  rst_O;
logic [4:0] bound_s;
logic [4:0] session_cnt;
logic  dco_en_ref;
logic  dco_en;
logic  dco_en_d;
logic  rst_dsync;
logic [9:0] boundary;
logic [15:0]  rdout;
logic [15:0]  jump_fail;

logic [4:0] jump[15:0];
logic [4:0] jump_load;
assign rst_o = rst_O | rst | pwrdwn;

assign pwrdwn_o = 1'b0;

`ifndef DEF_LOCKED
logic locked_i;          // tied 1, or control the SC to wait by set it low
assign locked_i = 1;
`endif
logic locked;
assign sc_jump_fail = |jump_fail;
assign jump_load = DCO_code-Base_code;  //TBD
//assign jump_load = DCO_code-Base_code-1;
// logic [4:0] index_jump[15:0];   ----------------------------- marklin
logic [4:0] jump_0 , jump_1, jump_2, jump_3, jump_4, jump_5, jump_6, jump_7;
logic [4:0] jump_8 , jump_9, jump_A, jump_B, jump_C, jump_D, jump_E, jump_F;
// logic [4:0] index_jump[15:0];   ----------------------------- marklin

// ---------------------- marklin
// APB3 restort  marklin
// ---------------------- marklin
  logic [15:0]  apb_rdata_adr_34;
  logic [15:0]  apb_rdata_adr_58;
  logic [15:0]  apb_rdata_adr_64;
  logic [15:0]  apb_rdata_adr_5C;
  logic [15:0]  apb_rdata_adr_68;
  logic [15:0]  apb_rdata_adr_94;
  logic [15:0]  apb_rdata_adr_A8;
// ---------------------- marklin
  logic [8:0]  dco_dclk_div;
  assign dco_dclk_div = DCO_DCLK_DIV;
  logic all_jump_is_1;
// ---------------------- 
//always @(*) begin
always_comb  begin
     jump_0 = jump[0];
     jump_1 = jump[1];
     jump_2 = jump[2];
     jump_3 = jump[3];
     jump_4 = jump[4];
     jump_5 = jump[5];
     jump_6 = jump[6];
     jump_7 = jump[7];
     jump_8 = jump[8];
     jump_9 = jump[9];
     jump_A = jump[10];
     jump_B = jump[11];
     jump_C = jump[12];
     jump_D = jump[13];
     jump_E = jump[14];
     jump_F = jump[15];
     all_jump_is_1 = (jump_1==1 & jump_2==1 & jump_3==1 & jump_4==1 & jump_5==1  & jump_6==1 & jump_7==1 & 
                      jump_8==1 & jump_9==1 & jump_A==1 & jump_B==1 & jump_C==1 & jump_D==1  & jump_E==1 & jump_F==1) ;
end

`ifdef DEFINE_SYNC_RST
logic rst_dsync_n;
logic rst_sync_n;

extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 Isync_rst (
   .si (1'b0), .se (1'b0), .d  (1'b1),
   .ck (ref_clk), .rn (!rst), .q  (rst_sync_n)
   );

extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 Isync_drst (
   .si (1'b0), .se (1'b0), .d  (1'b1),
   .ck (dco_dclk), .rn (!rst), .q  (rst_dsync_n)
   );

assign rst_sync  = !rst_sync_n;
assign rst_dsync = !rst_dsync_n;
`endif

extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 Isync_locked (
   .si (1'b0), .se (1'b0), .d  (locked_i),
   .ck (ref_clk), .rn (!rst), .q  (locked)
   );

`ifdef DEFINE_SYNC_RST
extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 Isync_dco_en (
   .si (1'b0), .se (1'b0), .d  (dco_en_ref),
   .ck (dco_dclk), .rn (!rst_dsync), .q  (dco_en)
   );
`else
extended_phy_layer_clk_wizard_0_0_clocking_Synchronizer3 Isync_dco_en (
   .si (1'b0), .se (1'b0), .d  (dco_en_ref),
   .ck (dco_dclk), .rn (!rst), .q  (dco_en)
   );
assign rst_sync  = rst;
assign rst_dsync = rst;
`endif


`ifdef DEFINE_SYNC_RST
always @(posedge dco_dclk or posedge rst_dsync)
  if (rst_dsync) begin
`else
always @(posedge dco_dclk or posedge rst)
  if (rst) begin
`endif
    dco_en_d <= '0;
    dco_cnt  <= '0;
  end
  else begin
    dco_en_d <= dco_en;
    dco_cnt <= dco_cnt;
   if (!dco_en_d && dco_en) dco_cnt  <= 2;
   else if (dco_en)         dco_cnt  <= dco_cnt + 1;
  end

`ifdef DEFINE_SYNC_RST
//always @(posedge ref_clk) begin
always @(posedge ref_clk or posedge rst_sync) begin
  if (rst_sync) begin
`else
always @(posedge ref_clk or posedge rst) begin
  if (rst) begin
`endif
    sc_cal_done   <= '0;
    ref_cnt   <= '0;
    boundary  <=  1;
    DCO_code  <= '0;
    drdy_d    <= '0;
    bound_s   <= '0;
    state     <= S_RST;
    dco_en_ref<= '0;
    Base_code <= '0;
    DCO_code  <= '0;
    base_cnt  <= '0;
    session_cnt   <= '0;
    daddr     <= '0; 
    di        <= '0;
    //psel      <= '0;
    den_int       <= '0;
    dwe       <= '0;
    rst_O     <= '0;
    jump[0]   <= '0; jump[1]   <= '0; jump[2]   <= '0; jump[3]   <= '0;
    jump[4]   <= '0; jump[5]   <= '0; jump[6]   <= '0; jump[7]   <= '0;
    jump[8]   <= '0; jump[9]   <= '0; jump[10]  <= '0; jump[11]  <= '0;
    jump[12]  <= '0; jump[13]  <= '0; jump[14]  <= '0; jump[15]  <= '0;
    apb_rdata_adr_34       <= '0;
    apb_rdata_adr_58       <= '0;
    apb_rdata_adr_64       <= '0;
    apb_rdata_adr_A8       <= '0;
    apb_rdata_adr_5C       <= '0;
    apb_rdata_adr_68       <= '0;
    apb_rdata_adr_94       <= '0;
    jump_fail              <= '0;
`ifdef DEBUG_RECORD_DCO_CNT
    dco_cnt_3              <= '0;
`endif

  end
  else begin
`ifdef DEBUG_RECORD_DCO_CNT
    dco_cnt_3         <= dco_cnt_3;
`endif
        sc_cal_done   <= sc_cal_done;
        jump_fail     <= jump_fail;

    apb_rdata_adr_34 <= apb_rdata_adr_34;
    apb_rdata_adr_58 <= apb_rdata_adr_58;
    apb_rdata_adr_64 <= apb_rdata_adr_64;
    apb_rdata_adr_A8 <= apb_rdata_adr_A8;
    apb_rdata_adr_5C <= apb_rdata_adr_5C;
    apb_rdata_adr_68 <= apb_rdata_adr_68;
    apb_rdata_adr_94 <= apb_rdata_adr_94;

    jump[0]   <= jump[ 0] ; jump[1]   <= jump[ 1] ; jump[ 2]  <= jump[ 2] ; jump[3]   <= jump[ 3] ;
    jump[4]   <= jump[ 4] ; jump[5]   <= jump[ 5] ; jump[ 6]  <= jump[ 6] ; jump[7]   <= jump[ 7] ;
    jump[8]   <= jump[ 8] ; jump[9]   <= jump[ 9] ; jump[10]  <= jump[10] ; jump[11]  <= jump[11] ;
    jump[12]  <= jump[12] ; jump[13]  <= jump[13];  jump[14]  <= jump[14] ; jump[15]  <= jump[15];
    session_cnt <= session_cnt;
    bound_s     <= bound_s;
    state       <= state;
    ref_cnt     <= ref_cnt;
    rst_O       <= rst_O;
    drdy_d      <= drdy;
    dco_en_ref  <= '0;
    Base_code   <= Base_code;
    DCO_code    <= DCO_code;
    base_cnt    <= base_cnt;
        daddr   <= daddr; di    <= di;  den_int  <=  den_int; dwe<=  dwe; //psel <= psel;
   if( drdy ) begin 
       daddr    <= '0; di    <= '0;  den_int  <=  '0; dwe<=  '0; //psel <= '0;
   end
    
   case(state) 
    S_RST: begin
      ref_cnt <= ref_cnt+1;
      rst_O <= '1;
      //-------------------------------------------------------------------------------------------------- write to clear Jump
      if     (ref_cnt == T_RST + 10 ) begin
                  APB_WR( (8'h7C>>2), '0);
                  //daddr <= (8'h7C>>2); di <= '0 ;     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
      end
      else if     (ref_cnt == T_RST + 15 ) begin
                  APB_WR( (8'h80>>2), '0);
                  //daddr <= (8'h80>>2); di <= '0 ;     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
      end
      else if     (ref_cnt == T_RST + 20 ) begin
                  APB_WR( (8'h84>>2), '0);
                  //daddr <= (8'h84>>2); di <= '0 ;     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
      end
      else if     (ref_cnt == T_RST + 25 ) begin
                  APB_WR( (8'h88>>2), '0);
                  //daddr <= (8'h88>>2); di <= '0 ;  den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
      end
      else if     (ref_cnt == T_RST + 30 ) begin
                  APB_WR( (8'h8C>>2), '0);
                  //daddr <= (8'h8C>>2); di <= '0 ;     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
      end
      else if(ref_cnt  == T_RST+40 )                                                 APB_RD(8'h94>>2);
      else if((ref_cnt >= T_RST+40) && (ref_cnt <= T_RST+49)  && drdy )    apb_rdata_adr_94<=dout;
`ifdef DEF_DCO_CODE_INIT
      else if(ref_cnt == T_RST + 60 ) begin  // DCO lock_th kick-off values to unlock band0
              //Step 6 is replaced with setting the DCO code. (0x94/4[11:0] = {20'd0, Base_code[11:0]})  mc_lock_th[8:0] is used to set the DCO code
               //APB_WR( (8'h94>>2), {20'd0, DCO_code[11:0]});
               APB_WR( (8'h94>>2), {20'd0, DCO_CODE_INIT[11:0]});
      end
`endif
//      else if(ref_cnt == T_RST*2 +70 ) 
//        rst_O <= '1;
      else if(ref_cnt == T_RST*2+T1_RST +80 ) begin
//`ifndef DEFINE_EXTEND_RST
//        rst_O <= '0;
//`endif
        `ifdef DEBUG_DISP 
               $display ("-----------------------------------------------------------------------"); 
               $display ("DPLL RESETED  time=%0t  //MML", $time); 
               $display ("-----------------------------------------------------------------------"); 
        `endif
      end
      else if(ref_cnt == T_RST*2+T1_RST + 90 ) begin
        ref_cnt     <= ref_cnt; 
        if(locked ) begin
         ref_cnt     <= ref_cnt+1; 
         `ifdef DEBUG_DISP 
                $display ("-----------------------------------------------------------------------"); 
                $display ("DPLL LOCKED :Soft CAL start open-loop bypass time=%0t locked=%h //MML", $time,locked); 
                $display ("-----------------------------------------------------------------------"); 
         `endif
        end
      end
      else if(ref_cnt == T_RST*2+T1_RST + 95 ) begin
         ref_cnt     <= ref_cnt+1; 
      end

      `ifdef DEBUG_DISP 
      else if(ref_cnt == T_RST*2+T1_RST +100 ) begin
                       $display ("----------------------------------------------------------------"); 
                       $display ("SYSTEM INIT RST : open-loop bypass time=%0t //MML", $time); 
                       $display ("----------------------------------------------------------------"); 
                        APB_RD_DEBUG(8'h7C>>2, dout, '0, '1 );
                        APB_RD_DEBUG(8'h80>>2, dout, '0, '1 );
                        APB_RD_DEBUG(8'h84>>2, dout, '0, '1 );
                        APB_RD_DEBUG(8'h88>>2, dout, '0, '1 );
                        APB_RD_DEBUG(8'h8C>>2, dout, '0, '1 );
      end
      else if(ref_cnt == T_RST*2+T1_RST +140 ) begin
                        @(negedge ref_clk);
                	$display ("----------------------------------------------------------------------------------"); 
                	$display ("-- JUMP APB READ ADDR 1F-23 time=%t",$time);
                	$display ("----------------------------------------------------------------------------------"); 
                        $display ("   --- jump[0] = %d  //MML",  jump[0]); 
                        $display ("   --- jump[1] = %d  //MML",  jump[1]); 
                        $display ("   --- jump[2] = %d  //MML",  jump[2]); 
                        $display ("   --- jump[3] = %d  //MML",  jump[3]); 
                        $display ("   --- jump[4] = %d  //MML",  jump[4]); 
                        $display ("   --- jump[5] = %d  //MML",  jump[5]); 
                        $display ("   --- jump[6] = %d  //MML",  jump[6]); 
                        $display ("   --- jump[7] = %d  //MML",  jump[7]); 
                        $display ("   --- jump[8] = %d  //MML",  jump[8]); 
                        $display ("   --- jump[9] = %d  //MML",  jump[9]); 
                        $display ("   --- jump[10]= %d  //MML",  jump[10]); 
                        $display ("   --- jump[11]= %d  //MML",  jump[11]); 
                        $display ("   --- jump[12]= %d  //MML",  jump[12]); 
                        $display ("   --- jump[13]= %d  //MML",  jump[13]); 
                        $display ("   --- jump[14]= %d  //MML",  jump[14]); 
                        $display ("   --- jump[15]= %d  //MML",  jump[15]); 
      end
      `endif
      //-------------------------------------------------------------------------------------------------- write to clear Jump
      else if(ref_cnt == T_RST*2+T1_RST*2 +150 )                                                 APB_RD(8'h34>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+150) && (ref_cnt <= T_RST*2+T1_RST*2 +159)  && drdy )    apb_rdata_adr_34<=dout;

      else if(ref_cnt == T_RST*2+T1_RST*2 +160 )                                                 APB_RD(8'h58>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+160) && (ref_cnt <= T_RST*2+T1_RST*2 +169)  && drdy )    apb_rdata_adr_58<=dout;

      else if(ref_cnt == T_RST*2+T1_RST*2 +170 )                                                 APB_RD(8'h5C>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+170) && (ref_cnt <= T_RST*2+T1_RST*2 +179)  && drdy )    apb_rdata_adr_5C<=dout;

      else if(ref_cnt == T_RST*2+T1_RST*2 +180 )                                                 APB_RD(8'h68>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+180) && (ref_cnt <= T_RST*2+T1_RST*2 +189)  && drdy )    apb_rdata_adr_68<=dout;

//-------------------------------------------------------------------------- regulator update  prior calibraion: start
      else if(ref_cnt == T_RST*2+T1_RST*2 +190 )                                                 APB_RD(8'h64>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+190) && (ref_cnt <= T_RST*2+T1_RST*2 +199)  && drdy )    apb_rdata_adr_64<=dout;

      else if(ref_cnt == T_RST*2+T1_RST*2 +200 )                                                 APB_RD(8'hA8>>2);
      else if((ref_cnt >= T_RST*2+T1_RST*2+200) && (ref_cnt <= T_RST*2+T1_RST*2 +209)  && drdy )    apb_rdata_adr_A8<=dout;

      //else if(ref_cnt == T_RST*2+T1_RST*2 +190 )                                                 APB_RD(8'h94>>2);
      //else if((ref_cnt >= T_RST*2+T1_RST*2+190) && (ref_cnt <= T_RST*2+T1_RST*2 +199)  && drdy )    apb_rdata_adr_94<=dout;
// prior calibration under DPLL reset: Make mc_sel_locked_in(adr_A8[14])=0 and mc_en_rkshort(adr_64[11])=1 
      else if(ref_cnt == T_RST*2+T1_RST*3 + 210 ) begin
              APB_WR(8'h64>>2, apb_rdata_adr_64 | 16'h0800); // mc_en_rkshort(adr_64[11])=1
            //APB_WR(8'h64>>2, apb_rdata_adr_64 & 16'hF7FF); // mc_en_rkshort(adr_64[11])=0
      end
      else if(ref_cnt == T_RST*2+T1_RST*3 + 220 ) begin
              APB_WR(8'hA8>>2, apb_rdata_adr_A8 & 16'hBFFF);  // mc_sel_locked_in(adr_A8[14])=0
            //APB_WR(8'hA8>>2, apb_rdata_adr_A8 | 16'h4000);  // mc_sel_locked_in(adr_A8[14])=1
      end
//-------------------------------------------------------------------------- regulator update prior calibraion: end
      else if(ref_cnt == T_RST*2+T1_RST*3 + 230 ) begin
         ref_cnt     <= ref_cnt+1; 
            //----------------------------------- system initialization
            // APB3 load open-loop
              //Step 3 should be set bypass = 1               (0x34/4[2]    =1 {27'd0,4'hE} )
              APB_WR(8'h34>>2, {27'd0,4'hE});
              //daddr <= (8'h34>>2); di <= {27'd0,4'hE};         den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
       else if(ref_cnt == T_RST*2+T1_RST*3 +240 ) begin
              //Step 4 should be set clkout0_divide = 8       (0x44/4[7:0]  =8 {22'd0, 1'b1, 9'd8})
               APB_WR(8'h58>>2, {19'd0, 3'b101, dco_dclk_div});  // TBD
               //daddr <= (8'h44>>2); di <= {22'd0, 1'b1, 9'd8};  den_int  <=  '1; dwe<=  '1; //psel <= '1 ; 
       end
       else if(ref_cnt == T_RST*2+T1_RST*3 +250 ) begin
              //Step  5 reg68<<2
               APB_WR(8'h68>>2,  16'h0B18);
               //daddr <= (8'h68>>2); di <= {28'd0, 4'd8};  den_int  <=  '1; dwe<=  '1; //psel <= '1 ; 
       end
       `ifdef DEBUG_DISP 
       else if(ref_cnt == T_RST*2+T1_RST*3 +260 ) begin
                   $display ("----------------------------------------------------------------"); 
                   $display ("SYSTEM INIT RST : open-loop bypass time=%0t //MML", $time); 
                   $display ("----------------------------------------------------------------"); 
                    APB_RD_DEBUG(8'h34>>2, dout,  {27'd0,4'hE}, '1 );
                    APB_RD_DEBUG(8'h58>>2, dout,  {19'd0, 3'b101, 9'd8}, '1 );
                    //APB_RD_DEBUG(8'h68>>2, dout, '0,'0 );
       end
       `endif
       else if(ref_cnt >= T_RST*2+T1_RST*4 +270 ) begin
               state <= S_1; ref_cnt     <= 0; 
               `ifdef DEFINE_EXTEND_RST
                       rst_O <= '0;
               `endif
       end
    end
      //----------------------------------- CAL START
    S_1:  begin
               
     if(session_cnt <=SESSION_END  ) begin  
        Base_code <= boundary*32-1;
      //if (session_cnt == 0)  DCO_code <= Base_code ;
      if (bound_s==0)  DCO_code <= (boundary<<5) - 1 ;

      if(ref_cnt < T_DCO+5 && bound_s==0 ) begin // wait for DCO to settle 
        ref_cnt <= ref_cnt+1;
      //------------------------------------------------------ DCO_code wr
       if (ref_cnt ==3) begin
           //Step 5 is replaced with setting the DCO code. (0x94/4[11:0] = {20'd0, Base_code[11:0]})  mc_lock_th[8:0] is used to set the DCO code
            APB_WR( (8'h94>>2), {20'd0, DCO_code[11:0]});
            //daddr <= (8'h94>>2); di <= {20'd0, DCO_code[11:0]};  den_int  <=  '1; dwe<=  '1; //psel <= '1 ; 
       end
       `ifdef DEBUG_DISP 
         if (ref_cnt ==6) begin
             `ifdef DEBUG_DISP
                $display ("-----------------------------------------------------------------------------------"); 
                $display ("--NEW SESSION %d with DCO_code=%h",session_cnt,DCO_code);
                $display ("-----------------------------------------------------------------------------------"); 
                $display ("NEW SESSION %d :  DCO_code =%d  wr  addr=9'h27 (decmial: 35) time=%0t //MML", session_cnt,DCO_code, $time); 
             `endif
               //@(posedge ref_clk);
     	      APB_RD_DEBUG(8'h94>>2, dout,  {20'd0, DCO_code[11:0]},'0);
         end
       `endif
      //------------------------------------------------------ DCO_code wr
      end
      else if(ref_cnt >= T_DCO+5 && bound_s==0 ) begin 
        bound_s  <= 1; ref_cnt <= '0;
      end
      else if(bound_s == 1) begin 
          if (ref_cnt < T_CAL  ) begin         // base_cnt: cal pulse start
              ref_cnt    <= ref_cnt+1;
              dco_en_ref <= 1;
           end
           else if (ref_cnt >= T_CAL  ) begin  // base_cnt: cal pulse end
             ref_cnt     <= '0;
              bound_s    <= 2;
           end
      end
      else if(bound_s == 2) begin              //base_cnt=  dco_cnt 
           ref_cnt    <= ref_cnt+1;
           if (ref_cnt >= T_DCO_SYN  ) begin  
              ref_cnt  <= '0; bound_s  <= 3;
              base_cnt <= dco_cnt;
           end
      end
      else if(bound_s == 3) begin        
              DCO_code <= DCO_code + 1 ;
              ref_cnt  <= '0; bound_s  <= 4;  
      end
      else if(bound_s == 4) begin // LOAD DCO_code +1 , settle time T_DCO 
      //------------------------------------------------------ DCO_code wr
          if (ref_cnt ==3) begin
              // load DCO_code++: Base_cnt: cal pulse start
               APB_WR( (8'h94>>2), {20'd0, DCO_code[11:0]});
               //daddr <= (8'h94>>2); di <= {20'd0, DCO_code[11:0]};  den_int  <=  '1; dwe<=  '1; //psel <= '1 ; 
          end
       `ifdef DEBUG_DISP 
         if (ref_cnt ==10) begin
             //@(posedge ref_clk);
             $display ("  --------------DCO_CODE++ WRITE------------------"); 
             $display ("  | SESSION %d :  DCO_code (++)=%d  wr  addr=9'h27 (decmial: 35) time=%0t //MML", session_cnt,DCO_code, $time); 
       `ifdef DEBUG_TOP_DISP 
             //$display ("  | SESSION %d :  DCO code_in  =%d  wr   time=%0t //MML", session_cnt,top.dut.SHIP.BUT.uut.dpll.dpll_mix.macros.dco.code_in[31:0], $time); 
             //$display ("  | SESSION %d :  DCO code_in  =%d  wr   time=%0t //MML", session_cnt,tb_dpll_site.Idut.Idpll_site.dpll.dpll_mix.macros.dco.code_in[31:0], $time); 
             $display ("  | SESSION %d :  DCO code_in  =%d  wr   time=%0t //MML", session_cnt,tb_dpll_site.Idut.uut.dpll.dpll_mix.macros.dco.code_in[31:0], $time); 
             //$display ("  | SESSION %d :  DCO code_in  =%d  wr   time=%0t //MML", session_cnt,tb_dpll_site.Idut.Idpll_site.dpll.dpll_mix.macros.dco.code_in[31:0], $time); 
       `endif
             $display ("  ------------------------------------------------"); 
     	      APB_RD_DEBUG(8'h94>>2, dout,  {20'd0, DCO_code[11:0]}, '1);
         end
       `endif
      //------------------------------------------------------ DCO_code wr
          if (ref_cnt < T_DCO_SYN+2 ) begin         
             ref_cnt     <= ref_cnt+1;
          end
          else if (ref_cnt >=  T_DCO_SYN+2 ) begin         
             ref_cnt     <=  '0; ; bound_s     <=  5;
          end
      end
      else if(bound_s == 5) begin 
          if (ref_cnt < T_CAL  ) begin         //DCO_code++ : dco_cnt    
              ref_cnt    <= ref_cnt+1;
              dco_en_ref <= 1;
           end
           else if (ref_cnt >= T_CAL  ) begin  //DCO_code++ : dco_cnt  end
             ref_cnt    <= '0; bound_s    <= 6;
           end
      end
      else if(bound_s == 6) begin 
           ref_cnt    <= ref_cnt+1;
           if (ref_cnt >= T_CAL_STEP  ) begin  
              ref_cnt <= ref_cnt;
              `ifdef DEBUG_DISP_1
              if (dco_cnt >= base_cnt +1  ) begin  
              `elsif DEBUG_JUMP_OFFSET 
              if (dco_cnt + `JUMP_OFFSET >= base_cnt  ) begin  
              `else
              if (dco_cnt >= base_cnt  ) begin  
              `endif
              `ifdef DEBUG_RECORD_DCO_CNT
                 if  (boundary == 3) dco_cnt_3 <= dco_cnt;
              `endif
                         //jump[boundary]    <= DCO_code-Base_code;
                         jump[boundary]    <= jump_load;
                         boundary          <= boundary+1;
                         session_cnt       <= session_cnt+1;
                       `ifdef DEBUG_DISP
                          $display ("-----------------------------------------------------------------"); 
                          $display ("-- Session [%d] DONE",session_cnt);
                          if  (jump_load > 5'h1F) begin
                                  $display ("ERROR OVERFLOW JUMP: Session=%d jump[%2d] = %d , DCO_code=%d, Base_code=%d  //MML", session_cnt, boundary, jump_load,DCO_code, Base_code); 
                          end
                          $display ("   --- jump: bounday=%4d           dco_cnt =%d, base_cnt =%d   //MML", session_cnt,dco_cnt, base_cnt, boundary); 
                          $display ("-----------------------------------------------------------------"); 
                          $display ("   --- Session=%d jump[%2d] = %d , DCO_code=   %d,  Base_code=   %d    //MML", session_cnt, boundary, jump_load,DCO_code, Base_code); 
                       `endif
                         if (session_cnt == SESSION_END  ) begin
                             state <= S_2;
                             `ifdef DEBUG_DISP
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                                $display ("-- CAL DONE");
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                             `endif
                         end
                         else begin 
                                bound_s    <= '0;
                                ref_cnt    <= '0;
                         end
           end
           else  begin  
                         ref_cnt  <= 0; bound_s  <= 3;
                        // DCO_code <= DCO_code+1;
                       `ifdef DEBUG_DISP
                          $display ("   --- Session=%d no jump[%2d] = %d , DCO_code=   %d,  Base_code=   %d    //MML", session_cnt, boundary, jump_load,DCO_code, Base_code); 
                          $display ("   --- Session=%d no jump: dco_cnt=%d base_cnt=%d boundary=%d   //MML", session_cnt,dco_cnt, base_cnt, boundary); 
                       `endif
                           //Base_code <= boundary*32-1;
                         //if      (session_cnt == SESSION_END && DCO_code == (2**12-1)  ) begin
                         //if      (session_cnt == SESSION_END && DCO_code == (32*(boundary+1)-1)  ) begin
                         if      (session_cnt == SESSION_END && DCO_code == (32*(boundary+1))  ) begin
                              boundary          <= boundary+1;
                              session_cnt       <= session_cnt+1;
                              jump_fail[boundary-1]       <= 1;
                             state <= S_2;
                             `ifdef DEBUG_DISP
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                                $display ("-- session=%d OVERFLOW DCO_code == %d jump fail  ",session_cnt,DCO_code);
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                             `endif
                         end
                         //else if (session_cnt  < SESSION_END && DCO_code == (2**12-1)  ) begin
                         //else if (session_cnt  < SESSION_END && DCO_code == (32*(boundary+1)-1)  ) begin
                         else if (session_cnt  < SESSION_END && DCO_code == (32*(boundary+1))  ) begin
                              boundary          <= boundary+1;
                              session_cnt       <= session_cnt+1;
                              jump_fail[boundary-1]       <= 1;
                             `ifdef DEBUG_DISP
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                                $display ("-- session=%d OVERFLOW DCO_code == %d jump fail",session_cnt,DCO_code);
                                $display ("--------------------------------------------------------------------------------------------------------------------------------"); 
                             `endif
                         end
             end
           end
      end
     end //section
    end
    S_2:  begin //write Jump
                         state <= S_3;
                         ref_cnt    <= '0;
    end
    S_3:  begin //write Jump
           ref_cnt    <= ref_cnt+1;

   //-------------------------------------------------------------------------------------------------- write Jump
      if     (ref_cnt == 5 ) begin
        APB_WR( (8'h7C>>2), {17'd0,jump[3],jump[2],jump[1]});
        //daddr <= (8'h7C>>2); di <= {17'd0,jump[3],jump[2],jump[1]};     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
      else if(ref_cnt == 10 ) begin
        APB_WR( (8'h80>>2), {17'd0,jump[6],jump[5],jump[4]});
        //daddr <= (8'h80>>2); di <= {17'd0,jump[6],jump[5],jump[4]};     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
      else if(ref_cnt == 15 ) begin
        APB_WR( (8'h84>>2), {17'd0,jump[9],jump[8],jump[7]});
        //daddr <= (8'h84>>2); di <= {17'd0,jump[9],jump[8],jump[7]};     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
      else if(ref_cnt == 20 ) begin
        APB_WR( (8'h88>>2), {17'd0,jump[12],jump[11],jump[10]});
        //daddr <= (8'h88>>2); di <= {17'd0,jump[12],jump[11],jump[10]};  den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
      else if(ref_cnt == 25 ) begin
        APB_WR( (8'h8C>>2), {17'd0,jump[15],jump[14],jump[13]});
        //daddr <= (8'h8C>>2); di <= {17'd0,jump[15],jump[14],jump[13]};     den_int  <=  '1; dwe<=  '1; //psel <= '1 ;
       end
   //-------------------------------------------------------------------------------------------------- write Jump
      if(ref_cnt ==40) begin
        daddr <= '0; di <= '0;  den_int  <=  '0; dwe<=  '0; //psel <= '0 ;
        state <= S_4;
        ref_cnt    <= '0;
      end
    end
    S_4:  begin
           ref_cnt    <= ref_cnt+1;
     `ifdef DEBUG_DISP 
     	if   (ref_cnt == 0 ) begin
                @(negedge ref_clk);
        	$display ("----------------------------------------------------------------------------------"); 
        	$display ("-- JUMP APB READ ADDR 1F-23 time=%t",$time);
        	$display ("----------------------------------------------------------------------------------"); 
                $display ("   --- jump[0] = %d  //MML",  jump[0]); 
                $display ("   --- jump[1] = %d  //MML",  jump[1]); 
                $display ("   --- jump[2] = %d  //MML",  jump[2]); 
                $display ("   --- jump[3] = %d  //MML",  jump[3]); 
                $display ("   --- jump[4] = %d  //MML",  jump[4]); 
                $display ("   --- jump[5] = %d  //MML",  jump[5]); 
                $display ("   --- jump[6] = %d  //MML",  jump[6]); 
                $display ("   --- jump[7] = %d  //MML",  jump[7]); 
                $display ("   --- jump[8] = %d  //MML",  jump[8]); 
                $display ("   --- jump[9] = %d  //MML",  jump[9]); 
                $display ("   --- jump[10]= %d  //MML",  jump[10]); 
                $display ("   --- jump[11]= %d  //MML",  jump[11]); 
                $display ("   --- jump[12]= %d  //MML",  jump[12]); 
                $display ("   --- jump[13]= %d  //MML",  jump[13]); 
                $display ("   --- jump[14]= %d  //MML",  jump[14]); 
                $display ("   --- jump[15]= %d  //MML",  jump[15]); 
        end
        if (ref_cnt ==1)  APB_RD_DEBUG(8'h7C>>2, dout, {17'd0,jump[3],jump[2],jump[1]}, '1 );
        if (ref_cnt ==2)  APB_RD_DEBUG(8'h80>>2, dout, {17'd0,jump[6],jump[5],jump[4]}, '1 );
        if (ref_cnt ==3)  APB_RD_DEBUG(8'h84>>2, dout, {17'd0,jump[9],jump[8],jump[7]}, '1 );
        if (ref_cnt ==4)  APB_RD_DEBUG(8'h88>>2, dout, {17'd0,jump[12],jump[11],jump[10]}, '1 );
        if (ref_cnt ==5)  APB_RD_DEBUG(8'h8C>>2, dout, {17'd0,jump[15],jump[14],jump[13]}, '1 );

     `endif
     	if   (ref_cnt == 20 ) begin
          ref_cnt <= 0;
          state   <= S_5;
        end
    end
    S_5:  begin
      //------------------------------
      //APB3  mission mode
      //------------------------------
      ref_cnt <= ref_cnt+1;
      rst_O      <= rst_O;
      if(ref_cnt == 5 ) 
      //----------------------------------- restort (CXT)
      //----------------------------------- DPLL mission mode
      // APB3 load open-loop
      //  APB_WR(8'h34>>2, {27'd0,4'hA});  // old misssion
`ifdef DEFINE_MIX_RESTORE
     	  APB_WR(8'h34>>2, (apb_rdata_adr_34 & 16'hFFFB) ); //restore except bit[2] bypass = 0
`elsif DEFINE_RESTORE
       APB_WR(8'h34>>2, apb_rdata_adr_34 & 16'hFFFB); // bit[2]=0 no bypass
`else // default
        APB_WR(8'h34>>2, {27'd0,4'hA});  // old misssion
`endif
      else if(ref_cnt == 10 ) begin
       //APB_WR(8'h68>>2,  16'h0B1C);  //old mission
`ifdef DEFINE_MIX_RESTORE
     	  APB_WR(8'h58>>2, {apb_rdata_adr_58[15:9],9'h010} );
`elsif DEFINE_RESTORE
          APB_WR(8'h58>>2, apb_rdata_adr_58);
`endif
      end
//      else if(ref_cnt == 15 ) begin
//         // APB_WR( (8'h94>>2), 32'd400);  //old mission
//       APB_WR(8'h5C>>2, apb_rdata_adr_5C);
//      end
      else if(ref_cnt == 20 ) begin
`ifdef DEFINE_MIX_RESTORE
       APB_WR(8'h68>>2, ((apb_rdata_adr_68 | 16'h0004) & 16'hFFFE));
`elsif DEFINE_RESTORE
       APB_WR(8'h68>>2, (apb_rdata_adr_68 | 16'h0004) & 16'hFFFE); //bit[0] = 0 : disable old calibration ; bit[2]=1 (EN_DIVOUT) enable mission mode  
`else  // default
               APB_WR(8'h68>>2,  16'h0B1C);
`endif
      end
      else if(ref_cnt == 25 ) begin
`ifdef DEF_DCO_CODE_FINAL
       APB_WR( (8'h94>>2), {20'd0, DCO_CODE_FINAL[11:0]});
`else //restored
       APB_WR(8'h94>>2, apb_rdata_adr_94);   //restort to original
`endif 
      end
      else if(ref_cnt == T_RST +40 ) begin
        rst_O <= '1;
      end
//-------------------------------------------------------------------------- regulator update after calibraion: start
// finisish calibration under DPLL reset: // mc_sel_locked_in(adr_A8[14])=1 and mc_en_rkshort(adr_64[11])=0.
      else if(ref_cnt == T_RST+T1_RST +50 ) begin
            APB_WR(8'h64>>2, apb_rdata_adr_64 & 16'hF7FF); // mc_en_rkshort(adr_64[11])=0
      end
      else if(ref_cnt == T_RST+T1_RST +60 ) begin
            APB_WR(8'hA8>>2, apb_rdata_adr_A8 | 16'h4000);  // mc_sel_locked_in(adr_A8[14])=1
      end
//-------------------------------------------------------------------------- regulator update after calibraion: end
      else if(ref_cnt == T_RST+T1_RST*2 +70  ) begin
        rst_O      <= '0;
      `ifdef DEBUG_DISP 
             $display ("----------------------------------------------------------------"); 
             $display ("sc_cal_done=%b (expect 0) %0t //MML",sc_cal_done, $time); 
             $display ("----------------------------------------------------------------"); 
      `endif
      end
      `ifdef DEBUG_DISP 
      else if(ref_cnt == T_RST+T1_RST*2 +80 ) begin
             $display ("----------------------------------------------------------------"); 
             $display ("SYSTEM MISSION MODE RST : close-loop bypass time=%0t //MML", $time); 
             $display ("----------------------------------------------------------------"); 
     	      //APB_RD_DEBUG(8'h34>>2, dout, {27'd0,4'hA}, '1 );
     	      //APB_RD_DEBUG(8'h68>>2, dout, 16'hd0B1C,'1 );
     	      //APB_RD_DEBUG(8'hB0>>2, dout, 32'd1425,'0 );  //dco_cnt
     	      //APB_RD_DEBUG(8'hB4>>2, dout, 32'd712,'0 );  //dco_cnt
`ifdef DEFINE_MIX_RESTORE
     	      APB_RD_DEBUG(8'h34>>2, dout, apb_rdata_adr_34 & 16'hFFFB, '1 ); //restore except bit[2] bypass = 0
     	      APB_RD_DEBUG(8'h58>>2, dout, {apb_rdata_adr_58[15:9],dco_dclk_div} , '1 );
     	      APB_RD_DEBUG(8'h68>>2, dout, (apb_rdata_adr_68 | 16'h0004) & 16'hFFFE , '1 );
`elsif DEFINE_NO_RESTORE
     	      APB_RD_DEBUG(8'h34>>2, dout, {27'd0,4'hA}, '1 );
     	      APB_RD_DEBUG(8'h68>>2, dout, 16'hd0B1C,'1 );
     	      //APB_RD_DEBUG(8'h44>>2, dout, apb_rdata_adr_44 , '1 );
     	      //APB_RD_DEBUG(8'hB0>>2, dout, 32'd1425,'0 );  //dco_cnt
     	      //APB_RD_DEBUG(8'hB4>>2, dout, 32'd712,'0 );  //dco_cnt
`else // restore 
     	      APB_RD_DEBUG(8'h34>>2, dout, apb_rdata_adr_34 & 16'hFFFB, '1 ); //restore except bit[2] bypass = 0
     	      APB_RD_DEBUG(8'h58>>2, dout, apb_rdata_adr_58 , '1 );
     	      //APB_RD_DEBUG(8'h5C>>2, dout, apb_rdata_adr_5C , '1 );
     	      APB_RD_DEBUG(8'h68>>2, dout, (apb_rdata_adr_68 | 16'h0004) & 16'hFFFE) & 16'hFFFE , '1 );
`endif
`ifdef DEF_DCO_CODE_FINAL
     	      APB_RD_DEBUG(8'h94>>2, dout, DCO_CODE_FINAL , '1 );
`else //restored
     	      APB_RD_DEBUG(8'h94>>2, dout, apb_rdata_adr_94 , '1 );
`endif 
     	      //APB_RD_DEBUG(8'h94>>2, dout, apb_rdata_adr_94 , '1 );
      end
      `endif
`ifdef DEBUG_RECORD_DCO_CNT
      else if(ref_cnt == T_RST+T1_RST*2 +90 ) begin
        //APB_WR( (8'hB0>>2), {20'd0,dco_cnt[11:2],!all_jump_is_1,sc_cal_done});
        APB_WR( (8'hB0>>2), {20'd0,dco_cnt[11:2],!all_jump_is_1,1'b1});
      end
      else if(ref_cnt == T_RST+T1_RST*2 +100 ) begin
        APB_WR( (8'hB4>>2), {20'd0,dco_cnt_3[11:1],!sc_jump_fail});
      end
`endif
      else if(ref_cnt == T_RST+T1_RST*2 +110 ) begin
        state <= S_6; ref_cnt     <= '0; 
        daddr <= '0; di    <= '0;  den_int  <=  '0; dwe<=  '0; //psel <= '0;
      end
    end
    S_6:  begin
        sc_cal_done <= '1;
        ref_cnt     <= '0; 
        daddr <= '0; di    <= '0;  den_int  <=  '0; dwe<=  '0; //psel <= '0;
      `ifdef DEBUG_DISP 
          #1us;
             $display ("----------------------------------------------------------------"); 
             $display ("sc_cal_done =%b (expect 1) %0t //MML",sc_cal_done, $time); 
             $display ("sc_jump_fail =%b ; jump_fail=%h  %0t //MML",sc_jump_fail,jump_fail, $time); 
             $display ("----------------------------------------------------------------"); 
          `ifdef DEBUG_RECORD_DCO_CNT
             $display ("  REG_B0/B4 =  last-dco_cnt/{20'd0,dco_cnt_3[11:1],sc_cal_done=%b}",sc_cal_done); 
             $display (" refernece cnt =%d   %0t //MML",T_CAL,jump_fail, $time); 
             $display ("  last-dco_cnt =%d  dco_cnt_3=%d,sc_cal_done=%b, sc_jump_fail=%b, all_jump_is_1=%b",dco_cnt,dco_cnt_3,sc_cal_done,sc_jump_fail,all_jump_is_1); 
             $display ("----------------------------------------------------------------"); 
     	      APB_RD_DEBUG(8'hB0>>2, dout, 32'd1425,'0 );  //dco_cnt
             $display ("  sc_cal_done (dco_cnt/sc)=%b / %b  ",dout[0],sc_cal_done); 
     	      APB_RD_DEBUG(8'hB4>>2, dout, 32'd712,'0 );  //dco_cnt
             $display ("  sc_jump_fail (dco_cnt/sc)=%b / %b  ",!dout[0],sc_jump_fail); 
             $display ("----------------------------------------------------------------"); 
          `endif
          //#500us;
          #1us;
       	  $finish;
      `endif
    end
    //		S_4:  begin
    //		     //------------------------------
    //		     //APB3  mission mode
    //		     //------------------------------
    //		     //APB_WR(8'hxx>>2,{17'd0,jump[3],jump[2],jump[1]} );
    //		          state <= S_4;
    //		  //end
    //		end
    //		S_5:  begin
    //		     //------------------------------
    //		     //Toggle reset to DPLL
    //		     //------------------------------
    //		     //APB_WR(8'hxx>>2,{17'd0,jump[3],jump[2],jump[1]} );
    //		  //        state <= S_4;
    //		  //end
    //		end
    default : state <= state;
  endcase
  end//else begin
end //always



//APB_WR(addr, data);
task APB_WR (input [6:0] addr, input [15:0] data);      
    begin
        daddr <= addr; di    <= data;
        den_int  <= '1; dwe  <= '1;  //psel <='1;//wr
        //if ( drdy)    daddr <= '0; di    <= '0;  den_int  <=  0; dwe<=  '0;
    end
endtask

task APB_RD (input [6:0] addr);      
    begin
       daddr <= addr; 
       den_int  <= '1; dwe  <= '0; //psel <='1; //rd
    `ifdef DEBUG_DISP
      @(negedge ref_clk);
         $display (" APB_RD_1       addr[%h] , den_int=%h dwe=%h ,time=%0t  //MML", addr,  den_int, dwe,  $time); 
     `endif
    end
endtask


`ifdef DEBUG_DISP
//APB_RD_DEBUG(daddr, dout);
task APB_RD_DEBUG (input [6:0] addr, input [15:0] rdata, input [15:0] exp,input [15:0] chk);      
begin
     @(posedge  ref_clk);
       daddr <= addr; rdata <= dout;
       den_int  <= '1; dwe  <= '0; //psel <='1; //rd
    `ifdef DEBUG_DISP
         @(posedge drdy);
      @(negedge ref_clk);
         $display ("   addr[%h][*4=%h] = %h time=%0t  //MML", addr, addr*4, dout, $time); 
         if ((dout & chk) == (exp & chk)) $display ("        addr[%h] = %h  exp=%h , chk=%h ,time=%0t  //MML", addr, dout, exp, chk, $time); 
         else                      $display (" APB_RD_DEBUG ERROR  addr[%h] = %h  exp=%h , chk=%h ,time=%0t  //MML", addr, dout, exp, chk, $time); 
       @(posedge ref_clk);
       daddr <= '0; rdata <= '0;
       den_int  <= '0; dwe  <= '0; //psel <='0; //rd
          //daddr <= '0; den_int  <= '0; psel ='0; dwe  <= '0; //rd
    //end
    `endif
      disable APB_RD_DEBUG; 
end
endtask
`endif

endmodule 
