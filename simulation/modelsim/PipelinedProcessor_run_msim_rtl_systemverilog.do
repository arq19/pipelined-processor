transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/writeback.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/sl2.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/signext.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/regfile.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/processor_arm.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/mux2.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/memory.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/maindec.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/imem.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/flopr.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/fetch.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/execute.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/decode.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/datapath.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/controller.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/aludec.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/alu.sv}
vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/adder.sv}
vcom -2008 -work work {/home/mayco/Documents/arch/projects/PipelinedProcessor/dmem.vhd}

vlog -sv -work work +incdir+/home/mayco/Documents/arch/projects/PipelinedProcessor {/home/mayco/Documents/arch/projects/PipelinedProcessor/processor_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  processor_tb

add wave *
view structure
view signals
run -all
