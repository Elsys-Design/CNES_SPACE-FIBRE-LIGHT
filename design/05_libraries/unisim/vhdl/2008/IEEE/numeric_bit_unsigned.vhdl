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
--             :  (NUMERIC_BIT_UNSIGNED package declaration)
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named IEEE.
--             :
--   Developers:  Accellera VHDL-TC, and IEEE P1076 Working Group
--             :
--   Purpose   :  This package defines numeric types and arithmetic functions
--             :  for use with synthesis tools. Values of type BIT_VECTOR
--             :  are interpreted as unsigned numbers in vector form.
--             :  The leftmost bit is treated as the most significant bit.
--             :  This package contains overloaded arithmetic operators on
--             :  the BIT_VECTOR type. The package also contains
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

package numeric_bit_unsigned is
  constant CopyRightNotice : STRING :=
    "Copyright 2008 IEEE. All rights reserved.";

  --```
  -- Id: A.3
  -- Result subtype: bit_vector(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0).
  -- Result: Adds two UNSIGNED vectors that may be of different lengths.
  --```
  function "+" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.3R
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where R is a one bit bit_vector
  --```
  function "+"(L : BIT_VECTOR; R : BIT) return BIT_VECTOR;

  --```
  -- Id: A.3L
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Similar to A.3 where L is a one bit UNSIGNED
  --```
  function "+"(L : BIT; R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.5
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0).
  -- Result: Adds an UNSIGNED vector, L, with a non-negative INTEGER, R.
  --```
  function "+" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.6
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0).
  -- Result: Adds a non-negative INTEGER, L, with an UNSIGNED vector, R.
  --```
  function "+" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: A.9
  -- Result subtype: UNSIGNED(MAXIMUM(L'LENGTH, R'LENGTH)-1 downto 0).
  -- Result: Subtracts two UNSIGNED vectors that may be of different lengths.
  --```
  function "-" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.9R
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where R is a one bit UNSIGNED
  --```
  function "-"(L : BIT_VECTOR; R : BIT) return BIT_VECTOR;

  --```
  -- Id: A.9L
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Similar to A.9 where L is a one bit UNSIGNED
  --```
  function "-"(L : BIT; R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.11
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0).
  -- Result: Subtracts a non-negative INTEGER, R, from an UNSIGNED vector, L.
  --```
  function "-" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.12
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0).
  -- Result: Subtracts an UNSIGNED vector, R, from a non-negative INTEGER, L.
  --```
  function "-" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: A.15
  -- Result subtype: bit_vector((L'LENGTH+R'LENGTH-1) downto 0).
  -- Result: Performs the multiplication operation on two UNSIGNED vectors
  --         that may possibly be of different lengths.
  --```
  function "*" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.17
  -- Result subtype: bit_vector((L'LENGTH+L'LENGTH-1) downto 0).
  -- Result: Multiplies an UNSIGNED vector, L, with a non-negative
  --         INTEGER, R. R is converted to an UNSIGNED vector of
  --         SIZE L'LENGTH before multiplication.
  --```
  function "*" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.18
  -- Result subtype: bit_vector((R'LENGTH+R'LENGTH-1) downto 0).
  -- Result: Multiplies an UNSIGNED vector, R, with a non-negative
  --         INTEGER, L. L is converted to an UNSIGNED vector of
  --         SIZE R'LENGTH before multiplication.
  --```
  function "*" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "/" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.21
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by another UNSIGNED vector, R.
  --```
  function "/" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.23
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Divides an UNSIGNED vector, L, by a non-negative INTEGER, R.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.
  --```
  function "/" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.24
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Divides a non-negative INTEGER, L, by an UNSIGNED vector, R.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.
  --```
  function "/" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "rem" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.27
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L and R are UNSIGNED vectors.
  --```
  function "rem" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.29
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where L is an UNSIGNED vector and R is a
  --         non-negative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.
  --```
  function "rem" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.30
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Computes "L rem R" where R is an UNSIGNED vector and L is a
  --         non-negative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.
  --```
  function "rem" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================
  --
  -- NOTE: If second argument is zero for "mod" operator, a severity level
  --       of ERROR is issued.

  --```
  -- Id: A.33
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L and R are UNSIGNED vectors.
  --```
  function "mod" (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: A.35
  -- Result subtype: bit_vector(L'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where L is an UNSIGNED vector and R
  --         is a non-negative INTEGER.
  --         If NO_OF_BITS(R) > L'LENGTH, result is truncated to L'LENGTH.
  --```
  function "mod" (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --```
  -- Id: A.36
  -- Result subtype: bit_vector(R'LENGTH-1 downto 0)
  -- Result: Computes "L mod R" where R is an UNSIGNED vector and L
  --         is a non-negative INTEGER.
  --         If NO_OF_BITS(L) > R'LENGTH, result is truncated to R'LENGTH.
  --```
  function "mod" (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: A.39
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_leftmost (ARG : BIT_VECTOR; Y : BIT) return INTEGER;

  --```
  -- Id: A.41
  -- Result subtype: INTEGER
  -- Result: Finds the leftmost occurrence of the value of Y in ARG.
  --         Returns the index of the occurrence if it exists, or -1 otherwise.
  --```
  function find_rightmost (ARG : BIT_VECTOR; Y : BIT) return INTEGER;

  --============================================================================
  -- Comparison Operators
  --============================================================================

  --```
  -- Id: C.1
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function ">" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.3
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function ">" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.5
  -- Result subtype: BOOLEAN
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function ">" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.7
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "<" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.9
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "<" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.11
  -- Result subtype: BOOLEAN
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function "<" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.13
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "<=" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.15
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "<=" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.17
  -- Result subtype: BOOLEAN
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function "<=" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.19
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function ">=" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.21
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function ">=" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.23
  -- Result subtype: BOOLEAN
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function ">=" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.25
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "=" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.27
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "=" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.29
  -- Result subtype: BOOLEAN
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function "=" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.31
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "/=" (L, R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.33
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is a non-negative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "/=" (L : NATURAL; R : BIT_VECTOR) return BOOLEAN;

  --```
  -- Id: C.35
  -- Result subtype: BOOLEAN
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a non-negative INTEGER.
  --```
  function "/=" (L : BIT_VECTOR; R : NATURAL) return BOOLEAN;

  --============================================================================

  --```
  -- Id: C.37
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the lesser of two UNSIGNED vectors that may be
  --         of different lengths.
  --```
  function MINIMUM (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: C.39
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the lesser of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.
  --```
  function MINIMUM (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: C.41
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the lesser of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.
  --```
  function MINIMUM (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: C.43
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the greater of two UNSIGNED vectors that may be
  --         of different lengths.
  --```
  function MAXIMUM (L, R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: C.45
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the greater of a nonnegative INTEGER, L, and
  --         an UNSIGNED vector, R.
  --```
  function MAXIMUM (L : NATURAL; R : BIT_VECTOR) return BIT_VECTOR;

  --```
  -- Id: C.47
  -- Result subtype: BIT_VECTOR
  -- Result: Returns the greater of an UNSIGNED vector, L, and
  --         a nonnegative INTEGER, R.
  --```
  function MAXIMUM (L : BIT_VECTOR; R : NATURAL) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: C.49
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?>" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.51
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?>" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.53
  -- Result subtype: BIT
  -- Result: Computes "L > R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?>" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================

  --```
  -- Id: C.55
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?<" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.57
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?<" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.59
  -- Result subtype: BIT
  -- Result: Computes "L < R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?<" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================

  --```
  -- Id: C.61
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?<=" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.63
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?<=" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.65
  -- Result subtype: BIT
  -- Result: Computes "L <= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?<=" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================

  --```
  -- Id: C.67
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?>=" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.69
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?>=" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.71
  -- Result subtype: BIT
  -- Result: Computes "L >= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?>=" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================

  --```
  -- Id: C.73
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?=" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.75
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?=" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.77
  -- Result subtype: BIT
  -- Result: Computes "L = R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?=" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================

  --```
  -- Id: C.79
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L and R are UNSIGNED vectors possibly
  --         of different lengths.
  --```
  function "?/=" (L, R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.81
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is a nonnegative INTEGER and
  --         R is an UNSIGNED vector.
  --```
  function "?/=" (L : NATURAL; R : BIT_VECTOR) return BIT;

  --```
  -- Id: C.83
  -- Result subtype: BIT
  -- Result: Computes "L /= R" where L is an UNSIGNED vector and
  --         R is a nonnegative INTEGER.
  --```
  function "?/=" (L : BIT_VECTOR; R : NATURAL) return BIT;

  --============================================================================
  -- Shift and Rotate Functions
  --============================================================================

  --```
  -- Id: S.1
  -- Result subtype: bit_vector(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-left on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with '0'.
  --         The COUNT leftmost elements are lost.
  --```
  function SHIFT_LEFT (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR;

  --```
  -- Id: S.2
  -- Result subtype: UNSIGNED(ARG'LENGTH-1 downto 0)
  -- Result: Performs a shift-right on an UNSIGNED vector COUNT times.
  --         The vacated positions are filled with '0'.
  --         The COUNT rightmost elements are lost.
  --```
  function SHIFT_RIGHT (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR;

  --============================================================================

  --```
  -- Id: S.5
  -- Result subtype: bit_vector(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-left of an UNSIGNED vector COUNT times.
  --```
  function ROTATE_LEFT (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR;

  --```
  -- Id: S.6
  -- Result subtype: bit_vector(ARG'LENGTH-1 downto 0)
  -- Result: Performs a rotate-right of an UNSIGNED vector COUNT times.
  --```
  function ROTATE_RIGHT (ARG : BIT_VECTOR; COUNT : NATURAL) return BIT_VECTOR;

  --============================================================================

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.9 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.9
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)
  --```
  function "sll" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.11 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.11
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)
  --```
  function "srl" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.13 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.13
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_LEFT(ARG, COUNT)
  --```
  function "rol" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.15 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.15
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: ROTATE_RIGHT(ARG, COUNT)
  --```
  function "ror" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.17 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.17
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_LEFT(ARG, COUNT)
  --```
  function "sla" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --```
  ------------------------------------------------------------------------------
  -- Note: Function S.19 is not compatible with IEEE Std 1076-1987. Comment
  -- out the function (declaration and body) for IEEE Std 1076-1987 compatibility.
  ------------------------------------------------------------------------------
  -- Id: S.19
  -- Result subtype: BIT_VECTOR(ARG'LENGTH-1 downto 0)
  -- Result: SHIFT_RIGHT(ARG, COUNT)
  --```
  function "sra" (ARG : BIT_VECTOR; COUNT : INTEGER) return BIT_VECTOR;

  --============================================================================
  --   RESIZE Functions
  --============================================================================

  --```
  -- Id: R.2
  -- Result subtype: bit_vector(NEW_SIZE-1 downto 0)
  -- Result: Resizes the UNSIGNED vector ARG to the specified size.
  --         To create a larger vector, the new [leftmost] bit positions
  --         are filled with '0'. When truncating, the leftmost bits
  --         are dropped.
  --```
  function RESIZE (ARG : BIT_VECTOR; NEW_SIZE : NATURAL) return BIT_VECTOR;

  --```
  -- Result subtype: BIT_VECTOR (SIZE_RES'length-1 downto 0)
  --```
  function RESIZE (ARG, SIZE_RES : BIT_VECTOR) return BIT_VECTOR;

  --============================================================================
  -- Conversion Functions
  --============================================================================

  --```
  -- Id: D.1
  -- Result subtype: NATURAL. Value cannot be negative since parameter is an
  --             UNSIGNED vector.
  -- Result: Converts the UNSIGNED vector to an INTEGER.
  --```
  function TO_INTEGER (ARG : BIT_VECTOR) return NATURAL;

  --```
  -- Id: D.3
  -- Result subtype: bit_vector(SIZE-1 downto 0)
  -- Result: Converts a non-negative INTEGER to an UNSIGNED vector with
  --         the specified size.
  --```
  function To_BitVector (ARG, SIZE : NATURAL) return BIT_VECTOR;

  --```
  -- Result subtype: STD_LOGIC_VECTOR(SIZE_RES'length-1 downto 0)
  --```
  function To_BitVector (ARG : NATURAL; SIZE_RES : BIT_VECTOR)
    return BIT_VECTOR;

-- begin LCS-2006-130
  alias To_Bit_Vector is
    To_BitVector[NATURAL, NATURAL return BIT_VECTOR];
  alias To_BV is
    To_BitVector[NATURAL, NATURAL return BIT_VECTOR];

  alias To_Bit_Vector is
    To_BitVector[NATURAL, BIT_VECTOR return BIT_VECTOR];
  alias To_BV is
    To_BitVector[NATURAL, BIT_VECTOR return BIT_VECTOR];

end package numeric_bit_unsigned;
