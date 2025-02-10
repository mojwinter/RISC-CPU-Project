onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_ADDI/clock
add wave -noupdate /P2_ADDI/clear
add wave -noupdate /P2_ADDI/Gra
add wave -noupdate /P2_ADDI/Grb
add wave -noupdate /P2_ADDI/Grc
add wave -noupdate /P2_ADDI/Rin
add wave -noupdate /P2_ADDI/Rout
add wave -noupdate /P2_ADDI/BAout
add wave -noupdate /P2_ADDI/MARin
add wave -noupdate /P2_ADDI/MDRout
add wave -noupdate /P2_ADDI/MDRin
add wave -noupdate /P2_ADDI/memRead
add wave -noupdate /P2_ADDI/ramEnable
add wave -noupdate /P2_ADDI/PCout
add wave -noupdate /P2_ADDI/ADD
add wave -noupdate /P2_ADDI/Zin
add wave -noupdate /P2_ADDI/Zlowout
add wave -noupdate /P2_ADDI/Yin
add wave -noupdate /P2_ADDI/IRin
add wave -noupdate /P2_ADDI/Cout
add wave -noupdate -radix hexadecimal /P2_ADDI/InPortData
add wave -noupdate /P2_ADDI/InPort_Out
add wave -noupdate /P2_ADDI/present_state
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/R3/q
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/R4/q
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_ADDI/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {299310 ps} 0}
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
WaveRestoreZoom {171550 ps} {427550 ps}
