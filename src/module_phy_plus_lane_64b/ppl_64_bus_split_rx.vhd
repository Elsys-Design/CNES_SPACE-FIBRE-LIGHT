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
-- Creation date : 30/07/2025
--
-- Description : This module splits the data bus of 64 bits to 32 bits
--               and capability bus from 8 bis to 16 bits
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

entity ppl_64_bus_split_rx is
   port (
      RST_N                        : in  std_logic;                                          --! global reset
      CLK                          : in  std_logic;                                          --! Clock from Data-link layer
      -- Data-link layer interface
      FIFO_RX_RD_EN_DL             : in  std_logic;                                           --! FiFo RX read enable flag
      DATA_RX_PLBSR                : out  std_logic_vector(31 downto 0);                      --! 32-bit Data parallel to be send from Data-Link Layer
      FIFO_RX_DATA_VALID_PLBSR     : out  std_logic;                                          --! Flag new data
      VALID_K_CHARAC_RX_PLBSR      : out  std_logic_vector(3 downto 0);                       --! 4-bit valid K character flags from Data-link layer
      FAR_END_CAPA_PLBSR           : out  std_logic_vector(7 downto 0);                       --! Capability field send in INIT3 control word
      LANE_ACTIVE_PLBSR            : out std_logic;                                           --! Lane Active flag for the DATA Link Layer
      -- fifo_rx_data (PLFRD) interface
      FIFO_RX_RD_EN_PLBSR          : out std_logic;                                          --! FiFo RX read enable flag
      DATA_RX_PLFRD                : in  std_logic_vector(C_DATA_LENGTH-1  downto 0);        --! 64-bit Data parallel to be send from Data-Link Layer
      FIFO_RX_DATA_VALID_PLFRD     : in  std_logic;                                          --! Flag new data
      FIFO_RX_EMPTY_PLFRD          : in  std_logic;                                          --! Flag FIFO Empty
      VALID_K_CHARAC_RX_PLFRD      : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! 8-bit valid K character flags from Data-link layer
      -- ppl_64_ctrl_fifo_rx (PLCFR) interface
      FAR_END_CAPA_PLFRC           : in std_logic_vector(15 downto 0);                      --! Capability field send in INIT3 control word
      LANE_ACTIVE_PLFRC            : in std_logic                                           --! Flag new data
   );
end ppl_64_bus_split_rx;

architecture rtl of ppl_64_bus_split_rx is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
type split_bus_fsm_type is (
  IDLE_ST,               --! Wait FIFO RX is not empty to read it
  FIRST_WORD_ST,         --! Manage the data from fifo rx and split it
  FIRST_WORD_WAIT_RD_ST, --! Wait FIFO_RX_RD_EN_DL to enable FIFO_RX_DATA_VALID_PLBSR flag
  FIRST_WORD_BUFF_ST,    --! Wait FIFO_RX_RD_EN_DL to send the buffered data
  SECOND_WORD_ST         --! Transfer the second word
  );

-- data path
signal current_state       : split_bus_fsm_type;
signal buffer_data_32    : std_logic_vector(31 downto 0);
signal buffer_k_char_4   : std_logic_vector(3 downto 0);
signal buffer_data_64      : std_logic_vector(63 downto 0);
signal buffer_k_char_8     : std_logic_vector(7 downto 0);
signal toggle_data         : std_logic;
-- ctrl path
signal toggle_ctrl         : std_logic;
signal buffer_capa_8       : std_logic_vector(7 downto 0);
begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_concat_data
-- Description: Concatenates 2 words of 32 bits in one data bus of 64 bits
---------------------------------------------------------
p_concat_data: process(CLK, RST_N)
begin
  if RST_N ='0' then
    DATA_RX_PLBSR            <= (others=>'0');
    FIFO_RX_RD_EN_PLBSR      <= '0';
    VALID_K_CHARAC_RX_PLBSR  <= (others=>'0');
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    current_state            <= IDLE_ST;
    buffer_data_32           <= (others => '0');
    buffer_k_char_4          <= (others => '0');
    buffer_data_64           <= (others => '0');
    buffer_k_char_8          <= (others => '0');
    toggle_data              <= '0';
  elsif rising_edge(CLK)  then
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    FIFO_RX_RD_EN_PLBSR      <= '0';
    case current_state is
      when IDLE_ST                =>
                                    if FIFO_RX_EMPTY_PLFRD = '0' then
                                      FIFO_RX_RD_EN_PLBSR <= '1';
                                      current_state       <= FIRST_WORD_ST;
                                    end if;

      when FIRST_WORD_ST          =>
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' then
                                      DATA_RX_PLBSR            <= DATA_RX_PLFRD(31 downto 0);
                                      buffer_data_32           <= DATA_RX_PLFRD(63 downto 32);
                                      VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                      buffer_k_char_4          <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        FIFO_RX_RD_EN_PLBSR      <= '1';
                                        current_state            <= SECOND_WORD_ST;
                                      else
                                        current_state          <= FIRST_WORD_WAIT_RD_ST;
                                      end if;
                                    end if;

      when FIRST_WORD_WAIT_RD_ST  =>
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      current_state            <= SECOND_WORD_ST;
                                      if FIFO_RX_EMPTY_PLFRD = '0' then
                                        FIFO_RX_RD_EN_PLBSR    <= '1';
                                      end if;
                                    end if;

      when FIRST_WORD_BUFF_ST    =>
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      DATA_RX_PLBSR            <= buffer_data_64(31 downto 0);
                                      buffer_data_32           <= buffer_data_64(63 downto 32);
                                      VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_8(3 downto 0);
                                      buffer_k_char_4          <= buffer_k_char_8(7 downto 4);
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      FIFO_RX_RD_EN_PLBSR      <= '1';
                                      current_state            <= SECOND_WORD_ST;
                                    end if;

      when SECOND_WORD_ST         =>
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' then
                                      buffer_data_64  <= DATA_RX_PLFRD;
                                      buffer_k_char_8 <= VALID_K_CHARAC_RX_PLFRD;
                                      if FIFO_RX_RD_EN_DL ='1' then
                                        DATA_RX_PLBSR            <= buffer_data_32;
                                        VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        current_state            <= FIRST_WORD_BUFF_ST;
                                      else
                                        toggle_data <= '1';
                                      end if;
                                    elsif FIFO_RX_RD_EN_DL ='1' then
                                      DATA_RX_PLBSR            <= buffer_data_32;
                                      VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      if toggle_data = '1' then
                                        toggle_data   <= '0';
                                        current_state <= FIRST_WORD_BUFF_ST;
                                      else
                                        current_state <= FIRST_WORD_ST;
                                      end if;
                                    end if;

      when others                 =>
                                    current_state            <= IDLE_ST;
    end case;
  end if;
end process p_concat_data;
---------------------------------------------------------
-- Process: p_concat_ctrl
-- Description: Concatenates 2 words of 8 bits in one bus of 16 bits
---------------------------------------------------------
p_concat_ctrl: process(CLK, RST_N)
begin
  if RST_N ='0' then
    FAR_END_CAPA_PLBSR <= (others=>'0');
    LANE_ACTIVE_PLBSR   <= '0';
    toggle_ctrl         <= '0';
    buffer_capa_8       <= (others=>'0');
  elsif rising_edge(CLK)  then
    LANE_ACTIVE_PLBSR <= LANE_ACTIVE_PLFRC;
    if toggle_ctrl = '0' then
      -- First word
      FAR_END_CAPA_PLBSR  <= FAR_END_CAPA_PLFRC(7 downto 0);
      buffer_capa_8       <= FAR_END_CAPA_PLFRC(15 downto 8);
      toggle_ctrl         <= '1';
    else
      -- Second word
      FAR_END_CAPA_PLBSR  <= buffer_capa_8;
      toggle_ctrl         <= '0';
    end if;
  end if;
end process p_concat_ctrl;

end architecture rtl;