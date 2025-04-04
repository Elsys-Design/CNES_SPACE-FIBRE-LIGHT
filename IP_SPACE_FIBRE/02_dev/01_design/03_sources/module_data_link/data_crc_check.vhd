----------------------------------------------------------------------------
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module check the CRC validity
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_crc_check is
  port (
    RST_N                  : in  std_logic;                                           --! Global reset
    CLK                    : in  std_logic;                                           --! Global clock
    -- data_word_identification (DWI) interface
    DATA_DWI               : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from daata_word_id_fsm
    VALID_K_CHARAC_DWI     : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K charachter valid in the 32-bit DATA_DWI vector
    NEW_WORD_DWI           : in  std_logic;                                           --! New word Flag from data_word_id_fsm
    END_FRAME_DWI          : in  std_logic;                                           --! End frame/control word from data_word_id_fsm
    SEQ_NUM_DWI            : in  std_logic_vector(7 downto 0);                        --! SEQ_NUM from data_word_id_fsm
    CRC_16B_DWI            : in  std_logic_vector(15 downto 0);                       --! 16 bits CRC (data frame)  from data_word_id_fsm
    CRC_8B_DWI             : in  std_logic_vector(7 downto 0);                        --! 8 bits CRC from data_word_id_fsm
    TYPE_FRAME_DWI         : in  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type from data_word_id_fsm
    FRAME_ERR_DWI          : in std_logic;
    -- data_seq_check (DSCHECK) interface
    NEW_WORD_DCCHECK       : out std_logic;                                           --! New word Flag from data_word_id_fsm
    DATA_DCCHECK           : out std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from daata_word_id_fsm
    VALID_K_CHARAC_DCCHECK : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K charachter valid in the 32-bit DATA_DCCHECK vector
    END_FRAME_DCCHECK      : out std_logic;                                           --! End frame/control word from data_word_id_fsm
    TYPE_FRAME_DCCHECK     : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type from data_word_id_fsm
    SEQ_NUM_DCCHECK        : out std_logic_vector(7 downto 0);                        --! SEQ_NUM from data_word_id_fsm
    CRC_ERR_DCCHECK        : out std_logic;                                           --! CRC error flag
    FRAME_ERR_DCCHECK      : out std_logic;
    -- MIB
    CRC_LONG_ERR_DCCHECK   : out std_logic;                                           --! CRC 16 bits error flag
    CRC_SHORT_ERR_DCCHECK  : out std_logic                                            --! CRC 16 bits error flag
  );
end data_crc_check;

architecture rtl of data_crc_check is

----------------------------- Declaration signals -----------------------------
-- Arrays to identify usefull byte
type int_array      is array (0 to 3) of integer;
type int_array_tier is array (0 to 2) of integer;
type int_array_dem  is array (0 to 1) of integer;
signal indices      : int_array      := (0, 8, 16, 24);
signal indices_tier : int_array_tier := (0, 8, 16);
signal indices_dem  : int_array_dem  := (0, 8);
-- CRC 16 Bits compute
signal crc_reg_16b_comp    : std_logic_vector(16-1 downto 0);
signal crc_long_err        : std_logic;
-- CRC 8 Bits compute
signal crc_reg_8b_comp     : std_logic_vector(8-1 downto 0);
signal crc_short_err       : std_logic;

begin
  CRC_LONG_ERR_DCCHECK  <= crc_long_err;
  CRC_SHORT_ERR_DCCHECK <= crc_short_err;
  CRC_ERR_DCCHECK       <= crc_short_err or crc_long_err;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_crc_16b
-- Description: Compute the CRC for a data frame
---------------------------------------------------------
 p_crc_16b: process(CLK, RST_N)
    variable crc_var : std_logic_vector(15 downto 0);
    variable crc_in : std_logic_vector(15 downto 0);
begin
    if RST_N = '0' then
        crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
        crc_long_err       <= '0';
    elsif rising_edge(CLK) then
      crc_var           := crc_reg_16b_comp;
      crc_long_err       <= '0';
      if (TYPE_FRAME_DWI = C_DATA_FRM) then
        if END_FRAME_DWI = '1' and NEW_WORD_DWI = '1'then -- Last word
          -- calculates the crc 8 byte by byte
          for i in indices_dem'range loop
              crc_var := calculate_crc_16(DATA_DWI(7+ indices_dem(i) downto 0 + indices_dem(i)), crc_var);
          end loop;
          -- Bit-by-bit inversion (CRC Input)
          for i in 0 to 15 loop
            crc_in(i) := CRC_16B_DWI(15 - i);
          end loop;
          -- Checks CRC validity
          if crc_in /= crc_var then
            crc_long_err  <= '1';
          else
            crc_long_err  <= '0';
          end if;
          crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
        elsif NEW_WORD_DWI = '1' then
          -- calculates the crc 8 byte by byte
          for i in indices'range loop
              crc_var := calculate_crc_16(DATA_DWI(7+ indices(i) downto 0 + indices(i)), crc_var);
          end loop;
            crc_reg_16b_comp <= crc_var;
        end if;
      end if;
    end if;
end process p_crc_16b;

---------------------------------------------------------
-- Process: p_crc_8b
-- Description: Compute the CRC for broadcast frame,
--              FCT, ACK, NACK and SIF
---------------------------------------------------------
p_crc_8b: process(CLK, RST_N)
    variable crc_var : std_logic_vector(7 downto 0);
    variable crc_in : std_logic_vector(15 downto 0);
begin
    if RST_N = '0' then
      crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
      crc_short_err   <= '0';
    elsif rising_edge(CLK) then
      crc_var       := crc_reg_8b_comp;
      crc_short_err <= '0';
      if TYPE_FRAME_DWI /= C_DATA_FRM then
        if END_FRAME_DWI = '1'and NEW_WORD_DWI = '1'then -- Last word
          -- calculates the crc 8 byte by byte
          for i in indices_tier'range loop
            crc_var := calculate_crc_8(DATA_DWI(7+ indices_tier(i) downto 0 + indices_tier(i)), crc_var);
          end loop;
          -- Bit-by-bit inversion
          for i in 0 to 7 loop
            crc_in(i) := CRC_8B_DWI(7 - i);
          end loop;
          -- Checks CRC validity
          if crc_in /= crc_var then
            crc_short_err  <= '1';
          else
            crc_short_err  <= '0';
          end if;
          crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
        elsif NEW_WORD_DWI = '1' then
          -- calculates the crc 8 byte by byte
          for i in indices'range loop
              crc_var := calculate_crc_8(DATA_DWI(7+ indices(i) downto 0 + indices(i)), crc_var);
          end loop;
          crc_reg_8b_comp <= crc_var;
        end if;
      end if;
    end if;
end process p_crc_8b;
---------------------------------------------------------
-- Process: p_trans_ctrl_sig
-- Description: Signals transmission for data_seq_check.
---------------------------------------------------------
p_trans_ctrl_sig: process(CLK, RST_N)
begin
  if RST_N = '0' then
    SEQ_NUM_DCCHECK        <= (others => '0');
    NEW_WORD_DCCHECK       <= '0';
    DATA_DCCHECK           <= (others => '0');
    VALID_K_CHARAC_DCCHECK <= (others => '0');
    TYPE_FRAME_DCCHECK     <= (others => '0');
    END_FRAME_DCCHECK      <= '0';
    FRAME_ERR_DCCHECK      <= '0';
  elsif rising_edge(CLK) then
    SEQ_NUM_DCCHECK        <= SEQ_NUM_DWI;
    NEW_WORD_DCCHECK       <= NEW_WORD_DWI;
    END_FRAME_DCCHECK      <= END_FRAME_DWI;
    DATA_DCCHECK           <= DATA_DWI;
    VALID_K_CHARAC_DCCHECK <= VALID_K_CHARAC_DWI;
    TYPE_FRAME_DCCHECK     <= TYPE_FRAME_DWI;
    FRAME_ERR_DCCHECK      <= FRAME_ERR_DWI;
  end if;
end process p_trans_ctrl_sig;

end architecture rtl;