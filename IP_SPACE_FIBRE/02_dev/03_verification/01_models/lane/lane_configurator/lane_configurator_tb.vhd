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
--------------------------------------------------------------------------
-- COMPANY       : CNES
--------------------------------------------------------------------------
-- TITLE         : lane_configurator_tb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 04/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : testbench for the lane_configurator model
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_model.all;
use work.pkg_tb.all;

entity LANE_CONFIGURATOR_TB is
end entity ;

architecture tesbench of LANE_CONFIGURATOR_TB is
    constant hp    : time := 5 ns;

    signal clk     	                  : std_logic := '0';
    signal rstn  	                     : std_logic;

     -- Write address channel
    signal s_axi_awaddr                :  std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_awvalid               :  std_logic;
    signal s_axi_awready  	            :  std_logic;

    -- Write channel
    signal s_axi_wdata                 :  std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_wstrb                 :  std_logic_vector(3 downto 0);
    signal s_axi_wvalid                :  std_logic;
    signal s_axi_wready                :  std_logic;

    -- Write response channel
    signal s_axi_bready                :  std_logic;
    signal s_axi_bresp   	            :  std_logic_vector(1 downto 0);
    signal s_axi_bvalid   	            :  std_logic;

     -- Read address channel
    signal s_axi_araddr                :  std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_arvalid               :  std_logic;
    signal s_axi_arready 	            :  std_logic;

     -- Read channel
    signal s_axi_rready                :  std_logic;
    signal s_axi_rdata   	            :  std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_rresp   	            :  std_logic_vector(1 downto 0);
    signal s_axi_rvalid   	            :  std_logic;

     -- signaux intermédiaires

    signal lane_start                  : std_logic;
    signal autostart                   : std_logic;
    signal lane_reset                  : std_logic;
    signal parallel_loopback_en        : std_logic;
    signal standby_reason              : std_logic_vector(C_STDBYREASON_WIDTH-1 downto 0);

    signal near_end_serial_lb_en       : std_logic;
    signal far_end_serial_lb_en        : std_logic;

    signal lane_state                  :  std_logic_vector(3 downto 0) ;
    signal rx_error_cnt                :  std_logic_vector(7 downto 0);
    signal rx_error_ovf                :  std_logic;
    signal loss_signal                 :  std_logic;
    signal far_end_capa                :  std_logic_vector(7 downto 0);
    signal rx_polarity                 :  std_logic;


begin
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_CONFIGURATOR_TB
   -- Description : Lane configurator model
   ---------------------------------------------------------------------------

    I_LANE_CONFIGURATOR: entity work.LANE_CONFIGURATOR
	port map (
	   CLK             =>  clk,
	   RST_N           =>  rstn,

	   S_AXI_AWADDR    =>  s_axi_awaddr,
	   S_AXI_AWVALID   =>  s_axi_awvalid,
	   S_AXI_AWREADY   =>  s_axi_awready,
	   S_AXI_WDATA     =>  s_axi_wdata,
	   S_AXI_WSTRB     =>  s_axi_wstrb,
	   S_AXI_WVALID    =>  s_axi_wvalid,
	   S_AXI_WREADY    =>  s_axi_wready,
	   S_AXI_BREADY    =>  s_axi_bready,
	   S_AXI_BRESP     =>  s_axi_bresp,
	   S_AXI_BVALID    =>  s_axi_bvalid,
	   S_AXI_ARADDR    =>  s_axi_araddr,
	   S_AXI_ARVALID   =>  s_axi_arvalid,
	   S_AXI_ARREADY   =>  s_axi_arready,
	   S_AXI_RREADY    =>  s_axi_rready,
	   S_AXI_RDATA     =>  s_axi_rdata,
	   S_AXI_RRESP     =>  s_axi_rresp,
	   S_AXI_RVALID    =>  s_axi_rvalid,
	   -- LANE + PHY interface
       ---------------------------------------
       -- to the LANE
	   LANE_START             => lane_start,
	   AUTOSTART              => autostart,
	   LANE_RESET             => lane_reset,
	   PARALLEL_LOOPBACK_EN   => parallel_loopback_en,
	   STANDBY_REASON         => standby_reason,
       -- to the PHY
	   NEAR_END_SERIAL_LB_EN  => near_end_serial_lb_en,
	   FAR_END_SERIAL_LB_EN   => far_end_serial_lb_en,
       -- from the LANE
	   LANE_STATE             => lane_state,
	   RX_ERROR_CNT           => rx_error_cnt,
	   RX_ERROR_OVF           => rx_error_ovf,
	   LOSS_SIGNAL            => loss_signal,
	   FAR_END_CAPA           => far_end_capa,
	   RX_POLARITY            => rx_polarity
	);

clk <= not clk after hp;

---------------------------------------
-- PROCESS
---------------------------------------

process is
   ---------------------------------------------------------------------------
   -- PROCEDURE: write_axi
   -- Description : AXI4 Lite writing procedure
   ---------------------------------------------------------------------------
	procedure write_axi (
       signal s_axi_awvalid      : out std_logic;
	   signal s_axi_wvalid       : out std_logic;
	   signal s_axi_bready       : out std_logic;
       signal clk                : in std_logic;
	   signal s_axi_awready      : in std_logic;
	   signal s_axi_wready       : in std_logic;
	   signal s_axi_bvalid       : in std_logic
      ) is
	begin
       s_axi_awvalid <= '1';
       s_axi_wvalid  <= '1';
	   wait until rising_edge(clk) and s_axi_awready = '1' and s_axi_wready = '1';
	   s_axi_awvalid <= '0';
	   s_axi_wvalid  <= '0';
	   s_axi_bready  <= '1';
	   wait until rising_edge(clk) and s_axi_bvalid = '1';
	   s_axi_bready  <= '0';
	end write_axi;
   ---------------------------------------------------------------------------
   -- PROCEDURE: read_axi
   -- Description : AXI4 Lite reading procedure
   ---------------------------------------------------------------------------
	procedure read_axi (
       signal s_axi_arvalid : out std_logic;
	   signal s_axi_rready  : out std_logic;
       signal clk           : in std_logic;
	   signal s_axi_arready : in std_logic;
	   signal s_axi_rvalid  : in std_logic
      ) is
	begin
	   s_axi_arvalid <= '1';
	   wait until rising_edge(clk) and s_axi_arready = '1';
	   s_axi_arvalid <= '0';
	   s_axi_rready  <= '1';
	   wait until rising_edge(clk) and s_axi_rvalid = '1';
	   s_axi_rready  <= '0';
	end read_axi;


begin
   rstn                 <= '0';
   s_axi_awaddr         <= (others => '0');
   s_axi_awvalid        <= '0';
   s_axi_araddr	      <= (others => '0');
   s_axi_arvalid        <= '0';
   s_axi_wdata          <= (others => '0');
   s_axi_wstrb	         <= (others => '0');
   s_axi_wvalid         <= '0';
   s_axi_bready         <= '0';
   s_axi_rready	      <= '0';
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   rstn <= '1';
--    ########################################################
--    ###        Test : Parameters PHY-Register            ###
--    ########################################################
   -- verify intials values
   check(near_end_serial_lb_en, '0', "Near end serial loopback init", PRINT_ON_ERROR);
   check(far_end_serial_lb_en,  '0', "Far end serial loopback init",  PRINT_ON_ERROR);

   -- check near_end_serial_lb_en
   s_axi_wdata  <= x"00000001";              -- lane parameters register, sets the bit field of the near_end_serial_lb_en signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_PHY_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(near_end_serial_lb_en, '1', "Near end serial loopback set '1'", PRINT_ON_ERROR);
   check(far_end_serial_lb_en,  '0', "Far end serial loopback set '0'",  PRINT_ON_ERROR);

   -- check far_end_serial_lb_en
   s_axi_wdata  <= x"00000002";              -- lane parameters register, sets the bit field of the near_end_serial_lb_en signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_PHY_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(near_end_serial_lb_en, '0', "Near end serial loopback set '0'", PRINT_ON_ERROR);
   check(far_end_serial_lb_en,  '1', "Far end serial loopback set '1'",  PRINT_ON_ERROR);

   -- set '0'
   s_axi_wdata  <= (others => '0');                                                      -- set phy parameters register to 0
   s_axi_awaddr <= x"000000" & C_ADDR_LC_PHY_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(near_end_serial_lb_en, '0', "Near end serial loopback set '0'", PRINT_ON_ERROR);
   check(far_end_serial_lb_en,  '0', "Far end serial loopback set '0'",  PRINT_ON_ERROR);
   wait for 2*hp;

--    ########################################################
--    ###        Test : Parameters Lane-Register           ###
--    ########################################################
   -- verify intials values
   check(lane_start,           '0',        "lane start init",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start init",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset init",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable init", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason init",           PRINT_ON_ERROR);

   -- check lanestart
   s_axi_wdata  <= x"00000001";              -- lane parameters register, sets the bit field of the lane start signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '1',        "lane start set '1'",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);

   -- check autostart
   s_axi_wdata  <= x"00000002";              -- lane parameters register, sets the bit field of the autostart signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '0',        "lane start set '0'",               PRINT_ON_ERROR);
   check(autostart,            '1',        "auto start set '1'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);

   -- check lane_reset
   s_axi_wdata  <= x"00000004";              -- lane parameters register, sets the bit field of the lane_reset signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '0',        "lane start set '0'",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '1',        "lane reset set '1'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);

   -- check parallel_loopback_en
   s_axi_wdata  <= x"00000008";              -- lane parameters register, sets the bit field of the parallel_loopback_en signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '0',        "lane start set '0'",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '1',        "parallel loopback enable set '1'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);

   -- check standby_reason
   s_axi_wdata  <= x"00000FF0";              -- lane parameters register, sets the bit field of the standby_reason signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '0',        "lane start set '0'",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "11111111", "standby reason set '1'",           PRINT_ON_ERROR);

   -- check lane start pulse
   s_axi_wdata  <= x"00001000";              -- lane parameters register, sets the bit field of the lane_start_pulse signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   check(lane_start,           '1',        "lane start pulse set '1'",         PRINT_ON_ERROR);
   wait for hp;

   check(lane_start,           '0',        "lane start pulse set '0'",         PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);

   wait for hp;
   -- set '0'
   s_axi_wdata  <= (others => '0');                                                  -- set lane parameters register to 0
   s_axi_awaddr <= x"000000" & C_ADDR_LC_LANE_PARAM;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   wait for 2*hp;

   check(lane_start,           '0',        "lane start set '0'",               PRINT_ON_ERROR);
   check(autostart,            '0',        "auto start set '0'",               PRINT_ON_ERROR);
   check(lane_reset,           '0',        "lane reset set '0'",               PRINT_ON_ERROR);
   check(parallel_loopback_en, '0',        "parallel loopback enable set '0'", PRINT_ON_ERROR);
   check(standby_reason,       "00000000", "standby reason set '0'",           PRINT_ON_ERROR);
   wait for 2*hp;

--    ########################################################
--    ###        Test : Status Lane-Register           ###
--    ########################################################
   -- set lane_state '1'
   lane_state           <= (others => '1');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LANESTATE_MAX_BTFD downto 0), "1111",                                                "Lane state set '1'",       PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 4),   std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 4)), "Lane state set '1' error", PRINT_ON_ERROR);

   -- set rx_error_cnt '1'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '1');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LANESTATE_MAX_BTFD downto 0),                       "0000",                                                  "rx_error_cnt set '1' error", PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_ERR_CNT_MAX_BTFD downto C_LANESTATE_MAX_BTFD+1), "11111111",                                              "RX errour counter set '1'",  PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 12),                         std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 12)), "rx_error_cnt set '1' error", PRINT_ON_ERROR);

   -- set rx_error_ovf '1'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '1';
   loss_signal          <= '0';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	    <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_RX_ERR_CNT_MAX_BTFD downto 0), std_logic_vector(to_unsigned(0,C_LANESTATE_WIDTH + C_RX_ERR_CNT_WIDTH)),"rx_error_ovf set '1' error", PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_ERR_OVF_BTFD),             '1',                                                                     "RX error counter overflow set '1'",  PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 13),   std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 13)),                 "rx_error_ovf set '1' error", PRINT_ON_ERROR);

   -- set loss_signal '1'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '1';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_RX_ERR_OVF_BTFD downto 0),   std_logic_vector(to_unsigned(0,C_LANESTATE_WIDTH + C_RX_ERR_CNT_WIDTH +1)), "loss_signal set '1' error",   PRINT_ON_ERROR);
   check(s_axi_rdata(C_FAR_LOST_SIG_BTFD),          '1',                                                                        "Far end loss signal set '1'", PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 14), std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 14)),                     "loss_signal set '1' error",   PRINT_ON_ERROR);

   -- set far_end_capa '1'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa         <= (others => '1');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_FAR_LOST_SIG_BTFD downto 0),                     std_logic_vector(to_unsigned(0,C_LANESTATE_WIDTH + C_RX_ERR_CNT_WIDTH +1 +1)), "far_end_capa set '1' error", PRINT_ON_ERROR);
   check(s_axi_rdata(C_FAR_CAPA_MAX_BTFD downto C_FAR_LOST_SIG_BTFD+1), "11111111",                                                                     "Far end capabilities set '1'",       PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 22),                     std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 22)),                         "far_end_capa set '1' error", PRINT_ON_ERROR);

   -- set rx_polarity '1'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '1';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_FAR_CAPA_MAX_BTFD downto 0), std_logic_vector(to_unsigned(0,C_LANESTATE_WIDTH + C_RX_ERR_CNT_WIDTH +1 +1 +C_FAR_CAPA_WIDTH)), "rx_polarity set '1' error", PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_POLARITY_BTFD),           '1',                                                                                             "RX polarity set '1'",       PRINT_ON_ERROR);
   check(s_axi_rdata(C_AXI_DATA_WIDTH-1 downto 23), std_logic_vector(to_unsigned(0,C_AXI_DATA_WIDTH - 23)),                                          "rx_polarity set '1' error", PRINT_ON_ERROR);

   wait for 2*hp;
   -- set '0'
   lane_state           <= (others => '0');
   rx_error_cnt         <= (others => '0');
   rx_error_ovf         <= '0';
   loss_signal          <= '0';
   far_end_capa         <= (others => '0');
   rx_polarity          <= '0';
   wait for 2*hp;
   s_axi_araddr  	      <= x"000000" & C_ADDR_LC_LANE_STATUS;
   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LANESTATE_MAX_BTFD downto 0),                       "0000",            "Lane state set '0'",                 PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_ERR_CNT_MAX_BTFD downto C_LANESTATE_MAX_BTFD+1), "00000000",        "RX errour counter set '0'",          PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_ERR_OVF_BTFD),                                   '0',               "RX error counter overflow set '0'",  PRINT_ON_ERROR);
   check(s_axi_rdata(C_FAR_LOST_SIG_BTFD),                                 '0',               "Far end loss signal set '0'",        PRINT_ON_ERROR);
   check(s_axi_rdata(C_FAR_CAPA_MAX_BTFD downto C_FAR_LOST_SIG_BTFD+1),    "00000000",        "Far end capabilities set '0'",       PRINT_ON_ERROR);
   check(s_axi_rdata(C_RX_POLARITY_BTFD),                                  '0',               "RX polarity set '0'",                PRINT_ON_ERROR);
   wait for 2*hp;
   wait;

end process;

end architecture;
