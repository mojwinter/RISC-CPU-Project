onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_ORI/clock
add wave -noupdate /P2_ORI/clear
add wave -noupdate /P2_ORI/Gra
add wave -noupdate /P2_ORI/Grb
add wave -noupdate /P2_ORI/Grc
add wave -noupdate /P2_ORI/Rin
add wave -noupdate /P2_ORI/Rout
add wave -noupdate /P2_ORI/BAout
add wave -noupdate /P2_ORI/MARin
add wave -noupdate /P2_ORI/MDRout
add wave -noupdate /P2_ORI/MDRin
add wave -noupdate /P2_ORI/memRead
add wave -noupdate /P2_ORI/ramEnable
add wave -noupdate /P2_ORI/PCout
add wave -noupdate /P2_ORI/ADD
add wave -noupdate /P2_ORI/Zin
add wave -noupdate /P2_ORI/Zlowout
add wave -noupdate /P2_ORI/Yin
add wave -noupdate /P2_ORI/IRin
add wave -noupdate /P2_ORI/Cout
add wave -noupdate -radix hexadecimal /P2_ORI/InPortData
add wave -noupdate /P2_ORI/InPort_Out
add wave -noupdate /P2_ORI/present_state
add wave -noupdate -radix hexadecimal /P2_ORI/DP/R3/q
add wave -noupdate -radix hexadecimal /P2_ORI/DP/R4/q
add wave -noupdate -radix hexadecimal /P2_ORI/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_ORI/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_ORI/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_ORI/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {248763 ps} 0}
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
