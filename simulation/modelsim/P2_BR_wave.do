onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_BR/clock
add wave -noupdate /P2_BR/clear
add wave -noupdate /P2_BR/Gra
add wave -noupdate /P2_BR/Grb
add wave -noupdate /P2_BR/Grc
add wave -noupdate /P2_BR/Rin
add wave -noupdate /P2_BR/Rout
add wave -noupdate /P2_BR/BAout
add wave -noupdate /P2_BR/MARin
add wave -noupdate /P2_BR/MDRout
add wave -noupdate /P2_BR/MDRin
add wave -noupdate /P2_BR/memRead
add wave -noupdate /P2_BR/ramEnable
add wave -noupdate /P2_BR/PCin
add wave -noupdate /P2_BR/PCout
add wave -noupdate /P2_BR/ADD
add wave -noupdate /P2_BR/Zin
add wave -noupdate /P2_BR/Zlowout
add wave -noupdate /P2_BR/Yin
add wave -noupdate /P2_BR/IRin
add wave -noupdate /P2_BR/Cout
add wave -noupdate /P2_BR/CONin
add wave -noupdate /P2_BR/CON
add wave -noupdate -radix hexadecimal /P2_BR/InPortData
add wave -noupdate /P2_BR/InPort_Out
add wave -noupdate /P2_BR/present_state
add wave -noupdate -radix hexadecimal /P2_BR/DP/R5/q
add wave -noupdate -radix hexadecimal /P2_BR/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_BR/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_BR/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_BR/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {103387 ps} 0}
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
WaveRestoreZoom {56800 ps} {312800 ps}
