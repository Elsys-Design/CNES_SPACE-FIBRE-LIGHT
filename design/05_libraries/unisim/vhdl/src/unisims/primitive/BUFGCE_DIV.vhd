-------------------------------------------------------------------------------
-- Copyright (c) 1995/2019 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2019.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        BUFGCE_DIV
-- /___/   /\      Filename    : BUFGCE_DIV.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFGCE_DIV -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity BUFGCE_DIV is
  generic (
    BUFGCE_DIVIDE : integer := 1;
    CE_TYPE : string := "SYNC";
    HARDSYNC_CLR : string := "FALSE";
    IS_CE_INVERTED : bit := '0';
    IS_CLR_INVERTED : bit := '0';
    IS_I_INVERTED : bit := '0';
    SIM_DEVICE : string := "ULTRASCALE";
    STARTUP_SYNC : string := "FALSE"
  );
  
  port (
    O                    : out std_ulogic;
    CE                   : in std_ulogic;
    CLR                  : in std_ulogic;
    I                    : in std_ulogic
  );
end BUFGCE_DIV;

architecture BUFGCE_DIV_V of BUFGCE_DIV is

  constant MODULE_NAME : string := "BUFGCE_DIV";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers
  constant CE_TYPE_HARDSYNC : std_ulogic := '1';
  constant CE_TYPE_SYNC : std_ulogic := '0';
  constant HARDSYNC_CLR_FALSE : std_ulogic := '0';
  constant HARDSYNC_CLR_TRUE : std_ulogic := '1';
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
  constant STARTUP_SYNC_FALSE : std_ulogic := '0';
  constant STARTUP_SYNC_TRUE : std_ulogic := '1';

  signal BUFGCE_DIVIDE_BIN : integer := 1;
  signal CE_TYPE_BIN : std_ulogic;
  signal HARDSYNC_CLR_BIN : std_ulogic;
  signal IS_CE_INVERTED_BIN : std_ulogic;
  signal IS_CLR_INVERTED_BIN : std_ulogic;
  signal IS_I_INVERTED_BIN : std_ulogic;
  signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
  signal STARTUP_SYNC_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal O_out : std_ulogic;
  
  signal CE_in : std_ulogic;
  signal CLR_in : std_ulogic;
  signal I_in : std_ulogic;
  
  -- begin behavioral model declarations
  signal ce_en	        : std_ulogic := '0';
  signal i_ce	        : std_ulogic := '0';

  signal divide   	: boolean    := false;
  signal FIRST_TOGGLE_COUNT     : integer    := -1;
  signal SECOND_TOGGLE_COUNT    : integer    := -1;
  
  signal gwe_sync          : std_logic_vector(2 downto 0) := "000";
  signal ce_sync           : std_logic_vector(2 downto 0) := "000";
  signal clr_sync          : std_logic_vector(2 downto 0) := "000";
  signal ce_muxed_sync     : std_ulogic := '0';
  signal clr_muxed_sync    : std_ulogic := '0';
  signal clr_muxed_xrm     : std_ulogic := '0';
  signal gsr_muxed_sync    : std_ulogic := '0';
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  O <= O_out;
  
  CE_in <= '1' when (CE = 'U') else CE xor IS_CE_INVERTED_BIN; -- rv 1
  CLR_in <= '0' when (CLR = 'U') else CLR xor IS_CLR_INVERTED_BIN; -- rv 0
  I_in <= I xor IS_I_INVERTED_BIN;
  
  BUFGCE_DIVIDE_BIN <= BUFGCE_DIVIDE;
  
  CE_TYPE_BIN <= 
      CE_TYPE_SYNC when (CE_TYPE = "SYNC") else
      CE_TYPE_HARDSYNC when (CE_TYPE = "HARDSYNC") else
      CE_TYPE_SYNC;
  
  HARDSYNC_CLR_BIN <= 
      HARDSYNC_CLR_FALSE when (HARDSYNC_CLR = "FALSE") else
      HARDSYNC_CLR_TRUE when (HARDSYNC_CLR = "TRUE") else
      HARDSYNC_CLR_FALSE;
  
  IS_CE_INVERTED_BIN <= TO_X01(IS_CE_INVERTED);
  IS_CLR_INVERTED_BIN <= TO_X01(IS_CLR_INVERTED);
  IS_I_INVERTED_BIN <= TO_X01(IS_I_INVERTED);
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
  
  STARTUP_SYNC_BIN <= 
      STARTUP_SYNC_FALSE when (STARTUP_SYNC = "FALSE") else
      STARTUP_SYNC_TRUE when (STARTUP_SYNC = "TRUE") else
      STARTUP_SYNC_FALSE;
  
  
  INIPROC : process
  variable Message : line;
  variable attr_err : boolean := false;
  begin
    -------- BUFGCE_DIVIDE check
      if((xil_attr_test) or
         ((BUFGCE_DIVIDE /= 1) and 
          (BUFGCE_DIVIDE /= 2) and 
          (BUFGCE_DIVIDE /= 3) and 
          (BUFGCE_DIVIDE /= 4) and 
          (BUFGCE_DIVIDE /= 5) and 
          (BUFGCE_DIVIDE /= 6) and 
          (BUFGCE_DIVIDE /= 7) and 
          (BUFGCE_DIVIDE /= 8))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-101] BUFGCE_DIVIDE attribute is set to "));
        Write ( Message, BUFGCE_DIVIDE);
        Write ( Message, string'(". Legal values for this attribute are "));
        Write ( Message, string'("1, "));
        Write ( Message, string'("2, "));
        Write ( Message, string'("3, "));
        Write ( Message, string'("4, "));
        Write ( Message, string'("5, "));
        Write ( Message, string'("6, "));
        Write ( Message, string'("7 or "));
        Write ( Message, string'("8. "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- CE_TYPE check
      if((xil_attr_test) or
         ((CE_TYPE /= "SYNC") and 
          (CE_TYPE /= "HARDSYNC"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-102] CE_TYPE attribute is set to """));
        Write ( Message, string'(CE_TYPE));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""SYNC"" or "));
        Write ( Message, string'("""HARDSYNC"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    -------- HARDSYNC_CLR check
      if((xil_attr_test) or
         ((HARDSYNC_CLR /= "FALSE") and 
          (HARDSYNC_CLR /= "TRUE"))) then
        attr_err := true;
        Write ( Message, string'("Error : [Unisim "));
        Write ( Message, string'(MODULE_NAME));
        Write ( Message, string'("-103] HARDSYNC_CLR attribute is set to """));
        Write ( Message, string'(HARDSYNC_CLR));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
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
        Write ( Message, string'("-107] SIM_DEVICE attribute is set to """));
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
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
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
        Write ( Message, string'("-108] STARTUP_SYNC attribute is set to """));
        Write ( Message, string'(STARTUP_SYNC));
        Write ( Message, string'(""". Legal values for this attribute are "));
        Write ( Message, string'("""FALSE"" or "));
        Write ( Message, string'("""TRUE"". "));
        Write ( Message, string'("Instance "));
        Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
        writeline(output, Message);
        DEALLOCATE (Message);
      end if;
    if  (attr_err) then
      Write ( Message, string'("[Unisim "));
      Write ( Message, string'(MODULE_NAME));
      Write ( Message, string'("-106] Attribute Error(s) encountered. "));
      Write ( Message, string'("Instance "));
      Write ( Message, string'(BUFGCE_DIV_V'PATH_NAME));
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
        gwe_sync <= gwe_sync(1 downto 0) & not(glblGSR);
      end if;  
    end process prcs_gwe;

    gsr_muxed_sync <= (not(gwe_sync(2))) when (STARTUP_SYNC= "TRUE") else glblGSR;
 
    prcs_clr : process( I_in)
    begin
      if(falling_edge(I_in))then
        clr_sync <= clr_sync(1 downto 0) & CLR_in;
      end if;  
    end process prcs_clr;

   clr_muxed_sync <= clr_sync(2) when (HARDSYNC_CLR = "TRUE") else CLR_in;
   clr_muxed_xrm  <= '1' when (clr_muxed_sync ='X') else clr_muxed_sync;


   prcs_ce : process( I_in)
    begin
      if(rising_edge(I_in))then
        ce_sync <= ce_sync(1 downto 0) & CE_in;
      end if;  
    end process prcs_ce;

    ce_muxed_sync <= ce_sync(2) when (CE_TYPE = "HARDSYNC") else  CE_in;





--####################################################################
--#####                     Initialize                           #####
--####################################################################

    prcs_init:process
    variable FIRST_TOGGLE_COUNT_var  : integer    := -1;
    variable SECOND_TOGGLE_COUNT_var : integer    := -1;
    variable divide_var  	   : boolean    := false;
    variable Message : line;
    variable attr_err : boolean := false;

    begin
      if(BUFGCE_DIVIDE = 1) then
         divide_var    := false;
         FIRST_TOGGLE_COUNT_var  := 1;
         SECOND_TOGGLE_COUNT_var := 1;
      elsif(BUFGCE_DIVIDE = 2) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 2;
      elsif(BUFGCE_DIVIDE = 3) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFGCE_DIVIDE = 4) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(BUFGCE_DIVIDE = 5) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFGCE_DIVIDE = 6) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(BUFGCE_DIVIDE = 7) then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 8;
      else
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 8;
         SECOND_TOGGLE_COUNT_var := 8;
      end if;


      FIRST_TOGGLE_COUNT  <= FIRST_TOGGLE_COUNT_var; 
      SECOND_TOGGLE_COUNT <= SECOND_TOGGLE_COUNT_var; 

      divide    <= divide_var;

    wait;
    end process prcs_init;

    prcs_lce : process( I_in, gsr_muxed_sync, ce_muxed_sync, clr_muxed_xrm)
    begin
      if (gsr_muxed_sync = '1' or clr_muxed_xrm = '1') then
        ce_en <= '0';
      elsif (I_in = '0') then
        ce_en <= ce_muxed_sync;
      end if;
    end process prcs_lce;

    i_ce  <= I_in and ce_en;

--####################################################################
--#####                       CLK-I                              #####
--####################################################################

    prcs_I:process(i_ce, gsr_muxed_sync, clr_muxed_xrm)
    variable clk_count          : integer := 0;
    variable toggle_count       : integer := 0;
    variable first_half_period  : boolean := true;
    variable FIRST_RISE         : boolean := true;
    begin
      if(divide = false) then
        O_out <= i_ce;
      else --divide=true 
        if((gsr_muxed_sync = '1') or (clr_muxed_xrm = '1')) then
          O_out       <= '0';
          clk_count  := 1;
          first_half_period  := true;
          FIRST_RISE := true;
        elsif((gsr_muxed_sync = '0') and (clr_muxed_xrm = '0')) then
          if((i_ce='1') and (FIRST_RISE)) then
            O_out <= '1';
            clk_count  := 1;
            first_half_period        := true;
            toggle_count := FIRST_TOGGLE_COUNT;
            FIRST_RISE := false;
          elsif ((i_ce'event) and ( FIRST_RISE = false)) then
            if(clk_count = toggle_count) then
              O_out <= not O_out;
              clk_count := 1;
              if(first_half_period = false) then
                toggle_count := FIRST_TOGGLE_COUNT;
              else
                toggle_count := SECOND_TOGGLE_COUNT;
              end if;
              first_half_period := not first_half_period;
            else
               clk_count := clk_count + 1;
            end if;
          end if;
        end if;
      end if;
    end process prcs_I;

--####################################################################
--#####                         OUTPUT                           #####
--####################################################################
--####################################################################

-- end behavioral model

end BUFGCE_DIV_V;
