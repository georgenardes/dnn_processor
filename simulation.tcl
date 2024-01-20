vcom -2008 generic_components/types_pkg.vhd
vcom -2008 generic_components/*.vhd
vcom -2008 *.vhd
vsim work.my_dense_tb
add wave -group my_dense_inst /my_dense_tb/my_dense_inst/*
add wave -group their_dense_inst /my_dense_tb/dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s_inst/*
run 600 ns
