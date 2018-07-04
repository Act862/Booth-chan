# the do file for the 4bit adder using half adders as components

vcom or2.vhd
vcom half_adder.vhd
vcom full_adder_4bit_ha.vhd
vcom fahatb.vhd
vsim fahatb

add wave *
run 800