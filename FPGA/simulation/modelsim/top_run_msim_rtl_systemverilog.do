transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib SDRAM
vmap SDRAM SDRAM
vlog -sv -work SDRAM +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/SDRAM.v}
vlog -sv -work SDRAM +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules/altera_reset_controller.v}
vlog -sv -work SDRAM +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules/altera_reset_synchronizer.v}
vlog -sv -work SDRAM +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/SDRAM/synthesis/submodules/SDRAM_SDRAM.v}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/VideoFifo.v}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/LedShift.v}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/RowBuf.v}
vlib Pll
vmap Pll Pll
vlog -sv -work Pll +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/pll/synthesis {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/pll/synthesis/Pll.v}
vlog -sv -work Pll +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram/pll/synthesis/submodules {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/pll/synthesis/submodules/Pll_altpll_0.v}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/TLC5955.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/TurnTimer.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/Reset.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/InitLed.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/LedCtrl.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/DVI.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/LED.sv}
vlog -sv -work work +incdir+D:/projects/flicker2/fpga/vidframetest-RPi-sdram {D:/projects/flicker2/fpga/vidframetest-RPi-sdram/top.sv}

