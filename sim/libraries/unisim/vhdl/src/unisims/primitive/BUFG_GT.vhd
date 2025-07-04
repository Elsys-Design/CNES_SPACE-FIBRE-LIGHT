-------------------------------------------------------------------------------
-- Copyright (c) 1995/2019 Xilinx, Inc.
--  All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx 
-- \   \   \/      Version     : 2019.2
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        Clock Buffer Driven by Gigabit Transceiver
-- /___/   /\      Filename    : BUFG_GT.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL BUFG_GT -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

  entity BUFG_GT is
  generic (
    SIM_DEVICE : string := "ULTRASCALE";
    STARTUP_SYNC : string := "FALSE"
  );
  
    port (
      O                    : out std_ulogic;
      CE                   : in std_ulogic;
      CEMASK               : in std_ulogic;
      CLR                  : in std_ulogic;
      CLRMASK              : in std_ulogic;
      DIV                  : in std_logic_vector(2 downto 0);
      I                    : in std_ulogic      
    );
  end BUFG_GT;

  architecture BUFG_GT_V of BUFG_GT is
    
    constant MODULE_NAME : string := "BUFG_GT";
    constant OUTCLK_DELAY : time := 100 ps;

    -- Parameter encodings and registers
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
    constant STARTUP_SYNC_FALSE            : std_ulogic := '0';
    constant STARTUP_SYNC_TRUE             : std_ulogic := '1';
      
    signal SIM_DEVICE_BIN : std_logic_vector(4 downto 0);
    signal STARTUP_SYNC_BIN : std_ulogic;
      
    signal glblGSR       : std_ulogic;
    signal xil_attr_test : boolean := false;
      
    signal O_out : std_ulogic;
    
    signal CEMASK_in : std_ulogic;
    signal CE_in : std_ulogic;
    signal CLRMASK_in : std_ulogic;
    signal CLR_in : std_ulogic;
    signal DIV_in : std_logic_vector(2 downto 0);
    signal I_in : std_ulogic;

    -- begin behavioral model declarations
    signal ce_en	                  : std_ulogic := '0';
    signal i_ce	                      : std_ulogic := '0';
    signal O_bufg_gt                   : std_ulogic := '0';

    signal divide   	              : boolean    := false;
    signal FIRST_TOGGLE_COUNT         : integer    := -1;
    signal SECOND_TOGGLE_COUNT        : integer    := -1;

    signal ce_sync1                   : std_ulogic := '0';
    signal ce_sync2                   : std_ulogic := '0';
    signal ce_sync                    : std_ulogic := '0';
    signal clr_sync1                  : std_ulogic := '0';
    signal clr_sync2                  : std_ulogic := '0';
    signal clr_sync                   : std_ulogic := '0';
    signal ce_masked                  : std_ulogic;
    signal clr_masked                 : std_ulogic;
    signal clr_inv                    : std_logic;
    signal clrmask_inv                : std_logic;
    signal clk_count_s                : integer := 0;
    signal first_half_period_s        : boolean;
    signal FIRST_RISE_s               : boolean;

    signal sim_device_versal_or_later : boolean := false;
    signal gwe_sync                   : std_logic_vector(2 downto 0) := "000";
    signal gsr_muxed_sync             : std_ulogic := '0';
  

    -- end behavioral model declarations
    
  begin
    glblGSR <= TO_X01(GSR);
    
    O <= O_out;
    
    CEMASK_in <= '0' when (CEMASK = 'U') else CEMASK; -- rv 0
    CE_in <= '1' when (CE = 'U') else CE; -- rv 1
    CLRMASK_in <= '0' when (CLRMASK = 'U') else CLRMASK; -- rv 0
    CLR_in <= '0' when (CLR = 'U') else CLR; -- rv 0
    DIV_in(0) <= '0' when (DIV(0) = 'U') else DIV(0); -- rv 0
    DIV_in(1) <= '0' when (DIV(1) = 'U') else DIV(1); -- rv 0
    DIV_in(2) <= '0' when (DIV(2) = 'U') else DIV(2); -- rv 0
    I_in <= I;

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
          Write ( Message, string'("-101] SIM_DEVICE attribute is set to """));
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
          Write ( Message, string'(BUFG_GT_V'PATH_NAME));
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
          Write ( Message, string'(BUFG_GT_V'PATH_NAME));
          writeline(output, Message);
          DEALLOCATE (Message);
        end if;

        if((xil_attr_test) or
           ((SIM_DEVICE = "VERSAL_AI_CORE") or 
            (SIM_DEVICE = "VERSAL_AI_CORE_ES1") or 
            (SIM_DEVICE = "VERSAL_AI_EDGE") or 
            (SIM_DEVICE = "VERSAL_AI_EDGE_ES1") or 
            (SIM_DEVICE = "VERSAL_AI_EDGE_ES2") or 
            (SIM_DEVICE = "VERSAL_AI_RF") or 
            (SIM_DEVICE = "VERSAL_AI_RF_ES1") or 
            (SIM_DEVICE = "VERSAL_AI_RF_ES2") or 
            (SIM_DEVICE = "VERSAL_HBM") or 
            (SIM_DEVICE = "VERSAL_HBM_ES1") or 
            (SIM_DEVICE = "VERSAL_HBM_ES2") or 
            (SIM_DEVICE = "VERSAL_NET") or 
            (SIM_DEVICE = "VERSAL_NET_ES1") or 
            (SIM_DEVICE = "VERSAL_NET_ES2") or 
            (SIM_DEVICE = "VERSAL_PREMIUM") or 
            (SIM_DEVICE = "VERSAL_PREMIUM_ES1") or 
            (SIM_DEVICE = "VERSAL_PREMIUM_ES2") or 
            (SIM_DEVICE = "VERSAL_PRIME") or 
            (SIM_DEVICE = "VERSAL_PRIME_ES1"))) then 
          sim_device_versal_or_later <= true;
        else
          sim_device_versal_or_later <= false;
        end if;

        
        if  (attr_err) then
          Write ( Message, string'("[Unisim "));
          Write ( Message, string'(MODULE_NAME));
          Write ( Message, string'("-103] Attribute Error(s) encountered. "));
          Write ( Message, string'("Instance "));
          Write ( Message, string'(BUFG_GT_V'PATH_NAME));
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

    gsr_muxed_sync <= (not(gwe_sync(2))) when (STARTUP_SYNC_BIN = STARTUP_SYNC_TRUE) else glblGSR;
 

  --####################################################################
  --#####                     Initialize                           #####
  --####################################################################

    prcs_init:process (DIV_in)
    variable FIRST_TOGGLE_COUNT_var  : integer    := -1;
    variable SECOND_TOGGLE_COUNT_var : integer    := -1;
    variable divide_var  	           : boolean    := false;

    begin
      if(DIV_in = "000") then
         divide_var    := false;
         FIRST_TOGGLE_COUNT_var  := 1;
         SECOND_TOGGLE_COUNT_var := 1;
      elsif(DIV_in = "001") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 2;
      elsif(DIV_in = "010") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 2;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(DIV_in = "011") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 4;
      elsif(DIV_in = "100") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 4;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(DIV_in = "101") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 6;
      elsif(DIV_in = "110") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 6;
         SECOND_TOGGLE_COUNT_var := 8;
      elsif(DIV_in = "111") then
         divide_var    := true;
         FIRST_TOGGLE_COUNT_var  := 8;
         SECOND_TOGGLE_COUNT_var := 8;
      end if;

      FIRST_TOGGLE_COUNT  <= FIRST_TOGGLE_COUNT_var; 
      SECOND_TOGGLE_COUNT <= SECOND_TOGGLE_COUNT_var; 

      divide    <= divide_var;

    end process prcs_init;
  
    clr_inv <= not CLR_in;

    prcs_synce : process(I_in, gsr_muxed_sync)
    begin
      if(gsr_muxed_sync = '1') then
        ce_sync1 <= '0';
        ce_sync2 <= '0';
      elsif (I_in'event and I_in = '1') then
        ce_sync1 <= CE_in;
        ce_sync2 <= ce_sync1;
      end if;
    end process prcs_synce;  

    ce_sync <= CE_in when sim_device_versal_or_later else ce_sync2;
    
    prcs_synclr : process(I_in, clr_inv)
    begin
      if(clr_inv = '0') then
        clr_sync1 <= '0';
        clr_sync2 <= '0';
      elsif (I_in'event and I_in = '1') then
        clr_sync1 <= '1';
        clr_sync2 <= clr_sync1;
      end if;
    end process prcs_synclr;
    
    clr_sync <= clr_inv when sim_device_versal_or_later else clr_sync2;
  
    clrmask_inv <= not CLRMASK_in;
    ce_masked <= ce_sync or CEMASK_in;
    clr_masked <= (not clr_sync) and clrmask_inv;

    prcs_lce : process(gsr_muxed_sync, clr_masked, I_in, ce_masked)
    begin
      if(gsr_muxed_sync = '1' or clr_masked = '1') then
        ce_en <= '0';
      elsif (I_in = '0') then
        ce_en <= ce_masked;
      end if; 
    end process prcs_lce;

    i_ce  <= I_in and ce_en;


  --####################################################################
  --#####                       CLK-I                              #####
  --####################################################################

    prcs_I:process(i_ce, gsr_muxed_sync, clr_masked)
      variable clk_count      : integer := 0;
      variable toggle_count   : integer := 0;
      variable first_half_period : boolean := false;
      variable FIRST_RISE        : boolean := true;

    begin
      if(not divide) then
        O_bufg_gt <= i_ce;
      else
        if((gsr_muxed_sync = '1') or (clr_masked = '1')) then
          O_bufg_gt       <= '0';
          clk_count  := 1;
          first_half_period  := true;
          FIRST_RISE := true;
        elsif((gsr_muxed_sync = '0') and (clr_masked = '0')) then
          if((i_ce='1') and (FIRST_RISE)) then
            O_bufg_gt <= '1';
            clk_count  := 1;
            first_half_period        := true;
            toggle_count := FIRST_TOGGLE_COUNT;
            FIRST_RISE := false;
          elsif ((clk_count = SECOND_TOGGLE_COUNT) and ( first_half_period = false)) then
            O_bufg_gt <= not O_bufg_gt;
            clk_count  := 1;
            first_half_period := true;
          elsif ((clk_count = FIRST_TOGGLE_COUNT) and ( first_half_period = true)) then
            O_bufg_gt <= not O_bufg_gt;
            clk_count  := 1;
            first_half_period := false;
          elsif (FIRST_RISE = false) then
            clk_count := clk_count + 1;
          end if;
        end if;
      end if;

      clk_count_s         <= clk_count;
      first_half_period_s <= first_half_period;
      FIRST_RISE_s        <= FIRST_RISE;


    end process prcs_I;

  --####################################################################
  --#####                         OUTPUT                           #####
  --####################################################################
    prcs_output:process(O_bufg_gt)
    begin
      if(sim_device_versal_or_later) then
        O_out <= O_bufg_gt;
      else
        O_out <= reject 1 ps inertial O_bufg_gt after 1 ps; 
      end if;
    end process prcs_output;
  --####################################################################
-- end behavioral model
 
 end BUFG_GT_V;
