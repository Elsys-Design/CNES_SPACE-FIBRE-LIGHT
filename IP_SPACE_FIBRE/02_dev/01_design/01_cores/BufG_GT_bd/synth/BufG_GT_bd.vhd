--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Tue Nov 26 11:25:02 2024
--Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
--Command     : generate_target BufG_GT_bd.bd
--Design      : BufG_GT_bd
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity BufG_GT_bd is
  port (
    gt_bufgtce_0 : in STD_LOGIC;
    gt_bufgtcemask_0 : in STD_LOGIC;
    gt_bufgtclr_0 : in STD_LOGIC;
    gt_bufgtclrmask_0 : in STD_LOGIC;
    gt_bufgtdiv_0 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    outclk_0 : in STD_LOGIC;
    usrclk_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of BufG_GT_bd : entity is "BufG_GT_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=BufG_GT_bd,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of BufG_GT_bd : entity is "BufG_GT_bd.hwdef";
end BufG_GT_bd;

architecture STRUCTURE of BufG_GT_bd is
  component BufG_GT_bd_bufg_gt_0_0 is
  port (
    outclk : in STD_LOGIC;
    gt_bufgtce : in STD_LOGIC;
    gt_bufgtcemask : in STD_LOGIC;
    gt_bufgtclr : in STD_LOGIC;
    gt_bufgtclrmask : in STD_LOGIC;
    gt_bufgtdiv : in STD_LOGIC_VECTOR ( 2 downto 0 );
    usrclk : out STD_LOGIC
  );
  end component BufG_GT_bd_bufg_gt_0_0;
  signal bufg_gt_0_usrclk : STD_LOGIC;
  signal gt_bufgtce_0_1 : STD_LOGIC;
  signal gt_bufgtcemask_0_1 : STD_LOGIC;
  signal gt_bufgtclr_0_1 : STD_LOGIC;
  signal gt_bufgtclrmask_0_1 : STD_LOGIC;
  signal gt_bufgtdiv_0_1 : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal outclk_0_1 : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of outclk_0 : signal is "xilinx.com:signal:clock:1.0 CLK.OUTCLK_0 CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of outclk_0 : signal is "XIL_INTERFACENAME CLK.OUTCLK_0, CLK_DOMAIN BufG_GT_bd_outclk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of usrclk_0 : signal is "xilinx.com:signal:gt_usrclk:1.0 GT_USRCLK.USRCLK_0 GT_USRCLK";
  attribute X_INTERFACE_PARAMETER of usrclk_0 : signal is "XIL_INTERFACENAME GT_USRCLK.USRCLK_0, CLK_DOMAIN BufG_GT_bd_outclk_0, FREQ_HZ 150000000, PARENT_ID undef, PHASE 0.0";
begin
  gt_bufgtce_0_1 <= gt_bufgtce_0;
  gt_bufgtcemask_0_1 <= gt_bufgtcemask_0;
  gt_bufgtclr_0_1 <= gt_bufgtclr_0;
  gt_bufgtclrmask_0_1 <= gt_bufgtclrmask_0;
  gt_bufgtdiv_0_1(2 downto 0) <= gt_bufgtdiv_0(2 downto 0);
  outclk_0_1 <= outclk_0;
  usrclk_0 <= bufg_gt_0_usrclk;
bufg_gt_0: component BufG_GT_bd_bufg_gt_0_0
     port map (
      gt_bufgtce => gt_bufgtce_0_1,
      gt_bufgtcemask => gt_bufgtcemask_0_1,
      gt_bufgtclr => gt_bufgtclr_0_1,
      gt_bufgtclrmask => gt_bufgtclrmask_0_1,
      gt_bufgtdiv(2 downto 0) => gt_bufgtdiv_0_1(2 downto 0),
      outclk => outclk_0_1,
      usrclk => bufg_gt_0_usrclk
    );
end STRUCTURE;
