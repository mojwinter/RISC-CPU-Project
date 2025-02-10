onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_LD/clock
add wave -noupdate /P2_LD/clear
add wave -noupdate /P2_LD/Gra
add wave -noupdate /P2_LD/Grb
add wave -noupdate /P2_LD/Grc
add wave -noupdate /P2_LD/Rin
add wave -noupdate /P2_LD/Rout
add wave -noupdate /P2_LD/BAout
add wave -noupdate /P2_LD/MARin
add wave -noupdate /P2_LD/MDRout
add wave -noupdate /P2_LD/MDRin
add wave -noupdate /P2_LD/memRead
add wave -noupdate /P2_LD/ramEnable
add wave -noupdate /P2_LD/ADD
add wave -noupdate /P2_LD/Zin
add wave -noupdate /P2_LD/Zlowout
add wave -noupdate /P2_LD/Yin
add wave -noupdate /P2_LD/IRin
add wave -noupdate /P2_LD/Cout
add wave -noupdate -radix hexadecimal /P2_LD/DP/C_sign_extended
add wave -noupdate -radix hexadecimal /P2_LD/InPortData
add wave -noupdate /P2_LD/InPort_Out
add wave -noupdate -radix hexadecimal /P2_LD/OutPortData
add wave -noupdate /P2_LD/OutPort_In
add wave -noupdate /P2_LD/present_state
add wave -noupdate -radix hexadecimal /P2_LD/DP/MAR/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/mdr/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/R0/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/R2/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_LD/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {92089 ps} 0}
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
WaveRestoreZoom {0 ps} {223744 ps}
