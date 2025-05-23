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
--             :  (NUMERIC_BIT package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  IEEE DASC Synthesis Working Group,
--             :  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Two numeric types are defined:
--             :  -- > UNSIGNED: represents an UNSIGNED number in vector form
--             :  -- > SIGNED: represents a SIGNED number in vector form
--             :  The base element type is type BIT.
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

package numeric_bit is
  constant CopyRightNotice: string
      := "Copyright © 2008 IEEE. All rights reserved.";

  --============================================================================
  -- Numeric Array Type Definitions
  --============================================================================

  type unsigned is array (natural range <> ) of bit;
  type signed is array (natural range <> ) of bit;

  --============================================================================
  -- Arithmetic Operators:
  --============================================================================

  --```
  -- Id: A.1
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Returns the absolute value of a signed vector arg.
  --```
  function "abs" (arg: signed) return signed;

  --```
  -- Id: A.2
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Returns the value of the unary minus operation on a
  --         signed vector arg.
  --```
  function "-" (arg: signed) return signed;

  --============================================================================

  --```
  -- Id: A.3
  -- Result subtype: unsigned(maximum(l'length, r'length)-1 downto 0)
  -- Result: Adds two unsigned vectors that may be of different lengths.
  --```
  function "+" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.3R
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Similar to A.3 where r is a one bit unsigned
  --```
  function "+"(l : unsigned; r : bit) return unsigned;

  --```
  -- Id: A.3L
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Similar to A.3 where l is a one bit unsigned
  --```
  function "+"(l : bit; r : unsigned) return unsigned;

  --```
  -- Id: A.4
  -- Result subtype: signed(maximum(l'length, r'length)-1 downto 0)
  -- Result: Adds two signed vectors that may be of different lengths.
  --```
  function "+" (l, r: signed) return signed;

  --```
  -- Id: A.4R
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Similar to A.4 where r is bit 0 of a non-negative.
  --```
  function "+"(l : signed; r : bit) return signed;

  --```
  -- Id: A.4L
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Similar to A.4 where l is bit 0 of a non-negative.
  --```
  function "+"(l : bit; r : signed) return signed;

  --```
  -- Id: A.5
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Adds an unsigned vector, l, with a nonnegative integer, r.
  --```
  function "+" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.6
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Adds a nonnegative integer, l, with an unsigned vector, r.
  --```
  function "+" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.7
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Adds an integer, l(may be positive or negative), to a signed
  -- vector, r.
  --```
  function "+" (l: integer; r: signed) return signed;

  --```
  -- Id: A.8
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Adds a signed vector, l, to an integer, r.
  --```
  function "+" (l: signed; r: integer) return signed;

  --============================================================================

  --```
  -- Id: A.9
  -- Result subtype: unsigned(maximum(l'length, r'length)-1 downto 0)
  -- Result: Subtracts two unsigned vectors that may be of different lengths.
  --```
  function "-" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.9R
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Similar to A.9 where r is a one bit unsigned
  --```
  function "-"(l : unsigned; r : bit) return unsigned;

  --```
  -- Id: A.9L
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Similar to A.9 where l is a one bit unsigned
  --```
  function "-"(l : bit; r : unsigned) return unsigned;

  --```
  -- Id: A.10
  -- Result subtype: signed(maximum(l'length, r'length)-1 downto 0)
  -- Result: Subtracts a signed vector, r, from another signed vector, l,
  --         that may possibly be of different lengths.
  --```
  function "-" (l, r: signed) return signed;

  --```
  -- Id: A.10R
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Similar to A.10 where r is bit 0 of a non-negative.
  --```
  function "-"(l : signed; r : bit) return signed;

  --```
  -- Id: A.10L
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Similar to A.10 where r is bit 0 of a non-negative.
  --```
  function "-"(l : bit; r : signed) return signed;

  --```
  -- Id: A.11
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Subtracts a nonnegative integer, r, from an unsigned vector, l.
  --```
  function "-" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.12
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Subtracts an unsigned vector, r, from a nonnegative integer, l.
  --```
  function "-" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.13
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Subtracts an integer, r, from a signed vector, l.
  --```
  function "-" (l: signed; r: integer) return signed;

  --```
  -- Id: A.14
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Subtracts a signed vector, r, from an integer, l.
  --```
  function "-" (l: integer; r: signed) return signed;

  --============================================================================

  --```
  -- Id: A.15
  -- Result subtype: unsigned((l'length+r'length-1) downto 0)
  -- Result: Performs the multiplication operation on two unsigned vectors
  --         that may possibly be of different lengths.
  --```
  function "*" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.16
  -- Result subtype: signed((l'length+r'length-1) downto 0)
  -- Result: Multiplies two signed vectors that may possibly be of
  --         different lengths.
  --```
  function "*" (l, r: signed) return signed;

  --```
  -- Id: A.17
  -- Result subtype: unsigned((l'length+l'length-1) downto 0)
  -- Result: Multiplies an unsigned vector, l, with a nonnegative
  --         integer, r. r is converted to an unsigned vector of
  --         size l'length before multiplication.
  --```
  function "*" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.18
  -- Result subtype: unsigned((r'length+r'length-1) downto 0)
  -- Result: Multiplies an unsigned vector, r, with a nonnegative
  --         integer, l. l is converted to an unsigned vector of
  --         size r'length before multiplication.
  --```
  function "*" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.19
  -- Result subtype: signed((l'length+l'length-1) downto 0)
  -- Result: Multiplies a signed vector, l, with an integer, r. r is
  --         converted to a signed vector of size l'length before
  --         multiplication.
  --```
  function "*" (l: signed; r: integer) return signed;

  --```
  -- Id: A.20
  -- Result subtype: signed((r'length+r'length-1) downto 0)
  -- Result: Multiplies a signed vector, r, with an integer, l. l is
  --         converted to a signed vector of size r'length before
  --         multiplication.
  --```
  function "*" (l: integer; r: signed) return signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.21
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Divides an unsigned vector, l, by another unsigned vector, r.
  --```
  function "/" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.22
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Divides an signed vector, l, by another signed vector, r.
  --```
  function "/" (l, r: signed) return signed;

  --```
  -- Id: A.23
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Divides an unsigned vector, l, by a nonnegative integer, r.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "/" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.24
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Divides a nonnegative integer, l, by an unsigned vector, r.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "/" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.25
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Divides a signed vector, l, by an integer, r.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "/" (l: signed; r: integer) return signed;

  --```
  -- Id: A.26
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Divides an integer, l, by a signed vector, r.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "/" (l: integer; r: signed) return signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.27
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Computes "l rem r" where l and r are unsigned vectors.
  --```
  function "rem" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.28
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Computes "l rem r" where l and r are signed vectors.
  --```
  function "rem" (l, r: signed) return signed;

  --```
  -- Id: A.29
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Computes "l rem r" where l is an unsigned vector and r is a
  --         nonnegative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "rem" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.30
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Computes "l rem r" where r is an unsigned vector and l is a
  --         nonnegative integer.
  -- if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "rem" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.31
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Computes "l rem r" where l is signed vector and r is an integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "rem" (l: signed; r: integer) return signed;

  --```
  -- Id: A.32
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Computes "l rem r" where r is signed vector and l is an integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "rem" (l: integer; r: signed) return signed;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.33
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l and r are unsigned vectors.
  --```
  function "mod" (l, r: unsigned) return unsigned;

  --```
  -- Id: A.34
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l and r are signed vectors.
  --```
  function "mod" (l, r: signed) return signed;

  --```
  -- Id: A.35
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an unsigned vector and r
  --         is a nonnegative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "mod" (l: unsigned; r: natural) return unsigned;

  --```
  -- Id: A.36
  -- Result subtype: unsigned(r'length-1 downto 0)
  -- Result: Computes "l mod r" where r is an unsigned vector and l
  --         is a nonnegative integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "mod" (l: natural; r: unsigned) return unsigned;

  --```
  -- Id: A.37
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Computes "l mod r" where l is a signed vector and
  --         r is an integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "mod" (l: signed; r: integer) return signed;

  --```
  -- Id: A.38
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an integer and
  --         r is a signed vector.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "mod" (l: integer; r: signed) return signed;

  --============================================================================

  --```
  -- Id: A.39
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (arg : unsigned; y : bit) return integer;

  --```
  -- Id: A.40
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (arg : signed; y : bit) return integer;

  --```
  -- Id: A.41
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (arg : unsigned; y : bit) return integer;

  --```
  -- Id: A.42
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (arg : signed; y : bit) return integer;

  --============================================================================
  -- Comparison Operators
  --============================================================================

  --```
  -- Id: C.1
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function ">" (l, r: unsigned) return boolean;

  --```
  -- Id: C.2
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function ">" (l, r: signed) return boolean;

  --```
  -- Id: C.3
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function ">" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.4
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a integer and
  --         r is a signed vector.
  --```
  function ">" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.5
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function ">" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.6
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a signed vector and
  --         r is a integer.
  --```
  function ">" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.7
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "<" (l, r: unsigned) return boolean;

  --```
  -- Id: C.8
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "<" (l, r: signed) return boolean;

  --```
  -- Id: C.9
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "<" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.10
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an integer and
  --         r is a signed vector.
  --```
  function "<" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.11
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "<" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.12
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is a signed vector and
  --         r is an integer.
  --```
  function "<" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.13
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "<=" (l, r: unsigned) return boolean;

  --```
  -- Id: C.14
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "<=" (l, r: signed) return boolean;

  --```
  -- Id: C.15
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "<=" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.16
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an integer and
  --         r is a signed vector.
  --```
  function "<=" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.17
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "<=" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.18
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is a signed vector and
  --         r is an integer.
  --```
  function "<=" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.19
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function ">=" (l, r: unsigned) return boolean;

  --```
  -- Id: C.20
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function ">=" (l, r: signed) return boolean;

  --```
  -- Id: C.21
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function ">=" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.22
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an integer and
  --         r is a signed vector.
  --```
  function ">=" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.23
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function ">=" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.24
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is a signed vector and
  --         r is an integer.
  --```
  function ">=" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.25
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "=" (l, r: unsigned) return boolean;

  --```
  -- Id: C.26
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "=" (l, r: signed) return boolean;

  --```
  -- Id: C.27
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "=" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.28
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an integer and
  --         r is a signed vector.
  --```
  function "=" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.29
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "=" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.30
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is a signed vector and
  --         r is an integer.
  --```
  function "=" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.31
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "/=" (l, r: unsigned) return boolean;

  --```
  -- Id: C.32
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "/=" (l, r: signed) return boolean;

  --```
  -- Id: C.33
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "/=" (l: natural; r: unsigned) return boolean;

  --```
  -- Id: C.34
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an integer and
  --         r is a signed vector.
  --```
  function "/=" (l: integer; r: signed) return boolean;

  --```
  -- Id: C.35
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "/=" (l: unsigned; r: natural) return boolean;

  --```
  -- Id: C.36
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is a signed vector and
  --         r is an integer.
  --```
  function "/=" (l: signed; r: integer) return boolean;

  --============================================================================

  --```
  -- Id: C.37
  -- Result subtype: unsigned
  -- Result: Returns the lesser of two unsigned vectors that may be
  --         of different lengths.
  --```
  function minimum (l, r : unsigned) return unsigned;

  --```
  -- Id: C.38
  -- Result subtype: signed
  -- Result: Returns the lesser of two signed vectors that may be
  --         of different lengths.
  --```
  function minimum (l, r : signed) return signed;

  --```
  -- Id: C.39
  -- Result subtype: unsigned
  -- Result: Returns the lesser of a nonnegative integer, l, and
  --         an unsigned vector, r.
  --```
  function minimum (l : natural; r : unsigned) return unsigned;

  --```
  -- Id: C.40
  -- Result subtype: signed
  -- Result: Returns the lesser of an integer, l, and a signed
  --         vector, r.
  --```
  function minimum (l : integer; r : signed) return signed;

  --```
  -- Id: C.41
  -- Result subtype: unsigned
  -- Result: Returns the lesser of an unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function minimum (l : unsigned; r : natural) return unsigned;

  --```
  -- Id: C.42
  -- Result subtype: signed
  -- Result: Returns the lesser of a signed vector, l, and
  --         an integer, r.
  --```
  function minimum (l : signed; r : integer) return signed;

  --============================================================================

  --```
  -- Id: C.43
  -- Result subtype: unsigned
  -- Result: Returns the greater of two unsigned vectors that may be
  --         of different lengths.
  --```
  function maximum (l, r : unsigned) return unsigned;

  --```
  -- Id: C.44
  -- Result subtype: signed
  -- Result: Returns the greater of two signed vectors that may be
  --         of different lengths.
  --```
  function maximum (l, r : signed) return signed;

  --```
  -- Id: C.45
  -- Result subtype: unsigned
  -- Result: Returns the greater of a nonnegative integer, l, and
  --         an unsigned vector, r.
  --```
  function maximum (l : natural; r : unsigned) return unsigned;

  --```
  -- Id: C.46
  -- Result subtype: signed
  -- Result: Returns the greater of an integer, l, and a signed
  --         vector, r.
  --```
  function maximum (l : integer; r : signed) return signed;

  --```
  -- Id: C.47
  -- Result subtype: unsigned
  -- Result: Returns the greater of an unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function maximum (l : unsigned; r : natural) return unsigned;

  --```
  -- Id: C.48
  -- Result subtype: signed
  -- Result: Returns the greater of a signed vector, l, and
  --         an integer, r.
  --```
  function maximum (l : signed; r : integer) return signed;

  --============================================================================

  --```
  -- Id: C.49
  -- Result subtype: bit
  -- Result: Computes "l > r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>" (l, r : unsigned) return bit;

  --```
  -- Id: C.50
  -- Result subtype: bit
  -- Result: Computes "l > r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?>" (l, r : signed) return bit;

  --```
  -- Id: C.51
  -- Result subtype: bit
  -- Result: Computes "l > r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?>" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.52
  -- Result subtype: bit
  -- Result: Computes "l > r" where l is a integer and
  --         r is a signed vector.
  --```
  function "?>" (l : integer; r : signed) return bit;

  --```
  -- Id: C.53
  -- Result subtype: bit
  -- Result: Computes "l > r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.54
  -- Result subtype: bit
  -- Result: Computes "l > r" where l is a signed vector and
  --         r is a integer.
  --```
  function "?>" (l : signed; r : integer) return bit;

  --============================================================================

  --```
  -- Id: C.55
  -- Result subtype: bit
  -- Result: Computes "l < r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<" (l, r : unsigned) return bit;

  --```
  -- Id: C.56
  -- Result subtype: bit
  -- Result: Computes "l < r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?<" (l, r : signed) return bit;

  --```
  -- Id: C.57
  -- Result subtype: bit
  -- Result: Computes "l < r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?<" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.58
  -- Result subtype: bit
  -- Result: Computes "l < r" where l is an integer and
  --         r is a signed vector.
  --```
  function "?<" (l : integer; r : signed) return bit;

  --```
  -- Id: C.59
  -- Result subtype: bit
  -- Result: Computes "l < r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.60
  -- Result subtype: bit
  -- Result: Computes "l < r" where l is a signed vector and
  --         r is an integer.
  --```
  function "?<" (l : signed; r : integer) return bit;

  --============================================================================

  --```
  -- Id: C.61
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<=" (l, r : unsigned) return bit;

  --```
  -- Id: C.62
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?<=" (l, r : signed) return bit;

  --```
  -- Id: C.63
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?<=" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.64
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l is an integer and
  --         r is a signed vector.
  --```
  function "?<=" (l : integer; r : signed) return bit;

  --```
  -- Id: C.65
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<=" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.66
  -- Result subtype: bit
  -- Result: Computes "l <= r" where l is a signed vector and
  --         r is an integer.
  --```
  function "?<=" (l : signed; r : integer) return bit;

  --============================================================================

  --```
  -- Id: C.67
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>=" (l, r : unsigned) return bit;

  --```
  -- Id: C.68
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?>=" (l, r : signed) return bit;

  --```
  -- Id: C.69
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?>=" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.70
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l is an integer and
  --         r is a signed vector.
  --```
  function "?>=" (l : integer; r : signed) return bit;

  --```
  -- Id: C.71
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>=" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.72
  -- Result subtype: bit
  -- Result: Computes "l >= r" where l is a signed vector and
  --         r is an integer.
  --```
  function "?>=" (l : signed; r : integer) return bit;

  --============================================================================

  --```
  -- Id: C.73
  -- Result subtype: bit
  -- Result: Computes "l = r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?=" (l, r : unsigned) return bit;

  --```
  -- Id: C.74
  -- Result subtype: bit
  -- Result: Computes "l = r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?=" (l, r : signed) return bit;

  --```
  -- Id: C.75
  -- Result subtype: bit
  -- Result: Computes "l = r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?=" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.76
  -- Result subtype: bit
  -- Result: Computes "l = r" where l is an integer and
  --         r is an signed vector.
  --```
  function "?=" (l : integer; r : signed) return bit;

  --```
  -- Id: C.77
  -- Result subtype: bit
  -- Result: Computes "l = r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?=" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.78
  -- Result subtype: bit
  -- Result: Computes "l = r" where l is an signed vector and
  --         r is an integer.
  --```
  function "?=" (l : signed; r : integer) return bit;

  --============================================================================

  --```
  -- Id: C.79
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?/=" (l, r : unsigned) return bit;

  --```
  -- Id: C.80
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l and r are signed vectors possibly
  --         of different lengths.
  --```
  function "?/=" (l, r : signed) return bit;

  --```
  -- Id: C.81
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?/=" (l : natural; r : unsigned) return bit;

  --```
  -- Id: C.82
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l is an integer and
  --         r is an signed vector.
  --```
  function "?/=" (l : integer; r : signed) return bit;

  --```
  -- Id: C.83
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?/=" (l : unsigned; r : natural) return bit;

  --```
  -- Id: C.84
  -- Result subtype: bit
  -- Result: Computes "l /= r" where l is an signed vector and
  --         r is an integer.
  --```
  function "?/=" (l : signed; r : integer) return bit;

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  --```
  -- Id: S.1
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Performs a shift-left on an unsigned vector count times.
  --         the vacated positions are filled with bit '0'.
  --         the count leftmost bits are lost.
  --```
  function shift_left (arg: unsigned; count: natural) return unsigned;

  --```
  -- Id: S.2
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Performs a shift-right on an unsigned vector count times.
  --         the vacated positions are filled with bit '0'.
  --         the count rightmost bits are lost.
  --```
  function shift_right (arg: unsigned; count: natural) return unsigned;

  --```
  -- Id: S.3
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Performs a shift-left on a signed vector count times.
  --         the vacated positions are filled with bit '0'.
  --         the count leftmost bits are lost.
  --```
  function shift_left (arg: signed; count: natural) return signed;

  --```
  -- Id: S.4
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Performs a shift-right on a signed vector count times.
  --         the vacated positions are filled with the leftmost bit, arg'left.
  --         the count rightmost bits are lost.
  --```
  function shift_right (arg: signed; count: natural) return signed;

  --============================================================================

  --```
  -- Id: S.5
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Performs a rotate-left of an unsigned vector count times.
  --```
  function rotate_left (arg: unsigned; count: natural) return unsigned;

  --```
  -- Id: S.6
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Performs a rotate-right of an unsigned vector count times.
  --```
  function rotate_right (arg: unsigned; count: natural) return unsigned;

  --```
  -- Id: S.7
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Performs a logical rotate-left of a signed vector count times.
  --```
  function rotate_left (arg: signed; count: natural) return signed;

  --```
  -- Id: S.8
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Performs a logical rotate-right of a signed vector count times.
  --```
  function rotate_right (arg: signed; count: natural) return signed;

  --============================================================================

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: shift_left(arg, count)
  --```
  function "sll" (arg: unsigned; count: integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.10 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.10
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "sll" (arg: signed; count: integer) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.11
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Shift_right(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "srl" (arg: unsigned; count: integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.12 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.12
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Signed(shift_right(unsigned(arg), count))
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "srl" (arg: signed; count: integer) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.13
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Rotate_left(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "rol" (arg: unsigned; count: integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.14 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.14
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Rotate_left(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "rol" (arg: signed; count: integer) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.15
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Rotate_right(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "ror" (arg: unsigned; count: integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.16 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.16
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: Rotate_right(arg, count)
  -- out the function (declaration and body) for IEEE std 1076-1987 compatibility.
  --```
  function "ror" (arg: signed; count: integer) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: shift_left(arg, count)
  --```
  function "sla" (arg : unsigned; count : integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.18 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.18
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: shift_left(arg, count)
  --```
  function "sla" (arg : signed; count : integer) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: shift_right(arg, count)
  --```
  function "sra" (arg : unsigned; count : integer) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.20 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.20
  -- Result subtype: signed(arg'length-1 downto 0)
  -- Result: shift_right(arg, count)
  --```
  function "sra" (arg : signed; count : integer) return signed;

  --============================================================================
  -- RESIZE Functions
  --============================================================================

  --```
  -- Id: R.1
  -- Result subtype: signed(new_size-1 downto 0)
  -- Result: Resizes the signed vector arg to the specified size.
  --         to create a larger vector, the new [leftmost] bit positions
  --         are filled with the sign bit (arg'left). when truncating,
  --         the sign bit is retained along with the rightmost part.
  --```
  function resize (arg: signed; new_size: natural) return signed;

  --```
  -- Id: R.2
  -- Result subtype: unsigned(new_size-1 downto 0)
  -- Result: Resizes the unsigned vector arg to the specified size.
  --         to create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. when truncating, the leftmost bits
  --         are dropped.
  --```
  function resize (arg: unsigned; new_size: natural) return unsigned;

  -- Result subtype: unresolved_unsigned (size_res'length-1 downto 0)
  function resize (arg, size_res : unsigned) return unsigned;

  -- Result subtype: unresolved_signed (size_res'length-1 downto 0)
  function resize (arg, size_res : signed) return signed;

  --============================================================================
  -- Conversion Functions
  --============================================================================

  --```
  -- Id: D.1
  -- Result subtype: natural. Value cannot be negative since parameter is an
  --         unsigned vector.
  -- Result: Converts the unsigned vector to an integer.
  --```
  function to_integer (arg: unsigned) return natural;

  --```
  -- Id: D.2
  -- Result subtype: integer
  -- Result: Converts a signed vector to an integer.
  --```
  function to_integer (arg: signed) return integer;

  --```
  -- Id: D.3
  -- Result subtype: unsigned(size-1 downto 0)
  -- Result: Converts a nonnegative integer to an unsigned vector with
  --         the specified size.
  --```
  function to_unsigned (arg, size: natural) return unsigned;

  --```
  -- Id: D.4
  -- Result subtype: signed(size-1 downto 0)
  -- Result: Converts an integer to a signed vector of the specified size.
  --```
  function to_signed (arg: integer; size: natural) return signed;

  -- Result subtype: unresolved_unsigned(size_res'length-1 downto 0)
  function to_unsigned (arg : natural; size_res : unsigned) return unsigned;

  -- Result subtype: unresolved_signed(size_res'length-1 downto 0)
  function to_signed (arg : integer; size_res : signed) return signed;

  --============================================================================
  -- Logical Operators
  --============================================================================

  --```
  -- Id: L.1
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Termwise inversion
  --```
  function "not" (l: unsigned) return unsigned;

  --```
  -- Id: L.2
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector and operation
  --```
  function "and" (l, r: unsigned) return unsigned;

  --```
  -- Id: L.3
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector or operation
  --```
  function "or" (l, r: unsigned) return unsigned;

  --```
  -- Id: L.4
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector nand operation
  --```
  function "nand" (l, r: unsigned) return unsigned;

  --```
  -- Id: L.5
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector nor operation
  --```
  function "nor" (l, r: unsigned) return unsigned;

  --```
  -- Id: L.6
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector xor operation
  --```
  function "xor" (l, r: unsigned) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.7 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.7
  -- Result subtype: unsigned(l'length-1 downto 0)
  -- Result: Vector xnor operation
  --```
  function "xnor" (l, r: unsigned) return unsigned;

  --```
  -- Id: L.8
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Termwise inversion
  --```
  function "not" (l: signed) return signed;

  --```
  -- Id: L.9
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector and operation
  --```
  function "and" (l, r: signed) return signed;

  --```
  -- Id: L.10
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector or operation
  --```
  function "or" (l, r: signed) return signed;

  --```
  -- Id: L.11
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector nand operation
  --```
  function "nand" (l, r: signed) return signed;

  --```
  -- Id: L.12
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector nor operation
  --```
  function "nor" (l, r: signed) return signed;

  --```
  -- Id: L.13
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector xor operation
  --```
  function "xor" (l, r: signed) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.14 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.14
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector xnor operation
  --```
  function "xnor" (l, r: signed) return signed;

  --```
 -- Id: L.15
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector and operation
  --```
  function "and" (l : bit; r : unsigned) return unsigned;

  --```
  -- Id: L.16
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar and operation
  --```
  function "and" (l : unsigned; r : bit) return unsigned;

  --```
  -- Id: L.17
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector or operation
  --```
  function "or" (l : bit; r : unsigned) return unsigned;

  --```
  -- Id: L.18
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar or operation
  --```
  function "or" (l : unsigned; r : bit) return unsigned;

  --```
  -- Id: L.19
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector nand operation
  --```
  function "nand" (l : bit; r : unsigned) return unsigned;

  --```
  -- Id: L.20
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar nand operation
  --```
  function "nand" (l : unsigned; r : bit) return unsigned;

  --```
  -- Id: L.21
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector nor operation
  --```
  function "nor" (l : bit; r : unsigned) return unsigned;

  --```
  -- Id: L.22
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar nor operation
  --```
  function "nor" (l : unsigned; r : bit) return unsigned;

  --```
  -- Id: L.23
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector xor operation
  --```
  function "xor" (l : bit; r : unsigned) return unsigned;

  --```
  -- Id: L.24
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar xor operation
  --```
  function "xor" (l : unsigned; r : bit) return unsigned;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.25 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: L.25
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector xnor operation
  -- out the function (declaration and body) for ieee std 1076-1987 compatibility.
  --```
  function "xnor" (L : BIT; R : UNSIGNED) return UNSIGNED;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.26 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: L.26
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar xnor operation
  -- out the function (declaration and body) for ieee std 1076-1987 compatibility.
  --```
  function "xnor" (L : UNSIGNED; R : BIT) return UNSIGNED;

  --```
  -- Id: L.27
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector and operation
  --```
  function "and" (l : bit; r : signed) return signed;

  --```
  -- Id: L.28
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar and operation
  --```
  function "and" (l : signed; r : bit) return signed;

  --```
  -- Id: L.29
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector or operation
  --```
  function "or" (l : bit; r : signed) return signed;

  --```
  -- Id: L.30
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar or operation
  --```
  function "or" (l : signed; r : bit) return signed;

  --```
  -- Id: L.31
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector nand operation
  --```
  function "nand" (l : bit; r : signed) return signed;

  --```
  -- Id: L.32
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar nand operation
  --```
  function "nand" (l : signed; r : bit) return signed;

  --```
  -- Id: L.33
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector nor operation
  --```
  function "nor" (l : bit; r : signed) return signed;

  --```
  -- Id: L.34
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar nor operation
  --```
  function "nor" (l : signed; r : bit) return signed;

  --```
  -- Id: L.35
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector xor operation
  --```
  function "xor" (l : bit; r : signed) return signed;

  --```
  -- Id: L.36
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar xor operation
  --```
  function "xor" (l : signed; r : bit) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.37 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.37
  -- Result subtype: signed(r'length-1 downto 0)
  -- Result: Scalar/vector xnor operation
  --```
  function "xnor" (l : bit; r : signed) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.38 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: L.38
  -- Result subtype: signed(l'length-1 downto 0)
  -- Result: Vector/scalar xnor operation
  --```
  function "xnor" (l : signed; r : bit) return signed;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.39 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.39
  -- Result subtype: bit.
  -- Result: Result of and'ing all of the bits of the vector.
  --```
  function "and" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.40 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.40
  -- Result subtype: bit.
  -- Result: Result of nand'ing all of the bits of the vector.
  --```
  function "nand" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.41 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.41
  -- Result subtype: BIT.
  -- Result: Result of or'ing all of the bits of the vector.
  --```
  function "or" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.42 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.42
  -- Result subtype: bit.
  -- Result: Result of nor'ing all of the bits of the vector.
  --```
  function "nor" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.43 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.43
  -- Result subtype: bit.
  -- Result: Result of xor'ing all of the bits of the vector.
  --```
  function "xor" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.44 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.44
  -- Result subtype: bit.
  -- Result: Result of xnor'ing all of the bits of the vector.
  --```
  function "xnor" (l : signed) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.45 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.45
  -- Result subtype: bit.
  -- Result: Result of and'ing all of the bits of the vector.
  --```
  function "and" (l : unsigned) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.46 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.46
  -- Result subtype: bit.
  -- Result: Result of nand'ing all of the bits of the vector.
  --```
  function "nand" (l : unsigned) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.47 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.47
  -- Result subtype: bit.
  -- Result: Result of or'ing all of the bits of the vector.
  --```
  function "or" (l : unsigned) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.48 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.48
  -- Result subtype: bit.
  -- Result: Result of nor'ing all of the bits of the vector.
  --```
  function "nor" (l : unsigned) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.49 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.49
  -- Result subtype: bit.
  -- Result: Result of xor'ing all of the bits of the vector.
  --```
  function "xor" (l : unsigned) return bit;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function L.50 is not compatible with editions of IEEE Std 1076 from
  -- 1987 through 2002. Comment out the function (declaration and body) for
  -- compatibility with these editions.
  ------------------------------------------------------------------------------
  -- Id: L.50
  -- Result subtype: bit.
  -- Result: Result of xnor'ing all of the bits of the vector.
  --```
  function "xnor" (l : unsigned) return bit;

  --============================================================================
  -- Edge Detection Functions
  --============================================================================

  --```
  -- Id: E.1
  -- Result subtype: boolean
  -- Result: Returns true if an event is detected on signal s and the
  --         value changed from a '0' to a '1'.
  --```
  alias rising_edge is std.standard.rising_edge [std.standard.bit return std.standard.boolean];

  --```
  -- Id: E.2
  -- Result subtype: boolean
  -- Result: returns true if an event is detected on signal s and the
  --         value changed from a '1' to a '0'.
  --```
  alias falling_edge is std.standard.falling_edge [std.standard.bit return std.standard.boolean];

  --============================================================================
  -- string conversion and write operations
  --============================================================================
  -- the following operations are predefined

  -- function to_string ( value : unsigned ) return string;
  -- function to_string ( value : signed   ) return string;

  -- explicitly defined operations

  alias to_bstring is to_string [unsigned return string];
  alias to_bstring is to_string [signed return string];
  alias to_binary_string is to_string [unsigned return string];
  alias to_binary_string is to_string [signed return string];

  function to_ostring (value : unsigned) return string;
  function to_ostring (value : signed) return string;
  alias to_octal_string is to_ostring [unsigned return string];
  alias to_octal_string is to_ostring [signed return string];

  function to_hstring (value : unsigned) return string;
  function to_hstring (value : signed) return string;
  alias to_hex_string is to_hstring [unsigned return string];
  alias to_hex_string is to_hstring [signed return string];

  procedure read(l : inout line; value : out unsigned; good : out boolean);
  procedure read(l : inout line; value : out unsigned);
  procedure read(l : inout line; value : out signed; good : out boolean);
  procedure read(l : inout line; value : out signed);

  procedure write(l : inout line; value : in unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure write(l : inout line; value : in signed; justified : in side := RIGHT; field : in width := 0);

  alias bread is read [line, unsigned, boolean];
  alias bread is read [line, signed, boolean];

  alias bread is read [line, unsigned];
  alias bread is read [line, signed];

  alias binary_read is read [line, unsigned, boolean];
  alias binary_read is read [line, signed, boolean];

  alias binary_read is read [line, unsigned];
  alias binary_read is read [line, signed];

  procedure oread (l : inout line; value : out unsigned; good : out boolean);
  procedure oread (l : inout line; value : out signed; good : out boolean);

  procedure oread (l : inout line; value : out unsigned);
  procedure oread (l : inout line; value : out signed);

  alias octal_read is oread [line, unsigned, boolean];
  alias octal_read is oread [line, signed, boolean];

  alias octal_read is oread [line, unsigned];
  alias octal_read is oread [line, signed];

  procedure hread (l : inout line; value : out unsigned; good : out boolean);
  procedure hread (l : inout line; value : out signed; good : out boolean);

  procedure hread (l : inout line; value : out unsigned);
  procedure hread (l : inout line; value : out signed);

  alias hex_read is hread [line, unsigned, boolean];
  alias hex_read is hread [line, signed, boolean];

  alias hex_read is hread [line, unsigned];
  alias hex_read is hread [line, signed];

  alias bwrite is write [line, unsigned, side, width];
  alias bwrite is write [line, signed, side, width];

  alias binary_write is write [line, unsigned, side, width];
  alias binary_write is write [line, signed, side, width];

  procedure owrite(l : inout line; value : in unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure owrite(l : inout line; value : in signed; justified : in side := RIGHT; field : in width := 0);

  alias octal_write is owrite [line, unsigned, side, width];
  alias octal_write is owrite [line, signed, side, width];

  procedure hwrite(l : inout line; value : in unsigned; justified : in side := RIGHT; field : in width := 0);
  procedure hwrite(l : inout line; value : in signed; justified : in side := RIGHT; field : in width := 0);

  alias hex_write is hwrite [line, unsigned, side, width];
  alias hex_write is hwrite [line, signed, side, width];

end package numeric_bit;
