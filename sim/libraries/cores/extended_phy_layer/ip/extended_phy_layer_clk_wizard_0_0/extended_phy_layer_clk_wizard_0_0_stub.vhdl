-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Thu Nov 21 14:54:41 2024
-- Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/uf258tfa/Documents/CNES-SpaceFibre-Light/myproj/project_1.gen/sources_1/bd/extended_phy_layer/ip/extended_phy_layer_clk_wizard_0_0/extended_phy_layer_clk_wizard_0_0_stub.vhdl
-- Design      : extended_phy_layer_clk_wizard_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcve2802-vsvh1760-2MP-e-S
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extended_phy_layer_clk_wizard_0_0 is
  Port ( 
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC
  );

end extended_phy_layer_clk_wizard_0_0;

architecture stub of extended_phy_layer_clk_wizard_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "reset,locked,clk_in1,clk_out1";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "extended_phy_layer_clk_wizard_0_0_clk_wiz_top,Vivado 2024.1";
begin
end;
