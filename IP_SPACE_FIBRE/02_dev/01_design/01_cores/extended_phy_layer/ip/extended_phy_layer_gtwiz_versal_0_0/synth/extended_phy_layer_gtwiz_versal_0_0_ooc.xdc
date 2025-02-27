
 #################################################################################
 ##
 ## extended_phy_layer_gtwiz_versal_0_0_ooc.xdc 
 ## This xdc is used in Out of Context mode, and currently is just a placeholder
 ##
 #################################################################################

create_clock -period 10.0 [get_ports gtwiz_freerun_clk]

create_clock -period 6.666 [get_ports QUAD0_TX0_usrclk]
create_clock -period 6.666 [get_ports QUAD0_RX0_usrclk]

create_clock -period 10.0 [get_ports QUAD0_GTREFCLK0]

