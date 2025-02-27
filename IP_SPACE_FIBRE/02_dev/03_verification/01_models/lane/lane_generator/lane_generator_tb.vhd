--------------------------------------------------------------------------
-- COMPANY       : ELSYS Design
--------------------------------------------------------------------------
-- TITLE         : lane_generator_tb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 10/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : testbench for the lane_generator model
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_model.all;
use work.pkg_tb.all;

entity LANE_GENERATOR_TB is
end entity ;

architecture tesbench of LANE_GENERATOR_TB is
    constant hp    : time := 5 ns;

    signal clk     	         : std_logic := '0';
    signal rstn  	            : std_logic;

     -- Write address channel
    signal s_axi_awaddr       :  std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_awvalid      :  std_logic;
    signal s_axi_awready  	   :  std_logic;

    -- Write channel
    signal s_axi_wdata        :  std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_wstrb        :  std_logic_vector(3 downto 0);
    signal s_axi_wvalid       :  std_logic;
    signal s_axi_wready       :  std_logic;

    -- Write response channel
    signal s_axi_bready       :  std_logic;
    signal s_axi_bresp   	   :  std_logic_vector(1 downto 0);
    signal s_axi_bvalid   	   :  std_logic;

     -- Read address channel
    signal s_axi_araddr       :  std_logic_vector(C_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_arvalid      :  std_logic;
    signal s_axi_arready 	   :  std_logic;

     -- Read channel
    signal s_axi_rready       :  std_logic;
    signal s_axi_rdata   	   :  std_logic_vector(C_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_rresp   	   :  std_logic_vector(1 downto 0);
    signal s_axi_rvalid   	   :  std_logic;

     -- signaux intermédiaires
    signal data_tx               : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0);
    signal new_data_tx_ppl       : std_logic;                                          -- Flag to write data in FIFO TX
    signal fifo_tx_full_ppl      : std_logic;                                          -- Flag full of the FIFO TX
    signal lane_reset_dl         : std_logic;                                          -- Lane Reset to the lane layer
    signal valid_k_charac_tx_ppl : std_logic_vector(C_VALID_K_WIDTH -1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector

begin
   ---------------------------------------------------------------------------
   -- INSTANCE: I_LANE_GENERATOR_TB
   -- Description : Lane configurator model
   ---------------------------------------------------------------------------

    I_LANE_GENERATOR_TB: entity work.LANE_GENERATOR
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
	   -- LANE interface
       ---------------------------------------
	   DATA_TX               => data_tx,
      NEW_DATA_TX_PPL       => new_data_tx_ppl,
      FIFO_TX_FULL_PPL      => fifo_tx_full_ppl,
      LANE_RESET_DL         => lane_reset_dl,
      VALID_K_CHARAC_TX_PPL => valid_k_charac_tx_ppl
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
   rstn             <= '0';
   s_axi_awaddr     <= (others => '0');
   s_axi_awvalid    <= '0';
   s_axi_araddr	  <= (others => '0');
   s_axi_arvalid    <= '0';
   s_axi_wdata      <= (others => '0');
   s_axi_wstrb	     <= (others => '0');
   s_axi_wvalid     <= '0';
   s_axi_bready     <= '0';
   s_axi_rready	  <= '0';
   fifo_tx_full_ppl <= '0';
   wait for 2*hp;
   rstn <= '1';
--    ########################################################
--    ###    Test : Configuration regsiter lane_generator  ###
--    ########################################################
   -- verify intials values
   check(data_tx, x"00000000", "Test 1 data tx init", PRINT_ON_ERROR);

   -- set Configuration register lane_generator
   s_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH));        -- lane parameters register, sets the bit field of the lane start signal to '1'
   s_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(52,C_LG_FRAME_SIZE_WIDTH));     -- lane parameters register, sets the bit field of the auto start signal to '1'
   s_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(1,C_LG_INTER_PKT_DELAY_WIDTH)); -- lane parameters register, sets the bit field of the lane reset signal to '1'
   s_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= C_INCREMENTAL;                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_DATA);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_awaddr  	                                                               <= x"000000" & C_ADDR_LG_CONFIG;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONFIG;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH)),        "Test 1 Frame number reg",    PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(52,C_LG_FRAME_SIZE_WIDTH)),     "Test 1 Frame size reg",      PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(1,C_LG_INTER_PKT_DELAY_WIDTH)), "Test 1 Inter-packet delay",  PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_GEN_DATA_BTFD),                                               C_INCREMENTAL,                                               "Test 1 Generation type reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_DATA),                              "Test 1 Data mode reg",       PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2*hp;
--    ########################################################
--    ###    Test : Initial Value regsiter lane_generator        ###
--    ########################################################
   -- Start generation data
   s_axi_wdata  <= std_logic_vector(to_unsigned(10,s_axi_wdata'length));                         -- Initial value register, sets the bit field of the initial value signal to '1'
   s_axi_awaddr <= x"000000" & C_ADDR_LG_INIT_VAL;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr <= x"000000" & C_ADDR_LG_INIT_VAL;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata, std_logic_vector(to_unsigned(10,s_axi_wdata'length)), "Initial value reg", PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2000*hp;
--    ########################################################
--    ###    Test : Control regsiter lane_generator        ###
--    ########################################################
   -- Start generation data
   s_axi_wdata(C_LG_MODEL_START_BTFD) <= '1';                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_wdata(C_LG_LANE_RESET_BTFD)  <= '1';                                               -- lane control register, sets the bit field of the lane reset signal to '1'
   s_axi_awaddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_MODEL_START_BTFD), '0', "Test 1 Model start reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_LANE_RESET_BTFD),  '1', "Test 1 Lane Reset reg",  PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2000*hp;

--    ########################################################
--    ###    Test2 : PRBS ###
--    ########################################################
   -- verify intials values
   check(data_tx, x"00000000", "Test 2 data tx init", PRINT_ON_ERROR);

   -- set Configuration register lane_generator
   s_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH));        -- lane configuration register, sets the bit field of the lane start signal to '1'
   s_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH));      -- lane configuration register, sets the bit field of the auto start signal to '1'
   s_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)); -- lane configuration register, sets the bit field of the lane reset signal to '1'
   s_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= C_PRBS;                                                      -- lane configuration register, sets the bit field of the parallel loopback signal to '1'
   s_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_DATA);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LG_CONFIG;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONFIG;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH)),        "Test 2 Frame number reg",    PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH)),      "Test 2 Frame size reg",      PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)), "Test 2 Inter-packet delay",  PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_GEN_DATA_BTFD),                                               C_PRBS,                                                      "Test 2 Generation type reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_DATA),                              "Test 2 Data mode reg",       PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2*hp;
--    ########################################################
--    ###    Test : Control regsiter lane_generator        ###
--    ########################################################
   -- Start generation data
   s_axi_wdata(C_LG_MODEL_START_BTFD) <= '1';                                               -- lane control register, sets the bit field of the model start signal to '1'
   s_axi_wdata(C_LG_LANE_RESET_BTFD)  <= '0';                                               -- lane control register, sets the bit field of the lane reset signal to '0'
   s_axi_awaddr  	                    <= x"000000" & C_ADDR_LG_CONTROL;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_MODEL_START_BTFD), '0', "Model start reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_LANE_RESET_BTFD),  '0', "Lane Reset reg",  PRINT_ON_ERROR);
   wait for 100 us;
--    ########################################################
--    ###    Test3 : Control Word ###
--    ########################################################
   -- verify intials values
   check(data_tx, x"00000000", "Test 3 data tx init", PRINT_ON_ERROR);

   -- set Configuration register lane_generator
   s_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH));        -- lane configuration register, sets the bit field of the lane start signal to '1'
   s_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH));      -- lane configuration register, sets the bit field of the auto start signal to '1'
   s_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)); -- lane configuration register, sets the bit field of the lane reset signal to '1'
   s_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= C_PRBS;                                                      -- lane configuration register, sets the bit field of the parallel loopback signal to '1'
   s_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_CONTROL_WORD);                      -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LG_CONFIG;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONFIG;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH)),        "Test 3 Frame number reg",            PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH)),      "Test 3 Frame size reg",              PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)), "Test 3 Inter-packet delay",          PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_GEN_DATA_BTFD),                                               C_PRBS,                                                      "Test 3 Generation type reg",         PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_CONTROL_WORD),                      "Test 3 Data mode= control word reg", PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2*hp;
--    ########################################################
--    ###    Test : Control regsiter lane_generator        ###
--    ########################################################
   -- Start generation data
   s_axi_wdata(C_LG_MODEL_START_BTFD) <= '1';                                               -- lane control register, sets the bit field of the model start signal to '1'
   s_axi_wdata(C_LG_LANE_RESET_BTFD)  <= '0';                                               -- lane control register, sets the bit field of the lane reset signal to '0'
   s_axi_awaddr  	                    <= x"000000" & C_ADDR_LG_CONTROL;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_MODEL_START_BTFD), '0', "Model start reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_LANE_RESET_BTFD),  '0', "Lane Reset reg",  PRINT_ON_ERROR);
   wait for 100 us;
--    ########################################################
--    ###    Test4 : Wrong K-Character                     ###
--    ########################################################

   -- set Configuration register lane_generator
   s_axi_wdata(C_LG_FRAME_NB_MAX_BTFD downto 0)                                  <= std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH));        -- lane configuration register, sets the bit field of the lane start signal to '1'
   s_axi_wdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1)        <= std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH));      -- lane configuration register, sets the bit field of the auto start signal to '1'
   s_axi_wdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1) <= std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)); -- lane configuration register, sets the bit field of the lane reset signal to '1'
   s_axi_wdata(C_LG_GEN_DATA_BTFD)                                               <= C_PRBS;                                                      -- lane configuration register, sets the bit field of the parallel loopback signal to '1'
   s_axi_wdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)             <= std_logic_vector(C_LG_DM_WRONG_K_CARC);                                               -- lane parameters register, sets the bit field of the parallel loopback signal to '1'
   s_axi_awaddr  	                                                             <= x"000000" & C_ADDR_LG_CONFIG;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONFIG;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_FRAME_NB_MAX_BTFD downto 0),                                  std_logic_vector(to_unsigned(5,C_LG_FRAME_NB_WIDTH)),        "Test 4 Frame number reg",                 PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD +1),        std_logic_vector(to_unsigned(5,C_LG_FRAME_SIZE_WIDTH)),      "Test 4 Frame size reg",                   PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD +1), std_logic_vector(to_unsigned(5,C_LG_INTER_PKT_DELAY_WIDTH)), "Test 4 Inter-packet delay",               PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_GEN_DATA_BTFD),                                               C_PRBS,                                                      "Test 4 Generation type reg",              PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1),             std_logic_vector(C_LG_DM_WRONG_K_CARC),                      "Test 4 Data mode= wrong K-character reg", PRINT_ON_ERROR);

   s_axi_wdata    <= (others => '0');
   wait for 2*hp;
--    ########################################################
--    ###    Test : Control regsiter lane_generator        ###
--    ########################################################
   -- Start generation data
   s_axi_wdata(C_LG_MODEL_START_BTFD) <= '1';                                               -- lane control register, sets the bit field of the model start signal to '1'
   s_axi_wdata(C_LG_LANE_RESET_BTFD)  <= '0';                                               -- lane control register, sets the bit field of the lane reset signal to '0'
   s_axi_awaddr  	                    <= x"000000" & C_ADDR_LG_CONTROL;
   write_axi(s_axi_awvalid, s_axi_wvalid, s_axi_bready, clk, s_axi_awready, s_axi_wready, s_axi_bvalid);
   s_axi_araddr  	                  <= x"000000" & C_ADDR_LG_CONTROL;
   wait for 2*hp;

   read_axi(s_axi_arvalid, s_axi_rready, clk, s_axi_arready, s_axi_rvalid);

   check(s_axi_rdata(C_LG_MODEL_START_BTFD), '0', "Model start reg", PRINT_ON_ERROR);
   check(s_axi_rdata(C_LG_LANE_RESET_BTFD),  '0', "Lane Reset reg",  PRINT_ON_ERROR);
   wait for 100 us;
   wait;

end process;


end architecture;
