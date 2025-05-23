-------------------------------------------------------------------------------
-- Copyright (c) 1995/2019 Xilinx, Inc.
-- All Right Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /     Vendor      : Xilinx
-- \   \   \/      Version     : 2019.1
--  \   \          Description : Xilinx Functional Simulation Library Component
--  /   /                        RAM32X16DR8
-- /___/   /\      Filename    : RAM32X16DR8.vhd
-- \   \  /  \
--  \___\/\___\
--
-------------------------------------------------------------------------------
-- Revision
--
-- End Revision
-------------------------------------------------------------------------------

----- CELL RAM32X16DR8 -----

library IEEE;
use IEEE.NUMERIC_STD.all;
use IEEE.STD_LOGIC_1164.all;

library STD;
use STD.TEXTIO.all;

library UNISIM;
use UNISIM.VPKG.all;
use UNISIM.VCOMPONENTS.all;

entity RAM32X16DR8 is
  generic (
    IS_WCLK_INVERTED : bit := '0'
  );
  
  port (
    DOA                  : out std_ulogic;
    DOB                  : out std_ulogic;
    DOC                  : out std_ulogic;
    DOD                  : out std_ulogic;
    DOE                  : out std_ulogic;
    DOF                  : out std_ulogic;
    DOG                  : out std_ulogic;
    DOH                  : out std_logic_vector(1 downto 0);
    ADDRA                : in std_logic_vector(5 downto 0);
    ADDRB                : in std_logic_vector(5 downto 0);
    ADDRC                : in std_logic_vector(5 downto 0);
    ADDRD                : in std_logic_vector(5 downto 0);
    ADDRE                : in std_logic_vector(5 downto 0);
    ADDRF                : in std_logic_vector(5 downto 0);
    ADDRG                : in std_logic_vector(5 downto 0);
    ADDRH                : in std_logic_vector(4 downto 0);
    DIA                  : in std_logic_vector(1 downto 0);
    DIB                  : in std_logic_vector(1 downto 0);
    DIC                  : in std_logic_vector(1 downto 0);
    DID                  : in std_logic_vector(1 downto 0);
    DIE                  : in std_logic_vector(1 downto 0);
    DIF                  : in std_logic_vector(1 downto 0);
    DIG                  : in std_logic_vector(1 downto 0);
    DIH                  : in std_logic_vector(1 downto 0);
    WCLK                 : in std_ulogic;
    WE                   : in std_ulogic
  );
end RAM32X16DR8;

architecture RAM32X16DR8_V of RAM32X16DR8 is

  constant MODULE_NAME : string := "RAM32X16DR8";
  constant OUTCLK_DELAY : time := 100 ps;
  
-- Parameter encodings and registers

  signal IS_WCLK_INVERTED_BIN : std_ulogic;

  signal glblGSR       : std_ulogic;
  signal xil_attr_test : boolean := false;
  
  signal DOA_out : std_ulogic;
  signal DOB_out : std_ulogic;
  signal DOC_out : std_ulogic;
  signal DOD_out : std_ulogic;
  signal DOE_out : std_ulogic;
  signal DOF_out : std_ulogic;
  signal DOG_out : std_ulogic;
  signal DOH_out : std_logic_vector(1 downto 0);
  
  signal ADDRA_in : std_logic_vector(5 downto 0);
  signal ADDRB_in : std_logic_vector(5 downto 0);
  signal ADDRC_in : std_logic_vector(5 downto 0);
  signal ADDRD_in : std_logic_vector(5 downto 0);
  signal ADDRE_in : std_logic_vector(5 downto 0);
  signal ADDRF_in : std_logic_vector(5 downto 0);
  signal ADDRG_in : std_logic_vector(5 downto 0);
  signal ADDRH_in : std_logic_vector(4 downto 0);
  signal DIA_in : std_logic_vector(1 downto 0);
  signal DIB_in : std_logic_vector(1 downto 0);
  signal DIC_in : std_logic_vector(1 downto 0);
  signal DID_in : std_logic_vector(1 downto 0);
  signal DIE_in : std_logic_vector(1 downto 0);
  signal DIF_in : std_logic_vector(1 downto 0);
  signal DIG_in : std_logic_vector(1 downto 0);
  signal DIH_in : std_logic_vector(1 downto 0);
  signal WCLK_in : std_ulogic;
  signal WE_in : std_ulogic;
  
  -- begin behavioral model declarations

  signal MEM_a : std_logic_vector( 63 downto 0 );
  signal MEM_b : std_logic_vector( 63 downto 0 );
  signal MEM_c : std_logic_vector( 63 downto 0 );
  signal MEM_d : std_logic_vector( 63 downto 0 );
  signal MEM_e : std_logic_vector( 63 downto 0 );
  signal MEM_f : std_logic_vector( 63 downto 0 );
  signal MEM_g : std_logic_vector( 63 downto 0 );
  signal MEM_h : std_logic_vector( 63 downto 0 );
  
  -- end behavioral model declarations
  
  begin
  glblGSR     <= TO_X01(GSR);
  
  DOA <= DOA_out;
  DOB <= DOB_out;
  DOC <= DOC_out;
  DOD <= DOD_out;
  DOE <= DOE_out;
  DOF <= DOF_out;
  DOG <= DOG_out;
  DOH <= DOH_out;
  
  ADDRA_in <= ADDRA;
  ADDRB_in <= ADDRB;
  ADDRC_in <= ADDRC;
  ADDRD_in <= ADDRD;
  ADDRE_in <= ADDRE;
  ADDRF_in <= ADDRF;
  ADDRG_in <= ADDRG;
  ADDRH_in <= ADDRH;
  DIA_in <= DIA;
  DIB_in <= DIB;
  DIC_in <= DIC;
  DID_in <= DID;
  DIE_in <= DIE;
  DIF_in <= DIF;
  DIG_in <= DIG;
  DIH_in <= DIH;
  WCLK_in <= WCLK xor IS_WCLK_INVERTED_BIN;
  WE_in <= '1' when (WE = 'U') else WE; -- rv 1
  
  IS_WCLK_INVERTED_BIN <= TO_X01(IS_WCLK_INVERTED);
-- begin behavioral model

  QA_P : process ( ADDRA_in, MEM_a)
    variable Index_a : integer := 62;
  begin
    Index_a := SLV_TO_INT(SLV => ADDRA_in);
    DOA_out <= MEM_a(Index_a);
  end process QA_P;

  QB_P : process ( ADDRB_in, MEM_b)
    variable Index_b : integer := 62;
  begin
    Index_b := SLV_TO_INT(SLV => ADDRB_in);
    DOB_out <= MEM_b(Index_b);
  end process QB_P;

  QC_P : process ( ADDRC_in, MEM_c)
    variable Index_c : integer := 62;
  begin
    Index_c := SLV_TO_INT(SLV => ADDRC_in);
    DOC_out <= MEM_c(Index_c);
  end process QC_P;

  QD_P : process ( ADDRD_in, MEM_d)
    variable Index_d : integer := 62;
  begin
    Index_d := SLV_TO_INT(SLV => ADDRD_in);
    DOD_out <= MEM_d(Index_d);
  end process QD_P;

  QE_P : process ( ADDRE_in, MEM_e)
    variable Index_e : integer := 62;
  begin
    Index_e := SLV_TO_INT(SLV => ADDRE_in);
    DOE_out <= MEM_e(Index_e);
  end process QE_P;

  QF_P : process ( ADDRF_in, MEM_f)
    variable Index_f : integer := 62;
  begin
    Index_f := SLV_TO_INT(SLV => ADDRF_in);
    DOF_out <= MEM_f(Index_f);
  end process QF_P;

  QG_P : process ( ADDRG_in, MEM_g)
    variable Index_g : integer := 62;
  begin
    Index_g := SLV_TO_INT(SLV => ADDRG_in);
    DOG_out <= MEM_g(Index_g);
  end process QG_P;

  QH_P : process ( ADDRH_in, MEM_h)
    variable Index_h : integer := 62;
  begin
    Index_h := 2 * SLV_TO_INT(SLV => ADDRH_in);
    DOH_out(0) <= MEM_h(Index_h);
    DOH_out(1) <= MEM_h(Index_h + 1);
  end process QH_P;

  FunctionalWriteBehavior : process(WCLK_in)
    variable Index   : integer := 62 ;
  begin
    if (rising_edge(WCLK_in)) then
      if (WE_in = '1') then
        Index := 2 * SLV_TO_INT(SLV => ADDRH_in);
        MEM_a(Index) <= DIA_in(0)  after 100 ps;
        MEM_a(Index+1) <= DIA_in(1) after 100 ps;
        MEM_b(Index) <= DIB_in(0)  after 100 ps;
        MEM_b(Index+1) <= DIB_in(1) after 100 ps;
        MEM_c(Index) <= DIC_in(0)  after 100 ps;
        MEM_c(Index+1) <= DIC_in(1) after 100 ps;
        MEM_d(Index) <= DID_in(0)  after 100 ps;
        MEM_d(Index+1) <= DID_in(1)  after 100 ps;
        MEM_e(Index) <= DIE_in(0)  after 100 ps;
        MEM_e(Index+1) <= DIE_in(1)  after 100 ps;
        MEM_f(Index) <= DIF_in(0)  after 100 ps;
        MEM_f(Index+1) <= DIF_in(1)  after 100 ps;
        MEM_g(Index) <= DIG_in(0)  after 100 ps;
        MEM_g(Index+1) <= DIG_in(1)  after 100 ps;
        MEM_h(Index) <= DIH_in(0)  after 100 ps;
        MEM_h(Index+1) <= DIH_in(1)  after 100 ps;
      end if;
    end if;
  end process FunctionalWriteBehavior;

-- end behavioral model

end RAM32X16DR8_V;
