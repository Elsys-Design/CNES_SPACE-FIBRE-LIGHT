package standard is

	-- Predefined enumeration types:

	type boolean is (FALSE, TRUE);

	-- The predefined operations for this type are as follows:

	function "and"  (l, r: boolean) return boolean;
	function "or"	 (l, r: boolean) return boolean;
	function "nand" (l, r: boolean) return boolean;
	function "nor"  (l, r: boolean) return boolean;
	function "xor"  (l, r: boolean) return boolean;
	function "xnor" (l, r: boolean) return boolean;

	function "not" (anonymous: boolean) return boolean;

	-- function "="  (l, r: boolean) return boolean;
	-- function "/=" (l, r: boolean) return boolean;
	-- function "<"  (l, r: boolean) return boolean;
	-- function "<=" (l, r: boolean) return boolean;
	-- function ">"  (l, r: boolean) return boolean;
	-- function ">=" (l, r: boolean) return boolean;
	--
	-- function minimum (l, r: boolean) return boolean;
	-- function maximum (l, r: boolean) return boolean;

	function rising_edge  (signal s: boolean) return boolean;
	function falling_edge (signal s: boolean) return boolean;

	-- function to_string (value: boolean) return string;


	type bit is ('0', '1');

	-- The predefined operations for this type are as follows:

	function "and"  (l, r: bit) return bit;
	function "or"   (l, r: bit) return bit;
	function "nand" (l, r: bit) return bit;
	function "nor"  (l, r: bit) return bit;
	function "xor"  (l, r: bit) return bit;
	function "xnor" (l, r: bit) return bit;

	function "not" (anonymous: bit) return bit;

	-- function "="  (l, r: bit) return boolean;
	-- function "/=" (l, r: bit) return boolean;
	-- function "<"  (l, r: bit) return boolean;
	-- function "<=" (l, r: bit) return boolean;
	-- function ">"  (l, r: bit) return boolean;
	-- function ">=" (l, r: bit) return boolean;

	function "?="  (l, r: bit) return bit;
	function "?/=" (l, r: bit) return bit;
	function "?<"  (l, r: bit) return bit;
	function "?<=" (l, r: bit) return bit;
	function "?>"  (l, r: bit) return bit;
	function "?>=" (l, r: bit) return bit;

	-- function minimum (l, r: bit) return bit;
	-- function maximum (l, r: bit) return bit;

	function "??"	(anonymous: bit) return boolean;
	function rising_edge (signal s: bit) return boolean;
	function falling_edge (signal s: bit) return boolean;

	-- function to_string (value: bit) return string;

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

	-- function "="  (l, r: character) return boolean;
	-- function "/=" (l, r: character) return boolean;
	-- function "<"  (l, r: character) return boolean;
	-- function "<=" (l, r: character) return boolean;
	-- function ">"  (l, r: character) return boolean;
	-- function ">=" (l, r:character) return boolean;
	--
	-- function minimum (l, r: character) return character;
	-- function maximum (l, r: character) return character;
	--
	-- function to_string (value: character) return string;

	type severity_level is (NOTE, WARNING, ERROR, FAILURE);

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: severity_level) return boolean;
	-- function "/=" (l, r: severity_level) return boolean;
	-- function "<"  (l, r: severity_level) return boolean;
	-- function "<=" (l, r: severity_level) return boolean;
	-- function ">"  (l, r: severity_level) return boolean;
	-- function ">=" (l, r:severity_level) return boolean;
	--
	-- function minimum (l, r: severity_level) return severity_level;
	-- function maximum (l, r: severity_level) return severity_level;
	--
	-- function to_string (value: severity_level) return string;

	-- type universal_integer is range implementation_defined;
	--
	-- the predefined operations for this type are as follows:
	--
	-- function "="  (l, r: universal_integer) return boolean;
	-- function "/=" (l, r: universal_integer) return boolean;
	-- function "<"  (l, r: universal_integer) return boolean;
	-- function "<=" (l, r: universal_integer) return boolean;
	-- function ">"  (l, r: universal_integer) return boolean;
	-- function ">=" (l, r: universal_integer) return boolean;
	--
	-- function "+"   (anonymous: universal_integer) return universal_integer;
	-- function "-"   (anonymous: universal_integer) return universal_integer;
	-- function "abs" (anonymous: universal_integer) return universal_integer;
	--
	-- function "+" (l, r: universal_integer) return universal_integer;
	-- function "-" (l, r: universal_integer) return universal_integer;
	-- function "*" (l, r: universal_integer) return universal_integer;
	-- function "/" (l, r: universal_integer) return universal_integer;
	-- function "mod" (l, r: universal_integer) return universal_integer;
	-- function "rem" (l, r: universal_integer) return universal_integer;
	--
	-- function minimum (l, r: universal_integer) return universal_integer;
	-- function maximum (l, r: universal_integer) return universal_integer;
	--
	-- function to_string (value: universal_integer)   return string;

	-- type universal_real is range implementation_defined;
	--
	-- The predefined operations for this type are as follows:
	--
	-- function "="  (l, r: universal_real) return boolean;
	-- function "/=" (l, r: universal_real) return boolean;
	-- function "<"  (l, r: universal_real) return boolean;
	-- function "<=" (l, r: universal_real) return boolean;
	-- function ">"  (l, r: universal_real) return boolean;
	-- function ">=" (l, r: universal_real) return boolean;
	--
	-- function "+" (anonymous: universal_real) return universal_real;
	-- function "-" (anonymous: universal_real) return universal_real;
	-- function "abs" (anonymous: universal_real) return universal_real;
	--
	-- function "+" (l, r: universal_real) return universal_real;
	-- function "-" (l, r: universal_real) return universal_real;
	-- function "*" (l, r: universal_real) return universal_real;
	-- function "/" (l, r: universal_real) return universal_real;
	--
	-- function "*" (anonymous: universal_real; anonymous: universal_integer) return universal_real;
	-- function "*" (anonymous: universal_integer; anonymous: universal_real) return universal_real;
	-- function "/" (anonymous: universal_real; anonymous: universal_integer) return universal_real;
	--
	-- function minimum (l, r: universal_real) return universal_real;
	-- function maximum (l, r: universal_real) return universal_real;
	--
	-- function to_string (value: universal_real) return string;
	--
	-- function "**" (anonymous: universal_integer; anonymous: integer) return universal_integer;
	-- function "**" (anonymous: universal_real; anonymous: integer) return universal_real;

	-- predefined numeric types:

	-- Implementation_defined
	type integer is range -2147483647 to 2147483647;

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: integer) return boolean;
	-- function "/=" (l, r: integer) return boolean;
	-- function "<"  (l, r: integer) return boolean;
	-- function "<=" (l, r: integer) return boolean;
	-- function ">"  (l, r: integer) return boolean;
	-- function ">=" (l, r: integer) return boolean;
	--
	-- function "+" (anonymous: integer) return integer;
	-- function "-" (anonymous: integer) return integer;
	-- function "abs" (anonymous: integer) return integer;
	--
	-- function "+" (l, r: integer) return integer;
	-- function "-" (l, r: integer) return integer;
	-- function "*" (l, r: integer) return integer;
	-- function "/" (l, r: integer) return integer;
	-- function "mod" (l, r: integer) return integer;
	-- function "rem" (l, r: integer) return integer;
	--
	-- function "**" (l: integer; r: integer) return integer;
	--
	-- function minimum (l, r: integer) return integer;
	-- function maximum (l, r: integer) return integer;
	--
	-- function to_string (value: integer) return string;

	-- Implementation_defined
	type real is range -1.7014111e+308 to 1.7014111e+308;

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: real) return boolean;
	-- function "/=" (l, r: real) return boolean;
	-- function "<"  (l, r: real) return boolean;
	-- function "<=" (l, r: real) return boolean;
	-- function ">"  (l, r: real) return boolean;
	-- function ">=" (l, r: real) return boolean;
	--
	-- function "+" (anonymous: real) return real;
	-- function "-" (anonymous: real) return real;
	-- function "abs" (anonymous: real) return real;
	--
	-- function "+" (l, r: real) return real;
	-- function "-" (l, r: real) return real;
	-- function "*" (l, r: real) return real;
	-- function "/" (l, r: real) return real;
	--
	-- function "**" (l: real; r: integer) return real;
	--
	-- function minimum (l, r: real) return real;
	-- function maximum (l, r: real) return real;
	--
	-- function to_string (value: real) return string;

	-- Predefined type time:
	-- implementation_defined
	type time is range -2147483647 to 2147483647
	units
		fs;                             -- femtosecond
		ps = 1000 fs;                   -- picosecond
		ns = 1000 ps;                   -- nanosecond
		us = 1000 ns;                   -- microsecond
		ms = 1000 us;                   -- millisecond
		sec = 1000 ms;                  -- second
		min = 60 sec;                   -- minute
		hr = 60 min;                    -- hour
	end units;

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: time) return boolean;
	-- function "/=" (l, r: time) return boolean;
	-- function "<"  (l, r: time) return boolean;
	-- function "<=" (l, r: time) return boolean;
	-- function ">"  (l, r: time) return boolean;
	-- function ">=" (l, r: time) return boolean;
	--
	-- function "+"   (anonymous: time) return time;
	-- function "-"   (anonymous: time) return time;
	-- function "abs" (anonymous: time) return time;
	--
	-- function "+" (l, r: time) return time;
	-- function "-" (l, r: time) return time;
	--
	-- function "*" (l: time; r: integer) return time;
	-- function "*" (l: time; r: real) return time;
	-- function "*" (l: integer; r: time) return time;
	-- function "*" (l: real; r: time) return time;
	--
	-- function "/" (l: time; r: integer) return time;
	-- function "/" (l: time; r: real) return time;
	-- function "/" (l, r: time) return integer;
	--
	-- function "mod" (l, r: time) return time;
	-- function "rem" (l, r: time) return time;
	--
	-- function minimum (l, r: time) return time;
	-- function maximum (l, r: time) return time;
	--
	-- function to_string (value: time) return string;

	subtype delay_length is time range 0 fs to time'high;

	-- A function that returns the current simulation time, TC,
	-- (see 14.7.5.1):
	impure function now return delay_length;

	-- Predefined numeric subtypes:

	subtype natural is integer range 0 to integer'high;
	subtype positive is integer range 1 to integer'high;

	-- Predefined array types:

	type string is array (positive range <>) of character;

	-- The predefined operations for these types are as follows:

	-- function "="  (l, r: string) return boolean;
	-- function "/=" (l, r: string) return boolean;
	-- function "<"  (l, r: string) return boolean;
	-- function "<=" (l, r: string) return boolean;
	-- function ">"  (l, r: string) return boolean;
	-- function ">=" (l, r: string) return boolean;
	--
	-- function "&" (l: string; r: string) return string;
	-- function "&" (l: string; r: character) return string;
	-- function "&" (l: character; r: string) return string;
	-- function "&" (l: character; r: character) return string;
	--
	-- function minimum (l, r: string) return string;
	-- function maximum (l, r: string) return string;
	--
	-- function minimum (l: string) return character;
	-- function maximum (l: string) return character;


	type boolean_vector is array (natural range <>) of boolean;

	-- The predefined operations for these types are as follows:

	function "and"  (l, r: boolean_vector) return boolean_vector;
	function "or"   (l, r: boolean_vector) return boolean_vector;
	function "nand" (l, r: boolean_vector) return boolean_vector;
	function "nor"  (l, r: boolean_vector) return boolean_vector;
	function "xor"  (l, r: boolean_vector) return boolean_vector;
	function "xnor" (l, r: boolean_vector) return boolean_vector;
	--
	function "not" (anonymous: boolean_vector) return boolean_vector;
	--
	function "and"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "and"  (l: boolean; r: boolean_vector) return boolean_vector;
	function "or"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "or"  (l: boolean; r: boolean_vector) return boolean_vector;
	function "nand"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "nand"  (l: boolean; r: boolean_vector) return boolean_vector;
	function "nor"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "nor"  (l: boolean; r: boolean_vector) return boolean_vector;
	function "xor"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "xor"  (l: boolean; r: boolean_vector) return boolean_vector;
	function "xnor"  (l: boolean_vector; r: boolean) return boolean_vector;
	function "xnor"  (l: boolean; r: boolean_vector) return boolean_vector;
	--
	function "and"  (anonymous: boolean_vector) return boolean;
	function "or"   (anonymous: boolean_vector) return boolean;
	function "nand" (anonymous: boolean_vector) return boolean;
	function "nor"  (anonymous: boolean_vector) return boolean;
	function "xor"  (anonymous: boolean_vector) return boolean;
	function "xnor" (anonymous: boolean_vector) return boolean;
	--
	function "sll"  (l: boolean_vector; r: integer) return boolean_vector;
	function "srl"  (l: boolean_vector; r: integer) return boolean_vector;
	function "sla"  (l: boolean_vector; r: integer) return boolean_vector;
	function "sra"  (l: boolean_vector; r: integer) return boolean_vector;
	function "rol"  (l: boolean_vector; r: integer) return boolean_vector;
	function "ror"  (l: boolean_vector; r: integer) return boolean_vector;
	--
	-- function "="  (l, r: boolean_vector) return boolean;
	-- function "/=" (l, r: boolean_vector) return boolean;
	-- function "<"  (l, r: boolean_vector) return boolean;
	-- function "<=" (l, r: boolean_vector) return boolean;
	-- function ">"  (l, r: boolean_vector) return boolean;
	-- function ">=" (l, r: boolean_vector) return boolean;
	--
	-- function "?="  (l, r: boolean_vector) return boolean;
	-- function "?/=" (l, r: boolean_vector) return boolean;
	--
	-- function "&" (l: boolean_vector; r: boolean_vector) return boolean_vector;
	-- function "&" (l: boolean_vector; r: boolean) return boolean_vector;
	-- function "&" (l: boolean; r: boolean_vector) return boolean_vector;
	-- function "&" (l: boolean; r: boolean) return boolean_vector;
	--
	-- function minimum (l, r: boolean_vector) return boolean_vector;
	-- function maximum (l, r: boolean_vector) return boolean_vector;
	--
	-- function minimum (l: boolean_vector) return boolean;
	-- function maximum (l: boolean_vector) return boolean;


	type bit_vector is array (natural range <>) of bit;

	-- The predefined operations for this type are as follows:

	function "and"  (l, r: bit_vector) return bit_vector;
	function "or"   (l, r: bit_vector) return bit_vector;
	function "nand" (l, r: bit_vector) return bit_vector;
	function "nor"  (l, r: bit_vector) return bit_vector;
	function "xor"  (l, r: bit_vector) return bit_vector;
	function "xnor" (l, r: bit_vector) return bit_vector;
	--
	function "not" (anonymous: bit_vector) return bit_vector;
	--
	function "and"  (l: bit_vector; r: bit) return bit_vector;
	function "and"  (l: bit; r: bit_vector) return bit_vector;
	function "or"   (l: bit_vector; r: bit) return bit_vector;
	function "or"   (l: bit; r: bit_vector) return bit_vector;
	function "nand" (l: bit_vector; r: bit) return bit_vector;
	function "nand" (l: bit; r: bit_vector) return bit_vector;
	function "nor"  (l: bit_vector; r: bit) return bit_vector;
	function "nor"  (l: bit; r: bit_vector) return bit_vector;
	function "xor"  (l: bit_vector; r: bit) return bit_vector;
	function "xor"  (l: bit; r: bit_vector) return bit_vector;
	function "xnor" (l: bit_vector; r: bit) return bit_vector;
	function "xnor" (l: bit; r: bit_vector) return bit_vector;
	--
	function "and"  (anonymous: bit_vector) return bit;
	function "or"   (anonymous: bit_vector) return bit;
	function "nand" (anonymous: bit_vector) return bit;
	function "nor"  (anonymous: bit_vector) return bit;
	function "xor"  (anonymous: bit_vector) return bit;
	function "xnor" (anonymous: bit_vector) return bit;
	--
	function "sll"  (l: bit_vector; r: integer) return bit_vector;
	function "srl"  (l: bit_vector; r: integer) return bit_vector;
	function "sla"  (l: bit_vector; r: integer) return bit_vector;
	function "sra"  (l: bit_vector; r: integer) return bit_vector;
	function "rol"  (l: bit_vector; r: integer) return bit_vector;
	function "ror"  (l: bit_vector; r: integer) return bit_vector;

	-- function "="  (l, r: bit_vector) return boolean;
	-- function "/=" (l, r: bit_vector) return boolean;
	-- function "<"  (l, r: bit_vector) return boolean;
	-- function "<=" (l, r: bit_vector) return boolean;
	-- function ">"  (l, r: bit_vector) return boolean;
	-- function ">=" (l, r: bit_vector) return boolean;

	function "?="  (l, r: bit_vector) return bit;
	function "?/=" (l, r: bit_vector) return bit;

	-- function "&" (l: bit_vector; r: bit_vector) return bit_vector;
	-- function "&" (l: bit_vector; r: bit) return bit_vector;
	-- function "&" (l: bit; r: bit_vector) return bit_vector;
	-- function "&" (l: bit; r: bit) return bit_vector;
	--
	-- function minimum (l, r: bit_vector) return bit_vector;
	-- function maximum (l, r: bit_vector) return bit_vector;
	--
	-- function minimum (l: bit_vector) return bit;
	-- function maximum (l: bit_vector) return bit;
	--
	-- function to_string (value: bit_vector) return string;

	alias to_bstring is to_string [bit_vector return string];
	alias to_binary_string is to_string [bit_vector return string];
	function to_ostring (value: bit_vector) return string;
	alias to_octal_string is to_ostring [bit_vector return string];
	function to_hstring (value: bit_vector) return string;
	alias to_hex_string is to_hstring [bit_vector return string];

	type integer_vector is array (natural range <>) of integer;

	-- The predefined operations for these types are as follows:

	-- function "="  (l, r: integer_vector) return boolean;
	-- function "/=" (l, r: integer_vector) return boolean;
	-- function "<"  (l, r: integer_vector) return boolean;
	-- function "<=" (l, r: integer_vector) return boolean;
	-- function ">"  (l, r: integer_vector) return boolean;
	-- function ">=" (l, r: integer_vector) return boolean;
	--
	-- function "&" (l: integer_vector; r: integer_vector) return integer_vector;
	-- function "&" (l: integer_vector; r: integer) return integer_vector;
	-- function "&" (l: integer; r: integer_vector) return integer_vector;
	-- function "&" (l: integer; r: integer) return integer_vector;
	--
	-- function minimum (l, r: integer_vector) return integer_vector;
	-- function maximum (l, r: integer_vector) return integer_vector;
	--
	-- function minimum (l: integer_vector) return integer;
	-- function maximum (l: integer_vector) return integer;

	type real_vector is array (natural range <>) of real;

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: real_vector) return boolean;
	-- function "/=" (l, r: real_vector) return boolean;
	--
	-- function "&" (l: real_vector; r: real_vector) return real_vector;
	-- function "&" (l: real_vector; r: real) return real_vector;
	-- function "&" (l: real; r: real_vector) return real_vector;
	-- function "&" (l: real; r: real) return real_vector;
	--
	-- function minimum (l: real_vector) return real;
	-- function maximum (l: real_vector) return real;

	type time_vector is array (natural range <>) of time;

	-- The predefined operations for these types are as follows:
	--
	-- function "="  (l, r: time_vector) return boolean;
	-- function "/=" (l, r: time_vector) return boolean;
	--
	-- function "&" (l: time_vector; r: time_vector) return time_vector;
	-- function "&" (l: time_vector; r: time) return time_vector;
	-- function "&" (l: time; r: time_vector) return time_vector;
	-- function "&" (l: time; r: time) return time_vector;
	--
	-- function minimum (l: time_vector) return time;
	-- function maximum (l: time_vector) return time;

	-- The predefined types for opening files:

	type file_open_kind is (
		READ_MODE,                      -- Resulting access mode is read-only.
		WRITE_MODE,                     -- Resulting access mode is write-only.
		APPEND_MODE                     -- Resulting access mode is write-only; information is appended to the end of the existing file.
	);

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: file_open_kind) return boolean;
	-- function "/=" (l, r: file_open_kind) return boolean;
	-- function "<"  (l, r: file_open_kind) return boolean;
	-- function "<=" (l, r: file_open_kind) return boolean;
	-- function ">"  (l, r: file_open_kind) return boolean;
	-- function ">=" (l, r: file_open_kind) return boolean;
	--
	-- function minimum (l, r: file_open_kind) return file_open_kind;
	-- function maximum (l, r: file_open_kind) return file_open_kind;
	--
	-- function to_string (value: file_open_kind) return string;

	type file_open_status is (
		OPEN_OK,                        -- File open was successful.
		STATUS_ERROR,                   -- File object was already open.
		NAME_ERROR,                     -- External file not found or inaccessible.
		MODE_ERROR                      -- Could not open file with requested access mode.
	);

	-- The predefined operations for this type are as follows:

	-- function "="  (l, r: file_open_status) return boolean;
	-- function "/=" (l, r: file_open_status) return boolean;
	-- function "<"  (l, r: file_open_status) return boolean;
	-- function "<=" (l, r: file_open_status) return boolean;
	-- function ">"  (l, r: file_open_status) return boolean;
	-- function ">=" (l, r: file_open_status) return boolean;
	--
	-- function minimum (l, r: file_open_status) return file_open_status;
	-- function maximum (l, r: file_open_status) return file_open_status;
	--
	-- function to_string (value: file_open_status) return string;

	-- the 'foreign attribute:
	attribute foreign : string;

	function to_string (value: time; unit: time) return string;
	function to_string (value: real; digits: natural) return string;
	function to_string (value: real; format: string) return string;

end package standard;
