# do file for circ7

vcom circ7_dataflow.vhd

vsim circ7

add dataflow circ7
add wave *

# minterm: 00
force a '0'
force b '0'
run

# minterm: 01
force a '0'
force b '1'
run

# minterm: 10
force a '1'
force b '0'
run

# minterm: 11
force a '1'
force b '1'
run
