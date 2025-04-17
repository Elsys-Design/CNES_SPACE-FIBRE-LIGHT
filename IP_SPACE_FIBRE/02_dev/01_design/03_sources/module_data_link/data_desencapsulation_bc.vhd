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

entity data_desencapsulation_bc is
  port (
    CLK                      : in  std_logic;                                    --! Clock signal
    -- Link Reset
    LINK_RESET_DLRE          : in std_logic;
    -- data_mid_buffer_bc (DMBUFBC)interface
    DATA_DMBUFBC             : in  std_logic_vector(C_DATA_K_WIDTH-1 downto 0);  --! Data read bus
    DATA_RD_DDESBC           : out std_logic;                                    --! Read command
    DATA_VALID_DMBUFBC       : in  std_logic;                                    --! Data valid
    -- DIBUFBC interface
    DATA_DDESBC              : out  std_logic_vector(C_DATA_K_WIDTH-1 downto 0); --! Data write broadcast
    DATA_EN_DDESBC           : out  std_logic                                    --! Write command broadcast
  );
end data_desencapsulation_bc;

architecture rtl of data_desencapsulation_bc is
---------------------------------------------------------
-----                  Declaration signals          -----
---------------------------------------------------------
signal broadcast_detected   : std_logic; --high when sbf read

begin
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_desencapsulation_bc
-- Description: desencapsulate each broadcast frame
---------------------------------------------------------
p_desencapsulation_bc : process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      DATA_DDESBC          <= (others => '0');
      DATA_EN_DDESBC       <= '0';
      DATA_RD_DDESBC       <= '0';
      broadcast_detected   <= '0';
    else
      DATA_RD_DDESBC      <= '1';
      if DATA_VALID_DMBUFBC = '1' then
        --                      msb = 35
        if DATA_DMBUFBC(C_DATA_K_WIDTH - 3 downto C_DATA_K_WIDTH - 4) = "01" then --reading a K character
          --                               15 downto 0
          if DATA_DMBUFBC(C_BYTE_WIDTH*2 - 1 downto 0) =  C_SBF_SYMB & C_K28_7_SYMB then --SBF
            broadcast_detected <= '1';
          --                                7 downto 0
          elsif DATA_DMBUFBC(C_BYTE_WIDTH - 1 downto 0) = C_K28_2_SYMB then --EBF
            broadcast_detected <= '0';
            DATA_EN_DDESBC     <= '0';
          end if;
        else --just normal data
          if broadcast_detected = '1' then
              DATA_DDESBC    <= DATA_DMBUFBC(C_DATA_K_WIDTH-1 downto 0);
              DATA_EN_DDESBC <= '1';
          end if;
        end if;
      else --not valid
        DATA_DDESBC    <= (others => '0');
        DATA_EN_DDESBC <= '0';
      end if;
    end if;
  end if;
end process p_desencapsulation_bc;

end architecture rtl;