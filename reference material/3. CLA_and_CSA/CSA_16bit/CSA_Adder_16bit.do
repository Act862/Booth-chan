# CS ADDER DO FILE
vcom mux2_to_1.vhd
vcom cla_adder_4bit.vhd
vcom and4.vhd
vcom CSA_Adder_4bit.vhd
vcom CSA_Adder_16bit.vhd

vsim CSA_16bit
add wave *
force a "1111111111111111"
force b "0000000000000001"
force cin '0'
run 100
