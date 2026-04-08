# Input clock pin
set_property PACKAGE_PIN W4 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

# OVERRIDE (critical)
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of_objects [get_pins clk_ibufg_inst/O]]

# reset button
set_property PACKAGE_PIN A18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

# ADC 1
set_property PACKAGE_PIN M3 [get_ports adc1_r_lrclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc1_r_lrclk]
set_property PACKAGE_PIN N3 [get_ports adc1_r_mclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc1_r_mclk]
set_property PACKAGE_PIN L3 [get_ports adc1_r_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc1_r_sclk]
set_property PACKAGE_PIN A16 [get_ports adc1_r_data]
set_property IOSTANDARD LVCMOS33 [get_ports adc1_r_data]

# ADC 2
set_property PACKAGE_PIN K3 [get_ports adc2_r_lrclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc2_r_lrclk]
set_property PACKAGE_PIN P3 [get_ports adc2_r_mclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc2_r_mclk]
set_property PACKAGE_PIN C15 [get_ports adc2_r_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports adc2_r_sclk]
set_property PACKAGE_PIN H1 [get_ports adc2_r_data]
set_property IOSTANDARD LVCMOS33 [get_ports adc2_r_data]

## DAC 1
#set_property PACKAGE_PIN W6 [get_ports dac1_t_lrclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac1_t_lrclk]
#set_property PACKAGE_PIN U8 [get_ports dac1_t_mclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac1_t_mclk]
#set_property PACKAGE_PIN U7 [get_ports dac1_t_sclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac1_t_sclk]
#set_property PACKAGE_PIN U3 [get_ports dac1_t_data]
#set_property IOSTANDARD LVCMOS33 [get_ports dac1_t_data]

# DAC 2
set_property PACKAGE_PIN U2 [get_ports dac2_t_lrclk]
set_property IOSTANDARD LVCMOS33 [get_ports dac2_t_lrclk]
set_property PACKAGE_PIN W7 [get_ports dac2_t_mclk]
set_property IOSTANDARD LVCMOS33 [get_ports dac2_t_mclk]
set_property PACKAGE_PIN U1 [get_ports dac2_t_sclk]
set_property IOSTANDARD LVCMOS33 [get_ports dac2_t_sclk]
set_property PACKAGE_PIN U5 [get_ports dac2_t_data]
set_property IOSTANDARD LVCMOS33 [get_ports dac2_t_data]

## DAC 3
#set_property PACKAGE_PIN V4 [get_ports dac3_t_lrclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac3_t_lrclk]
#set_property PACKAGE_PIN W5 [get_ports dac3_t_mclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac3_t_mclk]
#set_property PACKAGE_PIN V5 [get_ports dac3_t_sclk]
#set_property IOSTANDARD LVCMOS33 [get_ports dac3_t_sclk]
#set_property PACKAGE_PIN U4 [get_ports dac3_t_data]
#set_property IOSTANDARD LVCMOS33 [get_ports dac3_t_data]