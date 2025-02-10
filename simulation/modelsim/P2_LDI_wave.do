onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_LDI/clock
add wave -noupdate /P2_LDI/clear
add wave -noupdate /P2_LDI/Gra
add wave -noupdate /P2_LDI/Grb
add wave -noupdate /P2_LDI/Grc
add wave -noupdate /P2_LDI/Rin
add wave -noupdate /P2_LDI/Rout
add wave -noupdate /P2_LDI/BAout
add wave -noupdate /P2_LDI/MARin
add wave -noupdate /P2_LDI/MDRout
add wave -noupdate /P2_LDI/MDRin
add wave -noupdate /P2_LDI/memRead
add wave -noupdate /P2_LDI/ramEnable
add wave -noupdate /P2_LDI/PCout
add wave -noupdate /P2_LDI/ADD
add wave -noupdate /P2_LDI/Zin
add wave -noupdate /P2_LDI/Zhighout
add wave -noupdate /P2_LDI/Zlowout
add wave -noupdate /P2_LDI/HIin
add wave -noupdate /P2_LDI/LOin
add wave -noupdate /P2_LDI/HIout
add wave -noupdate /P2_LDI/LOout
add wave -noupdate /P2_LDI/Yin
add wave -noupdate /P2_LDI/IRin
add wave -noupdate /P2_LDI/Cout
add wave -noupdate /P2_LDI/CONin
add wave -noupdate -radix hexadecimal /P2_LDI/InPortData
add wave -noupdate /P2_LDI/InPort_Out
add wave -noupdate /P2_LDI/present_state
add wave -noupdate -radix hexadecimal /P2_LDI/DP/R0/q
add wave -noupdate -radix hexadecimal /P2_LDI/DP/R2/q
add wave -noupdate -radix hexadecimal /P2_LDI/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_LDI/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_LDI/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_LDI/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {470274 ps} 0}
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
WaveRestoreZoom {78800 ps} {590800 ps}
