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
--   Title     :  Environment package
--             :
--   Library   :  This package shall be compiled into a library
--             :  symbolically named std.
--             :
--   Developers:  IEEE P1076 Working Group
--             :
--   Purpose   :  This packages defines basic tool interface subprograms
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

use work.textio.all;


package env is
  procedure stop (status: integer);
  procedure stop;
  procedure finish (status: integer);
  procedure finish;

  function resolution_limit return delay_length;


  type dayofweek is (
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY, THURSDAY,
    FRIDAY, SATURDAY
  );

  -- Calendar date/time, broken into parts.  Second accomodates both
  -- single and double leap-seconds.  Dayofyear accomodates leap days.
  -- Month 0 is January, 1 is February, 11 is December. Year is absolute
  -- in AD, 1900 represents the year 1900.
  --
  type time_record is record
    microsecond : integer range 0 to 999_999;
    second : integer range 0 to 61;
    minute : integer range 0 to 59;
    hour : integer range 0 to 23;
    day : integer range 1 to 31;
    month : integer range 0 to 11;
    year : integer range 1 to 4095;
    weekday : dayofweek;
    dayofyear : integer range 0 to 365;
  end record time_record;

  -- Current local time broken into parts.
  -- Minimum legal resolution is 1 second.
  impure function localtime return time_record;

  -- Current UTC time broken into parts.
  -- Minimum legal resolution is 1 second.
  impure function gmtime return time_record;

  -- Number of seconds since midnight, Jan 1 1970, UTC.
  -- Minimum legal resolution is 1 second.
  impure function epoch return real;

  -- Time conversion functions from epoch time.
  function localtime(timer: real) return time_record;
  function gmtime(timer: real) return time_record;

  -- Time conversion function from time in parts.
  -- epoch and gmtime accept trec in local time.
  -- localtime accepts trec in UTC.
  function epoch(trec: time_record) return real;
  function localtime(trec: time_record) return time_record;
  function gmtime(trec: time_record) return time_record;

  -- Time increment/decrement.  delta argument is in seconds.
  -- Returned time_record is in local time or UTC per the trec.
  function "+"(trec: time_record; delta: real) return time_record;
  function "+"(delta: real; trec: time_record) return time_record;
  function "-"(trec: time_record; delta: real) return time_record;
  function "-"(delta: real; trec: time_record) return time_record;

  -- Time difference in seconds.  TR1, TR2 must both be in local
  -- time, or both in UTC.
  function "-"(tr1, tr2: time_record) return real;

  -- Conversion between real seconds and VHDL time.  seconds_to_time
  -- will cause an error if the resulting real_val would be less than
  -- time'low or greater than time'high.
  function time_to_seconds(time_val: in time) return real;
  function seconds_to_time(real_val: in real) return time;

  -- Convert time_record to a string in ISO 8601 format.
  -- to_string(x)    => "1973-09-16T01:03:52"
  -- to_string(x, 6) => "1973-09-16T01:03:52.000001"
  function to_string(trec: time_record;
                     frac_digits: integer range 0 to 6 := 0)
                     return string;

  impure function getenv(Name : string) return string;
  impure function getenv(Name : string) return line;


  impure function vhdl_version return string;
  function tool_type    return string;
  function tool_vendor  return string;
  function tool_name    return string;
  function tool_edition return string;
  function tool_version return string;


  type directory_items is access line_vector;
  -- The predefined operations for this type are as follows:
  -- function"=" (anonymous, anonymous: directory_items) return boolean;
  -- function"/=" (anonymous, anonymous: directory_items) return boolean;
  -- procedure deallocate (p: inout directory_items);

  type directory is record
    Name      : line;             -- current directory name; resolved to its canonical form
    Items     : directory_items;  -- list of pointers to directory item names
  end record;
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: directory) return boolean;
  -- function "/="(anonymous, anonymous: directory) return boolean;

  type dir_open_status is (
    STATUS_OK,
    STATUS_NOT_FOUND,
    STATUS_NO_DIRECTORY,
    STATUS_ACCESS_DENIED,
    STATUS_ERROR
  );
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: dir_open_status) return boolean;
  -- function "/="(anonymous, anonymous: dir_open_status) return boolean;
  -- function "<"(anonymous, anonymous: dir_open_status) return boolean;
  -- function "<="(anonymous, anonymous: dir_open_status) return boolean;
  -- function ">"(anonymous, anonymous: dir_open_status) return boolean;
  -- function ">="(anonymous, anonymous: dir_open_status) return boolean;
  -- function minimum (l, r: dir_open_status) return dir_open_status;
  -- function maximum (l, r: dir_open_status) return dir_open_status;

  type dir_create_status is (
    STATUS_OK,
    STATUS_ITEM_EXISTS,
    STATUS_ACCESS_DENIED,
    STATUS_ERROR
  );
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: dir_create_status) return boolean;
  -- function "/="(anonymous, anonymous: dir_create_status) return boolean;
  -- function "<"(anonymous, anonymous: dir_create_status) return boolean;
  -- function "<="(anonymous, anonymous: dir_create_status) return boolean;
  -- function ">"(anonymous, anonymous: dir_create_status) return boolean;
  -- function ">="(anonymous, anonymous: dir_create_status) return boolean;
  -- function minimum (l, r: dir_create_status) return dir_create_status;
  -- function maximum (l, r: dir_create_status) return dir_create_status;

  type dir_delete_status is (
    STATUS_OK,
    STATUS_NO_DIRECTORY,
    STATUS_NOT_EMPTY,
    STATUS_ACCESS_DENIED,
    STATUS_ERROR
  );
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: dir_delete_status) return boolean;
  -- function "/="(anonymous, anonymous: dir_delete_status) return boolean;
  -- function "<"(anonymous, anonymous: dir_delete_status) return boolean;
  -- function "<="(anonymous, anonymous: dir_delete_status) return boolean;
  -- function ">"(anonymous, anonymous: dir_delete_status) return boolean;
  -- function ">="(anonymous, anonymous: dir_delete_status) return boolean;
  -- function minimum (l, r: dir_delete_status) return dir_delete_status;
  -- function maximum (l, r: dir_delete_status) return dir_delete_status;

  type file_delete_status is (
    STATUS_OK,
    STATUS_NO_FILE,
    STATUS_ACCESS_DENIED,
    STATUS_ERROR
  );
  -- The predefined operations for this type are as follows:
  -- function "="(anonymous, anonymous: file_delete_status) return boolean;
  -- function "/="(anonymous, anonymous: file_delete_status) return boolean;
  -- function "<"(anonymous, anonymous: file_delete_status) return boolean;
  -- function "<="(anonymous, anonymous: file_delete_status) return boolean;
  -- function ">"(anonymous, anonymous: file_delete_status) return boolean;
  -- function ">="(anonymous, anonymous: file_delete_status) return boolean;
  -- function minimum (l, r: file_delete_status) return file_delete_status;
  -- function maximum (l, r: file_delete_status) return file_delete_status;

  procedure       dir_open(dir : out directory; path : in string; status : out dir_open_status);
  impure function dir_open(dir : out directory; path : in string) return dir_open_status;
  procedure       dir_close(dir : in directory);

  impure function dir_itemexists(path : in string) return boolean;
  impure function dir_itemisdir(path : in string) return boolean;
  impure function dir_itemisfile(path : in string) return boolean;

  procedure       dir_workingdir(path : in string; status : out dir_open_status);
  impure function dir_workingdir(path : in string) return dir_open_status;
  impure function dir_workingdir return string;

  procedure       dir_createdir(path : in string; status : out dir_create_status);
  procedure       dir_createdir(path : in string; parents : in boolean; status : out dir_create_status);
  impure function dir_createdir(path : in string; parents : in boolean := false) return dir_create_status;
  procedure       dir_deletedir(path : in string; status : out dir_delete_status);
  procedure       dir_deletedir(path : in string; recursive : in boolean; status : out dir_delete_status);
  impure function dir_deletedir(path : in string; recursive : in boolean := false) return dir_delete_status;
  procedure       dir_deletefile(path : in string; status : out file_delete_status);
  impure function dir_deletefile(path : in string) return file_delete_status;

  constant        DIR_SEPARATOR : string;


  type call_path_element is record
    name             : line;
    file_name        : line;
    file_path        : line;
    file_line        : positive;
  end record;
  -- function "="  (anonymous, anonymous: call_path_element) return boolean;
  -- function "/=" (anonymous, anonymous: call_path_element) return boolean;
  impure function to_string (call_path : call_path_element ) return string;

  type call_path_vector is array (natural range <>) of call_path_element;
  -- function "="  (anonymous, anonymous: call_path_vector) return boolean;
  -- function "/=" (anonymous, anonymous: call_path_vector) return boolean;
  impure function to_string (call_path : call_path_vector; Separator : string := "" & lf ) return string;

  type call_path_vector_ptr is access call_path_vector;
  -- function "="  (anonymous, anonymous: call_path_vector_ptr) return boolean;
  -- function "/=" (anonymous, anonymous: call_path_vector_ptr) return boolean;
  -- procedure deallocate (p: inout call_path_vector_ptr);
  impure function to_string (call_path : call_path_vector_ptr; Separator : string := "" & lf ) return string;

  impure function get_call_path return call_path_vector_ptr;

  impure function file_name return line;
  impure function file_name return string;
  impure function file_path return line;
  impure function file_path return string;
  impure function file_line return positive;
  impure function file_line return string;


  -- vhdl assert failed
  impure function isvhdlassertfailed return boolean;
  impure function isvhdlassertfailed (level : severity_level ) return boolean;

  -- vhdl assert count
  impure function getvhdlassertcount return natural;
  impure function getvhdlassertcount (level : severity_level ) return natural;

  --  clear vhdl assert errors
  procedure clearvhdlassert;

  -- assert enable, disable/ignore asserts
  procedure setvhdlassertenable(enable : boolean := true);
  procedure setvhdlassertenable(level : severity_level := note; enable : boolean := true);
  impure function getvhdlassertenable(level : severity_level := note) return boolean;

  --  assert statement formatting
  procedure setvhdlassertformat(level : severity_level; format: string);
  procedure setvhdlassertformat(level : severity_level; format: string; valid : out boolean);
  impure function getvhdlassertformat(level : severity_level) return string;

  --  vhdl read severity
  procedure setvhdlreadseverity(level: severity_level := failure);
  impure function getvhdlreadseverity return severity_level;

  -- psl assert failed
  impure function pslassertfailed return boolean;

  -- psl is covered
  impure function psliscovered return boolean;

  -- psl cover asserts
  procedure setpslcoverassert( enable : boolean := true);
  impure function getpslcoverassert return boolean;

  -- psl is assertcovered
  impure function pslisassertcovered return boolean;

  -- clear psl state (assert and cover)
  procedure clearpslstate;
end package env;
