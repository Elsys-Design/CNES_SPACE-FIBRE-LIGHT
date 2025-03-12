--------------------------------------------------------------------------
-- COMPANY       : ELSYS Design
--------------------------------------------------------------------------
-- TITLE         : pkg_model.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 31/08/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : Contains AXI constant parameters and mapping
--------------------------------------------------------------------------
-- History       :	V1.0: Creation of the file
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

package pkg_model is

  constant C_AXI_DATA_WIDTH               : positive := 32;                                                     --- registers are 32 bits wide
  constant C_AXI_ADDR_WIDTH               : positive := 32;                                                     --- address is 32 bits wide
  constant C_SLAVE_ADDR_WIDTH             : positive := 8;                                                      --- AXI slave only analyzes 8 LSB
  constant C_INTERNAL_BUS_WIDTH           : positive := 32;                                                     --- internal bus width
  constant C_PACKET_WIDTH                 : positive := C_INTERNAL_BUS_WIDTH/8;                                 --- number of bytes in a packet
  -- lane_analyzer
  constant C_INCR_VAL_DATA                : positive := 1;                                                      --- internal bus width
  -- #####################################################################
  -- # AXI MAPPING
  -- #####################################################################

  -- lane_configurator
  constant C_ADDR_LC_PHY_PARAM            : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address parameters phy register lane_configurator
  constant C_ADDR_LC_LANE_PARAM           : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address parameters lane register lane_configurator
  constant C_ADDR_LC_LANE_STATUS          : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address status lane register lane_configurator
  constant C_ADDR_LC_GLOBAL               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address global register lane_configurator
  ------------------------------------------------------------------------
  -- lane_generator
  constant C_ADDR_LG_CONFIG               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address configuration lane register lane_generator
  constant C_ADDR_LG_CONTROL              : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address control lane register lane_generator
  constant C_ADDR_LG_STATUS               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address status lane register lane_generator
  constant C_ADDR_LG_INIT_VAL             : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address initial value register lane_generator
  ------------------------------------------------------------------------
  -- lane_analyzer
  constant C_ADDR_LA_CONFIG               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address configuration lane register lane_analyzer
  constant C_ADDR_LA_CONTROL              : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address control lane register lane_analyzer
  constant C_ADDR_LA_STATUS               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address status lane register lane_analyzer
  constant C_ADDR_LA_INIT_VAL             : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address initial value register lane_analyzer

  -- data_link_configurator
  constant C_ADDR_DL_GLOBAL               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address global register lane_configurator
  constant C_ADDR_DL_PHY_PARAM            : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address parameters phy register lane_configurator
  constant C_ADDR_DL_LANE_PARAM           : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address parameters lane register lane_configurator
  constant C_ADDR_DL_LANE_STATUS          : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address status lane register lane_configurator
  constant C_ADDR_DL_DL_STATUS            : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"10";           --- address status lane register lane_configurator
  constant C_ADDR_DL_DL_PARAM             : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"14";           --- address status lane register lane_configurator
  constant C_ADDR_DL_DL_QOS               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"18";           --- address status lane register lane_configurator
  constant C_ADDR_DL_DL_ERROR_RECOVERY    : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"1C";           --- address status lane register lane_configurator
  ------------------------------------------------------------------------
  -- data_link_generator
  constant C_ADDR_DG_CONFIG               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address configuration lane register lane_generator
  constant C_ADDR_DG_CONTROL              : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address control lane register lane_generator
  constant C_ADDR_DG_STATUS               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address status lane register lane_generator
  constant C_ADDR_DG_INIT_VAL             : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address initial value register lane_generator
  ------------------------------------------------------------------------
  -- data_link_analyzer
  constant C_ADDR_DA_CONFIG               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"00";           --- address configuration lane register lane_analyzer
  constant C_ADDR_DA_CONTROL              : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"04";           --- address control lane register lane_analyzer
  constant C_ADDR_DA_STATUS               : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"08";           --- address status lane register lane_analyzer
  constant C_ADDR_DA_INIT_VAL             : std_logic_vector(C_SLAVE_ADDR_WIDTH-1 downto 0) := x"0C";           --- address initial value register lane_analyzer
  ------------------------------------------------------------------------
  -- #####################################################################
  -- # BUS WIDTH
  -- #####################################################################

  -- lane_configurator
  constant C_STDBYREASON_WIDTH            : integer := 8;                                                       --- standby reason bus width

  constant C_LANESTATE_WIDTH              : integer := 4;                                                       --- lane state bus width
  constant C_RX_ERR_CNT_WIDTH             : integer := 8;                                                      --- RX error counter bus width
  constant C_FAR_CAPA_WIDTH               : integer := 8;                                                       --- far-end capabilities bus width

  -- lane_generator
  constant C_LG_FRAME_NB_WIDTH            : integer := 5;                                                       --- Frame number bus width
  constant C_LG_FRAME_SIZE_WIDTH          : integer := 9;                                                       --- Frame size bus width
  constant C_LG_INTER_PKT_DELAY_WIDTH     : integer := 10;                                                      --- Inter-packet delay bus width
  constant C_LG_DATA_MODE_WIDTH           : integer := 2;                                                       --- Data mode bus width

  constant C_LG_CNT_ERR_MAX_WIDTH         : integer := 8;                                                       --- Error counter bus width
  constant C_LG_LANE_CAPA_WIDTH           : integer := 8;                                                       --- lane capabilities bus width

  constant C_LG_INIT_VAL_WIDTH            : integer := 32;                                                      --- Init value bus width

  -- lane_analyzer
  constant C_LA_FRAME_NB_WIDTH            : integer := 5;                                                       --- Frame number bus width
  constant C_LA_FRAME_SIZE_WIDTH          : integer := 9;                                                       --- Frame size bus width
  constant C_LA_INTER_PKT_DELAY_WIDTH     : integer := 10;                                                      --- Inter-packet delay bus width
  constant C_LA_DATA_MODE_WIDTH           : integer := 2;                                                       --- Data mode bus width

  constant C_LA_CNT_ERR_MAX_WIDTH         : integer := 8;                                                       --- Error counter bus width
  constant C_LA_LANE_CAPA_WIDTH           : integer := 8;                                                       --- lane capabilities bus width

  constant C_LA_INIT_VAL_WIDTH            : integer := 32;                                                      --- Init value bus width

  -- #####################################################################
  -- # BITFIELD
  -- #####################################################################

  -- ### lane_configurator ###
  -- Parameters phy register
  constant C_NEAR_END_LPB_BTFD            : integer := 0;                                                       --- near end serial loopback bitfield
  constant C_FAR_END_LPB_BTFD             : integer := 1;                                                       --- far end serial loopback bitfield

  -- Parameters lane register
  constant C_LANESTART_BTFD               : integer := 0;                                                       --- lane start bitfield
  constant C_AUTOSTART_BTFD               : integer := 1;                                                       --- auto start bitfield
  constant C_LANERESET_BTFD               : integer := 2;                                                       --- lane reset bitfield
  constant C_PARALLEL_LPB_BTFD            : integer := 3;                                                       --- parallel loopback enables bitfield
  constant C_STDBREASON_MAX_BTFD          : integer := 11;                                                      --- standby reason MSB bitfield
  constant C_LANESTART_PULSE_BTFD         : integer := 12;                                                      --- lane start pulsed bitfield

  -- Status lane register
  constant C_LANESTATE_MAX_BTFD           : integer := 3;                                                       --- lane state bitfield
  constant C_RX_ERR_CNT_MAX_BTFD          : integer := 11;                                                      --- auto start bitfield
  constant C_RX_ERR_OVF_BTFD              : integer := 12;                                                      --- lane reset bitfield
  constant C_FAR_LOST_SIG_BTFD            : integer := 13;                                                      --- parallel loopback enables bitfield
  constant C_FAR_CAPA_MAX_BTFD            : integer := 21;                                                      --- standby reason MSB bitfield
  constant C_RX_POLARITY_BTFD             : integer := 22;                                                      --- RX polarity bitfield
  
  -- Parameters data link register
  constant C_INTERFACE_RST_BTFD           : integer := 0;
  constant C_LINK_RST_BTFD                : integer := 1;
  constant C_NACK_RST_EN_BTFD             : integer := 2;
  constant C_PAUSE_VC_BTFD                : integer := 10;
  constant C_CONTINUOUS_VC_BTFD           : integer := 18;

  -- Status 1 data link register
  constant C_SEQ_NUMBER_TX_BTFD           : integer := 7;
  constant C_SEQ_NUMBER_RX_BTFD           : integer := 15;
  constant C_VC_CREDIT_BTFD               : integer := 23;
  constant C_FCT_CREDIT_OVERFLOW_BTFD     : integer := 31;

  -- Status 2 data link register
  constant C_CRC_LONG_ERROR_BTFD0         : integer := 0;
  constant C_CRC_SHORT_ERROR_BTFD         : integer := 1;
  constant C_FRAME_ERROR_BTFD             : integer := 2;
  constant C_SEQ_ERROR_BTFD               : integer := 3;
  constant C_FAR_END_LINK_RST_BTFD        : integer := 4;

  -- Global register
  constant C_RST_DUT_BTFD                 : integer := 0;                                                       --- RST_DUT_N bitfield

  -- ### lane_generator ###
  -- Configuration register lane_generator
  constant C_LG_FRAME_NB_MAX_BTFD         : integer := 4;                                                       --- Frame number MSB bitfield
  constant C_LG_FRAME_SIZE_MAX_BTFD       : integer := 13;                                                      --- Frame size MSB bitfield
  constant C_LG_INTER_PKT_DELAY_MAX_BTFD  : integer := 23;                                                      --- Inter-packet delay MSB bitfield
  constant C_LG_GEN_DATA_BTFD             : integer := 24;                                                      --- Generation data
  constant C_LG_DATA_MODE_MAX_BTFD        : integer := 26;                                                      --- Data Mode MSB bitfield

  -- Control register lane_generator
  constant C_LG_MODEL_START_BTFD          : integer := 0;                                                       --- Model start bitfield
  constant C_LG_LANE_RESET_BTFD           : integer := 1;                                                       --- Lane Reset bitfield
  constant C_LG_LANE_CAPA_MAX_BTFD        : integer := 9;                                                     --- lane capabilities max bitfield

  -- Status register lane_generator
  constant C_LG_BUSY_BTFD                 : integer := 0;                                                       --- Busy bitfield
  constant C_LG_TEST_END_BTFD             : integer := 1;                                                       --- Test end bitfield
  constant C_LG_ERR_CNT_MAX_BTFD          : integer := 9;                                                       --- Error counter MSB bitfield

  -- ### lane_analyzer ###
  -- Configuration register lane_analyzer
  constant C_LA_FRAME_NB_MAX_BTFD         : integer := 4;                                                       --- Frame number MSB bitfield
  constant C_LA_FRAME_SIZE_MAX_BTFD       : integer := 13;                                                      --- Frame size MSB bitfield
  constant C_LA_INTER_PKT_DELAY_MAX_BTFD  : integer := 23;                                                      --- Inter-packet delay MSB bitfield
  constant C_LA_GEN_DATA_BTFD             : integer := 24;                                                      --- Generation data
  constant C_LA_DATA_MODE_MAX_BTFD        : integer := 26;                                                      --- Data Mode MSB bitfield

  -- Control register lane_analyzer
  constant C_LA_MODEL_START_BTFD          : integer := 0;                                                       --- Model start bitfield

  -- Status register lane_analyzer
  constant C_LA_BUSY_BTFD                 : integer := 0;                                                       --- Busy bitfield
  constant C_LA_TEST_END_BTFD             : integer := 1;                                                       --- Test end bitfield
  constant C_LA_ERR_CNT_MAX_BTFD          : integer := 9;                                                       --- Error counter MSB bitfield
  constant C_LA_LANE_CAPA_MAX_BTFD        : integer := 17;                                                      --- lane capabilities max bitfield

  -- ### data_link_generator ###
  -- Configuration register lane_generator
  constant C_DG_FRAME_NB_MAX_BTFD         : integer := 4;                                                       --- Frame number MSB bitfield
  constant C_DG_FRAME_SIZE_MAX_BTFD       : integer := 13;                                                      --- Frame size MSB bitfield
  constant C_DG_INTER_PKT_DELAY_MAX_BTFD  : integer := 23;                                                      --- Inter-packet delay MSB bitfield
  constant C_DG_GEN_DATA_BTFD             : integer := 24;                                                      --- Generation data
  constant C_DG_DATA_MODE_MAX_BTFD        : integer := 26;                                                      --- Data Mode MSB bitfield

  -- Control register lane_generator
  constant C_DG_MODEL_START_BTFD          : integer := 0;                                                       --- Model start bitfield
  constant C_DG_LANE_RESET_BTFD           : integer := 1;                                                       --- Lane Reset bitfield
  constant C_DG_LANE_CAPA_MAX_BTFD        : integer := 9;                                                     --- lane capabilities max bitfield

  -- Status register lane_generator
  constant C_DG_BUSY_BTFD                 : integer := 0;                                                       --- Busy bitfield
  constant C_DG_TEST_END_BTFD             : integer := 1;                                                       --- Test end bitfield
  constant C_DG_ERR_CNT_MAX_BTFD          : integer := 9;                                                       --- Error counter MSB bitfield

  -- ### data_link_analyzer ###
  -- Configuration register lane_analyzer
  constant C_DA_FRAME_NB_MAX_BTFD         : integer := 4;                                                       --- Frame number MSB bitfield
  constant C_DA_FRAME_SIZE_MAX_BTFD       : integer := 13;                                                      --- Frame size MSB bitfield
  constant C_DA_INTER_PKT_DELAY_MAX_BTFD  : integer := 23;                                                      --- Inter-packet delay MSB bitfield
  constant C_DA_GEN_DATA_BTFD             : integer := 24;                                                      --- Generation data
  constant C_DA_DATA_MODE_MAX_BTFD        : integer := 26;                                                      --- Data Mode MSB bitfield

  -- Control register lane_analyzer
  constant C_DA_MODEL_START_BTFD          : integer := 0;                                                       --- Model start bitfield

  -- Status register lane_analyzer
  constant C_DA_BUSY_BTFD                 : integer := 0;                                                       --- Busy bitfield
  constant C_DA_TEST_END_BTFD             : integer := 1;                                                       --- Test end bitfield
  constant C_DA_ERR_CNT_MAX_BTFD          : integer := 9;                                                       --- Error counter MSB bitfield

  -- #####################################################################
  -- # DEFAULT values
  -- #####################################################################

  -- ### lane_configurator ###
  -- Parameters phy register
  constant C_DEFAULT_NEAR_END_LPB         : std_logic                                        := '0';            --- near end serial loopback default value
  constant C_DEFAULT_FAR_END_LPB          : std_logic                                        := '0';            --- far end serial loopback default value
  -- Parameters lane register
  constant C_DEFAULT_LANESTART            : std_logic                                        := '0';            --- lane start default value
  constant C_DEFAULT_AUTOSTART            : std_logic                                        := '0';            --- auto start default value
  constant C_DEFAULT_LANERESET            : std_logic                                        := '0';            --- lane reset default value
  constant C_DEFAULT_PARALLEL_LPB         : std_logic                                        := '0';            --- parallel loopback enable default value
  constant C_DEFAULT_STDBREASON           : std_logic_vector(C_STDBYREASON_WIDTH-1 downto 0) := (others =>'0'); --- standby reason default value
-- Global register
  constant C_DEFAULT_RST_DUT              : std_logic                                        := '0';            --- parallel loopback enable default value

  -- ### lane_generator ###
  -- Configuration register lane_generator
  constant C_DEFAULT_LG_FRAME_NB          : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0)         := (others =>'0');  --- Frame number default value
  constant C_DEFAULT_LG_FRAME_SIZE        : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0)       := (others =>'0');  --- Frame size default value
  constant C_DEFAULT_LG_INTER_PKT_DELAY   : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0)  := (others =>'0');  --- Inter-packet delay default value
  constant C_DEFAULT_LG_GEN_DATA          : std_logic                                        := '0';             --- Generation data default value
  constant C_DEFAULT_LG_DATA_MODE         : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0)     := (others =>'0');     --- Data Mode default value
  -- Control register lane_generator
  constant C_DEFAULT_LG_MODEL_START       : std_logic                                        := '0';             --- Model start default value
  constant C_DEFAULT_LG_LANE_RESET        : std_logic                                        := '0';             --- Lane Reset default value
  constant C_DEFAULT_LG_LANE_CAPA         : unsigned(C_LG_LANE_CAPA_WIDTH-1 downto 0)        := (others =>'0');  --- LANE CAPA default value
  -- Status register lane_generator
  constant C_DEFAULT_LG_BUSY              : std_logic                                        := '0';             --- Busy default value
  constant C_DEFAULT_LG_TEST_END          : std_logic                                        := '0';             --- Test end default value
  constant C_DEFAULT_LG_ERR_CNT           : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0)      := (others =>'0');  --- Error counter default value
  -- Initial Value register lane_generator
  constant C_DEFAULT_LG_INIT_VAL          : unsigned(C_LG_INIT_VAL_WIDTH-1 downto 0)         := to_unsigned(1,C_LG_INIT_VAL_WIDTH); -- Initial Value default                                                     --- internal bus width

  -- ### lane_analyzer ###
  -- Configuration register lane_analyzer
  constant C_DEFAULT_LA_FRAME_NB          : unsigned(C_LA_FRAME_NB_WIDTH-1 downto 0)         := (others =>'0');  --- Frame number default value
  constant C_DEFAULT_LA_FRAME_SIZE        : unsigned(C_LA_FRAME_SIZE_WIDTH-1 downto 0)       := (others =>'0');  --- Frame size default value
  constant C_DEFAULT_LA_INTER_PKT_DELAY   : unsigned(C_LA_INTER_PKT_DELAY_WIDTH-1 downto 0)  := (others =>'0');  --- Inter-packet delay default value
  constant C_DEFAULT_LA_GEN_DATA          : std_logic                                        := '0';             --- Generation data default value
  constant C_DEFAULT_LA_DATA_MODE         : unsigned(C_LA_DATA_MODE_WIDTH-1 downto 0)     := (others =>'0');  --- Data Mode default value
  -- Control register lane_analyzer
  constant C_DEFAULT_LA_MODEL_START       : std_logic                                        := '0';             --- Model start default value
  -- Status register lane_analyzer
  constant C_DEFAULT_LA_BUSY              : std_logic                                        := '0';             --- Busy default value
  constant C_DEFAULT_LA_TEST_END          : std_logic                                        := '0';             --- Test end default value
  constant C_DEFAULT_LA_ERR_CNT           : unsigned(C_LA_CNT_ERR_MAX_WIDTH-1 downto 0)      := (others =>'0');  --- Error counter default value
  constant C_DEFAULT_LA_LANE_CAPA         : unsigned(C_LA_LANE_CAPA_WIDTH-1 downto 0)        := (others =>'0');  --- LANE CAPA default value
  -- Initial Value register lane_generator
  constant C_DEFAULT_LA_INIT_VAL          : unsigned(C_LA_INIT_VAL_WIDTH-1 downto 0)         := to_unsigned(1,C_LA_INIT_VAL_WIDTH); -- Initial Value default

  -- #####################################################################
  -- # Constants values
  -- #####################################################################
  -- ### lane_generator ###
  -- Generation Data
  constant C_INCREMENTAL                : std_logic                                          := '0';             --- Busy default value
  constant C_PRBS                       : std_logic                                          := '1';             --- Test end default value
  -- Data Mode
  -- lane_generator
  constant C_LG_DM_DATA                 : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0)         := "00";             --- Generation data
  constant C_LG_DM_CONTROL_WORD         : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0)         := "01";             --- Generation control word
  constant C_LG_DM_WRONG_K_CARC         : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0)         := "10";             --- Wrong K-character
  -- lane_analyzer
  constant C_LA_DM_DATA                 : unsigned(C_LA_DATA_MODE_WIDTH-1 downto 0)         := "00";             --- Generation data
  constant C_LA_DM_CONTROL_WORD         : unsigned(C_LA_DATA_MODE_WIDTH-1 downto 0)         := "01";             --- Generation control word
  constant C_LA_DM_RXERR                : unsigned(C_LA_DATA_MODE_WIDTH-1 downto 0)         := "10";             --- RXERR

  constant C_VALID_K_WIDTH              : integer                                           := 4;                --- Valid K-character bus width
  
  -- #####################################################################
  -- # INIT functions
  -- #####################################################################
  -- ### lane_configurator ###
  function init_lc_phy_param  return std_logic_vector;
  function init_lc_lane_param return std_logic_vector;
  function init_lc_global     return std_logic_vector;
  -- ### lane_generator ###
  function init_lg_configuration return std_logic_vector;
  function init_lg_control       return std_logic_vector;
  function init_lg_status        return std_logic_vector;
  function init_lg_init_val      return std_logic_vector;

  -- ### lane_analyzer ###
  function init_la_configuration return std_logic_vector;
  function init_la_control       return std_logic_vector;
  function init_la_status        return std_logic_vector;
  function init_la_init_val      return std_logic_vector;

end package pkg_model;

package body pkg_model is
   -- ### lane_configurator ###
   ---------------------------------------------------------------------------
   -- FUNCTION: init_lc_phy_param
   -- Description : initializes the lane_configurator phy parameters regsiter
   ---------------------------------------------------------------------------
   function init_lc_phy_param return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_FAR_END_LPB_BTFD +1) := (others => '0');
      temp(C_FAR_END_LPB_BTFD)                              := C_DEFAULT_FAR_END_LPB;
      temp(C_NEAR_END_LPB_BTFD)                             := C_DEFAULT_NEAR_END_LPB;
      return temp;
   end function;

   ---------------------------------------------------------------------------
   -- FUNCTION: init_lc_lane_param
   -- Description : initializes the lane_configurator lane parameters regsiter
   ---------------------------------------------------------------------------
   function init_lc_lane_param return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_STDBREASON_MAX_BTFD +1)  := (others => '0');
      temp(C_STDBREASON_MAX_BTFD downto C_PARALLEL_LPB_BTFD +1) := C_DEFAULT_STDBREASON;
      temp(C_PARALLEL_LPB_BTFD)                                 := C_DEFAULT_PARALLEL_LPB;
      temp(C_LANERESET_BTFD)                                    := C_DEFAULT_LANERESET;
      temp(C_AUTOSTART_BTFD)                                    := C_DEFAULT_AUTOSTART;
      temp(C_LANESTART_BTFD)                                    := C_DEFAULT_LANESTART;
      return temp;
   end function;

   ---------------------------------------------------------------------------
   -- FUNCTION: init_lc_global
   -- Description : initializes the lane_configurator global regsiter
   ---------------------------------------------------------------------------
   function init_lc_global return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_RST_DUT_BTFD +1)  := (others => '0');
      temp(C_RST_DUT_BTFD)                               := C_DEFAULT_RST_DUT;
      return temp;
   end function;

   -- ### lane_generator ###
   ---------------------------------------------------------------------------
   -- FUNCTION: init_lg_configuration
   -- Description : initializes the lane_generator Configuration regsiter
   ---------------------------------------------------------------------------
   function init_lg_configuration return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LG_DATA_MODE_MAX_BTFD +1)             := (others => '0');
      temp(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             := std_logic_vector(C_DEFAULT_LG_DATA_MODE);
      temp(C_LG_GEN_DATA_BTFD)                                               := C_DEFAULT_LG_GEN_DATA;
      temp(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) := std_logic_vector(C_DEFAULT_LG_INTER_PKT_DELAY);
      temp(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        := std_logic_vector(C_DEFAULT_LG_FRAME_SIZE);
      temp(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  := std_logic_vector(C_DEFAULT_LG_FRAME_NB);
      return temp;
   end function;
   ---------------------------------------------------------------------------
   -- FUNCTION: init_lg_control
   -- Description : initializes the lane_generator Control regsiter
   ---------------------------------------------------------------------------
   function init_lg_control return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LG_LANE_CAPA_MAX_BTFD +1)   := (others => '0');
      temp(C_LG_LANE_CAPA_MAX_BTFD downto C_LG_LANE_RESET_BTFD +1) := std_logic_vector(C_DEFAULT_LG_LANE_CAPA);
      temp(C_LG_LANE_RESET_BTFD)                                   := C_DEFAULT_LG_LANE_RESET;
      temp(C_LG_MODEL_START_BTFD)                                  := C_DEFAULT_LG_MODEL_START;
      return temp;
   end function;
   ---------------------------------------------------------------------------
   -- FUNCTION: init_lg_status
   -- Description : initializes the lane_generator Status regsiter
   ---------------------------------------------------------------------------
   function init_lg_status return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LG_ERR_CNT_MAX_BTFD +1) := (others => '0');
      temp(C_LG_ERR_CNT_MAX_BTFD downto  C_LG_TEST_END_BTFD+1) := std_logic_vector(C_DEFAULT_LG_ERR_CNT);
      temp(C_LG_TEST_END_BTFD)                                 := C_DEFAULT_LG_TEST_END;
      temp(C_LG_BUSY_BTFD)                                     := C_DEFAULT_LG_BUSY;
   return temp;
   end function;
   ---------------------------------------------------------------------------
   -- FUNCTION: init_lg_init_val
   -- Description : initializes the lane_generator Initial Value regsiter
   ---------------------------------------------------------------------------
   function init_lg_init_val return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp := std_logic_vector(C_DEFAULT_LG_INIT_VAL);
      return temp;
   end function;
   -- ### lane_analyzer ###
   ---------------------------------------------------------------------------
   -- FUNCTION: init_la_configuration
   -- Description : initializes the lane_analyzer Configuration regsiter
   ---------------------------------------------------------------------------
   function init_la_configuration return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LA_DATA_MODE_MAX_BTFD +1)             := (others => '0');
      temp(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1)             := std_logic_vector(C_DEFAULT_LA_DATA_MODE);
      temp(C_LA_GEN_DATA_BTFD)                                               := C_DEFAULT_LA_GEN_DATA;
      temp(C_LA_INTER_PKT_DELAY_MAX_BTFD downto C_LA_FRAME_SIZE_MAX_BTFD +1) := std_logic_vector(C_DEFAULT_LA_INTER_PKT_DELAY);
      temp(C_LA_FRAME_SIZE_MAX_BTFD downto C_LA_FRAME_NB_MAX_BTFD +1)        := std_logic_vector(C_DEFAULT_LA_FRAME_SIZE);
      temp(C_LA_FRAME_NB_MAX_BTFD downto 0)                                  := std_logic_vector(C_DEFAULT_LA_FRAME_NB);
      return temp;
   end function;
   ---------------------------------------------------------------------------
   -- FUNCTION: init_la_control
   -- Description : initializes the lane_analyzer Control regsiter
   ---------------------------------------------------------------------------
   function init_la_control return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LA_MODEL_START_BTFD +1) := (others => '0');
      temp(C_LA_MODEL_START_BTFD)                              := C_DEFAULT_LA_MODEL_START;
      return temp;
   end function;

   ---------------------------------------------------------------------------
   -- FUNCTION: init_la_status
   -- Description : initializes the lane_analyzer Status regsiter
   ---------------------------------------------------------------------------
   function init_la_status return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp(C_AXI_DATA_WIDTH-1 downto C_LA_LANE_CAPA_MAX_BTFD +1) := (others => '0');
      temp(C_LA_LANE_CAPA_MAX_BTFD downto C_LA_ERR_CNT_MAX_BTFD +1) := std_logic_vector(C_DEFAULT_LA_LANE_CAPA);
      temp(C_LA_ERR_CNT_MAX_BTFD downto  C_LA_TEST_END_BTFD+1) := std_logic_vector(C_DEFAULT_LA_ERR_CNT);
      temp(C_LA_TEST_END_BTFD)                                 := C_DEFAULT_LA_TEST_END;
      temp(C_LA_BUSY_BTFD)                                     := C_DEFAULT_LA_BUSY;
      return temp;
   end function;
   ---------------------------------------------------------------------------
   -- FUNCTION: init_la_init_val
   -- Description : initializes the lane_analyzer Initial Value regsiter
   ---------------------------------------------------------------------------
   function init_la_init_val return std_logic_vector is
      variable temp : std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
   begin
      temp := std_logic_vector(C_DEFAULT_LA_INIT_VAL);
      return temp;
   end function;
end package body pkg_model;
