onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/LAT
add wave -noupdate /top/SCLK
add wave -noupdate /top/SDO
add wave -noupdate /top/nReset
add wave -noupdate /top/spiClk
add wave -noupdate -radix unsigned /top/led/i_state
add wave -noupdate -radix unsigned /top/led/cnt
add wave -noupdate -radix hexadecimal /top/led/data
add wave -noupdate -radix unsigned /top/led/len
add wave -noupdate /top/led/done
add wave -noupdate /top/led/start
add wave -noupdate -radix unsigned /top/led/tlc5955/txLen
add wave -noupdate -radix unsigned /top/led/tlc5955/m_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 168
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
WaveRestoreZoom {96 ps} {584 ps}
