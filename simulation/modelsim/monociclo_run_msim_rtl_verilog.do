transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/include {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/include/lagarto0_pkg.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/decode {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/decode/decoder.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/memory {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/memory/registerfile.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/icache {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/icache/icache.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/fetch {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/fetch/fetch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/iqueue {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/iqueue/iqueue.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo.sv}

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  monociclo_tb

add wave *
view structure
view signals
run -all
