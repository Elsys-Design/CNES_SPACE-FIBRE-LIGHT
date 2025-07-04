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
-- TITLE         : lane_generator.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : ELSYS-DESIGN (Yvan DAURIAC)
-- CREATED       : 05/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : Model able to generate data for the lane layer
--------------------------------------------------------------------------
-- HISTORY       : V1.0: Creation of the file
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_model.all;
------------------------------------------------------------------------------------------------------------------
--                                                      ENTITY                                                  --
------------------------------------------------------------------------------------------------------------------
entity LANE_GENERATOR is
    generic(
       G_ADDR_WIDTH : positive := C_AXI_ADDR_WIDTH;                                -- Generic for AXI address width
       G_DATA_WIDTH : positive := C_AXI_DATA_WIDTH                                 -- Generic for AXI data width
    );
    port(
   -- Clock and reset
   ------------------
   CLK                   : in std_logic;                                           -- Clock signal
   RST_N                 : in std_logic;                                           -- Reset active low signal
   -- AXI4 Lite slave interface
   ---------------------------------------
       -- Write Address channel (AW)
   S_AXI_AWADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Write address from master to slave
   S_AXI_AWVALID         : in std_logic;                                           -- Master asserts when write address is valid
   S_AXI_AWREADY         : out std_logic;                                          -- Slave ready to accept write address
       -- Write Data channel (W)
   S_AXI_WDATA           : in std_logic_vector(G_DATA_WIDTH-1 downto 0);           -- Write data from master
   S_AXI_WSTRB           : in std_logic_vector(3 downto 0);                        -- Write strobe, indicates active byte lanes
   S_AXI_WVALID          : in std_logic;                                           -- Master asserts when write data is valid
   S_AXI_WREADY          : out std_logic;                                          -- Slave ready to accept write data
       -- Write Response channel (B)
   S_AXI_BREADY          : in std_logic;                                           -- Master ready to receive write response
   S_AXI_BRESP           : out std_logic_vector(1 downto 0);                       -- Write response from slave (OKAY or ERROR)
   S_AXI_BVALID          : out std_logic;                                          -- Slave asserts when write response is valid
       --Read Address channel (AR)
   S_AXI_ARADDR          : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);           -- Read address from master to slave
   S_AXI_ARVALID         : in std_logic;                                           -- Master asserts when read address is valid
   S_AXI_ARREADY         : out std_logic;                                          -- Slave ready to accept read address
       -- Read channel (R)
   S_AXI_RREADY          : in std_logic;                                           -- Master ready to receive read data
   S_AXI_RDATA           : out std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- Read data from slave to master
   S_AXI_RRESP           : out std_logic_vector(1 downto 0);                       -- Read response (OKAY or ERROR)
   S_AXI_RVALID          : out std_logic;                                          -- Slave asserts when read data is valid
   -- LANE interface
   ---------------------------------------
   DATA_TX               : out std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- Data bus to the lane layer
   NEW_DATA_TX_PPL       : out std_logic;                                          -- Flag to write data in FIFO TX
   FIFO_TX_FULL_PPL      : in  std_logic;                                          -- Flag full of the FIFO TX
   LANE_RESET_DL         : out std_logic;                                          -- Lane Reset to the lane layer
   VALID_K_CHARAC_TX_PPL : out std_logic_vector(C_VALID_K_WIDTH -1 downto 0);      -- K charachter valid in the 32-bit DATA_TX_PPL vector
   CAPABILITY_TX_PPL     : out std_logic_vector(C_LG_LANE_CAPA_WIDTH -1 downto 0)  -- Capability send on TX link in INIT3 control word
   );
end LANE_GENERATOR;
------------------------------------------------------------------------------------------------------------------
--                                                  ARCHITECTURE                                                --
------------------------------------------------------------------------------------------------------------------
architecture rtl of LANE_GENERATOR is
---------------------------------------
-- TYPES
---------------------------------------
   type axi_wr_state_t       is (IDLE_WAIT_WR_ADDR, WR_RESPONSE);                               -- Write states for FSM declaration
   type axi_rd_state_t       is (IDLE_WAIT_RD_ADDR, RD_RESPONSE);                               -- Read states for FSM declaration
   type generation_state_t   is (IDLE, GEN_FRAME, DELAY, END_TEST);                             -- Generation data states for FSM declaration
   type control_word_state_t is (IDLE, GEN_CONTROL_WORD, DELAY, END_TEST);                      -- Control word states for FSM declaration
---------------------------------------
-- SIGNAL DECLARATION
---------------------------------------
   signal axi_wr_state                    : axi_wr_state_t;
   signal axi_rd_state                    : axi_rd_state_t;
   signal generation_state                : generation_state_t;
   signal control_word_state              : control_word_state_t;
   -- Registers
   ------------
   signal reg_lg_config                   : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_generator configuration register
   signal reg_lg_control                  : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_generator control register
   signal reg_lg_status                   : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_generator status register
   signal reg_lg_init_val                 : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- lane_generator intial value register
   signal reg_data_tx_frame               : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Internal register for data_tx_frame
   signal reg_data_tx_cont_word           : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Internal register for data_tx_cont_word
   signal reg_data_tx_k_charact           : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Internal register for data_tx_k_charact
   -- Intermediate signals
   -----------------------
   -- from/to axi registers
   signal frame_number                    : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);           -- Frame number signal
   signal frame_size                      : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- Frame size signal
   signal inter_pkt_delay                 : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- Inter-packet delay signal
   signal gen_data                        : std_logic;                                          -- Type of generation data signal
   signal model_start                     : std_logic;                                          -- Start generation data signal
   signal data_mode                       : unsigned(C_LG_DATA_MODE_WIDTH-1 downto 0);          -- Data mode signal
   signal busy                            : std_logic;                                          -- General busy signal
   signal test_end                        : std_logic;                                          -- General end of the test signal
   signal err_counter                     : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- General error counter bus
   -- P_GENERATOR signals
   signal busy_frame                      : std_logic;                                          -- Busy frame signal
   signal test_end_frame                  : std_logic;                                          -- End of the test frame signal
   signal err_counter_frame               : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter frame bus
   signal data_tx_frame                   : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- P_GENERATOR Data bus to the lane layer
   signal new_data_tx_ppl_frame           : std_logic;                                          -- P_GENERATOR Flag to write data in FIFO TX
   signal init_val                        : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- P_GENERATOR Initial value signal
   signal cnt_frame                       : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);           -- P_GENERATOR Frame counter
   signal cnt_byte                        : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- P_GENERATOR Packet counter
   signal mask                            : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Mask for the last packet of a frame
   signal cnt_delay_frame                 : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- P_GENERATOR Inter-packet delay counter
   signal val_data                        : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- Data value incremental generation
   signal prbs_data                       : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Data value PRBS generation
   -- P_CONTROL_WORD signals
   signal busy_cont_word                  : std_logic;                                          -- Busy control word signal
   signal test_end_cont_word              : std_logic;                                          -- End of the test control word signal
   signal err_counter_cont_word           : unsigned(C_LG_CNT_ERR_MAX_WIDTH-1 downto 0);        -- Error counter control word bus
   signal data_tx_cont_word               : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- P_CONTROL_WORD Data bus to the lane layer
   signal new_data_tx_ppl_cont_word       : std_logic;                                          -- P_CONTROL_WORD flag to write data in FIFO TX
   signal valid_k_charac_tx_ppl_cont_word : std_logic_vector(C_VALID_K_WIDTH-1 downto 0);       -- P_CONTROL_WORD K charachter valid in the 32-bit DATA_TX_PPL vector
   signal cnt_cont_word                   : unsigned(3 downto 0);                               -- Counter of control word
   signal cnt_delay_cont_word             : unsigned(C_LG_INTER_PKT_DELAY_WIDTH-1 downto 0);    -- P_WP_CONTROL_WORDRONG_K inter-packet delay counter
   -- P_WRONG_K signals
   signal busy_k_charact                  : std_logic;                                          -- Busy wrong k-character signal
   signal test_end_k_charact              : std_logic;                                          -- End of the test wrong k-character signal
   signal data_tx_k_charact               : std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- P_WRONG_K Data bus to the lane layer
   signal new_data_tx_ppl_k_charact       : std_logic;                                          -- P_WRONG_K flag to write data in FIFO TX
   signal valid_k_charac_tx_ppl_k_charact : std_logic_vector(C_VALID_K_WIDTH-1 downto 0);       -- K charachter valid in the 32-bit DATA_TX_PPL vector

   begin
---------------------------------------
-- SIGNAL CONNECTION
---------------------------------------
   -- busy assingation in function of the data_mode
   busy <=                  busy_frame     when data_mode = C_LG_DM_DATA else
                            busy_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            '0';
   -- test_end assingation in function of the data_mode
   test_end <=              test_end_frame     when data_mode = C_LG_DM_DATA else
                            test_end_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            '0';
   -- err_counter assingation in function of the data_mode
   err_counter <=           err_counter_frame     when data_mode = C_LG_DM_DATA else
                            err_counter_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            (others => '0');
   -- DATA_TX assingation in function of the data_mode
   DATA_TX <=               data_tx_frame     when data_mode = C_LG_DM_DATA else
                            data_tx_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            data_tx_k_charact when data_mode = C_LG_DM_WRONG_K_CARC else
                            (others => '0');
   -- new_data_tx_ppl_i assingation in function of the data_mode
   NEW_DATA_TX_PPL <=       new_data_tx_ppl_frame     when data_mode = C_LG_DM_DATA else
                            new_data_tx_ppl_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            new_data_tx_ppl_k_charact when data_mode = C_LG_DM_WRONG_K_CARC else
                            '0';
   -- valid_k_charac_tx_ppl_i assingation in function of the data_mode
   VALID_K_CHARAC_TX_PPL <= valid_k_charac_tx_ppl_cont_word when data_mode = C_LG_DM_CONTROL_WORD else
                            (others => '0');
---------------------------------------
-- INSTANCIATION
---------------------------------------
-----------------------------------
-- PROCESS
---------------------------------------
   ------------------------------------------
   -- AXI
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_AXI_READ
   -- Description : AXI4 Lite reading process
   ---------------------------------------------------------------------------
   P_AXI_READ : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         axi_rd_state    <= IDLE_WAIT_RD_ADDR;
         S_AXI_ARREADY   <= '1';               -- Ready for new request
         S_AXI_RRESP     <= "00";              -- OKAY default response
         S_AXI_RDATA     <= (others => '0');   -- Default data at zero
         S_AXI_RVALID    <= '0';               -- Default read validity at zero
      elsif rising_edge(CLK) then
         case axi_rd_state is
            -- Waiting for a read request
            when IDLE_WAIT_RD_ADDR =>
               S_AXI_ARREADY <= '1';     -- Ready for new read request
               if (S_AXI_ARVALID = '1') then
                   S_AXI_ARREADY <= '0'; -- Ready signal deasserted to indicate request processing
                   -- Configuration lane_generator register address
                   if (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONFIG) then
                       S_AXI_RDATA  <= reg_lg_config;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Control lane_generator register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONTROL) then
                       S_AXI_RDATA  <= reg_lg_control;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Status lane_generator register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_STATUS) then
                       S_AXI_RDATA  <= reg_lg_status;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Initial value lane_generator register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_INIT_VAL) then
                     S_AXI_RDATA  <= reg_lg_init_val;
                     S_AXI_RRESP  <= "00";
                     S_AXI_RVALID <= '1';
                     axi_rd_state <= RD_RESPONSE;
                   -- Unrecognized address
                   else
                       S_AXI_RDATA  <= (others => '0');   -- Default response data
                       S_AXI_RRESP  <= "10";              -- Error response (SLVERR)
                       S_AXI_RVALID <= '1';               -- Response valid
                       axi_rd_state <= RD_RESPONSE;       -- Send the error response
                   end if;
               -- No read request received
               else
                   axi_rd_state <= IDLE_WAIT_RD_ADDR;
               end if;
            -- Responding to the read request
            when RD_RESPONSE =>
               -- Waiting for data reception confirmation from the master
               if (S_AXI_RREADY = '1') then
                   S_AXI_RVALID  <= '0';               -- Deassertion of response validity
                   S_AXI_RDATA   <= (others => '0');   -- Data reset
                   S_AXI_RRESP   <= "00";              -- Default OKAY response
                   axi_rd_state  <= IDLE_WAIT_RD_ADDR;
               -- Wait until the master's reception confirmation is received
               else
                   axi_rd_state <= RD_RESPONSE;
               end if;
            -- Unrecognized state, return to IDLE state
            when others =>
               axi_rd_state <= IDLE_WAIT_RD_ADDR;
         end case;
      end if;
   end process P_AXI_READ;
   ---------------------------------------------------------------------------
   -- PROCESS: P_AXI_WRITE
   -- Description : AXI4 Lite writing process
   ---------------------------------------------------------------------------
   P_AXI_WRITE: process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N = '0') then
         axi_wr_state    <= IDLE_WAIT_WR_ADDR;
         S_AXI_AWREADY   <= '1';                   -- Ready for new request
         S_AXI_WREADY    <= '1';                   -- Ready to receive write data
         S_AXI_BRESP     <= "00";                  -- OKAY default response
         S_AXI_BVALID    <= '0';                   -- Default write response validity
         reg_lg_config   <= init_lg_configuration; -- Configuration register initialization
         reg_lg_control  <= init_lg_control;       -- Control register initialization
         reg_lg_init_val <= init_lg_init_val;      -- Initial value initialization
      elsif rising_edge(CLK) then
         if (model_start ='1') then
            reg_lg_control(C_LG_MODEL_START_BTFD)  <= '0';  -- Reset model start bit
         end if;
         case axi_wr_state is
            -- Waiting for a write request
            when IDLE_WAIT_WR_ADDR =>
               S_AXI_AWREADY   <= '1';              -- Ready for new request
               S_AXI_WREADY    <= '1';
               if (S_AXI_AWVALID = '1' and S_AXI_WVALID ='1') then
                  S_AXI_AWREADY   <= '0';           -- Ready signals deasserted to indicate request processing
                  S_AXI_WREADY    <= '0';
                  -- Configuration lane_generator register address
                  if (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONFIG) then
                     reg_lg_config  <= S_AXI_WDATA; -- Write configuration parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Control lane_generator register address
                  elsif (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONTROL) then
                     reg_lg_control <= S_AXI_WDATA; -- Write control parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Initial value lane_generator register address
                  elsif (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_INIT_VAL) then
                     reg_lg_init_val <= S_AXI_WDATA; -- Write control parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Unrecognized address
                  else
                     S_AXI_BRESP  <= "10";          -- Error response (SLVERR)
                     S_AXI_BVALID <= '1';           -- Response valid
                     axi_wr_state <= WR_RESPONSE;
                  end if;
               -- No write request received
               else
                  axi_wr_state <= IDLE_WAIT_WR_ADDR;
               end if;
            -- Responding to the write request
            when WR_RESPONSE =>
               -- Waiting for response reception confirmation from the master
               if (S_AXI_BREADY  = '1') then
                  S_AXI_BVALID <= '0';           -- Reset response validity
                  S_AXI_BRESP  <= "00";          -- Default OKAY response
                  axi_wr_state <= IDLE_WAIT_WR_ADDR;
               -- Wait until the master's reception confirmation is received
               else
                  axi_wr_state <= WR_RESPONSE;
               end if;
            -- Unrecognized state, return to IDLE state
            when others =>
                axi_wr_state <= IDLE_WAIT_WR_ADDR;
         end case;
      end if;
   end process P_AXI_WRITE;
   ------------------------------------------
   -- Register
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_CONFIGURATION
   -- Description : update model configuration signals
   ---------------------------------------------------------------------------
   P_CONFIGURATION : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         frame_number    <= C_DEFAULT_LG_FRAME_NB;        -- Default value of frame number
         frame_size      <= C_DEFAULT_LG_FRAME_SIZE;      -- Default value of frame size
         inter_pkt_delay <= C_DEFAULT_LG_INTER_PKT_DELAY; -- Default value of inter packet delay
         gen_data        <= C_DEFAULT_LG_GEN_DATA;        -- Default value of generation data
         data_mode       <= C_DEFAULT_LG_DATA_MODE;       -- Default value of data mode
      elsif rising_edge(CLK) then
         frame_number    <= unsigned(reg_lg_config(C_LG_FRAME_NB_MAX_BTFD downto 0));                                 -- Frame_number update via its bit field in the register
         frame_size      <= unsigned(reg_lg_config(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD+1));        -- frame_size update via its bit field in the register
         inter_pkt_delay <= unsigned(reg_lg_config(C_LG_INTER_PKT_DELAY_MAX_BTFD downto C_LG_FRAME_SIZE_MAX_BTFD+1)); -- inter_pkt_delay update via its bit field in the register
         gen_data        <= reg_lg_config(C_LG_GEN_DATA_BTFD);
         data_mode       <= unsigned(reg_lg_config(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1)); -- data_mode update via its bit field in the register
         -- gen_data update via its bit field in the register
      end if;
   end process P_CONFIGURATION;

   ---------------------------------------------------------------------------
   -- PROCESS: P_CONTROL
   -- Description : update model control signal
   ---------------------------------------------------------------------------
   P_CONTROL : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         model_start       <= C_DEFAULT_LG_MODEL_START;                   -- Default value of model_start
         LANE_RESET_DL     <= C_DEFAULT_LG_LANE_RESET;                    -- Default value of LANE_RESET_DL
         CAPABILITY_TX_PPL <= std_logic_vector(C_DEFAULT_LG_LANE_CAPA);   -- Default value of CAPABILITY_TX_PPL
      elsif rising_edge(CLK) then
         model_start       <= reg_lg_control(C_LG_MODEL_START_BTFD);                                  -- model_start update via its bit field in the register
         LANE_RESET_DL     <= reg_lg_control(C_LG_LANE_RESET_BTFD);                                    -- LANE_RESET_DL update via its bit field in the register
         CAPABILITY_TX_PPL <= reg_lg_control(C_LG_LANE_CAPA_MAX_BTFD downto C_LG_LANE_RESET_BTFD +1);  -- CAPABILITY_TX_PPL update via its bit field in the register
      end if;
   end process P_CONTROL;

   ---------------------------------------------------------------------------
   -- PROCESS: P_STATUS
   -- Description : update status register
   ---------------------------------------------------------------------------
   P_STATUS : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         reg_lg_status                     <= (others => '0');
      elsif rising_edge(CLK) then
         reg_lg_status(C_LG_BUSY_BTFD)     <= busy;            -- bit field update in register via signal busy_k
         reg_lg_status(C_LG_TEST_END_BTFD) <= test_end;        -- bit field update in register via signal test_end
      end if;
   end process P_STATUS;

   ---------------------------------------------------------------------------
   -- PROCESS: P_INIT_VAL
   -- Description : update model initial value signal
   ---------------------------------------------------------------------------
   P_INIT_VAL : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         init_val   <= C_DEFAULT_LG_INIT_VAL;     -- Default value of init_val
      elsif rising_edge(CLK) then
         init_val   <= unsigned(reg_lg_init_val);
      end if;
   end process P_INIT_VAL;

   ------------------------------------------
   -- Treatment
   ------------------------------------------
   ---------------------------------------------------------------------------
   -- PROCESS: P_GENERATOR
   -- Description : generate data
   ---------------------------------------------------------------------------
   P_GENERATOR : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         generation_state            <= IDLE;
         reg_data_tx_frame           <= (others=>'0');
         data_tx_frame               <= (others=>'0');
         new_data_tx_ppl_frame       <= '0';
         cnt_delay_frame             <= (others=>'0');
         cnt_byte                    <= (others=>'0');
         cnt_frame                   <= (others=>'0');
         mask                        <= (others=>'0');
         val_data                    <= (others=>'0');
         busy_frame                  <= '0';
         test_end_frame              <= '0';
         prbs_data                   <= (others=>'1');
         err_counter_frame           <= (others=>'0');
      elsif rising_edge(CLK) then
         if (FIFO_TX_FULL_PPL ='0' and busy_frame ='1') then
            err_counter_frame <= err_counter_frame+1;
         end if;
         case generation_state is
            -- Waiting for a start request
            when IDLE =>

               -- reset signals between the tests
               data_tx_frame         <= (others=>'0');
               val_data              <= init_val;
               prbs_data             <= std_logic_vector(init_val);
               reg_data_tx_frame     <= (others=>'0');
               new_data_tx_ppl_frame <= '0';
               if (model_start = '1' and data_mode=C_LG_DM_DATA) then
                  busy_frame        <= '1';                  -- model busy_frame
                  test_end_frame    <= '0';                  -- reset for a new test
                  cnt_byte          <= unsigned(frame_size); -- number of bytes = frame size
                  err_counter_frame <= (others=>'0');
                  generation_state  <= GEN_FRAME;
               end if;

            when GEN_FRAME =>
               -- select data tx in function of the number of bytes remaining in the frame
               if (cnt_byte = unsigned(frame_size)) then -- first packet of the frame
                  reg_data_tx_frame <= std_logic_vector(resize(cnt_frame +1,reg_data_tx_frame'length));  -- ID of the frame
               elsif (gen_data = C_INCREMENTAL) then  -- incremental data
                  if (cnt_byte < C_PACKET_WIDTH) then-- last packet of the frame
                     reg_data_tx_frame <= std_logic_vector(val_data) and mask; -- fill the register tx with usefull data and complete with zeros
                  else -- classic packet
                     reg_data_tx_frame <= std_logic_vector(val_data);-- push PRBS data in the register tx
                  end if;
                  val_data  <= val_data + C_INCR_VAL_DATA;
               else -- PRBS data
                  if (cnt_byte < C_PACKET_WIDTH) then -- last packet of the frame
                     reg_data_tx_frame <= prbs_data and mask; -- fill the register tx with usefull data and complete with zeros
                  else -- classic packet
                     reg_data_tx_frame <= prbs_data; -- push PRBS data in the register tx
                  end if;
                  prbs_data <= prbs_data(C_INTERNAL_BUS_WIDTH-2 downto 0) & (prbs_data(C_INTERNAL_BUS_WIDTH-1) xor prbs_data(C_INTERNAL_BUS_WIDTH-2) xor prbs_data(C_INTERNAL_BUS_WIDTH-4) xor prbs_data(C_INTERNAL_BUS_WIDTH-5)); -- prbs data generation
               end if;
               -- Packet management
               if (cnt_byte <= C_PACKET_WIDTH)then  -- last packet of the frame
                  cnt_byte  <= unsigned(frame_size);  -- reset the counter of byte for the nexte frame
                  cnt_frame <= cnt_frame+1;
               elsif (cnt_byte-C_PACKET_WIDTH <= C_PACKET_WIDTH)then -- penultimate packet of the frame
                  -- determine the number of usefull byte for the last packet
                  for i in 0 to C_INTERNAL_BUS_WIDTH-1 loop
                     if (i >= resize((cnt_byte - to_unsigned(C_PACKET_WIDTH,cnt_byte'length))*to_unsigned(C_PACKET_WIDTH,cnt_byte'length),cnt_byte'length)) then
                        mask(i) <= '0';
                     else
                        mask(i) <= '1';
                     end if;
                  end loop;
                  cnt_byte      <= cnt_byte-C_PACKET_WIDTH;
               else
                  cnt_byte      <= cnt_byte-C_PACKET_WIDTH;
               end if;
               -- Frame management
               if ((cnt_frame +1 = unsigned(frame_number)) and (cnt_byte <= C_PACKET_WIDTH)) then -- last packet and last frame
                  cnt_frame        <= (others=>'0');
                  generation_state <= END_TEST;
               elsif(unsigned(inter_pkt_delay) > to_unsigned(0,inter_pkt_delay'length)) then -- delay requested
                  generation_state <= DELAY;
               else -- no delay requested, next state is data generation
                  generation_state <= GEN_FRAME;
               end if;
               -- Output assignation
               if ((cnt_frame/= 0) or cnt_byte/= unsigned(frame_size)) then -- not the first packet of the first frame
                 new_data_tx_ppl_frame <= '1';               -- enable write in fifo tx
               end if;
               data_tx_frame         <= reg_data_tx_frame; -- push to the output TX

            when DELAY =>
               new_data_tx_ppl_frame  <= '0';
               --data_tx_frame <= reg_data_tx_frame; -- push to the output TX
               --Delay counter
               if (cnt_delay_frame = unsigned(inter_pkt_delay)-1)then  -- inter packets delay reached
                  cnt_delay_frame  <= (others=>'0');
                  generation_state <= GEN_FRAME;
               else -- inter packets delay not reached
                  cnt_delay_frame <= cnt_delay_frame + 1;
               end if;

            when END_TEST =>
               if(unsigned(inter_pkt_delay) > 0) then -- delay requested
                  new_data_tx_ppl_frame  <= '0';
                  --data_tx_frame <= reg_data_tx_frame; -- push to the output TX
                  --Delay counter
                  if (cnt_delay_frame = unsigned(inter_pkt_delay))then  -- inter packets delay reached
                     cnt_delay_frame  <= (others=>'0');
                     new_data_tx_ppl_frame <= '1'; -- enable write in fifo tx
                     data_tx_frame         <= reg_data_tx_frame; -- push to the output TX
                     test_end_frame        <= '1';  -- test finished
                     busy_frame            <= '0';
                     generation_state      <= IDLE;
                  else -- inter packets delay not reached
                     cnt_delay_frame <= cnt_delay_frame + 1;
                  end if;
               else
                  new_data_tx_ppl_frame <= '1'; -- enable write in fifo tx
                  data_tx_frame         <= reg_data_tx_frame; -- push to the output TX
                  test_end_frame        <= '1';  -- test finished
                  busy_frame            <= '0';
                  generation_state      <= IDLE;
               end if;

            when others =>
               generation_state <= IDLE;
         end case;
      end if;
   end process P_GENERATOR;
   ---------------------------------------------------------------------------
   -- PROCESS: P_CONTROL_WORD
   -- Description : Generate all the data link control word
   ---------------------------------------------------------------------------
   P_CONTROL_WORD : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         control_word_state              <= IDLE;
         cnt_delay_cont_word             <= (others=>'0');
         cnt_cont_word                   <= (others=>'0');
         reg_data_tx_cont_word           <= (others=>'0');
         data_tx_cont_word               <= (others=>'0');
         new_data_tx_ppl_cont_word       <= '0';
         busy_cont_word                  <= '0';
         test_end_cont_word              <= '0';
         err_counter_cont_word           <= (others=>'0');
         valid_k_charac_tx_ppl_cont_word <= (others=>'0');
      elsif rising_edge(CLK) then
         if (FIFO_TX_FULL_PPL ='0' and busy_cont_word ='1') then
            err_counter_cont_word <= err_counter_cont_word+1;
         end if;
         case control_word_state is
            -- Waiting for a start request
            when IDLE =>
               -- reset signals between the tests
               data_tx_cont_word     <= (others=>'0');
               reg_data_tx_cont_word <= (others=>'0');
               new_data_tx_ppl_cont_word <= '0';
               if (model_start = '1' and data_mode=C_LG_DM_CONTROL_WORD) then
                  cnt_cont_word         <= (others=>'0');
                  busy_cont_word        <= '1';                  -- model busy_frame
                  test_end_cont_word    <= '0';                  -- reset for a new test
                  err_counter_cont_word <= (others=>'0');
                  reg_data_tx_cont_word <= "00000000000000000101000011111100"; -- SDF: D0.0, D0.0, D16.2, K28.7
                  control_word_state    <= GEN_CONTROL_WORD;
               end if;

            when GEN_CONTROL_WORD =>
               if (cnt_cont_word = 0)then
                  reg_data_tx_cont_word <= "00000000000000000000000000011100"; -- EDF: D0.0, D0.0, D0.0, K28.0
               elsif (cnt_cont_word = 1)then
                  reg_data_tx_cont_word <= "00000000000000000101110111111100"; -- SBF: D0.0, D0.0, D29.2, K28.7
               elsif (cnt_cont_word = 2)then
                  reg_data_tx_cont_word <= "00000000000000000000000001011100"; -- EBF: D0.0, D0.0, D0.0, K28.2
               elsif (cnt_cont_word = 3)then
                  reg_data_tx_cont_word <= "00000000000000000100010011111100"; -- SIF: D0.0, D0.0, D4.2, K28.7
               end if;
               if (cnt_cont_word > 3)then
                  control_word_state <= END_TEST;
               elsif(unsigned(inter_pkt_delay) > to_unsigned(0,inter_pkt_delay'length)) then -- delay requested
                  control_word_state <= DELAY;
               end if;
               cnt_cont_word                    <= cnt_cont_word+1;
                -- Output assignation
                data_tx_cont_word               <= reg_data_tx_cont_word; -- push to the output TX
                new_data_tx_ppl_cont_word       <= '1'; -- enable write in fifo tx
                valid_k_charac_tx_ppl_cont_word <= "0001"; -- valid K-character on the first byte

            when DELAY =>
               new_data_tx_ppl_cont_word <= '0';
               --data_tx_cont_word <= reg_data_tx_cont_word; -- push to the output TX
               --Delay counter
               if (cnt_delay_cont_word = unsigned(inter_pkt_delay)-1)then  -- inter packets delay reached
                  cnt_delay_cont_word <= (others=>'0');
                  control_word_state  <= GEN_CONTROL_WORD;
               else -- inter packets delay not reached
                  cnt_delay_cont_word <= cnt_delay_cont_word + 1;
               end if;

            when END_TEST =>
               new_data_tx_ppl_cont_word       <= '0';   -- enable write in fifo tx
               valid_k_charac_tx_ppl_cont_word <= (others=>'0');
               test_end_cont_word              <= '1';  -- test finished
               busy_cont_word                  <= '0';
               data_tx_cont_word               <= (others=>'0');
               control_word_state              <= IDLE;
            when others =>
               control_word_state <= IDLE;
         end case;
      end if;
   end process P_CONTROL_WORD;
   ---------------------------------------------------------------------------
   -- PROCESS: P_WRONG_K
   -- Description : Generate wrong K-character
   ---------------------------------------------------------------------------
   P_WRONG_K : process(CLK, RST_N)
   begin
      -- Reset
      if (RST_N ='0') then
         reg_data_tx_k_charact           <= (others=>'0');
         data_tx_k_charact               <= (others=>'0');
         new_data_tx_ppl_k_charact       <= '0';
         valid_k_charac_tx_ppl_k_charact <= (others=>'0');
      elsif rising_edge(CLK) then
         -- reset signals between the tests
         data_tx_k_charact     <= (others=>'0');
         new_data_tx_ppl_k_charact           <= '0';
         reg_data_tx_k_charact <= "00000000000000000000000000000000"; --  D0.0 D0.0 D0.0 K0.0
         if (model_start = '1' and data_mode=C_LG_DM_CONTROL_WORD) then
            -- Output assignation
            data_tx_k_charact               <= reg_data_tx_k_charact; -- push to the output TX
            new_data_tx_ppl_k_charact       <= '1'; -- enable write in fifo tx
            valid_k_charac_tx_ppl_k_charact <= "0001"; -- valid K-character on the first byte
         end if;
      end if;
   end process P_WRONG_K;
end rtl;
