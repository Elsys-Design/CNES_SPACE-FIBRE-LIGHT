----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2025 10:34:21
-- Design Name: 
-- Module Name: receive_error - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity receive_error is
    Port ( 
        CLK                      : in std_logic;
        RST_N                    : in std_logic; 
  
        -- Input from DWI
        TYPE_FRAME_DWI           : in std_logic_vector(3 downto 0);
        RX_ERR                   : in std_logic;                
        
        -- Input from CRC
        TYPE_FRAME_CRC           : in std_logic_vector(3 downto 0);
        CRC_ERR                  : in std_logic; 
        
        --Input from seq_check
        TYPE_FRAME_SEQ           : in std_logic_vector(3 downto 0);
        END_FRAME                : in std_logic;
        SEQ_ERR                  : in std_logic;
        FAR_END                  : in std_logic;
        
        -- Output to Tx
        ACK_REQUEST              : out std_logic; 
        NACK_REQUEST             : out std_logic; 
        TRANSCEIVE_POLARITY_FLAG : out std_logic; 
        
        -- Input from Tx
        REQ_ACK_DONE             : in std_logic;
        
        -- Output to seq_check 
        RECEIVE_POLARITY_FLAG    : out std_logic
         );
end receive_error;

architecture Behavioral of receive_error is

type state_type is (VALID_POSITIVE, VALID_NEGATIVE, ERROR_POSITIVE, ERROR_NEGATIVE);
signal state : state_type; 

signal s_nack_request      : std_logic; 
signal s_ack_request       : std_logic; 
signal nack_request_fsm    : std_logic;
signal ack_request_fsm     : std_logic;
signal NACK_REQUEST_out    : std_logic;
signal ACK_REQUEST_out     : std_logic;
signal s_far_end           : std_logic; 
signal s_seq_err           : std_logic;

constant C_DATA_FRM  :std_logic_vector(3 downto 0):= "0001"; -- DATA Frame
constant C_BC_FRM    :std_logic_vector(3 downto 0):= "0010"; -- BROADCAST Frame
constant C_FCT_FRM   :std_logic_vector(3 downto 0):= "0100"; -- FCT Frame
constant C_FULL_FRM  :std_logic_vector(3 downto 0):= "0111"; -- FULL Frame
 

begin

NACK_REQUEST <= NACK_REQUEST_out;
ACK_REQUEST  <= ACK_REQUEST_out;

-- FSM pour déterminer les polarity flags (TPF et RPF)
p_fsm : process (CLK, RST_N)
    begin
        if RST_N = '0' then
			state  	 	             <= VALID_POSITIVE;
			RECEIVE_POLARITY_FLAG    <= '0'; 
            TRANSCEIVE_POLARITY_FLAG <= '0';
            nack_request_fsm         <= '0';
	        ack_request_fsm          <= '0';
	        s_far_end                <= '0';
            s_seq_err                <= '0';
	    elsif rising_edge(CLK) then
	        -- Synchronisation pour la FSM
	        s_far_end                <= FAR_END;
            s_seq_err                <= SEQ_ERR; 
            ack_request_fsm          <= s_ack_request;
            nack_request_fsm         <= s_nack_request;
            case state is
                when VALID_POSITIVE => 
                    RECEIVE_POLARITY_FLAG    <= '0'; 
                    TRANSCEIVE_POLARITY_FLAG <= '0'; 
                    if s_nack_request = '1' then     
                        state <= ERROR_NEGATIVE;
                    end if;
                 
                 when VALID_NEGATIVE => 
                    RECEIVE_POLARITY_FLAG    <= '1'; 
                    TRANSCEIVE_POLARITY_FLAG <= '1'; 
                    if s_nack_request = '1' then 
                        state <= ERROR_POSITIVE;
                    end if;
                     
                 when ERROR_POSITIVE =>
                    RECEIVE_POLARITY_FLAG    <= '0'; 
                    TRANSCEIVE_POLARITY_FLAG <= '1'; 
                    if s_ack_request = '1' then 
                        state <= VALID_POSITIVE;                                          
                    elsif s_far_end = '0' and s_seq_err = '1' then 
                        state <= ERROR_NEGATIVE; 
                    end if;
                    
                 when ERROR_NEGATIVE  => 
                    RECEIVE_POLARITY_FLAG     <= '1';   
                    TRANSCEIVE_POLARITY_FLAG  <= '0'; 
                    if s_ack_request = '1' then       
                        state <= VALID_NEGATIVE;
                    elsif s_far_end = '1' and s_seq_err = '1' then  
                       state <= ERROR_POSITIVE;
                    end if;

            end case;
        end if;
    end process p_fsm;


-- Detection des erreurs, gestion des requêtes internes   
p_err : process(CLK, RST_N)
    begin
        if RST_N = '0' then
			s_nack_request    <= '0';
			s_ack_request     <= '0';
	    elsif rising_edge(CLK) then
	       -- Nack demandé pour les trames de broadcast et data si rx_err ou crc_err
	       if RX_ERR = '1' and (TYPE_FRAME_DWI = C_DATA_FRM or TYPE_FRAME_DWI = C_BC_FRM) then 
	           s_nack_request <= '1';
	           s_ack_request  <= '0';
	       elsif CRC_ERR = '1' and (TYPE_FRAME_CRC = C_DATA_FRM or TYPE_FRAME_CRC = C_BC_FRM) then 
	           s_nack_request <= '1';
	           s_ack_request  <= '0';
	       -- Nack demandé pour les trames de broadcast, data, FCT et FULL si seq_err
	       elsif SEQ_ERR = '1' and  (TYPE_FRAME_SEQ = C_DATA_FRM or TYPE_FRAME_SEQ = C_BC_FRM or TYPE_FRAME_SEQ = C_FCT_FRM or TYPE_FRAME_SEQ = C_FULL_FRM) then
	           s_nack_request <= '1';
	           s_ack_request  <= '0';
	       -- Ack demandé pour les trames de broadcast, data, FCT et FULL si fin de trame sans seq_err
	       elsif SEQ_ERR = '0' and end_frame = '1'  and (TYPE_FRAME_SEQ = C_DATA_FRM or TYPE_FRAME_SEQ = C_BC_FRM or TYPE_FRAME_SEQ = C_FCT_FRM or TYPE_FRAME_SEQ = C_FULL_FRM) then 
	           s_ack_request  <= '1';
	           s_nack_request <= '0';
	       else 
	           s_ack_request  <= '0';
	           s_nack_request <= '0';
	       end if;
	    end if;
	end process p_err;
	
-- Gestion des requêtes de sorties : priorité à la plus récente, gestion du done, synchronisation
p_sync : process (CLK, RST_N)
    begin
        if RST_N = '0' then
            ACK_REQUEST_out          <= '0';
            NACK_REQUEST_out         <= '0';
        elsif rising_edge(CLK) then
            if ACK_REQUEST_out = '1' then 
                -- Ack validé mais nouvelle requete de Nack
                if REQ_ACK_DONE = '1' and nack_request_fsm = '1' then
                    ACK_REQUEST_out  <= '0';
                    NACK_REQUEST_out <= '1';
                -- Ack validé mais nouvelle requete de Ack
                elsif REQ_ACK_DONE = '1' and ack_request_fsm = '1' then 
                    ACK_REQUEST_out  <= '1';
                    NACK_REQUEST_out <= '0';
                -- Ack validé 
                elsif REQ_ACK_DONE = '1' then
                    ACK_REQUEST_out  <= '0';
                    NACK_REQUEST_out <= '0';
                -- Priorité de la dernière requête
                elsif nack_request_fsm = '1' then 
                    ACK_REQUEST_out  <= '0';
                    NACK_REQUEST_out <= '1';
                end if;
                
            elsif NACK_REQUEST_out = '1' then 
                -- Nack validé mais nouvelle requete de Nack
                if REQ_ACK_DONE = '1' and nack_request_fsm = '1' then
                    ACK_REQUEST_out  <= '0';
                    NACK_REQUEST_out <= '1';
                -- Nack validé mais nouvelle requete de Ack
                elsif REQ_ACK_DONE = '1' and ack_request_fsm = '1' then 
                    ACK_REQUEST_out  <= '1';
                    NACK_REQUEST_out <= '0';
                -- Ack validé 
                elsif REQ_ACK_DONE = '1' then
                    ACK_REQUEST_out  <= '0';
                    NACK_REQUEST_out <= '0';
                -- Priorité de la dernière requête    
                elsif ack_request_fsm = '1' then 
                    ACK_REQUEST_out  <= '1';
                    NACK_REQUEST_out <= '0';
                end if;
                
            -- Priorité de la dernière requête  
            elsif ack_request_fsm = '1' then 
                ACK_REQUEST_out  <= '1'; 
                NACK_REQUEST_out <= '0';
            elsif nack_request_fsm = '1' then 
                ACK_REQUEST_out  <= '0'; 
                NACK_REQUEST_out <= '1';
            end if;

        end if;
    end process p_sync;
	
end Behavioral;


