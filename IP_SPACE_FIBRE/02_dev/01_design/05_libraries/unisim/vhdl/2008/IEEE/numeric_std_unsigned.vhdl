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
--             :  (NUMERIC_STD_UNSIGNED package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Values of type STD_ULOGIC_VECTOR
--             :  are interpreted as unsigned numbers in vector form.
--             :  The leftmost bit is treated as the most significant bit.
--             :  This package contains overloaded arithmetic operators on
--             :  the STD_ULOGIC_VECTOR type. The package also contains
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

library ieee;
use ieee.std_logic_1164.all;
package numeric_std_unsigned is
  constant CopyRightNotice : string :=
    "Copyright 2008 IEEE. All rights reserved.";

  --```
  -- Id: A.3
  -- Result subtype: std_ulogic_vector(maximum(l'length, r'length)-1 downto 0).
  -- Result: Adds two unsigned vectors that may be of different lengths.
  --```
  function "+" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.3R
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Similar to a.3 where r is a one bit std_ulogic_vector
  --```
  function "+"(l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;

  --```
  -- Id: A.3L
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Similar to a.3 where l is a one bit unsigned
  --```
  function "+"(l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.5
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0).
  -- Result: Adds an unsigned vector, l, with a non-negative integer, r.
  --```
  function "+" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.6
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0).
  -- Result: Adds a non-negative integer, l, with an unsigned vector, r.
  --```
  function "+" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================

  --```
  -- Id: A.9
  -- Result subtype: unsigned(maximum(l'length, r'length)-1 downto 0).
  -- Result: Subtracts two unsigned vectors that may be of different lengths.
  --```
  function "-" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.9R
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Similar to a.9 where r is a one bit unsigned
  --```
  function "-"(l : std_ulogic_vector; r : std_ulogic) return std_ulogic_vector;

  --```
  -- Id: A.9L
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Similar to a.9 where l is a one bit unsigned
  --```
  function "-"(l : std_ulogic; r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.11
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0).
  -- Result: Subtracts a non-negative integer, r, from an unsigned vector, l.
  --```
  function "-" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.12
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0).
  -- Result: Subtracts an unsigned vector, r, from a non-negative integer, l.
  --```
  function "-" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================

  --```
  -- Id: A.15
  -- Result subtype: std_ulogic_vector((l'length+r'length-1) downto 0).
  -- Result: Performs the multiplication operation on two unsigned vectors
  --         that may possibly be of different lengths.
  --```
  function "*" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.17
  -- Result subtype: std_ulogic_vector((l'length+l'length-1) downto 0).
  -- Result: Multiplies an unsigned vector, l, with a non-negative
  --         integer, r. r is converted to an unsigned vector of
  --         size l'length before multiplication.
  --```
  function "*" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.18
  -- Result subtype: std_ulogic_vector((r'length+r'length-1) downto 0).
  -- Result: Multiplies an unsigned vector, r, with a non-negative
  --         integer, l. l is converted to an unsigned vector of
  --         size r'length before multiplication.
  --```
  function "*" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.21
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Divides an unsigned vector, l, by another unsigned vector, r.
  --```
  function "/" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.23
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Divides an unsigned vector, l, by a non-negative integer, r.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "/" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.24
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Divides a non-negative integer, l, by an unsigned vector, r.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "/" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.27
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Computes "l rem r" where l and r are unsigned vectors.
  --```
  function "rem" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.29
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Computes "l rem r" where l is an unsigned vector and r is a
  --         non-negative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "rem" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.30
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Computes "l rem r" where r is an unsigned vector and l is a
  --         non-negative integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "rem" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.33
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Computes "l mod r" where l and r are unsigned vectors.
  --```
  function "mod" (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: A.35
  -- Result subtype: std_ulogic_vector(l'length-1 downto 0)
  -- Result: Computes "l mod r" where l is an unsigned vector and r
  --         is a non-negative integer.
  --         if no_of_bits(r) > l'length, result is truncated to l'length.
  --```
  function "mod" (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --```
  -- Id: A.36
  -- Result subtype: std_ulogic_vector(r'length-1 downto 0)
  -- Result: Computes "l mod r" where r is an unsigned vector and l
  --         is a non-negative integer.
  --         if no_of_bits(l) > r'length, result is truncated to r'length.
  --```
  function "mod" (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================

  --```
  -- Id: A.39
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (arg : std_ulogic_vector; y : std_ulogic) return integer;

  --```
  -- Id: A.41
  -- Result subtype: integer
  -- Result: Finds the leftmost occurrence of the value of y in arg.
  --         returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (arg : std_ulogic_vector; y : std_ulogic) return integer;

  --============================================================================
  -- Comparison Operators
  --============================================================================

  --```
  -- Id: C.1
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function ">" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.3
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function ">" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.5
  -- Result subtype: boolean
  -- Result: Computes "l > r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function ">" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.7
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "<" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.9
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function "<" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.11
  -- Result subtype: boolean
  -- Result: Computes "l < r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function "<" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.13
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "<=" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.15
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function "<=" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.17
  -- Result subtype: boolean
  -- Result: Computes "l <= r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function "<=" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.19
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function ">=" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.21
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function ">=" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.23
  -- Result subtype: boolean
  -- Result: Computes "l >= r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function ">=" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.25
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "=" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.27
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function "=" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.29
  -- Result subtype: boolean
  -- Result: Computes "l = r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function "=" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.31
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "/=" (l, r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.33
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is a non-negative integer and
  --         r is an unsigned vector.
  --```
  function "/=" (l : natural; r : std_ulogic_vector) return boolean;

  --```
  -- Id: C.35
  -- Result subtype: boolean
  -- Result: Computes "l /= r" where l is an unsigned vector and
  --         r is a non-negative integer.
  --```
  function "/=" (l : std_ulogic_vector; r : natural) return boolean;

  --============================================================================

  --```
  -- Id: C.37
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the lesser of two unsigned vectors that may be
  --         of different lengths.
  --```
  function minimum (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: C.39
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the lesser of a nonnegative integer, l, and
  --         an unsigned vector, r.
  --```
  function minimum (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: C.41
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the lesser of an unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function minimum (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --============================================================================

  --```
  -- Id: C.43
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the greater of two unsigned vectors that may be
  --         of different lengths.
  --```
  function maximum (l, r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: C.45
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the greater of a nonnegative integer, l, and
  --         an unsigned vector, r.
  --```
  function maximum (l : natural; r : std_ulogic_vector) return std_ulogic_vector;

  --```
  -- Id: C.47
  -- Result subtype: std_ulogic_vector
  -- Result: Returns the greater of an unsigned vector, l, and
  --         a nonnegative integer, r.
  --```
  function maximum (l : std_ulogic_vector; r : natural) return std_ulogic_vector;

  --============================================================================

  --```
  -- Id: C.49
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>" (l, r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.51
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?>" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.53
  -- Result subtype: std_ulogic
  -- Result: Computes "l > r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.55
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<" (l, r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.57
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?<" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.59
  -- Result subtype: std_ulogic
  -- Result: Computes "l < r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.61
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?<=" (l, r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.63
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?<=" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.65
  -- Result subtype: std_ulogic
  -- Result: Computes "l <= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?<=" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.67
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?>=" (l, r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.69
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?>=" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.71
  -- Result subtype: std_ulogic
  -- Result: Computes "l >= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?>=" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.73
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?=" (l, r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.75
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?=" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.77
  -- Result subtype: std_ulogic
  -- Result: Computes "l = r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?=" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================

  --```
  -- Id: C.79
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l and r are unsigned vectors possibly
  --         of different lengths.
  --```
  function "?/=" (L, R : STD_ULOGIC_VECTOR) return STD_ULOGIC;

  --```
  -- id: c.81
  -- result subtype: std_ulogic
  -- result: computes "l /= r" where l is a nonnegative integer and
  --         r is an unsigned vector.
  --```
  function "?/=" (l : natural; r : std_ulogic_vector) return std_ulogic;

  --```
  -- Id: C.83
  -- Result subtype: std_ulogic
  -- Result: Computes "l /= r" where l is an unsigned vector and
  --         r is a nonnegative integer.
  --```
  function "?/=" (l : std_ulogic_vector; r : natural) return std_ulogic;

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  --```
  -- Id: S.1
  -- Result subtype: std_ulogic_vector(arg'length-1 downto 0)
  -- Result: Performs a shift-left on an unsigned vector count times.
  --         The vacated positions are filled with '0'.
  --         The count leftmost elements are lost.
  --```
  function shift_left (arg : std_ulogic_vector; count : natural) return std_ulogic_vector;

  --```
  -- Id: S.2
  -- Result subtype: unsigned(arg'length-1 downto 0)
  -- Result: Performs a shift-right on an unsigned vector count times.
  --         The vacated positions are filled with '0'.
  --         The count rightmost elements are lost.
  --============================================================================
  --```
  function shift_right (arg : std_ulogic_vector; count : natural) return std_ulogic_vector;

  --```
  -- Id: S.5
  -- Result subtype: std_ulogic_vector(arg'length-1 downto 0)
  -- Result: Performs a rotate-left of an unsigned vector count times.
  --```
  function rotate_left (arg : std_ulogic_vector; count : natural) return std_ulogic_vector;

  --```
  -- Id: S.6
  -- Result subtype: std_ulogic_vector(arg'length-1 downto 0)
  -- Result: Performs a rotate-right of an unsigned vector count times.
  --```
  function rotate_right (arg : std_ulogic_vector; count : natural) return std_ulogic_vector;

  --============================================================================

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  -- Result subtype: std_ulogic_vector(arg'length-1 downto 0)
  -- Result: Shift_left(arg, count)
  --```
  function "sla" (arg : std_ulogic_vector; count : integer) return std_ulogic_vector;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  ------------------------------------------------------------------------------
  -- Id: S.19
  -- Result subtype: std_ulogic_vector(arg'length-1 downto 0)
  -- Result: Shift_right(arg, count)
  -- out the function (declaration and body) for ieee std 1076-1987 compatibility.
  --```
  function "sra" (ARG : STD_ULOGIC_VECTOR; COUNT : INTEGER) return STD_ULOGIC_VECTOR;

  --============================================================================
  --   RESIZE Functions
  --============================================================================

  --```
  -- Id: R.2
  -- Result subtype: std_ulogic_vector(new_size-1 downto 0)
  -- Result: Resizes the unsigned vector arg to the specified size.
  --         to create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. when truncating, the leftmost bits
  --         are dropped.
  --```
  function resize (arg : std_ulogic_vector; new_size : natural) return std_ulogic_vector;

  --```
  -- Result subtype: std_ulogic_vector (size_res'length-1 downto 0)
  --```
  function resize (arg, size_res : std_ulogic_vector) return std_ulogic_vector;

  --============================================================================
  -- Conversion Functions
  --============================================================================

  --```
  -- Id: D.1
  -- Result subtype: natural. value cannot be negative since parameter is an
  --             UNSIGNED vector.
  -- Result: Converts the unsigned vector to an integer.
  --```
  function to_integer (arg : std_ulogic_vector) return natural;

  --```
  -- Id: D.3
  -- Result subtype: std_logic_vector(size-1 downto 0)
  -- Result: Converts a non-negative integer to an unsigned vector with
  --         the specified size.
  --```
  function to_stdlogicvector (arg, size : natural) return std_logic_vector;

  -- Result subtype: std_logic_vector(size_res'length-1 downto 0)
  function to_stdlogicvector (arg : natural; size_res : std_ulogic_vector) return std_logic_vector;

  alias to_std_logic_vector is to_stdlogicvector[natural, natural return std_logic_vector];
  alias to_slv is to_stdlogicvector[natural, natural return std_logic_vector];
  alias to_std_logic_vector is to_stdlogicvector[natural, std_ulogic_vector return std_logic_vector];
  alias to_slv is to_stdlogicvector[natural, std_ulogic_vector return std_logic_vector];

  --```
  -- Id: D.5
  -- Result subtype: std_ulogic_vector(size-1 downto 0)
  -- Result: Converts a non-negative integer to an unsigned vector with
  --         the specified size.
  --```
  function to_stdulogicvector (arg, size : natural) return std_ulogic_vector;

  -- Result subtype: std_logic_vector(size_res'length-1 downto 0)
  function to_stdulogicvector (arg : natural; size_res : std_ulogic_vector) return std_ulogic_vector;

  alias to_std_ulogic_vector is to_stdulogicvector[natural, natural return std_ulogic_vector];
  alias to_sulv is to_stdulogicvector[natural, natural return std_ulogic_vector];
  alias to_std_ulogic_vector is to_stdulogicvector[natural, std_ulogic_vector return std_ulogic_vector];
  alias to_sulv is to_stdulogicvector[natural, std_ulogic_vector return std_ulogic_vector];

end package numeric_std_unsigned;
