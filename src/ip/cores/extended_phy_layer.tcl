
################################################################
# This is a generated script based on design: extended_phy_layer
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2024.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   if { [string compare $scripts_vivado_version $current_vivado_version] > 0 } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2042 -severity "ERROR" " This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Sourcing the script failed since it was created with a future version of Vivado."}

   } else {
     catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   }

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source extended_phy_layer_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xcve2802-vsvh1760-2MP-e-S
   set_property BOARD_PART xilinx.com:vek280:part0:1.2 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name extended_phy_layer

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:gtwiz_versal:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set QUAD0_GT_DEBUG_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:gt_debug_rtl:1.0 QUAD0_GT_DEBUG_0 ]

  set Quad0_CH0_DEBUG_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:gt_channel_debug_rtl:1.0 Quad0_CH0_DEBUG_0 ]

  set Quad0_GT_Serial_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gt_rtl:1.0 Quad0_GT_Serial_0 ]


  # Create ports
  set INTF0_RX_clr_out_0 [ create_bd_port -dir O INTF0_RX_clr_out_0 ]
  set INTF0_RX_clrb_leaf_out_0 [ create_bd_port -dir O INTF0_RX_clrb_leaf_out_0 ]
  set INTF0_TX_clr_out_0 [ create_bd_port -dir O INTF0_TX_clr_out_0 ]
  set INTF0_TX_clrb_leaf_out_0 [ create_bd_port -dir O INTF0_TX_clrb_leaf_out_0 ]
  set INTF0_rst_all_in_0 [ create_bd_port -dir I INTF0_rst_all_in_0 ]
  set INTF0_rst_rx_datapath_in_0 [ create_bd_port -dir I INTF0_rst_rx_datapath_in_0 ]
  set INTF0_rst_rx_done_out_0 [ create_bd_port -dir O INTF0_rst_rx_done_out_0 ]
  set INTF0_rst_rx_pll_and_datapath_in_0 [ create_bd_port -dir I INTF0_rst_rx_pll_and_datapath_in_0 ]
  set INTF0_rst_tx_datapath_in_0 [ create_bd_port -dir I INTF0_rst_tx_datapath_in_0 ]
  set INTF0_rst_tx_done_out_0 [ create_bd_port -dir O INTF0_rst_tx_done_out_0 ]
  set INTF0_rst_tx_pll_and_datapath_in_0 [ create_bd_port -dir I INTF0_rst_tx_pll_and_datapath_in_0 ]
  set QUAD0_GTREFCLK0_0 [ create_bd_port -dir I -type clk QUAD0_GTREFCLK0_0 ]
  set QUAD0_RX0_outclk_0 [ create_bd_port -dir O -type gt_outclk QUAD0_RX0_outclk_0 ]
  set QUAD0_RX0_usrclk_0 [ create_bd_port -dir I -type gt_usrclk QUAD0_RX0_usrclk_0 ]
  set QUAD0_TX0_outclk_0 [ create_bd_port -dir O -type gt_outclk QUAD0_TX0_outclk_0 ]
  set QUAD0_TX0_usrclk_0 [ create_bd_port -dir I -type gt_usrclk QUAD0_TX0_usrclk_0 ]
  set QUAD0_hsclk0_lcplllock_0 [ create_bd_port -dir O QUAD0_hsclk0_lcplllock_0 ]
  set gtpowergood_0 [ create_bd_port -dir O gtpowergood_0 ]
  set gtwiz_freerun_clk_0 [ create_bd_port -dir I -type clk gtwiz_freerun_clk_0 ]
  set INTF0_TX0_ch_txdata [ create_bd_port -dir I -from 127 -to 0 -type data INTF0_TX0_ch_txdata ]
  set INTF0_TX0_ch_txbufstatus_0 [ create_bd_port -dir O -from 1 -to 0 INTF0_TX0_ch_txbufstatus_0 ]
  set INTF0_TX0_ch_txpd_0 [ create_bd_port -dir I -from 1 -to 0 INTF0_TX0_ch_txpd_0 ]
  set INTF0_TX0_ch_txrate_0 [ create_bd_port -dir I -from 7 -to 0 INTF0_TX0_ch_txrate_0 ]
  set INTF0_TX0_ch_txctrl2_0 [ create_bd_port -dir I -from 7 -to 0 INTF0_TX0_ch_txctrl2_0 ]
  set INTF0_TX0_ch_txctrl1_0 [ create_bd_port -dir I -from 15 -to 0 INTF0_TX0_ch_txctrl1_0 ]
  set INTF0_TX0_ch_txctrl0_0 [ create_bd_port -dir I -from 15 -to 0 INTF0_TX0_ch_txctrl0_0 ]
  set INTF0_RX0_ch_rxcdrhold_0 [ create_bd_port -dir I -from 0 -to 0 INTF0_RX0_ch_rxcdrhold_0 ]
  set INTF0_RX0_ch_rxbufstatus_0 [ create_bd_port -dir O -from 2 -to 0 INTF0_RX0_ch_rxbufstatus_0 ]
  set INTF0_RX0_ch_rxcdrovrden_0 [ create_bd_port -dir I -from 0 -to 0 INTF0_RX0_ch_rxcdrovrden_0 ]
  set INTF0_RX0_ch_rxpd_0 [ create_bd_port -dir I -from 1 -to 0 INTF0_RX0_ch_rxpd_0 ]
  set INTF0_RX0_ch_rxdata_0 [ create_bd_port -dir O -from 127 -to 0 INTF0_RX0_ch_rxdata_0 ]
  set INTF0_RX0_ch_rxpolarity_0 [ create_bd_port -dir I -from 0 -to 0 INTF0_RX0_ch_rxpolarity_0 ]
  set INTF0_RX0_ch_rxrate_0 [ create_bd_port -dir I -from 7 -to 0 INTF0_RX0_ch_rxrate_0 ]
  set INTF0_RX0_ch_rxdatavalid_0 [ create_bd_port -dir O -from 1 -to 0 INTF0_RX0_ch_rxdatavalid_0 ]
  set INTF0_RX0_ch_rxcomsasdet_0 [ create_bd_port -dir O -from 0 -to 0 INTF0_RX0_ch_rxcomsasdet_0 ]
  set INTF0_RX0_ch_rxbyteisaligned_0 [ create_bd_port -dir O -from 0 -to 0 INTF0_RX0_ch_rxbyteisaligned_0 ]
  set INTF0_RX0_ch_rxbyterealign_0 [ create_bd_port -dir O -from 0 -to 0 INTF0_RX0_ch_rxbyterealign_0 ]
  set INTF0_RX0_ch_rxctrl0_0 [ create_bd_port -dir O -from 15 -to 0 INTF0_RX0_ch_rxctrl0_0 ]
  set INTF0_RX0_ch_rxctrl1_0 [ create_bd_port -dir O -from 15 -to 0 INTF0_RX0_ch_rxctrl1_0 ]
  set INTF0_RX0_ch_rxctrl2_0 [ create_bd_port -dir O -from 7 -to 0 INTF0_RX0_ch_rxctrl2_0 ]
  set INTF0_RX0_ch_rxctrl3_0 [ create_bd_port -dir O -from 7 -to 0 INTF0_RX0_ch_rxctrl3_0 ]

  # Create instance: gtwiz_versal_0, and set properties
  set gtwiz_versal_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:gtwiz_versal:1.0 gtwiz_versal_0 ]
  set_property -dict [list \
    CONFIG.INTF0_GT_SETTINGS(LR0_SETTINGS) {RX_CB_NUM_SEQ 0 RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_P_ENABLE true RX_DATA_DECODING 8B10B RX_INT_DATA_WIDTH 40 RX_LINE_RATE 6 RX_REFCLK_FREQUENCY\
100 RX_SLIDE_MODE PCS TX_DATA_ENCODING 8B10B TX_INT_DATA_WIDTH 40 TX_LINE_RATE 6 TX_REFCLK_FREQUENCY 100 RX_CC_K_0_0 true RX_CC_LEN_SEQ 4 RX_CC_NUM_SEQ 1 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2\
01111111 RX_CC_VAL_0_3 01111111 RX_COMMA_ALIGN_WORD 4 TX_FRACN_OVRD false RX_CC_PERIODICITY 20000} \
    CONFIG.INTF0_NO_OF_LANES {1} \
    CONFIG.INTF0_PARENTID {undef} \
    CONFIG.INTF_PARENT_PIN_LIST {QUAD0_RX0 {{}} QUAD0_TX0 {{}}} \
    CONFIG.QUAD0_CH0_LOOPBACK_EN {true} \
    CONFIG.QUAD0_HSCLK0_LCPLL_LOCK_EN {true} \
    CONFIG.QUAD0_PROT0_LANES {1} \
    CONFIG.QUAD0_PROT0_RX1_EN {false} \
    CONFIG.QUAD0_PROT0_RX2_EN {false} \
    CONFIG.QUAD0_PROT0_RX3_EN {false} \
    CONFIG.QUAD0_PROT0_TX1_EN {false} \
    CONFIG.QUAD0_PROT0_TX2_EN {false} \
    CONFIG.QUAD0_PROT0_TX3_EN {false} \
    CONFIG.QUAD0_REFCLK_STRING {HSCLK0_LCPLLGTREFCLK0 refclk_PROT0_R0_100_MHz_unique1} \
  ] $gtwiz_versal_0

  set_property -dict [list \
    CONFIG.INTF0_PARENTID.VALUE_MODE {auto} \
    CONFIG.INTF_PARENT_PIN_LIST.VALUE_MODE {auto} \
  ] $gtwiz_versal_0


  # Create interface connections
  connect_bd_intf_net -intf_net QUAD0_GT_DEBUG_0_1 [get_bd_intf_ports QUAD0_GT_DEBUG_0] [get_bd_intf_pins gtwiz_versal_0/QUAD0_GT_DEBUG]
  connect_bd_intf_net -intf_net Quad0_CH0_DEBUG_0_1 [get_bd_intf_ports Quad0_CH0_DEBUG_0] [get_bd_intf_pins gtwiz_versal_0/Quad0_CH0_DEBUG]
  connect_bd_intf_net -intf_net gtwiz_versal_0_Quad0_GT_Serial [get_bd_intf_ports Quad0_GT_Serial_0] [get_bd_intf_pins gtwiz_versal_0/Quad0_GT_Serial]

  # Create port connections
  connect_bd_net -net INTF0_RX0_ch_rxcdrhold_0_1 [get_bd_ports INTF0_RX0_ch_rxcdrhold_0] [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxcdrhold]
  connect_bd_net -net INTF0_RX0_ch_rxcdrovrden_0_1 [get_bd_ports INTF0_RX0_ch_rxcdrovrden_0] [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxcdrovrden]
  connect_bd_net -net INTF0_RX0_ch_rxpd_0_1 [get_bd_ports INTF0_RX0_ch_rxpd_0] [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxpd]
  connect_bd_net -net INTF0_RX0_ch_rxpolarity_0_1 [get_bd_ports INTF0_RX0_ch_rxpolarity_0] [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxpolarity]
  connect_bd_net -net INTF0_RX0_ch_rxrate_0_1 [get_bd_ports INTF0_RX0_ch_rxrate_0] [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxrate]
  connect_bd_net -net INTF0_TX0_ch_txctrl0_0_1 [get_bd_ports INTF0_TX0_ch_txctrl0_0] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txctrl0]
  connect_bd_net -net INTF0_TX0_ch_txctrl1_0_1 [get_bd_ports INTF0_TX0_ch_txctrl1_0] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txctrl1]
  connect_bd_net -net INTF0_TX0_ch_txctrl2_0_1 [get_bd_ports INTF0_TX0_ch_txctrl2_0] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txctrl2]
  connect_bd_net -net INTF0_TX0_ch_txdata_1 [get_bd_ports INTF0_TX0_ch_txdata] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txdata]
  connect_bd_net -net INTF0_TX0_ch_txpd_0_1 [get_bd_ports INTF0_TX0_ch_txpd_0] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txpd]
  connect_bd_net -net INTF0_TX0_ch_txrate_0_1 [get_bd_ports INTF0_TX0_ch_txrate_0] [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txrate]
  connect_bd_net -net INTF0_rst_all_in_0_1 [get_bd_ports INTF0_rst_all_in_0] [get_bd_pins gtwiz_versal_0/INTF0_rst_all_in]
  connect_bd_net -net INTF0_rst_rx_datapath_in_0_1 [get_bd_ports INTF0_rst_rx_datapath_in_0] [get_bd_pins gtwiz_versal_0/INTF0_rst_rx_datapath_in]
  connect_bd_net -net INTF0_rst_rx_pll_and_datapath_in_0_1 [get_bd_ports INTF0_rst_rx_pll_and_datapath_in_0] [get_bd_pins gtwiz_versal_0/INTF0_rst_rx_pll_and_datapath_in]
  connect_bd_net -net INTF0_rst_tx_datapath_in_0_1 [get_bd_ports INTF0_rst_tx_datapath_in_0] [get_bd_pins gtwiz_versal_0/INTF0_rst_tx_datapath_in]
  connect_bd_net -net INTF0_rst_tx_pll_and_datapath_in_0_1 [get_bd_ports INTF0_rst_tx_pll_and_datapath_in_0] [get_bd_pins gtwiz_versal_0/INTF0_rst_tx_pll_and_datapath_in]
  connect_bd_net -net QUAD0_GTREFCLK0_0_1 [get_bd_ports QUAD0_GTREFCLK0_0] [get_bd_pins gtwiz_versal_0/QUAD0_GTREFCLK0]
  connect_bd_net -net QUAD0_RX0_usrclk_0_1 [get_bd_ports QUAD0_RX0_usrclk_0] [get_bd_pins gtwiz_versal_0/QUAD0_RX0_usrclk]
  connect_bd_net -net QUAD0_TX0_usrclk_0_1 [get_bd_ports QUAD0_TX0_usrclk_0] [get_bd_pins gtwiz_versal_0/QUAD0_TX0_usrclk]
  connect_bd_net -net gtwiz_freerun_clk_0_1 [get_bd_ports gtwiz_freerun_clk_0] [get_bd_pins gtwiz_versal_0/gtwiz_freerun_clk]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxbufstatus [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxbufstatus] [get_bd_ports INTF0_RX0_ch_rxbufstatus_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxbyteisaligned [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxbyteisaligned] [get_bd_ports INTF0_RX0_ch_rxbyteisaligned_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxbyterealign [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxbyterealign] [get_bd_ports INTF0_RX0_ch_rxbyterealign_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxcomsasdet [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxcomsasdet] [get_bd_ports INTF0_RX0_ch_rxcomsasdet_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxctrl0 [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxctrl0] [get_bd_ports INTF0_RX0_ch_rxctrl0_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxctrl1 [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxctrl1] [get_bd_ports INTF0_RX0_ch_rxctrl1_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxctrl2 [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxctrl2] [get_bd_ports INTF0_RX0_ch_rxctrl2_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxctrl3 [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxctrl3] [get_bd_ports INTF0_RX0_ch_rxctrl3_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxdata [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxdata] [get_bd_ports INTF0_RX0_ch_rxdata_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX0_ch_rxdatavalid [get_bd_pins gtwiz_versal_0/INTF0_RX0_ch_rxdatavalid] [get_bd_ports INTF0_RX0_ch_rxdatavalid_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX_clr_out [get_bd_pins gtwiz_versal_0/INTF0_RX_clr_out] [get_bd_ports INTF0_RX_clr_out_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_RX_clrb_leaf_out [get_bd_pins gtwiz_versal_0/INTF0_RX_clrb_leaf_out] [get_bd_ports INTF0_RX_clrb_leaf_out_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_TX0_ch_txbufstatus [get_bd_pins gtwiz_versal_0/INTF0_TX0_ch_txbufstatus] [get_bd_ports INTF0_TX0_ch_txbufstatus_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_TX_clr_out [get_bd_pins gtwiz_versal_0/INTF0_TX_clr_out] [get_bd_ports INTF0_TX_clr_out_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_TX_clrb_leaf_out [get_bd_pins gtwiz_versal_0/INTF0_TX_clrb_leaf_out] [get_bd_ports INTF0_TX_clrb_leaf_out_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_rst_rx_done_out [get_bd_pins gtwiz_versal_0/INTF0_rst_rx_done_out] [get_bd_ports INTF0_rst_rx_done_out_0]
  connect_bd_net -net gtwiz_versal_0_INTF0_rst_tx_done_out [get_bd_pins gtwiz_versal_0/INTF0_rst_tx_done_out] [get_bd_ports INTF0_rst_tx_done_out_0]
  connect_bd_net -net gtwiz_versal_0_QUAD0_RX0_outclk [get_bd_pins gtwiz_versal_0/QUAD0_RX0_outclk] [get_bd_ports QUAD0_RX0_outclk_0]
  connect_bd_net -net gtwiz_versal_0_QUAD0_TX0_outclk [get_bd_pins gtwiz_versal_0/QUAD0_TX0_outclk] [get_bd_ports QUAD0_TX0_outclk_0]
  connect_bd_net -net gtwiz_versal_0_QUAD0_hsclk0_lcplllock [get_bd_pins gtwiz_versal_0/QUAD0_hsclk0_lcplllock] [get_bd_ports QUAD0_hsclk0_lcplllock_0]
  connect_bd_net -net gtwiz_versal_0_gtpowergood [get_bd_pins gtwiz_versal_0/gtpowergood] [get_bd_ports gtpowergood_0]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


