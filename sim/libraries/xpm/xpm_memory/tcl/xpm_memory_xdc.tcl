# (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
#
# This file contains confidential and proprietary information
# of AMD and is protected under U.S. and international copyright
# and other intellectual property laws.
#
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
#
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
############################################################

set clk_a [get_clocks -quiet -of [get_ports clka]]
set clka_period  [get_property -quiet -min PERIOD $clk_a]

if {$clk_a == ""} {
    set clka_period 10
}

set my_var "" 
set my_var [get_property dram_emb_xdc [get_cells -quiet -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}]]
if {[lsort -unique $my_var] == [list {} yes] || [lsort -unique $my_var] == [list yes {}]} {
if {([llength [get_cells -quiet -hier * -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports clka] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_objects [get_cells -hier * -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}]  $clka_period -datapath_only
if {([llength [get_cells -quiet -hier -filter {NAME =~*doutb*reg*}]] > 0)} {
set_max_delay -from [filter [all_fanout -from [get_ports clka] -flat -endpoints_only] {IS_LEAF}] -to [get_cells -hierarchical -filter {NAME =~ *doutb*reg*}]  $clka_period -datapath_only
}
}
}
