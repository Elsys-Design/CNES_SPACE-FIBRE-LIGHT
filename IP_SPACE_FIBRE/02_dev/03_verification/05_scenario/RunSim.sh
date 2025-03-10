#!/bin/bash
#
# this script set the required ennvironnement for cocotb
# provide the name of the folder to be executed as a parameter
# use "all" to run all tests
#
# Be carefull : The name of the folder as to match the name of the cocotb test inside it

###################################
#set your variable below

#set you absolute path to the root of the project spacefibrelight
export SPACEFIBRELIGHT_ROOT_PATH=/mnt/6ae9ae0d-927d-480b-9d98-fd506029b645/CNES_Project/24-9771-ED_CNES_IP-SPACE-FIBRE

#set your framework location
export FRAMEWORK_COCOTB_INSTALL_PATH=/mnt/6ae9ae0d-927d-480b-9d98-fd506029b645/CNES_Project/cosim_environment

# Select 1 to have to gui loaded (you will have to click run all to start simualtion)
# select 0 to have automatic
export GUI=1

# Select 1 to create the full waveform for the test (questa WLF file)
# select 0 not ot generate the waveforms
export WAVES=1

##additionnal VSIM command  
export EXTRA_VSIM_CMD="-do $SPACEFIBRELIGHT_ROOT_PATH/IP_SPACE_FIBRE/02_dev/03_verification/05_scenario/fast_sim.do"

#############################################

# Check if exactly one parameter is passed
if [ "$#" -ne 1 ]; then
  echo "Error: This script requires exactly one parameter."
  echo "Usage: $0 <MYTEST>"
  echo "          <MYTEST> : Name of the test to be ran |  all : to run all tests"
  exit 1
fi

###################################

# Store the parameter for test to be run
export MYSIM=$1

#update python path 
# Find the directory if this file
if [ -n "${ZSH_VERSION-}" ] ; then
    current_dir="$(dirname "$0")"
else
    current_dir="$(dirname "${BASH_SOURCE[0]}")"
fi
current_dir=$(realpath $current_dir)

#Add models directories and bench directory to python path
export PYTHONPATH=$current_dir:$PYTHONPATH
export PYTHONPATH=$current_dir/../02_benches/configuration_1_bench:$PYTHONPATH
export PYTHONPATH=$current_dir/../02_benches/common:$PYTHONPATH
export PYTHONPATH=$current_dir/../01_models/python_model:$PYTHONPATH
#add framework to pythonpath
source $FRAMEWORK_COCOTB_INSTALL_PATH/cosim_env/bin/activate
export PYTHONPATH=$FRAMEWORK_COCOTB_INSTALL_PATH:$PYTHONPATH
export PYTHONPATH=$FRAMEWORK_COCOTB_INSTALL_PATH/23-9950-ED_INTERNE_DIGITAL-VERIFICATION-PYTHON/src:$PYTHONPATH
#display python path environment for debug purpose
#echo $PYTHONPATH

#handle all request
if [ "$MYSIM" == "all" ]; then
    #list all tests in folder
    for dir in */; do
        #remove / at the end of listed folder
        export MYSIM="${dir::-1}"
        echo "Found test $MYSIM and execute it!"

        cd $MYSIM 
        #clean sim build sometimes cocotb fail to refresh it
        rm -r sim_build
         #run simulation with cocotb
        make -f ../Makefile
    cd ..
    done
    #execute all tests
else
    #execute test in its folder

    ## handle non existence of test
    set -e  # Exit on any command failure
    trap 'echo -e "\n###############\nTest (or folder): $MYSIM doesnt exist! \nExiting.\n###############\n"' ERR
    cd $MYSIM # Will fail and trigger trap if doesn't exist
    
    #clean sim build sometimes cocotb fail to refresh it
    rm -r sim_build

    #run simulation with cocotb
    make -f ../Makefile
    cd ..
fi




