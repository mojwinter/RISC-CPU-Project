onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_ST/clock
add wave -noupdate /P2_ST/clear
add wave -noupdate /P2_ST/Gra
add wave -noupdate /P2_ST/Grb
add wave -noupdate /P2_ST/Grc
add wave -noupdate /P2_ST/Rin
add wave -noupdate /P2_ST/Rout
add wave -noupdate /P2_ST/BAout
add wave -noupdate /P2_ST/MARin
add wave -noupdate /P2_ST/MDRout
add wave -noupdate /P2_ST/MDRin
add wave -noupdate /P2_ST/memRead
add wave -noupdate /P2_ST/ramEnable
add wave -noupdate /P2_ST/PCout
add wave -noupdate /P2_ST/ADD
add wave -noupdate /P2_ST/Zin
add wave -noupdate /P2_ST/Zlowout
add wave -noupdate /P2_ST/Yin
add wave -noupdate /P2_ST/IRin
add wave -noupdate /P2_ST/Cout
add wave -noupdate -radix hexadecimal /P2_ST/InPortData
add wave -noupdate /P2_ST/InPort_Out
add wave -noupdate /P2_ST/present_state
add wave -noupdate -radix hexadecimal /P2_ST/DP/R1/q
add wave -noupdate -radix hexadecimal /P2_ST/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_ST/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_ST/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_ST/DP/Z/qL
add wave -noupdate -radix hexadecimal /P2_ST/DP/MAR/q
add wave -noupdate -radix hexadecimal /P2_ST/DP/mdr/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {495182 ps} 0}
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {512 ns}
