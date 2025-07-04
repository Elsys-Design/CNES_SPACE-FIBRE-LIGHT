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
-- TITLE         : resync_double.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : ELSYS Design (Yvan DAURIAC)
-- CREATED       : 02/12/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : Model able to resynchronize a signal or a vector of signals
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;

entity resync_double is
  generic (
    VECTOR_SIZE : natural := 16
  );
  port (
    -- system signals
    clk    : in  std_logic;                                            --- main clock
    rst_n  : in  std_logic;                                            --- main reset (active low)
    -- I/Os
    input  : in  std_logic_vector(VECTOR_SIZE-1 downto 0);             --- vector to synchronize
    output : out std_logic_vector(VECTOR_SIZE-1 downto 0)              --- double synchronized vector
  );
end entity resync_double;

architecture rtl of resync_double is

  signal temp : std_logic_vector(VECTOR_SIZE-1 downto 0);              --- 1st resynchronization stage
  
  -- shortest possible CDC path
  attribute ASYNC_REG : string;
  attribute ASYNC_REG of temp   : signal is "true";
  attribute ASYNC_REG of output : signal is "true";

begin

  p_resync : process (clk, rst_n)
  begin
    if (rst_n = '0') then
      temp   <= (others => '0');
      output <= (others => '0');
    elsif rising_edge(clk) then
      -- 1st stage
      temp   <= input;
      -- 2nd stage
      output <= temp;
    end if;
  end process p_resync;

end architecture rtl;
