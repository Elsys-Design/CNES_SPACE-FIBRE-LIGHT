--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Tue Nov 26 11:25:02 2024
--Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
--Command     : generate_target BufG_GT_bd_wrapper.bd
--Design      : BufG_GT_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufG_GT_bd_wrapper is
  port (
    gt_bufgtce_0 : in STD_LOGIC;
    gt_bufgtcemask_0 : in STD_LOGIC;
    gt_bufgtclr_0 : in STD_LOGIC;
    gt_bufgtclrmask_0 : in STD_LOGIC;
    gt_bufgtdiv_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    outclk_0 : in STD_LOGIC;
    usrclk_0 : out STD_LOGIC
  );
end BufG_GT_bd_wrapper;

architecture STRUCTURE of BufG_GT_bd_wrapper is
  component BufG_GT_bd is
  port (
    gt_bufgtce_0 : in STD_LOGIC;
    gt_bufgtcemask_0 : in STD_LOGIC;
    gt_bufgtclr_0 : in STD_LOGIC;
    gt_bufgtclrmask_0 : in STD_LOGIC;
    gt_bufgtdiv_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    outclk_0 : in STD_LOGIC;
    usrclk_0 : out STD_LOGIC
  );
  end component BufG_GT_bd;
begin
BufG_GT_bd_i: component BufG_GT_bd
     port map (
      gt_bufgtce_0 => gt_bufgtce_0,
      gt_bufgtcemask_0 => gt_bufgtcemask_0,
      gt_bufgtclr_0 => gt_bufgtclr_0,
      gt_bufgtclrmask_0 => gt_bufgtclrmask_0,
      gt_bufgtdiv_0(2 downto 0) => gt_bufgtdiv_0(2 downto 0),
      outclk_0 => outclk_0,
      usrclk_0 => usrclk_0
    );
end STRUCTURE;
