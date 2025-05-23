-------------------------------------------------------------------------------
-- Copyright (c) 1995/2021 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2021.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        OBUFDS_DPHY_COMP
-- /___/   /\      Filename    : OBUFDS_DPHY_COMP.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL OBUFDS_DPHY_COMP -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity OBUFDS_DPHY_COMP is
  generic (
    IOSTANDARD : string := "DEFAULT"
  );
  
  port (
    O                    : out std_ulogic;
    OB                   : out std_ulogic;
    HSTX_I               : in std_ulogic;
    HSTX_T               : in std_ulogic;
    LPTX_I_N             : in std_ulogic;
    LPTX_I_P             : in std_ulogic;
    LPTX_T               : in std_ulogic
  );
end OBUFDS_DPHY_COMP;

architecture OBUFDS_DPHY_COMP_V of OBUFDS_DPHY_COMP is

  constant MODULE_NAME : string := "OBUFDS_DPHY_COMP";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';

  signal IOSTANDARD_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal OB_out : std_ulogic;
  signal O_out : std_ulogic;
  
  signal HSTX_I_in : std_ulogic;
  signal HSTX_T_in : std_ulogic;
  signal LPTX_I_N_in : std_ulogic;
  signal LPTX_I_P_in : std_ulogic;
  signal LPTX_T_in : std_ulogic;
  
  -- begin behavioral model declarations
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  O <= O_out;
  OB <= OB_out;
  
  HSTX_I_in <= HSTX_I;
  HSTX_T_in <= HSTX_T;
  LPTX_I_N_in <= LPTX_I_N;
  LPTX_I_P_in <= LPTX_I_P;
  LPTX_T_in <= LPTX_T;
  
  IOSTANDARD_BIN <= 
      IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
      IOSTANDARD_DEFAULT;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- IOSTANDARD check
      if((xil_attr_test) or
         ((IOSTANDARD /= "DEFAULT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] IOSTANDARD attribute is set to """));
        Write ( Message, string'(IOSTANDARD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DEFAULT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(OBUFDS_DPHY_COMP_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-102] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(OBUFDS_DPHY_COMP_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model

-- end behavioral model

end OBUFDS_DPHY_COMP_V;
