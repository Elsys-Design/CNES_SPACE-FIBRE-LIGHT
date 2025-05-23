-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Tue Nov 26 11:03:18 2024
-- Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top BufG_GT_bd_bufg_gt_0_0 -prefix
--               BufG_GT_bd_bufg_gt_0_0_ BufG_GT_bufg_gt_0_0_stub.vhdl
-- Design      : BufG_GT_bufg_gt_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcve2802-vsvh1760-2MP-e-S
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BufG_GT_bd_bufg_gt_0_0 is
  Port ( 
    outclk : in STD_LOGIC;
    gt_bufgtce : in STD_LOGIC;
    gt_bufgtcemask : in STD_LOGIC;
    gt_bufgtclr : in STD_LOGIC;
    gt_bufgtclrmask : in STD_LOGIC;
    gt_bufgtdiv : in STD_LOGIC_VECTOR ( 2 downto 0 );
    usrclk : out STD_LOGIC
  );

end BufG_GT_bd_bufg_gt_0_0;

architecture stub of BufG_GT_bd_bufg_gt_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "outclk,gt_bufgtce,gt_bufgtcemask,gt_bufgtclr,gt_bufgtclrmask,gt_bufgtdiv[2:0],usrclk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "BufG_GT_bufg_gt_0_0_inst,Vivado 2024.1";
begin
end;
