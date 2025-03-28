----------------------------------------------------------------------------
-- Auteur(s) : J.PIQUEMAL
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/09/2024
--
-- Description : This module implement the Physical and Lane layer of an IP
-- SpaceFibre Light.
-- The Physical layer is carried by an Xilinx IP
-- The Lane layer is carried by owner's code and an Xilinx IP
----------------------------------------------------------------------------
-- Copyright (c) 2014 par ELSYS Design Group
-- Tous les droits sont reserves. Toute reproduction totale ou partielle est
-- interdite sans le consentement ecrit du proprietaire des droits d'auteur.
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;

package data_link_lib is
  -- Lane CAPABILITY
  constant C_CAPA_LINK_RST       : integer := 0;
  constant C_CAPA_LANE_START     : integer := 1;
  constant C_CAPA_DATA_SCRAM     : integer := 2;
  constant C_CAPA_MULTI_LANE     : integer := 3;
  constant C_CAPA_ROUTING_SW     : integer := 4;
  -- Number of Virtual Channel
  constant C_VC_NUM              : integer              := 8;
  -- Output Buffer
  constant C_OUT_BUF_SIZE        : integer              := 7; -- fifo depth = 2**6= 64 words of 32 bits
  constant C_FCT_CC_SIZE         : integer              := 8;  -- FCT credit counter size: 4x64xM = 256
  constant C_FCT_CC_MAX          : unsigned             := to_unsigned(255, C_FCT_CC_SIZE);  -- FCT credit counter size: 4x64xM = 256
  constant C_M_SIZE              : integer              := 4;  -- Size of M which is multiplier +1
  -- Middle Buffer
  constant C_MID_BUF_SIZE        : integer              := 6; -- fifo depth = 2**6= 64 words of 32 bits
  -- Input Buffer
  constant C_IN_BUF_SIZE         : integer              := 8; -- fifo depth = 2**8= 256 words of 32 bits
  -- DATA LENGTH
  constant C_DATA_LENGTH         : integer              := 32;
  constant C_BYTE_BY_WORD_LENGTH : integer              := 4;
  constant C_DATA_K_WIDTH        : integer              := C_DATA_LENGTH +C_BYTE_BY_WORD_LENGTH;
  constant C_TYPE_FRAME_LENGTH   : integer              := 4;
  constant C_MAX_DATA_FRAME      : unsigned(7 downto 0) := to_unsigned(66, 8);
  constant C_MAX_IDLE_FRAME      : unsigned(7 downto 0) := to_unsigned(65, 8);
  constant C_WORD_BC_FRAME       : unsigned(1 downto 0) := to_unsigned(3, 2);
  constant C_BYTE_WIDTH          : integer              := 8;
  -- DATA-LINK TYPE OF FRAME
  constant C_DATA_FRM  :std_logic_vector(3 downto 0):= "0001"; -- DATA Frame
  constant C_BC_FRM    :std_logic_vector(3 downto 0):= "0010"; -- BROADCAST Frame
  constant C_IDLE_FRM  :std_logic_vector(3 downto 0):= "0011"; -- IDLE Frame
  constant C_FCT_FRM   :std_logic_vector(3 downto 0):= "0100"; -- FCT Frame
  constant C_ACK_FRM   :std_logic_vector(3 downto 0):= "0101"; -- ACK Frame
  constant C_NACK_FRM  :std_logic_vector(3 downto 0):= "0110"; -- NACK Frame
  constant C_FULL_FRM  :std_logic_vector(3 downto 0):= "0111"; -- FULL Frame
  constant C_RETRY_FRM :std_logic_vector(3 downto 0):= "1000"; -- RETRY Frame 
  -- SYMBOLS
  constant C_EEP_SYMB            : std_logic_vector(07 downto 00) := x"FE";  --! K30.7 EEP
  constant C_EOP_SYMB            : std_logic_vector(07 downto 00) := x"FD";  --! K29.7 EOP
  constant C_K28_7_SYMB          : std_logic_vector(07 downto 00) := x"FC";  --! K28.7 Comma
  constant C_K28_3_SYMB          : std_logic_vector(07 downto 00) := x"7C";  --! K28.3 FCT
  constant C_K28_2_SYMB          : std_logic_vector(07 downto 00) := x"5C";  --! K28.2 EBF
  constant C_K28_0_SYMB          : std_logic_vector(07 downto 00) := x"1C";  --! K28.0 EDF
  constant C_FILL_SYMB           : std_logic_vector(07 downto 00) := x"FB";  --! K27.7
  constant C_SBF_SYMB            : std_logic_vector(07 downto 00) := x"5D";  --! D29.2 SBF
  constant C_NACK_SYMB           : std_logic_vector(07 downto 00) := x"A2";  --! D27.5
  constant C_SDF_SYMB            : std_logic_vector(07 downto 00) := x"50";  --! D16.2  
  constant C_FULL_SYMB           : std_logic_vector(07 downto 00) := x"6F";  --! D15.3
  constant C_RETRY_SYMB          : std_logic_vector(07 downto 00) := x"87";  --! D7.4
  constant C_SIF_SYMB            : std_logic_vector(07 downto 00) := x"84";  --! D4.2 SIF
  constant C_ACK_SYMB            : std_logic_vector(07 downto 00) := x"A6";  --! D2.5 
  constant C_RESERVED_SYMB       : std_logic_vector(07 downto 00) := x"00";  --! D0.0
  -- DATA-LINK CONTROL WORDS
  constant C_SDF_WORD           : std_logic_vector(15 downto 00) := C_SDF_SYMB & C_K28_7_SYMB;   -- bits 23 downto 16 = Virtual channel and bits 31 downto 24 = Reserved
  constant C_SBF_WORD           : std_logic_vector(15 downto 00) := C_SBF_SYMB & C_K28_7_SYMB;   -- bits 23 downto 16 = Broadcast channel and bits 31 downto 24 = Broadcast Type
  constant C_SIF_WORD           : std_logic_vector(15 downto 00) := C_SBF_SYMB & C_K28_7_SYMB;   -- bits 23 downto 16 = SEQ_NUM and bits 31 downto 24 = CRC
  constant C_ACK_WORD           : std_logic_vector(15 downto 00) := C_ACK_SYMB & C_K28_7_SYMB;   -- bits 23 downto 16 = SEQ_NUM and bits 31 downto 24 = CRC
  constant C_NACK_WORD          : std_logic_vector(15 downto 00) := C_NACK_SYMB & C_K28_7_SYMB;  -- bits 23 downto 16 = SEQ_NUM and bits 31 downto 24 = CRC
  constant C_FULL_WORD          : std_logic_vector(15 downto 00) := C_FULL_SYMB & C_K28_7_SYMB;  -- bits 23 downto 16 = SEQ_NUM and bits 31 downto 24 = CRC
  constant C_RETRY_WORD         : std_logic_vector               := C_RESERVED_SYMB & C_RESERVED_SYMB & C_RETRY_SYMB & C_K28_7_SYMB;
  constant C_RXERR_WORD         : std_logic_vector               := C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB;
  type int_array is array (natural range <>) of integer;
  -- #####################################################################
  -- # Type
  -- #####################################################################
  type vc_data_array is array (natural range <>) of std_logic_vector(C_DATA_LENGTH-1 downto 0);
  type vc_k_array is array (natural range <>) of std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
  type vc_data_k_array is array (natural range <>) of std_logic_vector(C_DATA_LENGTH+C_BYTE_BY_WORD_LENGTH-1 downto 0);
  type vc_mult_array is array (natural range <>) of std_logic_vector(3-1 downto 0);
  type vc_m_val_array is array (natural range <>) of std_logic_vector(C_M_SIZE-1 downto 0);
  -- #####################################################################
  -- # INIT functions
  -- #####################################################################
  function calculate_crc_16(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR;
  function calculate_crc_8(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR;
  function calculate_idle(data_idle : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR;
  function inv_crc(crc_to_inv : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR ;
end package data_link_lib;

package body data_link_lib is

function calculate_crc_16(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
  variable crc : std_logic_vector(15 downto 0) := crc_init;
  variable feedback : std_logic;
begin
  -- Traiter chaque bit du LSB au MSB
  for i in 0 to data'length - 1 loop
      feedback := crc(15) xor data(i); -- XOR du bit d'entrée avec le MSB du CRC

      -- Décalage à gauche
      crc := crc(14 downto 0) & '0';

      -- Application du polynôme 0x1021 (x^12 et x^5)
      crc(12) := crc(12) xor feedback;
      crc(5)  := crc(5) xor feedback;
      crc(0)  := feedback;
  end loop;

  return crc;
end function;

function calculate_crc_8(data : STD_LOGIC_VECTOR(7 downto 0); crc_init : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
  variable crc : std_logic_vector(7 downto 0) := crc_init;
  variable feedback : std_logic;
begin
  -- Traiter chaque bit du LSB au MSB
  for i in 0 to data'length - 1 loop
      feedback := crc(7) xor data(i); -- XOR du bit d'entrée avec le MSB du CRC

      -- Décalage à gauche
      crc := crc(6 downto 0) & '0';

      -- Application du polynôme 0x1021 (x^12 et x^5)
      crc(2) := crc(2) xor feedback;
      crc(1)  := crc(1) xor feedback;
      crc(0)  := feedback;
  end loop;
  return crc;
end function;

function inv_crc(crc_to_inv : STD_LOGIC_VECTOR(7 downto 0)) return STD_LOGIC_VECTOR is
  variable crc : std_logic_vector(7 downto 0) := crc_to_inv;
begin
  -- Traiter chaque bit du LSB au MSB
  for i in 0 to 7 loop
    crc(i) := crc(7 - i);
  end loop;
  return crc;
end function;

function calculate_idle(data_idle : STD_LOGIC_VECTOR(15 downto 0)) return STD_LOGIC_VECTOR is
  variable data_idle_i : std_logic_vector(15 downto 0) := x"ffff";
  variable feedback : std_logic;
begin
  -- Traiter chaque bit du LSB au MSB
  data_idle_i:= data_idle;
      feedback := data_idle_i(15); -- XOR du bit d'entrée avec le MSB du CRC

      -- Décalage à gauche
      data_idle_i := data_idle_i(14 downto 0) & '0';

      -- Application du polynôme 0x1021 (x^12 et x^5)
      data_idle_i(4) := data_idle_i(4) xor feedback;
      data_idle_i(3)  := data_idle_i(3) xor feedback;
      data_idle_i(2)  := data_idle_i(2) xor feedback;
      data_idle_i(0)  := feedback;
  
  return data_idle_i;
end function;

end package body data_link_lib;