# the do file for the 4bit full adder using full adders as component

vcom or2.vhd
vcom half_adder.vhd
vcom full_adder.vhd
vcom full_adder_4bit.vhd
vcom fatb.vhd

vsim fatb

add wave *
run 800