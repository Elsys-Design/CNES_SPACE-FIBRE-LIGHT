///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.xx)
//  \   \         Description : Xilinx Function Simulation Library Component
//  /   /                  Phase Lock Loop Clock
// /___/   /\     Filename : PLLE2_ADV.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    10/12/11 - Initial version.
//    10/22/14 - Added #1 to $finish (CR 808642).
// End Revision


`timescale  1 ps / 1 ps

module PLLE2_ADV (
  CLKFBOUT,
  CLKOUT0,
  CLKOUT1,
  CLKOUT2,
  CLKOUT3,
  CLKOUT4,
  CLKOUT5,
  DO,
  DRDY,
  LOCKED,
  CLKFBIN,
  CLKIN1,
  CLKIN2,
  CLKINSEL,
  DADDR,
  DCLK,
  DEN,
  DI,
  DWE,
  PWRDWN,
  RST
);
  parameter BANDWIDTH = "OPTIMIZED";
  parameter COMPENSATION = "ZHOLD";
  parameter STARTUP_WAIT = "FALSE";
  parameter integer CLKOUT0_DIVIDE = 1;
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter integer DIVCLK_DIVIDE = 1;
  parameter integer CLKFBOUT_MULT = 5;
  parameter real CLKFBOUT_PHASE = 0.000;
  parameter real CLKIN1_PERIOD = 0.000;
  parameter real CLKIN2_PERIOD = 0.000;
  parameter real CLKOUT0_DUTY_CYCLE = 0.500;
  parameter real CLKOUT0_PHASE = 0.000;
  parameter real CLKOUT1_DUTY_CYCLE = 0.500;
  parameter real CLKOUT1_PHASE = 0.000;
  parameter real CLKOUT2_DUTY_CYCLE = 0.500;
  parameter real CLKOUT2_PHASE = 0.000;
  parameter real CLKOUT3_DUTY_CYCLE = 0.500;
  parameter real CLKOUT3_PHASE = 0.000;
  parameter real CLKOUT4_DUTY_CYCLE = 0.500;
  parameter real CLKOUT4_PHASE = 0.000;
  parameter real CLKOUT5_DUTY_CYCLE = 0.500;
  parameter real CLKOUT5_PHASE = 0.000;
  parameter [0:0] IS_CLKINSEL_INVERTED = 1'b0;
  parameter [0:0] IS_PWRDWN_INVERTED = 1'b0;
  parameter [0:0] IS_RST_INVERTED = 1'b0;
  parameter real REF_JITTER1 = 0.010;
  parameter real REF_JITTER2 = 0.010;
  localparam real VCOCLK_FREQ_MAX = 2133.000;
  localparam real VCOCLK_FREQ_MIN = 800.000;
  localparam real CLKIN_FREQ_MAX = 1066.000;
  localparam real CLKIN_FREQ_MIN = 19.000;

  output CLKFBOUT;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output DRDY;
  output LOCKED;
  output [15:0] DO;

  input CLKFBIN;
  input CLKIN1;
  input CLKIN2;
  input CLKINSEL;
  input DCLK;
  input DEN;
  input DWE;
  input PWRDWN;
  input RST;
  input [15:0] DI;
  input [6:0] DADDR;

  localparam VCOCLK_FREQ_TARGET = 1200;
  localparam M_MIN = 2;
  localparam M_MAX = 64;
  localparam D_MIN = 1;
  localparam D_MAX = 56;
  localparam O_MIN = 1;
  localparam O_MAX = 128;
  localparam O_MAX_HT_LT = 64;
  localparam MAX_FEEDBACK_DELAY = 10.0;
  localparam MAX_FEEDBACK_DELAY_SCALE = 1.0;

  tri0 GSR = glbl.GSR;
  tri1 p_up;
  wire glock; 
  reg locked_out_tmp = 0;
  reg startup_wait_sig;
  integer clkfb_div_fint;
  integer clkfb_val;
  integer clkfb_val1;
  integer clkfb_val2;
  integer clk0_val;
  integer clk0_val1;
  integer clk0_val2;
  integer clk1_val2;
  integer clk2_val2;
  integer clk3_val2;
  integer clk4_val2;
  integer clk5_val2;
  integer clk1_val;
  integer clk1_val1;
  integer clk2_val;
  integer clk2_val1;
  integer clk3_val;
  integer clk3_val1;
  integer clk4_val;
  integer clk4_val1;
  integer clk5_val;
  integer clk5_val1;
  reg [160:0] tmp_string;
  reg chk_ok;
  integer fb_delay_max;
  integer pll_lock_time;
  reg clkfb_out = 0;
  reg clkout0_out = 0;
  reg clkout1_out = 0;
  reg clkout2_out = 0;
  reg clkout3_out = 0;
  reg clkout4_out = 0;
  reg clkout5_out = 0;
  integer p_fb;
  integer p_fb_h;
  integer p_fb_r;
  integer p_fb_d;
  integer p_c0_dr;
  integer p_c1_dr;
  integer p_c2_dr;
  integer p_c3_dr;
  integer p_c4_dr;
  integer p_c5_dr;
  integer p_c0;
  integer p_c0_h;
  integer p_c0_r;
  integer p_c0_d;
  integer p_c1;
  integer p_c1_h;
  integer p_c1_r;
  integer p_c1_d;
  integer p_c2;
  integer p_c2_h;
  integer p_c2_r;
  integer p_c2_d;
  integer p_c3;
  integer p_c3_h;
  integer p_c3_r;
  integer p_c3_d;
  integer p_c4;
  integer p_c4_h;
  integer p_c4_r;
  integer p_c4_d;
  integer p_c5;
  integer p_c5_h;
  integer p_c5_r;
  integer p_c5_d;
  integer period_fb;
  reg clk0_gen;
  reg clk1_gen;
  reg clk2_gen;
  reg clk3_gen;
  reg clk4_gen;
  reg clk5_gen;
  reg clkfb_gen;
  reg clk0_gen_f;
  reg clk1_gen_f;
  reg clk2_gen_f;
  reg clk3_gen_f;
  reg clk4_gen_f;
  reg clk5_gen_f;
  reg clkfb_gen_f;
  reg sample_en;
  reg clk0_out;
  reg clk1_out;
  reg clk2_out;
  reg clk3_out;
  reg clk4_out;
  reg clk5_out;
  reg clkfbm1_out;
  integer i0, i1, i2, i3, i4, i5, ib;
  reg fb_delay_found_tmp;
  reg fb_delay_found;
  integer  clkin_period [4:0];
  reg [7:0] clkout_mux;
  integer lock_period_time;
  integer clkout_en_time;
  integer locked_en_time;
  integer lock_cnt_max;
  reg pwron_int;
  reg rst_in;
  real  clkin_chk_t1, clkin_chk_t2;
  real  clkin_chk_t1_r, clkin_chk_t2_r;
  integer   clkin_chk_t1_i, clkin_chk_t2_i;
  reg init_chk;
  real clkvco_freq_init_chk;
  reg pll_locked_tmp1;
  wire pll_locked_tmp2;
  reg lock_period;
  reg pll_locked_tm;
  time clkin_edge;
  time fb_delay, clkvco_delay, dly_tmp;
  integer clkin_lock_cnt;
  integer  clkfbm1_dly;
  real period_clkin;
  reg clkout_en0_tmp;
  reg clkout_en;
  reg clkout_en1;
  wire locked_out;
  integer  period_avg = 0;
  integer pchk_tmp1, pchk_tmp2;
  integer period_vco_target;
  time delay_edge;
  integer clkin_period_tmp_t;
  integer period_vco;
  reg clk0ps_en;
  reg clk1ps_en;
  reg clk2ps_en;
  reg clk3ps_en;
  reg clk4ps_en;
  reg clk5ps_en;
  reg clkfbm1ps_en;
  integer clk0_cnt;
  integer clk1_cnt;
  integer clk2_cnt;
  integer clk3_cnt;
  integer clk4_cnt;
  integer clk5_cnt;
  integer clkfb_cnt;
  reg clkfb_tst;
  integer j;
  
  assign clkin1_in = CLKIN1;
  assign clkin2_in = CLKIN2;
  assign clkfb_in = CLKFBIN;
  assign clkinsel_in = (CLKINSEL === IS_CLKINSEL_INVERTED) ? 0 : 1;
  assign rst_input_r = RST ^ IS_RST_INVERTED;
  assign pwrdwn_in = PWRDWN ^ IS_PWRDWN_INVERTED;
  assign LOCKED = locked_out_tmp;
  assign DRDY = 0;
  assign DO = 16'b0;

  initial begin
    #1;
    if ($realtime == 0) begin
      $display ("Simulator Resolution Error : Simulator resolution is set to a value greater than 1 ps.");
	   $display ("In order to simulate the PLLE2_ADV, the simulator resolution must be set to 1ps or smaller.");
	   #1 $finish;
    end
  end


  initial begin
    case (STARTUP_WAIT)
      "FALSE" : startup_wait_sig = 0;
      "TRUE" : startup_wait_sig = 1;
      default : begin
        $display("Attribute Syntax Error : The Attribute STARTUP_WAIT on PLLE2_ADV instance %m is set to %s.  Legal values for this attribute are FALSE or TRUE.", STARTUP_WAIT);
        #1 $finish;
      end
    endcase

    case (BANDWIDTH)
      "OPTIMIZED" : ;
      "HIGH" : ;
      "LOW" : ;
      default : begin
        $display("Attribute Syntax Error : The Attribute BANDWIDTH on PLLE2_ADV instance %m is set to %s.  Legal values for this attribute are OPTIMIZED, HIGH, or LOW.", BANDWIDTH);
        #1 $finish;
      end
    endcase

    case (COMPENSATION)
      "ZHOLD" : ;
      "BUF_IN" : ;
      "EXTERNAL" : ;
      "INTERNAL" : ;
      default : begin
        $display("Attribute Syntax Error : The Attribute COMPENSATION on PLLE2_ADV instance %m is set to %s.  Legal values for this attribute are ZHOLD, BUF_IN, EXTERNAL, or INTERNAL.", COMPENSATION);
        #1 $finish;
      end
    endcase

    clkfb_div_fint = CLKFBOUT_MULT;
    clkfb_val = DIVCLK_DIVIDE * 8;
    clkfb_val2 = clkfb_val * 2 -1;
    clkfb_val1 = 8; 

    clk0_val = DIVCLK_DIVIDE * CLKOUT0_DIVIDE;
    clk0_val2 = clk0_val * 2 -1;
    clk0_val1 = clkfb_div_fint;
    clk1_val = DIVCLK_DIVIDE * CLKOUT1_DIVIDE;
    clk1_val2 = clk1_val * 2 -1;
    clk1_val1 = clkfb_div_fint;
    clk2_val = DIVCLK_DIVIDE * CLKOUT2_DIVIDE;
    clk2_val2 = clk2_val * 2 -1;
    clk2_val1 = clkfb_div_fint;
    clk3_val = DIVCLK_DIVIDE * CLKOUT3_DIVIDE;
    clk3_val2 = clk3_val * 2 -1;
    clk3_val1 = clkfb_div_fint;
    clk4_val = DIVCLK_DIVIDE * CLKOUT4_DIVIDE;
    clk4_val2 = clk4_val * 2 -1;
    clk4_val1 = clkfb_div_fint;
    clk5_val = DIVCLK_DIVIDE * CLKOUT5_DIVIDE;
    clk5_val2 = clk5_val * 2 -1;
    clk5_val1 = clkfb_div_fint;

    tmp_string = "CLKOUT0_DIVIDE";
    chk_ok = para_int_range_chk(CLKOUT0_DIVIDE, tmp_string, 1, 128);
    tmp_string = "CLKOUT0_PHASE";
    chk_ok = para_real_range_chk(CLKOUT0_PHASE, tmp_string, -360.0, 360.0);
    tmp_string = "CLKOUT0_DUTY_CYCLE";
    chk_ok = para_real_range_chk(CLKOUT0_DUTY_CYCLE, tmp_string, 0.001, 0.999);
    tmp_string = "CLKOUT1_DIVIDE";
    chk_ok = para_int_range_chk(CLKOUT1_DIVIDE, tmp_string, 1, 128);
    tmp_string = "CLKOUT1_PHASE";
    chk_ok = para_real_range_chk(CLKOUT1_PHASE, tmp_string, -360.0, 360.0);
    tmp_string = "CLKOUT1_DUTY_CYCLE";
    chk_ok = para_real_range_chk(CLKOUT1_DUTY_CYCLE, tmp_string, 0.001, 0.999);
    tmp_string = "CLKOUT2_DIVIDE";
    chk_ok = para_int_range_chk(CLKOUT2_DIVIDE, tmp_string, 1, 128);
    tmp_string = "CLKOUT2_PHASE";
    chk_ok = para_real_range_chk(CLKOUT2_PHASE, tmp_string, -360.0, 360.0);
    tmp_string = "CLKOUT2_DUTY_CYCLE";
    chk_ok = para_real_range_chk(CLKOUT2_DUTY_CYCLE, tmp_string, 0.001, 0.999);
    tmp_string = "CLKOUT3_DIVIDE";
    chk_ok = para_int_range_chk(CLKOUT3_DIVIDE, tmp_string, 1, 128);
    tmp_string = "CLKOUT3_PHASE";
    chk_ok = para_real_range_chk(CLKOUT3_PHASE, tmp_string, -360.0, 360.0);
    tmp_string = "CLKOUT3_DUTY_CYCLE";
    chk_ok = para_real_range_chk(CLKOUT3_DUTY_CYCLE, tmp_string, 0.001, 0.999);
    tmp_string = "CLKOUT4_DIVIDE";
    chk_ok = para_int_range_chk(CLKOUT4_DIVIDE, tmp_string,  1, 128);
    tmp_string = "CLKOUT4_PHASE";
    chk_ok = para_real_range_chk(CLKOUT4_PHASE, tmp_string,  -360.0, 360.0);
    tmp_string = "CLKOUT4_DUTY_CYCLE";
    chk_ok = para_real_range_chk(CLKOUT4_DUTY_CYCLE, tmp_string,  0.001, 0.999);
    tmp_string = "CLKOUT5_DIVIDE";
    chk_ok = para_int_range_chk (CLKOUT5_DIVIDE, tmp_string, 1, 128);
    tmp_string = "CLKOUT5_PHASE";
    chk_ok = para_real_range_chk(CLKOUT5_PHASE, tmp_string, -360.0, 360.0);
    tmp_string = "CLKOUT5_DUTY_CYCLE";
    chk_ok = para_real_range_chk (CLKOUT5_DUTY_CYCLE, tmp_string,  0.001, 0.999);
    tmp_string = "CLKFBOUT_MULT";
    chk_ok = para_real_range_chk(CLKFBOUT_MULT, tmp_string, 2, 64);
    tmp_string = "CLKFBOUT_PHASE";
    chk_ok = para_real_range_chk(CLKFBOUT_PHASE, tmp_string, -360.0, 360.0);
        tmp_string = "DIVCLK_DIVIDE";
    chk_ok = para_int_range_chk (DIVCLK_DIVIDE, tmp_string, 1, D_MAX);
    tmp_string = "REF_JITTER1";
    chk_ok = para_real_range_chk (REF_JITTER1, tmp_string, 0.000, 0.999);
    tmp_string = "REF_JITTER2";
    chk_ok = para_real_range_chk (REF_JITTER2, tmp_string, 0.000, 0.999);

    tmp_string = "CLKOUT0_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT0_DIVIDE, CLKOUT0_DUTY_CYCLE, tmp_string);
    tmp_string = "CLKOUT5_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT5_DIVIDE, CLKOUT5_DUTY_CYCLE, tmp_string);
    tmp_string = "CLKOUT1_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT1_DIVIDE, CLKOUT1_DUTY_CYCLE, tmp_string);
    tmp_string = "CLKOUT2_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT2_DIVIDE, CLKOUT2_DUTY_CYCLE, tmp_string);
    tmp_string = "CLKOUT3_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT3_DIVIDE, CLKOUT3_DUTY_CYCLE, tmp_string);
    tmp_string = "CLKOUT4_DUTY_CYCLE";
    chk_ok = clkout_duty_chk (CLKOUT4_DIVIDE, CLKOUT4_DUTY_CYCLE, tmp_string);

    fb_delay_max = MAX_FEEDBACK_DELAY * MAX_FEEDBACK_DELAY_SCALE;
    period_vco_target = 1000000 / VCOCLK_FREQ_TARGET;
    pll_lock_time = 12;
    lock_period_time = 16;
    clkout_en_time = 10 + pll_lock_time; 
    locked_en_time = clkout_en_time + 20;  
    lock_cnt_max = locked_en_time + 16;
  end
 
  initial begin
    pwron_int = 1;
    #100000 pwron_int = 0;
  end

  assign CLKOUT5 =  clkout5_out;
  assign CLKOUT4 =  clkout4_out;
  assign CLKOUT3 =  clkout3_out;
  assign CLKOUT2 =  clkout2_out;
  assign CLKOUT1 =  clkout1_out;
  assign CLKOUT0 =  clkout0_out;
  assign CLKFBOUT = clkfb_out;

  assign #1 clkinsel_tmp = clkinsel_in;

  assign  glock = (startup_wait_sig) ? locked_out_tmp : 1;
  assign (weak1, strong0) glbl.PLL_LOCKG = (glock == 0) ? 0 : p_up;

  initial begin
    init_chk = 0;
    #1;
    init_chk = 1;
  end

  always @(clkinsel_in or posedge init_chk ) begin
    if ($time > 1 && rst_in === 0 && (clkinsel_tmp === 0 || clkinsel_tmp === 1)) begin
      $display("Input Error : Input clock can only be switched when RST=1. CLKINSEL on PLLE2_ADV instance %m at time %t changed when RST low, which should change at RST high.", $time);
      $finish;
    end

    clkin_chk_t1_r = 1000.000 / CLKIN_FREQ_MIN;
    clkin_chk_t1_i = $rtoi(1000.0 * clkin_chk_t1_r);
    clkin_chk_t1 = 0.001 * clkin_chk_t1_i;
    clkin_chk_t2_r = 1000.000 / CLKIN_FREQ_MAX;
    clkin_chk_t2_i = $rtoi(1000.0 * clkin_chk_t2_r);
    clkin_chk_t2 = 0.001 * clkin_chk_t2_i;

    if (clkinsel_in === 1 && $time > 1 || clkinsel_in !== 0 && init_chk == 1) begin
      if (CLKIN1_PERIOD > clkin_chk_t1 || CLKIN1_PERIOD < clkin_chk_t2) begin
        $display (" Attribute Syntax Error : The attribute CLKIN1_PERIOD is set to %f ns and out the allowed range %f ns to %f ns.", CLKIN1_PERIOD, clkin_chk_t2, clkin_chk_t1);

        $finish;
      end
    end 
    else if (clkinsel_in ===0 && $time > 1 || init_chk == 1 && clkinsel_tmp === 0 ) begin
      if (CLKIN2_PERIOD > clkin_chk_t1 || CLKIN2_PERIOD < clkin_chk_t2) begin
        $display (" Attribute Syntax Error : The attribute CLKIN2_PERIOD is set to %f ns and out the allowed range %f ns to %f ns.", CLKIN2_PERIOD, clkin_chk_t2, clkin_chk_t1);
        $finish;
      end
    end
    period_clkin =  (clkinsel_in === 0) ? CLKIN2_PERIOD : CLKIN1_PERIOD;
    clkvco_freq_init_chk =  (1000.0 * CLKFBOUT_MULT) / (period_clkin * DIVCLK_DIVIDE);
    if (clkvco_freq_init_chk > VCOCLK_FREQ_MAX || clkvco_freq_init_chk < VCOCLK_FREQ_MIN) begin
     if (clkinsel_tmp === 0 && $time > 1 || clkinsel_tmp === 0 && init_chk === 1) begin
      $display (" Attribute Syntax Error : The calculation of VCO frequency=%f Mhz. This exceeds the permitted VCO frequency range of %f Mhz to %f Mhz. The VCO frequency is calculated with formula: VCO frequency =  CLKFBOUT_MULT / (DIVCLK_DIVIDE * CLKIN2_PERIOD). Please adjust the attributes to the permitted VCO frequency range.", clkvco_freq_init_chk, VCOCLK_FREQ_MIN, VCOCLK_FREQ_MAX);
      $finish;
    end
    else if (clkinsel_tmp === 1 && $time > 1 || clkinsel_tmp !== 0 && init_chk === 1) begin
      $display (" Attribute Syntax Error : The calculation of VCO frequency=%f Mhz. This exceeds the permitted VCO frequency range of %f Mhz to %f Mhz. The VCO frequency is calculated with formula: VCO frequency =  CLKFBOUT_MULT / (DIVCLK_DIVIDE * CLKIN1_PERIOD). Please adjust the attributes to the permitted VCO frequency range.", clkvco_freq_init_chk, VCOCLK_FREQ_MIN, VCOCLK_FREQ_MAX);
      $finish;
    end
   end
  end

  assign  init_trig = 1;
  assign clkpll_r = (clkinsel_in) ? clkin1_in : clkin2_in;
  assign pwrdwn_in1 =  (pwrdwn_in === 1 || pwron_int == 1) ? 1 : 0; 
  assign rst_input  =  (rst_input_r === 1 | pwrdwn_in1 === 1) ? 1 : 0;

  always @(posedge clkpll_r or posedge rst_input)
    if (rst_input)
       rst_in <= 1;
    else
       rst_in <= rst_input ;

  always @(posedge clkpll_r or posedge rst_in )
    if (rst_in)
    begin
      clkin_period[0] <= period_vco_target;
      clkin_period[1] <= period_vco_target;
      clkin_period[2] <= period_vco_target;
      clkin_period[3] <= period_vco_target;
      clkin_period[4] <= period_vco_target;
      clkin_lock_cnt <= 0;
      pll_locked_tm <= 0;
      lock_period <= 0;
      pll_locked_tmp1 <= 0;
      clkout_en0_tmp <= 0;
      clkin_edge <= 0;
      sample_en <= 1;
    end
    else begin
     if (sample_en == 1) begin
      clkin_edge <= $time;
      if (clkin_edge != 0) begin 
         clkin_period[4] <= clkin_period[3];
         clkin_period[3] <= clkin_period[2];
         clkin_period[2] <= clkin_period[1];
         clkin_period[1] <= clkin_period[0];
         clkin_period[0] <= $time - clkin_edge;
      end
         
      if ( (clkin_lock_cnt < lock_cnt_max) && fb_delay_found )
         clkin_lock_cnt <= clkin_lock_cnt + 1;

      if ( clkin_lock_cnt >= pll_lock_time )
         pll_locked_tm <= 1;

      if ( clkin_lock_cnt == lock_period_time )
         lock_period <= 1;

      if (clkin_lock_cnt >= clkout_en_time && pll_locked_tm == 1)
         clkout_en0_tmp <= 1;
      
      if (clkin_lock_cnt >= locked_en_time && clkout_en == 1)
         pll_locked_tmp1 <= 1;
 
      if (pll_locked_tmp2 == 1 && pll_locked_tmp1 == 1)
         sample_en <= 0;
     end
    end


  assign locked_out = (pll_locked_tmp1 && pll_locked_tmp2 ) ? 1 : 0;
  assign pll_locked_tmp2 = (clk0ps_en & clk1ps_en & clk2ps_en & clk3ps_en
                           & clk4ps_en & clk5ps_en&  clkfbm1ps_en);

 always @(posedge pll_locked_tmp1)
  if (clkinsel_in === 0) begin
     pchk_tmp1 = CLKIN2_PERIOD * 1100;
     pchk_tmp2 = CLKIN2_PERIOD * 900;
     if (period_avg > pchk_tmp1 || period_avg < pchk_tmp2) begin
       $display("Error : input CLKIN2 period and attribute CLKIN2_PERIOD on PLLE2_ADV instance %m are not same.");
       $finish;
     end
  end
  else begin
    pchk_tmp1 = CLKIN1_PERIOD * 1100;
    pchk_tmp2 = CLKIN1_PERIOD * 900;
    if (period_avg > pchk_tmp1 || period_avg < pchk_tmp2) begin
      $display("Error : input CLKIN1 period and attribute CLKIN1_PERIOD on PLLE2_ADV instance %m are not same.");
      $finish;
    end
 end
			   

  always @(rst_in or locked_out)
     if (rst_in == 1) 
           locked_out_tmp <= #1000 0;
     else
        locked_out_tmp <= locked_out;

  always @(clkout_en0_tmp  or rst_in)
  if (rst_in == 1)
    clkout_en1  = 0;
  else
    clkout_en1 <= #(clkvco_delay) clkout_en0_tmp;

  always @(clkout_en1 or rst_in )
  if (rst_in)
    clkout_en = 0;
  else
    clkout_en =  clkout_en1;

  always @(clkin_period[0] or clkin_period[1] or clkin_period[2] or 
           clkin_period[3] or clkin_period[4] or period_avg ) begin
    if (clkin_period[0] > clkin_period[1])
        clkin_period_tmp_t = clkin_period[0] - clkin_period[1];
    else
        clkin_period_tmp_t = clkin_period[1] - clkin_period[0];

    if ( (clkin_period[0] != period_avg) && (clkin_period[0] < 1.5 * period_avg || clkin_period_tmp_t <= 300) ) 
      period_avg = (clkin_period[0] + clkin_period[1] + clkin_period[2] 
                 + clkin_period[3] + clkin_period[4])/5;
  end

  always @(period_avg or lock_period or rst_in)
  if (rst_in == 1) begin
    p_fb = 0;
    p_fb_h = 0;
    p_fb_r = 0;
    p_fb_d = 0;
    p_c0 = 0;
    p_c0_h = 0;
    p_c0_r = 0;
    p_c0_d = 0;
    p_c1 = 0;
    p_c1_h = 0;
    p_c1_r = 0;
    p_c1_d = 0;
    p_c2 = 0;
    p_c2_h = 0;
    p_c2_r = 0;
    p_c2_d = 0;
    p_c3 = 0;
    p_c3_h = 0;
    p_c3_r = 0;
    p_c3_d = 0;
    p_c4 = 0;
    p_c4_h = 0;
    p_c4_r = 0;
    p_c4_d = 0;
    p_c5 = 0;
    p_c5_h = 0;
    p_c5_r = 0;
    p_c5_d = 0;
    clkvco_delay = 0;
    dly_tmp = 0;
    period_fb = 0;
    period_vco = 0;
    clkfbm1_dly = 0;
    p_c0_dr = 0;
    p_c1_dr = 0;
    p_c2_dr = 0;
    p_c3_dr = 0;
    p_c4_dr = 0;
    p_c5_dr = 0;
  end 
  else
  if (period_avg > 0  && lock_period == 1) begin
    period_fb = period_avg * DIVCLK_DIVIDE;
    period_vco = period_fb / CLKFBOUT_MULT;
    clkfbm1_dly = $rtoi((CLKFBOUT_PHASE * period_fb) / 360.0);
    dly_tmp = fb_delay + clkfbm1_dly;
    if (dly_tmp == 0)
          clkvco_delay = 0;
    else if ( dly_tmp <= period_fb)
          clkvco_delay = period_fb - dly_tmp;
    else
          clkvco_delay = period_fb - dly_tmp % period_fb ;
    p_fb = period_fb;
    p_fb_h = period_fb / 2;
    p_fb_r = period_fb - p_fb_h;
    if ( fb_delay <= period_fb)
          p_fb_d = period_fb - fb_delay;
    else
          p_fb_d = period_fb - fb_delay % period_fb ;
    p_c0 = (period_fb * CLKOUT0_DIVIDE) / CLKFBOUT_MULT;
    p_c0_h = p_c0  * CLKOUT0_DUTY_CYCLE;
    p_c0_r =  p_c0 - p_c0_h;
    p_c0_dr = $rtoi((CLKOUT0_PHASE * p_c0) / 360.0) + clkvco_delay % p_c0;
    if (p_c0_dr < 0)
      p_c0_d = p_c0 + p_c0_dr % p_c0;
    else
      p_c0_d = p_c0_dr % p_c0;
    p_c1 = (period_fb * CLKOUT1_DIVIDE) / CLKFBOUT_MULT;
    p_c1_h = p_c1  * CLKOUT1_DUTY_CYCLE;
    p_c1_r =  p_c1 - p_c1_h;
    p_c1_dr = $rtoi((CLKOUT1_PHASE * p_c1) / 360.0) + clkvco_delay % p_c1;
    if (p_c1_dr < 0)
      p_c1_d = p_c1 + p_c1_dr % p_c1;
    else
      p_c1_d = p_c1_dr % p_c1;
    p_c2 = (period_fb * CLKOUT2_DIVIDE) / CLKFBOUT_MULT;
    p_c2_h = p_c2  * CLKOUT2_DUTY_CYCLE;
    p_c2_r =  p_c2 - p_c2_h;
    p_c2_dr = $rtoi((CLKOUT2_PHASE * p_c2) / 360.0) + clkvco_delay % p_c2;
    if (p_c2_dr < 0)
      p_c2_d = p_c2 + p_c2_dr % p_c2;
    else
      p_c2_d = p_c2_dr % p_c2;
    p_c3 = (period_fb * CLKOUT3_DIVIDE) / CLKFBOUT_MULT;
    p_c3_h = p_c3  * CLKOUT3_DUTY_CYCLE;
    p_c3_r =  p_c3 - p_c3_h;
    p_c3_dr = $rtoi((CLKOUT3_PHASE * p_c3) / 360.0) + clkvco_delay % p_c3;
    if (p_c3_dr < 0)
      p_c3_d = p_c3 + p_c3_dr % p_c3;
    else
      p_c3_d = p_c3_dr % p_c3;
    p_c4 = (period_fb * CLKOUT4_DIVIDE) / CLKFBOUT_MULT;
    p_c4_h = p_c4  * CLKOUT4_DUTY_CYCLE;
    p_c4_r =  p_c4 - p_c4_h;
    p_c4_dr = $rtoi((CLKOUT4_PHASE * p_c4) / 360.0) + clkvco_delay % p_c4;
    if (p_c4_dr < 0)
      p_c4_d = p_c4 + p_c4_dr % p_c4;
    else
      p_c4_d = p_c4_dr % p_c4;
    p_c5 = (period_fb * CLKOUT5_DIVIDE) / CLKFBOUT_MULT;
    p_c5_h = p_c5  * CLKOUT5_DUTY_CYCLE;
    p_c5_r =  p_c5 - p_c5_h;
    p_c5_dr = $rtoi((CLKOUT5_PHASE * p_c5) / 360.0) + clkvco_delay % p_c5;
    if (p_c5_dr < 0)
      p_c5_d = p_c5 + p_c5_dr % p_c5;
    else
      p_c5_d = p_c5_dr % p_c5;
  end

  always @(rst_in)
    if (rst_in) begin
      assign clkout_mux = 8'b0;
      assign clk0_out = 0;
      assign clk1_out = 0;
      assign clk2_out = 0;
      assign clk3_out = 0;
      assign clk4_out = 0;
      assign clk5_out = 0;
      assign clkfbm1_out = 0;
    end
    else begin
      deassign clkout_mux;
      deassign clk0_out;
      deassign clk1_out;
      deassign clk2_out;
      deassign clk3_out;
      deassign clk4_out;
      deassign clk5_out;
      deassign clkfbm1_out;
    end

    always @(posedge clkout_en or posedge rst_in)
    if (rst_in == 1) begin
      clk0ps_en <= 0;
      clk1ps_en <= 0;
      clk2ps_en <= 0;
      clk3ps_en <= 0;
      clk4ps_en <= 0;
      clk5ps_en <= 0;
      clkfbm1ps_en <= 0;
    end
    else begin
      clk0ps_en <= #p_c0_d 1;
      clk1ps_en <= #p_c1_d 1;
      clk2ps_en <= #p_c2_d 1;
      clk3ps_en <= #p_c3_d 1;
      clk4ps_en <= #p_c4_d 1;
      clk5ps_en <= #p_c5_d 1;
      clkfbm1ps_en <= #p_fb_d 1;
    end

    always @(posedge clkpll_r or posedge rst_in)
    if (rst_in) begin
        clk0_cnt <= 0;
        clk1_cnt <= 0;
        clk2_cnt <= 0;
        clk3_cnt <= 0;
        clk4_cnt <= 0;
        clk5_cnt <= 0;
        clkfb_cnt <= 0;
        clk0_gen <= 0;
        clk1_gen <= 0;
        clk2_gen <= 0;
        clk3_gen <= 0;
        clk4_gen <= 0;
        clk5_gen <= 0;
        clkfb_gen <= 0;
    end
    else begin
      if (clkout_en0_tmp == 1 ) begin
        if (clk0_cnt < clk0_val2)
           clk0_cnt <= clk0_cnt + 1;
        else 
           clk0_cnt <= 0; 
    
        if (clk0_cnt >= clk0_val )
           clk0_gen <= 0;
        else
           clk0_gen <= 1;
      end
      else begin
         clk0_cnt <= 0;
         clk0_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clk1_cnt < clk1_val2)
           clk1_cnt <= clk1_cnt + 1;
        else
           clk1_cnt <= 0;

        if (clk1_cnt >= clk1_val )
           clk1_gen <= 0;
        else
           clk1_gen <= 1;
      end
      else begin
         clk1_cnt <= 0;
         clk1_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clk2_cnt < clk2_val2)
           clk2_cnt <= clk2_cnt + 1;
        else
           clk2_cnt <= 0;

        if (clk2_cnt >= clk2_val )
           clk2_gen <= 0;
        else
           clk2_gen <= 1;
      end
      else begin
         clk2_cnt <= 0;
         clk2_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clk3_cnt < clk3_val2)
           clk3_cnt <= clk3_cnt + 1;
        else
           clk3_cnt <= 0;

        if (clk3_cnt >= clk3_val )
           clk3_gen <= 0;
        else
           clk3_gen <= 1;
      end
      else begin
         clk3_cnt <= 0;
         clk3_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clk4_cnt < clk4_val2)
           clk4_cnt <= clk4_cnt + 1;
        else
           clk4_cnt <= 0;

        if (clk4_cnt >= clk4_val )
           clk4_gen <= 0;
        else
           clk4_gen <= 1;
      end
      else begin
         clk4_cnt <= 0;
         clk4_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clk5_cnt < clk5_val2)
           clk5_cnt <= clk5_cnt + 1;
        else
           clk5_cnt <= 0;

        if (clk5_cnt >= clk5_val )
           clk5_gen <= 0;
        else
           clk5_gen <= 1;
      end
      else begin
         clk5_cnt <= 0;
         clk5_gen <= 0;
      end

      if (clkout_en0_tmp == 1 ) begin
        if (clkfb_cnt < clkfb_val2)
           clkfb_cnt <= clkfb_cnt + 1;
        else
           clkfb_cnt <= 0;

        if (clkfb_cnt >= clkfb_val)
           clkfb_gen <= 0;
        else
           clkfb_gen <= 1;
      end
      else begin
         clkfb_cnt <= 0;
         clkfb_gen <= 0;
      end
    end
   
    always @(clk0_gen or posedge rst_in)
    if (rst_in == 1)
      clk0_gen_f <= 0;
    else
      clk0_gen_f <= #p_c0_d clk0_gen;

    always @(clk1_gen or posedge rst_in)
    if (rst_in == 1)
      clk1_gen_f <= 0;
    else
      clk1_gen_f <= #p_c1_d clk1_gen;

    always @(clk2_gen or posedge rst_in)
    if (rst_in == 1)
      clk2_gen_f <= 0;
    else
      clk2_gen_f <= #p_c2_d clk2_gen;

    always @(clk3_gen or posedge rst_in)
    if (rst_in == 1)
      clk3_gen_f <= 0;
    else
      clk3_gen_f <= #p_c3_d clk3_gen;

    always @(clk4_gen or posedge rst_in)
    if (rst_in == 1)
      clk4_gen_f <= 0;
    else
      clk4_gen_f <= #p_c4_d clk4_gen;

    always @(clk5_gen or posedge rst_in)
    if (rst_in == 1)
      clk5_gen_f <= 0;
    else
      clk5_gen_f <= #p_c5_d clk5_gen;


    always @(clkfb_gen or posedge rst_in)
    if (rst_in == 1)
      clkfb_gen_f  <= 0;
    else
      clkfb_gen_f <= #p_fb_d clkfb_gen;

    always @(posedge clk0_gen_f or negedge clk0_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk0_out <= 0;
    else
      if (clk0ps_en == 1 ) begin
         for (i0 = 0; i0 < clk0_val1; i0=i0+1) begin
            clk0_out <= 1;
            #p_c0_h clk0_out <= 0;
            #p_c0_r;
         end
      end
      else
        clk0_out <= 0;

    always @(posedge clk1_gen_f or negedge clk1_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk1_out <= 0;
    else
      if (clk1ps_en == 1 ) begin
         for (i1 = 0; i1 < clk1_val1; i1=i1+1) begin
            clk1_out <= 1;
            #p_c1_h clk1_out <= 0;
            #p_c1_r;
         end
      end
      else
        clk1_out <= 0;

    always @(posedge clk2_gen_f or negedge clk2_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk2_out <= 0;
    else
      if (clk2ps_en == 1 ) begin
         for (i2 = 0; i2 < clk2_val1; i2=i2+1) begin
            clk2_out <= 1;
            #p_c2_h clk2_out <= 0;
            #p_c2_r;
         end
      end
      else
        clk2_out <= 0;

    always @(posedge clk3_gen_f or negedge clk3_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk3_out <= 0;
    else
      if (clk3ps_en == 1 ) begin
         for (i3 = 0; i3 < clk3_val1; i3=i3+1) begin
            clk3_out <= 1;
            #p_c3_h clk3_out <= 0;
            #p_c3_r;
         end
      end
      else
        clk3_out <= 0;

    always @(posedge clk4_gen_f or negedge clk4_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk4_out <= 0;
    else
      if (clk4ps_en == 1 ) begin
         for (i4 = 0; i4 < clk4_val1; i4=i4+1) begin
            clk4_out <= 1;
            #p_c4_h clk4_out <= 0;
            #p_c4_r;
         end
      end
      else
        clk4_out <= 0;

    always @(posedge clk5_gen_f or negedge clk5_gen_f or posedge rst_in)
    if (rst_in == 1)
       clk5_out <= 0;
    else
      if (clk5ps_en == 1 ) begin
         for (i5 = 0; i5 < clk5_val1; i5=i5+1) begin
            clk5_out <= 1;
            #p_c5_h clk5_out <= 0;
            #p_c5_r;
         end
      end
      else
        clk5_out <= 0;

    always @(posedge clkfb_gen_f or negedge clkfb_gen_f or posedge rst_in)
    if (rst_in == 1)
       clkfbm1_out <= 0;
    else
      if (clkfbm1ps_en == 1 ) begin
         for (ib = 0; ib < clkfb_val1; ib=ib+1) begin
            clkfbm1_out <= 1;
            #p_fb_h clkfbm1_out <= 0;
            #p_fb_r;
         end
      end
      else
        clkfbm1_out <= 0;

   always @(clk0_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout0_out =  clk0_out;
     else
          clkout0_out = clkfb_tst;

   always @(clk1_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout1_out =  clk1_out;
     else
          clkout1_out = clkfb_tst;

   always @(clk2_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout2_out =  clk2_out;
     else
          clkout2_out = clkfb_tst;

   always @(clk3_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout3_out =  clk3_out;
     else
          clkout3_out = clkfb_tst;

   always @(clk4_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout4_out =  clk4_out;
     else
          clkout4_out = clkfb_tst;

   always @(clk5_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkout5_out =  clk5_out;
     else
          clkout5_out = clkfb_tst;


   always @(clkfbm1_out or clkfb_tst or fb_delay_found)
     if (fb_delay_found == 1)
          clkfb_out =  clkfbm1_out;
     else
          clkfb_out = clkfb_tst;

  always @(posedge clkpll_r )
    if (fb_delay_found_tmp == 0 && pwron_int == 0 && rst_in == 0) begin
         clkfb_tst <=  1'b1;
    end
    else
         clkfb_tst <=  1'b0;
  
  always @( posedge clkfb_tst or posedge rst_in )
    if (rst_in)
      delay_edge  <= 0;
    else 
      delay_edge <= $time;

  always @(posedge clkfb_in or posedge rst_in ) 
    if (rst_in) begin
      fb_delay  <= 0;
      fb_delay_found_tmp <= 0;
    end
    else 
      if (fb_delay_found_tmp ==0 ) begin
        if ( delay_edge != 0)
          fb_delay <= ($time - delay_edge);
        else
          fb_delay <= 0;
        fb_delay_found_tmp <=  1;
      end

  always @(rst_in)
    if (rst_in)
       assign fb_delay_found = 0;
    else
       deassign fb_delay_found;

  always @(fb_delay_found_tmp or clkvco_delay )
    if (clkvco_delay == 0) 
       fb_delay_found <= #1000 fb_delay_found_tmp;
    else
       fb_delay_found <= #(clkvco_delay) fb_delay_found_tmp;

  always @(fb_delay)
    if (rst_in==0 && (fb_delay/1000.0 > fb_delay_max)) begin
      $display("Warning : The feedback delay on PLLE2_ADV instance %m at time %t is %f ns. It is over the maximun value %f ns.", $time, fb_delay / 1000.0, fb_delay_max);
    end

  // tasks

  function  clkout_duty_chk;
  input  CLKOUT_DIVIDE;
  input  CLKOUT_DUTY_CYCLE;
  input reg [160:0] CLKOUT_DUTY_CYCLE_N; 
  integer CLKOUT_DIVIDE, step_tmp;
  real CLKOUT_DUTY_CYCLE;
  real CLK_DUTY_CYCLE_MIN, CLK_DUTY_CYCLE_MAX, CLK_DUTY_CYCLE_STEP;
  real CLK_DUTY_CYCLE_MIN_rnd;
  reg clk_duty_tmp_int;
  begin
    if (CLKOUT_DIVIDE > O_MAX_HT_LT) begin
      CLK_DUTY_CYCLE_MIN = 1.0 * (CLKOUT_DIVIDE - O_MAX_HT_LT)/CLKOUT_DIVIDE;
      CLK_DUTY_CYCLE_MAX = (O_MAX_HT_LT + 0.5)/CLKOUT_DIVIDE;
      CLK_DUTY_CYCLE_MIN_rnd = CLK_DUTY_CYCLE_MIN;
    end
    else begin
      if (CLKOUT_DIVIDE == 1) begin
        CLK_DUTY_CYCLE_MIN = 0.0;
        CLK_DUTY_CYCLE_MIN_rnd = 0.0;
      end
      else begin
        step_tmp = 1000 / CLKOUT_DIVIDE;
        CLK_DUTY_CYCLE_MIN_rnd = step_tmp / 1000.0;
        CLK_DUTY_CYCLE_MIN = 1.0 /CLKOUT_DIVIDE;
      end
      CLK_DUTY_CYCLE_MAX = 1.0;
    end

    if (CLKOUT_DUTY_CYCLE > CLK_DUTY_CYCLE_MAX || CLKOUT_DUTY_CYCLE < CLK_DUTY_CYCLE_MIN_rnd) begin
      $display(" Attribute Syntax Warning : %s is set to %f on instance %m and is not in the allowed range %f to %f.", CLKOUT_DUTY_CYCLE_N, CLKOUT_DUTY_CYCLE, CLK_DUTY_CYCLE_MIN, CLK_DUTY_CYCLE_MAX );
    end

    clk_duty_tmp_int = 0;
    CLK_DUTY_CYCLE_STEP = 0.5 / CLKOUT_DIVIDE;
    for (j = 0; j < (2 * CLKOUT_DIVIDE - CLK_DUTY_CYCLE_MIN/CLK_DUTY_CYCLE_STEP); j = j + 1)
        if (((CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j) - CLKOUT_DUTY_CYCLE) > -0.001 && 
             ((CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j) - CLKOUT_DUTY_CYCLE) < 0.001)
            clk_duty_tmp_int = 1;

    if ( clk_duty_tmp_int != 1) begin
      $display(" Attribute Syntax Warning : %s is set to %f on instance %m and is  not an allowed value. Allowed values are:",  CLKOUT_DUTY_CYCLE_N, CLKOUT_DUTY_CYCLE);
      for (j = 0; j < (2 * CLKOUT_DIVIDE - CLK_DUTY_CYCLE_MIN/CLK_DUTY_CYCLE_STEP); j = j + 1)
       $display("%f", CLK_DUTY_CYCLE_MIN + CLK_DUTY_CYCLE_STEP * j);
    end

    clkout_duty_chk = 1'b1;
  end
  endfunction

  function  para_int_range_chk;
  input  para_in; 
  input reg [160:0] para_name;
  input  range_low;
  input  range_high;
  integer para_in;
  integer range_low;
  integer  range_high;
  begin
    if ( para_in < range_low || para_in > range_high) begin
      $display("Attribute Syntax Error : The Attribute %s on PLLE2_ADV instance %m is set to %d.  Legal values for this attribute are %d to %d.", para_name, para_in, range_low, range_high);
      $finish;
    end
    para_int_range_chk = 1'b1;
  end
  endfunction

  function  para_real_range_chk;
  input  para_in;
  input reg [160:0] para_name;
  input  range_low;
  input  range_high;
  real para_in;
  real range_low;
  real range_high;
  begin
    if ( para_in < range_low || para_in > range_high) begin
      $display("Attribute Syntax Error : The Attribute %s on PLLE2_ADV instance %m is set to %f.  Legal values for this attribute are %f to %f.", para_name, para_in, range_low, range_high);
      $finish;
    end
    para_real_range_chk = 1'b0;
  end
  endfunction


endmodule
