-------------------------------------------------------------------------------
-- Copyright (c) 1995/2020 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2020.3
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Input Buffer with Offset Calibration and VREF Tuning
-- /___/   /\      Filename    : IBUFE3.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
-- _revision_history_
-- End Revision
-------------------------------------------------------------------------------

----- CELL IBUFE3 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity IBUFE3 is
  generic (
    IBUF_LOW_PWR : string := "TRUE";
    IOSTANDARD : string := "DEFAULT";
    SIM_DEVICE : string := "ULTRASCALE";
    SIM_INPUT_BUFFER_OFFSET : integer := 0;
    USE_IBUFDISABLE : string := "FALSE"
  );

  port (
    O                    : out std_ulogic;
    I                    : in std_ulogic;
    IBUFDISABLE          : in std_ulogic;
    OSC                  : in std_logic_vector(3 downto 0);
    OSC_EN               : in std_ulogic;
    VREF                 : in std_ulogic
  );
end IBUFE3;

architecture IBUFE3_V of IBUFE3 is
   ---------------------------------------------------------------------------
  -- Function SLV_TO_INT converts a std_logic_vector TO INTEGER
  ---------------------------------------------------------------------------
  function SLV_TO_INT(SLV: in std_logic_vector
                      ) return integer is

    variable int : integer;
  begin
    int := 0;
    for i in SLV'high downto SLV'low loop
      int := int * 2;
      if SLV(i) = '1' then
        int := int + 1;
      end if;
    end loop;
    return int;
  end;

  constant MODULE_NAME : string := "IBUFE3";
  constant IN_DELAY : time := 0 ps;
  constant OUT_DELAY : time := 0 ps;
  constant INCLK_DELAY : time := 0 ps;
  constant OUTCLK_DELAY : time := 100 ps;

-- Parameter encodings and registers
  constant IBUF_LOW_PWR_FALSE : std_ulogic := '1';
  constant IBUF_LOW_PWR_TRUE : std_ulogic := '0';
  constant IOSTANDARD_DEFAULT : std_ulogic := '0';
  constant SIM_DEVICE_ULTRASCALE : std_logic_vector(4 downto 0) := "00000";
  constant SIM_DEVICE_ULTRASCALE_PLUS : std_logic_vector(4 downto 0) := "00001";
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
  constant SIM_DEVICE_VERSAL_NET : std_logic_vector(4 downto 0) := "01101";
  constant SIM_DEVICE_VERSAL_NET_ES1 : std_logic_vector(4 downto 0) := "01110";
  constant SIM_DEVICE_VERSAL_NET_ES2 : std_logic_vector(4 downto 0) := "01111";
  constant SIM_DEVICE_VERSAL_PREMIUM : std_logic_vector(4 downto 0) := "10000";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES1 : std_logic_vector(4 downto 0) := "10001";
  constant SIM_DEVICE_VERSAL_PREMIUM_ES2 : std_logic_vector(4 downto 0) := "10010";
  constant SIM_DEVICE_VERSAL_PRIME : std_logic_vector(4 downto 0) := "10011";
  constant SIM_DEVICE_VERSAL_PRIME_ES1 : std_logic_vector(4 downto 0) := "10100";
  constant USE_IBUFDISABLE_FALSE : std_logic_vector(1 downto 0) := "00";
  constant USE_IBUFDISABLE_TRUE : std_logic_vector(1 downto 0) := "01";
  constant USE_IBUFDISABLE_T_CONTROL : std_logic_vector(1 downto 0) := "10";
  

  signal IBUF_LOW_PWR_BIN : std_ulogic;
  signal IOSTANDARD_BIN : std_ulogic;
  signal SIM_INPUT_BUFFER_OFFSET_BIN : integer := 0;
  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal USE_IBUFDISABLE_BIN : std_logic_vector(1 downto 0);

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  -- internal signal declarations
  -- _out used in behavioral logic, can take an init value
  -- continuous assignment to out pin may effect simulation speed

  signal O_out : std_ulogic;
  
  -- _in optional if no pins have a required value
  -- continuous assignment to _in clocks effect simulation speed
  signal IBUFDISABLE_in : std_ulogic;
  signal I_in : std_ulogic;
  signal OSC_EN_in : std_ulogic;
  signal O_OSC_in : std_ulogic;
  signal OSC_in : std_logic_vector(3 downto 0);
  signal VREF_in : std_ulogic;
  
  
  -- begin behavioral model declarations
  signal versal_or_later : boolean := false;
  signal OSC_EN_in_muxed : std_ulogic;
  signal OSC_in_muxed    : std_logic_vector(3 downto 0);
  -- end behavioral model declarations
  
  -- common declarations first, INIT PROC, then functional
  begin
  glblGSR     <= TO_X01(GSR);
  O <= O_out after OUT_DELAY;
  
  IBUFDISABLE_in <= IBUFDISABLE;
  I_in <= I;
  OSC_EN_in <= OSC_EN;
  OSC_in <= OSC;
  VREF_in <= VREF;
  
  IBUF_LOW_PWR_BIN <= 
    IBUF_LOW_PWR_TRUE when (IBUF_LOW_PWR = "TRUE") else
    IBUF_LOW_PWR_FALSE when (IBUF_LOW_PWR = "FALSE") else
    IBUF_LOW_PWR_TRUE;

  IOSTANDARD_BIN <= 
      IOSTANDARD_DEFAULT when (IOSTANDARD = "DEFAULT") else
      IOSTANDARD_DEFAULT;

  SIM_INPUT_BUFFER_OFFSET_BIN <= SIM_INPUT_BUFFER_OFFSET;
  
  SIM_DEVICE_BIN <= 
      SIM_DEVICE_ULTRASCALE when (SIM_DEVICE = "ULTRASCALE") else
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
  

  
  USE_IBUFDISABLE_BIN <= 
      USE_IBUFDISABLE_FALSE when (USE_IBUFDISABLE = "FALSE") else
      USE_IBUFDISABLE_T_CONTROL when (USE_IBUFDISABLE = "T_CONTROL") else
      USE_IBUFDISABLE_TRUE when (USE_IBUFDISABLE = "TRUE") else
      USE_IBUFDISABLE_FALSE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- IBUF_LOW_PWR check
  if((xil_attr_test) or
     ((IBUF_LOW_PWR /= "TRUE") and 
      (IBUF_LOW_PWR /= "FALSE"))) then
    attr_err := true;
    Write ( Message, string'("Error : [Unisim "));
    Write ( Message, string'(MODULE_NAME));
    Write ( Message, string'("-101] IBUF_LOW_PWR attribute is set to """));
    Write ( Message, string'(IBUF_LOW_PWR));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""TRUE"" or "));
    Write ( Message, string'("""FALSE"". "));
    Write ( Message, string'("Instance "));
    Write ( Message, string'(IBUFE3_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;
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
        Write ( Message, string'(IBUFE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
  -------- SIM_DEVICE check
      if((xil_attr_test) or
     ((SIM_DEVICE /= "ULTRASCALE") and 
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
    Write ( Message, string'("-103] SIM_DEVICE attribute is set to """));
    Write ( Message, string'(SIM_DEVICE));
    Write ( Message, string'(""". Legal values for this attribute are "));
    Write ( Message, string'("""ULTRASCALE"", "));
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
    Write ( Message, string'(IBUFE3_V'PATH_NAME));
    writeline(output, Message);
    DEALLOCATE (Message);
  end if;

    -------- SIM_INPUT_BUFFER_OFFSET check
    if((xil_attr_test) or
           ((SIM_INPUT_BUFFER_OFFSET < -50) or (SIM_INPUT_BUFFER_OFFSET > 50))) then
          attr_err := true;
      Write ( Message, string'("Error : [Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-104] SIM_INPUT_BUFFER_OFFSET attribute is set to "));
      Write ( Message, SIM_INPUT_BUFFER_OFFSET);
      Write ( Message, string'(". Legal values for this attribute are -50 to 50. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IBUFE3_V'PATH_NAME));
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
        Write ( Message, string'("-105] USE_IBUFDISABLE attribute is set to """));
        Write ( Message, string'(USE_IBUFDISABLE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"", "));
        Write ( Message, string'("""T_CONTROL"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(IBUFE3_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-106] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(IBUFE3_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    wait;
    end process INIPROC;
   
-- begin behavioral model
  versal_or_later <= false when ((SIM_DEVICE_BIN = SIM_DEVICE_ULTRASCALE) or 
                               (SIM_DEVICE_BIN = SIM_DEVICE_ULTRASCALE_PLUS ) )
                     else true;

  OSC_in_muxed    <= "0000" when versal_or_later else OSC_in;
  OSC_EN_in_muxed <= '0'    when versal_or_later else OSC_EN_in;


  OSC_Enable : process(OSC_in_muxed,OSC_EN_in_muxed)
  variable OSC_int : integer := 0;
  begin
    if (OSC_in_muxed(3) = '0') then
    OSC_int := -1 * SLV_TO_INT(OSC_in_muxed(2 downto 0)) * 5;
    else
    OSC_int := SLV_TO_INT(OSC_in_muxed(2 downto 0)) * 5;
    end if;
    if (OSC_EN_in_muxed = '1') then
      if ((SIM_INPUT_BUFFER_OFFSET - OSC_int) < 0) then 
          O_OSC_in <= '0';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) > 0) then
          O_OSC_in <= '1';
      elsif ((SIM_INPUT_BUFFER_OFFSET - OSC_int) = 0 ) then
          O_OSC_in <= not O_OSC_in;
      end if;	  
    end if;
  end process OSC_Enable;

  Behavior     : process (IBUFDISABLE_in, I_in, O_OSC_in, OSC_EN_in_muxed)
  begin
    if(USE_IBUFDISABLE = "TRUE") then
      if(IBUFDISABLE_in = '1' and OSC_EN_in_muxed /= '1') then
          O_out  <= '0';
      elsif (IBUFDISABLE_in = '0') then
         if (OSC_EN_in_muxed = '1') then
            O_out <= O_OSC_in;
	 else
	    O_out <= TO_X01(I_in);
         end if;
      else
           O_out <= 'X';
      end if;
    elsif(USE_IBUFDISABLE = "FALSE") then
            if (OSC_EN_in_muxed = '1') then
            O_out <= O_OSC_in;
	 else
	    O_out <= TO_X01(I_in);
         end if;
    elsif(USE_IBUFDISABLE = "T_CONTROL") then
            if (OSC_EN_in_muxed = '1') then
            O_out <= O_OSC_in;
	 else
	    O_out <= TO_X01(I_in);
         end if;
    end if;
 end process;

    -- end behavioral body
  end IBUFE3_V;
