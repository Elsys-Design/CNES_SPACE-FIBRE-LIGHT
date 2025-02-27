-------------------------------------------------------------------------------
-- Copyright (c) 1995/2019 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor : Xilinx
-- \   \   \/      Version     : 2019.2
--  \   \         Description : Xilinx Functional Simulation Library Component
--  /   /                        BUFGCTRL
-- /___/   /\     Filename : BUFGCTRL.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFGCTRL -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity BUFGCTRL is
  generic(
    CE_TYPE_CE0         : string := "SYNC";
    CE_TYPE_CE1         : string := "SYNC";
    INIT_OUT            : integer := 0;
    IS_CE0_INVERTED     : bit := '0';
    IS_CE1_INVERTED     : bit := '0';
    IS_I0_INVERTED      : bit := '0';
    IS_I1_INVERTED      : bit := '0';
    IS_IGNORE0_INVERTED : bit := '0';
    IS_IGNORE1_INVERTED : bit := '0';
    IS_S0_INVERTED      : bit := '0';
    IS_S1_INVERTED      : bit := '0';
    PRESELECT_I0        : boolean := FALSE;
    PRESELECT_I1        : boolean := FALSE;
    SIM_DEVICE          : string := "ULTRASCALE";
    STARTUP_SYNC : string := "FALSE"
    );

  port(
    O       : out std_ulogic;
    CE0     : in  std_ulogic;
    CE1     : in  std_ulogic;
    I0      : in  std_ulogic;
    I1      : in  std_ulogic;
    IGNORE0 : in  std_ulogic;
    IGNORE1 : in  std_ulogic;
    S0      : in  std_ulogic;
    S1      : in  std_ulogic
    );
end BUFGCTRL;

architecture BUFGCTRL_V of BUFGCTRL is


  -- Parameter encodings and registers
  constant MODULE_NAME                   : string := "BUFGCTRL";
  constant OUTCLK_DELAY                  : time := 100 ps;
  constant CE_TYPE_CE0_HARDSYNC          : std_ulogic := '1';
  constant CE_TYPE_CE0_SYNC              : std_ulogic := '0';
  constant CE_TYPE_CE1_HARDSYNC          : std_ulogic := '1';
  constant CE_TYPE_CE1_SYNC              : std_ulogic := '0';
  constant PRESELECT_I0_FALSE            : std_ulogic := '0';
  constant PRESELECT_I0_TRUE             : std_ulogic := '1';
  constant PRESELECT_I1_FALSE            : std_ulogic := '0';
  constant PRESELECT_I1_TRUE             : std_ulogic := '1';
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
  constant STARTUP_SYNC_FALSE            : std_ulogic := '0';
  constant STARTUP_SYNC_TRUE             : std_ulogic := '1';

  signal CE_TYPE_CE0_BIN         : std_ulogic;
  signal CE_TYPE_CE1_BIN         : std_ulogic;
  signal INIT_OUT_BIN            : std_ulogic;
  signal IS_CE0_INVERTED_BIN     : std_ulogic;
  signal IS_CE1_INVERTED_BIN     : std_ulogic;
  signal IS_I0_INVERTED_BIN      : std_ulogic;
  signal IS_I1_INVERTED_BIN      : std_ulogic;
  signal IS_IGNORE0_INVERTED_BIN : std_ulogic;
  signal IS_IGNORE1_INVERTED_BIN : std_ulogic;
  signal IS_S0_INVERTED_BIN      : std_ulogic;
  signal IS_S1_INVERTED_BIN      : std_ulogic;
  signal PRESELECT_I0_BIN        : std_ulogic;
  signal PRESELECT_I1_BIN        : std_ulogic;
  signal SIM_DEVICE_BIN          : std_logic_vector(4 downto 0);
  signal STARTUP_SYNC_BIN        : std_ulogic;

  signal glblGSR                 : std_ulogic := '1';
  signal glblGRESTORE            : std_ulogic := '0';
  signal xil_attr_test           : boolean := false;
  
  signal O_out                   : std_ulogic;
  
  signal CE0_in     : std_ulogic;
  signal CE1_in     : std_ulogic;
  signal I0_in      : std_ulogic;
  signal I1_in      : std_ulogic;
  signal IGNORE0_in : std_ulogic;
  signal IGNORE1_in : std_ulogic;
  signal S0_in      : std_ulogic;
  signal S1_in      : std_ulogic;
 
  -- begin behavioral model declarations
  signal gwe0_sync          : std_logic_vector(2 downto 0) := "000";
  signal gwe1_sync          : std_logic_vector(2 downto 0) := "000";
  signal gwe_sync           : std_ulogic := 'X';
  signal gwe                : std_ulogic := 'X';
  signal gwe_muxed_sync     : std_ulogic := 'X';
  signal CE0_sync           : std_logic_vector(2 downto 0) := "000";
  signal CE1_sync           : std_logic_vector(2 downto 0) := "000";
  signal ce0_muxed_sync     : std_ulogic := 'X';
  signal ce1_muxed_sync     : std_ulogic := 'X';
  signal CE0_in_dly         : std_ulogic := 'X';
  signal CE1_in_dly         : std_ulogic := 'X';
  signal I0_optinv          : std_ulogic := 'X';
  signal I1_optinv          : std_ulogic := 'X';

  signal d00                : std_ulogic := 'X';
  signal d01                : std_ulogic := 'X';
  signal d10                : std_ulogic := 'X';
  signal d11                : std_ulogic := 'X';
  signal qb00               : std_ulogic := 'X';
  signal qb01               : std_ulogic := 'X';
  signal qb10               : std_ulogic := 'X';
  signal qb11               : std_ulogic := 'X';
  signal cb00               : std_ulogic := 'X';
  signal cb01               : std_ulogic := 'X';
  signal cb10               : std_ulogic := 'X';
  signal cb11               : std_ulogic := 'X';
  signal state0             : std_ulogic := 'X';
  signal state1             : std_ulogic := 'X';
  signal state              : std_logic_vector(1 downto 0) := "XX";

  signal init_done          : std_ulogic := '0';
  signal reset_startup_sync : boolean := false;
  signal reset_ce_type      : boolean := false;
  
  -- end behavioral model declarations

  ---------------------
  --  FUNCTIONS
  ---------------------
  function B2S ( 
    BV: in boolean 
    ) return std_ulogic is 
  begin 
    if (BV) then 
      return '1'; 
    else 
      return '0'; 
    end if;
  end B2S; 

begin

  ---------------------
  --  INPUT PATH DELAYs
  --------------------

  glblGSR        <= TO_X01(GSR);
  glblGRESTORE   <= TO_X01(GRESTORE);

  CE0_in <= '0' when (CE0 = 'U') else CE0 xor IS_CE0_INVERTED_BIN; -- rv 0
  CE1_in <= '0' when (CE1 = 'U') else CE1 xor IS_CE1_INVERTED_BIN; -- rv 0
  I0_in <= I0 xor IS_I0_INVERTED_BIN;
  I1_in <= I1 xor IS_I1_INVERTED_BIN;
  IGNORE0_in <= '0' when (IGNORE0 = 'U') else IGNORE0 xor IS_IGNORE0_INVERTED_BIN; -- rv 0
  IGNORE1_in <= '0' when (IGNORE1 = 'U') else IGNORE1 xor IS_IGNORE1_INVERTED_BIN; -- rv 0
  S0_in <= '0' when (S0 = 'U') else S0 xor IS_S0_INVERTED_BIN; -- rv 0
  S1_in <= '0' when (S1 = 'U') else S1 xor IS_S1_INVERTED_BIN; -- rv 0

 
  --------------------
  --  BEHAVIOR SECTION
  --------------------
  CE_TYPE_CE0_BIN  <= 
      CE_TYPE_CE0_SYNC when ((CE_TYPE_CE0 = "SYNC") or reset_ce_type) else
      CE_TYPE_CE0_HARDSYNC when (CE_TYPE_CE0 = "HARDSYNC") else
      CE_TYPE_CE0_SYNC;

  CE_TYPE_CE1_BIN  <= 
      CE_TYPE_CE1_SYNC when ((CE_TYPE_CE1 = "SYNC") or reset_ce_type) else
      CE_TYPE_CE1_HARDSYNC when (CE_TYPE_CE1 = "HARDSYNC") else
      CE_TYPE_CE1_SYNC;
  
  INIT_OUT_BIN <= '0' when (INIT_OUT=0) else '1';
  
  IS_CE0_INVERTED_BIN <= TO_X01(IS_CE0_INVERTED);
  IS_CE1_INVERTED_BIN <= TO_X01(IS_CE1_INVERTED);
  IS_I0_INVERTED_BIN <= TO_X01(IS_I0_INVERTED);
  IS_I1_INVERTED_BIN <= TO_X01(IS_I1_INVERTED);
  IS_IGNORE0_INVERTED_BIN <= TO_X01(IS_IGNORE0_INVERTED);
  IS_IGNORE1_INVERTED_BIN <= TO_X01(IS_IGNORE1_INVERTED);
  IS_S0_INVERTED_BIN <= TO_X01(IS_S0_INVERTED);
  IS_S1_INVERTED_BIN <= TO_X01(IS_S1_INVERTED);
  PRESELECT_I0_BIN <=
      PRESELECT_I0_FALSE when (PRESELECT_I0 = FALSE) else
      PRESELECT_I0_TRUE  when (PRESELECT_I0 = TRUE)  else
      PRESELECT_I0_FALSE;
  
  PRESELECT_I1_BIN <=
      PRESELECT_I1_FALSE when (PRESELECT_I1 = FALSE) else
      PRESELECT_I1_TRUE  when (PRESELECT_I1 = TRUE)  else
      PRESELECT_I1_FALSE;

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
      STARTUP_SYNC_FALSE when ((STARTUP_SYNC = "FALSE") or reset_startup_sync) else
      STARTUP_SYNC_TRUE when (STARTUP_SYNC = "TRUE") else
      STARTUP_SYNC_FALSE;
  
 

--####################################################################
--#####                     Initialize                           #####
--####################################################################
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- CE_TYPE_CE0 check
      if((xil_attr_test) or
         ((CE_TYPE_CE0 /= "SYNC") and 
          (CE_TYPE_CE0 /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] CE_TYPE_CE0 attribute is set to """));
        Write ( Message, string'(CE_TYPE_CE0));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CE_TYPE_CE1 check
      if((xil_attr_test) or
         ((CE_TYPE_CE1 /= "SYNC") and 
          (CE_TYPE_CE1 /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] CE_TYPE_CE1 attribute is set to """));
        Write ( Message, string'(CE_TYPE_CE1));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- INIT_OUT check
      if((xil_attr_test) or
         ((INIT_OUT /= 0) and 
          (INIT_OUT /= 1))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-104] INIT_OUT attribute is set to "));
        Write ( Message, INIT_OUT);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("0 or "));
        Write ( Message, string'("1. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PRESELECT_I0 check
      if((xil_attr_test) or
         ((PRESELECT_I0 /= TRUE) and
          (PRESELECT_I0 /= FALSE)))then 
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-113] PRESELECT_I0 attribute is set to "));
        Write ( Message, PRESELECT_I0);
        Write ( Message, string'(". Legal values for this attribute are TRUE or FALSE. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- PRESELECT_I1 check
      if((xil_attr_test) or
         ((PRESELECT_I1 /= TRUE) and
          (PRESELECT_I1 /= FALSE)))then 
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-114] PRESELECT_I1 attribute is set to "));
        Write ( Message, PRESELECT_I1);
        Write ( Message, string'(". Legal values for this attribute are TRUE or FALSE. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
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
        Write ( Message, string'("-115] SIM_DEVICE attribute is set to """));
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
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
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
        Write ( Message, string'("-116] STARTUP_SYNC attribute is set to """));
        Write ( Message, string'(STARTUP_SYNC));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-108] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
      assert FALSE
      report Message.all
      severity error;
    end if;
    init_done <= '1';
    wait;
    end process INIPROC;


-- begin behavioral model

----- *** Start
   --   I1_int  <= I1_in when (((SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_CORE    ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_CORE_ES1) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_EDGE    ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_EDGE_ES1) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_EDGE_ES2) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_RF      ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_RF_ES1  ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_AI_RF_ES2  ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_HBM        ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_HBM_ES1    ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_HBM_ES2    ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_PREMIUM    ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_PREMIUM_ES1) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_PREMIUM_ES2) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_PRIME      ) and
   --                       (SIM_DEVICE_BIN /= SIM_DEVICE_VERSAL_PRIME_ES1  ) and
   --                       (STARTUP_SYNC_BIN = STARTUP_SYNC_FALSE) or (enable_I1(2)='1'))
   --          else '0';

  INIPROC2 : process
  variable Message : line;
  begin
      wait until (init_done='1');
      
      if(((SIM_DEVICE /= "VERSAL_AI_CORE"    ) and 
          (SIM_DEVICE /= "VERSAL_AI_CORE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE"    ) and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES2") and 
          (SIM_DEVICE /= "VERSAL_AI_RF"      ) and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES1"  ) and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES2"  ) and 
          (SIM_DEVICE /= "VERSAL_HBM"        ) and 
          (SIM_DEVICE /= "VERSAL_HBM_ES1"    ) and 
          (SIM_DEVICE /= "VERSAL_HBM_ES2"    ) and 
          (SIM_DEVICE /= "VERSAL_NET"    ) and 
          (SIM_DEVICE /= "VERSAL_NET_ES1"    ) and 
          (SIM_DEVICE /= "VERSAL_NET_ES2"    ) and 
          (SIM_DEVICE /= "VERSAL_PREMIUM"    ) and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES1") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES2") and 
          (SIM_DEVICE /= "VERSAL_PRIME"      ) and 
          (SIM_DEVICE /= "VERSAL_PRIME_ES1"  )) and 
          (STARTUP_SYNC_BIN = STARTUP_SYNC_TRUE))then
        Write ( Message, string'("Warning : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-200] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""" and STARTUP_SYNC attribute is set to """));
        Write ( Message, string'(STARTUP_SYNC));
        Write ( Message, string'(""". STARTUP_SYNC functionality is not supported for this DEVICE."));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
        reset_startup_sync <= true;
      end if;

      if(((SIM_DEVICE /= "VERSAL_AI_CORE"    ) and 
          (SIM_DEVICE /= "VERSAL_AI_CORE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE"    ) and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES1") and 
          (SIM_DEVICE /= "VERSAL_AI_EDGE_ES2") and 
          (SIM_DEVICE /= "VERSAL_AI_RF"      ) and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES1"  ) and 
          (SIM_DEVICE /= "VERSAL_AI_RF_ES2"  ) and 
          (SIM_DEVICE /= "VERSAL_HBM"        ) and 
          (SIM_DEVICE /= "VERSAL_HBM_ES1"    ) and 
          (SIM_DEVICE /= "VERSAL_HBM_ES2"    ) and 
          (SIM_DEVICE /= "VERSAL_NET"    ) and 
          (SIM_DEVICE /= "VERSAL_NET_ES1"    ) and 
          (SIM_DEVICE /= "VERSAL_NET_ES2"    ) and 
          (SIM_DEVICE /= "VERSAL_PREMIUM"    ) and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES1") and 
          (SIM_DEVICE /= "VERSAL_PREMIUM_ES2") and 
          (SIM_DEVICE /= "VERSAL_PRIME"      ) and 
          (SIM_DEVICE /= "VERSAL_PRIME_ES1"  )) and 
          (CE_TYPE_CE0_BIN = CE_TYPE_CE0_HARDSYNC or CE_TYPE_CE1_BIN=CE_TYPE_CE1_HARDSYNC))then
        Write ( Message, string'("Warning : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-201] SIM_DEVICE attribute is set to """));
        Write ( Message, string'(SIM_DEVICE));
        Write ( Message, string'(""" ; CE_TYPE_CE0 attribute is set to """));
        Write ( Message, string'(CE_TYPE_CE0));
        Write ( Message, string'(""" and CE_TYPE_CE1 attribute is set to """));
        Write ( Message, string'(CE_TYPE_CE1));
        Write ( Message, string'(""". HARDSYNC functionality is not supported for this DEVICE."));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCTRL_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
        reset_ce_type <= true;
      end if;

  end process INIPROC2;
 
  gwe       <= not (glblGSR);

  I0_optinv <= INIT_OUT_BIN xor I0_in;
  I1_optinv <= INIT_OUT_BIN xor I1_in;


--####################################################################
--#####                            GWE                         #####
--####################################################################
  prcs_gwe0:process(I0_optinv, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      gwe0_sync    <= "000";
    elsif (rising_edge(glblGRESTORE)) then
      gwe0_sync    <= "000";
    elsif (falling_edge(I0_optinv)) then
      gwe0_sync <= gwe0_sync(1 downto 0) & gwe;
    end if;
  end process prcs_gwe0;

  prcs_gwe1:process(I1_optinv, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      gwe1_sync    <= "000";
    elsif (rising_edge(glblGRESTORE)) then
      gwe1_sync    <= "000";
    elsif (falling_edge(I1_optinv)) then
      gwe1_sync <= gwe1_sync(1 downto 0) & gwe;
    end if;
  end process prcs_gwe1;

  gwe_sync <= gwe0_sync(2) when  (PRESELECT_I0_BIN=PRESELECT_I0_TRUE ) else
              gwe1_sync(2) when  (PRESELECT_I1_BIN=PRESELECT_I1_TRUE ) else
             (gwe0_sync(2) or gwe1_sync(2));

  gwe_muxed_sync <= gwe_sync when (STARTUP_SYNC_BIN=STARTUP_SYNC_TRUE) else gwe;


--####################################################################
--#####                            CE                          #####
--####################################################################

  CE0_in_dly <= transport CE0_in after 1 ps;
  CE1_in_dly <= transport CE1_in after 1 ps;

  prcs_ce0:process(I0_optinv, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      CE0_sync    <= "000";
    elsif (rising_edge(glblGRESTORE)) then
      CE0_sync    <= "000";
    elsif (rising_edge(I0_optinv)) then
      CE0_sync <= CE0_sync(1 downto 0) & CE0_in_dly;
    end if;
  end process prcs_ce0;

  prcs_ce1:process(I1_optinv, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      CE1_sync    <= "000";
    elsif (rising_edge(glblGRESTORE)) then
      CE1_sync    <= "000";
    elsif (rising_edge(I1_optinv)) then
      CE1_sync <= CE1_sync(1 downto 0) & CE1_in_dly;
    end if;
  end process prcs_ce1;

  ce0_muxed_sync <= CE0_sync(2) when (CE_TYPE_CE0_BIN=CE_TYPE_CE0_HARDSYNC) else CE0_in;
  ce1_muxed_sync <= CE1_sync(2) when (CE_TYPE_CE1_BIN=CE_TYPE_CE1_HARDSYNC) else CE1_in;

--####################################################################
  --d00 <= B2S(not((state1='1') and (S0_in         ='1')));
  --d01 <= B2S(not((qb00  ='1') and (ce0_muxed_sync='1')));
  --d10 <= B2S(not((state0='1') and (S1_in         ='1')));
  --d11 <= B2S(not((qb10  ='1') and (ce1_muxed_sync='1')));

  d00 <= not(state1 and S0_in         );
  d01 <= not(qb00   and ce0_muxed_sync);
  d10 <= not(state0 and S1_in         );
  d11 <= not(qb10   and ce1_muxed_sync);

  cb00 <= not( ((not(gwe_muxed_sync)) or ((not(IGNORE0_in)) and (not(I0_optinv)))));
  cb01 <= not( ((not(gwe_muxed_sync)) or ((not(IGNORE0_in)) and      I0_optinv  )));
  cb10 <= not( ((not(gwe_muxed_sync)) or ((not(IGNORE1_in)) and (not(I1_optinv)))));
  cb11 <= not( ((not(gwe_muxed_sync)) or ((not(IGNORE1_in)) and      I1_optinv  )));
 

  prcs_cb00: process( d00, cb00, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      if(PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb00      <= '1';
      else
        qb00      <= '0';
      end if;
    elsif (rising_edge(glblGRESTORE)) then
      if(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_FALSE) then
        qb00      <= '0';
      elsif(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb00      <= '1';
      end if;
    elsif (cb00='1') then
      qb00 <= transport (not(d00)) after 1 ps; 
    end if;
  end process prcs_cb00;
   
  prcs_cb01: process( d01, cb01, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      if(PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb01      <= '1'; 
      else
        qb01      <= '0'; 
      end if;
    elsif (rising_edge(glblGRESTORE)) then
      if(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_FALSE) then
        qb01      <= '0';
      elsif(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb01      <= '1';
      end if;
    elsif(cb01='1') then
      qb01 <= transport (not (d01)) after 1 ps; 
    end if;
  end process prcs_cb01;

   
  prcs_cb10: process( d10, cb10, init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      if(PRESELECT_I1_BIN=PRESELECT_I1_TRUE) then
        qb10      <= '1';
      else
        qb10      <= '0';
      end if;
    elsif (rising_edge(glblGRESTORE)) then
      if(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_FALSE) then
        qb10      <= '0';
      elsif(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb10      <= '1';
      end if;
    elsif(cb10='1') then
      qb10 <= transport (not(d10)) after 1 ps; 
    end if;
  end process prcs_cb10;
   
  prcs_cb11: process( d11, cb11,  init_done, glblGRESTORE)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      if(PRESELECT_I1_BIN=PRESELECT_I1_TRUE) then
        qb11      <= '1';
      else
        qb11      <= '0';
      end if;
    elsif (rising_edge(glblGRESTORE)) then
      if(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_FALSE) then
        qb11      <= '0';
      elsif(glblGRESTORE='1' and PRESELECT_I0_BIN=PRESELECT_I0_TRUE) then
        qb11      <= '1';
      end if;
    elsif(cb11='1') then
      qb11 <= transport (not(d11)) after 1 ps; 
    end if;
  end process prcs_cb11;
  
  prcs_state:process( qb01,qb11, gwe_muxed_sync)
  begin
    state0 <=  not(qb01 or (not(gwe_muxed_sync)));
    state1 <=  not(qb11 or (not(gwe_muxed_sync)));
  end process prcs_state;
  
  state  <= state1 & state0;

  prcs_outmux: process(state, I0_in, I1_in, INIT_OUT_BIN, init_done)
  begin
    if (init_done='1' and rising_edge(init_done) ) then
      O_out <= '0';
    else
      case (state) is
        when "00"   => O_out <=           '0'         ;
        when "01"   => O_out <= transport I1_in       ;
        when "10"   => O_out <= transport I0_in       ;
        when "11"   => O_out <= transport INIT_OUT_BIN;
        when others => O_out <=           'X'         ;  
      end case;
    end if;
  end process prcs_outmux;

  O <= O_out;



-- end behavioral model

end BUFGCTRL_V;
