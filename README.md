# 24-9771-ED_CNES_IP-SPACE-FIBER

[![Quality Gate Status](https://oss.linty-services.com/api/project_badges/measure?project=spacefibrelight&metric=alert_status&token=sqb_42d11a1bf99de1aeb716f27be17903eb41edbde4)](https://oss.linty-services.com/dashboard?id=spacefibrelight)

# Readme First
This repository includes de Ip called Spacefibrelight. It was developped by Elsys Deign under a CNES R&D program. The main objective of this IP is :
- To provide an optimized (in ressource) implementation of the spacefibre standard (ECSS-E-ST-50-11C – SpaceFibre – Very high-speed serial link )
- To be comptabible with any spacefibre IP even if spacefibrelight IP is not fully compliant with the standard
- To be operational on Xilinx edge versal (tested on VEK280 evalboard ) and also on Nanoxplore NG-Ultra NG-Ultra300 devices.
- To be opensource
- To be addaptable (that is to say, with additionnal development this IP could be fully compliant to ECSS standard)

# Getting started
The simulation environnement is based on cocotb python framework running on Questa simulator. See [cocotb installation](IP_SPACE_FIBRE/02_dev/03_verification/README.md#cocotb) for additionnal information.

This repository use git-lfs (large file storage) to handle large model files for simulation. Please check the presence of every files listed in file `24-9771-ED_CNES_IP-SPACE-FIBRE/.gitattributes` in your repository prior to launch simulation. You will probably need to install [git-lfs](https://git-lfs.com/) prior to clone this repository. if file is not present use `git lfs fetch origin main' command to download them.

## Simulation
To run simulation read [simulation getting started](IP_SPACE_FIBRE/02_dev/03_verification/README.md#running-a-simulation)