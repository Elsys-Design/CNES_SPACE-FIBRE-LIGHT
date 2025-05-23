-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2019.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        General Clock Buffer with Clock Enable
-- /___/   /\      Filename    : BUFGCE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
--  End Revision
-------------------------------------------------------------------------------

----- CELL BUFGCE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFGCE is
    generic (
      CE_TYPE : string := "SYNC";
      IS_CE_INVERTED : bit := '0';
    IS_I_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE";
    STARTUP_SYNC : string := "FALSE"
    );

    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      I                    : in std_ulogic      
    );
  end BUFGCE;

  architecture BUFGCE_V of BUFGCE is
    
    constant MODULE_NAME : string := "BUFGCE";
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant CE_TYPE_ASYNC : std_logic_vector(1 downto 0) := "01";
  constant CE_TYPE_HARDSYNC : std_logic_vector(1 downto 0) := "10";
  constant CE_TYPE_SYNC : std_logic_vector(1 downto 0) := "00";
  constant SIM_DEVICE_7SERIES : std_logic_vector(4 downto 0) := "00001";
  constant SIM_DEVICE_ULTRASCALE : std_logic_vector(4 downto 0) := "00000";
  constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(4 downto 0) := "00010";
  constant SIM_DEVICE_VERSAL_AI_CORE : std_logic_vector(4 downto 0) := "00011";
  constant SIM_DEVICE_VERSAL_AI_CORE_ES1 : std_logic_vector(4 downto 0) := "00100";
  constant SIM_DEVICE_VERSAL_AI_EDGE : std_logic_vector(4 downto 0) := "00101";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES1 : std_logic_vector(4 downto 0) := "00110";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES2 : std_logic_vector(4 downto 0) := "00111";
  constant SIM_DEVICE_VERSAL_AI_RF : std_logic_vector(4 downto 0) := "01000";
  constant SIM_DEVICE_VERSAL_AI_RF_ES1 : std_logic_vector(4 downto 0) := "01001";
  constant SIM_DEVICE_VERSAL_AI_RF_ES2 : std_logic_vector(4 downto 0) := "01010";
  constant SIM_DEVICE_VERSAL_HBM : std_logic_vector(4 downto 0) := "01011";
  constant SIM_DEVICE_VERSAL_HBM_ES1 : std_logic_vector(4 downto 0) := "01100";
  constant SIM_DEVICE_VERSAL_HBM_ES2 : std_logic_vector(4 downto 0) := "01101";
  constant SIM_DEVICE_VERSAL_NET : std_logic_vector(4 downto 0) := "01110";
  constant SIM_DEVICE_VERSAL_NET_ES1 : std_logic_vector(4 downto 0) := "01111";
  constant SIM_DEVICE_VERSAL_NET_ES2 : std_logic_vector(4 downto 0) := "10000";
  constant SIM_DEVICE_VERSAL_PREMIUM : std_logic_vector(4 downto 0) := "10001";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES1 : std_logic_vector(4 downto 0) := "10010";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES2 : std_logic_vector(4 downto 0) := "10011";
  constant SIM_DEVICE_VERSAL_PRIME : std_logic_vector(4 downto 0) := "10100";
  constant SIM_DEVICE_VERSAL_PRIME_ES1 : std_logic_vector(4 downto 0) := "10101";
  constant STARTUP_SYNC_FALSE : std_ulogic := '0';
  constant STARTUP_SYNC_TRUE : std_ulogic := '1';

  signal CE_TYPE_BIN : std_logic_vector(1 downto 0);
    signal IS_CE_INVERTED_BIN : std_ulogic;
    signal IS_I_INVERTED_BIN : std_ulogic;
  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal STARTUP_SYNC_BIN : std_ulogic;

    signal glblGSR : std_ulogic;
    signal xil_attr_test : boolean := false;
    
    signal O_out : std_ulogic;
    
    signal CE_in : std_ulogic;
    signal I_in : std_ulogic;

  -- begin behavioral model declarations
    signal enable_clk        : std_ulogic := '0';
    signal gwe_sync          : std_logic_vector(2 downto 0) := "000";
    signal ce_sync           : std_logic_vector(2 downto 0) := "000";
    signal ce_muxed_sync     : std_ulogic := '0';
    signal gwe_muxed_sync    : std_ulogic := '0';
    signal cb                : std_ulogic := '0';


  -- end behavioral model declarations

  begin
    glblGSR     <= TO_X01(GSR);
   
    O <= O_out;
    
    CE_in <= '1' when (CE = 'U') else CE xor IS_CE_INVERTED_BIN; -- rv 1
    I_in <= I xor IS_I_INVERTED_BIN;
    
    CE_TYPE_BIN <= 
      CE_TYPE_SYNC when (CE_TYPE = "SYNC") else
      CE_TYPE_ASYNC when (CE_TYPE = "ASYNC") else
      CE_TYPE_HARDSYNC when (CE_TYPE = "HARDSYNC") else
      CE_TYPE_SYNC;
      
    IS_CE_INVERTED_BIN <= TO_X01(IS_CE_INVERTED);
    IS_I_INVERTED_BIN <= TO_X01(IS_I_INVERTED);
  SIM_DEVICE_BIN <= 
      SIM_DEVICE_ULTRASCALE when (SIM_DEVICE = "ULTRASCALE") else
      SIM_DEVICE_7SERIES when (SIM_DEVICE = "7SERIES") else
      SIM_DEVICE_ULTRASCALE_PLUS when (SIM_DEVICE = "ULTRASCALE_PLUS") else
      SIM_DEVICE_VERSAL_AI_CORE when (SIM_DEVICE = "VERSAL_AI_CORE") else
      SIM_DEVICE_VERSAL_AI_CORE_ES1 when (SIM_DEVICE = "VERSAL_AI_CORE_ES1") else
      SIM_DEVICE_VERSAL_AI_EDGE when (SIM_DEVICE = "VERSAL_AI_EDGE") else
      SIM_DEVICE_VERSAL_AI_EDGE_ES1 when (SIM_DEVICE = "VERSAL_AI_EDGE_ES1") else
      SIM_DEVICE_VERSAL_AI_EDGE_ES2 when (SIM_DEVICE = "VERSAL_AI_EDGE_ES2") else
      SIM_DEVICE_VERSAL_AI_RF when (SIM_DEVICE = "VERSAL_AI_RF") else
      SIM_DEVICE_VERSAL_AI_RF_ES1 when (SIM_DEVICE = "VERSAL_AI_RF_ES1") else
      SIM_DEVICE_VERSAL_AI_RF_ES2 when (SIM_DEVICE = "VERSAL_AI_RF_ES2") else
      SIM_DEVICE_VERSAL_HBM when (SIM_DEVICE = "VERSAL_HBM") else
      SIM_DEVICE_VERSAL_HBM_ES1 when (SIM_DEVICE = "VERSAL_HBM_ES1") else
      SIM_DEVICE_VERSAL_HBM_ES2 when (SIM_DEVICE = "VERSAL_HBM_ES2") else
      SIM_DEVICE_VERSAL_NET when (SIM_DEVICE = "VERSAL_NET") else
      SIM_DEVICE_VERSAL_NET_ES1 when (SIM_DEVICE = "VERSAL_NET_ES1") else
      SIM_DEVICE_VERSAL_NET_ES2 when (SIM_DEVICE = "VERSAL_NET_ES2") else
      SIM_DEVICE_VERSAL_PREMIUM when (SIM_DEVICE = "VERSAL_PREMIUM") else
      SIM_DEVICE_VERSAL_PREMIUM_ES1 when (SIM_DEVICE = "VERSAL_PREMIUM_ES1") else
      SIM_DEVICE_VERSAL_PREMIUM_ES2 when (SIM_DEVICE = "VERSAL_PREMIUM_ES2") else
      SIM_DEVICE_VERSAL_PRIME when (SIM_DEVICE = "VERSAL_PRIME") else
      SIM_DEVICE_VERSAL_PRIME_ES1 when (SIM_DEVICE = "VERSAL_PRIME_ES1") else
      SIM_DEVICE_ULTRASCALE;
  
  STARTUP_SYNC_BIN <= 
      STARTUP_SYNC_FALSE when (STARTUP_SYNC = "FALSE") else
      STARTUP_SYNC_TRUE when (STARTUP_SYNC = "TRUE") else
      STARTUP_SYNC_FALSE;
  

  INIPROC : process
    variable Message : line;
    variable attr_err : boolean := false;
    begin
    -------- CE_TYPE check
      if((xil_attr_test) or
         ((CE_TYPE /= "SYNC") and 
          (CE_TYPE /= "ASYNC") and 
          (CE_TYPE /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CE_TYPE attribute is set to """));
        Write ( Message, string'(CE_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"", "));
        Write ( Message, string'("""ASYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and 
          (SIM_DEVICE /= "7SERIES") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "VERSAL_AI_CORE") and 
          (SIM_DEVICE /= "VERSAL_AI_CORE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES2") and 
          (SIM_DEVICE /= "VERSAL_AI_RF") and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES2") and 
          (SIM_DEVICE /= "VERSAL_HBM") and 
          (SIM_DEVICE /= "VERSAL_HBM_ES1") and 
          (SIM_DEVICE /= "VERSAL_HBM_ES2") and 
          (SIM_DEVICE /= "VERSAL_NET") and 
          (SIM_DEVICE /= "VERSAL_NET_ES1") and 
          (SIM_DEVICE /= "VERSAL_NET_ES2") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES1") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES2") and 
          (SIM_DEVICE /= "VERSAL_PRIME") and 
          (SIM_DEVICE /= "VERSAL_PRIME_ES1"))) then 
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""7SERIES"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""VERSAL_AI_CORE"", "));
        Write ( Message, string'("""VERSAL_AI_CORE_ES1"", "));
        Write ( Message, string'("""VERSAL_AI_EDGE"", "));
        Write ( Message, string'("""VERSAL_AI_EDGE_ES1"", "));
        Write ( Message, string'("""VERSAL_AI_EDGE_ES2"", "));
        Write ( Message, string'("""VERSAL_AI_RF"", "));
        Write ( Message, string'("""VERSAL_AI_RF_ES1"", "));
        Write ( Message, string'("""VERSAL_AI_RF_ES2"", "));
        Write ( Message, string'("""VERSAL_HBM"", "));
        Write ( Message, string'("""VERSAL_HBM_ES1"", "));
        Write ( Message, string'("""VERSAL_HBM_ES2"", "));
        Write ( Message, string'("""VERSAL_NET"", "));
        Write ( Message, string'("""VERSAL_NET_ES1"", "));
        Write ( Message, string'("""VERSAL_NET_ES2"", "));
        Write ( Message, string'("""VERSAL_PREMIUM"", "));
        Write ( Message, string'("""VERSAL_PREMIUM_ES1"", "));
        Write ( Message, string'("""VERSAL_PREMIUM_ES2"", "));
        Write ( Message, string'("""VERSAL_PRIME"" or "));
        Write ( Message, string'("""VERSAL_PRIME_ES1"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- STARTUP_SYNC check
      if((xil_attr_test) or
         ((STARTUP_SYNC /= "FALSE") and 
          (STARTUP_SYNC /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] STARTUP_SYNC attribute is set to """));
        Write ( Message, string'(STARTUP_SYNC));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFGCE_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
      end if;
      wait;
    end process INIPROC;

-- begin behavioral model

    prcs_gwe : process( I_in)
    begin
      if(rising_edge(I_in))then
        if(I_in='1') then
          gwe_sync <= gwe_sync(1 downto 0) & not(glblGSR);
        end if;
      end if;  
    end process prcs_gwe;
    
    gwe_muxed_sync <= gwe_sync(2) when (STARTUP_SYNC_BIN = STARTUP_SYNC_TRUE) else not(glblGSR);

    prcs_ce : process( I_in)
    begin
      if(rising_edge(I_in))then
        if(I_in='1') then
          ce_sync <= ce_sync(1 downto 0) & CE_in;
        end if;
      end if;  
    end process prcs_ce;
    
    ce_muxed_sync <= ce_sync(2) when (CE_TYPE_BIN = CE_TYPE_HARDSYNC) else  CE_in;
    
    cb <= '1' when not( (gwe_muxed_sync/='1') or ((CE_TYPE_BIN /= CE_TYPE_ASYNC) and (I_in='1'))) else '0';

    enable_clk <= ce_muxed_sync when (cb='1') else enable_clk;

    O_out <= enable_clk and I_in;

-- end behavioral model

  end BUFGCE_V;
