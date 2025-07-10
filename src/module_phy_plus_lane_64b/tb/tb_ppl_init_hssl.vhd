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
----------------------------------------------------------------------------
-- Author(s) : Y.DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 02/07/2025
--
-- Description : This is the testbench of the ppl_init_hssl module
----------------------------------------------------------------------------
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.all;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

library work;
use work.pkg_simu.all;

entity tb_ppl_init_hssl is
end entity;

architecture sim of tb_ppl_init_hssl is

  -- Component under test
  component ppl_init_hssl
    port (
      RST_N                            : in  std_logic;
      CLK                              : in  std_logic;
      PLL_PMA_PWR_UP_PLIH              : out std_logic;
      TX_DRIVER_PWRDWN_N_PLIH          : out std_logic;
      PLL_PMA_RST_N_PLIH               : out std_logic;
      PLL_PMA_LOCK_ANALOG_PLSH         : in  std_logic;
      TX0_RST_N_PLIH                   : out std_logic;
      TX0_BUSY_PLSH                    : in  std_logic;
      RX_PMA_PWR_UP_PLIH               : out std_logic;
      RX_PMA_RST_N_PLIH                : out std_logic;
      RX_PMA_LL_SLOW_LOCKED_PLSH       : in  std_logic;
      RX_RST_N_PLIH                    : out std_logic;
      RX_BUSY_PLSH                     : in  std_logic;
      HSSL_RESET_DONE_PLIH             : out std_logic
    );
  end component;

  -- Signals to connect to DUT
  signal RST_N                      : std_logic := '0';
  signal CLK                        : std_logic := '0';
  signal PLL_PMA_PWR_UP_PLIH        : std_logic;
  signal TX_DRIVER_PWRDWN_N_PLIH    : std_logic;
  signal PLL_PMA_RST_N_PLIH         : std_logic;
  signal PLL_PMA_LOCK_ANALOG_PLSH   : std_logic := '0';
  signal TX0_RST_N_PLIH             : std_logic;
  signal TX0_BUSY_PLSH              : std_logic := '1';
  signal RX_PMA_PWR_UP_PLIH         : std_logic;
  signal RX_PMA_RST_N_PLIH          : std_logic;
  signal RX_PMA_LL_SLOW_LOCKED_PLSH : std_logic := '0';
  signal RX_RST_N_PLIH              : std_logic;
  signal RX_BUSY_PLSH               : std_logic := '1';
  signal HSSL_RESET_DONE_PLIH       : std_logic;

  -- Clock generation
  constant CLK_PERIOD : time := 10 ns;
  
begin

  -- Instantiate DUT
  uut: ppl_init_hssl
    port map (
      RST_N                      => RST_N,
      CLK                        => CLK,
      PLL_PMA_PWR_UP_PLIH        => PLL_PMA_PWR_UP_PLIH,
      TX_DRIVER_PWRDWN_N_PLIH    => TX_DRIVER_PWRDWN_N_PLIH,
      PLL_PMA_RST_N_PLIH         => PLL_PMA_RST_N_PLIH,
      PLL_PMA_LOCK_ANALOG_PLSH   => PLL_PMA_LOCK_ANALOG_PLSH,
      TX0_RST_N_PLIH             => TX0_RST_N_PLIH,
      TX0_BUSY_PLSH              => TX0_BUSY_PLSH,
      RX_PMA_PWR_UP_PLIH         => RX_PMA_PWR_UP_PLIH,
      RX_PMA_RST_N_PLIH          => RX_PMA_RST_N_PLIH,
      RX_PMA_LL_SLOW_LOCKED_PLSH => RX_PMA_LL_SLOW_LOCKED_PLSH,
      RX_RST_N_PLIH              => RX_RST_N_PLIH,
      RX_BUSY_PLSH               => RX_BUSY_PLSH,
      HSSL_RESET_DONE_PLIH       => HSSL_RESET_DONE_PLIH
    );

  -- Clock process
  clk_process: process
  begin
    while true loop
      CLK <= '0';
      wait for CLK_PERIOD / 2;
      CLK <= '1';
      wait for CLK_PERIOD / 2;
    end loop;
  end process;

  -- Stimulus process
  stim_proc: process
    variable test_failed : boolean := false;
  begin
    -- Reset
    RST_N <= '0';
    wait for 20 ns;
    RST_N <= '1';
    ------------------------------------------------------------
    --                     PMA PLL reset                      --
    ------------------------------------------------------------
    wait until (PLL_PMA_PWR_UP_PLIH ='1');-- PMA PLL power up
    wait until (TX_DRIVER_PWRDWN_N_PLIH ='1');-- TX driver power up
    wait until (PLL_PMA_RST_N_PLIH ='1');-- PMA_PLL rst pulse
    wait until rising_edge(CLK);
    PLL_PMA_LOCK_ANALOG_PLSH <='1';

    ------------------------------------------------------------
    --                     TX PCS reset                      --
    ------------------------------------------------------------
    wait until (TX0_RST_N_PLIH ='1');-- TX PCS rst pulse

    wait for 20 ns;
    wait until rising_edge(CLK);
    TX0_BUSY_PLSH <= '0'; -- TX not busy

    ------------------------------------------------------------
    --                     RX PMA PLL reset                   --
    ------------------------------------------------------------
    if RX_PMA_PWR_UP_PLIH ='0' then
        wait until (RX_PMA_PWR_UP_PLIH ='1');-- RX PMA power up
    end if;
    if RX_PMA_RST_N_PLIH ='0' then
        wait until (RX_PMA_RST_N_PLIH ='1');-- RX PMA PLL rst pule
    end if;
    RX_PMA_LL_SLOW_LOCKED_PLSH <= '1';

    ------------------------------------------------------------
    --                      RX PCS reset                      --
    ------------------------------------------------------------
    wait until (RX_RST_N_PLIH ='1');-- TX PCS rst pulse

    wait for 20 ns;
    wait until rising_edge(CLK);
    RX_BUSY_PLSH <= '0'; -- RX not busy

    ------------------------------------------------------------
    --                      IP HSSL Started                   --
    ------------------------------------------------------------
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    wait until rising_edge(CLK);
    if HSSL_RESET_DONE_PLIH ='0' then
      test_failed := true;
    end if;

    log_test_result(test_failed);
    wait;
  end process;

end architecture sim;
