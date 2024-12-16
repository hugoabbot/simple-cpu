vcom -2008 -work work {C:/Users/hugoabbot/Desktop/LA9/eeprom_memory.vhd}
vcom -2008 -work work {C:/Users/hugoabbot/Desktop/LA9/clock_reset_generation.vhd}
vcom -2008 -work work {C:/Users/hugoabbot/Desktop/LA9/simple_cpu_testbench.vhd}

vsim simple_cpu_testbench

add wave -position insertpoint sim:/simple_cpu_testbench/address_bus
add wave -position insertpoint sim:/simple_cpu_testbench/data_bus
add wave -position insertpoint sim:/simple_cpu_testbench/clock
add wave -position insertpoint sim:/simple_cpu_testbench/r
add wave -position insertpoint sim:/simple_cpu_testbench/w
add wave -radix dec -position insertpoint sim:/simple_cpu_testbench/b2v_memory_0/memory_contents

run 100000ns