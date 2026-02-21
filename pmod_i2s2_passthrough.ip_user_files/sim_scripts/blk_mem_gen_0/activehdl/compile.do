transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 -l xpm -l xil_defaultlib \
"E:/School/3610_digital_systems/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"E:/School/3610_digital_systems/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../pmod_i2s2_passthrough.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.vhdl" \


vlog -work xil_defaultlib \
"glbl.v"

