onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /LedCtrl_tb/clk
add wave -noupdate /LedCtrl_tb/cmdDone
add wave -noupdate /LedCtrl_tb/busy
add wave -noupdate -expand /LedCtrl_tb/SDOs
add wave -noupdate /LedCtrl_tb/LAT
add wave -noupdate /LedCtrl_tb/SCLK
add wave -noupdate /LedCtrl_tb/nReset
add wave -noupdate /LedCtrl_tb/cmdStart
add wave -noupdate -radix hexadecimal /LedCtrl_tb/ledColBuf
add wave -noupdate /LedCtrl_tb/rdaddress
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[3]/data}
add wave -noupdate {/LedCtrl_tb/ledCtrl/ledShift[3]/load}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[2]/data}
add wave -noupdate {/LedCtrl_tb/ledCtrl/ledShift[2]/load}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[1]/data}
add wave -noupdate {/LedCtrl_tb/ledCtrl/ledShift[1]/load}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[0]/data}
add wave -noupdate {/LedCtrl_tb/ledCtrl/ledShift[0]/load}
add wave -noupdate -radix unsigned /LedCtrl_tb/ledCtrl/cnt
add wave -noupdate -radix unsigned /LedCtrl_tb/ledCtrl/shiftCnt
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[3]/LPM_SHIFTREG_component/q}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[2]/LPM_SHIFTREG_component/q}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[1]/LPM_SHIFTREG_component/q}
add wave -noupdate -radix hexadecimal {/LedCtrl_tb/ledCtrl/ledShift[0]/LPM_SHIFTREG_component/q}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {166 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {6720 ps} {7163 ps}
