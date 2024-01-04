vcom -2008 generic_components/types_pkg.vhd
vcom -2008 generic_components/*.vhd
vcom -2008 *.vhd
vsim work.backprop_accelerator_top_tb
add wave -group datapath_inst /backprop_accelerator_top_tb/backprop_accelerator_top_inst/datapath_inst/*
run 600 ns
