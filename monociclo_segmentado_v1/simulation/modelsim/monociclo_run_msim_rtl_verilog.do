transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/include {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/include/lagarto0_pkg.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/alu_ctrl.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/icache {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/icache/icache.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/fetch {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/fetch/fetch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/memory {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/memory/registerfile.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/iqueue {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/iqueue/iqueue.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/control {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/control/control.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/alu.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/extensions {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/extensions/sign_ext.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/extensions {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/extensions/shift_left.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/extensions {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/alu/extensions/flagdetector.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/dcache.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/segmentado.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/ifid_latch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/idrf_latch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/forwarding.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/muxrs.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/rfex_latch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/exmem_latch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/memwb_latch.sv}
vlog -sv -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/hazard.sv}

vlog -vlog01compat -work work +incdir+C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1 {C:/Users/rodri/Documents/development/Monociclo_V1/monociclo/monociclo_segmentado_v1/monociclo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  monociclo_tb

add wave *
view structure
view signals
run -all
