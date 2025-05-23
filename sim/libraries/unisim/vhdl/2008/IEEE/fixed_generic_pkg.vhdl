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
--   Title     :  Fixed-point package (Generic package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC and IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines basic binary fixed point
--             :  arithmetic functions
--             :
--   note      :  this package may be modified to include additional data
--             :  required by tools, but it must in no way change the
--             :  external interfaces or simulation behavior of the
--             :  description. it is permissible to add comments and/or
--             :  attributes to the package declarations, but not to change
--             :  or delete any original lines of the package declaration.
--             :  the package body may be changed only in accordance with
--             :  the terms of clause 16 of this standard.
--             :
-- --------------------------------------------------------------------
-- $revision: 1220 $
-- $date: 2008-04-10 17:16:09 +0930 (thu, 10 apr 2008) $
-- --------------------------------------------------------------------

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_float_types.all;

package fixed_generic_pkg is
  generic (
    -- Rounding routine to use in fixed point, fixed_round or fixed_truncate
    FIXED_ROUND_STYLE    : fixed_round_style_type    := FIXED_ROUND;
    -- Overflow routine to use in fixed point, fixed_saturate or fixed_wrap
    FIXED_OVERFLOW_STYLE : fixed_overflow_style_type := FIXED_SATURATE;
    -- Extra bits used in divide routines
    FIXED_GUARD_BITS     : natural                   := 3;
    -- If TRUE, then turn off warnings on "X" propagation
    NO_WARNING           : boolean                   := false
    );

  -- Author David Bishop (dbishop@vhdl.org)
  constant CopyRightNotice : string :=
    "Copyright 2008 by IEEE. All rights reserved.";

  -- base Unsigned fixed point type, downto direction assumed
  type unresolved_ufixed is array (integer range <>) of std_ulogic;
  -- base signed fixed point type, downto direction assumed
  type unresolved_sfixed is array (integer range <>) of std_ulogic;

  alias u_ufixed is unresolved_ufixed;
  alias u_sfixed is unresolved_sfixed;

  subtype ufixed is (resolved) unresolved_ufixed;
  subtype sfixed is (resolved) unresolved_sfixed;

  --===========================================================================
  -- Arithmetic Operators:
  --===========================================================================

  --```
  -- Absolute value, 2's complement
  -- abs sfixed(a downto b) = sfixed(a+1 downto b)
  --```
  function "abs" (arg : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Negation, 2's complement
  -- - sfixed(a downto b) = sfixed(a+1 downto b)
  --```
  function "-" (arg : unresolved_sfixed)return unresolved_sfixed;

  --```
  -- Addition
  -- ufixed(a downto b) + ufixed(c downto d)
  --   = ufixed(maximum(a,c)+1 downto minimum(b,d))
  --```
  function "+" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed(a downto b) + sfixed(c downto d)
  --   = sfixed(maximum(a,c)+1 downto minimum(b,d))
  --```
  function "+" (l, r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Subtraction
  -- ufixed(a downto b) - ufixed(c downto d)
  --   = ufixed(maximum(a,c)+1 downto minimum(b,d))
  --```
  function "-" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed(a downto b) - sfixed(c downto d)
  --   = sfixed(maximum(a,c)+1 downto minimum(b,d))
  --```
  function "-" (l, r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Multiplication
  -- ufixed(a downto b) * ufixed(c downto d) = ufixed(a+c+1 downto b+d)
  --```
  function "*" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed(a downto b) * sfixed(c downto d) = sfixed(a+c+1 downto b+d)
  --```
  function "*" (l, r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Division
  -- ufixed(a downto b) / ufixed(c downto d) = ufixed(a-d downto b-c-1)
  --```
  function "/" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed(a downto b) / sfixed(c downto d) = sfixed(a-d+1 downto b-c)
  --```
  function "/" (l, r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Remainder
  -- ufixed (a downto b) rem ufixed (c downto d)
  --   = ufixed (minimum(a,c) downto minimum(b,d))
  --```
  function "rem" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed (a downto b) rem sfixed (c downto d)
  --   = sfixed (minimum(a,c) downto minimum(b,d))
  --```
  function "rem" (l, r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- Modulo
  -- ufixed (a downto b) mod ufixed (c downto d)
  --        = ufixed (minimum(a,c) downto minimum(b, d))
  --```
  function "mod" (l, r : unresolved_ufixed) return unresolved_ufixed;

  --```
  -- sfixed (a downto b) mod sfixed (c downto d)
  --        = sfixed (c downto minimum(b, d))
  --```
  function "mod" (l, r : unresolved_sfixed) return unresolved_sfixed;

  ----------------------------------------------------------------------------
  -- In these routines the "real" or "natural" (integer)
  -- are converted into a fixed point number and then the operation is
  -- performed.  It is assumed that the array will be large enough.
  -- If the input is "real" then the real number is converted into a fixed of
  -- the same size as the fixed point input.  If the number is an "integer"
  -- then it is converted into fixed with the range (l'high downto 0).
  ----------------------------------------------------------------------------

  -- ufixed(a downto b) + ufixed(a downto b) = ufixed(a+1 downto b)
  function "+" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed(c downto d) + ufixed(c downto d) = ufixed(c+1 downto d)
  function "+" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) + ufixed(a downto 0) = ufixed(a+1 downto minimum(0,b))
  function "+" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed(a downto 0) + ufixed(c downto d) = ufixed(c+1 downto minimum(0,d))
  function "+" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) - ufixed(a downto b) = ufixed(a+1 downto b)
  function "-" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed(c downto d) - ufixed(c downto d) = ufixed(c+1 downto d)
  function "-" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) - ufixed(a downto 0) = ufixed(a+1 downto minimum(0,b))
  function "-" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed(a downto 0) + ufixed(c downto d) = ufixed(c+1 downto minimum(0,d))
  function "-" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) * ufixed(a downto b) = ufixed(2a+1 downto 2b)
  function "*" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed(c downto d) * ufixed(c downto d) = ufixed(2c+1 downto 2d)
  function "*" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed (a downto b) * ufixed (a downto 0) = ufixed (2a+1 downto b)
  function "*" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed (a downto b) * ufixed (a downto 0) = ufixed (2a+1 downto b)
  function "*" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) / ufixed(a downto b) = ufixed(a-b downto b-a-1)
  function "/" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed(a downto b) / ufixed(a downto b) = ufixed(a-b downto b-a-1)
  function "/" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed(a downto b) / ufixed(a downto 0) = ufixed(a downto b-a-1)
  function "/" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed(c downto 0) / ufixed(c downto d) = ufixed(c-d downto -c-1)
  function "/" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed (a downto b) rem ufixed (a downto b) = ufixed (a downto b)
  function "rem" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed (c downto d) rem ufixed (c downto d) = ufixed (c downto d)
  function "rem" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed (a downto b) rem ufixed (a downto 0) = ufixed (a downto minimum(b,0))
  function "rem" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed (c downto 0) rem ufixed (c downto d) = ufixed (c downto minimum(d,0))
  function "rem" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed (a downto b) mod ufixed (a downto b) = ufixed (a downto b)
  function "mod" (l : unresolved_ufixed; r : real) return unresolved_ufixed;

  -- ufixed (c downto d) mod ufixed (c downto d) = ufixed (c downto d)
  function "mod" (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  -- ufixed (a downto b) mod ufixed (a downto 0) = ufixed (a downto minimum(b,0))
  function "mod" (l : unresolved_ufixed; r : natural) return unresolved_ufixed;

  -- ufixed (c downto 0) mod ufixed (c downto d) = ufixed (c downto minimum(d,0))
  function "mod" (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  -- sfixed(a downto b) + sfixed(a downto b) = sfixed(a+1 downto b)
  function "+" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed(c downto d) + sfixed(c downto d) = sfixed(c+1 downto d)
  function "+" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) + sfixed(a downto 0) = sfixed(a+1 downto minimum(0,b))
  function "+" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed(c downto 0) + sfixed(c downto d) = sfixed(c+1 downto minimum(0,d))
  function "+" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) - sfixed(a downto b) = sfixed(a+1 downto b)
  function "-" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed(c downto d) - sfixed(c downto d) = sfixed(c+1 downto d)
  function "-" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) - sfixed(a downto 0) = sfixed(a+1 downto minimum(0,b))
  function "-" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed(c downto 0) - sfixed(c downto d) = sfixed(c+1 downto minimum(0,d))
  function "-" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) * sfixed(a downto b) = sfixed(2a+1 downto 2b)
  function "*" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed(c downto d) * sfixed(c downto d) = sfixed(2c+1 downto 2d)
  function "*" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) * sfixed(a downto 0) = sfixed(2a+1 downto b)
  function "*" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed(c downto 0) * sfixed(c downto d) = sfixed(2c+1 downto d)
  function "*" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) / sfixed(a downto b) = sfixed(a-b+1 downto b-a)
  function "/" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed(c downto d) / sfixed(c downto d) = sfixed(c-d+1 downto d-c)
  function "/" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed(a downto b) / sfixed(a downto 0) = sfixed(a+1 downto b-a)
  function "/" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed(c downto 0) / sfixed(c downto d) = sfixed(c-d+1 downto -c)
  function "/" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed (a downto b) rem sfixed (a downto b) = sfixed (a downto b)
  function "rem" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed (c downto d) rem sfixed (c downto d) = sfixed (c downto d)
  function "rem" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed (a downto b) rem sfixed (a downto 0) = sfixed (a downto minimum(b,0))
  function "rem" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed (c downto 0) rem sfixed (c downto d) = sfixed (c downto minimum(d,0))
  function "rem" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed (a downto b) mod sfixed (a downto b) = sfixed (a downto b)
  function "mod" (l : unresolved_sfixed; r : real) return unresolved_sfixed;

  -- sfixed (c downto d) mod sfixed (c downto d) = sfixed (c downto d)
  function "mod" (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  -- sfixed (a downto b) mod sfixed (a downto 0) = sfixed (a downto minimum(b,0))
  function "mod" (l : unresolved_sfixed; r : integer) return unresolved_sfixed;

  -- sfixed (c downto 0) mod sfixed (c downto d) = sfixed (c downto minimum(d,0))
  function "mod" (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  --```
  -- This version of divide gives the user more control
  -- ufixed(a downto b) / ufixed(c downto d) = ufixed(a-d downto b-c-1)
  --```
  function divide (
    l, r                 : unresolved_ufixed;
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  --```
  -- This version of divide gives the user more control
  -- sfixed(a downto b) / sfixed(c downto d) = sfixed(a-d+1 downto b-c)
  --```
  function divide (
    l, r                 : unresolved_sfixed;
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  --```
  -- These functions return 1/x
  -- 1 / ufixed(a downto b) = ufixed(-b downto -a-1)
  --```
  function reciprocal (
    arg                  : unresolved_ufixed;  -- fixed point input
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  -- 1 / sfixed(a downto b) = sfixed(-b+1 downto -a)
  function reciprocal (
    arg                  : unresolved_sfixed;  -- fixed point input
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  --```
  -- rem function
  -- ufixed (a downto b) rem ufixed (c downto d)
  --   = ufixed (minimum(a,c) downto minimum(b,d))
  --```
  function remainder (
    l, r                 : unresolved_ufixed;
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  --```
  -- sfixed (a downto b) rem sfixed (c downto d)
  --   = sfixed (minimum(a,c) downto minimum(b,d))
  --```
  function remainder (
    l, r                 : unresolved_sfixed;
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  --```
  -- mod function
  -- ufixed (a downto b) mod ufixed (c downto d)
  --        = ufixed (minimum(a,c) downto minimum(b, d))
  --```
  function modulo (
    l, r                 : unresolved_ufixed;
    constant round_style : fixed_round_style_type := FIXED_ROUND_STYLE;
    constant guard_bits  : natural                := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  --```
  -- sfixed (a downto b) mod sfixed (c downto d)
  --        = sfixed (c downto minimum(b, d))
  --```
  function modulo (
    l, r                    : unresolved_sfixed;
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE;
    constant guard_bits     : natural                   := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  --```
  -- Procedure for those who need an "accumulator" function.
  -- add_carry (ufixed(a downto b), ufixed (c downto d))
  --         = ufixed (maximum(a,c) downto minimum(b,d))
  --```
  procedure add_carry (
    l, r   : in  unresolved_ufixed;
    c_in   : in  std_ulogic;
    result : out unresolved_ufixed;
    c_out  : out std_ulogic);

  --```
  -- add_carry (sfixed(a downto b), sfixed (c downto d))
  --         = sfixed (maximum(a,c) downto minimum(b,d))
  --```
  procedure add_carry (
    l, r   : in  unresolved_sfixed;
    c_in   : in  std_ulogic;
    result : out unresolved_sfixed;
    c_out  : out std_ulogic);

  -- Scales the result by a power of 2.  Width of input = width of output with
  -- the binary point moved.

  function scalb (y : unresolved_ufixed; n : integer) return unresolved_ufixed;
  function scalb (y : unresolved_ufixed; n : unresolved_signed) return unresolved_ufixed;
  function scalb (y : unresolved_sfixed; n : integer) return unresolved_sfixed;
  function scalb (y : unresolved_sfixed; n : unresolved_signed) return unresolved_sfixed;

  function is_negative (arg : unresolved_sfixed) return boolean;

  --===========================================================================
  -- Comparison Operators
  --===========================================================================

  function ">"  (l, r : unresolved_ufixed) return boolean;
  function ">"  (l, r : unresolved_sfixed) return boolean;
  function "<"  (l, r : unresolved_ufixed) return boolean;
  function "<"  (l, r : unresolved_sfixed) return boolean;
  function "<=" (l, r : unresolved_ufixed) return boolean;
  function "<=" (l, r : unresolved_sfixed) return boolean;
  function ">=" (l, r : unresolved_ufixed) return boolean;
  function ">=" (l, r : unresolved_sfixed) return boolean;
  function "="  (l, r : unresolved_ufixed) return boolean;
  function "="  (l, r : unresolved_sfixed) return boolean;
  function "/=" (l, r : unresolved_ufixed) return boolean;
  function "/=" (l, r : unresolved_sfixed) return boolean;

  function "?="  (l, r : unresolved_ufixed) return std_ulogic;
  function "?/=" (l, r : unresolved_ufixed) return std_ulogic;
  function "?>"  (l, r : unresolved_ufixed) return std_ulogic;
  function "?>=" (l, r : unresolved_ufixed) return std_ulogic;
  function "?<"  (l, r : unresolved_ufixed) return std_ulogic;
  function "?<=" (l, r : unresolved_ufixed) return std_ulogic;
  function "?="  (l, r : unresolved_sfixed) return std_ulogic;
  function "?/=" (l, r : unresolved_sfixed) return std_ulogic;
  function "?>"  (l, r : unresolved_sfixed) return std_ulogic;
  function "?>=" (l, r : unresolved_sfixed) return std_ulogic;
  function "?<"  (l, r : unresolved_sfixed) return std_ulogic;
  function "?<=" (l, r : unresolved_sfixed) return std_ulogic;

  function std_match (l, r : unresolved_ufixed) return boolean;
  function std_match (l, r : unresolved_sfixed) return boolean;

  -- Overloads the default "maximum" and "minimum" function

  function maximum (l, r : unresolved_ufixed) return unresolved_ufixed;
  function minimum (l, r : unresolved_ufixed) return unresolved_ufixed;
  function maximum (l, r : unresolved_sfixed) return unresolved_sfixed;
  function minimum (l, r : unresolved_sfixed) return unresolved_sfixed;

  ----------------------------------------------------------------------------
  -- In these compare functions a natural is converted into a
  -- fixed point number of the bounds "maximum(l'high,0) downto 0"
  ----------------------------------------------------------------------------

  function "="  (l : unresolved_ufixed; r : natural) return boolean;
  function "/=" (l : unresolved_ufixed; r : natural) return boolean;
  function ">=" (l : unresolved_ufixed; r : natural) return boolean;
  function "<=" (l : unresolved_ufixed; r : natural) return boolean;
  function ">"  (l : unresolved_ufixed; r : natural) return boolean;
  function "<"  (l : unresolved_ufixed; r : natural) return boolean;

  function "="  (l : natural; r : unresolved_ufixed) return boolean;
  function "/=" (l : natural; r : unresolved_ufixed) return boolean;
  function ">=" (l : natural; r : unresolved_ufixed) return boolean;
  function "<=" (l : natural; r : unresolved_ufixed) return boolean;
  function ">"  (l : natural; r : unresolved_ufixed) return boolean;
  function "<"  (l : natural; r : unresolved_ufixed) return boolean;

  function "?="  (l : unresolved_ufixed; r : natural) return std_ulogic;
  function "?/=" (l : unresolved_ufixed; r : natural) return std_ulogic;
  function "?>=" (l : unresolved_ufixed; r : natural) return std_ulogic;
  function "?<=" (l : unresolved_ufixed; r : natural) return std_ulogic;
  function "?>"  (l : unresolved_ufixed; r : natural) return std_ulogic;
  function "?<"  (l : unresolved_ufixed; r : natural) return std_ulogic;

  function "?="  (l : natural; r : unresolved_ufixed) return std_ulogic;
  function "?/=" (l : natural; r : unresolved_ufixed) return std_ulogic;
  function "?>=" (l : natural; r : unresolved_ufixed) return std_ulogic;
  function "?<=" (l : natural; r : unresolved_ufixed) return std_ulogic;
  function "?>"  (l : natural; r : unresolved_ufixed) return std_ulogic;
  function "?<"  (l : natural; r : unresolved_ufixed) return std_ulogic;

  function maximum (l : unresolved_ufixed; r : natural) return unresolved_ufixed;
  function minimum (l : unresolved_ufixed; r : natural) return unresolved_ufixed;
  function maximum (l : natural; r : unresolved_ufixed) return unresolved_ufixed;
  function minimum (l : natural; r : unresolved_ufixed) return unresolved_ufixed;

  ----------------------------------------------------------------------------
  -- in these compare functions a real is converted into a
  -- fixed point number of the bounds "l'high+1 downto l'low"
  ----------------------------------------------------------------------------

  function "="  (l : unresolved_ufixed; r : real) return boolean;
  function "/=" (l : unresolved_ufixed; r : real) return boolean;
  function ">=" (l : unresolved_ufixed; r : real) return boolean;
  function "<=" (l : unresolved_ufixed; r : real) return boolean;
  function ">"  (l : unresolved_ufixed; r : real) return boolean;
  function "<"  (l : unresolved_ufixed; r : real) return boolean;

  function "="  (l : real; r : unresolved_ufixed) return boolean;
  function "/=" (l : real; r : unresolved_ufixed) return boolean;
  function ">=" (l : real; r : unresolved_ufixed) return boolean;
  function "<=" (l : real; r : unresolved_ufixed) return boolean;
  function ">"  (l : real; r : unresolved_ufixed) return boolean;
  function "<"  (l : real; r : unresolved_ufixed) return boolean;

  function "?="  (l : unresolved_ufixed; r : real) return std_ulogic;
  function "?/=" (l : unresolved_ufixed; r : real) return std_ulogic;
  function "?>=" (l : unresolved_ufixed; r : real) return std_ulogic;
  function "?<=" (l : unresolved_ufixed; r : real) return std_ulogic;
  function "?>"  (l : unresolved_ufixed; r : real) return std_ulogic;
  function "?<"  (l : unresolved_ufixed; r : real) return std_ulogic;

  function "?="  (l : real; r : unresolved_ufixed) return std_ulogic;
  function "?/=" (l : real; r : unresolved_ufixed) return std_ulogic;
  function "?>=" (l : real; r : unresolved_ufixed) return std_ulogic;
  function "?<=" (l : real; r : unresolved_ufixed) return std_ulogic;
  function "?>"  (l : real; r : unresolved_ufixed) return std_ulogic;
  function "?<"  (l : real; r : unresolved_ufixed) return std_ulogic;

  function maximum (l : unresolved_ufixed; r : real) return unresolved_ufixed;
  function maximum (l : real; r : unresolved_ufixed) return unresolved_ufixed;
  function minimum (l : unresolved_ufixed; r : real) return unresolved_ufixed;
  function minimum (l : real; r : unresolved_ufixed) return unresolved_ufixed;

  ----------------------------------------------------------------------------
  -- in these compare functions an integer is converted into a
  -- fixed point number of the bounds "maximum(l'high,1) downto 0"
  ----------------------------------------------------------------------------

  function "="  (l : unresolved_sfixed; r : integer) return boolean;
  function "/=" (l : unresolved_sfixed; r : integer) return boolean;
  function ">=" (l : unresolved_sfixed; r : integer) return boolean;
  function "<=" (l : unresolved_sfixed; r : integer) return boolean;
  function ">"  (l : unresolved_sfixed; r : integer) return boolean;
  function "<"  (l : unresolved_sfixed; r : integer) return boolean;

  function "="  (l : integer; r : unresolved_sfixed) return boolean;
  function "/=" (l : integer; r : unresolved_sfixed) return boolean;
  function ">=" (l : integer; r : unresolved_sfixed) return boolean;
  function "<=" (l : integer; r : unresolved_sfixed) return boolean;
  function ">"  (l : integer; r : unresolved_sfixed) return boolean;
  function "<"  (l : integer; r : unresolved_sfixed) return boolean;

  function "?="  (l : unresolved_sfixed; r : integer) return std_ulogic;
  function "?/=" (l : unresolved_sfixed; r : integer) return std_ulogic;
  function "?>=" (l : unresolved_sfixed; r : integer) return std_ulogic;
  function "?<=" (l : unresolved_sfixed; r : integer) return std_ulogic;
  function "?>"  (l : unresolved_sfixed; r : integer) return std_ulogic;
  function "?<"  (l : unresolved_sfixed; r : integer) return std_ulogic;

  function "?="  (l : integer; r : unresolved_sfixed) return std_ulogic;
  function "?/=" (l : integer; r : unresolved_sfixed) return std_ulogic;
  function "?>=" (l : integer; r : unresolved_sfixed) return std_ulogic;
  function "?<=" (l : integer; r : unresolved_sfixed) return std_ulogic;
  function "?>"  (l : integer; r : unresolved_sfixed) return std_ulogic;
  function "?<"  (l : integer; r : unresolved_sfixed) return std_ulogic;

  function maximum (l : unresolved_sfixed; r : integer) return unresolved_sfixed;
  function maximum (l : integer; r : unresolved_sfixed) return unresolved_sfixed;
  function minimum (l : unresolved_sfixed; r : integer) return unresolved_sfixed;
  function minimum (l : integer; r : unresolved_sfixed) return unresolved_sfixed;

  ----------------------------------------------------------------------------
  -- in these compare functions a real is converted into a
  -- fixed point number of the bounds "l'high+1 downto l'low"
  ----------------------------------------------------------------------------

  function "="  (l : unresolved_sfixed; r : real) return boolean;
  function "/=" (l : unresolved_sfixed; r : real) return boolean;
  function ">=" (l : unresolved_sfixed; r : real) return boolean;
  function "<=" (l : unresolved_sfixed; r : real) return boolean;
  function ">"  (l : unresolved_sfixed; r : real) return boolean;
  function "<"  (l : unresolved_sfixed; r : real) return boolean;

  function "="  (l : real; r : unresolved_sfixed) return boolean;
  function "/=" (l : real; r : unresolved_sfixed) return boolean;
  function ">=" (l : real; r : unresolved_sfixed) return boolean;
  function "<=" (l : real; r : unresolved_sfixed) return boolean;
  function ">"  (l : real; r : unresolved_sfixed) return boolean;
  function "<"  (l : real; r : unresolved_sfixed) return boolean;

  function "?="  (l : unresolved_sfixed; r : real) return std_ulogic;
  function "?/=" (l : unresolved_sfixed; r : real) return std_ulogic;
  function "?>=" (l : unresolved_sfixed; r : real) return std_ulogic;
  function "?<=" (l : unresolved_sfixed; r : real) return std_ulogic;
  function "?>"  (l : unresolved_sfixed; r : real) return std_ulogic;
  function "?<"  (l : unresolved_sfixed; r : real) return std_ulogic;

  function "?="  (l : real; r : unresolved_sfixed) return std_ulogic;
  function "?/=" (l : real; r : unresolved_sfixed) return std_ulogic;
  function "?>=" (l : real; r : unresolved_sfixed) return std_ulogic;
  function "?<=" (l : real; r : unresolved_sfixed) return std_ulogic;
  function "?>"  (l : real; r : unresolved_sfixed) return std_ulogic;
  function "?<"  (l : real; r : unresolved_sfixed) return std_ulogic;

  function maximum (l : unresolved_sfixed; r : real) return unresolved_sfixed;
  function maximum (l : real; r : unresolved_sfixed) return unresolved_sfixed;
  function minimum (l : unresolved_sfixed; r : real) return unresolved_sfixed;
  function minimum (l : real; r : unresolved_sfixed) return unresolved_sfixed;

  --===========================================================================
  -- shift and rotate functions.
  -- note that sra and sla are not the same as the bit_vector version
  --===========================================================================

  function "sll" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "srl" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "rol" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "ror" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "sla" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "sra" (arg : unresolved_ufixed; count : integer) return unresolved_ufixed;
  function "sll" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function "srl" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function "rol" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function "ror" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function "sla" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function "sra" (arg : unresolved_sfixed; count : integer) return unresolved_sfixed;
  function shift_left  (arg : unresolved_ufixed; count : natural) return unresolved_ufixed;
  function shift_right (arg : unresolved_ufixed; count : natural) return unresolved_ufixed;
  function shift_left  (arg : unresolved_sfixed; count : natural) return unresolved_sfixed;
  function shift_right (arg : unresolved_sfixed; count : natural) return unresolved_sfixed;

  ----------------------------------------------------------------------------
  -- logical functions
  ----------------------------------------------------------------------------

  function "not"  (l    : unresolved_ufixed) return unresolved_ufixed;
  function "and"  (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "or"   (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "nand" (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "nor"  (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "xor"  (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "xnor" (l, r : unresolved_ufixed) return unresolved_ufixed;
  function "not"  (l    : unresolved_sfixed) return unresolved_sfixed;
  function "and"  (l, r : unresolved_sfixed) return unresolved_sfixed;
  function "or"   (l, r : unresolved_sfixed) return unresolved_sfixed;
  function "nand" (l, r : unresolved_sfixed) return unresolved_sfixed;
  function "nor"  (l, r : unresolved_sfixed) return unresolved_sfixed;
  function "xor"  (l, r : unresolved_sfixed) return unresolved_sfixed;
  function "xnor" (l, r : unresolved_sfixed) return unresolved_sfixed;

  -- Vector and std_ulogic functions, same as functions in numeric_std

  function "and"  (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "and"  (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "or"   (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "or"   (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "nand" (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "nand" (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "nor"  (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "nor"  (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "xor"  (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "xor"  (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "xnor" (l : std_ulogic; r : unresolved_ufixed) return unresolved_ufixed;
  function "xnor" (l : unresolved_ufixed; r : std_ulogic) return unresolved_ufixed;
  function "and"  (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "and"  (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;
  function "or"   (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "or"   (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;
  function "nand" (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "nand" (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;
  function "nor"  (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "nor"  (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;
  function "xor"  (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "xor"  (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;
  function "xnor" (l : std_ulogic; r : unresolved_sfixed) return unresolved_sfixed;
  function "xnor" (l : unresolved_sfixed; r : std_ulogic) return unresolved_sfixed;

  -- Reduction operators, same as numeric_std functions

  function "and"  (l : unresolved_ufixed) return std_ulogic;
  function "nand" (l : unresolved_ufixed) return std_ulogic;
  function "or"   (l : unresolved_ufixed) return std_ulogic;
  function "nor"  (l : unresolved_ufixed) return std_ulogic;
  function "xor"  (l : unresolved_ufixed) return std_ulogic;
  function "xnor" (l : unresolved_ufixed) return std_ulogic;
  function "and"  (l : unresolved_sfixed) return std_ulogic;
  function "nand" (l : unresolved_sfixed) return std_ulogic;
  function "or"   (l : unresolved_sfixed) return std_ulogic;
  function "nor"  (l : unresolved_sfixed) return std_ulogic;
  function "xor"  (l : unresolved_sfixed) return std_ulogic;
  function "xnor" (l : unresolved_sfixed) return std_ulogic;

  -- returns arg'low-1 if not found

  function find_leftmost (arg : unresolved_ufixed; y : std_ulogic) return integer;
  function find_leftmost (arg : unresolved_sfixed; y : std_ulogic) return integer;

  -- returns arg'high+1 if not found

  function find_rightmost (arg : unresolved_ufixed; y : std_ulogic) return integer;
  function find_rightmost (arg : unresolved_sfixed; y : std_ulogic) return integer;

  --===========================================================================
  --   RESIZE Functions
  --===========================================================================
  -- resizes the number (larger or smaller)
  -- The returned result will be ufixed (left_index downto right_index)
  -- If "round_style" is fixed_round, then the result will be rounded.
  -- If the MSB of the remainder is a "1" AND the LSB of the unrounded result
  -- is a '1' or the lower bits of the remainder include a '1' then the result
  -- will be increased by the smallest representable number for that type.
  -- "overflow_style" can be fixed_saturate or fixed_wrap.
  -- In saturate mode, if the number overflows then the largest possible
  -- representable number is returned.  If wrap mode, then the upper bits
  -- of the number are truncated.

  function resize (
    arg                     : unresolved_ufixed;  -- input
    constant left_index     : integer;  -- integer portion
    constant right_index    : integer;  -- size of fraction
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  -- "size_res" functions create the size of the output from the indices
  -- of the "size_res" input.  the actual value of "size_res" is not used.
  function resize (
    arg                     : unresolved_ufixed;  -- input
    size_res                : unresolved_ufixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  -- Note that in "wrap" mode the sign bit is not replicated.  Thus the
  -- resize of a negative number can have a positive result in wrap mode.
  function resize (
    arg                     : unresolved_sfixed;  -- input
    constant left_index     : integer;            -- integer portion
    constant right_index    : integer;            -- size of fraction
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  function resize (
    arg                     : unresolved_sfixed;  -- input
    size_res                : unresolved_sfixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  --===========================================================================
  -- Conversion Functions
  --===========================================================================

  -- integer (natural) to unsigned fixed point.
  -- arguments are the upper and lower bounds of the number, thus
  -- ufixed (7 downto -3) <= to_ufixed (int, 7, -3);
  function to_ufixed (
    arg                     : natural;  -- integer
    constant left_index     : integer;  -- left index (high index)
    constant right_index    : integer                   := 0;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  function to_ufixed (
    arg                     : natural;            -- integer
    size_res                : unresolved_ufixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  -- real to unsigned fixed point
  function to_ufixed (
    arg                     : real;     -- real
    constant left_index     : integer;  -- left index (high index)
    constant right_index    : integer;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE;
    constant guard_bits     : natural                   := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  function to_ufixed (
    arg                     : real;     -- real
    size_res                : unresolved_ufixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE;
    constant guard_bits     : natural                   := FIXED_GUARD_BITS)
    return unresolved_ufixed;

  -- unsigned to unsigned fixed point
  function to_ufixed (
    arg                     : unresolved_unsigned;             -- unsigned
    constant left_index     : integer;  -- left index (high index)
    constant right_index    : integer                   := 0;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  function to_ufixed (
    arg                     : unresolved_unsigned;           -- unsigned
    size_res                : unresolved_ufixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_ufixed;

  -- Performs a conversion.  ufixed (arg'range) is returned
  function to_ufixed (
    arg : unresolved_unsigned)          -- unsigned
    return unresolved_ufixed;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : unresolved_ufixed;  -- fixed point input
    constant size           : natural;            -- length of output
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_unsigned;

  -- unsigned fixed point to unsigned
  function to_unsigned (
    arg                     : unresolved_ufixed;    -- fixed point input
    size_res                : unresolved_unsigned;  -- used for length of output
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_unsigned;

  -- unsigned fixed point to real
  function to_real (
    arg : unresolved_ufixed)            -- fixed point input
    return real;

  -- unsigned fixed point to integer
  function to_integer (
    arg                     : unresolved_ufixed;  -- fixed point input
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return natural;

  -- Integer to UNRESOLVED_sfixed
  function to_sfixed (
    arg                     : integer;   -- integer
    constant left_index     : integer;   -- left index (high index)
    constant right_index    : integer                   := 0;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  function to_sfixed (
    arg                     : integer;            -- integer
    size_res                : unresolved_sfixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  -- Real to sfixed
  function to_sfixed (
    arg                     : real;     -- real
    constant left_index     : integer;  -- left index (high index)
    constant right_index    : integer;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE;
    constant guard_bits     : natural                   := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  function to_sfixed (
    arg                     : real;     -- real
    size_res                : unresolved_sfixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE;
    constant guard_bits     : natural                   := FIXED_GUARD_BITS)
    return unresolved_sfixed;

  -- signed to sfixed
  function to_sfixed (
    arg                     : unresolved_signed;               -- signed
    constant left_index     : integer;  -- left index (high index)
    constant right_index    : integer                   := 0;  -- right index
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  function to_sfixed (
    arg                     : unresolved_signed;  -- signed
    size_res                : unresolved_sfixed;  -- for size only
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_sfixed;

  -- signed to sfixed (output assumed to be size of signed input)
  function to_sfixed (
    arg : unresolved_signed)            -- signed
    return unresolved_sfixed;

  -- Conversion from ufixed to sfixed
  function to_sfixed (
    arg : unresolved_ufixed)
    return unresolved_sfixed;

  -- signed fixed point to signed
  function to_signed (
    arg                     : unresolved_sfixed;  -- fixed point input
    constant size           : natural;            -- length of output
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_signed;

  -- signed fixed point to signed
  function to_signed (
    arg                     : unresolved_sfixed;  -- fixed point input
    size_res                : unresolved_signed;  -- used for length of output
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return unresolved_signed;

  -- signed fixed point to real
  function to_real (
    arg : unresolved_sfixed)            -- fixed point input
    return real;

  -- signed fixed point to integer
  function to_integer (
    arg                     : unresolved_sfixed;  -- fixed point input
    constant overflow_style : fixed_overflow_style_type := FIXED_OVERFLOW_STYLE;
    constant round_style    : fixed_round_style_type    := FIXED_ROUND_STYLE)
    return integer;

  -- Because of the fairly complicated sizing rules in the fixed point
  -- packages these functions are provided to compute the result ranges
  -- example:
  -- signal uf1 : ufixed (3 downto -3);
  -- signal uf2 : ufixed (4 downto -2);
  -- signal uf1multuf2 : ufixed (ufixed_high (3, -3, '*', 4, -2) downto
  --                             ufixed_low (3, -3, '*', 4, -2));
  -- uf1multuf2 <= uf1 * uf2;
  -- valid characters: '+', '-', '*', '/', 'r' or 'r' (rem), 'm' or 'm' (mod),
  --                   '1' (reciprocal), 'a' or 'a' (abs), 'n' or 'n' (unary -)

  function ufixed_high (left_index, right_index   : integer;
                        operation                 : character := 'x';
                        left_index2, right_index2 : integer   := 0)
    return integer;

  function ufixed_low (left_index, right_index   : integer;
                       operation                 : character := 'x';
                       left_index2, right_index2 : integer   := 0)
    return integer;

  function sfixed_high (left_index, right_index   : integer;
                        operation                 : character := 'x';
                        left_index2, right_index2 : integer   := 0)
    return integer;

  function sfixed_low (left_index, right_index   : integer;
                       operation                 : character := 'x';
                       left_index2, right_index2 : integer   := 0)
    return integer;

  -- Same as above, but using the "size_res" input only for their ranges:
  -- signal uf1multuf2 : ufixed (ufixed_high (uf1, '*', uf2) downto
  --                             ufixed_low (uf1, '*', uf2));
  -- uf1multuf2 <= uf1 * uf2;

  function ufixed_high (size_res  : unresolved_ufixed;
                        operation : character := 'x';
                        size_res2 : unresolved_ufixed)
    return integer;

  function ufixed_low (size_res  : unresolved_ufixed;
                       operation : character := 'x';
                       size_res2 : unresolved_ufixed)
    return integer;

  function sfixed_high (size_res  : unresolved_sfixed;
                        operation : character := 'x';
                        size_res2 : unresolved_sfixed)
    return integer;

  function sfixed_low (size_res  : unresolved_sfixed;
                       operation : character := 'x';
                       size_res2 : unresolved_sfixed)
    return integer;

  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_ufixed;

  -- purpose: returns a saturated number
  function saturate (
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_sfixed;

  function saturate (
    size_res : unresolved_ufixed)       -- only the size of this is used
    return unresolved_ufixed;

  function saturate (
    size_res : unresolved_sfixed)       -- only the size of this is used
    return unresolved_sfixed;

  --===========================================================================
  -- Translation Functions
  --===========================================================================

  -- maps meta-logical values
  function to_01 (
    s             : unresolved_ufixed;  -- fixed point input
    constant xmap : std_ulogic := '0')  -- map x to
    return unresolved_ufixed;

  -- maps meta-logical values
  function to_01 (
    s             : unresolved_sfixed;  -- fixed point input
    constant xmap : std_ulogic := '0')  -- map x to
    return unresolved_sfixed;

  function is_X    (arg : unresolved_ufixed) return boolean;
  function is_X    (arg : unresolved_sfixed) return boolean;
  function to_X01  (arg : unresolved_ufixed) return unresolved_ufixed;
  function to_X01  (arg : unresolved_sfixed) return unresolved_sfixed;
  function to_X01Z (arg : unresolved_ufixed) return unresolved_ufixed;
  function to_X01Z (arg : unresolved_sfixed) return unresolved_sfixed;
  function to_UX01 (arg : unresolved_ufixed) return unresolved_ufixed;
  function to_UX01 (arg : unresolved_sfixed) return unresolved_sfixed;

  -- straight vector conversion routines, needed for synthesis.
  -- These functions are here so that a std_logic_vector can be
  -- converted to and from sfixed and ufixed.  note that you can
  -- not convert these vectors because of their negative index.

  function to_slv (
    arg : unresolved_ufixed)            -- fixed point vector
    return std_logic_vector;
  alias to_stdlogicvector is to_slv [unresolved_ufixed return std_logic_vector];
  alias to_std_logic_vector is to_slv [unresolved_ufixed return std_logic_vector];

  function to_slv (
    arg : unresolved_sfixed)            -- fixed point vector
    return std_logic_vector;
  alias to_stdlogicvector is to_slv [unresolved_sfixed return std_logic_vector];
  alias to_std_logic_vector is to_slv [unresolved_sfixed return std_logic_vector];

  function to_sulv (
    arg : unresolved_ufixed)            -- fixed point vector
    return std_ulogic_vector;
  alias to_stdulogicvector is to_sulv [unresolved_ufixed return std_ulogic_vector];
  alias to_std_ulogic_vector is to_sulv [unresolved_ufixed return std_ulogic_vector];

  function to_sulv (
    arg : unresolved_sfixed)            -- fixed point vector
    return std_ulogic_vector;
  alias to_stdulogicvector is to_sulv [unresolved_sfixed return std_ulogic_vector];
  alias to_std_ulogic_vector is to_sulv [unresolved_sfixed return std_ulogic_vector];

  function to_ufixed (
    arg                  : std_ulogic_vector;  -- shifted vector
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_ufixed;

  function to_ufixed (
    arg      : std_ulogic_vector;       -- shifted vector
    size_res : unresolved_ufixed)       -- for size only
    return unresolved_ufixed;

  function to_sfixed (
    arg                  : std_ulogic_vector;  -- shifted vector
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_sfixed;

  function to_sfixed (
    arg      : std_ulogic_vector;       -- shifted vector
    size_res : unresolved_sfixed)       -- for size only
    return unresolved_sfixed;

  -- As a concession to those who use a graphical DSP environment,
  -- these functions take parameters in those tools format and create
  -- fixed point numbers.  these functions are designed to convert from
  -- a std_logic_vector to the vhdl fixed point format using the conventions
  -- of these packages.  in a pure vhdl environment you should use the
  -- "to_ufixed" and "to_sfixed" routines.

  -- unsigned fixed point
  function to_ufix (
    arg      : std_ulogic_vector;
    width    : natural;                 -- width of vector
    fraction : natural)                 -- width of fraction
    return unresolved_ufixed;

  -- signed fixed point
  function to_sfix (
    arg      : std_ulogic_vector;
    width    : natural;                 -- width of vector
    fraction : natural)                 -- width of fraction
    return unresolved_sfixed;

  -- finding the bounds of a number.  These functions can be used like this:
  -- signal xxx : ufixed (7 downto -3);
  -- -- which is the same as "ufixed (ufix_high (11,3) downto ufix_low(11,3))"
  -- signal yyy : ufixed (ufix_high (11, 3, "+", 11, 3)
  --               downto ufix_low(11, 3, "+", 11, 3));
  -- where "11" is the width of xxx (xxx'length),
  -- and 3 is the lower bound (abs (xxx'low))
  -- in a pure vhdl environment use "ufixed_high" and "ufixed_low"

  function ufix_high (width, fraction   : natural;
                      operation         : character := 'x';
                      width2, fraction2 : natural   := 0)
    return integer;

  function ufix_low (width, fraction   : natural;
                     operation         : character := 'x';
                     width2, fraction2 : natural   := 0)
    return integer;

  -- Same as above but for signed fixed point.  Note that the width
  -- of a signed fixed point number ignores the sign bit, thus
  -- width = sxxx'length-1

  function sfix_high (width, fraction   : natural;
                      operation         : character := 'x';
                      width2, fraction2 : natural   := 0)
    return integer;

  function sfix_low (width, fraction   : natural;
                     operation         : character := 'x';
                     width2, fraction2 : natural   := 0)
    return integer;

  --===========================================================================
  -- string and textio Functions
  --===========================================================================

  -- purpose: writes fixed point into a line
  procedure write (
    l         : inout line;               -- input line
    value     : in    unresolved_ufixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  -- purpose: writes fixed point into a line
  procedure write (
    l         : inout line;               -- input line
    value     : in    unresolved_sfixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  procedure read(l     : inout line;
                 value : out   unresolved_ufixed);

  procedure read(l     : inout line;
                 value : out   unresolved_ufixed;
                 good  : out   boolean);

  procedure read(l     : inout line;
                 value : out   unresolved_sfixed);

  procedure read(l     : inout line;
                 value : out   unresolved_sfixed;
                 good  : out   boolean);

  alias bwrite is write [line, unresolved_ufixed, side, width];
  alias bwrite is write [line, unresolved_sfixed, side, width];
  alias bread is read [line, unresolved_ufixed];
  alias bread is read [line, unresolved_ufixed, boolean];
  alias bread is read [line, unresolved_sfixed];
  alias bread is read [line, unresolved_sfixed, boolean];
  alias binary_write is write [line, unresolved_ufixed, side, width];
  alias binary_write is write [line, unresolved_sfixed, side, width];
  alias binary_read is read [line, unresolved_ufixed, boolean];
  alias binary_read is read [line, unresolved_ufixed];
  alias binary_read is read [line, unresolved_sfixed, boolean];
  alias binary_read is read [line, unresolved_sfixed];

  -- octal read and write

  procedure owrite (
    l         : inout line;               -- input line
    value     : in    unresolved_ufixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  procedure owrite (
    l         : inout line;               -- input line
    value     : in    unresolved_sfixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  procedure oread(l     : inout line;
                  value : out   unresolved_ufixed);

  procedure oread(l     : inout line;
                  value : out   unresolved_ufixed;
                  good  : out   boolean);

  procedure oread(l     : inout line;
                  value : out   unresolved_sfixed);

  procedure oread(l     : inout line;
                  value : out   unresolved_sfixed;
                  good  : out   boolean);
  alias octal_read is oread [line, unresolved_ufixed, boolean];
  alias octal_read is oread [line, unresolved_ufixed];
  alias octal_read is oread [line, unresolved_sfixed, boolean];
  alias octal_read is oread [line, unresolved_sfixed];
  alias octal_write is owrite [line, unresolved_ufixed, side, width];
  alias octal_write is owrite [line, unresolved_sfixed, side, width];

  -- hex read and write

  procedure hwrite (
    l         : inout line;               -- input line
    value     : in    unresolved_ufixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  -- purpose: writes fixed point into a line
  procedure hwrite (
    l         : inout line;               -- input line
    value     : in    unresolved_sfixed;  -- fixed point input
    justified : in    side  := right;
    field     : in    width := 0);

  procedure hread(l     : inout line;
                  value : out   unresolved_ufixed);

  procedure hread(l     : inout line;
                  value : out   unresolved_ufixed;
                  good  : out   boolean);

  procedure hread(l     : inout line;
                  value : out   unresolved_sfixed);

  procedure hread(l     : inout line;
                  value : out   unresolved_sfixed;
                  good  : out   boolean);
  alias hex_read is hread [line, unresolved_ufixed, boolean];
  alias hex_read is hread [line, unresolved_sfixed, boolean];
  alias hex_read is hread [line, unresolved_ufixed];
  alias hex_read is hread [line, unresolved_sfixed];
  alias hex_write is hwrite [line, unresolved_ufixed, side, width];
  alias hex_write is hwrite [line, unresolved_sfixed, side, width];

  -- returns a string, useful for:
  -- assert (x = y) report "error found " & to_string(x) severity error;
  function to_string (value : unresolved_ufixed) return string;

  alias to_bstring is to_string [unresolved_ufixed return string];
  alias to_binary_string is to_string [unresolved_ufixed return string];

  function to_ostring (value : unresolved_ufixed) return string;
  alias to_octal_string is to_ostring [unresolved_ufixed return string];

  function to_hstring (value : unresolved_ufixed) return string;
  alias to_hex_string is to_hstring [unresolved_ufixed return string];

  function to_string (value : unresolved_sfixed) return string;
  alias to_bstring is to_string [unresolved_sfixed return string];
  alias to_binary_string is to_string [unresolved_sfixed return string];

  function to_ostring (value : unresolved_sfixed) return string;
  alias to_octal_string is to_ostring [unresolved_sfixed return string];

  function to_hstring (value : unresolved_sfixed) return string;
  alias to_hex_string is to_hstring [unresolved_sfixed return string];

  -- From string functions allow you to convert a string into a fixed
  -- point number.  example:
  --  signal uf1 : ufixed (3 downto -3);
  --  uf1 <= from_string ("0110.100", uf1'high, uf1'low); -- 6.5
  -- the "." is optional in this syntax, however it exist and is
  -- in the wrong location an error is produced.  overflow will
  -- result in saturation.

  function from_string (
    bstring              : string;      -- binary string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_ufixed;
  alias from_bstring is from_string [string, integer, integer return unresolved_ufixed];
  alias from_binary_string is from_string [string, integer, integer return unresolved_ufixed];

  -- Octal and hex conversions work as follows:
  -- uf1 <= from_hstring ("6.8", 3, -3); -- 6.5 (bottom zeros dropped)
  -- uf1 <= from_ostring ("06.4", 3, -3); -- 6.5 (top zeros dropped)

  function from_ostring (
    ostring              : string;      -- octal string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_ufixed;
  alias from_octal_string is from_ostring [string, integer, integer return unresolved_ufixed];

  function from_hstring (
    hstring              : string;      -- hex string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_ufixed;
  alias from_hex_string is from_hstring [string, integer, integer return unresolved_ufixed];

  function from_string (
    bstring              : string;      -- binary string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_sfixed;
  alias from_bstring is from_string [string, integer, integer return unresolved_sfixed];
  alias from_binary_string is from_string [string, integer, integer return unresolved_sfixed];

  function from_ostring (
    ostring              : string;      -- octal string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_sfixed;
  alias from_octal_string is from_ostring [string, integer, integer return unresolved_sfixed];

  function from_hstring (
    hstring              : string;      -- hex string
    constant left_index  : integer;
    constant right_index : integer)
    return unresolved_sfixed;
  alias from_hex_string is from_hstring [string, integer, integer return unresolved_sfixed];

  -- Same as above, "size_res" is used for it's range only.

  function from_string (
    bstring  : string;                  -- binary string
    size_res : unresolved_ufixed)
    return unresolved_ufixed;
  alias from_bstring is from_string [string, unresolved_ufixed return unresolved_ufixed];
  alias from_binary_string is from_string [string, unresolved_ufixed return unresolved_ufixed];

  function from_ostring (
    ostring  : string;                  -- octal string
    size_res : unresolved_ufixed)
    return unresolved_ufixed;
  alias from_octal_string is from_ostring [string, unresolved_ufixed return unresolved_ufixed];

  function from_hstring (
    hstring  : string;                  -- hex string
    size_res : unresolved_ufixed)
    return unresolved_ufixed;
  alias from_hex_string is from_hstring [string, unresolved_ufixed return unresolved_ufixed];

  function from_string (
    bstring  : string;                  -- binary string
    size_res : unresolved_sfixed)
    return unresolved_sfixed;
  alias from_bstring is from_string [string, unresolved_sfixed return unresolved_sfixed];
  alias from_binary_string is from_string [string, unresolved_sfixed return unresolved_sfixed];

  function from_ostring (
    ostring  : string;                  -- octal string
    size_res : unresolved_sfixed)
    return unresolved_sfixed;
  alias from_octal_string is from_ostring [string, unresolved_sfixed return unresolved_sfixed];

  function from_hstring (
    hstring  : string;                  -- hex string
    size_res : unresolved_sfixed)
    return unresolved_sfixed;
  alias from_hex_string is from_hstring [string, unresolved_sfixed return unresolved_sfixed];

  -- Direct conversion functions.  example:
  --  signal uf1 : ufixed (3 downto -3);
  --  uf1 <= from_string ("0110.100"); -- 6.5
  -- in this case the "." is not optional, and the size of
  -- the output must match exactly.

  function from_string (
    bstring : string)                   -- binary string
    return unresolved_ufixed;
  alias from_bstring is from_string [string return unresolved_ufixed];
  alias from_binary_string is from_string [string return unresolved_ufixed];

  -- Direct octal and hex conversion functions.  in this case
  -- the string lengths must match.  example:
  -- signal sf1 := sfixed (5 downto -3);
  -- sf1 <= from_ostring ("71.4") -- -6.5

  function from_ostring (
    ostring : string)                   -- octal string
    return unresolved_ufixed;
  alias from_octal_string is from_ostring [string return unresolved_ufixed];

  function from_hstring (
    hstring : string)                   -- hex string
    return unresolved_ufixed;
  alias from_hex_string is from_hstring [string return unresolved_ufixed];

  function from_string (
    bstring : string)                   -- binary string
    return unresolved_sfixed;
  alias from_bstring is from_string [string return unresolved_sfixed];
  alias from_binary_string is from_string [string return unresolved_sfixed];

  function from_ostring (
    ostring : string)                   -- octal string
    return unresolved_sfixed;
  alias from_octal_string is from_ostring [string return unresolved_sfixed];

  function from_hstring (
    hstring : string)                   -- hex string
    return unresolved_sfixed;
  alias from_hex_string is from_hstring [string return unresolved_sfixed];

end package fixed_generic_pkg;
