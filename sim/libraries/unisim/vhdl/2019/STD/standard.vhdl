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
--   Title     :  standard package
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named std.
--             :
--   Developers:  IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines predefined types and subprograms
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

package standard is
  -- Predefined enumeration types:

  type direction is (
    ASCENDING,       -- The range is ascending.
    DESCENDING       -- the range is descending.
  );

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: direction) return boolean;
  -- function "/="(anonymous, anonymous: direction) return boolean;
  -- function "<"(anonymous, anonymous: direction) return boolean;
  -- function "<="(anonymous, anonymous: direction) return boolean;
  -- function ">"(anonymous, anonymous: direction) return boolean;
  -- function ">="(anonymous, anonymous: direction) return boolean;
  -- function minimum (l, r: direction) return direction;
  -- function maximum (l, r: direction) return direction;
  -- Implicit defined range record for direction'range_record:
  -- type direction_range_record is record
  --   Left      : direction;
  --   Right     : direction;
  --   Direction : direction;
  -- end record;

  type boolean is (FALSE, TRUE);

  -- The predefined operations for this type are as follows:

  function "and"(anonymous, anonymous: boolean) return boolean;
  function "or"(anonymous, anonymous: boolean) return boolean;
  function "nand"(anonymous, anonymous: boolean) return boolean;
  function "nor"(anonymous, anonymous: boolean) return boolean;
  function "xor"(anonymous, anonymous: boolean) return boolean;
  function "xnor"(anonymous, anonymous: boolean) return boolean;
  function "not"(anonymous: boolean) return boolean;

  -- function "="(anonymous, anonymous: boolean) return boolean;
  -- function "/="(anonymous, anonymous: boolean) return boolean;
  -- function "<"(anonymous, anonymous: boolean) return boolean;
  -- function "<="(anonymous, anonymous: boolean) return boolean;
  -- function ">"(anonymous, anonymous: boolean) return boolean;
  -- function ">="(anonymous, anonymous: boolean) return boolean;
  -- function minimum(l, r: boolean) return boolean;
  -- function maximum(l, r: boolean) return boolean;

  function rising_edge(signal s: boolean) return boolean;
  function falling_edge(signal s: boolean) return boolean;

  -- Implicit defined range record for boolean'range_record
  type boolean_range_record is record
    left      : boolean;
    right     : boolean;
    direction : direction;
  end record;

  type bit is ('0', '1');

  -- The predefined operations for this type are as follows:

  function "and"(anonymous, anonymous: bit) return bit;
  function "or"(anonymous, anonymous: bit) return bit;
  function "nand"(anonymous, anonymous: bit) return bit;
  function "nor"(anonymous, anonymous: bit) return bit;
  function "xor"(anonymous, anonymous: bit) return bit;
  function "xnor"(anonymous, anonymous: bit) return bit;
  function "not"(anonymous: bit) return bit;

  -- function "="(anonymous, anonymous: bit) return boolean;
  -- function "/="(anonymous, anonymous: bit) return boolean;
  -- function "<"(anonymous, anonymous: bit) return boolean;
  -- function "<="(anonymous, anonymous: bit) return boolean;
  -- function ">"(anonymous, anonymous: bit) return boolean;
  -- function ">="(anonymous, anonymous: bit) return boolean;

  function "?="(anonymous, anonymous: bit) return bit;
  function "?/="(anonymous, anonymous: bit) return bit;
  function "?<"(anonymous, anonymous: bit) return bit;
  function "?<="(anonymous, anonymous: bit) return bit;
  function "?>"(anonymous, anonymous: bit) return bit;
  function "?>="(anonymous, anonymous: bit) return bit;

  -- function minimum (l, r: bit) return bit;
  -- function maximum (l, r: bit) return bit;

  function "??"(anonymous: bit) return boolean;
  function rising_edge (signal s: bit) return boolean;
  function falling_edge (signal s: bit) return boolean;

  -- Implicit defined range record for bit'range_record
  type bit_range_record is record
     left      : bit;
     right     : bit;
     direction : direction;
  end record;

  type character is (
	NUL,	SOH,	STX,	ETX,	EOT,	ENQ,	ACK,	BEL,
	BS ,	HT ,	LF ,	VT ,	FF ,	CR ,	SO ,	SI ,
	DLE,	DC1,	DC2,	DC3,	DC4,	NAK,	SYN,	ETB,
	CAN,	EM ,	SUB,	ESC,	FSP,	GSP,	RSP,	USP,

	' ',	'!',	'"',	'#',	'$',	'%',	'&',	''',
	'(',	')',	'*',	'+',	',',	'-',	'.',	'/',
	'0',	'1',	'2',	'3',	'4',	'5',	'6',	'7',
	'8',	'9',	':',	';',	'<',	'=',	'>',	'?',

	'@',	'A',	'B',	'C',	'D',	'E',	'F',	'G',
	'H',	'I',	'J',	'K',	'L',	'M',	'N',	'O',
	'P',	'Q',	'R',	'S',	'T',	'U',	'V',	'W',
	'X',	'Y',	'Z',	'[',	'\',	']',	'^',	'_',

	'`',	'a',	'b',	'c',	'd',	'e',	'f',	'g',
	'h',	'i',	'j',	'k',	'l',	'm',	'n',	'o',
	'p',	'q',	'r',	's',	't',	'u',	'v',	'w',
	'x',	'y',	'z',	'{',	'|',	'}',	'~',	DEL,

	C128,	C129,	C130,	C131,	C132,	C133,	C134,	C135,
	C136,	C137,	C138,	C139,	C140,	C141,	C142,	C143,
	C144,	C145,	C146,	C147,	C148,	C149,	C150,	C151,
	C152,	C153,	C154,	C155,	C156,	C157,	C158,	C159,

	' ',	'¡',	'¢',	'£',	'¤',	'¥',	'¦',	'§',
	'¨',	'©',	'ª',	'«',	'¬',	'­' ,	'®',	'¯',
	'°',	'±',	'²',	'³',	'´',	'µ',	'¶',	'·',
	'¸',	'¹',	'º',	'»',	'¼',	'½',	'¾',	'¿',
	'À',	'Á',	'Â',	'Ã',	'Ä',	'Å',	'Æ',	'Ç',
	'È',	'É',	'Ê',	'Ë',	'Ì',	'Í',	'Î',	'Ï',
	'Ð',	'Ñ',	'Ò',	'Ó',	'Ô',	'Õ',	'Ö',	'×',
	'Ø',	'Ù',	'Ú',	'Û',	'Ü',	'Ý',	'Þ',	'ß',
	'à',	'á',	'â',	'ã',	'ä',	'å',	'æ',	'ç',
	'è',	'é',	'ê',	'ë',	'ì',	'í',	'î',	'ï',
	'ð',	'ñ',	'ò',	'ó',	'ô',	'õ',	'ö',	'÷',
	'ø',	'ù',	'ú',	'û',	'ü',	'ý',	'þ',	'ÿ'
  );

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: character) return boolean;
  -- function "/="(anonymous, anonymous: character) return boolean;
  -- function "<"(anonymous, anonymous: character) return boolean;
  -- function "<="(anonymous, anonymous: character) return boolean;
  -- function ">"(anonymous, anonymous: character) return boolean;
  -- function ">="(anonymous, anonymous: character) return boolean;
  -- function minimum (l, r: character) return character;
  -- function maximum (l, r: character) return character;

  -- Implicit defined range record for character'range_record
  type character_range_record is record
    left      : character;
    right     : character;
    direction : direction;
  end record;

  type severity_level is (NOTE, WARNING, ERROR, FAILURE);

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: severity_level) return boolean;
  -- function "/="(anonymous, anonymous: severity_level) return boolean;
  -- function "<"(anonymous, anonymous: severity_level) return boolean;
  -- function "<="(anonymous, anonymous: severity_level) return boolean;
  -- function ">"(anonymous, anonymous: severity_level) return boolean;
  -- function ">="(anonymous, anonymous: severity_level) return boolean;
  -- function minimum (l, r: severity_level) return severity_level;
  -- function maximum (l, r: severity_level) return severity_level;

  -- Implicit defined range record for severity_level'range_record
  type severity_level_range_record is record
    left      : severity_level;
    right     : severity_level;
    direction : direction;
  end record;

  -- type universal_integer is range implementation_defined;
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: universal_integer) return boolean;
  -- function "/="(anonymous, anonymous: universal_integer) return boolean;
  -- function "<"(anonymous, anonymous: universal_integer) return boolean;
  -- function "<="(anonymous, anonymous: universal_integer) return boolean;
  -- function ">"(anonymous, anonymous: universal_integer) return boolean;
  -- function ">="(anonymous, anonymous: universal_integer) return boolean;
  -- function "+"(anonymous: universal_integer) return universal_integer;
  -- function "-"(anonymous: universal_integer) return universal_integer;
  -- function "abs"(anonymous: universal_integer) return universal_integer;
  -- function "+"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function "-"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function "*"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function "/"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function "mod"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function "rem"(anonymous, anonymous: universal_integer) return universal_integer;
  -- function minimum (l, r: universal_integer) return universal_integer;
  -- function maximum (l, r: universal_integer) return universal_integer;
  -- Implicit defined range record for universal_integer'range_record:
  -- type universal_integer_range_record is record
  --   Left      : universal_integer;
  --   Right     : universal_integer;
  --   Direction : direction;
  -- end record;

  -- type universal_real is range implementation_defined;
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: universal_real) return boolean;
  -- function "/="(anonymous, anonymous: universal_real) return boolean;
  -- function "<"(anonymous, anonymous: universal_real) return boolean;
  -- function "<="(anonymous, anonymous: universal_real) return boolean;
  -- function ">"(anonymous, anonymous: universal_real) return boolean;
  -- function ">="(anonymous, anonymous: universal_real) return boolean;
  -- function "+"(anonymous: universal_real) return universal_real;
  -- function "-"(anonymous: universal_real) return universal_real;
  -- function "abs"(anonymous: universal_real) return universal_real;
  -- function "+"(anonymous, anonymous: universal_real) return universal_real;
  -- function "-"(anonymous, anonymous: universal_real) return universal_real;
  -- function "*"(anonymous, anonymous: universal_real) return universal_real;
  -- function "/"(anonymous, anonymous: universal_real) return universal_real;
  -- function "*"(anonymous: universal_real; anonymous: universal_integer) return universal_real;
  -- function "*"(anonymous: universal_integer; anonymous: universal_real) return universal_real;
  -- function "/"(anonymous: universal_real; anonymous: universal_integer) return universal_real;
  -- function minimum (l, r: universal_real) return universal_real;
  -- function maximum (l, r: universal_real) return universal_real;
  -- Implicit defined range record for universal_real'range_record:
  -- type universal_real_range_record is record
  --   Left      : universal_real;
  --   Right     : universal_real;
  --   Direction : direction;
  -- end record;

  -- Predefined numeric types:

  type integer is range -9223372036854775808 to 9223372036854775807;

  -- The predefined operations for this type are as follows:
  -- function "**"(anonymous: universal_integer; anonymous: integer) return universal_integer;
  -- function "**"(anonymous: universal_real; anonymous: integer) return universal_real;
  -- function "="(anonymous, anonymous: integer) return boolean;
  -- function "/="(anonymous, anonymous: integer) return boolean;
  -- function "<"(anonymous, anonymous: integer) return boolean;
  -- function "<="(anonymous, anonymous: integer) return boolean;
  -- function ">"(anonymous, anonymous: integer) return boolean;
  -- function ">="(anonymous, anonymous: integer) return boolean;
  -- function "+"(anonymous: integer) return integer;
  -- function "-"(anonymous: integer) return integer;
  -- function "abs"(anonymous: integer) return integer;
  -- function "+"(anonymous, anonymous: integer) return integer;
  -- function "-"(anonymous, anonymous: integer) return integer;
  -- function "*"(anonymous, anonymous: integer) return integer;
  -- function "/"(anonymous, anonymous: integer) return integer;
  -- function "mod"(anonymous, anonymous: integer) return integer;
  -- function "rem"(anonymous, anonymous: integer) return integer;
  -- function "**"(anonymous: integer; anonymous: integer) return integer;
  -- function minimum (l, r: integer) return integer;
  -- function maximum (l, r: integer) return integer;

  -- Implicit defined range record for integer'range_record
  type integer_range_record is record
    left      : integer;
    right     : integer;
    direction : direction;
  end record;

  type real is range -1.7014111e+308 to 1.7014111e+308;

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: real) return boolean;
  -- function "/="(anonymous, anonymous: real) return boolean;
  -- function "<"(anonymous, anonymous: real) return boolean;
  -- function "<="(anonymous, anonymous: real) return boolean;
  -- function ">"(anonymous, anonymous: real) return boolean;
  -- function ">="(anonymous, anonymous: real) return boolean;
  -- function "+"(anonymous: real) return real;
  -- function "-"(anonymous: real) return real;
  -- function "abs"(anonymous: real) return real;
  -- function "+"(anonymous, anonymous: real) return real;
  -- function "-"(anonymous, anonymous: real) return real;
  -- function "*"(anonymous, anonymous: real) return real;
  -- function "/"(anonymous, anonymous: real) return real;
  -- function "**"(anonymous: real; anonymous: integer) return real;
  -- function minimum (l, r: real) return real;
  -- function maximum (l, r: real) return real;

  -- Implicit defined range record for real'range_record
  type real_range_record is record
    left      : real;
    right     : real;
    direction : direction;
  end record;

  -- Predefined type time:
  type time is range -9223372036854775808 to 9223372036854775807
    units
      fs;             -- femtosecond
      ps  = 1000 fs;  -- picosecond
      ns  = 1000 ps;  -- nanosecond
      us  = 1000 ns;  -- microsecond
      ms  = 1000 us;  -- millisecond
      sec = 1000 ms;  -- second
      min =   60 sec; -- minute
      hr  =   60 min; -- hour
    end units;

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: time) return boolean;
  -- function "/="(anonymous, anonymous: time) return boolean;
  -- function "<"(anonymous, anonymous: time) return boolean;
  -- function "<="(anonymous, anonymous: time) return boolean;
  -- function ">"(anonymous, anonymous: time) return boolean;
  -- function ">="(anonymous, anonymous: time) return boolean;
  -- function "+"(anonymous: time) return time;
  -- function "- (anonymous: time) return time;
  -- function "abs"(anonymous: time) return time;
  -- function "+"(anonymous, anonymous: time) return time;
  -- function "-"(anonymous, anonymous: time) return time;
  -- function "*"(anonymous: time; anonymous: integer) return time;
  -- function "*"(anonymous: time; anonymous: real) return time;
  -- function "*"(anonymous: integer; anonymous: time) return time;
  -- function "*"(anonymous: real; anonymous: time) return time;
  -- function "/"(anonymous: time; anonymous: integer) return time;
  -- function "/"(anonymous: time; anonymous: real) return time;
  -- function "/"(anonymous, anonymous: time) return universal_integer;
  -- function "mod"(anonymous, anonymous: time) return time;
  -- function "rem"(anonymous, anonymous: time) return time;
  -- function minimum (l, r: time) return time;
  -- function maximum (l, r: time) return time;

  -- Implicit defined range record for time'range_record
  type time_range_record is record
    left      : time;
    right     : time;
    direction : direction;
  end record;

  subtype delay_length is time range 0 fs to time'high;

  -- A function that returns the current simulation time, Tc, (see 14.7.5.1)
  impure function now return delay_length;

  -- Predefined numeric subtypes:

  subtype natural is integer range 0 to integer'high;
  subtype positive is integer range 1 to integer'high;

  -- Predefined array types:

  type string is array (positive range <>) of character;

  -- The predefined operations for these types are as follows:
  -- function "="(anonymous, anonymous: string) return boolean;
  -- function "/="(anonymous, anonymous: string) return boolean;
  -- function "<"(anonymous, anonymous: string) return boolean;
  -- function "<="(anonymous, anonymous: string) return boolean;
  -- function ">"(anonymous, anonymous: string) return boolean;
  -- function ">="(anonymous, anonymous: string) return boolean;
  -- function "&"(anonymous: string; anonymous: string) return string;
  -- function "&"(anonymous: string; anonymous: character) return string;
  -- function "&"(anonymous: character; anonymous: string) return string;
  -- function "&"(anonymous: character; anonymous: character) return string;
  -- function minimum (l, r: string) return string;
  -- function maximum (l, r: string) return string;
  -- function minimum (l: string) return character;
  -- function maximum (l: string) return character;

  type boolean_vector is array (natural range <>) of boolean;

  -- The predefined operations for this type are as follows:

  function "and"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "or"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "nand"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "nor"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "xor"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "xnor"(anonymous, anonymous: boolean_vector) return boolean_vector;
  function "not"(anonymous: boolean_vector) return boolean_vector;
  function "and"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "and"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  function "or"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "or"(anonymous: boolean; anonymous : boolean_vector) return boolean_vector;
  function "nand"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "nand"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  function "nor"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "nor"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  function "xor"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "xor"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  function "xnor"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  function "xnor"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  function "and"(anonymous: boolean_vector) return boolean;
  function "or"(anonymous: boolean_vector) return boolean;
  function "nand"(anonymous: boolean_vector) return boolean;
  function "nor"(anonymous: boolean_vector) return boolean;
  function "xor"(anonymous: boolean_vector) return boolean;
  function "xnor"(anonymous: boolean_vector) return boolean;
  function "sll"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;
  function "srl"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;
  function "sla"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;
  function "sra"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;
  function "rol"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;
  function "ror"(anonymous: boolean_vector; anonymous: integer) return boolean_vector;

  -- function "="(anonymous, anonymous: boolean_vector) return boolean;
  -- function "/="(anonymous, anonymous: boolean_vector) return boolean;
  -- function "<"(anonymous, anonymous: boolean_vector) return boolean;
  -- function "<="(anonymous, anonymous: boolean_vector) return boolean;
  -- function ">"(anonymous, anonymous: boolean_vector) return boolean;
  -- function ">="(anonymous, anonymous: boolean_vector) return boolean;
  -- function "?="(anonymous, anonymous: boolean_vector) return boolean;
  -- function "?/="(anonymous, anonymous: boolean_vector) return boolean;
  -- function "&"(anonymous: boolean_vector; anonymous: boolean_vector) return boolean_vector;
  -- function "&"(anonymous: boolean_vector; anonymous: boolean) return boolean_vector;
  -- function "&"(anonymous: boolean; anonymous: boolean_vector) return boolean_vector;
  -- function "&"(anonymous: boolean; anonymous: boolean) return boolean_vector;
  -- function minimum (l, r: boolean_vector) return boolean_vector;
  -- function maximum (l, r: boolean_vector) return boolean_vector;
  -- function minimum (l: boolean_vector) return boolean;
  -- function maximum (l: boolean_vector) return boolean;

  type bit_vector is array (natural range <>) of bit;

  -- The predefined operations for this type are as follows:

  function "and"(anonymous, anonymous: bit_vector) return bit_vector;
  function "or"(anonymous, anonymous: bit_vector) return bit_vector;
  function "nand"(anonymous, anonymous: bit_vector) return bit_vector;
  function "nor"(anonymous, anonymous: bit_vector) return bit_vector;
  function "xor"(anonymous, anonymous: bit_vector) return bit_vector;
  function "xnor"(anonymous, anonymous: bit_vector) return bit_vector;
  function "not"(anonymous: bit_vector) return bit_vector;
  function "and"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "and"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "or"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "or"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "nand"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "nand"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "nor"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "nor"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "xor"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "xor"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "xnor"(anonymous: bit_vector; anonymous : bit) return bit_vector;
  function "xnor"(anonymous: bit; anonymous : bit_vector) return bit_vector;
  function "and"(anonymous: bit_vector) return bit;
  function "or"(anonymous: bit_vector) return bit;
  function "nand"(anonymous: bit_vector) return bit;
  function "nor"(anonymous: bit_vector) return bit;
  function "xor"(anonymous: bit_vector) return bit;
  function "xnor"(anonymous: bit_vector) return bit;
  function "sll"(anonymous: bit_vector; anonymous: integer) return bit_vector;
  function "srl"(anonymous: bit_vector; anonymous: integer) return bit_vector;
  function "sla"(anonymous: bit_vector; anonymous: integer) return bit_vector;
  function "sra"(anonymous: bit_vector; anonymous: integer) return bit_vector;
  function "rol"(anonymous: bit_vector; anonymous: integer) return bit_vector;
  function "ror"(anonymous: bit_vector; anonymous: integer) return bit_vector;

  -- function "="(anonymous, anonymous: bit_vector) return boolean;
  -- function "/="(anonymous, anonymous: bit_vector) return boolean;
  -- function "<"(anonymous, anonymous: bit_vector) return boolean;
  -- function "<="(anonymous, anonymous: bit_vector) return boolean;
  -- function ">"(anonymous, anonymous: bit_vector) return boolean;
  -- function ">="(anonymous, anonymous: bit_vector) return boolean;

  function "?="(anonymous, anonymous: bit_vector) return bit;
  function "?/="(anonymous, anonymous: bit_vector) return bit;

  -- function "&"(anonymous: bit_vector; anonymous: bit_vector) return bit_vector;
  -- function "&"(anonymous: bit_vector; anonymous: bit) return bit_vector;
  -- function "&"(anonymous: bit; anonymous: bit_vector) return bit_vector;
  -- function "&"(anonymous: bit; anonymous: bit) return bit_vector;
  -- function minimum (l, r: bit_vector) return bit_vector;
  -- function maximum (l, r: bit_vector) return bit_vector;
  -- function minimum (l: bit_vector) return bit;
  -- function maximum (l: bit_vector) return bit;
  -- function to_string (value: bit_vector) return string;
  -- alias TO_BSTRING is to_string [bit_vector return string];
  -- alias TO_BINARY_STRING is to_string [bit_vector return string];
  -- function TO_OSTRING (value: bit_vector) return string;
  -- alias TO_OCTAL_STRING is TO_OSTRING [bit_vector return string];
  -- function TO_HSTRING (value: bit_vector) return string;
  -- alias TO_HEX_STRING is TO_HSTRING [bit_vector return string];

  type integer_vector is array (natural range <>) of integer;

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: integer_vector) return boolean;
  -- function "/="(anonymous, anonymous: integer_vector) return boolean;
  -- function "<"(anonymous, anonymous: integer_vector) return boolean;
  -- function "<="(anonymous, anonymous: integer_vector) return boolean;
  -- function ">"(anonymous, anonymous: integer_vector) return boolean;
  -- function ">="(anonymous, anonymous: integer_vector) return boolean;
  -- function "&"(anonymous: integer_vector; anonymous: integer_vector) return integer_vector;
  -- function "&"(anonymous: integer_vector; anonymous: integer) return integer_vector;
  -- function "&"(anonymous: integer; anonymous: integer_vector) return integer_vector;
  -- function "&"(anonymous: integer; anonymous: integer) return integer_vector;
  -- function minimum (l, r: integer_vector) return integer_vector;
  -- function maximum (l, r: integer_vector) return integer_vector;
  -- function minimum (l: integer_vector) return integer;
  -- function maximum (l: integer_vector) return integer;

  type real_vector is array (natural range <>) of real;

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: real_vector) return boolean;
  -- function "/="(anonymous, anonymous: real_vector) return boolean;
  -- function "&"(anonymous: real_vector; anonymous: real_vector) return real_vector;
  -- function "&"(anonymous: real_vector; anonymous: real) return real_vector;
  -- function "&"(anonymous: real; anonymous: real_vector) return real_vector;
  -- function "&"(anonymous: real; anonymous: real) return real_vector;
  -- function minimum (l: real_vector) return real;
  -- function maximum (l: real_vector) return real;

  type time_vector is array (natural range <>) of time;

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: time_vector) return boolean;
  -- function "/="(anonymous, anonymous: time_vector) return boolean;
  -- function "&"(anonymous: time_vector; anonymous: time_vector) return time_vector;
  -- function "&"(anonymous: time_vector; anonymous: time) return time_vector;
  -- function "&"(anonymous: time; anonymous: time_vector) return time_vector;
  -- function "&"(anonymous: time; anonymous: time) return time_vector;
  -- function minimum (l: time_vector) return time;
  -- function maximum (l: time_vector) return time;

  -- The predefined types for opening files:

  type file_open_kind is (
    READ_MODE,  -- Resulting access mode is read-only.
    READ_WRITE_MODE, -- Resulting access mode is read/write.
    WRITE_MODE, -- Resulting access mode is write-only.
    APPEND_MODE -- Resulting access mode is write-only but information is appended to the end of the existing file.
  );            

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: file_open_kind) return boolean;
  -- function "/="(anonymous, anonymous: file_open_kind) return boolean;
  -- function "<"(anonymous, anonymous: file_open_kind) return boolean;
  -- function "<="(anonymous, anonymous: file_open_kind) return boolean;
  -- function ">"(anonymous, anonymous: file_open_kind) return boolean;
  -- function ">="(anonymous, anonymous: file_open_kind) return boolean;
  -- function minimum (l, r: file_open_kind) return file_open_kind;
  -- function maximum (l, r: file_open_kind) return file_open_kind;

  -- Implicit defined range record for file_open_kind'range_record
  type FILE_OPEN_KIND_RANGE_RECORD is record
    left      : file_open_kind;
    right     : file_open_kind;
    direction : direction;
  end record;

  type file_open_status is (
    OPEN_OK,      -- File open was successful.
    STATUS_ERROR, -- File object was already open.
    NAME_ERROR,   -- External file not found or inaccessible.
    MODE_ERROR    -- Could not open file with requested access mode.
  );

  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: file_open_status) return boolean;
  -- function "/="(anonymous, anonymous: file_open_status) return boolean;
  -- function "<"(anonymous, anonymous: file_open_status) return boolean;
  -- function "<="(anonymous, anonymous: file_open_status) return boolean;
  -- function ">"(anonymous, anonymous: file_open_status) return boolean;
  -- function ">="(anonymous, anonymous: file_open_status) return boolean;
  -- function minimum (l, r: file_open_status) return file_open_status;
  -- function maximum (l, r: file_open_status) return file_open_status;

  -- Implicit defined range record for file_open_status'range_record
  type FILE_OPEN_STATUS_RANGE_RECORD is record
    left      : file_open_status;
    right     : file_open_status;
    direction : direction;
  end record;

  type file_open_state is (
    STATE_OPEN,   -- File object is open.
    STATE_CLOSED  -- File object is closed.
  );

  -- The predefined operations for this type are as follows:
  -- function "=" (anonymous, anonymous: file_open_state) return boolean;
  -- function "/=" (anonymous, anonymous: file_open_state) return boolean;
  -- function "<" (anonymous, anonymous: file_open_state) return boolean;
  -- function "<=" (anonymous, anonymous: file_open_state) return boolean;
  -- function ">" (anonymous, anonymous: file_open_state) return boolean;
  -- function ">=" (anonymous, anonymous: file_open_state) return boolean;
  -- function minimum (l, r: file_open_state) return file_open_state;
  -- function maximum (l, r: file_open_state) return file_open_state;

  -- Implicit defined range record for file_open_state'range_record
  type file_open_state_range_record is record
    left      : file_open_state;
    right     : file_open_state;
    direction : direction;
  end record;

  type file_origin_kind is (
    FILE_ORIGIN_BEGIN,   -- File open was successful.
    FILE_ORIGIN_CURRENT, -- File object was already open.
    FILE_ORIGIN_END      -- External file not found
  );

  -- The predefined operations for this type are as follows:
  -- function "=" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function "/=" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function "<" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function "<=" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function ">" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function ">=" (anonymous, anonymous: file_origin_kind) return boolean;
  -- function minimum (l, r: file_origin_kind) return file_origin_kind;
  -- function maximum (l, r: file_origin_kind) return file_origin_kind;

  -- Implicit defined range record for file_origin_kind'range_record
  type file_origin_kind_range_record is record
    left      : file_origin_kind;
    right     : file_origin_kind;
    direction : direction;
  end record;

  -- The 'foreign attribute:
  attribute foreign: string;

  -- Predefined to_string operations on scalar types
  -- function to_string (value: boolean) return string;
  -- function to_string (value: bit) return string;
  -- function to_string (value: character) return string;
  -- function to_string (value: severity_level) return string;
  -- function to_string (value: universal_integer) return string;
  -- function to_string (value: universal_real) return string;
  -- function to_string (value: integer) return string;
  -- function to_string (value: real) return string;
  -- function to_string (value: time) return string;
  -- function to_string (value: string) return string;
  -- function to_string (value: boolean_vector) return string; 
  -- function to_string (value: integer_vector) return string;
  -- function to_string (value: real_vector) return string;
  -- function to_string (value: time_vector) return string;
  -- function to_string (value: file_open_kind) return string;
  -- function to_string (value: file_open_status) return string;
  -- Predefined overloaded to_string operations
  -- function to_string (value: real; digits: natural) return string;
  -- function to_string (value: real; format: string) return string;
  -- function to_string (value: time; unit: time) return string;

end package standard;
