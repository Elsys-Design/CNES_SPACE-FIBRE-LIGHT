-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
-- Date        : Thu Nov 21 14:54:41 2024
-- Host        : D-14JM0W2 running 64-bit Ubuntu 20.04.6 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/uf258tfa/Documents/CNES-SpaceFibre-Light/myproj/project_1.gen/sources_1/bd/extended_phy_layer/ip/extended_phy_layer_clk_wizard_0_0/extended_phy_layer_clk_wizard_0_0_sim_netlist.vhdl
-- Design      : extended_phy_layer_clk_wizard_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcve2802-vsvh1760-2MP-e-S
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity extended_phy_layer_clk_wizard_0_0_clocking_structure is
  port (
    locked : out STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    reset : in STD_LOGIC
  );
end extended_phy_layer_clk_wizard_0_0_clocking_structure;

architecture STRUCTURE of extended_phy_layer_clk_wizard_0_0_clocking_structure is
  signal clkin1_primitive : STD_LOGIC;
  signal clkout1_primitive : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKFBIN_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKFBOUT_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKFBSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKINSTOPPED_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT1_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT2_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT3_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT4_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT5_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_CLKOUT6_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_DRDY_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_LOCKED1_DESKEW_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_LOCKED2_DESKEW_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_LOCKED_FB_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_PSDONE_UNCONNECTED : STD_LOGIC;
  signal NLW_MMCME5_inst_DO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of BUFG_clkout1_inst : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of BUFG_clkout1_inst : label is "BUFG";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of BUFG_clkout1_inst : label is "VCC:CE";
  attribute BOX_TYPE of IBUF_clkin1_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of IBUF_clkin1_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of IBUF_clkin1_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of IBUF_clkin1_inst : label is "AUTO";
  attribute BOX_TYPE of MMCME5_inst : label is "PRIMITIVE";
  attribute OPT_MODIFIED : string;
  attribute OPT_MODIFIED of MMCME5_inst : label is "MLO";
begin
BUFG_clkout1_inst: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "VERSAL_AI_EDGE"
    )
        port map (
      CE => '1',
      I => clkout1_primitive,
      O => clk_out1
    );
IBUF_clkin1_inst: unisim.vcomponents.IBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => clk_in1,
      O => clkin1_primitive
    );
MMCME5_inst: unisim.vcomponents.MMCME5
    generic map(
      BANDWIDTH => "OPTIMIZED",
      CLKFBOUT_FRACT => 0,
      CLKFBOUT_MULT => 119,
      CLKFBOUT_PHASE => 0.000000,
      CLKIN1_PERIOD => 6.666670,
      CLKIN2_PERIOD => 9.259260,
      CLKOUT0_DIVIDE => 15,
      CLKOUT0_DUTY_CYCLE => 0.500000,
      CLKOUT0_PHASE => 0.000000,
      CLKOUT0_PHASE_CTRL => B"00",
      CLKOUT1_DIVIDE => 12,
      CLKOUT1_DUTY_CYCLE => 0.500000,
      CLKOUT1_PHASE => 0.000000,
      CLKOUT1_PHASE_CTRL => B"00",
      CLKOUT2_DIVIDE => 12,
      CLKOUT2_DUTY_CYCLE => 0.500000,
      CLKOUT2_PHASE => 0.000000,
      CLKOUT2_PHASE_CTRL => B"00",
      CLKOUT3_DIVIDE => 12,
      CLKOUT3_DUTY_CYCLE => 0.500000,
      CLKOUT3_PHASE => 0.000000,
      CLKOUT3_PHASE_CTRL => B"00",
      CLKOUT4_DIVIDE => 12,
      CLKOUT4_DUTY_CYCLE => 0.500000,
      CLKOUT4_PHASE => 0.000000,
      CLKOUT4_PHASE_CTRL => B"00",
      CLKOUT5_DIVIDE => 12,
      CLKOUT5_DUTY_CYCLE => 0.500000,
      CLKOUT5_PHASE => 0.000000,
      CLKOUT5_PHASE_CTRL => B"00",
      CLKOUT6_DIVIDE => 12,
      CLKOUT6_DUTY_CYCLE => 0.500000,
      CLKOUT6_PHASE => 0.000000,
      CLKOUT6_PHASE_CTRL => B"00",
      CLKOUTFB_PHASE_CTRL => B"00",
      COMPENSATION => "INTERNAL",
      DESKEW_DELAY1 => 0,
      DESKEW_DELAY2 => 0,
      DESKEW_DELAY_EN1 => "FALSE",
      DESKEW_DELAY_EN2 => "FALSE",
      DESKEW_DELAY_PATH1 => "FALSE",
      DESKEW_DELAY_PATH2 => "FALSE",
      DIVCLK_DIVIDE => 5,
      IS_CLKFB1_DESKEW_INVERTED => '0',
      IS_CLKFB2_DESKEW_INVERTED => '0',
      IS_CLKFBIN_INVERTED => '0',
      IS_CLKIN1_DESKEW_INVERTED => '0',
      IS_CLKIN1_INVERTED => '0',
      IS_CLKIN2_DESKEW_INVERTED => '0',
      IS_CLKIN2_INVERTED => '0',
      IS_CLKINSEL_INVERTED => '0',
      IS_PSEN_INVERTED => '0',
      IS_PSINCDEC_INVERTED => '0',
      IS_PWRDWN_INVERTED => '0',
      IS_RST_INVERTED => '0',
      LOCK_WAIT => "FALSE",
      REF_JITTER1 => 0.010000,
      REF_JITTER2 => 0.010000,
      SS_EN => "FALSE",
      SS_MODE => "CENTER_HIGH",
      SS_MOD_PERIOD => 4000
    )
        port map (
      CLKFB1_DESKEW => '0',
      CLKFB2_DESKEW => '0',
      CLKFBIN => NLW_MMCME5_inst_CLKFBIN_UNCONNECTED,
      CLKFBOUT => NLW_MMCME5_inst_CLKFBOUT_UNCONNECTED,
      CLKFBSTOPPED => NLW_MMCME5_inst_CLKFBSTOPPED_UNCONNECTED,
      CLKIN1 => clkin1_primitive,
      CLKIN1_DESKEW => '0',
      CLKIN2 => '0',
      CLKIN2_DESKEW => '0',
      CLKINSEL => '1',
      CLKINSTOPPED => NLW_MMCME5_inst_CLKINSTOPPED_UNCONNECTED,
      CLKOUT0 => clkout1_primitive,
      CLKOUT1 => NLW_MMCME5_inst_CLKOUT1_UNCONNECTED,
      CLKOUT2 => NLW_MMCME5_inst_CLKOUT2_UNCONNECTED,
      CLKOUT3 => NLW_MMCME5_inst_CLKOUT3_UNCONNECTED,
      CLKOUT4 => NLW_MMCME5_inst_CLKOUT4_UNCONNECTED,
      CLKOUT5 => NLW_MMCME5_inst_CLKOUT5_UNCONNECTED,
      CLKOUT6 => NLW_MMCME5_inst_CLKOUT6_UNCONNECTED,
      DADDR(6 downto 0) => B"0000000",
      DCLK => '0',
      DEN => '0',
      DI(15 downto 0) => B"0000000000000000",
      DO(15 downto 0) => NLW_MMCME5_inst_DO_UNCONNECTED(15 downto 0),
      DRDY => NLW_MMCME5_inst_DRDY_UNCONNECTED,
      DWE => '0',
      LOCKED => locked,
      LOCKED1_DESKEW => NLW_MMCME5_inst_LOCKED1_DESKEW_UNCONNECTED,
      LOCKED2_DESKEW => NLW_MMCME5_inst_LOCKED2_DESKEW_UNCONNECTED,
      LOCKED_FB => NLW_MMCME5_inst_LOCKED_FB_UNCONNECTED,
      PSCLK => '0',
      PSDONE => NLW_MMCME5_inst_PSDONE_UNCONNECTED,
      PSEN => '0',
      PSINCDEC => '0',
      PWRDWN => '0',
      RST => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity extended_phy_layer_clk_wizard_0_0_clk_wiz_top is
  port (
    s_axi_awready : out STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 10 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    reset : in STD_LOGIC;
    resetn : in STD_LOGIC;
    clkin1_deskew : in STD_LOGIC;
    clkin2_deskew : in STD_LOGIC;
    clkfb1_deskew : in STD_LOGIC;
    clkfb2_deskew : in STD_LOGIC;
    user_clk0 : in STD_LOGIC;
    user_clk1 : in STD_LOGIC;
    user_clk2 : in STD_LOGIC;
    user_clk3 : in STD_LOGIC;
    ref_clk : in STD_LOGIC;
    clk_stop : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_glitch : out STD_LOGIC_VECTOR ( 3 downto 0 );
    clk_oor : out STD_LOGIC_VECTOR ( 3 downto 0 );
    interrupt : out STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    clk1_clr_n : in STD_LOGIC;
    clk2_clr_n : in STD_LOGIC;
    clk3_clr_n : in STD_LOGIC;
    clk4_clr_n : in STD_LOGIC;
    clk5_clr_n : in STD_LOGIC;
    clk6_clr_n : in STD_LOGIC;
    clk7_clr_n : in STD_LOGIC;
    clk1_ce : in STD_LOGIC;
    clk2_ce : in STD_LOGIC;
    clk3_ce : in STD_LOGIC;
    clk4_ce : in STD_LOGIC;
    clk5_ce : in STD_LOGIC;
    clk6_ce : in STD_LOGIC;
    clk7_ce : in STD_LOGIC;
    locked : out STD_LOGIC;
    locked_fb : out STD_LOGIC;
    clk_in2_p : in STD_LOGIC;
    clk_in2_n : in STD_LOGIC;
    clkfb_in_p : in STD_LOGIC;
    clkfb_in_n : in STD_LOGIC;
    clkfb_out_p : out STD_LOGIC;
    clkfb_out_n : out STD_LOGIC;
    power_down : in STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );
  attribute C_ACTUAL_PFD : string;
  attribute C_ACTUAL_PFD of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "30.000000";
  attribute C_ACTUAL_VCO : string;
  attribute C_ACTUAL_VCO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "3570.000000";
  attribute C_AUTO_NUMMBUFGCE : integer;
  attribute C_AUTO_NUMMBUFGCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_AUTO_PRIMITIVE : string;
  attribute C_AUTO_PRIMITIVE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "MMCM";
  attribute C_BANDWIDTH : string;
  attribute C_BANDWIDTH of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "OPTIMIZED";
  attribute C_BUFGCE_DIV_CE_TYPE : string;
  attribute C_BUFGCE_DIV_CE_TYPE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "SYNC";
  attribute C_CDDCDONE_PORT : string;
  attribute C_CDDCDONE_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "cddcdone";
  attribute C_CDDCREQ_PORT : string;
  attribute C_CDDCREQ_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "cddcreq";
  attribute C_CE_SYNC_EXT : integer;
  attribute C_CE_SYNC_EXT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CE_TYPE : string;
  attribute C_CE_TYPE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "SYNC";
  attribute C_CLKFB1_DESKEW_PORT : string;
  attribute C_CLKFB1_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb1_deskew";
  attribute C_CLKFB2_DESKEW_PORT : string;
  attribute C_CLKFB2_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb2_deskew";
  attribute C_CLKFBIN_IBUF : integer;
  attribute C_CLKFBIN_IBUF of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBIN_IBUFDS : integer;
  attribute C_CLKFBIN_IBUFDS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBIN_OBUF : integer;
  attribute C_CLKFBIN_OBUF of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBIN_OBUFDS : integer;
  attribute C_CLKFBIN_OBUFDS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBOUT_BUFG : integer;
  attribute C_CLKFBOUT_BUFG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBOUT_FRACT : integer;
  attribute C_CLKFBOUT_FRACT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBOUT_MULT : integer;
  attribute C_CLKFBOUT_MULT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKFBOUT_ODDR : integer;
  attribute C_CLKFBOUT_ODDR of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFBOUT_PHASE : string;
  attribute C_CLKFBOUT_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKFB_BUFG : integer;
  attribute C_CLKFB_BUFG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKFB_DESKEW_PORT : string;
  attribute C_CLKFB_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb_deskew";
  attribute C_CLKFB_IN_PORT : string;
  attribute C_CLKFB_IN_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb_in";
  attribute C_CLKFB_IN_SIGNALING : string;
  attribute C_CLKFB_IN_SIGNALING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "SINGLE";
  attribute C_CLKFB_OUT_PORT : string;
  attribute C_CLKFB_OUT_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb_out";
  attribute C_CLKFB_STOPPED_PORT : string;
  attribute C_CLKFB_STOPPED_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkfb_stopped";
  attribute C_CLKIN1_BUFG : integer;
  attribute C_CLKIN1_BUFG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKIN1_DESKEW_PORT : string;
  attribute C_CLKIN1_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkin1_deskew";
  attribute C_CLKIN1_IBUF : integer;
  attribute C_CLKIN1_IBUF of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKIN1_IBUFDS : integer;
  attribute C_CLKIN1_IBUFDS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKIN1_JITTER_PS : string;
  attribute C_CLKIN1_JITTER_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKIN1_PERIOD : string;
  attribute C_CLKIN1_PERIOD of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "6.666670";
  attribute C_CLKIN2_BUFG : integer;
  attribute C_CLKIN2_BUFG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKIN2_DESKEW_PORT : string;
  attribute C_CLKIN2_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkin2_deskew";
  attribute C_CLKIN2_IBUF : integer;
  attribute C_CLKIN2_IBUF of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKIN2_IBUFDS : integer;
  attribute C_CLKIN2_IBUFDS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKIN2_JITTER_PS : string;
  attribute C_CLKIN2_JITTER_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKIN2_PERIOD : string;
  attribute C_CLKIN2_PERIOD of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "9.259260";
  attribute C_CLKIN_DESKEW_PORT : string;
  attribute C_CLKIN_DESKEW_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clkin_deskew";
  attribute C_CLKOUT1_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT1_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT1_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT1_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "238.000000";
  attribute C_CLKOUT1_ACTUAL_PHASE : string;
  attribute C_CLKOUT1_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT1_DIVIDE : integer;
  attribute C_CLKOUT1_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 15;
  attribute C_CLKOUT1_DRIVES : string;
  attribute C_CLKOUT1_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT1_DYN_PS : string;
  attribute C_CLKOUT1_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT1_GROUPING : string;
  attribute C_CLKOUT1_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT1_MATCHED_ROUTING : integer;
  attribute C_CLKOUT1_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT1_MBUFGCE_MODE : string;
  attribute C_CLKOUT1_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT1_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT1_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT1_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT1_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT1_REQUESTED_PHASE : string;
  attribute C_CLKOUT1_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT1_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT1_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT1_USED : integer;
  attribute C_CLKOUT1_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT2_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT2_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT2_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT2_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT2_ACTUAL_PHASE : string;
  attribute C_CLKOUT2_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT2_DIVIDE : integer;
  attribute C_CLKOUT2_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT2_DRIVES : string;
  attribute C_CLKOUT2_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT2_DYN_PS : string;
  attribute C_CLKOUT2_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT2_GROUPING : string;
  attribute C_CLKOUT2_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT2_MATCHED_ROUTING : integer;
  attribute C_CLKOUT2_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT2_MBUFGCE_MODE : string;
  attribute C_CLKOUT2_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT2_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT2_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT2_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT2_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT2_REQUESTED_PHASE : string;
  attribute C_CLKOUT2_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT2_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT2_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT2_USED : integer;
  attribute C_CLKOUT2_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT3_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT3_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT3_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT3_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT3_ACTUAL_PHASE : string;
  attribute C_CLKOUT3_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT3_DIVIDE : integer;
  attribute C_CLKOUT3_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT3_DRIVES : string;
  attribute C_CLKOUT3_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT3_DYN_PS : string;
  attribute C_CLKOUT3_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT3_GROUPING : string;
  attribute C_CLKOUT3_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT3_MATCHED_ROUTING : integer;
  attribute C_CLKOUT3_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT3_MBUFGCE_MODE : string;
  attribute C_CLKOUT3_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT3_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT3_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT3_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT3_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT3_REQUESTED_PHASE : string;
  attribute C_CLKOUT3_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT3_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT3_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT3_USED : integer;
  attribute C_CLKOUT3_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT4_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT4_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT4_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT4_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT4_ACTUAL_PHASE : string;
  attribute C_CLKOUT4_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT4_DIVIDE : integer;
  attribute C_CLKOUT4_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT4_DRIVES : string;
  attribute C_CLKOUT4_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT4_DYN_PS : string;
  attribute C_CLKOUT4_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT4_GROUPING : string;
  attribute C_CLKOUT4_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT4_MATCHED_ROUTING : integer;
  attribute C_CLKOUT4_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT4_MBUFGCE_MODE : string;
  attribute C_CLKOUT4_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT4_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT4_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT4_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT4_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT4_REQUESTED_PHASE : string;
  attribute C_CLKOUT4_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT4_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT4_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT4_USED : integer;
  attribute C_CLKOUT4_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT5_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT5_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT5_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT5_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT5_ACTUAL_PHASE : string;
  attribute C_CLKOUT5_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT5_DIVIDE : integer;
  attribute C_CLKOUT5_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT5_DRIVES : string;
  attribute C_CLKOUT5_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT5_DYN_PS : string;
  attribute C_CLKOUT5_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT5_GROUPING : string;
  attribute C_CLKOUT5_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT5_MATCHED_ROUTING : integer;
  attribute C_CLKOUT5_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT5_MBUFGCE_MODE : string;
  attribute C_CLKOUT5_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT5_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT5_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT5_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT5_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT5_REQUESTED_PHASE : string;
  attribute C_CLKOUT5_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT5_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT5_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT5_USED : integer;
  attribute C_CLKOUT5_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT6_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT6_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT6_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT6_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT6_ACTUAL_PHASE : string;
  attribute C_CLKOUT6_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT6_DIVIDE : integer;
  attribute C_CLKOUT6_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT6_DRIVES : string;
  attribute C_CLKOUT6_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT6_DYN_PS : string;
  attribute C_CLKOUT6_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT6_GROUPING : string;
  attribute C_CLKOUT6_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT6_MATCHED_ROUTING : integer;
  attribute C_CLKOUT6_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT6_MBUFGCE_MODE : string;
  attribute C_CLKOUT6_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT6_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT6_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT6_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT6_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT6_REQUESTED_PHASE : string;
  attribute C_CLKOUT6_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT6_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT6_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT6_USED : integer;
  attribute C_CLKOUT6_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT7_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT7_ACTUAL_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT7_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT7_ACTUAL_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "119.000000";
  attribute C_CLKOUT7_ACTUAL_PHASE : string;
  attribute C_CLKOUT7_ACTUAL_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT7_DIVIDE : integer;
  attribute C_CLKOUT7_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 12;
  attribute C_CLKOUT7_DRIVES : string;
  attribute C_CLKOUT7_DRIVES of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "BUFG";
  attribute C_CLKOUT7_DYN_PS : string;
  attribute C_CLKOUT7_DYN_PS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLKOUT7_GROUPING : string;
  attribute C_CLKOUT7_GROUPING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Auto";
  attribute C_CLKOUT7_MATCHED_ROUTING : integer;
  attribute C_CLKOUT7_MATCHED_ROUTING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUT7_MBUFGCE_MODE : string;
  attribute C_CLKOUT7_MBUFGCE_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "PERFORMANCE";
  attribute C_CLKOUT7_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT7_REQUESTED_DUTY_CYCLE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "50.000000";
  attribute C_CLKOUT7_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT7_REQUESTED_OUT_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "100.000000";
  attribute C_CLKOUT7_REQUESTED_PHASE : string;
  attribute C_CLKOUT7_REQUESTED_PHASE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_CLKOUT7_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT7_SEQUENCE_NUMBER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_CLKOUT7_USED : integer;
  attribute C_CLKOUT7_USED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLKOUTFB_PHASE_CTRL : string;
  attribute C_CLKOUTFB_PHASE_CTRL of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "00";
  attribute C_CLK_IN_SEL_PORT : string;
  attribute C_CLK_IN_SEL_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_in_sel";
  attribute C_CLK_OUT1_PORT : string;
  attribute C_CLK_OUT1_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out1";
  attribute C_CLK_OUT2_PORT : string;
  attribute C_CLK_OUT2_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out2";
  attribute C_CLK_OUT3_PORT : string;
  attribute C_CLK_OUT3_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out3";
  attribute C_CLK_OUT4_PORT : string;
  attribute C_CLK_OUT4_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out4";
  attribute C_CLK_OUT5_PORT : string;
  attribute C_CLK_OUT5_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out5";
  attribute C_CLK_OUT6_PORT : string;
  attribute C_CLK_OUT6_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out6";
  attribute C_CLK_OUT7_PORT : string;
  attribute C_CLK_OUT7_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_out7";
  attribute C_CLK_TREE1 : integer;
  attribute C_CLK_TREE1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE2 : integer;
  attribute C_CLK_TREE2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE3 : integer;
  attribute C_CLK_TREE3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE4 : integer;
  attribute C_CLK_TREE4 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE5 : integer;
  attribute C_CLK_TREE5 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE6 : integer;
  attribute C_CLK_TREE6 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_CLK_TREE7 : integer;
  attribute C_CLK_TREE7 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_COMPENSATION : string;
  attribute C_COMPENSATION of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "AUTO";
  attribute C_DADDR_PORT : string;
  attribute C_DADDR_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "daddr";
  attribute C_DCLK_PORT : string;
  attribute C_DCLK_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "dclk";
  attribute C_DEN_PORT : string;
  attribute C_DEN_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "den";
  attribute C_DESKEW_DELAY1 : integer;
  attribute C_DESKEW_DELAY1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DESKEW_DELAY2 : integer;
  attribute C_DESKEW_DELAY2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DESKEW_DELAY_EN1 : string;
  attribute C_DESKEW_DELAY_EN1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
  attribute C_DESKEW_DELAY_EN2 : string;
  attribute C_DESKEW_DELAY_EN2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
  attribute C_DESKEW_DELAY_PATH1 : string;
  attribute C_DESKEW_DELAY_PATH1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
  attribute C_DESKEW_DELAY_PATH2 : string;
  attribute C_DESKEW_DELAY_PATH2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
  attribute C_DESKEW_FB1 : integer;
  attribute C_DESKEW_FB1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_DESKEW_FB2 : integer;
  attribute C_DESKEW_FB2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_DESKEW_IN1 : integer;
  attribute C_DESKEW_IN1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DESKEW_IN2 : integer;
  attribute C_DESKEW_IN2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DESKEW_LOCK_CIRCUIT_EN1 : integer;
  attribute C_DESKEW_LOCK_CIRCUIT_EN1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DESKEW_LOCK_CIRCUIT_EN2 : integer;
  attribute C_DESKEW_LOCK_CIRCUIT_EN2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_DIN_PORT : string;
  attribute C_DIN_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "din";
  attribute C_DIVCLK_DIVIDE : integer;
  attribute C_DIVCLK_DIVIDE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 5;
  attribute C_DIVIDE1_AUTO : string;
  attribute C_DIVIDE1_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE2_AUTO : string;
  attribute C_DIVIDE2_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE3_AUTO : string;
  attribute C_DIVIDE3_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE4_AUTO : string;
  attribute C_DIVIDE4_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE5_AUTO : string;
  attribute C_DIVIDE5_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE6_AUTO : string;
  attribute C_DIVIDE6_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DIVIDE7_AUTO : string;
  attribute C_DIVIDE7_AUTO of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.000000";
  attribute C_DOUT_PORT : string;
  attribute C_DOUT_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "dout";
  attribute C_DRDY_PORT : string;
  attribute C_DRDY_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "drdy";
  attribute C_DRP_ADDR_SET1 : string;
  attribute C_DRP_ADDR_SET1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DRP_ADDR_SET2 : string;
  attribute C_DRP_ADDR_SET2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DRP_ADDR_SET3 : string;
  attribute C_DRP_ADDR_SET3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET1 : string;
  attribute C_DRP_DATA_SET1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET2 : string;
  attribute C_DRP_DATA_SET2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET3 : string;
  attribute C_DRP_DATA_SET3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0000 0000 0000 0000";
  attribute C_DWE_PORT : string;
  attribute C_DWE_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "dwe";
  attribute C_D_MAX : string;
  attribute C_D_MAX of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "107.000000";
  attribute C_D_MIN : string;
  attribute C_D_MIN of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "1.000000";
  attribute C_ENABLE_CLOCK_MONITOR : integer;
  attribute C_ENABLE_CLOCK_MONITOR of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_ENABLE_USER_CLOCK0 : integer;
  attribute C_ENABLE_USER_CLOCK0 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_ENABLE_USER_CLOCK1 : integer;
  attribute C_ENABLE_USER_CLOCK1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_ENABLE_USER_CLOCK2 : integer;
  attribute C_ENABLE_USER_CLOCK2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_ENABLE_USER_CLOCK3 : integer;
  attribute C_ENABLE_USER_CLOCK3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_Enable_PLL0 : integer;
  attribute C_Enable_PLL0 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_Enable_PLL1 : integer;
  attribute C_Enable_PLL1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_FEEDBACK_SOURCE : string;
  attribute C_FEEDBACK_SOURCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FDBK_AUTO";
  attribute C_INCLK_SUM_ROW0 : string;
  attribute C_INCLK_SUM_ROW0 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Input Clock   Freq (MHz)    Input Jitter (UI)";
  attribute C_INCLK_SUM_ROW1 : string;
  attribute C_INCLK_SUM_ROW1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "primary       100.000        0.010";
  attribute C_INCLK_SUM_ROW2 : string;
  attribute C_INCLK_SUM_ROW2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "secondary      100.000        0.010";
  attribute C_INPUT_CLK_STOPPED_PORT : string;
  attribute C_INPUT_CLK_STOPPED_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "input_clk_stopped";
  attribute C_INTERFACE_SELECTION : integer;
  attribute C_INTERFACE_SELECTION of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_JITTER_SEL : string;
  attribute C_JITTER_SEL of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "No_Jitter";
  attribute C_LOCKED_DESKEW1_PORT : string;
  attribute C_LOCKED_DESKEW1_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "locked_deskew1";
  attribute C_LOCKED_DESKEW2_PORT : string;
  attribute C_LOCKED_DESKEW2_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "locked_deskew2";
  attribute C_LOCKED_FB_PORT : string;
  attribute C_LOCKED_FB_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "locked_fb";
  attribute C_LOCKED_PORT : string;
  attribute C_LOCKED_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "locked";
  attribute C_MAXCOUNT_DESKEW1 : integer;
  attribute C_MAXCOUNT_DESKEW1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MAXCOUNT_DESKEW2 : integer;
  attribute C_MAXCOUNT_DESKEW2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV : integer;
  attribute C_MMCMBUFGCEDIV of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV1 : integer;
  attribute C_MMCMBUFGCEDIV1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV2 : integer;
  attribute C_MMCMBUFGCEDIV2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV3 : integer;
  attribute C_MMCMBUFGCEDIV3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV4 : integer;
  attribute C_MMCMBUFGCEDIV4 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV5 : integer;
  attribute C_MMCMBUFGCEDIV5 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV6 : integer;
  attribute C_MMCMBUFGCEDIV6 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_MMCMBUFGCEDIV7 : integer;
  attribute C_MMCMBUFGCEDIV7 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_M_MAX : string;
  attribute C_M_MAX of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "432.000000";
  attribute C_M_MIN : string;
  attribute C_M_MIN of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "5.000000";
  attribute C_NUMBUFG : integer;
  attribute C_NUMBUFG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_NUMBUFGCE : integer;
  attribute C_NUMBUFGCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_NUMMBUFGCE : integer;
  attribute C_NUMMBUFGCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_NUM_OUT_CLKS : integer;
  attribute C_NUM_OUT_CLKS of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_OUTCLK_SUM_ROW0A : string;
  attribute C_OUTCLK_SUM_ROW0A of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Output    Output      Phase     Duty      Pk-to-Pk        Phase";
  attribute C_OUTCLK_SUM_ROW0B : string;
  attribute C_OUTCLK_SUM_ROW0B of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Clock    Freq (MHz) (degrees) Cycle () Jitter (ps)  Error (ps)";
  attribute C_OUTCLK_SUM_ROW1 : string;
  attribute C_OUTCLK_SUM_ROW1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out1 output";
  attribute C_OUTCLK_SUM_ROW2 : string;
  attribute C_OUTCLK_SUM_ROW2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out2 output";
  attribute C_OUTCLK_SUM_ROW3 : string;
  attribute C_OUTCLK_SUM_ROW3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out3 output";
  attribute C_OUTCLK_SUM_ROW4 : string;
  attribute C_OUTCLK_SUM_ROW4 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out4 output";
  attribute C_OUTCLK_SUM_ROW5 : string;
  attribute C_OUTCLK_SUM_ROW5 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out5 output";
  attribute C_OUTCLK_SUM_ROW6 : string;
  attribute C_OUTCLK_SUM_ROW6 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out6 output";
  attribute C_OUTCLK_SUM_ROW7 : string;
  attribute C_OUTCLK_SUM_ROW7 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "no clk_out7 output";
  attribute C_OVERRIDE_PRIMITIVE : integer;
  attribute C_OVERRIDE_PRIMITIVE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_O_MAX : string;
  attribute C_O_MAX of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "432.000000";
  attribute C_O_MIN : string;
  attribute C_O_MIN of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "3.000000";
  attribute C_PHASESHIFT_MODE : string;
  attribute C_PHASESHIFT_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "LATENCY";
  attribute C_PLLBUFGCEDIV : integer;
  attribute C_PLLBUFGCEDIV of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_PLLBUFGCEDIV1 : integer;
  attribute C_PLLBUFGCEDIV1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_PLLBUFGCEDIV2 : integer;
  attribute C_PLLBUFGCEDIV2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_PLLBUFGCEDIV3 : integer;
  attribute C_PLLBUFGCEDIV3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_PLLBUFGCEDIV4 : integer;
  attribute C_PLLBUFGCEDIV4 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_POWER_DOWN_PORT : string;
  attribute C_POWER_DOWN_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "power_down";
  attribute C_PRECISION : integer;
  attribute C_PRECISION of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_PRIMARY_PORT : string;
  attribute C_PRIMARY_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_in1";
  attribute C_PRIMITIVE : string;
  attribute C_PRIMITIVE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "MMCM";
  attribute C_PRIM_IN_FREQ : integer;
  attribute C_PRIM_IN_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 150;
  attribute C_PRIM_SOURCE : string;
  attribute C_PRIM_SOURCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Single_ended_clock_capable_pin";
  attribute C_PSCLK_PORT : string;
  attribute C_PSCLK_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "psclk";
  attribute C_PSDONE_PORT : string;
  attribute C_PSDONE_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "psdone";
  attribute C_PSEN_PORT : string;
  attribute C_PSEN_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "psen";
  attribute C_PSINCDEC_PORT : string;
  attribute C_PSINCDEC_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "psincdec";
  attribute C_REF_CLK_FREQ : integer;
  attribute C_REF_CLK_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 100;
  attribute C_REF_JITTER1 : string;
  attribute C_REF_JITTER1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.010000";
  attribute C_REF_JITTER2 : string;
  attribute C_REF_JITTER2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.010000";
  attribute C_RESET_PORT : string;
  attribute C_RESET_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "reset";
  attribute C_RESET_TYPE : string;
  attribute C_RESET_TYPE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "ACTIVE_HIGH";
  attribute C_SAFECLOCK_STARTUP_MODE : string;
  attribute C_SAFECLOCK_STARTUP_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "DESKEW_MODE";
  attribute C_SECONDARY_IN_FREQ : integer;
  attribute C_SECONDARY_IN_FREQ of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 108;
  attribute C_SECONDARY_PORT : string;
  attribute C_SECONDARY_PORT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "clk_in2";
  attribute C_SECONDARY_SOURCE : string;
  attribute C_SECONDARY_SOURCE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "Single_ended_clock_capable_pin";
  attribute C_SIM_DEVICE : string;
  attribute C_SIM_DEVICE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "VERSAL_AI_EDGE";
  attribute C_SS_MODE : string;
  attribute C_SS_MODE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "CENTER_HIGH";
  attribute C_SS_MOD_PERIOD : integer;
  attribute C_SS_MOD_PERIOD of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 4000;
  attribute C_SS_MOD_TIME : string;
  attribute C_SS_MOD_TIME of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "0.004000";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 11;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 32;
  attribute C_USER_CLK_FREQ0 : integer;
  attribute C_USER_CLK_FREQ0 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 100;
  attribute C_USER_CLK_FREQ1 : integer;
  attribute C_USER_CLK_FREQ1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 100;
  attribute C_USER_CLK_FREQ2 : integer;
  attribute C_USER_CLK_FREQ2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 100;
  attribute C_USER_CLK_FREQ3 : integer;
  attribute C_USER_CLK_FREQ3 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 100;
  attribute C_USE_CLKFB_STOPPED : integer;
  attribute C_USE_CLKFB_STOPPED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_CLOCK_SEQUENCING : integer;
  attribute C_USE_CLOCK_SEQUENCING of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_DYN_PHASE_SHIFT : integer;
  attribute C_USE_DYN_PHASE_SHIFT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_DYN_RECONFIG : integer;
  attribute C_USE_DYN_RECONFIG of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_FREQ_SYNTH : integer;
  attribute C_USE_FREQ_SYNTH of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_USE_INCLK_STOPPED : integer;
  attribute C_USE_INCLK_STOPPED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_INCLK_SWITCHOVER : integer;
  attribute C_USE_INCLK_SWITCHOVER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_LOCKED : integer;
  attribute C_USE_LOCKED of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_USE_LOCKED_DESKEW1 : integer;
  attribute C_USE_LOCKED_DESKEW1 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_LOCKED_DESKEW2 : integer;
  attribute C_USE_LOCKED_DESKEW2 of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_LOCKED_FB : integer;
  attribute C_USE_LOCKED_FB of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_MIN_POWER : integer;
  attribute C_USE_MIN_POWER of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_PHASE_ALIGNMENT : integer;
  attribute C_USE_PHASE_ALIGNMENT of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_POWER_DOWN : integer;
  attribute C_USE_POWER_DOWN of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_RESET : integer;
  attribute C_USE_RESET of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 1;
  attribute C_USE_SAFE_CLOCK_STARTUP : integer;
  attribute C_USE_SAFE_CLOCK_STARTUP of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is 0;
  attribute C_USE_SPREAD_SPECTRUM : string;
  attribute C_USE_SPREAD_SPECTRUM of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
  attribute C_VCO_MAX : string;
  attribute C_VCO_MAX of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "4320.000000";
  attribute C_VCO_MIN : string;
  attribute C_VCO_MIN of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "2160.000000";
  attribute C_ZHOLD : string;
  attribute C_ZHOLD of extended_phy_layer_clk_wizard_0_0_clk_wiz_top : entity is "FALSE";
end extended_phy_layer_clk_wizard_0_0_clk_wiz_top;

architecture STRUCTURE of extended_phy_layer_clk_wizard_0_0_clk_wiz_top is
  signal \<const0>\ : STD_LOGIC;
begin
  clk_glitch(3) <= \<const0>\;
  clk_glitch(2) <= \<const0>\;
  clk_glitch(1) <= \<const0>\;
  clk_glitch(0) <= \<const0>\;
  clk_oor(3) <= \<const0>\;
  clk_oor(2) <= \<const0>\;
  clk_oor(1) <= \<const0>\;
  clk_oor(0) <= \<const0>\;
  clk_stop(3) <= \<const0>\;
  clk_stop(2) <= \<const0>\;
  clk_stop(1) <= \<const0>\;
  clk_stop(0) <= \<const0>\;
  clkfb_out_n <= \<const0>\;
  clkfb_out_p <= \<const0>\;
  interrupt <= \<const0>\;
  locked_fb <= \<const0>\;
  s_axi_arready <= \<const0>\;
  s_axi_awready <= \<const0>\;
  s_axi_bresp(1) <= \<const0>\;
  s_axi_bresp(0) <= \<const0>\;
  s_axi_bvalid <= \<const0>\;
  s_axi_rdata(31) <= \<const0>\;
  s_axi_rdata(30) <= \<const0>\;
  s_axi_rdata(29) <= \<const0>\;
  s_axi_rdata(28) <= \<const0>\;
  s_axi_rdata(27) <= \<const0>\;
  s_axi_rdata(26) <= \<const0>\;
  s_axi_rdata(25) <= \<const0>\;
  s_axi_rdata(24) <= \<const0>\;
  s_axi_rdata(23) <= \<const0>\;
  s_axi_rdata(22) <= \<const0>\;
  s_axi_rdata(21) <= \<const0>\;
  s_axi_rdata(20) <= \<const0>\;
  s_axi_rdata(19) <= \<const0>\;
  s_axi_rdata(18) <= \<const0>\;
  s_axi_rdata(17) <= \<const0>\;
  s_axi_rdata(16) <= \<const0>\;
  s_axi_rdata(15) <= \<const0>\;
  s_axi_rdata(14) <= \<const0>\;
  s_axi_rdata(13) <= \<const0>\;
  s_axi_rdata(12) <= \<const0>\;
  s_axi_rdata(11) <= \<const0>\;
  s_axi_rdata(10) <= \<const0>\;
  s_axi_rdata(9) <= \<const0>\;
  s_axi_rdata(8) <= \<const0>\;
  s_axi_rdata(7) <= \<const0>\;
  s_axi_rdata(6) <= \<const0>\;
  s_axi_rdata(5) <= \<const0>\;
  s_axi_rdata(4) <= \<const0>\;
  s_axi_rdata(3) <= \<const0>\;
  s_axi_rdata(2) <= \<const0>\;
  s_axi_rdata(1) <= \<const0>\;
  s_axi_rdata(0) <= \<const0>\;
  s_axi_rresp(1) <= \<const0>\;
  s_axi_rresp(0) <= \<const0>\;
  s_axi_rvalid <= \<const0>\;
  s_axi_wready <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
clock_primitive_inst: entity work.extended_phy_layer_clk_wizard_0_0_clocking_structure
     port map (
      clk_in1 => clk_in1,
      clk_out1 => clk_out1,
      locked => locked,
      reset => reset
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity extended_phy_layer_clk_wizard_0_0 is
  port (
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of extended_phy_layer_clk_wizard_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of extended_phy_layer_clk_wizard_0_0 : entity is "extended_phy_layer_clk_wizard_0_0,extended_phy_layer_clk_wizard_0_0_clk_wiz_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of extended_phy_layer_clk_wizard_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of extended_phy_layer_clk_wizard_0_0 : entity is "extended_phy_layer_clk_wizard_0_0_clk_wiz_top,Vivado 2024.1";
end extended_phy_layer_clk_wizard_0_0;

architecture STRUCTURE of extended_phy_layer_clk_wizard_0_0 is
  signal NLW_inst_clkfb_out_n_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_clkfb_out_p_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_interrupt_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_locked_fb_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_arready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_awready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_bvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_rvalid_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_s_axi_wready_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_clk_glitch_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_clk_oor_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_clk_stop_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_inst_s_axi_bresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_inst_s_axi_rdata_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_s_axi_rresp_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute C_ACTUAL_PFD : string;
  attribute C_ACTUAL_PFD of inst : label is "30.000000";
  attribute C_ACTUAL_VCO : string;
  attribute C_ACTUAL_VCO of inst : label is "3570.000000";
  attribute C_AUTO_NUMMBUFGCE : integer;
  attribute C_AUTO_NUMMBUFGCE of inst : label is 0;
  attribute C_AUTO_PRIMITIVE : string;
  attribute C_AUTO_PRIMITIVE of inst : label is "MMCM";
  attribute C_BANDWIDTH : string;
  attribute C_BANDWIDTH of inst : label is "OPTIMIZED";
  attribute C_BUFGCE_DIV_CE_TYPE : string;
  attribute C_BUFGCE_DIV_CE_TYPE of inst : label is "SYNC";
  attribute C_CDDCDONE_PORT : string;
  attribute C_CDDCDONE_PORT of inst : label is "cddcdone";
  attribute C_CDDCREQ_PORT : string;
  attribute C_CDDCREQ_PORT of inst : label is "cddcreq";
  attribute C_CE_SYNC_EXT : integer;
  attribute C_CE_SYNC_EXT of inst : label is 0;
  attribute C_CE_TYPE : string;
  attribute C_CE_TYPE of inst : label is "SYNC";
  attribute C_CLKFB1_DESKEW_PORT : string;
  attribute C_CLKFB1_DESKEW_PORT of inst : label is "clkfb1_deskew";
  attribute C_CLKFB2_DESKEW_PORT : string;
  attribute C_CLKFB2_DESKEW_PORT of inst : label is "clkfb2_deskew";
  attribute C_CLKFBIN_IBUF : integer;
  attribute C_CLKFBIN_IBUF of inst : label is 0;
  attribute C_CLKFBIN_IBUFDS : integer;
  attribute C_CLKFBIN_IBUFDS of inst : label is 0;
  attribute C_CLKFBIN_OBUF : integer;
  attribute C_CLKFBIN_OBUF of inst : label is 0;
  attribute C_CLKFBIN_OBUFDS : integer;
  attribute C_CLKFBIN_OBUFDS of inst : label is 0;
  attribute C_CLKFBOUT_BUFG : integer;
  attribute C_CLKFBOUT_BUFG of inst : label is 0;
  attribute C_CLKFBOUT_FRACT : integer;
  attribute C_CLKFBOUT_FRACT of inst : label is 0;
  attribute C_CLKFBOUT_MULT : integer;
  attribute C_CLKFBOUT_MULT of inst : label is 1;
  attribute C_CLKFBOUT_ODDR : integer;
  attribute C_CLKFBOUT_ODDR of inst : label is 0;
  attribute C_CLKFBOUT_PHASE : string;
  attribute C_CLKFBOUT_PHASE of inst : label is "0.000000";
  attribute C_CLKFB_BUFG : integer;
  attribute C_CLKFB_BUFG of inst : label is 0;
  attribute C_CLKFB_DESKEW_PORT : string;
  attribute C_CLKFB_DESKEW_PORT of inst : label is "clkfb_deskew";
  attribute C_CLKFB_IN_PORT : string;
  attribute C_CLKFB_IN_PORT of inst : label is "clkfb_in";
  attribute C_CLKFB_IN_SIGNALING : string;
  attribute C_CLKFB_IN_SIGNALING of inst : label is "SINGLE";
  attribute C_CLKFB_OUT_PORT : string;
  attribute C_CLKFB_OUT_PORT of inst : label is "clkfb_out";
  attribute C_CLKFB_STOPPED_PORT : string;
  attribute C_CLKFB_STOPPED_PORT of inst : label is "clkfb_stopped";
  attribute C_CLKIN1_BUFG : integer;
  attribute C_CLKIN1_BUFG of inst : label is 0;
  attribute C_CLKIN1_DESKEW_PORT : string;
  attribute C_CLKIN1_DESKEW_PORT of inst : label is "clkin1_deskew";
  attribute C_CLKIN1_IBUF : integer;
  attribute C_CLKIN1_IBUF of inst : label is 1;
  attribute C_CLKIN1_IBUFDS : integer;
  attribute C_CLKIN1_IBUFDS of inst : label is 0;
  attribute C_CLKIN1_JITTER_PS : string;
  attribute C_CLKIN1_JITTER_PS of inst : label is "100.000000";
  attribute C_CLKIN1_PERIOD : string;
  attribute C_CLKIN1_PERIOD of inst : label is "6.666670";
  attribute C_CLKIN2_BUFG : integer;
  attribute C_CLKIN2_BUFG of inst : label is 0;
  attribute C_CLKIN2_DESKEW_PORT : string;
  attribute C_CLKIN2_DESKEW_PORT of inst : label is "clkin2_deskew";
  attribute C_CLKIN2_IBUF : integer;
  attribute C_CLKIN2_IBUF of inst : label is 0;
  attribute C_CLKIN2_IBUFDS : integer;
  attribute C_CLKIN2_IBUFDS of inst : label is 0;
  attribute C_CLKIN2_JITTER_PS : string;
  attribute C_CLKIN2_JITTER_PS of inst : label is "100.000000";
  attribute C_CLKIN2_PERIOD : string;
  attribute C_CLKIN2_PERIOD of inst : label is "9.259260";
  attribute C_CLKIN_DESKEW_PORT : string;
  attribute C_CLKIN_DESKEW_PORT of inst : label is "clkin_deskew";
  attribute C_CLKOUT1_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT1_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT1_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT1_ACTUAL_OUT_FREQ of inst : label is "238.000000";
  attribute C_CLKOUT1_ACTUAL_PHASE : string;
  attribute C_CLKOUT1_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT1_DIVIDE : integer;
  attribute C_CLKOUT1_DIVIDE of inst : label is 15;
  attribute C_CLKOUT1_DRIVES : string;
  attribute C_CLKOUT1_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT1_DYN_PS : string;
  attribute C_CLKOUT1_DYN_PS of inst : label is "00";
  attribute C_CLKOUT1_GROUPING : string;
  attribute C_CLKOUT1_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT1_MATCHED_ROUTING : integer;
  attribute C_CLKOUT1_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT1_MBUFGCE_MODE : integer;
  attribute C_CLKOUT1_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT1_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT1_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT1_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT1_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT1_REQUESTED_PHASE : string;
  attribute C_CLKOUT1_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT1_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT1_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT1_USED : integer;
  attribute C_CLKOUT1_USED of inst : label is 1;
  attribute C_CLKOUT2_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT2_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT2_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT2_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT2_ACTUAL_PHASE : string;
  attribute C_CLKOUT2_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT2_DIVIDE : integer;
  attribute C_CLKOUT2_DIVIDE of inst : label is 12;
  attribute C_CLKOUT2_DRIVES : string;
  attribute C_CLKOUT2_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT2_DYN_PS : string;
  attribute C_CLKOUT2_DYN_PS of inst : label is "00";
  attribute C_CLKOUT2_GROUPING : string;
  attribute C_CLKOUT2_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT2_MATCHED_ROUTING : integer;
  attribute C_CLKOUT2_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT2_MBUFGCE_MODE : integer;
  attribute C_CLKOUT2_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT2_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT2_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT2_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT2_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT2_REQUESTED_PHASE : string;
  attribute C_CLKOUT2_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT2_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT2_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT2_USED : integer;
  attribute C_CLKOUT2_USED of inst : label is 0;
  attribute C_CLKOUT3_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT3_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT3_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT3_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT3_ACTUAL_PHASE : string;
  attribute C_CLKOUT3_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT3_DIVIDE : integer;
  attribute C_CLKOUT3_DIVIDE of inst : label is 12;
  attribute C_CLKOUT3_DRIVES : string;
  attribute C_CLKOUT3_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT3_DYN_PS : string;
  attribute C_CLKOUT3_DYN_PS of inst : label is "00";
  attribute C_CLKOUT3_GROUPING : string;
  attribute C_CLKOUT3_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT3_MATCHED_ROUTING : integer;
  attribute C_CLKOUT3_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT3_MBUFGCE_MODE : integer;
  attribute C_CLKOUT3_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT3_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT3_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT3_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT3_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT3_REQUESTED_PHASE : string;
  attribute C_CLKOUT3_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT3_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT3_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT3_USED : integer;
  attribute C_CLKOUT3_USED of inst : label is 0;
  attribute C_CLKOUT4_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT4_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT4_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT4_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT4_ACTUAL_PHASE : string;
  attribute C_CLKOUT4_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT4_DIVIDE : integer;
  attribute C_CLKOUT4_DIVIDE of inst : label is 12;
  attribute C_CLKOUT4_DRIVES : string;
  attribute C_CLKOUT4_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT4_DYN_PS : string;
  attribute C_CLKOUT4_DYN_PS of inst : label is "00";
  attribute C_CLKOUT4_GROUPING : string;
  attribute C_CLKOUT4_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT4_MATCHED_ROUTING : integer;
  attribute C_CLKOUT4_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT4_MBUFGCE_MODE : integer;
  attribute C_CLKOUT4_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT4_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT4_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT4_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT4_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT4_REQUESTED_PHASE : string;
  attribute C_CLKOUT4_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT4_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT4_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT4_USED : integer;
  attribute C_CLKOUT4_USED of inst : label is 0;
  attribute C_CLKOUT5_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT5_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT5_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT5_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT5_ACTUAL_PHASE : string;
  attribute C_CLKOUT5_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT5_DIVIDE : integer;
  attribute C_CLKOUT5_DIVIDE of inst : label is 12;
  attribute C_CLKOUT5_DRIVES : string;
  attribute C_CLKOUT5_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT5_DYN_PS : string;
  attribute C_CLKOUT5_DYN_PS of inst : label is "00";
  attribute C_CLKOUT5_GROUPING : string;
  attribute C_CLKOUT5_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT5_MATCHED_ROUTING : integer;
  attribute C_CLKOUT5_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT5_MBUFGCE_MODE : integer;
  attribute C_CLKOUT5_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT5_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT5_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT5_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT5_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT5_REQUESTED_PHASE : string;
  attribute C_CLKOUT5_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT5_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT5_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT5_USED : integer;
  attribute C_CLKOUT5_USED of inst : label is 0;
  attribute C_CLKOUT6_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT6_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT6_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT6_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT6_ACTUAL_PHASE : string;
  attribute C_CLKOUT6_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT6_DIVIDE : integer;
  attribute C_CLKOUT6_DIVIDE of inst : label is 12;
  attribute C_CLKOUT6_DRIVES : string;
  attribute C_CLKOUT6_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT6_DYN_PS : string;
  attribute C_CLKOUT6_DYN_PS of inst : label is "00";
  attribute C_CLKOUT6_GROUPING : string;
  attribute C_CLKOUT6_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT6_MATCHED_ROUTING : integer;
  attribute C_CLKOUT6_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT6_MBUFGCE_MODE : integer;
  attribute C_CLKOUT6_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT6_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT6_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT6_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT6_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT6_REQUESTED_PHASE : string;
  attribute C_CLKOUT6_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT6_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT6_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT6_USED : integer;
  attribute C_CLKOUT6_USED of inst : label is 0;
  attribute C_CLKOUT7_ACTUAL_DUTY_CYCLE : string;
  attribute C_CLKOUT7_ACTUAL_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT7_ACTUAL_OUT_FREQ : string;
  attribute C_CLKOUT7_ACTUAL_OUT_FREQ of inst : label is "119.000000";
  attribute C_CLKOUT7_ACTUAL_PHASE : string;
  attribute C_CLKOUT7_ACTUAL_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT7_DIVIDE : integer;
  attribute C_CLKOUT7_DIVIDE of inst : label is 12;
  attribute C_CLKOUT7_DRIVES : string;
  attribute C_CLKOUT7_DRIVES of inst : label is "BUFG";
  attribute C_CLKOUT7_DYN_PS : string;
  attribute C_CLKOUT7_DYN_PS of inst : label is "00";
  attribute C_CLKOUT7_GROUPING : string;
  attribute C_CLKOUT7_GROUPING of inst : label is "Auto";
  attribute C_CLKOUT7_MATCHED_ROUTING : integer;
  attribute C_CLKOUT7_MATCHED_ROUTING of inst : label is 0;
  attribute C_CLKOUT7_MBUFGCE_MODE : integer;
  attribute C_CLKOUT7_MBUFGCE_MODE of inst : label is 0;
  attribute C_CLKOUT7_REQUESTED_DUTY_CYCLE : string;
  attribute C_CLKOUT7_REQUESTED_DUTY_CYCLE of inst : label is "50.000000";
  attribute C_CLKOUT7_REQUESTED_OUT_FREQ : string;
  attribute C_CLKOUT7_REQUESTED_OUT_FREQ of inst : label is "100.000000";
  attribute C_CLKOUT7_REQUESTED_PHASE : string;
  attribute C_CLKOUT7_REQUESTED_PHASE of inst : label is "0.000000";
  attribute C_CLKOUT7_SEQUENCE_NUMBER : integer;
  attribute C_CLKOUT7_SEQUENCE_NUMBER of inst : label is 1;
  attribute C_CLKOUT7_USED : integer;
  attribute C_CLKOUT7_USED of inst : label is 0;
  attribute C_CLKOUTFB_PHASE_CTRL : string;
  attribute C_CLKOUTFB_PHASE_CTRL of inst : label is "00";
  attribute C_CLK_IN_SEL_PORT : string;
  attribute C_CLK_IN_SEL_PORT of inst : label is "clk_in_sel";
  attribute C_CLK_OUT1_PORT : string;
  attribute C_CLK_OUT1_PORT of inst : label is "clk_out1";
  attribute C_CLK_OUT2_PORT : string;
  attribute C_CLK_OUT2_PORT of inst : label is "clk_out2";
  attribute C_CLK_OUT3_PORT : string;
  attribute C_CLK_OUT3_PORT of inst : label is "clk_out3";
  attribute C_CLK_OUT4_PORT : string;
  attribute C_CLK_OUT4_PORT of inst : label is "clk_out4";
  attribute C_CLK_OUT5_PORT : string;
  attribute C_CLK_OUT5_PORT of inst : label is "clk_out5";
  attribute C_CLK_OUT6_PORT : string;
  attribute C_CLK_OUT6_PORT of inst : label is "clk_out6";
  attribute C_CLK_OUT7_PORT : string;
  attribute C_CLK_OUT7_PORT of inst : label is "clk_out7";
  attribute C_CLK_TREE1 : integer;
  attribute C_CLK_TREE1 of inst : label is 0;
  attribute C_CLK_TREE2 : integer;
  attribute C_CLK_TREE2 of inst : label is 0;
  attribute C_CLK_TREE3 : integer;
  attribute C_CLK_TREE3 of inst : label is 0;
  attribute C_CLK_TREE4 : integer;
  attribute C_CLK_TREE4 of inst : label is 0;
  attribute C_CLK_TREE5 : integer;
  attribute C_CLK_TREE5 of inst : label is 0;
  attribute C_CLK_TREE6 : integer;
  attribute C_CLK_TREE6 of inst : label is 0;
  attribute C_CLK_TREE7 : integer;
  attribute C_CLK_TREE7 of inst : label is 0;
  attribute C_COMPENSATION : string;
  attribute C_COMPENSATION of inst : label is "AUTO";
  attribute C_DADDR_PORT : string;
  attribute C_DADDR_PORT of inst : label is "daddr";
  attribute C_DCLK_PORT : string;
  attribute C_DCLK_PORT of inst : label is "dclk";
  attribute C_DEN_PORT : string;
  attribute C_DEN_PORT of inst : label is "den";
  attribute C_DESKEW_DELAY1 : integer;
  attribute C_DESKEW_DELAY1 of inst : label is 0;
  attribute C_DESKEW_DELAY2 : integer;
  attribute C_DESKEW_DELAY2 of inst : label is 0;
  attribute C_DESKEW_DELAY_EN1 : string;
  attribute C_DESKEW_DELAY_EN1 of inst : label is "FALSE";
  attribute C_DESKEW_DELAY_EN2 : string;
  attribute C_DESKEW_DELAY_EN2 of inst : label is "FALSE";
  attribute C_DESKEW_DELAY_PATH1 : string;
  attribute C_DESKEW_DELAY_PATH1 of inst : label is "FALSE";
  attribute C_DESKEW_DELAY_PATH2 : string;
  attribute C_DESKEW_DELAY_PATH2 of inst : label is "FALSE";
  attribute C_DESKEW_FB1 : integer;
  attribute C_DESKEW_FB1 of inst : label is 1;
  attribute C_DESKEW_FB2 : integer;
  attribute C_DESKEW_FB2 of inst : label is 1;
  attribute C_DESKEW_IN1 : integer;
  attribute C_DESKEW_IN1 of inst : label is 0;
  attribute C_DESKEW_IN2 : integer;
  attribute C_DESKEW_IN2 of inst : label is 0;
  attribute C_DESKEW_LOCK_CIRCUIT_EN1 : integer;
  attribute C_DESKEW_LOCK_CIRCUIT_EN1 of inst : label is 0;
  attribute C_DESKEW_LOCK_CIRCUIT_EN2 : integer;
  attribute C_DESKEW_LOCK_CIRCUIT_EN2 of inst : label is 0;
  attribute C_DIN_PORT : string;
  attribute C_DIN_PORT of inst : label is "din";
  attribute C_DIVCLK_DIVIDE : integer;
  attribute C_DIVCLK_DIVIDE of inst : label is 5;
  attribute C_DIVIDE1_AUTO : string;
  attribute C_DIVIDE1_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE2_AUTO : string;
  attribute C_DIVIDE2_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE3_AUTO : string;
  attribute C_DIVIDE3_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE4_AUTO : string;
  attribute C_DIVIDE4_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE5_AUTO : string;
  attribute C_DIVIDE5_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE6_AUTO : string;
  attribute C_DIVIDE6_AUTO of inst : label is "0.000000";
  attribute C_DIVIDE7_AUTO : string;
  attribute C_DIVIDE7_AUTO of inst : label is "0.000000";
  attribute C_DOUT_PORT : string;
  attribute C_DOUT_PORT of inst : label is "dout";
  attribute C_DRDY_PORT : string;
  attribute C_DRDY_PORT of inst : label is "drdy";
  attribute C_DRP_ADDR_SET1 : string;
  attribute C_DRP_ADDR_SET1 of inst : label is "0000 0000 0000 0000";
  attribute C_DRP_ADDR_SET2 : string;
  attribute C_DRP_ADDR_SET2 of inst : label is "0000 0000 0000 0000";
  attribute C_DRP_ADDR_SET3 : string;
  attribute C_DRP_ADDR_SET3 of inst : label is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET1 : string;
  attribute C_DRP_DATA_SET1 of inst : label is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET2 : string;
  attribute C_DRP_DATA_SET2 of inst : label is "0000 0000 0000 0000";
  attribute C_DRP_DATA_SET3 : string;
  attribute C_DRP_DATA_SET3 of inst : label is "0000 0000 0000 0000";
  attribute C_DWE_PORT : string;
  attribute C_DWE_PORT of inst : label is "dwe";
  attribute C_D_MAX : string;
  attribute C_D_MAX of inst : label is "107.000000";
  attribute C_D_MIN : string;
  attribute C_D_MIN of inst : label is "1.000000";
  attribute C_ENABLE_CLOCK_MONITOR : integer;
  attribute C_ENABLE_CLOCK_MONITOR of inst : label is 0;
  attribute C_ENABLE_USER_CLOCK0 : integer;
  attribute C_ENABLE_USER_CLOCK0 of inst : label is 0;
  attribute C_ENABLE_USER_CLOCK1 : integer;
  attribute C_ENABLE_USER_CLOCK1 of inst : label is 0;
  attribute C_ENABLE_USER_CLOCK2 : integer;
  attribute C_ENABLE_USER_CLOCK2 of inst : label is 0;
  attribute C_ENABLE_USER_CLOCK3 : integer;
  attribute C_ENABLE_USER_CLOCK3 of inst : label is 0;
  attribute C_Enable_PLL0 : integer;
  attribute C_Enable_PLL0 of inst : label is 0;
  attribute C_Enable_PLL1 : integer;
  attribute C_Enable_PLL1 of inst : label is 0;
  attribute C_FEEDBACK_SOURCE : string;
  attribute C_FEEDBACK_SOURCE of inst : label is "FDBK_AUTO";
  attribute C_INCLK_SUM_ROW0 : string;
  attribute C_INCLK_SUM_ROW0 of inst : label is "Input Clock   Freq (MHz)    Input Jitter (UI)";
  attribute C_INCLK_SUM_ROW1 : string;
  attribute C_INCLK_SUM_ROW1 of inst : label is "primary       100.000        0.010";
  attribute C_INCLK_SUM_ROW2 : string;
  attribute C_INCLK_SUM_ROW2 of inst : label is "secondary      100.000        0.010";
  attribute C_INPUT_CLK_STOPPED_PORT : string;
  attribute C_INPUT_CLK_STOPPED_PORT of inst : label is "input_clk_stopped";
  attribute C_INTERFACE_SELECTION : integer;
  attribute C_INTERFACE_SELECTION of inst : label is 1;
  attribute C_JITTER_SEL : string;
  attribute C_JITTER_SEL of inst : label is "No_Jitter";
  attribute C_LOCKED_DESKEW1_PORT : string;
  attribute C_LOCKED_DESKEW1_PORT of inst : label is "locked_deskew1";
  attribute C_LOCKED_DESKEW2_PORT : string;
  attribute C_LOCKED_DESKEW2_PORT of inst : label is "locked_deskew2";
  attribute C_LOCKED_FB_PORT : string;
  attribute C_LOCKED_FB_PORT of inst : label is "locked_fb";
  attribute C_LOCKED_PORT : string;
  attribute C_LOCKED_PORT of inst : label is "locked";
  attribute C_MAXCOUNT_DESKEW1 : integer;
  attribute C_MAXCOUNT_DESKEW1 of inst : label is 0;
  attribute C_MAXCOUNT_DESKEW2 : integer;
  attribute C_MAXCOUNT_DESKEW2 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV : integer;
  attribute C_MMCMBUFGCEDIV of inst : label is 0;
  attribute C_MMCMBUFGCEDIV1 : integer;
  attribute C_MMCMBUFGCEDIV1 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV2 : integer;
  attribute C_MMCMBUFGCEDIV2 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV3 : integer;
  attribute C_MMCMBUFGCEDIV3 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV4 : integer;
  attribute C_MMCMBUFGCEDIV4 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV5 : integer;
  attribute C_MMCMBUFGCEDIV5 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV6 : integer;
  attribute C_MMCMBUFGCEDIV6 of inst : label is 0;
  attribute C_MMCMBUFGCEDIV7 : integer;
  attribute C_MMCMBUFGCEDIV7 of inst : label is 0;
  attribute C_M_MAX : string;
  attribute C_M_MAX of inst : label is "432.000000";
  attribute C_M_MIN : string;
  attribute C_M_MIN of inst : label is "5.000000";
  attribute C_NUMBUFG : integer;
  attribute C_NUMBUFG of inst : label is 1;
  attribute C_NUMBUFGCE : integer;
  attribute C_NUMBUFGCE of inst : label is 0;
  attribute C_NUMMBUFGCE : integer;
  attribute C_NUMMBUFGCE of inst : label is 0;
  attribute C_NUM_OUT_CLKS : integer;
  attribute C_NUM_OUT_CLKS of inst : label is 1;
  attribute C_OUTCLK_SUM_ROW0A : string;
  attribute C_OUTCLK_SUM_ROW0A of inst : label is "Output    Output      Phase     Duty      Pk-to-Pk        Phase";
  attribute C_OUTCLK_SUM_ROW0B : string;
  attribute C_OUTCLK_SUM_ROW0B of inst : label is "Clock    Freq (MHz) (degrees) Cycle () Jitter (ps)  Error (ps)";
  attribute C_OUTCLK_SUM_ROW1 : string;
  attribute C_OUTCLK_SUM_ROW1 of inst : label is "no clk_out1 output";
  attribute C_OUTCLK_SUM_ROW2 : string;
  attribute C_OUTCLK_SUM_ROW2 of inst : label is "no clk_out2 output";
  attribute C_OUTCLK_SUM_ROW3 : string;
  attribute C_OUTCLK_SUM_ROW3 of inst : label is "no clk_out3 output";
  attribute C_OUTCLK_SUM_ROW4 : string;
  attribute C_OUTCLK_SUM_ROW4 of inst : label is "no clk_out4 output";
  attribute C_OUTCLK_SUM_ROW5 : string;
  attribute C_OUTCLK_SUM_ROW5 of inst : label is "no clk_out5 output";
  attribute C_OUTCLK_SUM_ROW6 : string;
  attribute C_OUTCLK_SUM_ROW6 of inst : label is "no clk_out6 output";
  attribute C_OUTCLK_SUM_ROW7 : string;
  attribute C_OUTCLK_SUM_ROW7 of inst : label is "no clk_out7 output";
  attribute C_OVERRIDE_PRIMITIVE : integer;
  attribute C_OVERRIDE_PRIMITIVE of inst : label is 0;
  attribute C_O_MAX : string;
  attribute C_O_MAX of inst : label is "432.000000";
  attribute C_O_MIN : string;
  attribute C_O_MIN of inst : label is "3.000000";
  attribute C_PHASESHIFT_MODE : string;
  attribute C_PHASESHIFT_MODE of inst : label is "LATENCY";
  attribute C_PLLBUFGCEDIV : integer;
  attribute C_PLLBUFGCEDIV of inst : label is 0;
  attribute C_PLLBUFGCEDIV1 : integer;
  attribute C_PLLBUFGCEDIV1 of inst : label is 0;
  attribute C_PLLBUFGCEDIV2 : integer;
  attribute C_PLLBUFGCEDIV2 of inst : label is 0;
  attribute C_PLLBUFGCEDIV3 : integer;
  attribute C_PLLBUFGCEDIV3 of inst : label is 0;
  attribute C_PLLBUFGCEDIV4 : integer;
  attribute C_PLLBUFGCEDIV4 of inst : label is 0;
  attribute C_POWER_DOWN_PORT : string;
  attribute C_POWER_DOWN_PORT of inst : label is "power_down";
  attribute C_PRECISION : integer;
  attribute C_PRECISION of inst : label is 1;
  attribute C_PRIMARY_PORT : string;
  attribute C_PRIMARY_PORT of inst : label is "clk_in1";
  attribute C_PRIMITIVE : string;
  attribute C_PRIMITIVE of inst : label is "MMCM";
  attribute C_PRIM_IN_FREQ : integer;
  attribute C_PRIM_IN_FREQ of inst : label is 150;
  attribute C_PRIM_SOURCE : string;
  attribute C_PRIM_SOURCE of inst : label is "Single_ended_clock_capable_pin";
  attribute C_PSCLK_PORT : string;
  attribute C_PSCLK_PORT of inst : label is "psclk";
  attribute C_PSDONE_PORT : string;
  attribute C_PSDONE_PORT of inst : label is "psdone";
  attribute C_PSEN_PORT : string;
  attribute C_PSEN_PORT of inst : label is "psen";
  attribute C_PSINCDEC_PORT : string;
  attribute C_PSINCDEC_PORT of inst : label is "psincdec";
  attribute C_REF_CLK_FREQ : integer;
  attribute C_REF_CLK_FREQ of inst : label is 100;
  attribute C_REF_JITTER1 : string;
  attribute C_REF_JITTER1 of inst : label is "0.010000";
  attribute C_REF_JITTER2 : string;
  attribute C_REF_JITTER2 of inst : label is "0.010000";
  attribute C_RESET_PORT : string;
  attribute C_RESET_PORT of inst : label is "reset";
  attribute C_RESET_TYPE : string;
  attribute C_RESET_TYPE of inst : label is "ACTIVE_HIGH";
  attribute C_SAFECLOCK_STARTUP_MODE : string;
  attribute C_SAFECLOCK_STARTUP_MODE of inst : label is "DESKEW_MODE";
  attribute C_SECONDARY_IN_FREQ : integer;
  attribute C_SECONDARY_IN_FREQ of inst : label is 108;
  attribute C_SECONDARY_PORT : string;
  attribute C_SECONDARY_PORT of inst : label is "clk_in2";
  attribute C_SECONDARY_SOURCE : string;
  attribute C_SECONDARY_SOURCE of inst : label is "Single_ended_clock_capable_pin";
  attribute C_SIM_DEVICE : string;
  attribute C_SIM_DEVICE of inst : label is "VERSAL_AI_EDGE";
  attribute C_SS_MODE : string;
  attribute C_SS_MODE of inst : label is "CENTER_HIGH";
  attribute C_SS_MOD_PERIOD : integer;
  attribute C_SS_MOD_PERIOD of inst : label is 4000;
  attribute C_SS_MOD_TIME : string;
  attribute C_SS_MOD_TIME of inst : label is "0.004000";
  attribute C_S_AXI_ADDR_WIDTH : integer;
  attribute C_S_AXI_ADDR_WIDTH of inst : label is 11;
  attribute C_S_AXI_DATA_WIDTH : integer;
  attribute C_S_AXI_DATA_WIDTH of inst : label is 32;
  attribute C_USER_CLK_FREQ0 : integer;
  attribute C_USER_CLK_FREQ0 of inst : label is 100;
  attribute C_USER_CLK_FREQ1 : integer;
  attribute C_USER_CLK_FREQ1 of inst : label is 100;
  attribute C_USER_CLK_FREQ2 : integer;
  attribute C_USER_CLK_FREQ2 of inst : label is 100;
  attribute C_USER_CLK_FREQ3 : integer;
  attribute C_USER_CLK_FREQ3 of inst : label is 100;
  attribute C_USE_CLKFB_STOPPED : integer;
  attribute C_USE_CLKFB_STOPPED of inst : label is 0;
  attribute C_USE_CLOCK_SEQUENCING : integer;
  attribute C_USE_CLOCK_SEQUENCING of inst : label is 0;
  attribute C_USE_DYN_PHASE_SHIFT : integer;
  attribute C_USE_DYN_PHASE_SHIFT of inst : label is 0;
  attribute C_USE_DYN_RECONFIG : integer;
  attribute C_USE_DYN_RECONFIG of inst : label is 0;
  attribute C_USE_FREQ_SYNTH : integer;
  attribute C_USE_FREQ_SYNTH of inst : label is 1;
  attribute C_USE_INCLK_STOPPED : integer;
  attribute C_USE_INCLK_STOPPED of inst : label is 0;
  attribute C_USE_INCLK_SWITCHOVER : integer;
  attribute C_USE_INCLK_SWITCHOVER of inst : label is 0;
  attribute C_USE_LOCKED : integer;
  attribute C_USE_LOCKED of inst : label is 1;
  attribute C_USE_LOCKED_DESKEW1 : integer;
  attribute C_USE_LOCKED_DESKEW1 of inst : label is 0;
  attribute C_USE_LOCKED_DESKEW2 : integer;
  attribute C_USE_LOCKED_DESKEW2 of inst : label is 0;
  attribute C_USE_LOCKED_FB : integer;
  attribute C_USE_LOCKED_FB of inst : label is 0;
  attribute C_USE_MIN_POWER : integer;
  attribute C_USE_MIN_POWER of inst : label is 0;
  attribute C_USE_PHASE_ALIGNMENT : integer;
  attribute C_USE_PHASE_ALIGNMENT of inst : label is 0;
  attribute C_USE_POWER_DOWN : integer;
  attribute C_USE_POWER_DOWN of inst : label is 0;
  attribute C_USE_RESET : integer;
  attribute C_USE_RESET of inst : label is 1;
  attribute C_USE_SAFE_CLOCK_STARTUP : integer;
  attribute C_USE_SAFE_CLOCK_STARTUP of inst : label is 0;
  attribute C_USE_SPREAD_SPECTRUM : string;
  attribute C_USE_SPREAD_SPECTRUM of inst : label is "FALSE";
  attribute C_VCO_MAX : string;
  attribute C_VCO_MAX of inst : label is "4320.000000";
  attribute C_VCO_MIN : string;
  attribute C_VCO_MIN of inst : label is "2160.000000";
  attribute C_ZHOLD : string;
  attribute C_ZHOLD of inst : label is "FALSE";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_in1 : signal is "xilinx.com:signal:clock:1.0 clock_CLK_IN1 CLK_IN1";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_in1 : signal is "XIL_INTERFACENAME clock_CLK_IN1, FREQ_HZ 150000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN extended_phy_layer_clk_in1_0, INSERT_VIP 0, BOARD.ASSOCIATED_PARAM CLK_IN1_BOARD_INTERFACE";
  attribute X_INTERFACE_INFO of clk_out1 : signal is "xilinx.com:signal:clock:1.0 clock_CLK_OUT1 CLK_OUT1";
  attribute X_INTERFACE_PARAMETER of clk_out1 : signal is "XIL_INTERFACENAME clock_CLK_OUT1, FREQ_HZ 238000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN extended_phy_layer_clk_wizard_0_0_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:reset:1.0 reset RST";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, POLARITY ACTIVE_HIGH, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, INSERT_VIP 0";
begin
inst: entity work.extended_phy_layer_clk_wizard_0_0_clk_wiz_top
     port map (
      clk1_ce => '1',
      clk1_clr_n => '1',
      clk2_ce => '1',
      clk2_clr_n => '1',
      clk3_ce => '1',
      clk3_clr_n => '1',
      clk4_ce => '1',
      clk4_clr_n => '1',
      clk5_ce => '1',
      clk5_clr_n => '1',
      clk6_ce => '1',
      clk6_clr_n => '1',
      clk7_ce => '1',
      clk7_clr_n => '1',
      clk_glitch(3 downto 0) => NLW_inst_clk_glitch_UNCONNECTED(3 downto 0),
      clk_in1 => clk_in1,
      clk_in1_n => '0',
      clk_in1_p => '0',
      clk_in2_n => '0',
      clk_in2_p => '0',
      clk_oor(3 downto 0) => NLW_inst_clk_oor_UNCONNECTED(3 downto 0),
      clk_out1 => clk_out1,
      clk_stop(3 downto 0) => NLW_inst_clk_stop_UNCONNECTED(3 downto 0),
      clkfb1_deskew => '0',
      clkfb2_deskew => '0',
      clkfb_in_n => '0',
      clkfb_in_p => '0',
      clkfb_out_n => NLW_inst_clkfb_out_n_UNCONNECTED,
      clkfb_out_p => NLW_inst_clkfb_out_p_UNCONNECTED,
      clkin1_deskew => '0',
      clkin2_deskew => '0',
      interrupt => NLW_inst_interrupt_UNCONNECTED,
      locked => locked,
      locked_fb => NLW_inst_locked_fb_UNCONNECTED,
      power_down => '0',
      ref_clk => '0',
      reset => reset,
      resetn => '0',
      s_axi_aclk => '0',
      s_axi_araddr(10 downto 0) => B"00000000000",
      s_axi_aresetn => '0',
      s_axi_arready => NLW_inst_s_axi_arready_UNCONNECTED,
      s_axi_arvalid => '0',
      s_axi_awaddr(10 downto 0) => B"00000000000",
      s_axi_awready => NLW_inst_s_axi_awready_UNCONNECTED,
      s_axi_awvalid => '0',
      s_axi_bready => '0',
      s_axi_bresp(1 downto 0) => NLW_inst_s_axi_bresp_UNCONNECTED(1 downto 0),
      s_axi_bvalid => NLW_inst_s_axi_bvalid_UNCONNECTED,
      s_axi_rdata(31 downto 0) => NLW_inst_s_axi_rdata_UNCONNECTED(31 downto 0),
      s_axi_rready => '0',
      s_axi_rresp(1 downto 0) => NLW_inst_s_axi_rresp_UNCONNECTED(1 downto 0),
      s_axi_rvalid => NLW_inst_s_axi_rvalid_UNCONNECTED,
      s_axi_wdata(31 downto 0) => B"00000000000000000000000000000000",
      s_axi_wready => NLW_inst_s_axi_wready_UNCONNECTED,
      s_axi_wstrb(3 downto 0) => B"0000",
      s_axi_wvalid => '0',
      user_clk0 => '0',
      user_clk1 => '0',
      user_clk2 => '0',
      user_clk3 => '0'
    );
end STRUCTURE;
