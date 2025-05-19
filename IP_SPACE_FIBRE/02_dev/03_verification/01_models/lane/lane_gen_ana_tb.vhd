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
-- TITLE         : lane_gen_ana_tb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 17/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : testbench for the lane_generator and lane_analyzer model
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.pkg_model.all;
use work.pkg_tb.all;

entity LANE_GEN_ANA_TB is
end entity ;

architecture tesbench of LANE_GEN_ANA_TB is
   type nb_frame_array   is array(0 to 5)  of integer;
   type delay_pkt_array  is array(0 to 3)  of integer;
   type gen_data_array   is array(0 to 1)  of std_logic;

   constant hp    : time := 5 ns;

    signal clk     	          : std_logic := '0';
    signal rstn  	          : std_logic;
    signal rst  	          : std_logic;
-- AXI_generator
     -- Write address channel
     signal s_gen_axi_awaddr  : std_logic_vector(31 downto 0);
     signal s_gen_axi_awvalid : std_logic;
     signal s_gen_axi_awready : std_logic;

     -- Write channel
     signal s_gen_axi_wdata   : std_logic_vector(31 downto 0);
     signal s_gen_axi_wstrb   : std_logic_vector(3 downto 0);
     signal s_gen_axi_wvalid  : std_logic;
     signal s_gen_axi_wready  : std_logic;
     -- Write response channel
     signal s_gen_axi_bready  : std_logic;
     signal s_gen_axi_bresp   : std_logic_vector(1 downto 0);
     signal s_gen_axi_bvalid  : std_logic;

      -- Read address channel
     signal s_gen_axi_araddr  : std_logic_vector(31 downto 0);
     signal s_gen_axi_arvalid : std_logic;
     signal s_gen_axi_arready : std_logic;

      -- Read channel
     signal s_gen_axi_rready  : std_logic;
     signal s_gen_axi_rdata   : std_logic_vector(31 downto 0);
     signal s_gen_axi_rresp   : std_logic_vector(1 downto 0);
     signal s_gen_axi_rvalid  : std_logic;
 
    -- AXI_analyzer
    -- Write address channel
    signal s_ana_axi_awaddr   : std_logic_vector(31 downto 0);
    signal s_ana_axi_awvalid  : std_logic;
    signal s_ana_axi_awready  : std_logic;

    -- Write channel
    signal s_ana_axi_wdata    : std_logic_vector(31 downto 0);
    signal s_ana_axi_wstrb    : std_logic_vector(3 downto 0);
    signal s_ana_axi_wvalid   : std_logic;
    signal s_ana_axi_wready   : std_logic;

    -- Write response channel
    signal s_ana_axi_bready   : std_logic;
    signal s_ana_axi_bresp   	: std_logic_vector(1 downto 0);
    signal s_ana_axi_bvalid   : std_logic;

     -- Read address channel
    signal s_ana_axi_araddr   : std_logic_vector(31 downto 0);
    signal s_ana_axi_arvalid  : std_logic;
    signal s_ana_axi_arready 	: std_logic;

     -- Read channel
    signal s_ana_axi_rready   : std_logic;
    signal s_ana_axi_rdata    : std_logic_vector(31 downto 0);
    signal s_ana_axi_rresp    : std_logic_vector(1 downto 0);
    signal s_ana_axi_rvalid   : std_logic;

     -- signaux intermédiaires
    signal data_tx            : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);
    signal new_data_tx_ppl       : std_logic;                                          -- Flag to write data in FIFO TX
    signal fifo_tx_full_ppl      : std_logic;                                          -- Flag full of the FIFO TX
    signal lane_reset_dl         : std_logic;                                          -- Lane Reset to the lane layer
    signal valid_k_charac_tx_ppl : std_logic_vector(C_VALID_K_WIDTH -1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector

    signal data_rx            : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);
    signal fifo_rx_empty_ppl  : std_logic;                                          -- Flag full of the FIFO TX
    signal fifo_rx_rd_en_ppl  : std_logic;                                          -- Lane Reset to the lane layer
    signal valid_k_charac_rx_ppl : std_logic_vector(C_VALID_K_WIDTH -1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector
    signal far_end_capa_dl_i     : std_logic_vector(C_LA_LANE_CAPA_WIDTH-1  downto 0); -- Capability field receive in INIT3 control word
    
    signal fifo_data_tx : std_logic_vector(36 -1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector
    signal fifo_data_rx : std_logic_vector(36 -1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector

    -- signaux testbench

begin
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_GENERATOR_TB
   -- Description : Lane generator model
   ---------------------------------------------------------------------------

    I_LANE_GENERATOR: entity work.LANE_GENERATOR
	port map (
	   CLK             =>  clk,
	   RST_N           =>  rstn,
	   S_AXI_AWADDR    =>  s_gen_axi_awaddr,
	   S_AXI_AWVALID   =>  s_gen_axi_awvalid,
	   S_AXI_AWREADY   =>  s_gen_axi_awready,
	   S_AXI_WDATA     =>  s_gen_axi_wdata,
	   S_AXI_WSTRB     =>  s_gen_axi_wstrb,
	   S_AXI_WVALID    =>  s_gen_axi_wvalid,
	   S_AXI_WREADY    =>  s_gen_axi_wready,
	   S_AXI_BREADY    =>  s_gen_axi_bready,
	   S_AXI_BRESP     =>  s_gen_axi_bresp,
	   S_AXI_BVALID    =>  s_gen_axi_bvalid,
	   S_AXI_ARADDR    =>  s_gen_axi_araddr,
	   S_AXI_ARVALID   =>  s_gen_axi_arvalid,
	   S_AXI_ARREADY   =>  s_gen_axi_arready,
	   S_AXI_RREADY    =>  s_gen_axi_rready,
	   S_AXI_RDATA     =>  s_gen_axi_rdata,
	   S_AXI_RRESP     =>  s_gen_axi_rresp,
	   S_AXI_RVALID    =>  s_gen_axi_rvalid,
	   -- LANE interface
       ---------------------------------------
	   DATA_TX              => data_tx,
      NEW_DATA_TX_PPL       => new_data_tx_ppl,
      FIFO_TX_FULL_PPL      => fifo_tx_full_ppl,
      LANE_RESET_DL         => lane_reset_dl,
      VALID_K_CHARAC_TX_PPL => valid_k_charac_tx_ppl
	);

    ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_ANALYZER_TB
   -- Description : Lane analyzer model
   ---------------------------------------------------------------------------

   I_LANE_ANALYZER: entity work.LANE_ANALYZER
   port map (
      CLK             =>  clk,
      RST_N           =>  rstn,

      S_AXI_AWADDR    =>  s_ana_axi_awaddr,
      S_AXI_AWVALID   =>  s_ana_axi_awvalid,
      S_AXI_AWREADY   =>  s_ana_axi_awready,
      S_AXI_WDATA     =>  s_ana_axi_wdata,
      S_AXI_WSTRB     =>  s_ana_axi_wstrb,
      S_AXI_WVALID    =>  s_ana_axi_wvalid,
      S_AXI_WREADY    =>  s_ana_axi_wready,
      S_AXI_BREADY    =>  s_ana_axi_bready,
      S_AXI_BRESP     =>  s_ana_axi_bresp,
      S_AXI_BVALID    =>  s_ana_axi_bvalid,
      S_AXI_ARADDR    =>  s_ana_axi_araddr,
      S_AXI_ARVALID   =>  s_ana_axi_arvalid,
      S_AXI_ARREADY   =>  s_ana_axi_arready,
      S_AXI_RREADY    =>  s_ana_axi_rready,
      S_AXI_RDATA     =>  s_ana_axi_rdata,
      S_AXI_RRESP     =>  s_ana_axi_rresp,
      S_AXI_RVALID    =>  s_ana_axi_rvalid,
      -- LANE interface
      ---------------------------------------
      DATA_RX               => data_rx,
      VALID_K_CHARAC_RX_PPL => valid_k_charac_rx_ppl,
      FIFO_RX_EMPTY_PPL     => fifo_rx_empty_ppl,
      FIFO_RX_RD_EN_PPL     => fifo_rx_rd_en_ppl,
      FAR_END_CAPA_DL       => far_end_capa_dl_i
   );
 
inst_fifo_tx_data : entity work.fifo_dc
   generic map(
        G_DWIDTH                => 36,
        G_AWIDTH                => 10,
        G_THRESHOLD_HIGH        => 2**10,
        G_THRESHOLD_LOW         => 0
    )
    port map(
        RST_N                   => rstn,
        -- Writing port
        WR_CLK                  => clk,
        WR_DATA                 => fifo_data_tx,
        WR_DATA_EN              => new_data_tx_ppl,
        -- Reading port
        RD_CLK                  => clk,
        RD_DATA                 => fifo_data_rx,
        RD_DATA_EN              => fifo_rx_rd_en_ppl,
        RD_DATA_VLD             => open,
        -- Command port
        CMD_FLUSH               => '0',
        STATUS_BUSY_FLUSH       => open,
        -- Status port
        STATUS_THRESHOLD_HIGH   => open,
        STATUS_THRESHOLD_LOW    => open,
        STATUS_FULL             => fifo_tx_full_ppl,
        STATUS_EMPTY            => fifo_rx_empty_ppl,
        STATUS_LEVEL_WR         => open,
        STATUS_LEVEL_RD         => open
    );
clk                   <= not clk after hp;
fifo_data_tx          <= valid_k_charac_tx_ppl & data_tx;
valid_k_charac_rx_ppl <= fifo_data_rx(35 downto 32);
data_rx               <= fifo_data_rx(31 downto 0);
---------------------------------------
-- PROCESS
---------------------------------------

process is
   variable nb_frame_ar  : nb_frame_array  := (1,2, 3, 4, 10, 20);
   variable delay_pkt_ar : delay_pkt_array := (0, 1, 2, 20);
   variable gen_data_ar  : gen_data_array  := (C_INCREMENTAL, C_PRBS);
   ---------------------------------------------------------------------------
   -- PROCEDURE: write_axi
   -- Description : AXI4 Lite writing procedure
   ---------------------------------------------------------------------------
	procedure write_axi (
      signal s_axi_awvalid : out std_logic;
	   signal s_axi_wvalid  : out std_logic;
	   signal s_axi_bready  : out std_logic;
      signal clk           : in std_logic;
	   signal s_axi_awready : in std_logic;
	   signal s_axi_wready  : in std_logic;
	   signal s_axi_bvalid  : in std_logic
      ) is
	begin
       s_axi_awvalid <= '1';
       s_axi_wvalid  <= '1';
	   wait until rising_edge(clk) and s_axi_awready = '1' and s_axi_wready = '1';
	   s_axi_awvalid  <= '0';
	   s_axi_wvalid   <= '0';
	   s_axi_bready   <= '1';
	   wait until rising_edge(clk) and s_axi_bvalid = '1';
	   s_axi_bready   <= '0';
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
   rstn              <= '0';
   rst               <= '1';
   s_gen_axi_awaddr  <= (others => '0');
   s_gen_axi_awvalid <= '0';
   s_gen_axi_araddr  <= (others => '0');
   s_gen_axi_arvalid <= '0';
   s_gen_axi_wdata   <= (others => '0');
   s_gen_axi_wstrb   <= (others => '0');
   s_gen_axi_wvalid  <= '0';
   s_gen_axi_bready  <= '0';
   s_gen_axi_rready  <= '0';
   s_ana_axi_awaddr  <= (others => '0');
   s_ana_axi_awvalid <= '0';
   s_ana_axi_araddr  <= (others => '0');
   s_ana_axi_arvalid <= '0';
   s_ana_axi_wdata   <= (others => '0');
   s_ana_axi_wstrb   <= (others => '0');
   s_ana_axi_wvalid  <= '0';
   s_ana_axi_bready  <= '0';
   s_ana_axi_rready  <= '0';
   wait for 2*hp;
   rstn <= '1';
   rst  <= '0';
--    #########################################################################
--    ###    Test 1: Control Word lane_analyzer and lane_generator          ###
--    #########################################################################
   -- set Configuration register lane_generator
   s_gen_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(0,  C_LG_FRAME_NB_WIDTH));        -- lane parameters register, sets the bit field of the lane start signal to '1'
   s_gen_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(0,C_LG_FRAME_SIZE_WIDTH));            -- lane parameters register, sets the bit field of the auto start signal to '1'
   s_gen_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(1, C_LG_INTER_PKT_DELAY_WIDTH)); -- lane parameters register, sets the bit field of the lane reset signal to '1'
   s_gen_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= '0';                                                             -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_gen_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_CONTROL_WORD);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_gen_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LG_CONFIG;
   write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
   wait for 2*hp;
   s_gen_axi_araddr <= x"000000" & C_ADDR_LG_CONFIG;
   read_axi(s_gen_axi_arvalid, s_gen_axi_rready, clk, s_gen_axi_arready, s_gen_axi_rvalid);
   check(s_gen_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(0,  C_LG_FRAME_NB_WIDTH)),        "Frame number reg",    PRINT_ON_ERROR);
   check(s_gen_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(0,C_LG_FRAME_SIZE_WIDTH)),            "Frame size reg",      PRINT_ON_ERROR);
   check(s_gen_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(1, C_LG_INTER_PKT_DELAY_WIDTH)), "Inter-packet delay",  PRINT_ON_ERROR);
   check(s_gen_axi_rdata(C_LG_GEN_DATA_BTFD),                                               '0',                                                             "Generation type reg", PRINT_ON_ERROR);
   check(s_gen_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_CONTROL_WORD),                              "Test 1 Data mode reg",       PRINT_ON_ERROR);
   s_gen_axi_wdata   <= (others => '0');
   wait for 2*hp;
 --    ########################################################
 --    ###  Configuration regsiter lane_analyzer            ###
 --    ########################################################
   -- verify intials values
   check(data_tx, x"00000000", "data tx init", PRINT_ON_ERROR);
   -- set Configuration register lane_generator
   s_ana_axi_wdata(C_LA_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(0,  C_LA_FRAME_NB_WIDTH));        -- lane parameters register, sets the bit field of the lane start signal to '1'
   s_ana_axi_wdata(C_LA_FRAME_SIZE_MAX_BTFD downto C_LA_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(0,C_LA_FRAME_SIZE_WIDTH));            -- lane parameters register, sets the bit field of the auto start signal to '1'
   s_ana_axi_wdata(C_LA_INTER_PKT_DELAY_MAX_BTFD downto C_LA_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(1, C_LA_INTER_PKT_DELAY_WIDTH)); -- lane parameters register, sets the bit field of the lane reset signal to '1'
   s_ana_axi_wdata(C_LA_GEN_DATA_BTFD)                                               <= '0';                                                             -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_ana_axi_wdata(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LA_DM_CONTROL_WORD);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_ana_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LA_CONFIG;
   s_ana_axi_araddr  	                                                             <= x"000000" & C_ADDR_LA_CONFIG;
   write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
   wait for 2*hp;
   read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);
   check(s_ana_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(0,  C_LA_FRAME_NB_WIDTH)),       "Frame number reg",    PRINT_ON_ERROR);
   check(s_ana_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(0,C_LA_FRAME_SIZE_WIDTH)),      "Frame size reg",      PRINT_ON_ERROR);
   check(s_ana_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(1, C_LA_INTER_PKT_DELAY_WIDTH)), "Inter-packet delay",  PRINT_ON_ERROR);
   check(s_ana_axi_rdata(C_LG_GEN_DATA_BTFD),                                               '0',                                                            "Generation type reg", PRINT_ON_ERROR);
   check(s_ana_axi_rdata(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1),             std_logic_vector(C_LA_DM_CONTROL_WORD),                              "Test 1 Data mode reg",       PRINT_ON_ERROR);
   s_ana_axi_wdata   <= (others => '0');
   wait for 2*hp;
 --    #########################################################################
 --    ###   Control regsiter lane_analyzer and lane_generator       ###
 --    #########################################################################
   -- Start generation data
   s_ana_axi_wdata(C_LA_MODEL_START_BTFD) <= '1'; -- lane control register, sets the bit field of the model start signal to '1'
   s_ana_axi_awaddr  	                  <= x"000000" & C_ADDR_LA_CONTROL;
   write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
   wait for 2*hp;
   s_gen_axi_wdata(C_LG_MODEL_START_BTFD) <= '1'; -- lane control register, sets the bit field of the model start signal to '1'
   s_gen_axi_awaddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
   wait for 100000*hp;
--    #########################################################################
--    ###    Check error counter                                            ###
--    #########################################################################
   s_ana_axi_araddr <= x"000000" & C_ADDR_LA_STATUS;
   wait for 10*hp;
   read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);
   check(s_ana_axi_rdata(C_LA_ERR_CNT_MAX_BTFD downto C_LA_TEST_END_BTFD +1),  std_logic_vector(to_unsigned(0,C_LA_CNT_ERR_MAX_WIDTH)), "Test 1 Error counter not equal to 0", PRINT_ON_ERROR);
   wait for 10*hp;
   s_gen_axi_wdata   <= (others => '0');
   s_ana_axi_wdata   <= (others => '0');
   wait for 2*hp;
--    #########################################################################
--    ###    Test 2: Control regsiter lane_analyzer and lane_generator      ###
--    #########################################################################
   wait for 2*hp;
   for h in gen_data_ar'range loop
      for i in nb_frame_ar'range loop
         for size_frame in 1 to 256 loop
            for k in delay_pkt_ar'range loop
               --    #########################################################################
               --    ###    Check error counter                                            ###
               --    #########################################################################
               s_ana_axi_araddr <= x"000000" & C_ADDR_LA_STATUS;
               wait for 10*hp;

               read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);

               check(s_ana_axi_rdata(C_LA_ERR_CNT_MAX_BTFD downto C_LA_TEST_END_BTFD +1),  std_logic_vector(to_unsigned(0,C_LA_CNT_ERR_MAX_WIDTH)), "Error counter not equal to 0", PRINT_ON_ERROR);

               wait for 10*hp;
               s_gen_axi_wdata   <= (others => '0');
               s_ana_axi_wdata   <= (others => '0');
               wait for 2*hp;
               --    ########################################################
               --    ###  Configuration regsiter lane_generator           ###
               --    ########################################################

               -- set Configuration register lane_generator
               s_gen_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(nb_frame_ar(i),  C_LG_FRAME_NB_WIDTH));        -- lane parameters register, sets the bit field of the lane start signal to '1'
               s_gen_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(size_frame,C_LG_FRAME_SIZE_WIDTH));            -- lane parameters register, sets the bit field of the auto start signal to '1'
               s_gen_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(delay_pkt_ar(k), C_LG_INTER_PKT_DELAY_WIDTH)); -- lane parameters register, sets the bit field of the lane reset signal to '1'
               s_gen_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= gen_data_ar(h);                                                             -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
               s_gen_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_DATA);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
               s_gen_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LG_CONFIG;
               write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
               wait for 2*hp;
               s_gen_axi_araddr <= x"000000" & C_ADDR_LG_CONFIG;
               read_axi(s_gen_axi_arvalid, s_gen_axi_rready, clk, s_gen_axi_arready, s_gen_axi_rvalid);

               check(s_gen_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(nb_frame_ar(i),  C_LG_FRAME_NB_WIDTH)),        "Frame number reg",    PRINT_ON_ERROR);
               check(s_gen_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(size_frame,C_LG_FRAME_SIZE_WIDTH)),            "Frame size reg",      PRINT_ON_ERROR);
               check(s_gen_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(delay_pkt_ar(k), C_LG_INTER_PKT_DELAY_WIDTH)), "Inter-packet delay",  PRINT_ON_ERROR);
               check(s_gen_axi_rdata(C_LG_GEN_DATA_BTFD),                                               gen_data_ar(h),                                                             "Generation type reg", PRINT_ON_ERROR);
               check(s_gen_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_DATA),                                             "Test 1 Data mode reg",PRINT_ON_ERROR);

               s_gen_axi_wdata   <= (others => '0');
               wait for 2*hp;
               --    ########################################################
               --    ###  Initial Value regsiter lane_generator           ###
               --    ########################################################
               if (gen_data_ar(h)=C_INCREMENTAL) then
                  -- set Initial Value register lane_generator
                  s_gen_axi_wdata  <= std_logic_vector(to_unsigned(1,s_gen_axi_wdata'length));                         -- Initial value register
                  s_gen_axi_awaddr <= x"000000" & C_ADDR_LG_INIT_VAL;
                  write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
                  wait for 2*hp;
                  s_gen_axi_araddr <= x"000000" & C_ADDR_LG_INIT_VAL;
                  read_axi(s_gen_axi_arvalid, s_gen_axi_rready, clk, s_gen_axi_arready, s_gen_axi_rvalid);

                  check(s_gen_axi_rdata, std_logic_vector(to_unsigned(1,s_gen_axi_rdata'length)), "Initial value reg incremental", PRINT_ON_ERROR);

                  s_gen_axi_wdata   <= (others => '0');
                  wait for 2*hp;
               else
                  -- set Initial Value register lane_generator
                  s_gen_axi_wdata  <= x"FFFFFFFF";                         -- Initial value register
                  s_gen_axi_awaddr <= x"000000" & C_ADDR_LG_INIT_VAL;
                  write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
                  wait for 2*hp;
                  s_gen_axi_araddr <= x"000000" & C_ADDR_LG_INIT_VAL;
                  read_axi(s_gen_axi_arvalid, s_gen_axi_rready, clk, s_gen_axi_arready, s_gen_axi_rvalid);

                  check(s_gen_axi_rdata, x"FFFFFFFF", "Initial value reg PRBS", PRINT_ON_ERROR);

                  s_gen_axi_wdata   <= (others => '0');
                  wait for 2*hp;
               end if;

               --    ########################################################
               --    ###  Configuration regsiter lane_analyzer            ###
               --    ########################################################
                  -- verify intials values
                  check(data_tx, x"00000000", "data tx init", PRINT_ON_ERROR);
                  -- set Configuration register lane_generator
                  s_ana_axi_wdata(C_LA_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(nb_frame_ar(i),  C_LA_FRAME_NB_WIDTH));        -- lane parameters register, sets the bit field of the lane start signal to '1'
                  s_ana_axi_wdata(C_LA_FRAME_SIZE_MAX_BTFD downto C_LA_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(size_frame,C_LA_FRAME_SIZE_WIDTH));            -- lane parameters register, sets the bit field of the auto start signal to '1'
                  s_ana_axi_wdata(C_LA_INTER_PKT_DELAY_MAX_BTFD downto C_LA_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(delay_pkt_ar(k), C_LA_INTER_PKT_DELAY_WIDTH)); -- lane parameters register, sets the bit field of the lane reset signal to '1'
                  s_ana_axi_wdata(C_LA_GEN_DATA_BTFD)                                               <= gen_data_ar(h);                                                             -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
                  s_ana_axi_wdata(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LA_DM_DATA);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
                  s_ana_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LA_CONFIG;
                  s_ana_axi_araddr  	                                                             <= x"000000" & C_ADDR_LA_CONFIG;
                  write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
                  wait for 2*hp;

                  read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);

                  check(s_ana_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(nb_frame_ar(i),C_LG_FRAME_NB_WIDTH)),         "Frame number reg",    PRINT_ON_ERROR);
                  check(s_ana_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(size_frame,C_LG_FRAME_SIZE_WIDTH)),           "Frame size reg",      PRINT_ON_ERROR);
                  check(s_ana_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(delay_pkt_ar(k),C_LG_INTER_PKT_DELAY_WIDTH)), "Inter-packet delay",  PRINT_ON_ERROR);
                  check(s_ana_axi_rdata(C_LG_GEN_DATA_BTFD),                                               gen_data_ar(h),                                                            "Generation type reg", PRINT_ON_ERROR);
                  check(s_ana_axi_rdata(C_LA_DATA_MODE_MAX_BTFD downto C_LA_GEN_DATA_BTFD +1),             std_logic_vector(C_LA_DM_DATA),                                            "Test 1 Data mode reg",PRINT_ON_ERROR);
                  s_ana_axi_wdata   <= (others => '0');
                  wait for 2*hp;
               --    ########################################################
               --    ###  Initial Value regsiter lane_analyzer           ###
               --    ########################################################
               if (gen_data_ar(h)= C_INCREMENTAL) then
                  -- set Initial Value register lane_analyzer
                  s_ana_axi_wdata  <= std_logic_vector(to_unsigned(1,s_ana_axi_wdata'length));                         -- Initial value register
                  s_ana_axi_awaddr <= x"000000" & C_ADDR_LA_INIT_VAL;
                  write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
                  wait for 2*hp;
                  s_ana_axi_araddr <= x"000000" & C_ADDR_LA_INIT_VAL;
                  read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);

                  check(s_ana_axi_rdata, std_logic_vector(to_unsigned(1,s_ana_axi_rdata'length)), "Initial value reg incremental", PRINT_ON_ERROR);

                  s_ana_axi_wdata   <= (others => '0');
                  wait for 2*hp;
               else
                  -- set Initial Value register lane_analyzer
                  s_ana_axi_wdata  <= x"FFFFFFFF";                         -- Initial value register
                  s_ana_axi_awaddr <= x"000000" & C_ADDR_LA_INIT_VAL;
                  write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
                  wait for 2*hp;
                  s_ana_axi_araddr <= x"000000" & C_ADDR_LA_INIT_VAL;
                  read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);

                  check(s_ana_axi_rdata, x"FFFFFFFF", "Initial value reg PRBS", PRINT_ON_ERROR);

                  s_ana_axi_wdata   <= (others => '0');
                  wait for 2*hp;
               end if;
               --    #########################################################################
               --    ###    Test : Control regsiter lane_analyzer and lane_generator       ###
               --    #########################################################################
                  -- Start generation data
                  s_ana_axi_wdata(C_LA_MODEL_START_BTFD) <= '1'; -- lane control register, sets the bit field of the model start signal to '1'
                  s_ana_axi_awaddr  	                  <= x"000000" & C_ADDR_LA_CONTROL;
                  write_axi(s_ana_axi_awvalid, s_ana_axi_wvalid, s_ana_axi_bready, clk, s_ana_axi_awready, s_ana_axi_wready, s_ana_axi_bvalid);
                  wait for 2*hp;

                  s_gen_axi_wdata(C_LG_MODEL_START_BTFD) <= '1'; -- lane control register, sets the bit field of the model start signal to '1'
                  s_gen_axi_awaddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
                  write_axi(s_gen_axi_awvalid, s_gen_axi_wvalid, s_gen_axi_bready, clk, s_gen_axi_awready, s_gen_axi_wready, s_gen_axi_bvalid);
                  wait for 100000*hp;
               end loop;
         end loop;
      end loop;
   end loop;
--    #########################################################################
--    ###    Check error counter      ###
--    #########################################################################
   s_ana_axi_araddr <= x"000000" & C_ADDR_LA_STATUS;
   wait for 10*hp;

   read_axi(s_ana_axi_arvalid, s_ana_axi_rready, clk, s_ana_axi_arready, s_ana_axi_rvalid);

   check(s_ana_axi_rdata(C_LA_ERR_CNT_MAX_BTFD downto C_LA_TEST_END_BTFD +1),  std_logic_vector(to_unsigned(0,C_LA_CNT_ERR_MAX_WIDTH)), "Error counter not equal to 0", PRINT_ON_ERROR);

   wait for 10*hp;
   wait;

end process;


end architecture;
