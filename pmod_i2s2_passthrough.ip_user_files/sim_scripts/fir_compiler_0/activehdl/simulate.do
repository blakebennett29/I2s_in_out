transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+fir_compiler_0  -L xpm -L xbip_utils_v3_0_13 -L axi_utils_v2_0_9 -L fir_compiler_v7_2_22 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.fir_compiler_0 xil_defaultlib.glbl

do {fir_compiler_0.udo}

run 1000ns

endsim

quit -force
