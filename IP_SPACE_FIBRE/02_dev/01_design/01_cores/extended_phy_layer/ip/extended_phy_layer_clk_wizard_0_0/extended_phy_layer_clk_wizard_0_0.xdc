# file: extended_phy_layer_clk_wizard_0_0.xdc

# Input clock periods. These duplicate the values entered for the
# input clocks. You can use these to time your system. If required
# commented constraints can be used in the top level xdc 
#----------------------------------------------------------------
# Connect to input port when clock capable pin is selected for input
create_clock -period 6.66667 [get_ports clk_in1]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.1
#
#
set_property PHASESHIFT_MODE LATENCY [get_cells -hierarchical MMCME5*]
