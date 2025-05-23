-------------------------------------------------------------------------------
-- Copyright (c) 1995/2020 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2020.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        IOBUFDS_DIFF_OUT_DCIEN
-- /___/   /\      Filename    : IOBUFDS_DIFF_OUT_DCIEN.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL IOBUFDS_DIFF_OUT_DCIEN -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IOBUFDS_DIFF_OUT_DCIEN is
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
    OB                   : out std_ulogic;
    IO                   : inout std_ulogic;
    IOB                  : inout std_ulogic;
    DCITERMDISABLE       : in std_ulogic;
    I                    : in std_ulogic;
    IBUFDISABLE          : in std_ulogic;
    TM                   : in std_ulogic;
    TS                   : in std_ulogic
  );
end IOBUFDS_DIFF_OUT_DCIEN;

architecture IOBUFDS_DIFF_OUT_DCIEN_V of IOBUFDS_DIFF_OUT_DCIEN is

  constant MODULE_NAME : string := "IOBUFDS_DIFF_OUT_DCIEN";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant DIFF_TERM_FALSE : std_ulogic := '0';
  constant DIFF_TERM_TRUE : std_ulogic := '1';
  constant DQS_BIAS_FALSE : std_ulogic := '0';
  constant DQS_BIAS_TRUE : std_ulogic := '1';
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '1';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '0';
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
  
  signal OB_out : std_ulogic;
  signal O_out : std_ulogic;
  
  signal DCITERMDISABLE_in : std_ulogic;
  signal IBUFDISABLE_in : std_ulogic;
  signal I_in : std_ulogic;
  signal TM_in : std_ulogic;
  signal TS_in : std_ulogic;
  
  -- begin behavioral model declarations
  signal out_val : std_ulogic := '1';
  signal out_b_val : std_ulogic := '1';
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  --O <= O_out;
  --OB <= OB_out;
  
 -- DCITERMDISABLE_in <= DCITERMDISABLE;
 -- IBUFDISABLE_in <= IBUFDISABLE;
 -- I_in <= I;
 -- TM_in <= TM;
 -- TS_in <= TS;
  
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
      USE_IBUFDISABLE_TRUE when (USE_IBUFDISABLE = "TRUE") else
      USE_IBUFDISABLE_FALSE when (USE_IBUFDISABLE = "FALSE") else
      USE_IBUFDISABLE_T_CONTROL when (USE_IBUFDISABLE = "T_CONTROL") else
      USE_IBUFDISABLE_TRUE;
  
  
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
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
        Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-107] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IOBUFDS_DIFF_OUT_DCIEN_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
    
-- begin behavioral model
prcs_sim_device : process(SIM_DEVICE_BIN)
begin
    case SIM_DEVICE_BIN is
        when SIM_DEVICE_ULTRASCALE => 
		out_val <= '0';
		out_b_val <= 'X';
        when SIM_DEVICE_7SERIES => 
	        out_val <= '1';
		out_b_val <= '1';
        when others =>
	        out_val <= '0';
		out_b_val <= '0';
    end case;
end process;


  prcs_output : process (IBUFDISABLE, IO, IOB, I, TM, TS,DQS_BIAS_BIN)
  variable  T_OR_IBUFDISABLE_1 : std_ulogic := '0';
  variable  T_OR_IBUFDISABLE_2 : std_ulogic := '0';
  begin
    if(USE_IBUFDISABLE = "TRUE") then
       T_OR_IBUFDISABLE_1 := IBUFDISABLE OR (not TM);
       T_OR_IBUFDISABLE_2 := IBUFDISABLE OR (not TS);

-- O
       if(T_OR_IBUFDISABLE_1 = '1') then
          O  <= out_val;
       elsif (T_OR_IBUFDISABLE_1 = '0') then
       if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          O <= '1';
       elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          O <= '0';
       elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BIN = '1') then
            O <= '0';
          else
            O <= 'X';
          end if;
       elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         O <= 'X';
       end if;
       end if;        
-- OB
       if(T_OR_IBUFDISABLE_2 = '1') then
          OB <= out_b_val;
       elsif (T_OR_IBUFDISABLE_2 = '0') then
         if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          OB <= '0';
         elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          OB <= '1';
         elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BIN = '1') then
            OB <= '1';
          else
            OB <= 'X';
          end if;
         elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         OB <= 'X';
         end if;
       end if;
    elsif(USE_IBUFDISABLE = "FALSE") then
      if ((IO = '1' or IO = 'H') and (IOB = '0' or IOB = 'L')) then
          O <= '1';
          OB <= '0';
       elsif ((IO = '0' or IO = 'L') and (IOB = '1' or IOB = 'H')) then
          O <= '0';
          OB <= '1';
       elsif ((IO = 'Z' or IO = '0' or IO = 'L') and (IOB = 'Z' or IOB = '1' or IOB = 'H')) then
          if (DQS_BIAS_BIN = '1') then
            O <= '0';
            OB <= '1';
          else
            O <= 'X';
            OB <= 'X';
          end if;
       elsif ((IO = 'X' or IO = 'U') and (IOB = 'X' or IOB = 'U' )) then
         O <= 'X';
         OB <= 'X';
       end if;
    elsif (USE_IBUFDISABLE = "T_CONTROL") then
        if(TM = '1') then
	 O <= IO;
	elsif (TM = '0') then
	 O <= '0';
	 end if;

	if(TS = '1') then
	 OB <= not IO;
	elsif (TS = '0') then
	 OB <= '1';
	end if;
    end if;        

    if ((TM = '1') or (TM = 'H')) then
      IO <= 'Z';
    elsif ((TM = '0') or (TM = 'L')) then
      if ((I = '1') or (I = 'H')) then
        IO <= '1';
      elsif ((I = '0') or (I = 'L')) then
        IO <= '0';
      elsif (I = 'U') then
        IO <= 'U';
      else
        IO <= 'X';  
      end if;
    elsif (TM = 'U') then
      IO <= 'U';          
    else                                      
      IO <= 'X';  
    end if;

    if ((TS = '1') or (TS = 'H')) then
      IOB <= 'Z';
    elsif ((TS = '0') or (TS = 'L')) then
      if (((not I) = '1') or ((not I) = 'H')) then
        IOB <= '1';
      elsif (((not I) = '0') or ((not I) = 'L')) then
        IOB <= '0';
      elsif ((not I) = 'U') then
        IOB <= 'U';
      else
        IOB <= 'X';  
      end if;
    elsif (TS = 'U') then
      IOB <= 'U';          
    else                                      
      IOB <= 'X';  
    end if;        
  end process;

-- end behavioral model

end IOBUFDS_DIFF_OUT_DCIEN_V;
