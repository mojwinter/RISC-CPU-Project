onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_JAL/clock
add wave -noupdate /P2_JAL/clear
add wave -noupdate /P2_JAL/IncPC
add wave -noupdate /P2_JAL/R15in
add wave -noupdate /P2_JAL/Gra
add wave -noupdate /P2_JAL/Grb
add wave -noupdate /P2_JAL/Grc
add wave -noupdate /P2_JAL/Rin
add wave -noupdate /P2_JAL/Rout
add wave -noupdate /P2_JAL/BAout
add wave -noupdate /P2_JAL/MARin
add wave -noupdate /P2_JAL/MDRout
add wave -noupdate /P2_JAL/MDRin
add wave -noupdate /P2_JAL/memRead
add wave -noupdate /P2_JAL/ramEnable
add wave -noupdate /P2_JAL/PCin
add wave -noupdate /P2_JAL/PCout
add wave -noupdate /P2_JAL/ADD
add wave -noupdate /P2_JAL/Zin
add wave -noupdate /P2_JAL/Zhighout
add wave -noupdate /P2_JAL/Zlowout
add wave -noupdate /P2_JAL/Yin
add wave -noupdate /P2_JAL/IRin
add wave -noupdate /P2_JAL/Cout
add wave -noupdate /P2_JAL/CONin
add wave -noupdate /P2_JAL/CON
add wave -noupdate -radix hexadecimal /P2_JAL/InPortData
add wave -noupdate /P2_JAL/InPort_Out
add wave -noupdate /P2_JAL/present_state
add wave -noupdate -radix hexadecimal /P2_JAL/DP/R6/q
add wave -noupdate -radix hexadecimal /P2_JAL/DP/R15/q
add wave -noupdate -radix hexadecimal /P2_JAL/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_JAL/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {185894 ps} 0}
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
