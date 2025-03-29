----------------------------------------------------------------------------
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module permits to enpasulate frames
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_encpasulation is
  generic (
      G_VC_NUM       : integer := 8                                                          --! Number of virtual channel
   );
  port (
    RST_N                             : in  std_logic;                                       --! Global Reset (Active Low)
    CLK                               : in  std_logic;                                       --! Global Clock
    -- Lane Interface
		LANE_ACTIVE_PPL                   : in  std_logic;                                       --! Lane Active flag
    -- DMAC interface
    DATA_DMAC                         : in std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel from data_mac
    VALID_K_CHAR_DMAC                 : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K charachter valid in the 32-bit DATA_DMAC vector
    NEW_WORD_DMAC                     : in std_logic;                                          --! New word Flag from data_mac
	  END_PACKET_DMAC                   : in std_logic;                                          --! End frame/control word from data_mac
    TYPE_FRAME_DMAC                   : in std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! Type of the frame associated to DATA_DMAC
    VIRTUAL_CHANNEL_DMAC              : in std_logic_vector (G_VC_NUM-1 downto 0);             --! Virtual channel of the frame associated to DATA_DMAC
    BC_TYPE_DMAC                      : in std_logic_vector (G_VC_NUM-1 downto 0);
    BC_CHANNEL_DMAC                   : in std_logic_vector (G_VC_NUM-1 downto 0);
	  BC_STATUS_DMAC                    : in std_logic_vector (2-1 downto 0);
    MULT_CHANNEL_DMAC                 : in std_logic_vector (G_VC_NUM-1 downto 0);
    -- DSCC interface
    NEW_WORD_DENC                     : out std_logic;                                          --! New word Flag from data_encapsulation
    DATA_DENC                         : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel from data_encapsulation
    VALID_K_CHARAC_DENC               : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K charachter valid in the 32-bit DATA_DENC vector
    TYPE_FRAME_DENC                   : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! End frame/control word from data_encapsulation
    END_FRAME_DENC                    : out std_logic
  );
end data_encpasulation;

architecture rtl of data_encpasulation is

---------------------------------------------------------
-----             Signals declaration               -----
---------------------------------------------------------
type data_encapsulation_fsm_type is (
  START_FRAME_ST,
  TRANSFER_ST,
  END_FRAME_ST
  );

signal current_state                : data_encapsulation_fsm_type;                        --! Current state of the Dat Word Identification FSM
signal current_state_r              : data_encapsulation_fsm_type;                        --! Current state of the Dat Word Identification FSM
begin
---------------------------------------------------------
-----                  Process                      -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_encapsulation
-- Description: Encapsulate each frame via fsm
---------------------------------------------------------

p_encapsulation_fsm: process(CLK, RST_N)
begin
if RST_N = '0' then
  DATA_DENC           <= (others => '0');
  VALID_K_CHARAC_DENC <= (others => '0');
  TYPE_FRAME_DENC     <= (others => '0');
  NEW_WORD_DENC       <= '0';
  END_FRAME_DENC      <= '0';
  current_state       <= START_FRAME_ST;
  current_state_r     <= START_FRAME_ST;
elsif rising_edge(CLK) and LANE_ACTIVE_PPL= '1' then
  TYPE_FRAME_DENC <= TYPE_FRAME_DMAC;
  current_state_r <= current_state;
  case current_state is
    when START_FRAME_ST =>
                            END_FRAME_DENC      <= '0';
                            NEW_WORD_DENC       <= '0';
                            if NEW_WORD_DMAC = '1' then
                              if TYPE_FRAME_DMAC = C_DATA_FRM then
			                        	DATA_DENC          <= C_RESERVED_SYMB & VIRTUAL_CHANNEL_DMAC & C_SDF_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '0';
                                current_state       <= TRANSFER_ST;
			                        elsif TYPE_FRAME_DMAC = C_BC_FRM then
			                        	DATA_DENC           <= BC_TYPE_DMAC & BC_CHANNEL_DMAC & C_SBF_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '0';
                                current_state       <= TRANSFER_ST;
			                        elsif TYPE_FRAME_DMAC = C_IDLE_FRM then
			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_SIF_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '0';
                                current_state       <= START_FRAME_ST;
			                        elsif TYPE_FRAME_DMAC = C_FCT_FRM then
			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & MULT_CHANNEL_DMAC & C_K28_3_SYMB;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '1';
                                current_state       <= START_FRAME_ST;
			                        elsif TYPE_FRAME_DMAC = C_ACK_FRM then
			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_ACK_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '1';
                                current_state       <= START_FRAME_ST;
			                        elsif TYPE_FRAME_DMAC = C_NACK_FRM then
			                        	DATA_DENC      <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_NACK_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '1';
                                current_state       <= START_FRAME_ST;
			                        elsif TYPE_FRAME_DMAC = C_FULL_FRM then
			                        	DATA_DENC      <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_FULL_WORD;
			                        	VALID_K_CHARAC_DENC <= "0001";
			                        	NEW_WORD_DENC       <= '1';
                                END_FRAME_DENC      <= '1';
                                current_state       <= START_FRAME_ST;
			                        end if;
                            end if;
    when TRANSFER_ST    =>
                            if END_PACKET_DMAC = '1' then
			                        DATA_DENC           <= DATA_DMAC;
			                        VALID_K_CHARAC_DENC <= VALID_K_CHAR_DMAC;
			                        NEW_WORD_DENC       <= '1';
                              current_state       <= END_FRAME_ST;
                            elsif NEW_WORD_DMAC = '1' or current_state_r= START_FRAME_ST then
                              DATA_DENC           <= DATA_DMAC;
                              VALID_K_CHARAC_DENC <= VALID_K_CHAR_DMAC;
                              NEW_WORD_DENC       <= '1';
                            end if;
    when END_FRAME_ST   =>
                            END_FRAME_DENC        <= '1';
                            current_state         <= START_FRAME_ST;
                            if TYPE_FRAME_DMAC = C_DATA_FRM then
                              DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_K28_0_SYMB;
                              VALID_K_CHARAC_DENC <= "0001";
                              NEW_WORD_DENC       <= '1';
                            elsif TYPE_FRAME_DMAC = C_BC_FRM then
                              DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & "000000" & BC_STATUS_DMAC & C_K28_2_SYMB;
                              VALID_K_CHARAC_DENC <= "0001";
                              NEW_WORD_DENC       <= '1';
                            end if;
    when others         =>
                            END_FRAME_DENC      <= '0';
                            NEW_WORD_DENC       <= '0';
                            VALID_K_CHARAC_DENC <= "0000";
  end case;
end if;
end process p_encapsulation_fsm;

end architecture rtl;