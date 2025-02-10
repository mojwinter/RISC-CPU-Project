onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_JR/clock
add wave -noupdate /P2_JR/clear
add wave -noupdate /P2_JR/Gra
add wave -noupdate /P2_JR/Grb
add wave -noupdate /P2_JR/Grc
add wave -noupdate /P2_JR/Rin
add wave -noupdate /P2_JR/Rout
add wave -noupdate /P2_JR/BAout
add wave -noupdate /P2_JR/MARin
add wave -noupdate /P2_JR/MDRout
add wave -noupdate /P2_JR/MDRin
add wave -noupdate /P2_JR/memRead
add wave -noupdate /P2_JR/ramEnable
add wave -noupdate /P2_JR/PCin
add wave -noupdate /P2_JR/PCout
add wave -noupdate /P2_JR/ADD
add wave -noupdate /P2_JR/Zin
add wave -noupdate /P2_JR/Zlowout
add wave -noupdate /P2_JR/Yin
add wave -noupdate /P2_JR/IRin
add wave -noupdate /P2_JR/Cout
add wave -noupdate /P2_JR/CONin
add wave -noupdate /P2_JR/CON
add wave -noupdate -radix hexadecimal /P2_JR/InPortData
add wave -noupdate /P2_JR/InPort_Out
add wave -noupdate /P2_JR/present_state
add wave -noupdate -radix hexadecimal /P2_JR/DP/R6/q
add wave -noupdate -radix hexadecimal /P2_JR/DP/R15/q
add wave -noupdate -radix hexadecimal /P2_JR/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_JR/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {47265 ps} 0}
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
