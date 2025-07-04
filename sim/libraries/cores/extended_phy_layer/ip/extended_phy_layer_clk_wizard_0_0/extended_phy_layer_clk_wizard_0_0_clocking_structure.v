// (c) Copyright 2017-2018, 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.

`timescale 1ps/1ps
module extended_phy_layer_clk_wizard_0_0_clocking_structure #(
   parameter  C_PRIMITIVE                            =  "MMCM",
   parameter  C_BANDWIDTH                            =  "LOW",
   parameter  C_CLKFBOUT_MULT                        =  0,
   parameter  C_CLKFBOUT_FRACT                       =  0,
   parameter  C_CLKFBOUT_PHASE                       =  0,
   parameter  C_CLKIN1_PERIOD                        =  52,
   parameter  C_CLKIN2_PERIOD                        =  0,   
   parameter  C_CLKOUT1_DIVIDE                       =  0,   
   parameter  C_CLKOUT1_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT1_ACTUAL_PHASE                 =  8, 
   parameter  C_CLKOUT2_DIVIDE                       =  0,   
   parameter  C_CLKOUT2_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT2_ACTUAL_PHASE                 =  8, 
   parameter  C_CLKOUT3_DIVIDE                       =  0,   
   parameter  C_CLKOUT3_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT3_ACTUAL_PHASE                 =  8,
   parameter  C_CLKOUT4_DIVIDE                       =  0,   
   parameter  C_CLKOUT4_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT4_ACTUAL_PHASE                 =  8,
   parameter  C_CLKOUT5_DIVIDE                       =  0,   
   parameter  C_CLKOUT5_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT5_ACTUAL_PHASE                 =  8, 
   parameter  C_CLKOUT6_DIVIDE                       =  0,   
   parameter  C_CLKOUT6_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT6_ACTUAL_PHASE                 =  8, 
   parameter  C_CLKOUT7_DIVIDE                       =  0,   
   parameter  C_CLKOUT7_ACTUAL_DUTY_CYCLE            =  1'b0,
   parameter  C_CLKOUT7_ACTUAL_PHASE                 =  8,
   parameter  C_COMPENSATION                         =  8, 
   parameter  C_DESKEW_DELAY1                        =  0,
   parameter  C_DESKEW_IN1                           =  0,
   parameter  C_DESKEW_FB1                           =  0,
   parameter  C_DESKEW_DELAY2                        =  0,
   parameter  C_DESKEW_IN2                           =  0,
   parameter  C_DESKEW_FB2                           =  0,
   parameter  C_DESKEW_DELAY_EN1                     =  "FALSE",
   parameter  C_DESKEW_DELAY_EN2                     =  "FALSE",
   parameter  C_DESKEW_DELAY_PATH1                   =  "FALSE",
   parameter  C_DESKEW_DELAY_PATH2                   =  "FALSE",
   parameter  C_DESKEW_LOCK_CIRCUIT_EN1              =  0,
   parameter  C_DESKEW_LOCK_CIRCUIT_EN2              =  0,
   parameter  C_ZHOLD                                =  "FALSE",
   parameter  C_NUMMBUFGCE                           =  0,
   parameter  C_AUTO_NUMMBUFGCE                           =  0,
   parameter  C_AUTO_PRIMITIVE                           =  "MMCM",
   parameter  C_CE_TYPE                                  = "HARDSYNC",
   parameter  C_BUFGCE_DIV_CE_TYPE                       = "HARDSYNC",
   parameter  C_CE_SYNC_EXT                               =  0,
   parameter  C_SAFECLOCK_STARTUP_MODE                        =  "DESKEW_MODE",
   parameter  C_NUMBUFG                                   =  0,
   parameter  C_NUMBUFGCE                                 =  0,
   parameter  C_DIVIDE1_AUTO                              =  1,
   parameter  C_DIVIDE2_AUTO                              =  1,
   parameter  C_DIVIDE3_AUTO                              =  1,
   parameter  C_DIVIDE4_AUTO                              =  1,
   parameter  C_DIVIDE5_AUTO                              =  1,
   parameter  C_DIVIDE6_AUTO                              =  1,
   parameter  C_DIVIDE7_AUTO                              =  1,
   parameter  C_CLK_TREE1                                 =  0,
   parameter  C_CLK_TREE2                                 =  0,
   parameter  C_CLK_TREE3                                 =  0,
   parameter  C_CLK_TREE4                                 =  0,
   parameter  C_CLK_TREE5                                 =  0,
   parameter  C_CLK_TREE6                                 =  0,
   parameter  C_CLK_TREE7                                 =  0,
   parameter  C_MAXCOUNT_DESKEW1                          =  0,
   parameter  C_MAXCOUNT_DESKEW2                          =  0,
   parameter  C_DIVCLK_DIVIDE                        =  8,
   parameter  C_CLKOUT1_DYN_PS                       =  8,
   parameter  C_CLKOUT2_DYN_PS                       =  8,
   parameter  C_CLKOUT3_DYN_PS                       =  8, 
   parameter  C_CLKOUT4_DYN_PS                       =  8, 
   parameter  C_CLKOUT5_DYN_PS                       =  8, 
   parameter  C_CLKOUT6_DYN_PS                       =  8,    
   parameter  C_CLKOUT7_DYN_PS                       =  8,    
   parameter  C_CLKOUT1_USED                       =  8,
   parameter  C_CLKOUT2_USED                       =  8,
   parameter  C_CLKOUT3_USED                       =  8, 
   parameter  C_CLKOUT4_USED                       =  8, 
   parameter  C_CLKOUT5_USED                       =  8, 
   parameter  C_CLKOUT6_USED                       =  8,    
   parameter  C_CLKOUT7_USED                       =  8,    
   parameter  C_CLKOUT1_DRIVES                       =  10,
   parameter  C_CLKOUT2_DRIVES                       =  10,
   parameter  C_CLKOUT3_DRIVES                       =  10, 
   parameter  C_CLKOUT4_DRIVES                       =  10, 
   parameter  C_CLKOUT5_DRIVES                       =  10, 
   parameter  C_CLKOUT6_DRIVES                       =  10,    
   parameter  C_CLKOUT7_DRIVES                       =  10,    
   parameter  C_CLKOUT1_MBUFGCE_MODE                 =  8,
   parameter  C_CLKOUT2_MBUFGCE_MODE                 =  8,
   parameter  C_CLKOUT3_MBUFGCE_MODE                 =  8, 
   parameter  C_CLKOUT4_MBUFGCE_MODE                 =  8, 
   parameter  C_CLKOUT5_MBUFGCE_MODE                 =  8, 
   parameter  C_CLKOUT6_MBUFGCE_MODE                 =  8,    
   parameter  C_CLKOUT7_MBUFGCE_MODE                 =  8,    
   parameter  C_CLK_OUT1_PORT                        =  8,
   parameter  C_CLK_OUT2_PORT                        =  8,
   parameter  C_CLK_OUT3_PORT                        =  8, 
   parameter  C_CLK_OUT4_PORT                        =  8, 
   parameter  C_CLK_OUT5_PORT                        =  8, 
   parameter  C_CLK_OUT6_PORT                        =  8,    
   parameter  C_CLK_OUT7_PORT                        =  8,    
   parameter  C_CLKOUTFB_PHASE_CTRL                         =  8,   
   parameter  C_REF_JITTER1                          =  8,   
   parameter  C_REF_JITTER2                          =  8,
   parameter  C_USE_SPREAD_SPECTRUM                  =  8,
   parameter  C_CLKIN1_IBUF                  =  8,
   parameter  C_CLKIN1_BUFG                  =  8,
   parameter  C_CLKIN1_IBUFDS                  =  8,
   parameter  C_CLKIN2_IBUF                  =  8,
   parameter  C_CLKIN2_BUFG                  =  8,
   parameter  C_CLKIN2_IBUFDS                  =  8,
   parameter  C_SIM_DEVICE                  =  8,
   parameter  C_CLKFBIN_IBUF                  =  8,
   parameter  C_CLKFBIN_IBUFDS                  =  8,
   parameter  C_CLKFBOUT_BUFG                  =  8,
   parameter  C_CLKFBOUT_ODDR                  =  8,
   parameter  C_CLKFBIN_OBUFDS                  =  8,
   parameter  C_CLKFBIN_OBUF                  =  8,
   parameter  C_SS_MOD_PERIOD                        =  8, 
   parameter  C_SS_MODE                              =  8  
  )
  (
  output         clk_out1,

  output         locked,
  input          reset,
  input clkin1_deskew,
  input clkin2_deskew,
  input clkfb1_deskew,
  input clkfb2_deskew,
  input         clk_in1
  );
 
//wire declaration
wire clkin1_primitive;
wire clkin2_primitive;
wire clkout1_primitive;
wire clkout2_primitive;
wire clkout3_primitive;
wire clkout4_primitive;
wire clkout5_primitive;
wire clkout6_primitive;
wire clkout7_primitive;
wire clkfbout_primitive;
wire clkfbin_primitive;
wire psdone_unused;
wire clkin1_deskew_bufg;
wire clkfb1_deskew_bufg;
wire clkfb1_deskew_wo_bufg;
wire clkin2_deskew_bufg;
wire clkfb2_deskew_bufg;
wire clkfb2_deskew_wo_bufg;
wire clkout1_deskew_bufg;
wire clkout2_deskew_bufg;
wire clkout3_deskew_bufg;
wire clkout4_deskew_bufg;
wire clkout5_deskew_bufg;
wire clkout6_deskew_bufg;
wire clkout7_deskew_bufg;
wire clkout1_deskew_mbuf_bufg;
wire clkout2_deskew_mbuf_bufg;
wire clkout3_deskew_mbuf_bufg;
wire clkout4_deskew_mbuf_bufg;
wire clkout5_deskew_mbuf_bufg;
wire clkout6_deskew_mbuf_bufg;
wire clkout7_deskew_mbuf_bufg;
wire clk_out1_en_clk;
reg clk_out1_ce_sync_1;
reg clk_out1_ce_sync;

wire clkout1_primitive_bufg;
wire clkout2_primitive_bufg;
wire clkout3_primitive_bufg;
wire clkout4_primitive_bufg;
wire clkout5_primitive_bufg;
wire clkout6_primitive_bufg;
wire clkout7_primitive_bufg;

 
  // Input buffering
  //------------------------------------
//Single Ended clock pin
   IBUF IBUF_clkin1_inst (
      .O(clkin1_primitive), // 1-bit output: Buffer output
      .I(clk_in1)  // 1-bit input: Buffer input
   );


assign clkin1_deskew_bufg = 1'b0; 
assign clkfb1_deskew_bufg = 1'b0; 
assign clkin2_deskew_bufg = 1'b0; 
assign clkfb2_deskew_bufg = 1'b0; 
assign clkfb1_deskew_wo_bufg = 1'b0; 
assign clkfb2_deskew_wo_bufg = 1'b0; 
  // Clocking PRIMITIVE
  //------------------------------------
   MMCME5 #(
      .BANDWIDTH             (C_BANDWIDTH),                     // Jitter programming
      .CLKFBOUT_MULT         (119),                   // Multiply value for all CLKOUT
      .CLKFBOUT_FRACT        (C_CLKFBOUT_FRACT),
      .CLKFBOUT_PHASE        (0.000),                  // Phase offset in degrees of CLKFB
      .CLKOUTFB_PHASE_CTRL   (2'b00),                    // Fine phase shift enable (TRUE/FALSE)
      .CLKIN1_PERIOD         (C_CLKIN1_PERIOD),                   // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      .CLKIN2_PERIOD         (C_CLKIN2_PERIOD),                   // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      .CLKOUT0_DIVIDE        (C_CLKOUT1_DIVIDE),                  // Divide amount for CLKOUT0
      .CLKOUT0_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT0
      .CLKOUT0_PHASE         (C_CLKOUT1_ACTUAL_PHASE),            // Phase offset for CLKOUT0
      .CLKOUT0_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT1_DIVIDE        (C_CLKOUT2_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT1_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT1_PHASE         (C_CLKOUT2_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT1_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT2_DIVIDE        (C_CLKOUT3_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT2_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT2_PHASE         (C_CLKOUT3_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT2_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT3_DIVIDE        (C_CLKOUT4_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT3_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT3_PHASE         (C_CLKOUT4_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT3_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT4_DIVIDE        (C_CLKOUT5_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT4_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT4_PHASE         (C_CLKOUT5_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT4_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT5_DIVIDE        (C_CLKOUT6_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT5_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT5_PHASE         (C_CLKOUT6_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT5_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .CLKOUT6_DIVIDE        (C_CLKOUT7_DIVIDE),                  // Divide amount for CLKOUT (1-128)
      .CLKOUT6_DUTY_CYCLE    (0.500),       // Duty cycle for CLKOUT outputs (0.001-0.999).
      .CLKOUT6_PHASE         (C_CLKOUT7_ACTUAL_PHASE),            // Phase offset for CLKOUT outputs (-360.000-360.000).
      .CLKOUT6_PHASE_CTRL    (2'b00),                  // Fine phase shift enable (TRUE/FALSE)
      .COMPENSATION          (C_COMPENSATION),                  // Clock input compensation
      .DESKEW_DELAY1         (C_DESKEW_DELAY1),
      .DESKEW_DELAY2         (C_DESKEW_DELAY2),
      .DESKEW_DELAY_EN1      (C_DESKEW_DELAY_EN1),
      .DESKEW_DELAY_EN2      (C_DESKEW_DELAY_EN2),
      .DESKEW_DELAY_PATH1    (C_DESKEW_DELAY_PATH1),
      .DESKEW_DELAY_PATH2    (C_DESKEW_DELAY_PATH2),
      
      .DIVCLK_DIVIDE         (C_DIVCLK_DIVIDE),                   // Master division value
      .IS_CLKFBIN_INVERTED   (1'b0),                              // Optional inversion for CLKFBIN
      .IS_CLKIN1_INVERTED    (1'b0),                              // Optional inversion for CLKIN1
      .IS_CLKIN2_INVERTED    (1'b0),                              // Optional inversion for CLKIN2
      .IS_CLKINSEL_INVERTED  (1'b0),                              // Optional inversion for CLKINSEL
      .IS_PSEN_INVERTED      (1'b0),                              // Optional inversion for PSEN
      .IS_PSINCDEC_INVERTED  (1'b0),                              // Optional inversion for PSINCDEC
      .IS_PWRDWN_INVERTED    (1'b0),                              // Optional inversion for PWRDWN
      .IS_RST_INVERTED       (1'b0),                              // Optional inversion for RST
      .SS_EN                 (C_USE_SPREAD_SPECTRUM),           // Enables spread spectrum
      .SS_MODE               (C_SS_MODE),                       // Spread spectrum frequency deviation and the spread type
      .SS_MOD_PERIOD         (C_SS_MOD_PERIOD)                    // Spread spectrum modulation period (ns)
   )
   MMCME5_inst (
      .CLKFBOUT(clkfbout_primitive),         // 1-bit output: Feedback clock
      .CLKFBSTOPPED(),           // 1-bit output: Feedback clock stopped
      .CLKINSTOPPED(),           // 1-bit output: Feedback clock stopped
      .CLKOUT0(clkout1_primitive),           // 1-bit output: CLKOUT0
      .CLKOUT1(clkout2_primitive),           // 1-bit output: CLKOUT1
      .CLKOUT2(clkout3_primitive),           // 1-bit output: CLKOUT2
      .CLKOUT3(clkout4_primitive),           // 1-bit output: CLKOUT3
      .CLKOUT4(clkout5_primitive),           // 1-bit output: CLKOUT4
      .CLKOUT5(clkout6_primitive),           // 1-bit output: CLKOUT5
      .CLKOUT6(clkout7_primitive),           // 1-bit output: CLKOUT6
      .LOCKED               (locked),                       // 1-bit input: Power-down
      .CLKIN1_DESKEW               (clkin1_deskew_bufg),                      
      .CLKFB1_DESKEW               (clkfb1_deskew_bufg),                      
      .CLKIN2_DESKEW               (clkin2_deskew_bufg),                      
      .CLKFB2_DESKEW               (clkfb2_deskew_bufg),                      
      .LOCKED_FB               (),                       // 1-bit input: Power-down
      .LOCKED1_DESKEW               (),
      .LOCKED2_DESKEW               (),
    .CLKFBIN             (clkfbin_primitive), // INTERNAL or AUTO or EXTERNAL
      .CLKIN1(clkin1_primitive),             // 1-bit input: Primary clock
      .CLKIN2              (1'b0),             // 1-bit input: Secondary clock
      .CLKINSEL            (1'b1),                   // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      //.CLKFB1_DESKEW(1'b0),                   // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      //.CLKIN1_DESKEW(1'b0),                   // 1-bit input: Clock select, High=CLKIN1 Low=CLKIN2
      .DO                  (),                               // 16-bit output: DRP data output
      .DRDY                (),                           // 1-bit output: DRP ready
      .DADDR               (7'b0),                         // 7-bit input: DRP address
      .DCLK                (1'b0),                           // 1-bit input: DRP clock
      .DEN                 (1'b0),                             // 1-bit input: DRP enable
      .DI                  (16'b0),                               // 16-bit input: DRP data input
      .DWE                 (1'b0),                             // 1-bit input: DRP write enable
      .PSCLK               (1'b0),
      .PSEN                (1'b0),
      .PSINCDEC            (1'b0),
      .PSDONE              (),
      .PWRDWN               (1'b0),                       // 1-bit input: Power-down
      .RST      (reset)
   );



  // Output buffering
  //-----------------------------------
//Phase alignment false
assign clkfbin_primitive = clkfbout_primitive;


	  	  BUFG BUFG_clkout1_inst (
              .O(clk_out1), // 1-bit output: Buffer output
              .I(clkout1_primitive)  // 1-bit input: Buffer input
   );








		   assign clkout1_deskew_bufg = clk_out1;



endmodule  
