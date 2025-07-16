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
-- Description : This is the testbench of the PHY layer
----------------------------------------------------------------------------
LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

library work;
use work.pkg_simu.all;

entity tb_phy_hssl is
end entity;

architecture sim of tb_phy_hssl is

  ---------------------------------------------------------
  -----               Component declaration           -----
  ---------------------------------------------------------
  component SpaceFibre_64b
    port (
      HSSL_CLOCK_I                  : in  std_logic;
      RX0N                          : in  std_logic;
      RX0P                          : in  std_logic;
      RX1N                          : in  std_logic;
      RX1P                          : in  std_logic;
      RX2N                          : in  std_logic;
      RX2P                          : in  std_logic;
      RX3N                          : in  std_logic;
      RX3P                          : in  std_logic;
      TX0N                          : out std_logic;
      TX0P                          : out std_logic;
      TX1N                          : out std_logic;
      TX1P                          : out std_logic;
      TX2N                          : out std_logic;
      TX2P                          : out std_logic;
      TX3N                          : out std_logic;
      TX3P                          : out std_logic;
      CKREFN                        : in  std_logic;
      CKREFP                        : in  std_logic;
      CLOCK_O                       : out std_logic;
      DYN_CFG_EN_I                  : in  std_logic;
      DYN_ADDR_I                    : in  std_logic_vector(3 downto 0);
      DYN_CALIBRATION_CS_N_I        : in  std_logic;
      DYN_LANE_CS_N_I               : in  std_logic_vector(3 downto 0);
      DYN_WDATA_I                   : in  std_logic_vector(11 downto 0);
      DYN_WDATA_SEL_I               : in  std_logic;
      DYN_WE_N_I                    : in  std_logic;
      PLL_PMA_LOCK_ANALOG           : in  std_logic;
      PLL_PMA_PWR_UP_I              : in  std_logic;
      PLL_PMA_RST_N_I               : in  std_logic;
      PLL_LOCK                      : out std_logic;
      TX0_BUSY_O                    : out std_logic;
      TX0_CLK_ENA_I                 : in  std_logic;
      TX0_CLK_O                     : out std_logic;
      TX0_DATA_I                    : in  std_logic_vector(63 downto 0); -- préciser la taille
      TX0_CTRL_DRIVER_PWRDWN_N_I    : in  std_logic;
      TX0_RST_N_I                   : in  std_logic;
      TX0_CTRL_CHAR_IS_K_I          : in  std_logic_vector(7 downto 0);
      RX0_BUSY_O                    : out std_logic;
      RX0_CTRL_EL_BUFF_STAT_O       : out std_logic;
      RX0_CTRL_CHAR_IS_ALIGNED_O    : out std_logic;
      RX0_CTRL_CHAR_IS_COMMA_O      : out std_logic_vector(7 downto 0);
      RX0_CTRL_CHAR_IS_F_O          : out std_logic_vector(7 downto 0);
      RX0_CTRL_CHAR_IS_K_O          : out std_logic_vector(7 downto 0);
      RX0_CTRL_DISP_ERR_O           : out std_logic_vector(7 downto 0);
      RX0_CTRL_NOT_IN_TABLE_O       : out std_logic_vector(7 downto 0);
      RX0_CTRL_VALID_REALIGN_O      : out std_logic;
      RX0_DATA_O                    : out std_logic_vector(63 downto 0); -- préciser la taille
      RX0_OVS_BIT_SEL_I             : in  std_logic_vector(1 downto 0);
      RX0_EYE_RST_I                 : in  std_logic;
      RX0_PMA_LL_FAST_LOCKED_O      : out std_logic;
      RX0_PMA_LL_SLOW_LOCKED_O      : out std_logic;
      RX0_PMA_LOSS_OF_SIGNAL_O      : out std_logic;
      RX0_PMA_PLL_LOCK_O            : out std_logic;
      RX0_PMA_PLL_LOCK_TRACK_O      : out std_logic;
      RX0_PMA_RST_N_I               : in  std_logic;
      RX0_PMA_PWR_UP_I              : in  std_logic;
      RX0_RST_N_I                   : in  std_logic;
      RX0_TEST_O                    : out std_logic;
      RX0_REPLACE_EN_I              : in  std_logic;
      RX0_ALIGN_SYNC_I              : in  std_logic;
      RX0_EL_BUFF_RST_I             : in  std_logic
    );
  end component;
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

  component ppl_64_skip_insertion
   port (
      RST_N                   : in  std_logic;                                          --! global reset
      CLK                     : in  std_logic;                                          --! Clock generated by GTY IP
      -- ppl_64_lane_ctrl_word_insert (PLCWI) Interface
      NEW_DATA_PLCWI          : in  std_logic;                                          --! New data Flag
      DATA_TX_PLCWI           : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data 64-bit receive from DATA_LINK layer
      VALID_K_CHARAC_PLCWI    : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! Flags indicates which byte is a K character from DATA-LINK layer
      WAIT_SEND_DATA_PSI      : out std_logic;                                          --! Flag to indicates that the lane_ctrl_word_insert send a SKIP control word
      -- HSSL Interface
      DATA_TX_PSI             : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data 64-bit send to manufacturer IP
      VALID_K_CHARAC_PSI      : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! Flags indicates which byte is a K character
      -- ppl_64_lane_init_fsm
      ENABLE_TRANSM_DATA_PLIF : in  std_logic                                           --! Flag to enable to send data
   );
  end component;
  component ppl_64_rx_sync_fsm is
  port(
    RST_N                            : in  std_logic;                                            --! global reset
    CLK                              : in  std_logic;                                            --! Clock generated by GTY IP
    -- FROM Data-link layer
    LANE_RESET_DL                    : in  std_logic;                                            --! Lane reset command from Data-Link Layer.
    -- TO lane_ctrl_word_detection
    DATA_RX_TO_LCWD                  : out std_logic_vector(C_DATA_LENGTH-1  downto 0);          --! 32-bit data to lane_ctrl_word_detect
    VALID_K_CHARAC_TO_LCWD           : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1  downto 0);  --! 4-bit valid K character flags to lane_ctrl_word_detect
    DATA_RDY_TO_LCWD                 : out std_logic;                                            --! Data valid flag to lane_ctrl_word_detect
    -- FROM MANUFACTURER IP
    DATA_RX_FROM_IP                  : in  std_logic_vector(C_DATA_LENGTH-1  downto 0);          --! 32-bit data from GTY IP
    VALID_K_CHARAC_FROM_IP           : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1  downto 0);  --! 4-bit valid K character flags from GTY IP
    INVALID_CHAR_FROM_IP             : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1  downto 0);  --! Invalid character flags from GTY IP
    DISPARITY_ERR_FROM_IP            : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1  downto 0);  --! Disparity error flags from GTY IP
    RX_VALID_REALIGN_FROM_IP         : in  std_logic;                                            --! RX word realign from GTY IP
    COMMA_DET_FROM_IP                : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1  downto 0);  --! Flag indicates that a comma is detected on the word receive
    -- PARAMETERS
    LANE_RESET                       : in  std_logic                                             --! Asserts or de-asserts LaneReset for the lane
  );
  end component;

  component ppl_64_word_alignment is
  port (
    RST_N                            : in  std_logic;                                           --! global reset
    CLK                              : in  std_logic;                                           --! Clock generated by HSSL IP
    -- TO lane_ctrl_word_detection
    DATA_RX_TO_LCWD                  : out std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! 64-bit data to lane_ctrl_word_detect
    VALID_K_CHARAC_TO_LCWD            : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! 8-bit valid K character flags to lane_ctrl_word_detect
    DATA_RDY_TO_LCWD                 : out std_logic;                                           --! Data valid flag to lane_ctrl_word_detect
    -- FROM MANUFACTURER IP
    DATA_RX_FROM_IP                  : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! 64-bit data from HSSL IP
    VALID_K_CHARAC_FROM_IP            : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! 8-bit valid K character flags from HSSL IP
    RX_WORD_IS_ALIGNED_FROM_IP       : in  std_logic;                                           --! RX word is aligned from HSSL IP
    COMMA_DET_FROM_IP                : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0)   --! Flag indicates that a comma is detected on the word receive
   );
end component;


  ---------------------------------------------------------
  -----                  Signal declaration           -----
  ---------------------------------------------------------
  -- Global
signal RST_N                        : std_logic;
signal CLK                          : std_logic;

-- inst_SpaceFibre_64b
signal HSSL_CLOCK_I                 : std_logic;
signal LANE_TX0N                    : std_logic;
signal LANE_TX0P                    : std_logic;
signal TB_CKREF_IN                  : std_logic;
signal HSSL_CLK                     : std_logic;
signal DYN_CFG_EN                   : std_logic;
signal PLL_PMA_LOCK_ANALOG          : std_logic;
signal PLL_PMA_PWR_UP               : std_logic;
signal PLL_PMA_RST_N                : std_logic;
signal TX_BUSY                      : std_logic;
signal TX_CLK_ENA                   : std_logic;
signal TX_CLK                       : std_logic;
signal TX_DATA                      : std_logic_vector(63 downto 0);
signal TX_DRIVER_PWRDWN_N           : std_logic;
signal TX_RST_N                     : std_logic;
signal TX_CTRL_CHAR_IS_K            : std_logic_vector(7 downto 0);
signal RX0_OVS_BIT_SEL_I            : std_logic_vector(1 downto 0);

-- clock & reset
signal LANE_RX0N                   : std_logic;
signal LANE_RX0P                   : std_logic;
signal RX_PMA_LL_FAST_LOCKED       : std_logic;
signal RX_PMA_LL_SLOW_LOCKED       : std_logic;
signal RX_PMA_LOSS_OF_SIGNAL       : std_logic;
signal RX_PMA_PLL_LOCK             : std_logic;
signal RX_PMA_PLL_LOCK_TRACK       : std_logic;
signal RX_PMA_RST_N                : std_logic;
signal RX_PMA_PWR_UP               : std_logic;
signal RX_BUSY                     : std_logic;
signal RX_CTRL_EL_BUFF_STAT        : std_logic;
signal RX_CTRL_CHAR_IS_ALIGNED     : std_logic;
signal RX_CTRL_CHAR_IS_COMMA       : std_logic_vector(7 downto 0);
signal RX_CTRL_CHAR_IS_F           : std_logic_vector(7 downto 0);
signal RX_CTRL_CHAR_IS_K           : std_logic_vector(7 downto 0);
signal RX_CTRL_DISP_ERR            : std_logic_vector(7 downto 0);
signal RX_CTRL_NOT_IN_TABLE        : std_logic_vector(7 downto 0);
signal RX_CTRL_VALID_REALIGN       : std_logic;
signal RX_DATA                     : std_logic_vector(63 downto 0);
signal RX_REPLACE_EN               : std_logic;
signal RX_ALIGN_SYNC               : std_logic;
signal RX_RST_N                    : std_logic;


-- inst_ppl_init_hssl
signal PLL_PMA_PWR_UP_PLIH          : std_logic;
signal TX_DRIVER_PWRDWN_N_PLIH      : std_logic;
signal PLL_PMA_RST_N_PLIH           : std_logic;
signal PLL_PMA_LOCK_ANALOG_PLSH     : std_logic;
signal TX0_RST_N_PLIH               : std_logic;
signal TX0_BUSY_PLSH                : std_logic;
signal RX_PMA_PWR_UP_PLIH           : std_logic;
signal RX_PMA_RST_N_PLIH            : std_logic;
signal RX_PMA_LL_SLOW_LOCKED_PLSH   : std_logic;
signal RX_RST_N_PLIH                : std_logic;
signal RX_BUSY_PLSH                 : std_logic;
signal HSSL_RESET_DONE_PLIH         : std_logic;

-- inst_ppl_64_skip_insertion
signal NEW_DATA_PLCWI               : std_logic;
signal DATA_TX_PLCWI                : std_logic_vector(C_DATA_LENGTH-1 downto 0);
signal VALID_K_CHARAC_PLCWI         : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal WAIT_SEND_DATA_PSI           : std_logic;
signal DATA_TX_PSI                  : std_logic_vector(C_DATA_LENGTH-1 downto 0);
signal VALID_K_CHARAC_PSI           : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal ENABLE_TRANSM_DATA_PLIF      : std_logic;

-- inst_ppl_64_rx_sync_fsm
signal LANE_RESET_DL                : std_logic;
signal DATA_RX_TO_LCWD              : std_logic_vector(C_DATA_LENGTH-1 downto 0);
signal VALID_K_CHARAC_TO_LCWD       : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal DATA_RDY_TO_LCWD             : std_logic;
signal DATA_RX_FROM_IP              : std_logic_vector(C_DATA_LENGTH-1 downto 0);
signal VALID_K_CHARAC_FROM_IP       : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal INVALID_CHAR_FROM_IP         : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal DISPARITY_ERR_FROM_IP        : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal RX_VALID_REALIGN_FROM_IP     : std_logic;
signal COMMA_DET_FROM_IP            : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
signal LANE_RESET                   : std_logic;

-- inst_ppl_64_word_alignment
signal RX_WORD_IS_ALIGNED_FROM_IP   : std_logic;



  -- Clock generation
  constant CLK_PERIOD : time := 13.334 ns;
  
begin

  ---------------------------------------------------------
  -----                  Instantiation                -----
  ---------------------------------------------------------
  inst_SpaceFibre_64b : SpaceFibre_64b
    port map (
      HSSL_CLOCK_I                => HSSL_CLOCK_I,
      RX0N                        => LANE_RX0N,
      RX0P                        => LANE_RX0P,
      RX1N                        => '1',
      RX1P                        => '0',
      RX2N                        => '1',
      RX2P                        => '0',
      RX3N                        => '1',
      RX3P                        => '0',
      TX0N                        => LANE_TX0N,
      TX0P                        => LANE_TX0P,
      TX1N                        => OPEN,
      TX1P                        => OPEN,
      TX2N                        => OPEN,
      TX2P                        => OPEN,
      TX3N                        => OPEN,
      TX3P                        => OPEN,
      CKREFN                      => NOT TB_CKREF_IN,
      CKREFP                      => TB_CKREF_IN,
      CLOCK_O                     => HSSL_CLK,
      DYN_CFG_EN_I                => DYN_CFG_EN,
      DYN_ADDR_I                  => (OTHERS => '0'),
      DYN_CALIBRATION_CS_N_I      => '1',
      DYN_LANE_CS_N_I             => "1111",
      DYN_WDATA_I                 => (OTHERS => '0'),
      DYN_WDATA_SEL_I             => '0',
      DYN_WE_N_I                  => '1',
      PLL_PMA_LOCK_ANALOG         => PLL_PMA_LOCK_ANALOG_PLSH,
      PLL_PMA_PWR_UP_I            => PLL_PMA_PWR_UP_PLIH,
      PLL_PMA_RST_N_I             => PLL_PMA_RST_N_PLIH,
      PLL_LOCK                    => OPEN,
      TX0_BUSY_O                  => TX0_BUSY_PLSH,
      TX0_CLK_ENA_I               => TX_CLK_ENA,
      TX0_CLK_O                   => TX_CLK,
      TX0_DATA_I                  => TX_DATA,
      TX0_CTRL_DRIVER_PWRDWN_N_I  => TX_DRIVER_PWRDWN_N,
      TX0_RST_N_I                 => TX0_RST_N_PLIH,
      TX0_CTRL_CHAR_IS_K_I        => TX_CTRL_CHAR_IS_K,
      RX0_BUSY_O                  => RX_BUSY_PLSH,
      RX0_CTRL_EL_BUFF_STAT_O     => OPEN,
      RX0_CTRL_CHAR_IS_ALIGNED_O  => RX_CTRL_CHAR_IS_ALIGNED,
      RX0_CTRL_CHAR_IS_COMMA_O    => RX_CTRL_CHAR_IS_COMMA,
      RX0_CTRL_CHAR_IS_F_O        => OPEN,
      RX0_CTRL_CHAR_IS_K_O        => RX_CTRL_CHAR_IS_K,
      RX0_CTRL_DISP_ERR_O         => RX_CTRL_DISP_ERR,
      RX0_CTRL_NOT_IN_TABLE_O     => RX_CTRL_NOT_IN_TABLE,
      RX0_CTRL_VALID_REALIGN_O    => RX_CTRL_VALID_REALIGN,
      RX0_DATA_O                  => RX_DATA,
      RX0_OVS_BIT_SEL_I           => "00",
      RX0_EYE_RST_I               => '0',
      RX0_PMA_LL_FAST_LOCKED_O    => OPEN,
      RX0_PMA_LL_SLOW_LOCKED_O    => RX_PMA_LL_SLOW_LOCKED_PLSH,
      RX0_PMA_LOSS_OF_SIGNAL_O    => RX_PMA_LOSS_OF_SIGNAL,
      RX0_PMA_PLL_LOCK_O          => OPEN,
      RX0_PMA_PLL_LOCK_TRACK_O    => OPEN,
      RX0_PMA_RST_N_I             => RX_PMA_RST_N_PLIH,
      RX0_PMA_PWR_UP_I            => RX_PMA_PWR_UP,
      RX0_RST_N_I                 => RX_RST_N_PLIH,
      RX0_TEST_O                  => OPEN,
      RX0_REPLACE_EN_I            => '0',
      RX0_ALIGN_SYNC_I            => RX_ALIGN_SYNC,
      RX0_EL_BUFF_RST_I           => '0'
    );
  inst_ppl_init_hssl: ppl_init_hssl
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
  inst_ppl_64_skip_insertion: ppl_64_skip_insertion
    port map (
      RST_N                   => RST_N,
      CLK                     => CLK,
      -- ppl_64_lane_ctrl_word_insert (PLCWI) Interface
      NEW_DATA_PLCWI          => NEW_DATA_PLCWI,
      DATA_TX_PLCWI           => DATA_TX_PLCWI,
      VALID_K_CHARAC_PLCWI    => VALID_K_CHARAC_PLCWI,
      WAIT_SEND_DATA_PSI      => WAIT_SEND_DATA_PSI,
      -- HSSL Interface
      DATA_TX_PSI             => DATA_TX_PSI,
      VALID_K_CHARAC_PSI      => VALID_K_CHARAC_PSI,
      -- ppl_64_lane_init_fsm
      ENABLE_TRANSM_DATA_PLIF => ENABLE_TRANSM_DATA_PLIF
    );

  inst_ppl_64_rx_sync_fsm : ppl_64_rx_sync_fsm
   port map(
      RST_N                            => RST_N,
      CLK                              => CLK,
      -- FROM Data-link layer
      LANE_RESET_DL                    => LANE_RESET_DL,
      -- TO lane_ctrl_word_detection
      DATA_RX_TO_LCWD                  => DATA_RX_TO_LCWD,
      VALID_K_CHARAC_TO_LCWD           => VALID_K_CHARAC_TO_LCWD,
      DATA_RDY_TO_LCWD                 => DATA_RDY_TO_LCWD,
      -- FROM MANUFACTURER IP
      DATA_RX_FROM_IP                  => DATA_RX_FROM_IP,
      VALID_K_CHARAC_FROM_IP           => VALID_K_CHARAC_FROM_IP,
      INVALID_CHAR_FROM_IP             => INVALID_CHAR_FROM_IP,
      DISPARITY_ERR_FROM_IP            => DISPARITY_ERR_FROM_IP,
      RX_VALID_REALIGN_FROM_IP         => RX_VALID_REALIGN_FROM_IP,
      COMMA_DET_FROM_IP                => COMMA_DET_FROM_IP,
      -- PARAMETERS
      LANE_RESET                       => LANE_RESET
    );

  inst_ppl_64_word_alignment : ppl_64_word_alignment
    port map(
      RST_N                      => RST_N,
      CLK                        => CLK,
      DATA_RX_TO_LCWD            => DATA_RX_TO_LCWD,
      VALID_K_CHARAC_TO_LCWD     => VALID_K_CHARAC_TO_LCWD,
      DATA_RDY_TO_LCWD           => DATA_RDY_TO_LCWD,
      DATA_RX_FROM_IP            => DATA_RX_FROM_IP,
      VALID_K_CHARAC_FROM_IP     => VALID_K_CHARAC_FROM_IP,
      RX_WORD_IS_ALIGNED_FROM_IP => RX_WORD_IS_ALIGNED_FROM_IP,
      COMMA_DET_FROM_IP          => COMMA_DET_FROM_IP
    );
  ---------------------------------------------------------
  -----                     Process                   -----
  ---------------------------------------------------------
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

    wait;
  end process;

end architecture sim;
