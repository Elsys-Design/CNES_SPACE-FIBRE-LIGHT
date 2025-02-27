-------------------------------------------------------------------------------
-- Copyright (c) 1995/2019 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2019.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        A high-fanout buffer for low-skew distribution of the PS Clock signals
-- /___/   /\      Filename    : BUFG_PS.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFG_PS -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity BUFG_PS is
  generic (
    SIM_DEVICE : string := "ULTRASCALE_PLUS";
    STARTUP_SYNC : string := "FALSE"
  );
  
  port (
    O                    : out std_ulogic;
    I                    : in std_ulogic
  );
end BUFG_PS;

architecture BUFG_PS_V of BUFG_PS is

  constant MODULE_NAME : string := "BUFG_PS";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(4 downto 0) := "00000";
  constant SIM_DEVICE_VERSAL_AI_CORE : std_logic_vector(4 downto 0) := "00001";
  constant SIM_DEVICE_VERSAL_AI_CORE_ES1 : std_logic_vector(4 downto 0) := "00010";
  constant SIM_DEVICE_VERSAL_AI_EDGE : std_logic_vector(4 downto 0) := "00011";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES1 : std_logic_vector(4 downto 0) := "00100";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES2 : std_logic_vector(4 downto 0) := "00101";
  constant SIM_DEVICE_VERSAL_AI_RF : std_logic_vector(4 downto 0) := "00110";
  constant SIM_DEVICE_VERSAL_AI_RF_ES1 : std_logic_vector(4 downto 0) := "00111";
  constant SIM_DEVICE_VERSAL_AI_RF_ES2 : std_logic_vector(4 downto 0) := "01000";
  constant SIM_DEVICE_VERSAL_HBM : std_logic_vector(4 downto 0) := "01001";
  constant SIM_DEVICE_VERSAL_HBM_ES1 : std_logic_vector(4 downto 0) := "01010";
  constant SIM_DEVICE_VERSAL_HBM_ES2 : std_logic_vector(4 downto 0) := "01011";
  constant SIM_DEVICE_VERSAL_NET : std_logic_vector(4 downto 0) := "01100";
  constant SIM_DEVICE_VERSAL_NET_ES1 : std_logic_vector(4 downto 0) := "01101";
  constant SIM_DEVICE_VERSAL_NET_ES2 : std_logic_vector(4 downto 0) := "01110";
  constant SIM_DEVICE_VERSAL_PREMIUM : std_logic_vector(4 downto 0) := "01111";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES1 : std_logic_vector(4 downto 0) := "10000";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES2 : std_logic_vector(4 downto 0) := "10001";
  constant SIM_DEVICE_VERSAL_PRIME : std_logic_vector(4 downto 0) := "10010";
  constant SIM_DEVICE_VERSAL_PRIME_ES1 : std_logic_vector(4 downto 0) := "10011";
  constant STARTUP_SYNC_FALSE : std_ulogic := '0';
  constant STARTUP_SYNC_TRUE : std_ulogic := '1';

  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal STARTUP_SYNC_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal O_out : std_ulogic;
  
  signal I_in : std_ulogic;
  
  -- begin behavioral model declarations
  signal enable_clk         : std_ulogic := '0';
  signal gwe_latch          : std_ulogic := '0';
  signal gwe_muxed_sync     : std_ulogic := '0';
  signal gwe_sync           : std_logic_vector(2 downto 0) := "000";
  signal gwe                : std_ulogic := '1';

  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  O <= O_out;
  
  I_in <= I;
  
  SIM_DEVICE_BIN <= 
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
      SIM_DEVICE_ULTRASCALE_PLUS;
  
  STARTUP_SYNC_BIN <= 
      STARTUP_SYNC_FALSE when (STARTUP_SYNC = "FALSE") else
      STARTUP_SYNC_TRUE when (STARTUP_SYNC = "TRUE") else
      STARTUP_SYNC_FALSE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE_PLUS") and 
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
        Write ( Message, string'("-101] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
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
        Write ( Message, string'(BUFG_PS_V'PATH_NAME));
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
        Write ( Message, string'("-102] STARTUP_SYNC attribute is set to """));
        Write ( Message, string'(STARTUP_SYNC));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFG_PS_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-103] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFG_PS_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model

    gwe <= not (glblGSR);
    
    prcs_gwe : process( I_in)
    begin
      if(rising_edge(I_in) and I_in='1') then
        gwe_sync <= gwe_sync(1 downto 0) & gwe;
      end if;  
    end process prcs_gwe;

    gwe_muxed_sync <= gwe_sync(2) when (STARTUP_SYNC_BIN=STARTUP_SYNC_TRUE) else gwe;

    gwe_latch <= gwe_muxed_sync when (I_in='0') else gwe_latch;

    O_out <= gwe_latch and  I_in;

-- end behavioral model

end BUFG_PS_V;
