transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/instructiondecoder {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/instructiondecoder/instructionmemory.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/instructiondecoder {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/instructiondecoder/idecoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top/multiplexor.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top/decoder.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top/ahbtop.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top/ahbslave.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/ahb_top/ahbmaster.v}
vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/AHB2AHBtop.v}

vlog -vlog01compat -work work +incdir+C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB {C:/Users/LGdSF/Documents/ELT/TCC_AMBA/Verilogs/AHB2AHB/AHB2AHBtop_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  AHB2AHBtop_TB

add wave *
view structure
view signals
run -all
