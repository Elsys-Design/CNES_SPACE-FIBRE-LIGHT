#check if variable is not set externally
ifeq (, $(SPACEFIBRELIGHT_ROOT_PATH))
    $(error ******* please set SPACEFIBRELIGHT_ROOT_PATH variable ********)
endif

#check if variable is not set externally
ifeq (, $(HARDWARE_TARGET))
    $(error ******* please set HARDWARE_TARGET variable ********)
endif

path_to_root_dir=$(SPACEFIBRELIGHT_ROOT_PATH)

#this make file is for configuration 1
TOPLEVEL_LANG = vhdl

ifeq ("NG_ULTRA", $(HARDWARE_TARGET))
TOPLEVEL = configuration_2_bench_nx
endif
ifeq ("VERSAL", $(HARDWARE_TARGET))
TOPLEVEL = configuration_2_bench
endif

#select module to simulate based on providede variable
export MODULE = "$\
	$(MYSIM),$\
"

export COCOTB_RESOLVE_X = RANDOM

#these parameters are set in RUNSim.sh script
#GUI = 1
#SIM = questa # this parameter is not used as we are running our own Makefile.questa file
#WAVES = 1

#select target for cocotb makefile
# regression :  target only rebuilds if any dependencies have changed 
# sim : unconditionally re-runs the simulator
export TARGET=sim

export RANDOM_SEED = 123456789

#Add VHDL sources
VHDL_SOURCES =  $(path_to_root_dir)/sim/benches/common/pkg_model.vhd
VHDL_SOURCES += $(path_to_root_dir)/src/ip_spacefibre_light_top/reset_gen.vhd
VHDL_SOURCES += $(path_to_root_dir)/src/ip_spacefibre_light_top/spacefibre_light_top.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/lane/resync_double.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/data_link/data_link_analyzer/data_link_analyzer.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/data_link/data_link_configurator/data_link_configurator.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/data_link/data_link_generator/data_link_generator.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/lane/lane_analyzer/lane_analyzer.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/models/lane/lane_generator/lane_generator.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/benches/configuration_2_bench/configuration_2_bench.vhd
VHDL_SOURCES += $(path_to_root_dir)/sim/benches/configuration_2_bench/configuration_2_bench_nx.vhd

SCRIPT_FILE = ../compile_sim_lib.tcl

COCOTB_HDL_TIMEPRECISION = 1fs

ifeq ("NG_ULTRA", $(HARDWARE_TARGET))
COMPILE_ARGS_VLOG = -l questa_compile_verilog_log.dat 
COMPILE_ARGS_VCOM = -explicit -l questa_vhdl_compile_log.dat
SIM_ARGS = -cover -L work -L sim_build/work -L xpm -L unisim -L secureip -L commun -L phy_plus_lane_lib -L phy_plus_lane_64_lib -L interlayer_lib -L data_link_lib -GTARGET="NGULTRA" -l questa_simulation_log.dat -voptargs="+acc" -suppress 14408 -suppress 16154 -do wave.do $(EXTRA_VSIM_CMD) unisim.glbl
endif
ifeq ("VERSAL", $(HARDWARE_TARGET))
COMPILE_ARGS_VLOG = -l questa_compile_verilog_log.dat 
COMPILE_ARGS_VCOM = -explicit -l questa_vhdl_compile_log.dat
SIM_ARGS = -cover -L work -L sim_build/work -L xpm -L unisim -L secureip -L commun -L phy_plus_lane_lib -L phy_plus_lane_64_lib -L interlayer_lib -L data_link_lib -GTARGET="VERSAL" -l questa_simulation_log.dat -voptargs="+acc" -suppress 14408 -suppress 16154 -do wave.do $(EXTRA_VSIM_CMD) unisim.glbl
endif


COCOTB_RESULTS_FILE = $(PWD)/results.xml

## this should be the normal way to address cocotb 
## but we have our own questa makefile to load
#
#         include $(shell cocotb-config --makefiles)/Makefile.sim
#
## adapted from file $(shell cocotb-config --makefiles)/Makefile.sim
# Maintain backwards compatibility by supporting upper and lower case SIM variable
SIM_LOWERCASE := $(shell echo $(SIM) | tr A-Z a-z)

# Directory containing the cocotb Makfiles
COCOTB_MAKEFILES_DIR := $(shell cocotb-config --makefiles)

include $(COCOTB_MAKEFILES_DIR)/Makefile.deprecations

#include our own makefile cocotb
include $(path_to_root_dir)/sim/scenario/Makefile.questa
