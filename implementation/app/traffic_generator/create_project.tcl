
#check existence of global environnment path SPWF_ROOTPATH
if { [info exists env(SPWF_ROOTPATH)] } {
    #it exists do nothing
    puts "SPWF_ROOTPATH is set by user to $env(SPWF_ROOTPATH)"
} else {
    #set defaut value
    set env(SPWF_ROOTPATH) ../../../
    puts "SPWF_ROOTPATH is NOT set by user switch to default $env(SPWF_ROOTPATH)"
}
#########################################################################
#project parameters
set proj_rootpath $env(SPWF_ROOTPATH)
set proj_name vek280_traffic_gene
set proj_part xcve2802-vsvh1760-2mp-e-s
# be careful many parameters for versal are presets by the xilinx board file
set proj_boardpart xilinx.com:vek280:part0:1.2
set proj_script_path $proj_rootpath/implementation/app/traffic_generator
########################################################################

create_project -force -name vek280_traffic_gene -dir $proj_rootpath/work/$proj_name
set_property part $proj_part [current_project]
set_property target_language vhdl [current_project]
set_property "default_lib" "work" [current_project]

###SET IP repository####
#ip repo is set to main root path to get benefit from spacefibrelight xilinx IP folder
set_property ip_repo_paths $proj_rootpath [current_project]
update_ip_catalog 

####### configure board part #######
#load  board package from cnes local repo
set_param board.repoPaths [list "$proj_rootpath/implementation/board/vek280/xilinxboardstore_vek280_2025.1"]
#verify presence of local board
get_board_parts *vek280*
set obj [current_project]
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "board_part" -value $proj_boardpart -objects $obj

# ---------------------------------------------------------------------
# sources
# ---------------------------------------------------------------------

#TOP implementation/app/traffic_generator/top_vek280.vhd
    set src_files [list \
        "$proj_script_path/top_vek280.vhd"\

    ]
    add_files -norecurse  $src_files
    set_property top "top_vek280" [current_fileset]

#XDC
     set xdc_files [list \
         [list "$proj_script_path/VEK280_master.xdc"                     0 1 ] \
     ]

    # # add file to constraint fileset depending on their use (synthsys or implementation)
     foreach file $xdc_files {
         set file_obj [add_files -norecurse -fileset constrs_1 [lindex $file 0]]
         set_property "used_in_synthesis"      [lindex $file 1] $file_obj
         set_property "used_in_implementation" [lindex $file 2] $file_obj
     }

# ---------------------------------------------------------------------
# Block design
# ---------------------------------------------------------------------
source $proj_script_path/design_1.tcl

close_project