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

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_desencapsulation is
  generic (
    G_VC_NUM               : integer := 8                                     --! Number of virtual channels
  );
  port (
    RST_N                  : in  std_logic;                                   --! Active low reset
    CLK                    : in  std_logic;                                   --! Clock signal
    -- data_mid_buffer (DMBUF)interface
    DATA_DMBUF             : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0); --! Data read bus
    DATA_RD_DDES           : out std_logic;                                   --! Read command
    DATA_VALID_DMBUF       : in  std_logic;                                   --! Data valid
    -- DIBUF interface
    DATA_DDES              : out  vc_data_k_array(G_VC_NUM-1 downto 0);       --! Data write vc & broadcast
    DATA_EN_DDES           : out  std_logic_vector(G_VC_NUM-1 downto 0)       --! Write command vc & broadcast
  );
end data_desencapsulation;

architecture rtl of data_desencapsulation is
---------------------------------------------------------
-----                  Declaration signals          -----
---------------------------------------------------------
signal data_detected        : std_logic; --high when sdf read
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
    DATA_DDES          <= (others =>(others => '0'));
    DATA_EN_DDES       <= (others => '0');
    DATA_RD_DDES       <= '0';
    data_detected      <= '0';
    vc_nb              <= (others => '0');
  elsif rising_edge(CLK) then
    DATA_RD_DDES      <= '1';
    if DATA_VALID_DMBUF = '1' then
      --                      msb = 35
      if DATA_DMBUF(C_DATA_K_WIDTH - 3 downto C_DATA_K_WIDTH - 4) = "01" then --reading a K character
        --                              15 downto 0
        if DATA_DMBUF(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SDF_SYMB & C_K28_7_SYMB  then -- SDF
          data_detected <= '1';
          vc_nb         <= unsigned(DATA_DMBUF(C_BYTE_WIDTH*3 -1 downto C_BYTE_WIDTH*2));
        elsif DATA_DMBUF(C_BYTE_WIDTH - 1 downto 0) = C_K28_0_SYMB then --EDF
          data_detected <= '0';
          DATA_EN_DDES  <= (others => '0');
        end if;
      elsif data_detected = '1' then
        DATA_DDES(to_integer(vc_nb))    <= DATA_DMBUF(C_DATA_K_WIDTH-1 downto 0);
        DATA_EN_DDES(to_integer(vc_nb)) <= '1';
      end if;
    else --not valid
      DATA_DDES        <= (others =>(others => '0'));
      DATA_EN_DDES     <= (others => '0');
    end if;
  end if;
end process p_desencapsulation;

end architecture rtl;