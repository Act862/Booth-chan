# dec to neg bin test do file

vcom dec_to_negbin.vhd
vcom dec_to_negbin_tb.vhd

vsim dec_to_negbin_tb
add wave *
run 1600