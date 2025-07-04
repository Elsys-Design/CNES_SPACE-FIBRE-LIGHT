

//------------------------------------------------------------------------------
//  (c) Copyright 2017-2018, 2023 Advanced Micro Devices Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Advanced Micro Devices, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  AMD, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE \"AS IS\" AND
//  WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) AMD shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or AMD had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  AMD products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, \"Critical
//  Applications\"). Customer assumes the sole risk and
//  liability of any use of AMD products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------


`timescale 1ns / 1ps



module BufG_GT_bd_bufg_gt_0_0_inst  (
    input outclk,
    input gt_bufgtce,
    input gt_bufgtcemask,
    input gt_bufgtclr,
    input gt_bufgtclrmask,
    input [2:0] gt_bufgtdiv,
    output usrclk
    );
     
      wire sync_ce;
      wire sync_clr;

      //BUFG_GT_SYNC sync_clr_ce (.CESYNC(sync_ce), .CLRSYNC(sync_clr), .CE(gt_bufgtce), .CLK(outclk), .CLR(gt_bufgtclr));
    //assign usrclk = outclk;
      BUFG_GT #(
        .SIM_DEVICE ("VERSAL_AI_EDGE")
      ) bufg_gt_usrclk_inst (
        .CE      (gt_bufgtce),
        .CEMASK  (gt_bufgtcemask),
        .CLR     (gt_bufgtclr),
        .CLRMASK (gt_bufgtclrmask),
        .DIV     (gt_bufgtdiv),
        .I       (outclk),
        .O       (usrclk)
      );
endmodule
//------}
