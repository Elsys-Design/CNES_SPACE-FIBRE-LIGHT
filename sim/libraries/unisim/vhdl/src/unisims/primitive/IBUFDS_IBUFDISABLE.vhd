-------------------------------------------------------------------------------
-- Copyright (c) 1995/2020 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2020.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        IBUFDS_IBUFDISABLE
-- /___/   /\      Filename    : IBUFDS_IBUFDISABLE.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL IBUFDS_IBUFDISABLE -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IBUFDS_IBUFDISABLE is
  generic (
    DIFF_TERM : string := "FALSE";
    DQS_BIAS : string := "FALSE";
    IBUF_LOW_PWR : string := "TRUE";
    IOSTANDARD : string := "DEFAULT";
    SIM_DEVICE : string := "7SERIES";
    USE_IBUFDISABLE : string := "TRUE"
  );
  
  port (
    O                    : out std_ulogic;
    I                    : in std_ulogic;
    IB                   : in std_ulogic;
    IBUFDISABLE          : in std_ulogic
  );
end IBUFDS_IBUFDISABLE;

architecture IBUFDS_IBUFDISABLE_V of IBUFDS_IBUFDISABLE is

  constant MODULE_NAME : string := "IBUFDS_IBUFDISABLE";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant DIFF_TERM_FALSE : std_ulogic := '0';
  constant DIFF_TERM_TRUE : std_ulogic := '1';
  constant DQS_BIAS_FALSE : std_ulogic := '0';
  constant DQS_BIAS_TRUE : std_ulogic := '1';
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '0';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '1';
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';
  constant SIM_DEVICE_7SERIES : std_logic_vector(4 downto 0) := "00000";
  constant SIM_DEVICE_ULTRASCALE : std_logic_vector(4 downto 0) := "00001";
  constant SIM_DEVICE_VERSAL_AI_CORE : std_logic_vector(4 downto 0) := "00010";
  constant SIM_DEVICE_VERSAL_AI_CORE_ES1 : std_logic_vector(4 downto 0) := "00011";
  constant SIM_DEVICE_VERSAL_AI_EDGE : std_logic_vector(4 downto 0) := "00100";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES1 : std_logic_vector(4 downto 0) := "00101";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES2 : std_logic_vector(4 downto 0) := "00110";
  constant SIM_DEVICE_VERSAL_AI_RF : std_logic_vector(4 downto 0) := "00111";
  constant SIM_DEVICE_VERSAL_AI_RF_ES1 : std_logic_vector(4 downto 0) := "01000";
  constant SIM_DEVICE_VERSAL_AI_RF_ES2 : std_logic_vector(4 downto 0) := "01001";
  constant SIM_DEVICE_VERSAL_HBM : std_logic_vector(4 downto 0) := "01010";
  constant SIM_DEVICE_VERSAL_HBM_ES1 : std_logic_vector(4 downto 0) := "01011";
  constant SIM_DEVICE_VERSAL_HBM_ES2 : std_logic_vector(4 downto 0) := "01100";
  constant SIM_DEVICE_VERSAL_PREMIUM : std_logic_vector(4 downto 0) := "01101";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES1 : std_logic_vector(4 downto 0) := "01110";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES2 : std_logic_vector(4 downto 0) := "01111";
  constant SIM_DEVICE_VERSAL_PRIME : std_logic_vector(4 downto 0) := "10000";
  constant SIM_DEVICE_VERSAL_PRIME_ES1 : std_logic_vector(4 downto 0) := "10001";
  constant USE_IBUFDISABLE_FALSE : std_logic_vector(1 downto 0) := "00";
  constant USE_IBUFDISABLE_TRUE : std_logic_vector(1 downto 0) := "01";
  constant USE_IBUFDISABLE_T_CONTROL : std_logic_vector(1 downto 0) := "10";

  signal DIFF_TERM_BIN : std_ulogic;
  signal DQS_BIAS_BIN : std_ulogic;
  signal IBUF_LOW_PWR_BIN : std_ulogic;
  signal IOSTANDARD_BIN : std_ulogic;
  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal USE_IBUFDISABLE_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal O_out : std_ulogic;
  
  signal IBUFDISABLE_in : std_ulogic;
  signal IB_in : std_ulogic;
  signal I_in : std_ulogic;
  
  -- begin behavioral model declarations
  signal out_val : std_ulogic := '1';
 
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  O <= O_out;
  
  IBUFDISABLE_in <= IBUFDISABLE;
  IB_in <= IB;
  I_in <= I;
  
  DIFF_TERM_BIN <= 
      DIFF_TERM_FALSE when (DIFF_TERM = "FALSE") else
      DIFF_TERM_TRUE when (DIFF_TERM = "TRUE") else
      DIFF_TERM_FALSE;
  
  DQS_BIAS_BIN <= 
      DQS_BIAS_FALSE when (DQS_BIAS = "FALSE") else
      DQS_BIAS_TRUE when (DQS_BIAS = "TRUE") else
      DQS_BIAS_FALSE;
  
  IBUF_LOW_PWR_BIN <= 
      IBUF_LOW_PWR_TRUE when (IBUF_LOW_PWR = "TRUE") else
      IBUF_LOW_PWR_FALSE when (IBUF_LOW_PWR = "FALSE") else
      IBUF_LOW_PWR_TRUE;
  
  IOSTANDARD_BIN <= 
      IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
      IOSTANDARD_DEFAULT;
  
  SIM_DEVICE_BIN <= 
      SIM_DEVICE_7SERIES when (SIM_DEVICE = "7SERIES") else
      SIM_DEVICE_ULTRASCALE when (SIM_DEVICE = "ULTRASCALE") else
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
      SIM_DEVICE_VERSAL_PREMIUM when (SIM_DEVICE = "VERSAL_PREMIUM") else
      SIM_DEVICE_VERSAL_PREMIUM_ES1 when (SIM_DEVICE = "VERSAL_PREMIUM_ES1") else
      SIM_DEVICE_VERSAL_PREMIUM_ES2 when (SIM_DEVICE = "VERSAL_PREMIUM_ES2") else
      SIM_DEVICE_VERSAL_PRIME when (SIM_DEVICE = "VERSAL_PRIME") else
      SIM_DEVICE_VERSAL_PRIME_ES1 when (SIM_DEVICE = "VERSAL_PRIME_ES1") else
      SIM_DEVICE_7SERIES;
  
  USE_IBUFDISABLE_BIN <= 
      USE_IBUFDISABLE_FALSE when (USE_IBUFDISABLE = "FALSE") else
      USE_IBUFDISABLE_T_CONTROL when (USE_IBUFDISABLE = "T_CONTROL") else
      USE_IBUFDISABLE_TRUE when (USE_IBUFDISABLE = "TRUE") else
      USE_IBUFDISABLE_FALSE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- DIFF_TERM check
      if((xil_attr_test) or
         ((DIFF_TERM /= "FALSE") and 
          (DIFF_TERM /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] DIFF_TERM attribute is set to """));
        Write ( Message, string'(DIFF_TERM));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- DQS_BIAS check
      if((xil_attr_test) or
         ((DQS_BIAS /= "FALSE") and 
          (DQS_BIAS /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] DQS_BIAS attribute is set to """));
        Write ( Message, string'(DQS_BIAS));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IBUF_LOW_PWR check
      if((xil_attr_test) or
         ((IBUF_LOW_PWR /= "TRUE") and 
          (IBUF_LOW_PWR /= "FALSE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] IBUF_LOW_PWR attribute is set to """));
        Write ( Message, string'(IBUF_LOW_PWR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""TRUE"" or "));
        Write ( Message, string'("""FALSE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- IOSTANDARD check
      if((xil_attr_test) or
         ((IOSTANDARD /= "DEFAULT"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-105] IOSTANDARD attribute is set to """));
        Write ( Message, string'(IOSTANDARD));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""DEFAULT"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "7SERIES") and 
          (SIM_DEVICE /= "ULTRASCALE") and 
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
          (SIM_DEVICE /= "VERSAL_PREMIUM") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES1") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES2") and 
          (SIM_DEVICE /= "VERSAL_PRIME") and 
          (SIM_DEVICE /= "VERSAL_PRIME_ES1"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-106] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""7SERIES"", "));
        Write ( Message, string'("""ULTRASCALE"", "));
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
        Write ( Message, string'("""VERSAL_PREMIUM"", "));
        Write ( Message, string'("""VERSAL_PREMIUM_ES1"", "));
        Write ( Message, string'("""VERSAL_PREMIUM_ES2"", "));
        Write ( Message, string'("""VERSAL_PRIME"" or "));
        Write ( Message, string'("""VERSAL_PRIME_ES1"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- USE_IBUFDISABLE check
      if((xil_attr_test) or
     ((USE_IBUFDISABLE /= "FALSE") and 
          (USE_IBUFDISABLE /= "T_CONTROL") and 
          (USE_IBUFDISABLE /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-108] USE_IBUFDISABLE attribute is set to """));
        Write ( Message, string'(USE_IBUFDISABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"", "));
        Write ( Message, string'("""T_CONTROL"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
        writeline(output, Message);
	DEALLOCATE (Message);
  end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IBUFDS_IBUFDISABLE_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model
 -- out_val <= '0' when (SIM_DEVICE = "ULTRASCALE" or SIM_DEVICE = "VERSAL" or SIM_DEVICE = "VERSAL_ES1" or SIM_DEVICE = "VERSAL_ES2") else
   --           '1' when (SIM_DEVICE = "7SERIES");
prcs_sim_device : process(SIM_DEVICE_BIN)
begin
    case SIM_DEVICE_BIN is
        when SIM_DEVICE_7SERIES => 
	        out_val <= '1';
        when others =>
	        out_val <= '0';
    end case;
end process;

  Behavior : process (I_in, IB_in, IBUFDISABLE_in, USE_IBUFDISABLE_BIN, DQS_BIAS_BIN)
     variable IBUFDISABLE_AND_ENABLED   : std_ulogic := '0';
  begin
    if(IBUFDISABLE_in = '1' and USE_IBUFDISABLE_BIN = "01") then
       O_out <= out_val;
    elsif((IBUFDISABLE_in = '0' and USE_IBUFDISABLE_BIN = "01") or (USE_IBUFDISABLE_BIN = "00") or (USE_IBUFDISABLE_BIN = "10")) then
       if  (((I_in = '1') or (I_in = 'H')) and ((IB_in = '0') or (IB_in = 'L'))) then
          O_out <= '1';
       elsif (((I_in = '0') or (I_in = 'L')) and ((IB_in = '1') or (IB_in = 'H'))) then
          O_out <= '0';
       elsif ((I_in = 'Z' or I_in = '0' or I_in = 'L') and (IB_in = 'Z' or IB_in = '1' or IB_in = 'H')) then
          if (DQS_BIAS_BIN = '1') then
            O_out <= '0';
          else
            O_out <= 'X';
          end if;
       elsif ((I_in = 'X' or I_in = 'U') and (IB_in = 'X' or IB_in = 'U')) then
         O_out <= 'X';
       end if;
    end if;

  end process Behavior;

-- end behavioral model

end IBUFDS_IBUFDISABLE_V;
