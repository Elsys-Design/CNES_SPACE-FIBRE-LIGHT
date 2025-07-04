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
-- TITLE         : data_link_generator.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : ELSYS-DESIGN (Thomas FAVRE-FELIX)
-- CREATED       : 04/03/2024
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
entity DATA_LINK_GENERATOR is
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
   -- DATA LINK interface
   ---------------------------------------
   TDATA                 : out std_logic_vector(C_INTERNAL_BUS_WIDTH -1 downto 0); -- Data bus to the lane layer
   TVALID                : out std_logic;                                          -- Flag to write data in FIFO TX
   TREADY                : in  std_logic;                                          -- Flag full of the FIFO TX
   TLAST                 : out std_logic;                                          -- Lane Reset to the lane layer
   TUSER                 : out std_logic_vector(C_VALID_K_WIDTH -1 downto 0)       -- K charachter valid in the 32-bit DATA_TX_PPL vector
   );
end DATA_LINK_GENERATOR;
------------------------------------------------------------------------------------------------------------------
--                                                  ARCHITECTURE                                                --
------------------------------------------------------------------------------------------------------------------
architecture rtl of DATA_LINK_GENERATOR is
---------------------------------------
-- TYPES
---------------------------------------
   type axi_wr_state_t       is (IDLE_WAIT_WR_ADDR, WR_RESPONSE);                               -- Write states for FSM declaration
   type axi_rd_state_t       is (IDLE_WAIT_RD_ADDR, RD_RESPONSE);                               -- Read states for FSM declaration
   type generation_state_t   is (IDLE, GEN_FRAME, WAIT_TX, END_TEST);                             -- Generation data states for FSM declaration
---------------------------------------
-- SIGNAL DECLARATION
---------------------------------------
   signal axi_wr_state                    : axi_wr_state_t;
   signal axi_rd_state                    : axi_rd_state_t;
   signal generation_state                : generation_state_t;
   -- Registers
   ------------
   signal reg_lg_config                   : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- data_link_generator configuration register
   signal reg_lg_control                  : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- data_link_generator control register
   signal reg_lg_status                   : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- data_link_generator status register
   signal reg_lg_init_val                 : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- data_link_generator intial value register
   signal reg_data_tx_frame               : std_logic_vector(G_DATA_WIDTH-1 downto 0);          -- data_link_generator generated data register
   -- Intermediate signals
   -----------------------
   -- from/to axi registers
   signal packet_number                   : unsigned(C_LG_FRAME_NB_WIDTH-1 downto 0);           -- Frame number signal
   signal packet_size                     : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- Frame size signal
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
   signal init_val                        : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- P_GENERATOR Initial value signal
   signal cnt_byte                        : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- P_GENERATOR Packet counter
   signal cnt_packet                      : unsigned(C_LG_FRAME_SIZE_WIDTH-1 downto 0);         -- P_GENERATOR Packet counter
   signal val_data                        : unsigned(C_INTERNAL_BUS_WIDTH-1 downto 0);          -- Data value incremental generation
   signal prbs_data                       : std_logic_vector(C_INTERNAL_BUS_WIDTH-1 downto 0);  -- Data value PRBS generation

   begin
---------------------------------------
-- SIGNAL CONNECTION
---------------------------------------
   -- busy assingation in function of the data_mode
   busy <=                  busy_frame;
   -- test_end assingation in function of the data_mode
   test_end <=              test_end_frame ;
   -- err_counter assingation in function of the data_mode
   err_counter <=           err_counter_frame;

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
                   -- Configuration data_link_generator register address
                   if (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONFIG) then
                       S_AXI_RDATA  <= reg_lg_config;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Control data_link_generator register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONTROL) then
                       S_AXI_RDATA  <= reg_lg_control;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Status data_link_generator register address
                   elsif (S_AXI_ARADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_STATUS) then
                       S_AXI_RDATA  <= reg_lg_status;
                       S_AXI_RRESP  <= "00";
                       S_AXI_RVALID <= '1';
                       axi_rd_state <= RD_RESPONSE;
                   -- Initial value data_link_generator register address
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
                  -- Configuration data_link_generator register address
                  if (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONFIG) then
                     reg_lg_config  <= S_AXI_WDATA; -- Write configuration parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Control data_link_generator register address
                  elsif (S_AXI_AWADDR(C_SLAVE_ADDR_WIDTH-1 downto 0) = C_ADDR_LG_CONTROL) then
                     reg_lg_control <= S_AXI_WDATA; -- Write control parameters
                     S_AXI_BRESP    <= "00";        -- OKAY response
                     S_AXI_BVALID   <= '1';         -- Valid response
                     axi_wr_state   <= WR_RESPONSE;
                  -- Initial value data_link_generator register address
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
         packet_number    <= C_DEFAULT_LG_FRAME_NB;        -- Default value of packet number
         packet_size      <= C_DEFAULT_LG_FRAME_SIZE;      -- Default value of packet size
         gen_data        <= C_DEFAULT_LG_GEN_DATA;        -- Default value of generation data
         data_mode       <= C_DEFAULT_LG_DATA_MODE;       -- Default value of data mode
      elsif rising_edge(CLK) then
         packet_number    <= unsigned(reg_lg_config(C_LG_FRAME_NB_MAX_BTFD downto 0));                                 -- packet_number update via its bit field in the register
         packet_size      <= unsigned(reg_lg_config(C_LG_FRAME_SIZE_MAX_BTFD downto C_LG_FRAME_NB_MAX_BTFD+1));        -- packet_size update via its bit field in the register
         gen_data        <= reg_lg_config(C_LG_GEN_DATA_BTFD);
         data_mode       <= unsigned(reg_lg_config(C_LG_DATA_MODE_MAX_BTFD downto C_LG_GEN_DATA_BTFD +1));             -- data_mode update via its bit field in the register
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
      elsif rising_edge(CLK) then
         model_start       <= reg_lg_control(C_LG_MODEL_START_BTFD);      -- model_start update via its bit field in the register
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
         TDATA                       <= (others=>'0');
         TVALID                      <= '0';
         TLAST                       <= '0';
         cnt_byte                    <= (others=>'0');
         cnt_packet                  <= (others=>'0');
         val_data                    <= (others=>'0');
         busy_frame                  <= '0';
         test_end_frame              <= '0';
         prbs_data                   <= (others=>'1');
         err_counter_frame           <= (others=>'0');
      elsif rising_edge(CLK) then
         case generation_state is
            -- Waiting for a start request
            when IDLE =>

               -- reset signals between the tests
               TDATA                 <= std_logic_vector(init_val);
               val_data              <= init_val;
               prbs_data             <= std_logic_vector(init_val);
               reg_data_tx_frame     <= (others=>'0');
               TVALID                <= '0';
               TLAST                 <= '0';
               if (model_start = '1') then
                  busy_frame        <= '1';                   -- model busy_frame
                  test_end_frame    <= '0';                   -- reset for a new test
                  cnt_byte          <= unsigned(packet_size); -- number of bytes = packet size
                  err_counter_frame <= (others=>'0');         -- reset for a new test
                  cnt_packet        <= (others=>'0');         -- reset for a new test
                  if (gen_data = C_INCREMENTAL) then                     -- incremental data
                     val_data  <= val_data + C_INCR_VAL_DATA;
                     reg_data_tx_frame <= std_logic_vector(val_data);    -- push data in the register tx
                     
                  else                                                   -- PRBS data
                     prbs_data <= prbs_data(C_INTERNAL_BUS_WIDTH-2 downto 0) & (prbs_data(C_INTERNAL_BUS_WIDTH-1) xor prbs_data(C_INTERNAL_BUS_WIDTH-2) xor prbs_data(C_INTERNAL_BUS_WIDTH-4) xor prbs_data(C_INTERNAL_BUS_WIDTH-5)); -- prbs data generation
                     reg_data_tx_frame <= prbs_data;                     -- push PRBS data in the register tx
                     
                  end if;
                  generation_state  <= GEN_FRAME;
               end if;

            when GEN_FRAME =>
               --if previous data sent
               if (TREADY = '1') then
                  if (gen_data = C_INCREMENTAL) then  -- incremental data
                     val_data  <= val_data + C_INCR_VAL_DATA;
                     reg_data_tx_frame <= std_logic_vector(val_data);-- push data in the register tx
                     
                  else -- PRBS data
                     prbs_data <= prbs_data(C_INTERNAL_BUS_WIDTH-2 downto 0) & (prbs_data(C_INTERNAL_BUS_WIDTH-1) xor prbs_data(C_INTERNAL_BUS_WIDTH-2) xor prbs_data(C_INTERNAL_BUS_WIDTH-4) xor prbs_data(C_INTERNAL_BUS_WIDTH-5)); -- prbs data generation
                     reg_data_tx_frame <= prbs_data; -- push PRBS data in the register tx
                     
                  end if;
                  
                  -- word management with EOP and FILL
                  if packet_size = 2 then
                     if (cnt_packet = packet_number-1) then
                        TDATA <= C_FILL & C_FILL & C_EOP & reg_data_tx_frame(7 downto 0);
                        TUSER <= "1110";
                     else
                        TDATA <= C_EOP & reg_data_tx_frame(23 downto 16) & C_EOP & reg_data_tx_frame(7 downto 0);
                        TUSER <= "1010";
                     end if;
                  elsif (packet_size = 3 and cnt_byte = 1) then
                     if (cnt_packet = packet_number-1) then
                        TDATA <= C_FILL & C_FILL & C_FILL & C_EOP;
                        TUSER <= "1111";
                     else
                        TDATA <= C_EOP & reg_data_tx_frame(23 downto 8) & C_EOP;
                        TUSER <= "1001";
                     end if;
                  else
                     EOP_word_management : for j in 0 to 3 loop
                        if (j = cnt_byte - 1) then  --EOP needed
                           TDATA((8*(j+1) -1) downto 8*j) <= C_EOP;
                           TUSER (j) <= '1';
                        elsif (j > cnt_byte - 1 and cnt_packet = packet_number-1) then  -- FILL needed
                           TDATA((8*(j+1) -1) downto 8*j) <= C_FILL;
                           TUSER (j) <= '1';
                        else  --Normal data
                           TDATA((8*(j+1) -1) downto 8*j) <= reg_data_tx_frame((8*(j+1) -1) downto 8*j);
                           TUSER (j) <= '0';
                        end if;
                     end loop;
                  end if;

                  -- cnt_packet management to monitor current size of the packet sent
                  if (packet_size = 2) then
                     if (cnt_packet = packet_number-1) then
                        cnt_packet <= cnt_packet + 1;
                     else
                        cnt_packet <= cnt_packet + 2;
                     end if;
                     TLAST <= '1';
                  elsif (packet_size = 3 and cnt_byte = 1) then
                     cnt_byte  <= unsigned(packet_size);  -- reset the counter of byte for the nexte frame
                     if (cnt_packet = packet_number-1) then
                        cnt_packet <= cnt_packet + 1;
                     else
                        cnt_packet <= cnt_packet + 2;
                     end if;
                     TLAST <= '1';
                  elsif (cnt_byte <= 4) then  -- last packet of the frame
                     cnt_byte  <= unsigned(packet_size) + cnt_byte -4;  -- reset the counter of byte for the nexte frame
                     cnt_packet <= cnt_packet+1;
                     TLAST <= '1';
                  else
                     cnt_byte      <= cnt_byte-4;
                     TLAST <= '0';
                  end if;
                  
               end if;

               -- state transition
               if (TREADY = '1' and cnt_packet >= packet_number) then
                  TVALID <= '0';
                  generation_state <= END_TEST;
               elsif (TREADY = '1' and cnt_packet < packet_number) then
                  TVALID <= '1';
                  generation_state <= GEN_FRAME;
               else
                  generation_state <= WAIT_TX;
                  TVALID <= '1';
               end if;

            when WAIT_TX =>
               if (TREADY = '1' and cnt_packet >= packet_number) then
                  generation_state <= END_TEST;
                  TVALID <= '0';
               elsif (TREADY = '1' ) then
                  generation_state <= GEN_FRAME;
               else
                  generation_state <= WAIT_TX;
               end if;
               
            when END_TEST =>
               TVALID                <= '0';
               TLAST                 <= '0';
               test_end_frame        <= '1';  -- test finished
               busy_frame            <= '0';
               generation_state      <= IDLE;

            when others =>
               generation_state <= IDLE;
         end case;
      end if;
   end process P_GENERATOR;
end rtl;
