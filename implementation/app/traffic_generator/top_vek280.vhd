-----------------------------------------------------------------------------------
-- #                          Copyright CNES 2025                                 #
-- #                                                                              #
-- # This source describes Open Hardware and is licensed under the CERN-OHL-W v2. #
-- #                                                                              #
-- # You may redistribute and modify this documentation and make products         #
-- # using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).     #
-- #                                                                              #
-- # This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED             #
-- # WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY                 #
-- # AND FITNESS FOR A PARTICULAR PURPOSE.                                        #
-- #                                                                              #
-- # Please see the CERN-OHL-W v2 for applicable conditions.                      #
-----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;

----------------------------------------------------------------------------
entity top_vek280 is 
  port(
       -- System signals
    CLK_FPGA_P     : in std_logic;
    CLK_FPGA_N     : in std_logic;
    RESET          : in std_logic;

    -- NOC IF
    ddr4_dimm1_act_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_dimm1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_dimm1_bg : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_dimm1_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_dm_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr4_dimm1_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_reset_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    lpddr4_clk1_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpddr4_clk1_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );

    -- Spacefibre port 
    QUAD0_GTREFCLK0_in_p     : in std_logic;
    QUAD0_GTREFCLK0_in_n     : in std_logic;

    TX_POS         : out std_logic;                                        -- Positive LVDS serial data send
    TX_NEG         : out std_logic;                                        -- Negative LVDS serial data send
    RX_POS         : in  std_logic;                                        -- Positive LVDS serial data received
    RX_NEG         : in  std_logic                                         -- Negative LVDS serial data received
  );
end entity;

architecture rtl of top_vek280 is 
---------------------------
-- COMPONENT DECLARATION --
---------------------------
  component design_1 is
  port (
    ddr4_dimm1_dq : inout STD_LOGIC_VECTOR ( 63 downto 0 );
    ddr4_dimm1_dqs_t : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_dqs_c : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_adr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    ddr4_dimm1_ba : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_dimm1_bg : out STD_LOGIC_VECTOR ( 1 downto 0 );
    ddr4_dimm1_act_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_reset_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_ck_t : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_ck_c : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    ddr4_dimm1_dm_n : inout STD_LOGIC_VECTOR ( 7 downto 0 );
    ddr4_dimm1_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    clk_l : out STD_LOGIC;
    reset_n_fpga : out STD_LOGIC_VECTOR ( 0 to 0 );
    lpddr4_clk1_clk_p : in STD_LOGIC_VECTOR ( 0 to 0 );
    lpddr4_clk1_clk_n : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK_GTY_0 : in STD_LOGIC;
    RX_POS_0 : in STD_LOGIC;
    RX_NEG_0 : in STD_LOGIC;
    TX_POS_0 : out STD_LOGIC;
    TX_NEG_0 : out STD_LOGIC
  );
  end component design_1;

component clk_wizard_0 
   port (
      clk_out1  : out std_logic; 
      clk_in1_n : in std_logic;     
      clk_in1_p : in std_logic 
      );     
end component;
 
------------------------
-- SIGNAL DECLARATION --
------------------------
-- System signals
signal clk            : std_logic;
signal reset_n        : std_logic;
signal reset_stable   : std_logic;

-- CLK GTY signals
signal quad0_gtrefclk0           : std_logic;


--debouche counter
signal cmpt : unsigned(31 downto 0);

begin

   -- System signal
   reset_n <= not reset_stable ;

    
-- reset button with debouce
   process(CLK, RESET)
   begin
      if RESET = '0' then
         reset_stable <= '0';
         cmpt <= (others => '0');
      elsif rising_edge(CLK) then
         if cmpt =  x"00100000" then --2 ms for clk=50MHz
               reset_stable <= '1';
         else
               cmpt <= cmpt + 1;
         end if;
      end if;
   end process;

-- clock for FPGA
   I_CLOCKING_WIZARD_0 : clk_wizard_0     
      port map (      
         clk_out1    => clk,     
         clk_in1_p   => CLK_FPGA_P, 
         clk_in1_n   => CLK_FPGA_N
      );

-- CLOCK for GTY
   IBUFDS_GTE5_I : IBUFDS_GTE5
   generic map (
     REFCLK_EN_TX_PATH   => '0', 
     REFCLK_ICNTL_RX     => 0, 
     REFCLK_HROW_CK_SEL  => 0
    )
   port map (
     O   => quad0_gtrefclk0, 
     I   => QUAD0_GTREFCLK0_in_p, 
     IB  => QUAD0_GTREFCLK0_in_n, 
     CEB => '0'
     );

-- block design
design_1_i: component design_1
     port map (
      CLK_GTY_0 => quad0_gtrefclk0,
      RX_NEG_0 => RX_NEG,
      RX_POS_0 => RX_POS,
      TX_NEG_0 => TX_NEG,
      TX_POS_0 => TX_POS,
      clk_l => clk,
      ddr4_dimm1_act_n(0) => ddr4_dimm1_act_n(0),
      ddr4_dimm1_adr(16 downto 0) => ddr4_dimm1_adr(16 downto 0),
      ddr4_dimm1_ba(1 downto 0) => ddr4_dimm1_ba(1 downto 0),
      ddr4_dimm1_bg(1 downto 0) => ddr4_dimm1_bg(1 downto 0),
      ddr4_dimm1_ck_c(0) => ddr4_dimm1_ck_c(0),
      ddr4_dimm1_ck_t(0) => ddr4_dimm1_ck_t(0),
      ddr4_dimm1_cke(0) => ddr4_dimm1_cke(0),
      ddr4_dimm1_cs_n(0) => ddr4_dimm1_cs_n(0),
      ddr4_dimm1_dm_n(7 downto 0) => ddr4_dimm1_dm_n(7 downto 0),
      ddr4_dimm1_dq(63 downto 0) => ddr4_dimm1_dq(63 downto 0),
      ddr4_dimm1_dqs_c(7 downto 0) => ddr4_dimm1_dqs_c(7 downto 0),
      ddr4_dimm1_dqs_t(7 downto 0) => ddr4_dimm1_dqs_t(7 downto 0),
      ddr4_dimm1_odt(0) => ddr4_dimm1_odt(0),
      ddr4_dimm1_reset_n(0) => ddr4_dimm1_reset_n(0),
      lpddr4_clk1_clk_n(0) => lpddr4_clk1_clk_n(0),
      lpddr4_clk1_clk_p(0) => lpddr4_clk1_clk_p(0),
      reset_n_fpga(0) => reset_n
    );

end architecture rtl;
