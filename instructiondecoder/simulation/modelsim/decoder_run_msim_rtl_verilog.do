transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/wi199/OneDrive/Documentos/quartus\ tfg/pontecompleta/instructiondecoder {C:/Users/wi199/OneDrive/Documentos/quartus tfg/pontecompleta/instructiondecoder/idecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/wi199/OneDrive/Documentos/quartus\ tfg/pontecompleta/instructiondecoder {C:/Users/wi199/OneDrive/Documentos/quartus tfg/pontecompleta/instructiondecoder/instructionmemory.v}

vlog -vlog01compat -work work +incdir+C:/Users/wi199/OneDrive/Documentos/quartus\ tfg/pontecompleta/instructiondecoder {C:/Users/wi199/OneDrive/Documentos/quartus tfg/pontecompleta/instructiondecoder/decoderTB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  decoderTB

add wave *
view structure
view signals
run -all
