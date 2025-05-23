# Environnement

The test were run on a:
- Ubuntu 20.04.6 LTS environnement
- python 3.10
- Questa Intel Starter FPGA Edition-64 2023.2 and Questa 2024.3
- cocotb 1.9.2

## Cocotb 

### prerequisite
- python >3.8 
- questa simulator installed and referenced in the path environnement

### installation
- install cocotb 1.9.2 with command `pip install cocotb`
- install cocotb axi driver with command `pip install cocotbext-axi`
you can check the installation of cocotb the command `cocotb-config --version` which will return `1.9.2`
- install cocotb framework from location **!!URL OF COCOTB FRAMEWORK TO BE ADDED!!** 

## Questa
The simulator Questa Intel Starter FPGA Edition-64 2023.2 is used for the test (you can use any questa simulator).
It can be download at the following address:

https://www.intel.com/content/www/us/en/software-kit/790078/questa-intel-fpgas-pro-edition-software-version-23-3.html

The Questa binaries should be added to the environnement variable PATH before running the tests with command `export PATH=<Questa_install_path>/questa_fse/bin:$PATH`

# Running a simulation
- go into `IP_SPACE_FIBRE/02_dev/03_verification/05_scenario/` 
- configure your environnement for runningthe simulation. To do so you have to set at least 3 variables:
    - SPACEFIBRELIGHT_ROOT_PATH : the main absolute path location of your spacefibre cloned project (the one with .git folder)
    - FRAMEWORK_COCOTB_INSTALL_PATH : the absolute path location for your cocotb_framework cloned project (the one with .git folder)
    - GUI : set the variable to 1 to launch questa GUI or simply write 0 to directly run the simulaiton without GUI.

   To do so you can execute in a terminal (or add them to you .bashrc)
   ```
   #set you absolute path to the root of the project spacefibrelight
        export SPACEFIBRELIGHT_ROOT_PATH=<ABSOLUTE/PATH/>24-9771-ED_CNES_IP-SPACE-FIBRE

        #set your framework location
        export FRAMEWORK_COCOTB_INSTALL_PATH==<ABSOLUTE/PATH/>24-9771-ed-cnes_test-cocotb-framework

        # Select 1 to have to gui loaded (you will have to click run all to start simualtion)
        # select 0 to have automatic
        export GUI=0
   ```
- edit `RunSim.sh` to 
    - match your framework installation path 
    - your spacefibrelight IP root dir 
    - select your custom parameters 
- execute `RunSim.sh <NAME_OF_THE_TEST>` with NAME_OF_THE_TEST is equal to the folder name of the test to be ran.
- to execute every test available in every folders use command `RunSim.sh all`


# Configuration

The `Runme.sh' script as several configuration variables:

- `SPACEFIBRELIGHT_ROOT_PATH`:absolute path to the root of the project spacefibrelight
- `FRAMEWORK_COCOTB_INSTALL_PATH`: absolute path to the root of the project cocotb framework 
- `GUI` :
    -Select `1` to have to gui loaded (you will have to click run all to start simulation)
    -Select `0` to have automatic
- `WAVES`
    - Select `1` to create the full waveform for the test (questa WLF file)
    - select `0` not ot generate the waveforms

- `EXTRA_VSIM_CMD` : you can set addition vsim command with this variable

For convenience , you can create a file called `IP_SPACE_FIBRE/02_dev/03_verification/05_scenario/environnement`.
This file will include all paramaters and will be sourced prior to launch simulation.
Here is an example of the content of the file (this file won't be part of the repository as this configuration is custom for each developper):
```

#set you absolute path to the root of the project spacefibrelight
export SPACEFIBRELIGHT_ROOT_PATH=/home/user/document/24-9771-ED_CNES_IP-SPACE-FIBRE

#set your framework location
export FRAMEWORK_COCOTB_INSTALL_PATH=/home/user/document/24-9771-ed-cnes_test-cocotb-framework

# Select 1 to have to gui loaded (you will have to click run all to start simualtion)
# select 0 to have automatic
export GUI=0

# Select 1 to create the full waveform for the test (questa WLF file)
# select 0 not ot generate the waveforms
export WAVES=0

##additionnal VSIM command  
export EXTRA_VSIM_CMD="-do $SPACEFIBRELIGHT_ROOT_PATH/IP_SPACE_FIBRE/02_dev/03_verification/05_scenario/custom.do"
```