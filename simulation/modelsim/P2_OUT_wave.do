onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_OUT/clock
add wave -noupdate /P2_OUT/clear
add wave -noupdate /P2_OUT/IncPC
add wave -noupdate /P2_OUT/Gra
add wave -noupdate /P2_OUT/Grb
add wave -noupdate /P2_OUT/Grc
add wave -noupdate /P2_OUT/Rin
add wave -noupdate /P2_OUT/Rout
add wave -noupdate /P2_OUT/BAout
add wave -noupdate /P2_OUT/MARin
add wave -noupdate /P2_OUT/MDRout
add wave -noupdate /P2_OUT/MDRin
add wave -noupdate /P2_OUT/memRead
add wave -noupdate /P2_OUT/ramEnable
add wave -noupdate /P2_OUT/PCin
add wave -noupdate /P2_OUT/PCout
add wave -noupdate /P2_OUT/ADD
add wave -noupdate /P2_OUT/Zin
add wave -noupdate /P2_OUT/Zhighout
add wave -noupdate /P2_OUT/Zlowout
add wave -noupdate /P2_OUT/Yin
add wave -noupdate /P2_OUT/IRin
add wave -noupdate /P2_OUT/Cout
add wave -noupdate -radix hexadecimal /P2_OUT/InPortData
add wave -noupdate /P2_OUT/InPort_Out
add wave -noupdate -radix hexadecimal /P2_OUT/OutPortData
add wave -noupdate /P2_OUT/OutPort_In
add wave -noupdate /P2_OUT/present_state
add wave -noupdate -radix hexadecimal /P2_OUT/DP/R3/q
add wave -noupdate -radix hexadecimal /P2_OUT/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_OUT/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {210770 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {256 ns}
