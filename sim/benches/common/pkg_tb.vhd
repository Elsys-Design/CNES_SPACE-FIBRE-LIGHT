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
-- TITLE         : pkg_tb.vhd
-- PROJECT       : SPACE FIBRE LIGHT
--------------------------------------------------------------------------
-- AUTHOR        : Yvan DAURIAC
-- CREATED       : 04/09/2024
--------------------------------------------------------------------------
-- DESCRIPTION   : package for the models testbenchs
--------------------------------------------------------------------------
-- History       : V1.0: Creation of the file
--------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use IEEE.MATH_REAL.ALL;

library std;
use std.textio.all;

library work;

package pkg_tb is

  type print_condition is (PRINT_ALWAYS, PRINT_ON_ERROR, PRINT_NEVER);
  ------------------------------------------------------------------------
  -- Print simulation results
  ------------------------------------------------------------------------
  procedure final_result (
     test_results : in std_logic_vector;
     test_skip    : in std_logic_vector
  );

  ------------------------------------------------------------------------
  -- Compare expected/result (std_logic)
  ------------------------------------------------------------------------
  procedure check (
     expected : in    std_logic;
     result   : in    std_logic;
     --test     : inout std_logic;
     info     : in    string;
     print    : in    print_condition
  );


  ------------------------------------------------------------------------
  -- Compare expected/result (std_logic_vector)
  ------------------------------------------------------------------------
  procedure check (
     expected : in    std_logic_vector;
     result   : in    std_logic_vector;
     --test     : inout std_logic;
     info     : in    string;
     print    : in    print_condition
  );  

end package pkg_tb;

package body pkg_tb is
  ------------------------------------------------------------------------
  -- Print simulation results
  ------------------------------------------------------------------------
  procedure final_result (
     test_results : in std_logic_vector;
     test_skip    : in std_logic_vector
  ) is
     variable stdio   : line;
     variable passed  : integer := 0;
     variable failed  : integer := 0;
     variable skipped : integer := 0;
  begin
     if (test_results'length /= test_skip'length) then
        report "SIMULATION ERROR : Check number of tests" severity error;
     else
        for i in test_results'range loop
           if (test_skip(i) = '0') then
              if (test_results(i) = '0') then
                 failed := failed+1;
              else
                 passed := passed+1;
              end if;
           else
              skipped := skipped+1;
           end if;
        end loop;
        
        write(stdio, string'("FINAL RESULTS : "));
        write(stdio, passed); write(stdio, string'("/"));
        write(stdio, passed+failed); write(stdio, string'(" test(s) passed, "));
        write(stdio, skipped); write(stdio, string'(" test(s) skipped"));
        
        if (failed /= 0) then
           report stdio.all severity error;
           assert false report "### NOT OK ### SIMULATION ENDED WITH ERRORS" severity failure;
        else
           report stdio.all severity note;
           assert false report "--- OK --- SIMULATION ENDED WITH SUCCESS" severity failure;
        end if;
     end if;
  end procedure final_result;

  ------------------------------------------------------------------------
  -- Compare expected/result (std_logic)
  ------------------------------------------------------------------------
  procedure check (
     expected : in    std_logic;
     result   : in    std_logic;
     --test     : inout std_logic;
     info     : in    string;
     print    : in    print_condition
  ) is
     variable stdio : line;
  begin
     if (result /= expected) then
       if ((print = PRINT_ALWAYS) or (print = PRINT_ON_ERROR)) then
         report "### NOT OK ### : " & info & " is false" severity error;
         write(stdio, string'(" expected : ")); write(stdio, expected);
         write(stdio, string'(" but had : ")); write(stdio, result);
         report stdio.all severity error;
       end if;
       --test := '0';
     else
       if (print = PRINT_ALWAYS) then
         report "--- OK --- : " & info & " is correct" severity note;
         write(stdio, string'(" expected : ")); write(stdio, expected);
         write(stdio, string'(" and had : ")); write(stdio, result);
         report stdio.all severity note;
       end if;
     end if;
  end procedure check;

  ------------------------------------------------------------------------
  -- Compare expected/result (std_logic_vector)
  ------------------------------------------------------------------------
  procedure check (
    expected : in    std_logic_vector;
    result   : in    std_logic_vector;
    --test     : inout std_logic;
    info     : in    string;
    print    : in    print_condition
  ) is
    variable stdio : line;
  begin
    if (result /= expected) then
      if ((print = PRINT_ALWAYS) or (print = PRINT_ON_ERROR)) then
        report "### NOT OK ### : " & info & " is false" severity error;
        if (result'length mod 4 = 0) then
          write(stdio, string'(" expected : 0x")); hwrite(stdio, expected);
          write(stdio, string'(" but had : 0x")); hwrite(stdio, result);
        else
          write(stdio, string'(" expected : ")); write(stdio, expected);
          write(stdio, string'(" but had : ")); write(stdio, result);
        end if;
        report stdio.all severity error;
      end if;
      --test := '0';
    else
      if (print = PRINT_ALWAYS) then
        report "--- OK --- : " & info & " is correct" severity note;
        if (result'length mod 4 = 0) then
          write(stdio, string'(" expected : 0x")); hwrite(stdio, expected);
          write(stdio, string'(" and had : 0x")); hwrite(stdio, result);
        else
          write(stdio, string'(" expected : ")); write(stdio, expected);
          write(stdio, string'(" and had : ")); write(stdio, result);
        end if;
        report stdio.all severity note;
      end if;
    end if;
  end procedure check;
  
end package body pkg_tb;
