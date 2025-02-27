// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Thu Nov 21 14:54:41 2024
// Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/uf258tfa/Documents/CNES-SpaceFibre-Light/myproj/project_1.gen/sources_1/bd/extended_phy_layer/ip/extended_phy_layer_clk_wizard_0_0/extended_phy_layer_clk_wizard_0_0_stub.v
// Design      : extended_phy_layer_clk_wizard_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcve2802-vsvh1760-2MP-e-S
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "extended_phy_layer_clk_wizard_0_0_clk_wiz_top,Vivado 2024.1" *)
module extended_phy_layer_clk_wizard_0_0(reset, locked, clk_in1, clk_out1)
/* synthesis syn_black_box black_box_pad_pin="reset,locked,clk_in1" */
/* synthesis syn_force_seq_prim="clk_out1" */;
  input reset;
  output locked;
  input clk_in1;
  output clk_out1 /* synthesis syn_isclock = 1 */;
endmodule
