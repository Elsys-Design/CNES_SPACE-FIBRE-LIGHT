----------------------------------------------------------------------------
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 14/03/2025
--
-- Description : This module describe the management of the ACK, NACK request
--							 and the polarity flags
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_err_management is
  port (
    CLK                      : in std_logic;                                --! Clock signal
    RST_N                    : in std_logic;                                --! Active low reset
    -- data_word_interface (DWI) Interface
    TYPE_FRAME_DWI           : in std_logic_vector(3 downto 0);             --! Type of frame from DWI
    RXERR_DWI                : in std_logic;                                --! Receive error flag from DWI
    -- crc_check (DCCHECK) Interface
    TYPE_FRAME_DCCHECK       : in std_logic_vector(3 downto 0);             --! Type of frame from CRC check
    CRC_ERR_DCCHECK          : in std_logic;                                --! CRC error flag from CRC check
    -- seq_check (DSCHECK) interface
    TYPE_FRAME_DSCHECK       : in std_logic_vector(3 downto 0);             --! Type of frame from sequence check
    END_FRAME_DSCHECK        : in std_logic;                                --! End of frame flag from sequence check
    SEQ_ERR_DSCHECK          : in std_logic;                                --! Sequence error flag from sequence check
    SEQ_NUM_ACK_DSCHECK      : in std_logic_vector(6 downto 0);
    FAR_END_RPF_DSCHECK      : in std_logic;                                --! Far-end RPF flag from sequence check
    NEAR_END_RPF_DERRM       : out std_logic;                               --! Near-end RPF flag to error management
    FRAME_ERR_DSCHECK        : in std_logic;
    -- data_mac (DMAC) interface
    REQ_ACK_DERRM            : out std_logic;                               --! Acknowledge request to DMAC
    REQ_NACK_DERRM           : out std_logic;                               --! Non-acknowledge request to DMAC
    TRANS_POL_FLG_DERRM      : out std_logic;                               --! Transmission polarity flag to error management
    SEQ_NUM_ACK_DERRM        : out std_logic_vector(7 downto 0);
    REQ_ACK_DONE_DMAC        : in std_logic;                                --! Acknowledge done signal from DMAC
    -- data_link_reset (DLRE) interface
    LINK_RESET_DERRM         : out std_logic;
    -- MIB  interface
    NACK_RST_EN_MIB          : in std_logic;                                --! Enable automatic link reset on NACK reception
    NACK_RST_MODE_MIB        : in std_logic                                 --! Up for instant link reset on NACK reception, down for link reset at the end of the current received frame on NACK reception
  );
end data_err_management;

architecture Behavioral of data_err_management is

  type state_type is (
		VALID_POSITIVE_ST,
		VALID_NEGATIVE_ST,
		ERROR_POSITIVE_ST,
		ERROR_NEGATIVE_ST
	);

  signal state               : state_type;

  signal s_nack_request      : std_logic;
  signal s_ack_request       : std_logic;
  signal nack_request_fsm    : std_logic;
  signal ack_request_fsm     : std_logic;
  signal nack_request_out    : std_logic;
  signal ack_request_out     : std_logic;
  signal s_far_end_rpf       : std_logic;
  signal s_seq_err           : std_logic;
  signal flg_nack_rst_flg    : std_logic;
  signal s_seq_num_request   : std_logic_vector(6 downto 0);
  signal s_seq_num_fsm       : std_logic_vector(6 downto 0);
  signal s_seq_num_out       : std_logic_vector(6 downto 0);
  signal near_end_rpf        : std_logic;

begin
---------------------------------------------------------
-----                     Assignation               -----
---------------------------------------------------------
  REQ_NACK_DERRM     <= nack_request_out;
  REQ_ACK_DERRM      <= ack_request_out;
  SEQ_NUM_ACK_DERRM  <= near_end_rpf & s_seq_num_fsm;
  NEAR_END_RPF_DERRM <= near_end_rpf;
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_fsm
-- Description: FSM to determine the polarity flags
--							(TPF and RPF)
---------------------------------------------------------
  p_fsm : process (CLK, RST_N)
  begin
    if RST_N = '0' then
      state               <= VALID_POSITIVE_ST;
      near_end_rpf        <= '0';
      TRANS_POL_FLG_DERRM <= '0';
      nack_request_fsm    <= '0';
      ack_request_fsm     <= '0';
      s_far_end_rpf       <= '0';
      s_seq_err           <= '0';
      s_seq_num_request   <= (others => '0');
    elsif rising_edge(CLK) then
      -- Synchronization for the FSM
      s_far_end_rpf    <= FAR_END_RPF_DSCHECK;
      s_seq_err        <= SEQ_ERR_DSCHECK;
      ack_request_fsm  <= s_ack_request;
      nack_request_fsm <= s_nack_request;
      s_seq_num_fsm    <= s_seq_num_request;
      case state is
        when VALID_POSITIVE_ST =>
            									near_end_rpf        <= '0';
            									TRANS_POL_FLG_DERRM <= '0';
            									if s_nack_request = '1' then
            									    state <= ERROR_NEGATIVE_ST;
            									end if;

        when VALID_NEGATIVE_ST =>
            									near_end_rpf        <= '1';
            									TRANS_POL_FLG_DERRM <= '1';
            									if s_nack_request = '1' then
            									    state <= ERROR_POSITIVE_ST;
            									end if;

        when ERROR_POSITIVE_ST =>
            									near_end_rpf        <= '1';
            									TRANS_POL_FLG_DERRM <= '0';
            									if s_ack_request = '1' then
            									    state <= VALID_POSITIVE_ST;
            									elsif s_far_end_rpf = '0' and s_seq_err = '1' then
            									    state <= ERROR_NEGATIVE_ST;
            									end if;

        when ERROR_NEGATIVE_ST  =>
            									near_end_rpf         <= '0';
            									TRANS_POL_FLG_DERRM  <= '1';
            									if s_ack_request = '1' then
            									    state <= VALID_NEGATIVE_ST;
            									elsif s_far_end_rpf = '1' and s_seq_err = '1' then
            									    state <= ERROR_POSITIVE_ST;
            									end if;
      end case;
    end if;
  end process p_fsm;
---------------------------------------------------------
-- Process: p_err
-- Description: Error detection, internal request management
---------------------------------------------------------
  p_err : process(CLK, RST_N)
  begin
    if RST_N = '0' then
      s_nack_request    <= '0';
      s_ack_request     <= '0';
      s_seq_num_request <= (others => '0');
    elsif rising_edge(CLK) then
      -- Nack requested for broadcast and data frames if rx_err or crc_err
      if RXERR_DWI = '1' and (TYPE_FRAME_DWI = C_DATA_FRM or TYPE_FRAME_DWI = C_BC_FRM) then
        s_nack_request <= '1';
        s_ack_request  <= '0';
      elsif CRC_ERR_DCCHECK = '1' and (TYPE_FRAME_DCCHECK = C_DATA_FRM or TYPE_FRAME_DCCHECK = C_BC_FRM) then
        s_nack_request <= '1';
        s_ack_request  <= '0';
      -- Nack requested for broadcast, data, FCT, and FULL frames if seq_err
      elsif SEQ_ERR_DSCHECK = '1' and  (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM or TYPE_FRAME_DSCHECK = C_FCT_FRM or TYPE_FRAME_DSCHECK = C_FULL_FRM) then
        s_nack_request <= '1';
        s_ack_request  <= '0';
      -- Ack requested for broadcast, data, FCT, and FULL frames if end of frame without seq_err
      elsif SEQ_ERR_DSCHECK = '0' and END_FRAME_DSCHECK = '1'  and (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM or TYPE_FRAME_DSCHECK = C_FCT_FRM or TYPE_FRAME_DSCHECK = C_FULL_FRM) then
        s_ack_request     <= '1';
        s_nack_request    <= '0';
        s_seq_num_request <=SEQ_NUM_ACK_DSCHECK;
      else
        s_ack_request  <= '0';
        s_nack_request <= '0';
      end if;
    end if;
  end process p_err;
---------------------------------------------------------
-- Process: p_sync
-- Description: Output request management: priority to
--							the latest, done handling, synchronization
---------------------------------------------------------
  p_sync : process (CLK, RST_N)
  begin
    if RST_N = '0' then
      ack_request_out  <= '0';
      nack_request_out <= '0';
      s_seq_num_out    <= (others =>'0');
    elsif rising_edge(CLK) then
      if ack_request_out = '1' then
        -- Ack valid but new Nack request
        if REQ_ACK_DONE_DMAC = '1' and nack_request_fsm = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '1';
        -- Ack valid but new Ack request
        elsif REQ_ACK_DONE_DMAC = '1' and ack_request_fsm = '1' then
          ack_request_out  <= '1';
          nack_request_out <= '0';
          s_seq_num_out    <= s_seq_num_fsm;
        -- Ack valid
        elsif REQ_ACK_DONE_DMAC = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '0';
        -- Priority to the latest request
        elsif nack_request_fsm = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '1';
        end if;
      elsif nack_request_out = '1' then
        -- Nack valid but new Nack request
        if REQ_ACK_DONE_DMAC = '1' and nack_request_fsm = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '1';
        -- Nack valid but new Ack request
        elsif REQ_ACK_DONE_DMAC = '1' and ack_request_fsm = '1' then
          ack_request_out  <= '1';
          nack_request_out <= '0';
          s_seq_num_out    <= s_seq_num_fsm;
        -- Ack valid
        elsif REQ_ACK_DONE_DMAC = '1' then
          ack_request_out  <= '0';
          nack_request_out <= '0';
        -- Priority to the latest request
        elsif ack_request_fsm = '1' then
          ack_request_out  <= '1';
          nack_request_out <= '0';
          s_seq_num_out    <= s_seq_num_fsm;
        end if;
      -- Priority to the latest request
      elsif ack_request_fsm = '1' then
        ack_request_out  <= '1';
        nack_request_out <= '0';
        s_seq_num_out    <= s_seq_num_fsm;
      elsif nack_request_fsm = '1' then
        ack_request_out  <= '0';
        nack_request_out <= '1';
      end if;
    end if;
  end process p_sync;

  ---------------------------------------------------------
-- Process: p_nack_rst_strat
-- Description: Error detection, internal request management
---------------------------------------------------------
p_nack_rst_strat : process(CLK, RST_N)
begin
  if RST_N = '0' then
    LINK_RESET_DERRM <= '0';
    flg_nack_rst_flg <='0';
  elsif rising_edge(CLK) then
    if NACK_RST_EN_MIB = '1' then
      if NACK_RST_MODE_MIB = '1' then
        if FRAME_ERR_DSCHECK = '0' and (TYPE_FRAME_DSCHECK = C_NACK_FRM) and END_FRAME_DSCHECK = '1' then
          LINK_RESET_DERRM <= '1';
        else
          LINK_RESET_DERRM <= '0';
        end if;
      else 
        if FRAME_ERR_DSCHECK = '0' and (TYPE_FRAME_DSCHECK = C_NACK_FRM) and END_FRAME_DSCHECK = '1' then
          flg_nack_rst_flg <= '1';
          LINK_RESET_DERRM <= '0';
        elsif (TYPE_FRAME_DSCHECK = C_DATA_FRM or TYPE_FRAME_DSCHECK = C_BC_FRM) and END_FRAME_DSCHECK = '1' and FRAME_ERR_DSCHECK = '0' and flg_nack_rst_flg = '1' then
          LINK_RESET_DERRM <= '1';
        else
          LINK_RESET_DERRM <= '0';
        end if;
      end if;
    else
      LINK_RESET_DERRM <= '0';
    end if;
  end if;
end process p_nack_rst_strat;
end Behavioral;
