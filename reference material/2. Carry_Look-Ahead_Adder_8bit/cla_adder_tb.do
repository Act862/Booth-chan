# do file for cla_adder

vcom cla_adder.vhd
vcom cla_adder_tb.vhd

vsim cla_adder_tb
add wave *

run 800
