transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {AHB2AHBtop.vo}

vlog -vlog01compat -work work +incdir+C:/Users/wi199/OneDrive/Documentos/quartus\ tfg/AHB2AHB {C:/Users/wi199/OneDrive/Documentos/quartus tfg/AHB2AHB/AHB2AHBtop_TB.v}

vsim -t 1ps -L altera_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L gate_work -L work -voptargs="+acc"  AHB2AHBtop_TB

add wave *
view structure
view signals
run -all
