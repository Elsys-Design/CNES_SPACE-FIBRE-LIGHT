-- --------------------------------------------------------------------
--
-- Copyright © 2008 by IEEE. All rights reserved.
--
-- This source file is an essential part of IEEE Std 1076-2008,
-- IEEE Standard VHDL Language Reference Manual. This source file may not be
-- copied, sold, or included with software that is sold without written
-- permission from the IEEE Standards Department. This source file may be
-- copied for individual use between licensed users. This source file is
-- provided on an AS IS basis. The IEEE disclaims ANY WARRANTY EXPRESS OR
-- IMPLIED INCLUDING ANY WARRANTY OF MERCHANTABILITY AND FITNESS FOR USE
-- FOR A PARTICULAR PURPOSE. The user of the source file shall indemnify
-- and hold IEEE harmless from any damages or liability arising out of the
-- use thereof.
--
--   Title     :  Standard multivalue logic package
--             :  (STD_LOGIC_1164 package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  IEEE model standards group (PAR 1164),
--             :  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines a standard for designers
--             :  to use in describing the interconnection data types
--             :  used in vhdl modeling.
--             :
--   Limitation:  The logic system defined in this package may
--             :  be insufficient for modeling switched transistors,
--             :  since such a requirement is out of the scope of this
--             :  effort. Furthermore, mathematics, primitives,
--             :  timing standards, etc. are considered orthogonal
--             :  issues as it relates to this package and are therefore
--             :  beyond the scope of this effort.
--             :
--   Note      :  This package may be modified to include additional data
--             :  required by tools, but it must in no way change the
--             :  external interfaces or simulation behavior of the
--             :  description. It is permissible to add comments and/or
--             :  attributes to the package declarations, but not to change
--             :  or delete any original lines of the package declaration.
--             :  The package body may be changed only in accordance with
--             :  the terms of Clause 16 of this standard.
--             :
-- --------------------------------------------------------------------
-- $Revision: 1228 $
-- $Date: 2008-04-30 10:04:53 +0930 (Wed, 30 Apr 2008) $
-- --------------------------------------------------------------------

use std.textio.all;

package std_logic_1164 is

  -------------------------------------------------------------------
  -- logic state system  (unresolved)
  -------------------------------------------------------------------
  type std_ulogic is ( 'U',             -- Uninitialized
                       'X',             -- Forcing  Unknown
                       '0',             -- Forcing  0
                       '1',             -- Forcing  1
                       'Z',             -- High Impedance
                       'W',             -- Weak     Unknown
                       'L',             -- Weak     0
                       'H',             -- Weak     1
                       '-'              -- Don't care
                       );
  -------------------------------------------------------------------
  -- unconstrained array of std_ulogic for use with the resolution function
  -- and for use in declaring signal arrays of unresolved elements
  -------------------------------------------------------------------
  type std_ulogic_vector is array (natural range <>) of std_ulogic;

  -------------------------------------------------------------------
  -- resolution function
  -------------------------------------------------------------------
  function resolved (s : std_ulogic_vector) return std_ulogic;

  -------------------------------------------------------------------
  -- logic state system  (resolved)
  -------------------------------------------------------------------
  subtype std_logic is resolved std_ulogic;

  -------------------------------------------------------------------
  -- unconstrained array of resolved std_ulogic for use in declaring
  -- signal arrays of resolved elements
  -------------------------------------------------------------------
  subtype std_logic_vector is (resolved) std_ulogic_vector;

  -------------------------------------------------------------------
  -- common subtypes
  -------------------------------------------------------------------

  subtype X01 is resolved std_ulogic range 'X' to '1';    -- ('X','0','1')
  subtype X01Z is resolved std_ulogic range 'X' to 'Z';   -- ('X','0','1','Z')
  subtype UX01 is resolved std_ulogic range 'U' to '1';   -- ('U','X','0','1')
  subtype UX01Z is resolved std_ulogic range 'U' to 'Z';  -- ('U','X','0','1','Z')

  -------------------------------------------------------------------
  -- overloaded logical operators
  -------------------------------------------------------------------

  function "and"  (l : std_ulogic; r : std_ulogic) return UX01;
  function "nand" (l : std_ulogic; r : std_ulogic) return UX01;
  function "or"   (l : std_ulogic; r : std_ulogic) return UX01;
  function "nor"  (l : std_ulogic; r : std_ulogic) return UX01;
  function "xor"  (l : std_ulogic; r : std_ulogic) return UX01;
  function "xnor" (l : std_ulogic; r : std_ulogic) return UX01;
  function "not"  (l : std_ulogic) return UX01;

  -------------------------------------------------------------------
  -- vectorized overloaded logical operators
  -------------------------------------------------------------------

  function "and"  (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "nand" (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "or"   (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "nor"  (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "xor"  (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "xnor" (l, r : std_ulogic_vector) return std_ulogic_vector;
  function "not"  (l    : std_ulogic_vector) return std_ulogic_vector;

  function "and"  (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "and"  (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "nand" (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "nand" (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "or"   (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "or"   (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "nor"  (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "nor"  (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "xor"  (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "xor"  (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "xnor" (l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;
  function "xnor" (l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  function "and"  (l : std_ulogic_vector) return std_ulogic;
  function "nand" (l : std_ulogic_vector) return std_ulogic;
  function "or"   (l : std_ulogic_vector) return std_ulogic;
  function "nor"  (l : std_ulogic_vector) return std_ulogic;
  function "xor"  (l : std_ulogic_vector) return std_ulogic;
  function "xnor" (l : std_ulogic_vector) return std_ulogic;

  -------------------------------------------------------------------
  -- shift operators
  -------------------------------------------------------------------

  function "sll" (l : std_ulogic_vector; r : integer) return std_ulogic_vector;
  function "srl" (l : std_ulogic_vector; r : integer) return std_ulogic_vector;
  function "rol" (l : std_ulogic_vector; r : integer) return std_ulogic_vector;
  function "ror" (l : std_ulogic_vector; r : integer) return std_ulogic_vector;

  -------------------------------------------------------------------
  -- conversion functions
  -------------------------------------------------------------------

  function to_bit (s : std_ulogic; xmap : bit := '0') return bit;
  function to_bitvector (s : std_ulogic_vector; xmap : bit := '0') return bit_vector;

  function to_stdulogic       (b : bit) return std_ulogic;
  function to_stdlogicvector  (b : bit_vector) return std_logic_vector;
  function to_stdlogicvector  (s : std_ulogic_vector) return std_logic_vector;
  function to_stdulogicvector (b : bit_vector) return std_ulogic_vector;
  function to_stdulogicvector (s : std_logic_vector) return std_ulogic_vector;

  alias to_bit_vector is to_bitvector[std_ulogic_vector, bit return bit_vector];
  alias to_bv is to_bitvector[std_ulogic_vector, bit return bit_vector];

  alias to_std_logic_vector is to_stdlogicvector[bit_vector return std_logic_vector];
  alias to_slv is to_stdlogicvector[bit_vector return std_logic_vector];

  alias to_std_logic_vector is to_stdlogicvector[std_ulogic_vector return std_logic_vector];
  alias to_slv is to_stdlogicvector[std_ulogic_vector return std_logic_vector];

  alias to_std_ulogic_vector is to_stdulogicvector[bit_vector return std_ulogic_vector];
  alias to_sulv is to_stdulogicvector[bit_vector return std_ulogic_vector];

  alias to_std_ulogic_vector is to_stdulogicvector[std_logic_vector return std_ulogic_vector];
  alias to_sulv is to_stdulogicvector[std_logic_vector return std_ulogic_vector];

  -------------------------------------------------------------------
  -- strength strippers and type convertors
  -------------------------------------------------------------------

  function to_01 (s : std_ulogic_vector; xmap : std_ulogic := '0') return std_ulogic_vector;
  function to_01 (s : std_ulogic; xmap : std_ulogic := '0') return std_ulogic;
  function to_01 (s : bit_vector; xmap : std_ulogic := '0') return std_ulogic_vector;
  function to_01 (s : bit; xmap : std_ulogic := '0') return std_ulogic;

  function to_X01 (s : std_ulogic_vector) return std_ulogic_vector;
  function to_X01 (s : std_ulogic) return X01;
  function to_X01 (b : bit_vector) return std_ulogic_vector;
  function to_X01 (b : bit) return X01;

  function to_X01Z (s : std_ulogic_vector) return std_ulogic_vector;
  function to_X01Z (s : std_ulogic) return X01Z;
  function to_X01Z (b : bit_vector) return std_ulogic_vector;
  function to_X01Z (b : bit) return X01Z;

  function to_UX01 (s : std_ulogic_vector) return std_ulogic_vector;
  function to_UX01 (s : std_ulogic) return UX01;
  function to_UX01 (b : bit_vector) return std_ulogic_vector;
  function to_UX01 (b : bit) return UX01;

  function "??" (l : std_ulogic) return boolean;

  -------------------------------------------------------------------
  -- edge detection
  -------------------------------------------------------------------

  function rising_edge  (signal s : std_ulogic) return boolean;
  function falling_edge (signal s : std_ulogic) return boolean;

  -------------------------------------------------------------------
  -- object contains an unknown
  -------------------------------------------------------------------

  function is_X (s : std_ulogic_vector) return boolean;
  function is_X (s : std_ulogic) return boolean;

  -------------------------------------------------------------------
  -- matching relational operators
  -------------------------------------------------------------------
  -- the following operations are predefined

  function "?=" (l, r : std_ulogic) return std_ulogic;
  function "?=" (l, r : std_ulogic_vector) return std_ulogic;

  function "?/=" (l, r : std_ulogic) return std_ulogic;
  function "?/=" (l, r : std_ulogic_vector) return std_ulogic;

  function "?<" (l, r  : std_ulogic) return std_ulogic;
  function "?<=" (l, r : std_ulogic) return std_ulogic;
  function "?>" (l, r  : std_ulogic) return std_ulogic;
  function "?>=" (l, r : std_ulogic) return std_ulogic;

  -------------------------------------------------------------------
  -- string conversion and write operations
  -------------------------------------------------------------------
  -- the following operations are predefined

  -- function to_string (value : std_ulogic) return string;
  -- function to_string (value : std_ulogic_vector) return string;

  -- explicitly defined operations

  alias to_bstring is to_string [std_ulogic_vector return string];
  alias to_binary_string is to_string [std_ulogic_vector return string];

  function to_ostring (value : std_ulogic_vector) return string;
  alias to_octal_string is to_ostring [std_ulogic_vector return string];

  function to_hstring (value : std_ulogic_vector) return string;
  alias to_hex_string is to_hstring [std_ulogic_vector return string];

  procedure read (l : inout line; value : out std_ulogic; good : out boolean);
  procedure read (l : inout line; value : out std_ulogic);

  procedure read (l : inout line; value : out std_ulogic_vector; good : out boolean);
  procedure read (l : inout line; value : out std_ulogic_vector);

  procedure write (l : inout line; value : in std_ulogic; justified : in side := RIGHT; field : in width := 0);
  procedure write (l : inout line; value : in std_ulogic_vector; justified : in side := RIGHT; field : in width := 0);

  alias bread is read [line, std_ulogic_vector, boolean];
  alias bread is read [line, std_ulogic_vector];
  alias binary_read is read [line, std_ulogic_vector, boolean];
  alias binary_read is read [line, std_ulogic_vector];

  procedure oread (l : inout line; value : out std_ulogic_vector; good : out boolean);
  procedure oread (l : inout line; value : out std_ulogic_vector);
  alias octal_read is oread [line, std_ulogic_vector, boolean];
  alias octal_read is oread [line, std_ulogic_vector];

  procedure hread (l : inout line; value : out std_ulogic_vector; good : out boolean);
  procedure hread (l : inout line; value : out std_ulogic_vector);
  alias hex_read is hread [line, std_ulogic_vector, boolean];
  alias hex_read is hread [line, std_ulogic_vector];

  alias bwrite is write [line, std_ulogic_vector, side, width];
  alias binary_write is write [line, std_ulogic_vector, side, width];

  procedure owrite (l : inout line; value : in std_ulogic_vector; justified : in side := RIGHT; field : in width := 0);
  alias octal_write is owrite [line, std_ulogic_vector, side, width];

  procedure hwrite (l : inout line; value : in std_ulogic_vector; justified : in side := RIGHT; field : in width := 0);
  alias hex_write is hwrite [line, std_ulogic_vector, side, width];

end package std_logic_1164;