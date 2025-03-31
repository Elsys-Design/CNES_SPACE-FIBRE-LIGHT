----------------------------------------------------------------------------
-- Auteur(s) : Y.DAURIAC
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/03/2025
--
-- Description : This module manages the MIB signals
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity mib_data_link is
  generic(
    G_VC_NUM               : integer := 8                                                  --! Number of virtual channel
    );
   port (
    -- MIB parameters interface TOP
    INTERFACE_RESET         : in  std_logic;
    LINK_RESET              : in  std_logic;
    NACK_RST_EN             : in  std_logic;
    NACK_RST_MODE           : in  std_logic;
    PAUSE_VC                : in  std_logic_vector(G_VC_NUM downto 0);
    CONTINUOUS_VC           : in  std_logic_vector(G_VC_NUM-1 downto 0);
    -- MIB parameters interface Data-link
    INTERFACE_RESET_DL      : out std_logic;
    LINK_RESET_DL           : out std_logic;
    NACK_RST_EN_DL          : out std_logic;
    NACK_RST_MODE_DL        : out std_logic;
    PAUSE_VC_DL             : out std_logic_vector(G_VC_NUM downto 0);
    CONTINUOUS_VC_DL        : out std_logic_vector(G_VC_NUM-1 downto 0);
    -- MIB status interface Data-link
    SEQ_NUMBER_TX_DL        : in  std_logic_vector(G_VC_NUM-1 downto 0);
    SEQ_NUMBER_RX_DL        : in  std_logic_vector(G_VC_NUM-1 downto 0);
    CREDIT_VC_DL            : in  std_logic_vector(G_VC_NUM-1 downto 0);
    INPUT_BUF_OVF_VC_DL     : in  std_logic_vector(G_VC_NUM-1 downto 0);
    FCT_CREDIT_OVERFLOW_DL  : in  std_logic_vector(G_VC_NUM-1 downto 0);
    CRC_LONG_ERROR_DL       : in  std_logic;
    CRC_SHORT_ERROR_DL      : in  std_logic;
    FRAME_ERROR_DL          : in  std_logic;
    SEQUENCE_ERROR_DL       : in  std_logic;
    FAR_END_LINK_RESET_DL   : in  std_logic;
    FRAME_FINISHED_DL       : in  std_logic_vector(G_VC_NUM downto 0);
    FRAME_TX_DL             : in  std_logic_vector(G_VC_NUM downto 0);
    DATA_COUNTER_TX_DL      : in  std_logic_vector(6 downto 0);
    DATA_COUNTER_RX_DL      : in  std_logic_vector(6 downto 0);
    ACK_COUNTER_TX_DL       : in  std_logic_vector(2 downto 0);
    NACK_COUNTER_TX_DL      : in  std_logic_vector(2 downto 0);
    FCT_COUNTER_TX_DL       : in  std_logic_vector(3 downto 0);
    ACK_COUNTER_RX_DL       : in  std_logic_vector(2 downto 0);
    NACK_COUNTER_RX_DL      : in  std_logic_vector(2 downto 0);
    FCT_COUNTER_RX_DL       : in  std_logic_vector(3 downto 0);
    FULL_COUNTER_RX_DL      : in  std_logic_vector(1 downto 0);
    RETRY_COUNTER_RX_DL     : in  std_logic_vector(1 downto 0);
    CURRENT_TIME_SLOT_DL    : in  std_logic_vector(G_VC_NUM-1 downto 0);
    RESET_PARAM_DL          : in  std_logic;
    LINK_RST_ASSERTED_DL    : in  std_logic;
    -- MIB status interface TOP
    SEQ_NUMBER_TX           : out std_logic_vector(G_VC_NUM-1 downto 0);
    SEQ_NUMBER_RX           : out std_logic_vector(G_VC_NUM-1 downto 0);
    CREDIT_VC               : out std_logic_vector(G_VC_NUM-1 downto 0);
    INPUT_BUF_OVF_VC        : out std_logic_vector(G_VC_NUM-1 downto 0);
    FCT_CREDIT_OVERFLOW     : out std_logic_vector(G_VC_NUM-1 downto 0);
    CRC_LONG_ERROR          : out std_logic;
    CRC_SHORT_ERROR         : out std_logic;
    FRAME_ERROR             : out std_logic;
    SEQUENCE_ERROR          : out std_logic;
    FAR_END_LINK_RESET      : out std_logic;
    FRAME_FINISHED          : out std_logic_vector(8 downto 0);
    FRAME_TX                : out std_logic_vector(8 downto 0);
    DATA_COUNTER_TX         : out std_logic_vector(6 downto 0);
    DATA_COUNTER_RX         : out std_logic_vector(6 downto 0);
    ACK_COUNTER_TX          : out std_logic_vector(2 downto 0);
    NACK_COUNTER_TX         : out std_logic_vector(2 downto 0);
    FCT_COUNTER_TX          : out std_logic_vector(3 downto 0);
    ACK_COUNTER_RX          : out std_logic_vector(2 downto 0);
    NACK_COUNTER_RX         : out std_logic_vector(2 downto 0);
    FCT_COUNTER_RX          : out std_logic_vector(3 downto 0);
    FULL_COUNTER_RX         : out std_logic_vector(1 downto 0);
    RETRY_COUNTER_RX        : out std_logic_vector(1 downto 0);
    CURRENT_TIME_SLOT       : out std_logic_vector(G_VC_NUM-1 downto 0);
    RESET_PARAM             : out std_logic;
    LINK_RST_ASSERTED       : out std_logic
   );
end mib_data_link;

architecture rtl of mib_data_link is

begin
  -- Parameters
  INTERFACE_RESET_DL      <= INTERFACE_RESET;
  LINK_RESET_DL           <= LINK_RESET;
  NACK_RST_EN_DL          <= NACK_RST_EN;
  NACK_RST_MODE_DL        <= NACK_RST_MODE;
  PAUSE_VC_DL             <= PAUSE_VC;
  CONTINUOUS_VC_DL        <= CONTINUOUS_VC;
  -- Status
  SEQ_NUMBER_TX           <= SEQ_NUMBER_TX_DL;
  SEQ_NUMBER_RX           <= SEQ_NUMBER_RX_DL;
  CREDIT_VC               <= CREDIT_VC_DL;
  INPUT_BUF_OVF_VC        <= INPUT_BUF_OVF_VC_DL;
  FCT_CREDIT_OVERFLOW     <= FCT_CREDIT_OVERFLOW_DL;
  CRC_LONG_ERROR          <= CRC_LONG_ERROR_DL;
  CRC_SHORT_ERROR         <= CRC_SHORT_ERROR_DL;
  FRAME_ERROR             <= FRAME_ERROR_DL;
  SEQUENCE_ERROR          <= SEQUENCE_ERROR_DL;
  FAR_END_LINK_RESET      <= FAR_END_LINK_RESET_DL;
  FRAME_FINISHED          <= FRAME_FINISHED_DL;
  FRAME_TX                <= FRAME_TX_DL;
  DATA_COUNTER_TX         <= DATA_COUNTER_TX_DL;
  DATA_COUNTER_RX         <= DATA_COUNTER_RX_DL;
  ACK_COUNTER_TX          <= ACK_COUNTER_TX_DL;
  NACK_COUNTER_TX         <= NACK_COUNTER_TX_DL;
  FCT_COUNTER_TX          <= FCT_COUNTER_TX_DL;
  ACK_COUNTER_RX          <= ACK_COUNTER_RX_DL;
  NACK_COUNTER_RX         <= NACK_COUNTER_RX_DL;
  FCT_COUNTER_RX          <= FCT_COUNTER_RX_DL;
  FULL_COUNTER_RX         <= FULL_COUNTER_RX_DL;
  RETRY_COUNTER_RX        <= RETRY_COUNTER_RX_DL;
  CURRENT_TIME_SLOT       <= CURRENT_TIME_SLOT_DL;
  RESET_PARAM             <= RESET_PARAM_DL;
  LINK_RST_ASSERTED       <= LINK_RST_ASSERTED_DL;

end architecture rtl;
