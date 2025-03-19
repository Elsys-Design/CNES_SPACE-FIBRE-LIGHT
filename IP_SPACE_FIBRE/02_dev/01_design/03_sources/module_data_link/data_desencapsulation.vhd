----------------------------------------------------------------------------
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 12/03/2025
--
-- Description : This module permits to desencapsulate the frame
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library work;
use work.data_link_lib.all;

entity data_desencapsulation is
  generic (
    G_VC_NUM       : integer := 8                                        --! Number of virtual channels
  );
  port (
    RST_N                  : in  std_logic;                              --! Active low reset
    CLK                    : in  std_logic;                              --! Clock signal
    -- data_mid_buffer (DMBUF)interface
    DATA_DMBUF             : in  std_logic_vector(36-1 downto 0);        --! Data read bus
    DATA_RD_DDES           : out std_logic;                              --! Read command
    DATA_VALID_DMBUF       : in  std_logic;                              --! Data valid
    -- DOBUF interface
    FCT_FAR_END_DDES       : out  std_logic_vector(G_VC_NUM-1 downto 0); --! Data write bus
    M_VAL_DDES             : out  vc_mult_array(G_VC_NUM-1 downto 0);    --! Multiplier values for each virtual channel
    -- DIBUF interface
    DATA_DDES              : out  vc_data_k_array(G_VC_NUM downto 0);    --! Data write vc & broadcast
    DATA_EN_DDES           : out  std_logic_vector(G_VC_NUM downto 0)    --! Write command vc & broadcast
  );
end data_desencapsulation;

architecture rtl of data_desencapsulation is
---------------------------------------------------------
-----                  Declaration signals          -----
---------------------------------------------------------
signal data_detected        : std_logic; --high when sdf read
signal broadcast_detected   : std_logic; --high when sbf read
signal vc_nb                : unsigned(7 downto 0);    

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_desencapsulation
-- Description: desencapsulate each frame 
---------------------------------------------------------
p_desencapsulation : process(CLK, RST_N)     
begin
  if RST_N = '0' then
    FCT_FAR_END_DDES   <= (others => '0'); 
    DATA_DDES          <= (others =>(others => '0'));
    M_VAL_DDES         <= (others =>(others => '0'));
    DATA_EN_DDES       <= (others => '0');
    DATA_RD_DDES       <= '0';
    data_detected      <= '0';
    broadcast_detected <= '0';
    vc_nb              <= (others => '0');
  elsif rising_edge(CLK) then
    DATA_RD_DDES      <= '1';
    if DATA_VALID_DMBUF = '1' then
      --                      msb = 35
      if DATA_DMBUF(C_DATA_K_WIDTH - 3 downto C_DATA_K_WIDTH - 4) = "01" then --reading a K character
        --                              15 downto 0
        if DATA_DMBUF(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SDF_SYMB & C_K28_7_SYMB  then -- SDF
          data_detected                                 <= '1';
          vc_nb                                         <= unsigned(DATA_DMBUF(C_BYTE_WIDTH*3 -1 downto C_BYTE_WIDTH*2));
        --                                 15 downto 0
        elsif DATA_DMBUF(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SBF_SYMB & C_K28_7_SYMB then --SBF
          broadcast_detected                            <= '1';
        --                                 7 downto 0
        elsif DATA_DMBUF(C_BYTE_WIDTH - 1 downto 0) = C_K28_3_SYMB then --FCT
          --                                                       12 downto 8                                                          23 downto 21
          M_VAL_DDES(to_integer(unsigned(DATA_DMBUF(C_BYTE_WIDTH +4 downto C_BYTE_WIDTH)))) <= std_logic_vector(to_unsigned(to_integer(unsigned(DATA_DMBUF(C_BYTE_WIDTH*2 -1 downto C_BYTE_WIDTH*2 - 3)))+1,4));
          FCT_FAR_END_DDES (to_integer(unsigned(DATA_DMBUF(C_BYTE_WIDTH*2 +4 downto C_BYTE_WIDTH*2)))) <= '1';
        elsif DATA_DMBUF(C_BYTE_WIDTH - 1 downto 0) = C_K28_0_SYMB then --EDF
          data_detected                                 <= '0';
          DATA_EN_DDES                               <= (others => '0');
        elsif DATA_DMBUF(C_BYTE_WIDTH - 1 downto 0) = C_K28_2_SYMB then --EBF
          broadcast_detected                            <= '0';
          DATA_EN_DDES                               <= (others => '0');
        end if;
      else --just normal data
        if data_detected = '1' or broadcast_detected = '1' then 
          if broadcast_detected = '1' then
            DATA_DDES   (G_VC_NUM) <= DATA_DMBUF(C_DATA_K_WIDTH-1 downto 0);
            DATA_EN_DDES(G_VC_NUM) <= '1';
          else
            DATA_DDES(to_integer(vc_nb))    <= DATA_DMBUF(C_DATA_K_WIDTH-1 downto 0);
            DATA_EN_DDES(to_integer(vc_nb)) <= '1';
          end if;
        end if;
      end if;
    else --not valid 
      FCT_FAR_END_DDES <= (others => '0'); 
      DATA_DDES        <= (others =>(others => '0'));
      M_VAL_DDES       <= (others =>(others => '0'));
      DATA_EN_DDES     <= (others => '0');
    end if;
  end if;
end process;

end architecture rtl;