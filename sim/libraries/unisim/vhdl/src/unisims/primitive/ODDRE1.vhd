-------------------------------------------------------------------------------
-- Copyright (c) 1995/2018 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2019.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Dedicated Dual Data Rate (DDR) Output Register
-- /___/   /\      Filename    : ODDRE1.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- End Revision
-------------------------------------------------------------------------------

----- CELL ODDRE1 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity ODDRE1 is
  generic (
    IS_C_INVERTED : bit := '0';
    IS_D1_INVERTED : bit := '0';
    IS_D2_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE";
    SRVAL : bit := '0'
  );

  port (
    Q                    : out std_ulogic := TO_X01(SRVAL);
    C                    : in std_ulogic;
    D1                   : in std_ulogic;
    D2                   : in std_ulogic;
    SR                   : in std_ulogic    
  );
end ODDRE1;

architecture ODDRE1_V of ODDRE1 is
  
  constant MODULE_NAME : string := "ODDRE1";

-- Parameter encodings and registers
  constant SIM_DEVICE_ULTRASCALE : std_logic_vector(4 downto 0) := "00000";
  constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(4 downto 0) := "00001";
  constant SIM_DEVICE_ULTRASCALE_PLUS_ES1 : std_logic_vector(4 downto 0) := "00010";
  constant SIM_DEVICE_ULTRASCALE_PLUS_ES2 : std_logic_vector(4 downto 0) := "00011";
  constant SIM_DEVICE_VERSAL_AI_CORE : std_logic_vector(4 downto 0) := "00101";
  constant SIM_DEVICE_VERSAL_AI_CORE_ES1 : std_logic_vector(4 downto 0) := "00110";
  constant SIM_DEVICE_VERSAL_AI_EDGE : std_logic_vector(4 downto 0) := "01000";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES1 : std_logic_vector(4 downto 0) := "01001";
  constant SIM_DEVICE_VERSAL_AI_EDGE_ES2 : std_logic_vector(4 downto 0) := "01010";
  constant SIM_DEVICE_VERSAL_AI_RF : std_logic_vector(4 downto 0) := "01011";
  constant SIM_DEVICE_VERSAL_AI_RF_ES1 : std_logic_vector(4 downto 0) := "01100";
  constant SIM_DEVICE_VERSAL_AI_RF_ES2 : std_logic_vector(4 downto 0) := "01101";
  constant SIM_DEVICE_VERSAL_HBM : std_logic_vector(4 downto 0) := "10000";
  constant SIM_DEVICE_VERSAL_HBM_ES1 : std_logic_vector(4 downto 0) := "10001";
  constant SIM_DEVICE_VERSAL_HBM_ES2 : std_logic_vector(4 downto 0) := "10010";
  constant SIM_DEVICE_VERSAL_PREMIUM : std_logic_vector(4 downto 0) := "10011";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES1 : std_logic_vector(4 downto 0) := "10100";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES2 : std_logic_vector(4 downto 0) := "10101";
  constant SIM_DEVICE_VERSAL_PRIME : std_logic_vector(4 downto 0) := "10110";
  constant SIM_DEVICE_VERSAL_PRIME_ES1 : std_logic_vector(4 downto 0) := "10111";

  signal IS_C_INVERTED_BIN : std_ulogic;
  signal IS_D1_INVERTED_BIN : std_ulogic;
  signal IS_D2_INVERTED_BIN : std_ulogic;
  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal SRVAL_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal      R_sync         : std_ulogic := '0'; 
  signal      R_sync_reg     : std_logic_vector(3 downto 1) := "000"; 
 
  begin
  glblGSR     <= TO_X01(GSR);
  
  IS_C_INVERTED_BIN <= TO_X01(IS_C_INVERTED);
  IS_D1_INVERTED_BIN <= TO_X01(IS_D1_INVERTED);
  IS_D2_INVERTED_BIN <= TO_X01(IS_D2_INVERTED);
  SIM_DEVICE_BIN <= 
      SIM_DEVICE_ULTRASCALE when (SIM_DEVICE = "ULTRASCALE") else
      SIM_DEVICE_ULTRASCALE_PLUS when (SIM_DEVICE = "ULTRASCALE_PLUS") else
      SIM_DEVICE_ULTRASCALE_PLUS_ES1 when (SIM_DEVICE = "ULTRASCALE_PLUS_ES1") else
      SIM_DEVICE_ULTRASCALE_PLUS_ES2 when (SIM_DEVICE = "ULTRASCALE_PLUS_ES2") else
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
      SIM_DEVICE_ULTRASCALE;

  SRVAL_BIN <= TO_X01(SRVAL);
 

  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- SIM_DEVICE check
      if((xil_attr_test) or
         ((SIM_DEVICE /= "ULTRASCALE") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES1") and 
          (SIM_DEVICE /= "ULTRASCALE_PLUS_ES2") and 
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
        Write ( Message, string'("-105] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""ULTRASCALE"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES1"", "));
        Write ( Message, string'("""ULTRASCALE_PLUS_ES2"", "));
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
        Write ( Message, string'(ODDRE1_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;

    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-102] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(ODDRE1_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;

-- begin behavioral model
  prcs_R_sync: process(SR, R_sync_reg)
  begin
    if ((SIM_DEVICE_BIN /= SIM_DEVICE_ULTRASCALE) and (SIM_DEVICE_BIN /= SIM_DEVICE_ULTRASCALE_PLUS) and (SIM_DEVICE_BIN /= SIM_DEVICE_ULTRASCALE_PLUS_ES1) and (SIM_DEVICE_BIN /= SIM_DEVICE_ULTRASCALE_PLUS_ES2)) then
      R_sync <= SR;
    else
      R_sync <= R_sync_reg(3) or R_sync_reg(2) or R_sync_reg(1);
    end if;
  end process prcs_R_sync;
  
  prcs_R_sync_reg: process(C)
  begin
    if(C'event and xil_pos_edge_inv(C, IS_C_INVERTED_BIN)) then
      R_sync_reg <= R_sync_reg(2 downto 1) & SR;
    end if;
  end process prcs_R_sync_reg;
  
  PRCS_C : process(C,glblGSR,SR)
  variable QD2_posedge_int : std_ulogic := TO_X01(SRVAL);
  begin
    if(glblGSR = '1') then
       Q <= TO_X01(SRVAL);
       QD2_posedge_int := TO_X01(SRVAL);
    elsif (glblGSR = '0') then
      if (SR = '1' or R_sync = '1') then
        Q <= TO_X01(SRVAL);
        QD2_posedge_int := TO_X01(SRVAL);
      elsif (R_sync = '0' or R_sync = 'L' or R_sync = 'U') then
       if (C'event and xil_pos_edge_inv(C, IS_C_INVERTED_BIN)) then
         Q <= D1 xor IS_D1_INVERTED_BIN;
         QD2_posedge_int := D2 xor IS_D2_INVERTED_BIN;
       end if;
       if(C'event and xil_neg_edge_inv(C, IS_C_INVERTED_BIN)) then
         Q <= QD2_posedge_int;
       end if;
      end if;  
    end if;
  
  end process PRCS_C;

-- end behavioral model

end ODDRE1_V;
