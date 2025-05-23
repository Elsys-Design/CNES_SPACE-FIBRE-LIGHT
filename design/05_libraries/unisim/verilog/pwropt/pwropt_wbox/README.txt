Notable changes in Cooolgate's models
=====================================

Besides adding some necessary wrapper modules to accommodate bit-blasting, following changes have been made.

1. SRLC16E / SRLC32E

Parameter MAX_ADDR_VAL is added.

Reason: Many times an SRL is used as a smaller shift register compared to its full capacity. The unused flops on the MSB side will be unobservable and Cooolgate should propagate this ODC condition from the unused MSB down to the used MSB - this would require that our topological sort gives the optimal processing order or else multiple ODC iterations would be required. Furthermore, representing these unused flops in Cooolgate's netlist data structure will be a waste of memory. This parameter MAX_ADDR_VAL is introduced and we let MM2Verific decide how many flops each SRL should contain.


2. LUTRAM.v

Use behavioral code or redirect to models with such code.

Reason: It would unnecessarily make Cooolgate's netlist data structure consume more memory to model large RAMs/ROMs by making them composed of multiple smaller RAMs/ROMs. 


3. OBUFT

Use bufif1 instead of bufif0.

Reason: Cooolgate gets the netlist from MM2Verific and in MM_CCT's definition, OBUFT means bufif1. This definition deviates from that in simprims/unisims, but that is just the way it is.


4. KEEPER / PULLUP / PULLDOWN

Leave empty instead.

Reason: The purpose of these elements is mainly electrical, not logical. Ignoring them would not affect design's logical behavior. Adding them to the netlist could confuse Cooolgate.


5. BUFG

Use bufif instead of buf.

Reason: In some cases, a BUFG's input may be used as existing clock enable to some flops. If we model BUFG as a buf, Cooolgate will optimize out buffers from netlist (code = fakeBufferRemoval) and report the net alias on BUFG's output as clock enable. The problem arises on Spartan-6 where there is a constraint to prohibit using BUFG's output to drive non-clock pins. Modelling BUFG as bufif would prevent Cooolgate from removing it and properly maintain separate net aliases. (See also CR550383).


6. RAMB18E1 / RAMB36E1

Start with models in xeclib/unisims and perform followings:

* Inline the tasks with below inline_task.pl (Verific would not recognize arrays as memories with tasks).

* Convert constant wire into localparam. This allows constant propagation to take place statically at compile time and gives significantly smaller netlist for each set of parameters.

* Avoid bit-blasting of memories (use N of 1-bit memories to represent one N-bit memory) by ignoring the write enable mask. Note that this will alter the behavior but the difference should be irrelevant for Cooolgate's purpose (clean_mem.pl below). ALERT: We found a problem with clean_mem.pl script where it also removes the bit-index on the address word, e.g., changing from "memp[addr[14:5]][0:0] = ecc;" to "memp[addr] = ecc;" - the latter uses addr[9:0] rendering addr[14:10] unobserved and this would impact the correctness of Cooolgate analysis. So, we  skip this step.

* Add a wrapper to group address/data buses. 
  * Use gen_wrap.rb below.
  * Add ports missing in the unisim model.

  Alternatively copy the wrapper from previous model. It should work unless the 
model interface has changed.

* Add a dummy bufif on the address bus to separate loads on the outside and inside of the BRAM. This is a workaround for Cooolgate to compute and report ODC_EN on the address bus by considering only the observers from inside the BRAM (and onward). For example, the address bus may be shared among several BRAMs and the ODC_EN of each BRAM should only be derived from ODC on its own output, not all other BRAM's.

* Pass it through vcs -Xman=4 for readability.


7. RAMB16BWER / RAMB8BWER (Spartan6)

These BRAMs' models are quite different from V6's BRAMs. We appied the following steps.

* Started from models under /home/unified/vandanad/formal/onespin/s6ramb.

* Moved the definitions of tasks up-front to make it m4 friendly.

* Eliminated the temporary rising_clk* and directly use clk*_in.

* For RAMB8BWER, fixed a typo error to set rsttype_int to 1 when RSTTYPE == "ASYNC" (as opposed to RSTTYPE == "SYNC").

* Separate the "always" blocks for port A and port B.

* Eliminate the redundant "if (clkawrclk_in)" inside always @(posedge clkawrclk_in)" which creates suboptimal Verific netlist and negatively affects cooolgate analysis.

For actual changes, see "tkdiff RAMB8BWER.v.moved_tasks RAMB8BWER.v.pre_m4".

The rest of the steps are similar to those of RAMB18E1/RAMB36E1.

* Added dummy bufif's for the address buses.
 
* Applied inline_task.pl and gen_wrap.rb.

* Pass it through vcs -Xman=4 for readability.


--Attached code--

inline_task.pl:

Usage:
inline_task.pl /build/sjxfndry/HEAD/rtf/verilog/xeclib/unisims/RAMB18E1.v > R0.v
m4 R0.v > R1.v

R1.v will have all the tasks inlined. Verify that Verific compiles fine with:
cooolgate -writeNetlist 1 -p 0 -odcp 0 -idtp 0 -v2k -top RAMB18E1 R1.v
grep OPERATOR RAMB18E1_netlist.v

#!/usr/bin/perl

$q1 = "{[";
$q2 = "]}";

print "changequote($q1,$q2)\n";

while (<>) {
  if (m/^(\s*)task\s+(\S+);\s*$/) {
    $tab = $1;
    print "${tab}define($2,$q1\n";
    $id = 1;
    while (<>) {
      if (m/^\s*endtask\b/) {
        print "$tab$q2)\n";
        last;
      } elsif (m/\s*(input|inout)\s+(\[\S+\]\s+)?(\S+);\s*$/) {
        $sig = $3;
        $sig_map[$id] = $sig;
        $id++;
      } else {
        my $i;
        for ($i=1; $i<$id; $i++) {
          $_ =~ s/\b$sig_map[$i]\b/\$$i/g;
        }
        print respace_task_call($_);
      }
    }
  } else {
    print respace_task_call($_);
  }
}

sub respace_task_call
{
  my ($x) = @_;
  $x =~ s/(task\S+)\s*(\(.*\))\s*;/$1$2/;
  return $x;
}

------ clean_mem.pl, remove masks on mem writes -----------------
#! /usr/local/bin/perl -w

open(FP, "<$ARGV[0]") or die ("sorry!??\n");
my $count = 0;
my %instN;
while(<FP>){
  my $line = $_;
  chomp($line);
#if ($line =~ m/(^\s*mem[p]?\[\s*[^\[]*).*\=((.)*)/){
    if ($line =~ m/(^\s*mem[p]?\[\s*[^\[]*).*\=([^\[\;]*)/){
# print "got it $count : $line => $1] = $2\n";
      print ("$1] = $2\;\n");
    } else {
      print ("$line\n");
    }
  $count++;
}
close(FP);

-------------- gen_wrap.rb: generate wrapper module -------------
# The usage is:
# gen_wrap.rb <filename.v>
# You need to change the verilog file so that the portlist is in one line like
# module m1(p1, p2, p3, ...)
# in unisims this is broken over multiple lines like:
# module m1(p1, p2,
# p3, p4);


#!/usr/bin/ruby
filename = ARGV[0]
file = File.new(filename)

parameters = []
ports = []
portdir = {}
lindex = {}
rindex = {}
modname = ""
param_lines = []

file.each do |line|
  if /^\s*parameter (\S+) =.*$/.match(line)
    parameters.push($1)
    param_lines.push(line)
  elsif /^\s*parameter (integer )*(\S+) =.*$/.match(line)
    parameters.push($2)
    param_lines.push(line)
  elsif /module (\S+)\s*\((.*)\);/.match(line)
    modname = $1;
    ports = $2.gsub(/\s+/,'').split(',')
  elsif /output \[(\d+):(\d+)\] (\S+);/.match(line)
    l = $1.to_i
    r = $2.to_i
    outports = $3.gsub(/\s+/,'').split(',')
    outports.each do |oport|
      portdir[oport] = "output"
      lindex[oport] = l.to_i > r.to_i ? l.to_i : r.to_i
      rindex[oport] = l.to_i > r.to_i ? r.to_i : l.to_i
    end
  elsif /output (.*);/.match(line)
    outports = $1.gsub(/\s+/,'').split(',')
    outports.each {|oport| portdir[oport] = "output"}
  elsif /input \[(\d+):(\d+)\] (\S+);/.match(line)
    # puts "found input port #{$3} with lindex #{$1} rindex #{$2}"
    l = $1.to_i
    r = $2.to_i
    inports = $3.gsub(/\s+/,'').split(',')
    inports.each do |oport|
      portdir[oport] = "input"
      lindex[oport] = l.to_i > r.to_i ? l.to_i : r.to_i
      rindex[oport] = l.to_i > r.to_i ? r.to_i : l.to_i
    end
  elsif /input (.*);/.match(line)
    inports = $1.gsub(/\s+/,'').split(',')
    inports.each {|oport| portdir[oport] = "input"}
  elsif /endmodule.*/.match(line)
    break
  end
end

if modname == ""
  puts("Did not match the module line, probably your ports are not in one line")
  exit(1)
end

puts "module #{modname} ("
first = true;
portdir.each do |port, dir|
  if (lindex[port] != nil)
    bitnum = lindex[port]
    lindex[port].downto rindex[port] do
      puts(",") unless first
      first = false
      print("#{portdir[port]} #{port}#{bitnum}")
      bitnum -= 1
    end
  else
    puts(",") unless first
    first = false
    print(portdir[port] + " " + port)
  end
end
puts ");"
param_lines.each do |pline|
  puts pline
end

puts (modname + "_INT \#(")
  
first = true
parameters.each do |p|
  puts(", ") unless first
  first = false
  print("." + p + "(" + p + ")")
end

first = true
puts ")" + modname + "_i" + "("
portdir.each do |port, dir|
  puts(", ") unless first
  first = false
  if (lindex[port] != nil)
    print("."+ port + "({")
    bitnum = lindex[port]
    ffirst = true
    lindex[port].downto rindex[port] do
      print(", ") unless ffirst
      ffirst = false
      print("#{port}#{bitnum}")
      bitnum -= 1
    end
    print('})')
  else
    print("."+ port + "(" + port + ")")
  end
end 
puts ");"

puts "endmodule"

--pwropt@xilinx.com
5/14/2010
6/11/2010
7/19/2010
