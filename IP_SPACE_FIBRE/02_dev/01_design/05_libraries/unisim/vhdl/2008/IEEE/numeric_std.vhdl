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
--   Title     :  Standard VHDL Synthesis Packages
--             :  (NUMERIC_STD package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  IEEE DASC Synthesis Working Group,
--             :  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Two numeric types are defined:
--             :  -- > UNRESOLVED_UNSIGNED: represents an UNSIGNED number
--             :       in vector form
--             :  -- > UNRESOLVED_SIGNED: represents a SIGNED number
--             :       in vector form
--             :  The base element type is type STD_ULOGIC.
--             :  Aliases U_UNSIGNED and U_SIGNED are defined for the types
--             :  UNRESOLVED_UNSIGNED and UNRESOLVED_SIGNED, respectively.
--             :  Two numeric subtypes are defined:
--             :  -- > UNSIGNED: represents UNSIGNED number in vector form
--             :  -- > SIGNED: represents a SIGNED number in vector form
--             :  The element subtypes are the same subtype as STD_LOGIC.
--             :  The leftmost bit is treated as the most significant bit.
--             :  Signed vectors are represented in two's complement form.
--             :  This package contains overloaded arithmetic operators on
--             :  the SIGNED and UNSIGNED types. The package also contains
--             :  useful type conversions functions, clock detection
--             :  functions, and other utility functions.
--             :
--             :  If any argument to a function is a null array, a null array
--             :  is returned (exceptions, if any, are noted individually).
--
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
-- $Revision: 1220 $
-- $Date: 2008-04-10 17:16:09 +0930 (Thu, 10 Apr 2008) $
-- --------------------------------------------------------------------

use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;

package numeric_std is
  constant CopyRightNotice : string
    := "Copyright © 2008 IEEE. All rights reserved.";


  --============================================================================
  -- Numeric Array Type Definitions
  --============================================================================

  type unresolved_unsigned is array (natural range <>) of std_ulogic;
  type unresolved_signed is array (natural range <>) of std_ulogic;

  alias u_unsigned is unresolved_unsigned;
  alias u_signed is unresolved_signed;

  subtype unsigned is (resolved) unresolved_unsigned;
  subtype signed is (resolved) unresolved_signed;

  --============================================================================
  -- Arithmetic Operators:
  --===========================================================================

  --```
  -- Id: A.1
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Returns the absolute value of an unresolved_signed vector arg.
  --```
  function "abs" (arg : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.2
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Returns the value of the unary minus operation on a
  --         unresolved_signed vector arg.
  --```
  function "-" (arg : unresolved_signed) return unresolved_signed;

  --============================================================================

  --```
  -- Id: A.3
  -- Result subtype: unresolved_unsigned(maximum(l'length, r'length)-1 downto 0)
  -- Result: Adds two unresolved_unsigned vectors that may be of different lengths.
  --```
  function "+" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.3R
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Similar to A.3 where r is a one bit unresolved_unsigned
  --```
  function "+"(l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: A.3L
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Similar to A.3 where l is a one bit unresolved_unsigned
  --```
  function "+"(l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.4
  -- Result subtype: unresolved_signed(maximum(l'length, r'length)-1 downto 0)
  -- Result: Adds two unresolved_signed vectors that may be of different lengths.
  --```
  function "+" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.4R
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Similar to A.4 where r is bit 0 of a non-negative.
  --```
  function "+"(l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: A.4L
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Similar to A.4 where l is bit 0 of a non-negative.
  --```
  function "+"(l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.5
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Adds an unresolved_unsigned vector, l, with a nonnegative integer, r.
  --```
  function "+" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.6
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Adds a nonnegative integer, l, with an unresolved_unsigned vector, r.
  --```
  function "+" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.7
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Adds an integer, l(may be positive or negative), to an unresolved_signed
  --         vector, r.
  --```
  function "+" (l : integer; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.8
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Adds an unresolved_signed vector, l, to an integer, r.
  --```
  function "+" (l : unresolved_signed; r : integer) return unresolved_signed;

  --============================================================================

  --```
  -- Id: A.9
  -- Result subtype: unresolved_unsigned(maximum(l'length, r'length)-1 downto 0)
  -- Result: Subtracts two unresolved_unsigned vectors that may be of different lengths.
  --```
  function "-" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.9R
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Similar to A.9 where r is a one bit unresolved_unsigned
  --```
  function "-"(l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: A.9L
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Similar to A.9 where l is a one bit unresolved_unsigned
  --```
  function "-"(l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.10
  -- Result subtype: unresolved_signed(maximum(l'length, r'length)-1 downto 0)
  -- Result: Subtracts an unresolved_signed vector, r, from another unresolved_signed vector, l,
  --         that may possibly be of different lengths.
  --```
  function "-" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.10R
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Similar to A.10 where r is bit 0 of a non-negative.
  --```
  function "-"(l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: A.10L
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Similar to A.10 where r is bit 0 of a non-negative.
  --```
  function "-"(l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.11
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Subtracts a nonnegative integer, r, from an unresolved_unsigned vector, l.
  --```
  function "-" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.12
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Subtracts an unresolved_unsigned vector, r, from a nonnegative integer, l.
  --```
  function "-" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.13
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Subtracts an integer, r, from an unresolved_signed vector, l.
  --```
  function "-" (l : unresolved_signed; r : integer) return unresolved_signed;

  --```
  -- Id: A.14
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Subtracts an unresolved_signed vector, r, from an integer, l.
  --```
  function "-" (l : integer; r : unresolved_signed) return unresolved_signed;

  --============================================================================

  --```
  -- Id: A.15
  -- Result subtype: unresolved_unsigned((l'length+r'length-1) downto 0)
  -- Result: Performs the multiplication operation on two unresolved_unsigned vectors
  --         that may possibly be of different lengths.
  --```
  function "*" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.16
  -- Result subtype: unresolved_signed((l'length+r'length-1) downto 0)
  -- Result: Multiplies two unresolved_signed vectors that may possibly be of
  --         different lengths.
  --```
  function "*" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.17
  -- Result subtype: unresolved_unsigned((l'length+l'length-1) downto 0)
  -- Result: Multiplies an unresolved_unsigned vector, l, with a nonnegative
  --         integer, r. r is converted to an unresolved_unsigned vector of
  --         size l'length before multiplication.
  --```
  function "*" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.18
  -- Result subtype: unresolved_unsigned((r'length+r'length-1) downto 0)
  -- Result: Multiplies an unresolved_unsigned vector, r, with a nonnegative
  --         integer, l. l is converted to an unresolved_unsigned vector of
  --         size r'length before multiplication.
  --```
  function "*" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.19
  -- Result subtype: unresolved_signed((l'length+l'length-1) downto 0)
  -- Result: Multiplies an unresolved_signed vector, l, with an integer, r. r is
  --         converted to an unresolved_signed vector of size l'length before
  --         multiplication.
  --```
  function "*" (l : unresolved_signed; r : integer) return unresolved_signed;

  --```
  -- Id: A.20
  -- Result subtype: unresolved_signed((r'length+r'length-1) downto 0)
  -- Result: Multiplies an unresolved_signed vector, r, with an integer, l. l is
  --         converted to an unresolved_signed vector of size r'length before
  --         multiplication.
  --```
  function "*" (l : integer; r : unresolved_signed) return unresolved_signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.21
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Divides an unresolved_unsigned vector, l, by another unresolved_unsigned vector, r.
  --```
  function "/" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.22
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Divides an unresolved_signed vector, l, by another unresolved_signed vector, r.
  --```
  function "/" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.23
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Divides an unresolved_unsigned vector, l, by a nonnegative integer, r.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "/" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.24
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Divides a nonnegative integer, l, by an unresolved_unsigned vector, r.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "/" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.25
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Divides an unresolved_signed vector, l, by an integer, r.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "/" (l : unresolved_signed; r : integer) return unresolved_signed;

  --```
  -- Id: A.26
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Divides an integer, l, by an unresolved_signed vector, r.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "/" (l : integer; r : unresolved_signed) return unresolved_signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.27
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Computes "l rem r" where l and r are unresolved_unsigned vectors.
  --```
  function "rem" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.28
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Computes "l rem r" where l and r are unresolved_signed vectors.
  --```
  function "rem" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.29
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Computes "l rem r" where l is an unresolved_unsigned vector and r is a
  --         nonnegative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "rem" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.30
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Computes "l rem r" where r is an unresolved_unsigned vector and l is a
  --         nonnegative integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "rem" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.31
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Computes "l rem r" where l is unresolved_signed vector and r is an integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "rem" (l : unresolved_signed; r : integer) return unresolved_signed;

  --```
  -- Id: A.32
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Computes "l rem r" where r is unresolved_signed vector and l is an integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "rem" (l : integer; r : unresolved_signed) return unresolved_signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.33
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l and r are unresolved_unsigned vectors.
  --```
  function "mod" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.34
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l and r are unresolved_signed vectors.
  --```
  function "mod" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: A.35
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an unresolved_unsigned vector and r
  --         is a nonnegative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "mod" (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: A.36
  -- Result subtype: unresolved_unsigned(r'length-1 downto 0)
  -- Result: Computes "l mod r" where r is an unresolved_unsigned vector and l
  --         is a nonnegative integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "mod" (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: A.37
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an unresolved_signed vector and
  --         r is an integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "mod" (l : unresolved_signed; r : integer) return unresolved_signed;

  --```
  -- Id: A.38
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an integer and
  --         r is an unresolved_signed vector.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "mod" (l : integer; r : unresolved_signed) return unresolved_signed;

  --============================================================================

  --```
  -- Id: A.39
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (arg : unresolved_unsigned; y : std_ulogic) return integer;

  --```
  -- Id: A.40
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (arg : unresolved_signed; y : std_ulogic) return integer;

  --```
  -- Id: A.41
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (arg : unresolved_unsigned; y : std_ulogic) return integer;

  --```
  -- Id: A.42
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (arg : unresolved_signed; y : std_ulogic) return integer;

  --============================================================================
  -- Comparison Operators
  --============================================================================

  --```
  -- Id: C.1
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function ">" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.2
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function ">" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.3
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function ">" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.4
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a integer and
  --         r is an unresolved_signed vector.
  --```
  function ">" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.5
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function ">" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.6
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is an unresolved_signed vector and
  --         r is a integer.
  --```
  function ">" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.7
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "<" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.8
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "<" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.9
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "<" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.10
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "<" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.11
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "<" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.12
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "<" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.13
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "<=" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.14
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "<=" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.15
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "<=" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.16
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "<=" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.17
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "<=" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.18
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "<=" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.19
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function ">=" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.20
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function ">=" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.21
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function ">=" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.22
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function ">=" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.23
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function ">=" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.24
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function ">=" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.25
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "=" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.26
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "=" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.27
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "=" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.28
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "=" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.29
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "=" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.30
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "=" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.31
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "/=" (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.32
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "/=" (l, r : unresolved_signed) return boolean;

  --```
  -- Id: C.33
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "/=" (l : natural; r : unresolved_unsigned) return boolean;

  --```
  -- Id: C.34
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "/=" (l : integer; r : unresolved_signed) return boolean;

  --```
  -- Id: C.35
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "/=" (l : unresolved_unsigned; r : natural) return boolean;

  --```
  -- Id: C.36
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "/=" (l : unresolved_signed; r : integer) return boolean;

  --============================================================================

  --```
  -- Id: C.37
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the lesser of two unresolved_unsigned vectors that may be
  --         of different lengths.
  --```
  function minimum (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: C.38
  -- Result subtype: unresolved_signed
  -- Result: Returns the lesser of two unresolved_signed vectors that may be
  --         of different lengths.
  --```
  function minimum (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: C.39
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the lesser of a nonnegative integer, l, and
  --         an unresolved_unsigned vector, r.
  --```
  function minimum (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: C.40
  -- Result subtype: unresolved_signed
  -- Result: Returns the lesser of an integer, l, and an unresolved_signed
  --         vector, r.
  --```
  function minimum (l : integer; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: C.41
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the lesser of an unresolved_unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function minimum (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: C.42
  -- Result subtype: unresolved_signed
  -- Result: Returns the lesser of an unresolved_signed vector, l, and
  --         an integer, r.
  --```
  function minimum (l : unresolved_signed; r : integer) return unresolved_signed;

  --============================================================================

  --```
  -- Id: C.43
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the greater of two unresolved_unsigned vectors that may be
  --         of different lengths.
  --```
  function maximum (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: C.44
  -- Result subtype: unresolved_signed
  -- Result: Returns the greater of two unresolved_signed vectors that may be
  --         of different lengths.
  --```
  function maximum (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: C.45
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the greater of a nonnegative integer, l, and
  --         an unresolved_unsigned vector, r.
  --```
  function maximum (l : natural; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: C.46
  -- Result subtype: unresolved_signed
  -- Result: Returns the greater of an integer, l, and an unresolved_signed
  --         vector, r.
  --```
  function maximum (l : integer; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: C.47
  -- Result subtype: unresolved_unsigned
  -- Result: Returns the greater of an unresolved_unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function maximum (l : unresolved_unsigned; r : natural) return unresolved_unsigned;

  --```
  -- Id: C.48
  -- Result subtype: unresolved_signed
  -- Result: Returns the greater of an unresolved_signed vector, l, and
  --         an integer, r.
  --```
  function maximum (l : unresolved_signed; r : integer) return unresolved_signed;

  --============================================================================

  --```
  -- Id: C.49
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.50
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?>" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.51
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?>" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.52
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is a integer and
  --         r is an unresolved_signed vector.
  --```
  function "?>" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.53
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.54
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is an unresolved_signed vector and
  --         r is a integer.
  --```
  function "?>" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.55
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.56
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?<" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.57
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?<" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.58
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "?<" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.59
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.60
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "?<" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.61
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<=" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.62
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?<=" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.63
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?<=" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.64
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "?<=" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.65
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<=" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.66
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "?<=" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.67
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>=" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.68
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?>=" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.69
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?>=" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.70
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "?>=" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.71
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>=" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.72
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "?>=" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.73
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?=" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.74
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?=" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.75
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?=" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.76
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "?=" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.77
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?=" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.78
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "?=" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.79
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l and r are unresolved_unsigned vectors possibly
  --         of different lengths.
  --```
  function "?/=" (l, r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.80
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l and r are unresolved_signed vectors possibly
  --         of different lengths.
  --```
  function "?/=" (l, r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.81
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l is a nonnegative integer and
  --         r is an unresolved_unsigned vector.
  --```
  function "?/=" (l : natural; r : unresolved_unsigned) return std_ulogic;

  --```
  -- Id: C.82
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l is an integer and
  --         r is an unresolved_signed vector.
  --```
  function "?/=" (l : integer; r : unresolved_signed) return std_ulogic;

  --```
  -- Id: C.83
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l is an unresolved_unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?/=" (l : unresolved_unsigned; r : natural) return std_ulogic;

  --```
  -- Id: C.84
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l is an unresolved_signed vector and
  --         r is an integer.
  --```
  function "?/=" (l : unresolved_signed; r : integer) return std_ulogic;

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  --```
  -- Id: S.1
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Performs a shift-left on an unresolved_unsigned vector count times.
  --         the vacated positions are filled with '0'.
  --         the count leftmost elements are lost.
  --```
  function shift_left (arg : unresolved_unsigned; count : natural) return unresolved_unsigned;

  --```
  -- Id: S.2
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Performs a shift-right on an unresolved_unsigned vector count times.
  --         the vacated positions are filled with '0'.
  --         the count rightmost elements are lost.
  --```
  function shift_right (arg : unresolved_unsigned; count : natural) return unresolved_unsigned;

  --```
  -- Id: S.3
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Performs a shift-left on an unresolved_signed vector count times.
  --         the vacated positions are filled with '0'.
  --         the count leftmost elements are lost.
  --```
  function shift_left (arg : unresolved_signed; count : natural) return unresolved_signed;

  --```
  -- Id: S.4
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Performs a shift-right on an unresolved_signed vector count times.
  --         the vacated positions are filled with the leftmost
  --         element, arg'left. the count rightmost elements are lost.
  --```
  function shift_right (arg : unresolved_signed; count : natural) return unresolved_signed;

  --============================================================================

  --```
  -- Id: S.5
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Performs a rotate-left of an unresolved_unsigned vector count times.
  --```
  function rotate_left (arg : unresolved_unsigned; count : natural) return unresolved_unsigned;

  --```
  -- Id: S.6
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Performs a rotate-right of an unresolved_unsigned vector count times.
  --```
  function rotate_right (arg : unresolved_unsigned; count : natural) return unresolved_unsigned;

  --```
  -- Id: S.7
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Performs a logical rotate-left of an unresolved_signed
  --         vector count times.
  --```
  function rotate_left (arg : unresolved_signed; count : natural) return unresolved_signed;

  --```
  -- Id: S.8
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Performs a logical rotate-right of an unresolved_signed
  --         vector count times.
  --```
  function rotate_right (arg : unresolved_signed; count : natural) return unresolved_signed;

  --============================================================================

  --============================================================================

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  --```
  function "sll" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.10 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.10
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  --```
  function "sll" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE StdL 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.11
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Shift_right(arg, count)
  --```
  function "srl" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.12 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.12
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Unresolved_signed(shift_right(unresolved_unsigned(arg), count))
  --```
  function "srl" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.13
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Rotate_left(arg, count)
  --```
  function "rol" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.14 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.14
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Rotate_left(arg, count)
  --```
  function "rol" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.15
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Rotate_right(arg, count)
  --```
  function "ror" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  --   Note: Function S.16 is not compatible with IEEE Std 1076-1987. Comment
  --   out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.16
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Rotate_right(arg, count)
  --```
  function "ror" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  --```
  function "sla" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.18 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.18
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  --```
  function "sla" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  -- Result subtype: unresolved_unsigned(arg'length-1 downto 0)
  -- Result: Shift_right(arg, count)
  --```
  function "sra" (arg : unresolved_unsigned; count : integer) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.20 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.20
  -- Result subtype: unresolved_signed(arg'length-1 downto 0)
  -- Result: Shift_right(arg, count)
  --```
  function "sra" (arg : unresolved_signed; count : integer) return unresolved_signed;

  --============================================================================
  --   RESIZE Functions
  --============================================================================

  --```
  -- Id: R.1
  -- Result subtype: unresolved_signed(new_size-1 downto 0)
  -- Result: Resizes the unresolved_signed vector arg to the specified size.
  --         to create a larger vector, the new [leftmost] bit positions
  --         are filled with the sign bit (arg'left). when truncating,
  --         the sign bit is retained along with the rightmost part.
  --```
  function resize (arg : unresolved_signed; new_size : natural) return unresolved_signed;

  --```
  -- Id: R.2
  -- Result subtype: unresolved_unsigned(new_size-1 downto 0)
  -- Result: Resizes the unresolved_signed vector arg to the specified size.
  --         to create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. when truncating, the leftmost bits
  --         are dropped.
  --```
  function resize (arg : unresolved_unsigned; new_size : natural) return unresolved_unsigned;

  -- Result subtype: unresolved_unsigned (size_res'length-1 downto 0)
  function resize (arg, size_res : unresolved_unsigned) return unresolved_unsigned;

  -- Result subtype: unresolved_signed (size_res'length-1 downto 0)
  function resize (arg, size_res : unresolved_signed) return unresolved_signed;

  --============================================================================
  -- Conversion Functions
  --============================================================================

  --```
  -- Id: D.1
  -- Result subtype: natural. value cannot be negative since parameter is an
  --             UNRESOLVED_UNSIGNED vector.
  -- Result: Converts the unresolved_unsigned vector to an integer.
  --```
  function to_integer (arg : unresolved_unsigned) return natural;

  --```
  -- Id: D.2
  -- Result subtype: integer
  -- Result: Converts an unresolved_signed vector to an integer.
  --```
  function to_integer (arg : unresolved_signed) return integer;

  --```
  -- Id: D.3
  -- Result subtype: unresolved_unsigned(size-1 downto 0)
  -- Result: Converts a nonnegative integer to an unresolved_unsigned vector with
  --         the specified size.
  --```
  function to_unsigned (arg, size : natural) return unresolved_unsigned;

  --```
  -- Id: D.4
  -- Result subtype: unresolved_signed(size-1 downto 0)
  -- Result: Converts an integer to a unresolved_signed vector of the specified size.
  --```
  function to_signed (arg : integer; size : natural) return unresolved_signed;

  -- Result subtype: unresolved_unsigned(size_res'length-1 downto 0)
  function to_unsigned (arg : natural; size_res : unresolved_unsigned) return unresolved_unsigned;

  -- Result subtype: unresolved_signed(size_res'length-1 downto 0)
  function to_signed (arg : integer; size_res : unresolved_signed) return unresolved_signed;

  --============================================================================
  -- Logical Operators
  --============================================================================

  --```
  -- Id: L.1
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Termwise inversion
  --```
  function "not" (l : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.2
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector and operation
  --```
  function "and" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.3
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector or operation
  --```
  function "or" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.4
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector nand operation
  --```
  function "nand" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.5
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector nor operation
  --```
  function "nor" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.6
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector xor operation
  --```
  function "xor" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- ---------------------------------------------------------------------------
  -- Note: Function L.7 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  -- ---------------------------------------------------------------------------
  -- Id: L.7
  -- Result subtype: unresolved_unsigned(l'length-1 downto 0)
  -- Result: Vector xnor operation
  --```
  function "xnor" (l, r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.8
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Termwise inversion
  --```
  function "not" (l : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.9
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector and operation
  --```
  function "and" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.10
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector or operation
  --```
  function "or" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.11
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector nand operation
  --```
  function "nand" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.12
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector nor operation
  --```
  function "nor" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.13
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector xor operation
  --```
  function "xor" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- ---------------------------------------------------------------------------
  -- Note: Function L.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  -- ---------------------------------------------------------------------------
  -- Id: L.14
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector xnor operation
  --```
  function "xnor" (l, r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.15
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector and operation
  --```
  function "and" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.16
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar and operation
  --```
  function "and" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: L.17
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector or operation
  --```
  function "or" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.18
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar or operation
  --```
  function "or" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: L.19
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector nand operation
  --```
  function "nand" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.20
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar nand operation
  --```
  function "nand" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: L.21
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector nor operation
  --```
  function "nor" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.22
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar nor operation
  --```
  function "nor" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: L.23
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector xor operation
  --```
  function "xor" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: L.24
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar xor operation
  --```
  function "xor" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.25 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.25
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector xnor operation
  --```
  function "xnor" (l : std_ulogic; r : unresolved_unsigned) return unresolved_unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.26 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.26
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar xnor operation
  --```
  function "xnor" (l : unresolved_unsigned; r : std_ulogic) return unresolved_unsigned;

  --```
  -- Id: L.27
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector and operation
  --```
  function "and" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.28
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar and operation
  --```
  function "and" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: L.29
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector or operation
  --```
  function "or" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.30
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar or operation
  --```
  function "or" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: L.31
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector nand operation
  --```
  function "nand" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.32
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar nand operation
  --```
  function "nand" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: L.33
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector nor operation
  --```
  function "nor" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.34
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar nor operation
  --```
  function "nor" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  -- Id: L.35
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector xor operation
  --```
  function "xor" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  -- Id: L.36
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar xor operation
  --```
  function "xor" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.37 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.37
  -- Result subtype: unresolved_signed(r'length-1 downto 0)
  -- Result: Scalar/vector xnor operation
  --```
  function "xnor" (l : std_ulogic; r : unresolved_signed) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.38 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.38
  -- Result subtype: unresolved_signed(l'length-1 downto 0)
  -- Result: Vector/scalar xnor operation
  --```
  function "xnor" (l : unresolved_signed; r : std_ulogic) return unresolved_signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.39 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.39
  -- Result subtype: std_ulogic.
  -- Result: Result of and'ing all of the bits of the vector.
  --```
  function "and" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.40 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.40
  -- Result subtype: std_ulogic.
  -- Result: Result of nand'ing all of the bits of the vector.
  --```
  function "nand" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.41 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.41
  -- Result subtype: std_ulogic.
  -- Result: Result of or'ing all of the bits of the vector.
  --```
  function "or" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.42 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.42
  -- Result subtype: std_ulogic.
  -- Result: Result of nor'ing all of the bits of the vector.
  --```
  function "nor" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.43 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.43
  -- Result subtype: std_ulogic.
  -- Result: Result of xor'ing all of the bits of the vector.
  --```
  function "xor" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.44 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.44
  -- Result subtype: std_ulogic.
  -- Result: Result of xnor'ing all of the bits of the vector.
  --```
  function "xnor" (l : unresolved_signed) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.45 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.45
  -- Result subtype: std_ulogic.
  -- Result: Result of and'ing all of the bits of the vector.
  --```
  function "and" (l : unresolved_unsigned) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.46 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.46
  -- Result subtype: std_ulogic.
  -- Result: Result of nand'ing all of the bits of the vector.
  --```
  function "nand" (l : unresolved_unsigned) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.47 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.47
  -- Result subtype: std_ulogic.
  -- Result: Result of or'ing all of the bits of the vector.
  --```
  function "or" (l : unresolved_unsigned) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.48 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.48
  -- Result subtype: std_ulogic.
  -- Result: Result of nor'ing all of the bits of the vector.
  --```
  function "nor" (l : unresolved_unsigned) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.49 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.49
  -- Result subtype: std_ulogic.
  -- Result: Result of xor'ing all of the bits of the vector.
  --```
  function "xor" (l : unresolved_unsigned) return std_ulogic;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.50 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.50
  -- Result subtype: std_ulogic.
  -- Result: Result of xnor'ing all of the bits of the vector.
  --```
  function "xnor" (l : unresolved_unsigned) return std_ulogic;

  --============================================================================
  -- Match Functions
  --============================================================================

  --```
  -- Id: M.1
  -- Result subtype: boolean
  -- Result: terms compared per std_logic_1164 intent
  --```
  function std_match (l, r : std_ulogic) return boolean;

  --```
  -- Id: M.2
  -- Result subtype: boolean
  -- Result: terms compared per std_logic_1164 intent
  --```
  function std_match (l, r : unresolved_unsigned) return boolean;

  --```
  -- Id: M.3
  -- Result subtype: boolean
  -- Result: terms compared per std_logic_1164 intent
  --```
  function std_match (l, r : unresolved_signed) return boolean;

  --```
  -- Id: M.5
  -- Result subtype: boolean
  -- Result: terms compared per std_logic_1164 intent
  --```
  function std_match (l, r : std_ulogic_vector) return boolean;

  --============================================================================
  -- Translation Functions
  --============================================================================

  --```
  -- Id: T.1
  -- Result subtype: UNRESOLVED_UNSIGNED(S'RANGE)
  -- Result: Termwise, 'H' is translated to '1', and 'L' is translated
  --         to '0'. If a value other than '0'|'1'|'H'|'L' is found,
  --         the array is set to (others => xmap), and a warning is
  --         issued.
  --```
  function to_01 (s : unresolved_unsigned; xmap : std_ulogic := '0') return unresolved_unsigned;

  --```
  -- Id: T.2
  -- Result subtype: unresolved_signed(s'range)
  -- Result: Termwise, 'H' is translated to '1', and 'L' is translated
  --         to '0'. If a value other than '0'|'1'|'H'|'L' is found,
  --         the array is set to (others => xmap), and a warning is
  --         issued.
  --```
  function to_01 (s : unresolved_signed; xmap : std_ulogic := '0') return unresolved_signed;

  --```
  -- Id: T.3
  -- Result subtype: unresolved_unsigned(s'range)
  -- Result: Termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than '0'|'1'|'H'|'L' are translated to 'x'.
  --```
  function TO_X01 (s : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: T.4
  -- result subtype: unresolved_signed(s'range)
  -- result: termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than '0'|'1'|'H'|'L' are translated to 'x'.
  --```
  function to_X01 (s : unresolved_signed) return unresolved_signed;

  --```
  -- Id: T.5
  -- Result subtype: unresolved_unsigned(s'range)
  -- Result: Termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than '0'|'1'|'H'|'L'|'Z' are translated to 'x'.
  --```
  function to_X01Z (s : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: T.6
  -- Result subtype: unresolved_signed(s'range)
  -- Result: Termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than '0'|'1'|'H'|'L'|'Z' are translated to 'X'.
  --```
  function to_X01Z (s : unresolved_signed) return unresolved_signed;

  --```
  -- Id: T.7
  -- Result subtype: unresolved_unsigned(s'range)
  -- Result: Termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than 'u'|'0'|'1'|'H'|'L' are translated to 'x'.
  --```
  function to_UX01 (s : unresolved_unsigned) return unresolved_unsigned;

  --```
  -- Id: T.8
  -- Result subtype: unresolved_signed(s'range)
  -- Result: Termwise, 'H' is translated to '1', 'L' is translated to '0',
  --         and values other than 'U'|'0'|'1'|'H'|'L' are translated to 'X'.
  --```
  function to_UX01 (s : unresolved_signed) return unresolved_signed;

  --```
  -- Id: T.9
  -- Result subtype: boolean
  -- Result: True if s contains a 'U'|'X'|'Z'|'W'|'-' value, false otherwise.
  --```
  function is_X (S : unresolved_unsigned) return boolean;

  --```
  -- Id: T.10
  -- Result subtype: BOOLEAN
  -- Result: True if s contains a 'U'|'X'|'Z'|'W'|'-' value, false otherwise.
  --```
  function is_X (s : unresolved_signed) return boolean;

  --============================================================================
  -- string conversion and write operations
  --============================================================================
  -- the following operations are predefined

  -- function to_string (value : unresolved_unsigned) return string;
  -- function to_string (value : unresolved_signed) return string;

  -- explicitly defined operations

  alias to_bstring is to_string [unresolved_unsigned return string];
  alias to_bstring is to_string [unresolved_signed return string];
  alias to_binary_string is to_string [unresolved_unsigned return string];
  alias to_binary_string is to_string [unresolved_signed return string];

  function to_ostring (value : unresolved_unsigned) return string;
  function to_ostring (value : unresolved_signed) return string;
  alias to_octal_string is to_ostring [unresolved_unsigned return string];
  alias to_octal_string is to_ostring [unresolved_signed return string];

  function to_hstring (value : unresolved_unsigned) return string;
  function to_hstring (value : unresolved_signed) return string;
  alias to_hex_string is to_hstring [unresolved_unsigned return string];
  alias to_hex_string is to_hstring [unresolved_signed return string];

  procedure read(l : inout line; value : out unresolved_unsigned; good : out boolean);
  procedure read(l : inout line; value : out unresolved_unsigned);
  procedure read(l : inout line; value : out unresolved_signed; good : out boolean);
  procedure read(l : inout line; value : out unresolved_signed);
  procedure write(l : inout line; value : in unresolved_unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure write(l : inout line; value : in unresolved_signed; justified : in side := RIGHT; field : in width := 0);

  alias bread is read [line, unresolved_unsigned, boolean];
  alias bread is read [line, unresolved_signed, boolean];

  alias bread is read [line, unresolved_unsigned];
  alias bread is read [line, unresolved_signed];

  alias binary_read is read [line, unresolved_unsigned, boolean];
  alias binary_read is read [line, unresolved_signed, boolean];

  alias binary_read is read [line, unresolved_unsigned];
  alias binary_read is read [line, unresolved_signed];

  procedure oread (l : inout line; value : out unresolved_unsigned; good : out boolean);
  procedure oread (l : inout line; value : out unresolved_signed; good : out boolean);

  procedure oread (l : inout line; value : out unresolved_unsigned);
  procedure oread (l : inout line; value : out unresolved_signed);

  alias octal_read is oread [line, unresolved_unsigned, boolean];
  alias octal_read is oread [line, unresolved_signed, boolean];

  alias octal_read is oread [line, unresolved_unsigned];
  alias octal_read is oread [line, unresolved_signed];

  procedure hread (l : inout line; value : out unresolved_unsigned; good : out boolean);
  procedure hread (l : inout line; value : out unresolved_signed; good : out boolean);

  procedure hread (l : inout line; value : out unresolved_unsigned);
  procedure hread (l : inout line; value : out unresolved_signed);

  alias hex_read is hread [line, unresolved_unsigned, boolean];
  alias hex_read is hread [line, unresolved_signed, boolean];

  alias hex_read is hread [line, unresolved_unsigned];
  alias hex_read is hread [line, unresolved_signed];

  alias bwrite is write [line, unresolved_unsigned, side, width];
  alias bwrite is write [line, unresolved_signed, side, width];

  alias binary_write is write [line, unresolved_unsigned, side, width];
  alias binary_write is write [line, unresolved_signed, side, width];

  procedure owrite(l : inout line; value : in unresolved_unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure owrite(l : inout line; value : in unresolved_signed; justified : in side := RIGHT; field : in width := 0);

  alias octal_write is owrite [line, unresolved_unsigned, side, width];
  alias octal_write is owrite [line, unresolved_signed, side, width];

  procedure hwrite(l : inout line; value : in unresolved_unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure hwrite(l : inout line; value : in unresolved_signed; justified : in side := RIGHT; field : in width := 0);

  alias hex_write is hwrite [line, unresolved_unsigned, side, width];
  alias hex_write is hwrite [line, unresolved_signed, side, width];

end package numeric_std;
