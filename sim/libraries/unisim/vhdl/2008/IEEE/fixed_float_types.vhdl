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
--   Title      :  Fixed Point and Floating Point types package
--
--   Library   :  This package shall be compiled into a library
--                symbolically named IEEE.
--
--   Developers:  Accellera VHDL-TC and IEEE P1076 Working Group
--
--   Purpose   :  Definitions for use in fixed point and floating point
--                arithmetic packages
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

package fixed_float_types is

  -- Types used for generics of fixed_generic_pkg

  type fixed_round_style_type is (FIXED_ROUND, FIXED_TRUNCATE);

  type fixed_overflow_style_type is (FIXED_SATURATE, FIXED_WRAP);

  -- Type used for generics of float_generic_pkg

  -- These are the same as the C FE_TONEAREST, FE_UPWARD, FE_DOWNWARD,
  -- and FE_TOWARDZERO floating point rounding macros.

  type round_type is (ROUND_NEAREST,    -- Default, nearest LSB '0'
                      ROUND_INF,        -- Round toward positive infinity
                      ROUND_NEGINF,     -- Round toward negative infinity
                      ROUND_ZERO        -- Round toward zero (truncate)
                      );

end package fixed_float_types;
