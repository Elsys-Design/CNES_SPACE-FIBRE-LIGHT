-- -----------------------------------------------------------------
-- 
-- Copyright 2019 IEEE P1076 WG Authors
-- 
-- See the LICENSE file distributed with this work for copyright and
-- licensing information and the AUTHORS file.
-- 
-- This file to you under the Apache License, Version 2.0 (the "License").
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
-- implied.  See the License for the specific language governing
-- permissions and limitations under the License.
--

package reflection is
  type    index           is       range integer'low to integer'high;
  subtype natural_index   is index range 0 to index'high;
  subtype positive_index  is index range 1 to index'high;
  subtype dimension       is index range 1 to index'high;
  type    index_vector    is array(dimension range <>) of index;

  -- Incomplete type declarations

  type value_mirror;
  type subtype_mirror;

  -- Enumeration subtype/value mirror

  type enumeration_subtype_mirror;
  type enumeration_value_mirror_PT is protected
    impure function get_subtype_mirror return enumeration_subtype_mirror;
    impure function to_value_mirror    return value_mirror;
    impure function pos   return integer;
    impure function image return string;
  end protected;
  type enumeration_value_mirror is access enumeration_value_mirror_pt;

  type enumeration_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function enumeration_literal(literal_idx : natural_index) return enumeration_value_mirror;
    impure function enumeration_literal(literal_name : string)       return enumeration_value_mirror;

    impure function simple_name return string;
    impure function left        return enumeration_value_mirror;
    impure function right       return enumeration_value_mirror;
    impure function low         return enumeration_value_mirror;
    impure function high        return enumeration_value_mirror;
    impure function length      return positive_index;
    impure function ascending   return boolean;
  end protected;
  type enumeration_subtype_mirror is access enumeration_subtype_mirror_pt;


  -- Integer subtype/value mirror

  type integer_subtype_mirror;
  type integer_value_mirror_pt is protected
    impure function get_subtype_mirror return integer_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function value return integer;
    impure function image return string;
  end protected;
  type integer_value_mirror is access integer_value_mirror_pt;

  type integer_subtype_mirror_PT is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function simple_name return string;
    impure function left        return integer_value_mirror;
    impure function right       return integer_value_mirror;
    impure function low         return integer_value_mirror;
    impure function high        return integer_value_mirror;
    impure function length      return index;
    impure function ascending   return boolean;
  end protected;
  type integer_subtype_mirror is access integer_subtype_mirror_pt;


  -- Floating-point subtype/value mirror

  type floating_subtype_mirror;
  type floating_value_mirror_pt is protected
    impure function get_subtype_mirror return floating_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function value return real;
    impure function image return string;
  end protected;
  type floating_value_mirror is access floating_value_mirror_pt;

  type floating_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function simple_name return string;
    impure function left        return floating_value_mirror;
    impure function right       return floating_value_mirror;
    impure function low         return floating_value_mirror;
    impure function high        return floating_value_mirror;
    impure function ascending   return boolean;
  end protected;
  type floating_subtype_mirror is access floating_subtype_mirror_pt;


  -- Physical subtype/value mirror

  type physical_subtype_mirror;
  type physical_value_mirror_pt is protected
    impure function get_subtype_mirror return physical_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function unit_index return index;
    impure function value      return integer;
    impure function image      return string;
  end protected;
  type physical_value_mirror is access physical_value_mirror_pt;

  type physical_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function units_length                   return index;
    impure function unit_name (unit_idx: index)    return string;
    impure function unit_index(unit_name : string) return index;
    impure function scale(unit_idx: index)         return natural;
    impure function scale(unit_name: string)       return natural;

    impure function simple_name return string;
    impure function left        return physical_value_mirror;
    impure function right       return physical_value_mirror;
    impure function low         return physical_value_mirror;
    impure function high        return physical_value_mirror;
    impure function length      return index;
    impure function ascending   return boolean;
  end protected;
  type physical_subtype_mirror is access physical_subtype_mirror_pt;


  -- Record subtype/value mirror

  type record_subtype_mirror;
  type record_value_mirror_pt is protected
    impure function get_subtype_mirror return record_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function get(element_idx : index)   return value_mirror;
    impure function get(element_name : string) return value_mirror;
  end protected;
  type record_value_mirror is access record_value_mirror_pt;

  type record_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function length                                 return index;
    impure function element_name(element_idx : index)      return string;
    impure function element_index(element_name : string)   return index;
    impure function element_subtype(element_idx : index)   return subtype_mirror;
    impure function element_subtype(element_name : string) return subtype_mirror;

    impure function simple_name return string;
  end protected;
  type record_subtype_mirror is access record_subtype_mirror_pt;


  -- Array subtype/value mirror

  type array_subtype_mirror;
  type array_value_mirror_pt is protected
    impure function get_subtype_mirror return array_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function get(idx : index)              return value_mirror;
    impure function get(idx1, idx2 : index)       return value_mirror;
    impure function get(idx1, idx2, idx3 : index) return value_mirror;
    impure function get(idx : index_vector)       return value_mirror;
  end protected;
  type array_value_mirror is access array_value_mirror_pt;

  type array_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function dimensions                          return dimension;
    impure function index_subtype(idx : dimension := 1) return subtype_mirror;
    impure function element_subtype                     return subtype_mirror;

    impure function simple_name                     return string;
    impure function left(idx : dimension := 1)      return index;
    impure function right(idx : dimension := 1)     return index;
    impure function low(idx : dimension := 1)       return index;
    impure function high(idx : dimension := 1)      return index;
    impure function length(idx : dimension := 1)    return index;
    impure function ascending(idx : dimension := 1) return boolean;
  end protected;
  type array_subtype_mirror is access array_subtype_mirror_pt;


  -- Access subtype/value mirror

  type access_subtype_mirror;
  type access_value_mirror_pt is protected
    impure function get_subtype_mirror return access_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    --
    impure function get return value_mirror;
    impure function is_null return boolean;
  end protected;
  type access_value_mirror is access access_value_mirror_pt;

  type access_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function simple_name        return string;
    impure function designated_subtype return subtype_mirror;
  end protected;
  type access_subtype_mirror is access access_subtype_mirror_pt;


  -- File subtype/value mirror

  type file_subtype_mirror;
  type file_value_mirror_pt is protected
    impure function get_subtype_mirror return file_subtype_mirror;
    impure function to_value_mirror    return value_mirror;

    impure function get_file_logical_name return string;
    impure function get_file_open_kind    return file_open_kind;
  end protected;
  type file_value_mirror is access file_value_mirror_pt;

  type file_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function simple_name        return string;
    impure function designated_subtype return subtype_mirror;
  end protected;
  type file_subtype_mirror is access file_subtype_mirror_pt;


  -- Protected subtype/value mirror

  type protected_subtype_mirror;
  type protected_value_mirror_pt is protected
    impure function get_subtype_mirror return protected_subtype_mirror;
    impure function to_value_mirror    return value_mirror;
  end protected;
  type protected_value_mirror is access protected_value_mirror_pt;

  type protected_subtype_mirror_pt is protected
    impure function to_subtype_mirror return subtype_mirror;

    impure function simple_name return string;
  end protected;
  type protected_subtype_mirror is access protected_subtype_mirror_pt;


  -- Type classes and sub-classes

  type type_class is (
    CLASS_ENUMERATION,
    CLASS_INTEGER,
    CLASS_FLOATING,
    CLASS_PHYSICAL,
    CLASS_RECORD,
    CLASS_ARRAY,
    CLASS_ACCESS,
    CLASS_FILE,
    CLASS_PROTECTED
  );
  alias value_class is type_class;


  -- Subtype/value mirror

  type subtype_mirror_pt is protected
    impure function get_type_class return type_class;

    -- Get the corresponding representation

    impure function to_enumeration return enumeration_subtype_mirror;
    impure function to_integer     return integer_subtype_mirror;
    impure function to_floating    return floating_subtype_mirror;
    impure function to_physical    return physical_subtype_mirror;
    impure function to_record      return record_subtype_mirror;
    impure function to_array       return array_subtype_mirror;
    impure function to_access      return access_subtype_mirror;
    impure function to_file        return file_subtype_mirror;
    impure function to_protected   return protected_subtype_mirror;

    impure function simple_name return string;
  end protected;
  type subtype_mirror is access subtype_mirror_pt;

  type value_mirror_pt is protected
    impure function get_value_class    return value_class;
    impure function get_subtype_mirror return subtype_mirror;

    -- Get the corresponding representation

    impure function to_enumeration return enumeration_value_mirror;
    impure function to_integer     return integer_value_mirror;
    impure function to_floating    return floating_value_mirror;
    impure function to_physical    return physical_value_mirror;
    impure function to_record      return record_value_mirror;
    impure function to_array       return array_value_mirror;
    impure function to_access      return access_value_mirror;
    impure function to_file        return file_value_mirror;
    impure function to_protected   return protected_value_mirror;
  end protected;
  type value_mirror is access value_mirror_pt;
end package reflection;
