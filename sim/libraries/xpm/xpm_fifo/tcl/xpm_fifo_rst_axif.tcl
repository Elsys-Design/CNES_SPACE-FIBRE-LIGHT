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

set sclk [get_clocks -quiet -of [get_ports s_aclk]]
set sclk_period  [get_property -quiet -min PERIOD $sclk]

if {$sclk == ""} {
    set sclk_period 10
}
set mclk [get_clocks -quiet -of [get_ports m_aclk]]
set mclk_period  [get_property -quiet -min PERIOD $mclk]

if {$mclk == ""} {
    set mclk_period 10
}
##Write Addr Channel
if {([llength [get_cells -quiet -hierarchical  -regexp .*axi_write_address_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0) && ([llength [ get_cells -hier *src_gray_ff_reg* -quiet]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports s_aclk] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_obj [get_cells -hierarchical  -regexp .*axi_write_address_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}] $sclk_period -datapath_only
}

##Write Data Channel
if {([llength [get_cells -quiet -hierarchical  -regexp .*axi_write_data_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0) && ([llength [ get_cells -hier *src_gray_ff_reg* -quiet]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports s_aclk] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_obj [get_cells -hierarchical  -regexp .*axi_write_data_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}] $sclk_period -datapath_only
}

##Write Response Channel
if {([llength [get_cells -quiet -hierarchical  -regexp .*axi_write_resp_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0) && ([llength [ get_cells -hier *src_gray_ff_reg* -quiet]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports m_aclk] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_obj [get_cells -hierarchical  -regexp .*axi_write_resp_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}] $mclk_period -datapath_only
}

##Read Addr Channel
if {([llength [get_cells -quiet -hierarchical  -regexp .*axi_read_addr_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0) && ([llength [ get_cells -hier *src_gray_ff_reg* -quiet]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports s_aclk] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_obj [get_cells -hierarchical  -regexp .*axi_read_addr_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}] $sclk_period -datapath_only
}

##Read Data Channel
if {([llength [get_cells -quiet -hierarchical  -regexp .*axi_read_data_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram}]] > 0) && ([llength [ get_cells -hier *src_gray_ff_reg* -quiet]] > 0)} {
  set_max_delay -from [filter [all_fanout -from [get_ports m_aclk] -flat -endpoints_only] {IS_LEAF}] -through [get_pins -of_obj [get_cells -hierarchical  -regexp .*axi_read_data_ch.* -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==drom}] -filter {DIRECTION==OUT}] $mclk_period -datapath_only
}



