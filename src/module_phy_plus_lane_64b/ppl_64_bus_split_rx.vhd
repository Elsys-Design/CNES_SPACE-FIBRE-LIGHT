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
--               and capability bus from 8 bits to 16 bits
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library phy_plus_lane_64_lib;
  use phy_plus_lane_64_lib.pkg_phy_plus_lane_64b.all;

entity ppl_64_bus_split_rx is
   port (
      RST_N                        : in  std_logic;                                   --! global reset
      CLK                          : in  std_logic;                                   --! Clock synchronous of the Data-link layer
      -- Data-link layer interface
      FIFO_RX_RD_EN_DL             : in  std_logic;                                   --! FIFO RX read enable flag from the Data-link layer
      DATA_RX_PLBSR                : out std_logic_vector(31 downto 0);               --! 32-bit Data parallel
      FIFO_RX_DATA_VALID_PLBSR     : out std_logic;                                   --! Flag new data
      VALID_K_CHARAC_RX_PLBSR      : out std_logic_vector(3 downto 0);                --! 4-bit valid K character
      FAR_END_CAPA_PLBSR           : out std_logic_vector(7 downto 0);                --! Capability field received in INIT3 control word
      LANE_ACTIVE_PLBSR            : out std_logic;                                   --! Lane Active flag
      -- fifo_rx_data (PLFRD) interface
      FIFO_RX_RD_EN_PLBSR          : out std_logic;                                   --! FIFO RX read enable flag
      DATA_RX_PLFRD                : in  std_logic_vector(C_DATA_WIDTH-1  downto 0);  --! 64-bit Data parallel
      FIFO_RX_DATA_VALID_PLFRD     : in  std_logic;                                   --! Flag new data
      FIFO_RX_EMPTY_PLFRD          : in  std_logic;                                   --! Flag FIFO Empty
      VALID_K_CHARAC_RX_PLFRD      : in  std_logic_vector(C_K_CHAR_WIDTH-1 downto 0); --! 8-bit valid K character flags
      DATA_RDY_RX_PLFRD            : in  std_logic_vector(1 downto 0);                --! Data valid flag
      -- ppl_64_ctrl_fifo_rx (PLCFR) interface
      FAR_END_CAPA_PLFRC           : in std_logic_vector(7 downto 0);                 --! Capability field received in INIT3 control word
      LANE_ACTIVE_PLFRC            : in std_logic                                     --! Lane Active flag
   );
end ppl_64_bus_split_rx;

architecture rtl of ppl_64_bus_split_rx is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
type split_bus_fsm_type is (
  IDLE_ST,               --! Wait until FIFO RX is not empty before reading
  FIRST_WORD_ST,         --! Handle data from FIFO RX and split it
  FIRST_WORD_WAIT_RD_ST, --! Wait until FIFO_RX_RD_EN_DL is active to enable FIFO_RX_DATA_VALID_PLBSR flag
  FIRST_WORD_BUFF_ST,    	--! Wait until FIFO_RX_RD_EN_DL is active to send the buffered data
  SECOND_WORD_ST         --! Transfer the second word
  );

-- data path
signal current_state       : split_bus_fsm_type;
signal next_state          : split_bus_fsm_type;
signal buffer_data_32      : std_logic_vector(31 downto 0);
signal buffer_k_char_4     : std_logic_vector(3 downto 0);
signal buffer_data_64      : std_logic_vector(63 downto 0);
signal buffer_k_char_8     : std_logic_vector(7 downto 0);
signal toggle_data         : std_logic;
signal req_fifo_rd_pending   : std_logic;
begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_split_data
-- Description: Splits data bus of 2 words of 32 bits in a data bus of 1 word of 32 bits
---------------------------------------------------------
p_split_data: process(CLK, RST_N)
begin
  if RST_N ='0' then
    DATA_RX_PLBSR            <= (others=>'0');
    FIFO_RX_RD_EN_PLBSR      <= '0';
    VALID_K_CHARAC_RX_PLBSR  <= (others=>'0');
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    current_state            <= IDLE_ST;
    next_state               <= IDLE_ST;
    buffer_data_32           <= (others => '0');
    buffer_k_char_4          <= (others => '0');
    buffer_data_64           <= (others => '0');
    buffer_k_char_8          <= (others => '0');
    toggle_data              <= '0';
    req_fifo_rd_pending      <= '0';
  elsif rising_edge(CLK)  then
    FIFO_RX_DATA_VALID_PLBSR <= '0';
    FIFO_RX_RD_EN_PLBSR      <= '0';
    case current_state is
      when IDLE_ST                =>
                                    if FIFO_RX_EMPTY_PLFRD = '0' then
                                      FIFO_RX_RD_EN_PLBSR <= '1';
                                      req_fifo_rd_pending<= '1';
                                      current_state       <= FIRST_WORD_ST;
                                    end if;

      when FIRST_WORD_ST          =>---------------------------------
                                    --       2 words received      --
                                    ---------------------------------
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="11" then
                                      req_fifo_rd_pending    <= '0';
                                      -- Word 1 ready to be sent
                                      DATA_RX_PLBSR            <= DATA_RX_PLFRD(31 downto 0);
                                      VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                      -- Word 2 saved
                                      buffer_data_32           <= DATA_RX_PLFRD(63 downto 32);
                                      buffer_k_char_4          <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        if FIFO_RX_EMPTY_PLFRD = '0' then
                                          FIFO_RX_RD_EN_PLBSR    <= '1';
                                          req_fifo_rd_pending    <= '1';
                                        end if;
                                        current_state <= SECOND_WORD_ST;
                                      else
                                        current_state <= FIRST_WORD_WAIT_RD_ST;
                                        next_state    <= SECOND_WORD_ST;
                                      end if;
                                    --------------------------------
                                    --       First word received  --
                                    --------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="01"then
                                      req_fifo_rd_pending    <= '0';
                                      -- Word 1 ready to be sent
                                      DATA_RX_PLBSR            <= DATA_RX_PLFRD(31 downto 0);
                                      VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        if FIFO_RX_EMPTY_PLFRD = '0' then
                                          FIFO_RX_RD_EN_PLBSR    <= '1';
                                          req_fifo_rd_pending    <= '1';
                                        else
                                          current_state          <= IDLE_ST;
                                        end if;
                                      else
                                        current_state <= FIRST_WORD_WAIT_RD_ST;
                                        next_state    <= FIRST_WORD_ST;
                                      end if;
                                    --------------------------------
                                    --      Second word received  --
                                    --------------------------------
                                    elsif FIFO_RX_DATA_VALID_PLFRD = '1' and DATA_RDY_RX_PLFRD ="10"then
                                      req_fifo_rd_pending    <= '0';
                                      -- Word 1 ready to be sent
                                      DATA_RX_PLBSR            <= DATA_RX_PLFRD(63 downto 32);
                                      VALID_K_CHARAC_RX_PLBSR  <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                      if FIFO_RX_RD_EN_DL = '1' then
                                        -- Send word 1
                                        FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        if FIFO_RX_EMPTY_PLFRD = '0' then
                                          FIFO_RX_RD_EN_PLBSR    <= '1';
                                          req_fifo_rd_pending    <= '1';
                                        else
                                          current_state          <= IDLE_ST;
                                        end if;
                                      else
                                        current_state <= FIRST_WORD_WAIT_RD_ST;
                                        next_state    <= FIRST_WORD_ST;
                                      end if;
                                    ------------------------------
                                    --      No word received    --
                                    ------------------------------
                                    elsif FIFO_RX_EMPTY_PLFRD = '1' then
                                        current_state          <= IDLE_ST;
                                    end if;

      when FIRST_WORD_WAIT_RD_ST  =>
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      -- Send word 1
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      -----------------------------
                                      --   No data buffurized    --
                                      -----------------------------
                                      if next_state = FIRST_WORD_ST then
                                        if FIFO_RX_EMPTY_PLFRD = '0' then
                                          FIFO_RX_RD_EN_PLBSR    <= '1';
                                          req_fifo_rd_pending    <= '1';
                                          current_state          <= FIRST_WORD_ST;
                                        else
                                          current_state          <= IDLE_ST;
                                        end if;
                                      -----------------------------
                                      --   1 data buffurized     --
                                      -----------------------------
                                      elsif next_state = SECOND_WORD_ST then
                                        current_state         <= SECOND_WORD_ST;
                                        if FIFO_RX_EMPTY_PLFRD = '0' then
                                          FIFO_RX_RD_EN_PLBSR <= '1';
                                          req_fifo_rd_pending <= '1';
                                        end if;
                                      end if;
                                    end if;

      when FIRST_WORD_BUFF_ST    =>
                                    if FIFO_RX_RD_EN_DL = '1' then
                                      -- Send word 1
                                      DATA_RX_PLBSR            <= buffer_data_64(31 downto 0);
                                      VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_8(3 downto 0);
                                      -- Save word 2
                                      buffer_data_32           <= buffer_data_64(63 downto 32);
                                      buffer_k_char_4          <= buffer_k_char_8(7 downto 4);
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      current_state            <= SECOND_WORD_ST;
                                      if req_fifo_rd_pending    <= '0' then
                                        FIFO_RX_RD_EN_PLBSR      <= '1';
                                        req_fifo_rd_pending      <= '1';
                                      end if;
                                    end if;

      when SECOND_WORD_ST         =>--------------------------------------
                                    --           Word received          --
                                    --------------------------------------
                                    if FIFO_RX_DATA_VALID_PLFRD = '1' then
                                      req_fifo_rd_pending    <= '0';
                                      ------------------------------------------------
                                      --       2 words received & 1 word saved      --
                                      ------------------------------------------------
                                      if DATA_RDY_RX_PLFRD ="11" then
                                        -- Save word 1 & 2
                                        buffer_data_64  <= DATA_RX_PLFRD;
                                        buffer_k_char_8 <= VALID_K_CHARAC_RX_PLFRD;
                                        if FIFO_RX_RD_EN_DL ='1' then
                                          -- Send word bufferized
                                          DATA_RX_PLBSR            <= buffer_data_32;
                                          VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                          FIFO_RX_DATA_VALID_PLBSR <= '1';
                                          current_state            <= FIRST_WORD_BUFF_ST;
                                        else
                                          toggle_data <= '1';
                                        end if;
                                      ----------------------------------------------------
                                      --       First word received & 1 word saved       --
                                      ----------------------------------------------------
                                      elsif DATA_RDY_RX_PLFRD ="01" then
                                        -- Word 1 saved
                                        buffer_data_32           <= DATA_RX_PLFRD(31 downto 0);
                                        buffer_k_char_4          <= VALID_K_CHARAC_RX_PLFRD(3 downto 0);
                                        if FIFO_RX_RD_EN_DL ='1' then
                                          -- Send word bufferized
                                          DATA_RX_PLBSR            <= buffer_data_32;
                                          VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                          FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        end if;
                                      -----------------------------------------------------
                                      --       Second word received & 1 word saved       --
                                      -----------------------------------------------------
                                      elsif DATA_RDY_RX_PLFRD ="10" then
                                        -- Word 2 saved
                                        buffer_data_32           <= DATA_RX_PLFRD(63 downto 32);
                                        buffer_k_char_4          <= VALID_K_CHARAC_RX_PLFRD(7 downto 4);
                                        if FIFO_RX_RD_EN_DL ='1' then
                                          -- Send word bufferized
                                          DATA_RX_PLBSR            <= buffer_data_32;
                                          VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                          FIFO_RX_DATA_VALID_PLBSR <= '1';
                                        end if;
                                      end if;
                                    ---------------------------------------------------------------------
                                    --    No word received & 1 word saved but read enable from DL      --
                                    ---------------------------------------------------------------------
                                    elsif FIFO_RX_RD_EN_DL ='1' then
                                      -- Send word bufferized
                                      DATA_RX_PLBSR            <= buffer_data_32;
                                      VALID_K_CHARAC_RX_PLBSR  <= buffer_k_char_4;
                                      FIFO_RX_DATA_VALID_PLBSR <= '1';
                                      if toggle_data = '1' then
                                        toggle_data   <= '0';
                                        current_state <= FIRST_WORD_BUFF_ST;
                                      elsif req_fifo_rd_pending = '0' and FIFO_RX_EMPTY_PLFRD = '1' then
                                        current_state <= IDLE_ST;
                                      else
                                        current_state <= FIRST_WORD_ST;
                                        if req_fifo_rd_pending = '0' then
                                          FIFO_RX_RD_EN_PLBSR <= '1';
                                          req_fifo_rd_pending <= '1';
                                        end if;
                                      end if;
                                    --------------------------------------------------------------------------------------------
                                    --    No word received & 1 word saved & no read enable from DL & no read fifo pending     --
                                    --------------------------------------------------------------------------------------------
                                    elsif req_fifo_rd_pending = '0' then
                                      if FIFO_RX_EMPTY_PLFRD = '0' then
                                        FIFO_RX_RD_EN_PLBSR  <= '1';
                                        req_fifo_rd_pending  <= '1';
                                      end if;
                                    end if;

      when others                 =>
                                    current_state            <= IDLE_ST;
    end case;
  end if;
end process p_split_data;
---------------------------------------------------------
-- Process: p_concat_ctrl
--! Splits one 16-bit bus into two 8-bit words
---------------------------------------------------------
p_concat_ctrl: process(CLK, RST_N)
begin
  if RST_N ='0' then
    FAR_END_CAPA_PLBSR <= (others=>'0');
    LANE_ACTIVE_PLBSR   <= '0';
  elsif rising_edge(CLK)  then
    LANE_ACTIVE_PLBSR  <= LANE_ACTIVE_PLFRC;
    FAR_END_CAPA_PLBSR <= FAR_END_CAPA_PLFRC;
  end if;
end process p_concat_ctrl;

end architecture rtl;