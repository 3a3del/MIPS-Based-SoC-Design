vlib work
vlog -f src_files.list 
vsim -voptargs=+acc work.MIPS_32_Top_Part 
add wave *
run -all
#quit -sim 