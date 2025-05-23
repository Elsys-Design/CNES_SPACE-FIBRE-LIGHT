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
--   Library   :  This package shall be compiled into a library
--             :  symbolically named std.
--             :
--   Developers:  IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines subprograms for file I/O
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

package textio is
  -- Type definitions for text I/O:
  type line is access string; -- A line is a pointer to a string value.
  -- The predefined operations for this type are as follows:
  -- function"=" (anonymous, anonymous: line) return boolean;
  -- function"/=" (anonymous, anonymous: line) return boolean;
  -- procedure deallocate (p: inout line);

 type line_vector is array(natural range <>) of line;
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: line_vector) return boolean;
  -- function "/="(anonymous, anonymous: line_vector) return boolean;
  -- function "&"(anonymous: line_vector; anonymous: line_vector) return line_vector;
  -- function "&"(anonymous: line_vector; anonymous: line) return line_vector;
  -- function "&"(anonymous: line; anonymous: line_vector) return line_vector;
  -- function "&"(anonymous: line; anonymous: line) return line_vector;

  type text is file of string; -- A file of variable-length ASCII records.
  -- The predefined operations for this type are as follows:
  -- procedure file_open (file f: text; External_Name; in string; Open_Kind: in file_open_kind := read_mode);
  -- procedure file_open (Status: out file_open_status; file f: text; External_Name: in string; Open_Kind: in file_open_kind := read_mode);
  -- procedure file_rewind (file f: ft);
  -- procedure file_seek (file f: ft; Offset : integer; Origin : file_origin_kind := file_origin_begin);
  -- procedure file_truncate (file f: ft; Size : integer; Origin : file_origin_kind := file_origin_begin);
  -- function  file_mode (file f: ft) return file_open_kind;
  -- function  file_tell (file f: ft; Origin : file_origin_kind := file_origin_begin) return integer;
  -- function  file_size (file f: ft) return integer;
  -- procedure file_close (file f: text);
  -- procedure read (file f: text; value: out string);
  -- procedure write (file f: text; value: in string);
  -- procedure flush (file f: text);
  -- function  endfile (file f: text) return boolean;

  type side is (RIGHT, LEFT); -- For justifying output data within fields.
  -- The predefined operations for this type are as follows:
  -- function "=" (anonymous, anonymous: side) return boolean;
  -- function "/=" (anonymous, anonymous: side) return boolean;
  -- function "<" (anonymous, anonymous: side) return boolean;
  -- function "<=" (anonymous, anonymous: side) return boolean;
  -- function ">" (anonymous, anonymous: side) return boolean;
  -- function ">=" (anonymous, anonymous: side) return boolean;
  -- function minimum (l, r: side) return side;
  -- function maximum (l, r: side) return side;
  -- function to_string (value: side) return string;

  subtype width is natural; -- For specifying widths of output fields.
  function justify (value: string; justified: side := RIGHT; field: width := 0 ) return string;
  -- Standard text files:
  file input: text open read_mode is "STD_INPUT";
  file output: text open write_mode is "STD_OUTPUT";

  -- Input routines for standard types:
  procedure readline (file f: text; l: inout line);
  procedure read (l: inout line; value: out bit; good: out boolean);
  procedure read (l: inout line; value: out bit);
  procedure read (l: inout line; value: out bit_vector; good: out boolean);
  procedure read (l: inout line; value: out bit_vector);
  procedure read (l: inout line; value: out boolean; good: out boolean);
  procedure read (l: inout line; value: out boolean);
  procedure read (l: inout line; value: out character; good: out boolean);
  procedure read (l: inout line; value: out character);
  procedure read (l: inout line; value: out integer; good: out boolean);
  procedure read (l: inout line; value: out integer);
  procedure read (l: inout line; value: out real; good: out boolean);
  procedure read (l: inout line; value: out real);
  procedure read (l: inout line; value: out string; good: out boolean);
  procedure read (l: inout line; value: out string);
  procedure read (l: inout line; value: out time; good: out boolean);
  procedure read (l: inout line; value: out time);
  procedure sread (l: inout line; value: out string; strlen: out natural);
  alias string_read is sread [line, string, natural];
  alias bread is read [line, bit_vector, boolean];
  alias bread is read [line, bit_vector];
  alias binary_read is read [line, bit_vector, boolean];
  alias binary_read is read [line, bit_vector];
  procedure oread (l: inout line; value: out bit_vector; good: out boolean);
  procedure oread (l: inout line; value: out bit_vector);
  alias octal_read is oread [line, bit_vector, boolean];
  alias octal_read is oread [line, bit_vector];
  procedure hread (l: inout line; value: out bit_vector; good: out boolean);
  procedure hread (l: inout line; value: out bit_vector);
  alias hex_read is hread [line, bit_vector, boolean];
  alias hex_read is hread [line, bit_vector];

  -- Output routines for standard types:
  procedure writeline (file f: text; l: inout line);
  procedure tee (file f: text; l: inout line);
  procedure write (l: inout line; value: in bit; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in bit_vector; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in boolean; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in character; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in integer; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in real; justified: in side:= RIGHT; field: in width := 0; digits: in natural:= 0);
  procedure write (l: inout line; value: in real; format: in string);
  procedure write (l: inout line; value: in string; justified: in side:= RIGHT; field: in width := 0);
  procedure write (l: inout line; value: in time; justified: in side:= RIGHT; field: in width := 0; unit: in time:= ns);
  alias swrite is write [line, string, side, width];
  alias string_write is write [line, string, side, width];
  alias bwrite is write [line, bit_vector, side, width];
  alias binary_write is write [line, bit_vector, side, width];
  procedure owrite (l: inout line; value: in bit_vector; justified: in side := RIGHT; field: in width := 0);
  alias octal_write is owrite [line, bit_vector, side, width];
  procedure hwrite (l: inout line; value: in bit_vector; justified: in side := RIGHT; field: in width := 0);
  alias hex_write is hwrite [line, bit_vector, side, width];

end package textio;
