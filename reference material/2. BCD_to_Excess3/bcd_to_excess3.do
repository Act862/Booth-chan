vcom first_digit.vhd
vcom second_digit.vhd
vcom third_digit.vhd
vcom fourth_digit.vhd
vcom bcd_to_excess3.vhd
vsim bcd_to_excess3

add wave *

force input "1000"
run

force input "0000"
run

force input "1001"
run