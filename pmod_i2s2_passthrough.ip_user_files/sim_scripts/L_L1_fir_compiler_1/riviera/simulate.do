transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+L_L1_fir_compiler_1  -L xpm -L xbip_utils_v3_0_13 -L axi_utils_v2_0_9 -L fir_compiler_v7_2_22 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.L_L1_fir_compiler_1 xil_defaultlib.glbl

do {L_L1_fir_compiler_1.udo}

run 1000ns

endsim

quit -force
