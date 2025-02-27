// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Nov 26 11:03:17 2024
// Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top BufG_GT_bd_bufg_gt_0_0 -prefix
//               BufG_GT_bd_bufg_gt_0_0_ BufG_GT_bufg_gt_0_0_stub.v
// Design      : BufG_GT_bufg_gt_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcve2802-vsvh1760-2MP-e-S
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "BufG_GT_bufg_gt_0_0_inst,Vivado 2024.1" *)
module BufG_GT_bd_bufg_gt_0_0(outclk, gt_bufgtce, gt_bufgtcemask, 
  gt_bufgtclr, gt_bufgtclrmask, gt_bufgtdiv, usrclk)
/* synthesis syn_black_box black_box_pad_pin="gt_bufgtce,gt_bufgtcemask,gt_bufgtclr,gt_bufgtclrmask,gt_bufgtdiv[2:0]" */
/* synthesis syn_force_seq_prim="outclk" */
/* synthesis syn_force_seq_prim="usrclk" */;
  input outclk /* synthesis syn_isclock = 1 */;
  input gt_bufgtce;
  input gt_bufgtcemask;
  input gt_bufgtclr;
  input gt_bufgtclrmask;
  input [2:0]gt_bufgtdiv;
  output usrclk /* synthesis syn_isclock = 1 */;
endmodule
