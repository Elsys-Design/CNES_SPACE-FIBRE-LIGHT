-------------------------------------------------------------------------------
-- Copyright (c) 1995/2017 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2018.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Synchronizer for BUFG_GT Control Signals
-- /___/   /\      Filename    : BUFG_GT_SYNC.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--  02/03/14 - Initial version.
--  End Revision
-------------------------------------------------------------------------------

----- CELL BUFG_GT_SYNC -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFG_GT_SYNC is
    port (
      CESYNC               : out std_ulogic;
      CLRSYNC              : out std_ulogic;
      CE                   : in std_ulogic;
      CLK                  : in std_ulogic;
      CLR                  : in std_ulogic
    );
  end BUFG_GT_SYNC;

  architecture BUFG_GT_SYNC_V of BUFG_GT_SYNC is
    
  constant MODULE_NAME          : string := "BUFG_GT_SYNC";
  constant OUTCLK_DELAY         : time   := 100 ps;
  
  -- Parameter encodings and registers
  signal CE_in                  : std_ulogic;
  signal CLK_in                 : std_ulogic;
  signal CLR_in                 : std_ulogic;

  --global signals
  signal glblGRESTORE           : std_ulogic := '0';

  -- begin behavioral model declarations
  signal init_done              : std_ulogic := '0';
  signal clr_sync               : std_logic_vector(1 downto 0) := "11";
  signal ce_sync                : std_logic_vector(1 downto 0) := "00";
  
  -- end behavioral model declarations
  
  begin
  glblGRESTORE   <= TO_X01(GRESTORE);

  CE_in  <= '1' when (CE = 'U') else CE; -- rv 1
  CLK_in <= CLK;
  CLR_in <= '0' when (CLR = 'U') else CLR; -- rv 0
  
  INIPROC : process
  begin
    wait for 1 ps;
    init_done <= '1';
    wait;
  end process INIPROC;

-- begin behavioral model
  CESYNC  <= ce_sync(1);
  CLRSYNC <= clr_sync(1);

  prcs_clr:process(init_done, CLK_in, CLR_in)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      clr_sync    <= "11";
    elsif (rising_edge(CLR_in)) then
      clr_sync    <= "11";
    elsif (rising_edge(CLK_in)) then
      clr_sync <= clr_sync(0) & CLR_in;
    end if;
  end process prcs_clr;

  prcs_ce:process(init_done, CLK_in, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      CE_sync    <= "00";
    elsif (rising_edge(glblGRESTORE)) then
      CE_sync    <= "00";
    elsif (rising_edge(CLK_in)) then
      CE_sync <= CE_sync(0) & CE_in;
    end if;
  end process prcs_ce;

-- end behavioral model
 
 end BUFG_GT_SYNC_V;
