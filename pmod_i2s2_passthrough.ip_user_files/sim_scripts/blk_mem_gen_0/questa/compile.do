vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv \
"E:/School/3610_digital_systems/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"E:/School/3610_digital_systems/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../pmod_i2s2_passthrough.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.vhdl" \


vlog -work xil_defaultlib \
"glbl.v"

