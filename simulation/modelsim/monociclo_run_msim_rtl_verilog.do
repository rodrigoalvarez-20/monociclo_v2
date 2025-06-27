transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2/execute/alu/fulladder {/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2/execute/alu/fulladder/fulladder.v}
vlog -vlog01compat -work work +incdir+/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2/execute/alu {/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2/execute/alu/alu.v}

vlog -vlog01compat -work work +incdir+/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2 {/home/ralvarez22/Documentos/arquitectura_procesadores/monociclo_v2/monociclo.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  monociclo_tb

add wave *
view structure
view signals
run -all
