transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/xfp.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/Synchronizers.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/Reg_8.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/HexDriver.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/Control.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/adder.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/Register_unit.sv}
vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/multiplier.sv}

vlog -sv -work work +incdir+/home/cwu72/Desktop/Lab-5 {/home/cwu72/Desktop/Lab-5/testbemch.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns