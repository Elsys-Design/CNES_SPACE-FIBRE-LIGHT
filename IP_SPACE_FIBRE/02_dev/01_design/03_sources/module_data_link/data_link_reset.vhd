----------------------------------------------------------------------------
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module describe the Link Reset FSM
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_link_reset is
  generic (
    G_VC_NUM       : integer := 8                                         --! Number of virtual channels
  );
  port (
    RST_N                   : in  std_logic;                              --! Global reset (Active-low)
    CLK                     : in  std_logic;                              --! Global clock
    -- Link Reset
    LINK_RESET_DLRE         : out std_logic;                              --! Link Reset command
    -- data_in_buf (DIBUF) interface
    LINK_RESET_DIBUF        : in  std_logic_vector(G_VC_NUM-1 downto 0);  --! Link Reset request from data_in_buf
    -- data_err_management (DERRM) interface
    LINK_RESET_DERRM        : in std_logic;                               --! Link Reset request from data_err_management
    -- Lane interface
    LANE_RESET_DLRE         : out std_logic;                              --! Lane Reset command
    NEAR_END_CAPA_DLRE      : out std_logic_vector(7 downto 0);           --! Near-end capability
    LANE_ACTIVE_PPL         : in  std_logic;                              --! Lane active flag
    FAR_END_CAPA_PPL        : in  std_logic_vector(7 downto 0);           --! Far-end capability
    --MIB interface
    RESET_PARAM_DLRE        : out std_logic;                              --! Reset all MIB parameters command
    INTERFACE_RESET_MIB     : in  std_logic;                              --! Interface Reset request
    LINK_RESET_MIB          : in  std_logic                               --! Link Reset request
  );
end data_link_reset;

architecture rtl of data_link_reset is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  type link_rst_fsm is (
    CONF_RST_ST,
    NEAR_END_RST_ST,
    CHECK_FAR_END_RST_ST,
    LINK_INIT_ST
  );

  signal current_state          : link_rst_fsm;
  signal cnt_link_reset         : unsigned (4 downto 0);
  signal lane_active_ppl_r      : std_logic;
  signal link_reset_dlre_i      : std_logic;
  signal lane_reset_dlre_i      : std_logic;
  signal current_state_vector      : std_logic_vector(1 downto 0);

begin
--------------------------------------------------------
--                  Assignements                     ---
--------------------------------------------------------
LINK_RESET_DLRE <= link_reset_dlre_i;
LANE_RESET_DLRE <= lane_reset_dlre_i;

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_data_in_fifo
-- Description: Manages the data written into the fifo
---------------------------------------------------------
p_data_in_fifo: process(CLK, RST_N)
begin
  if RST_N ='0' then
    current_state      <= CONF_RST_ST;
    link_reset_dlre_i    <= '1';
    lane_reset_dlre_i    <= '1';
    RESET_PARAM_DLRE   <= '1';
    NEAR_END_CAPA_DLRE <= (others =>'0');
    cnt_link_reset     <= (others =>'0');
    lane_active_ppl_r  <= '1';
    current_state_vector <= "00";
  elsif rising_edge(CLK) then
    link_reset_dlre_i    <= '0';
    lane_reset_dlre_i    <= '0';
    RESET_PARAM_DLRE   <= '0';
    lane_active_ppl_r  <= LANE_ACTIVE_PPL;
    case current_state is
      when CONF_RST_ST          =>
                                  current_state_vector <= "00";
                                  link_reset_dlre_i  <= '1';
                                  lane_reset_dlre_i  <= '1';
                                  RESET_PARAM_DLRE <= '1';
                                  if cnt_link_reset > 2 then
                                    cnt_link_reset     <= (others =>'0');
                                    current_state      <= NEAR_END_RST_ST;
                                  else
                                    cnt_link_reset     <= cnt_link_reset+1;
                                  end if;
      when NEAR_END_RST_ST      =>
                                  current_state_vector <= "01";
                                  link_reset_dlre_i  <= '1';
                                  lane_reset_dlre_i  <= '1';
                                  RESET_PARAM_DLRE   <= '0';
                                  if INTERFACE_RESET_MIB ='1' then
                                    current_state  <= CONF_RST_ST;
                                  elsif LINK_RESET_MIB  ='1' then
                                    cnt_link_reset <= (others =>'0');
                                  elsif cnt_link_reset > 20 then
                                    cnt_link_reset <= (others =>'0');
                                    current_state  <= CHECK_FAR_END_RST_ST;
                                  else
                                    cnt_link_reset <= cnt_link_reset+1;
                                  end if;
      when CHECK_FAR_END_RST_ST =>
                                  current_state_vector <= "10";
                                  NEAR_END_CAPA_DLRE(C_CAPA_LINK_RST) <= '1';
                                  if INTERFACE_RESET_MIB ='1' then
                                    current_state <= CONF_RST_ST;
                                  elsif LINK_RESET_MIB  ='1' or (LINK_RESET_DIBUF /= std_logic_vector(to_unsigned(0,LINK_RESET_DIBUF'length))) or LINK_RESET_DERRM='1' then
                                    current_state <= NEAR_END_RST_ST;
                                  elsif LANE_ACTIVE_PPL = '1' and lane_active_ppl_r = '0' and FAR_END_CAPA_PPL(C_CAPA_LINK_RST) = '1' then
                                    current_state <= LINK_INIT_ST;
                                  end if;
      when LINK_INIT_ST         =>
                                  current_state_vector <= "11";
                                  NEAR_END_CAPA_DLRE(C_CAPA_LINK_RST) <= '0';
                                  if INTERFACE_RESET_MIB ='1' then
                                    current_state <= CONF_RST_ST;
                                  elsif LINK_RESET_MIB  ='1' then
                                    current_state <= NEAR_END_RST_ST;
                                  elsif LANE_ACTIVE_PPL = '1' and lane_active_ppl_r = '0' and FAR_END_CAPA_PPL(C_CAPA_LINK_RST) = '1' then
                                    current_state <= NEAR_END_RST_ST;
                                  elsif LINK_RESET_DIBUF /= std_logic_vector(to_unsigned(0,LINK_RESET_DIBUF'length))  or LINK_RESET_DERRM ='1' then
                                    current_state <= NEAR_END_RST_ST;
                                  end if;
    end case;
  end if;
end process p_data_in_fifo;

end architecture rtl;