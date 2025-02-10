onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_IN/clock
add wave -noupdate /P2_IN/clear
add wave -noupdate /P2_IN/IncPC
add wave -noupdate /P2_IN/Gra
add wave -noupdate /P2_IN/Grb
add wave -noupdate /P2_IN/Grc
add wave -noupdate /P2_IN/Rin
add wave -noupdate /P2_IN/Rout
add wave -noupdate /P2_IN/BAout
add wave -noupdate /P2_IN/MARin
add wave -noupdate /P2_IN/MDRout
add wave -noupdate /P2_IN/MDRin
add wave -noupdate /P2_IN/memRead
add wave -noupdate /P2_IN/ramEnable
add wave -noupdate /P2_IN/PCin
add wave -noupdate /P2_IN/PCout
add wave -noupdate /P2_IN/ADD
add wave -noupdate /P2_IN/Zin
add wave -noupdate /P2_IN/Zhighout
add wave -noupdate /P2_IN/Zlowout
add wave -noupdate /P2_IN/HIin
add wave -noupdate /P2_IN/LOin
add wave -noupdate /P2_IN/HIout
add wave -noupdate /P2_IN/LOout
add wave -noupdate /P2_IN/Yin
add wave -noupdate /P2_IN/IRin
add wave -noupdate /P2_IN/Cout
add wave -noupdate /P2_IN/CONin
add wave -noupdate /P2_IN/CON
add wave -noupdate -radix hexadecimal /P2_IN/InPortData
add wave -noupdate /P2_IN/InPort_Out
add wave -noupdate /P2_IN/present_state
add wave -noupdate -radix hexadecimal /P2_IN/DP/R4/q
add wave -noupdate -radix hexadecimal /P2_IN/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_IN/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {208283 ps} 0}
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
