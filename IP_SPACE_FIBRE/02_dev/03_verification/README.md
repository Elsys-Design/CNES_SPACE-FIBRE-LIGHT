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
- edit `RunSim.sh` to 
    - match your framework installation path 
    - your spacefibrelight IP root dir 
    - select your custom parameters 
- execute `RunSim.sh <NAME_OF_THE_TEST>` with NAME_OF_THE_TEST is equal to the folder name of the test to be ran.
- to execute every test available in every folders use command `RunSim.sh all`


