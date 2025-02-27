################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name QUAD0_GTREFCLK0_0 -period 10 [get_ports QUAD0_GTREFCLK0_0]
create_clock -name QUAD0_RX0_usrclk_0 -period 6.400 [get_ports QUAD0_RX0_usrclk_0]
create_clock -name QUAD0_TX0_usrclk_0 -period 6.400 [get_ports QUAD0_TX0_usrclk_0]
create_clock -name gtwiz_freerun_clk_0 -period 10 [get_ports gtwiz_freerun_clk_0]

################################################################################