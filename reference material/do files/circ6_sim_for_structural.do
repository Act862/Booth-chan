# do file for circ6
# compile the components
vcom component#1_and2.vhd
vcom component#2_nor2.vhd
vcom component#3_and2of1not.vhd
vcom component#2_or2.vhd
vcom circ6_structural.vhd

# start simulation
vsim circ6

# add the necessary visuals
add dataflow circ6
add wave *

# preparing the forces
# minterm: 1111
force a '1'
force b '1'
force c '1'
force d '1'
run
# minterm: 0000
force a '0'
force b '0'
force c '0'
force d '0'
run
# minterm: 1000
force a '1'
force b '0'
force c '0'
force d '0'
run
# minterm: 1001
force a '1'
force b '0'
force c '0'
force d '1'
run
# minterm 0010
force a '0'
force b '0'
force c '1'
force d '0'
run