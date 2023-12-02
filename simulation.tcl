vcom -2008 types_pkg.vhd
vcom -2008 *.vhd
vsim work.backprop_accelerator_top_tb
add wave -group memory_bank /backprop_accelerator_top_tb/backprop_accelerator_top_inst/memory_bank_inst/*
add wave -group memory_indexer_inst /backprop_accelerator_top_tb/backprop_accelerator_top_inst/memory_indexer_inst/*
add wave -group datapath_inst /backprop_accelerator_top_tb/backprop_accelerator_top_inst/datapath_inst/*
add wave -group controler_inst /backprop_accelerator_top_tb/backprop_accelerator_top_inst/controler_inst/*
run 600 ns
