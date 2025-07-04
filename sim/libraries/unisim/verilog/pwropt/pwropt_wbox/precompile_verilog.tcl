###########################################################
# Tcl Script to Create vhdl pre-compiled libraries for XST
# in a Verific format.
# modified from ISE Maplib/tasks/base
###########################################################

if {[info exists VERILOG_ROOT]} {
    puts "\$VERILOG_ROOT = $VERILOG_ROOT"
} else {
    puts "Variable 'VERILOG_ROOT' not set. Must be passed into this script"
    exit 1
}
if {[info exists OUTPUT_ROOT]} {
    puts "\$OUTPUT_ROOT = $OUTPUT_ROOT"
} else {
    puts "Variable 'OUTPUT_ROOT' not set. Must be passed into this script"
    exit 1
}

if {[info exists INCLUDE_DIR1]} {
    puts "\$INCLUDE_DIR1 = $INCLUDE_DIR1"
} else {
    puts "Variable 'INCLUDE_DIR1' not set. Must be passed into this script"
    exit 1
}

if {[file exists ${OUTPUT_ROOT}]} {
    if {[file isdirectory ${OUTPUT_ROOT}]} {
        if {! [file writable ${OUTPUT_ROOT}]} {
            puts "Directory ${OUTPUT_ROOT} exists but is not writeable"
            exit 1
        }
    } else {
        puts "File ${OUTPUT_ROOT} exists but is not a directory"
        exit 1
    }
} else {
    puts "Creating dir ${OUTPUT_ROOT}"
    file mkdir ${OUTPUT_ROOT}
}

puts "Precompiling Verilog for ${VERILOG_LIB}"
setveriloglibrarypath -default $OUTPUT_ROOT
analyze -incdir ${INCLUDE_DIR1} -work ${VERILOG_LIB} [glob ${VERILOG_ROOT}/*.v]
save    -work ${VERILOG_LIB} -verilib
cleanup -work ${VERILOG_LIB}
exit
