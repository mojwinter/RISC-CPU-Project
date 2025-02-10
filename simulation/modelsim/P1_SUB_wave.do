onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P1_SUB_tb/clock
add wave -noupdate /P1_SUB_tb/clear
add wave -noupdate /P1_SUB_tb/IncPC
add wave -noupdate /P1_SUB_tb/R1out
add wave -noupdate /P1_SUB_tb/R2out
add wave -noupdate /P1_SUB_tb/R3out
add wave -noupdate /P1_SUB_tb/R1in
add wave -noupdate /P1_SUB_tb/R2in
add wave -noupdate /P1_SUB_tb/R3in
add wave -noupdate /P1_SUB_tb/MARin
add wave -noupdate /P1_SUB_tb/MDRout
add wave -noupdate /P1_SUB_tb/MDRin
add wave -noupdate /P1_SUB_tb/memRead
add wave -noupdate -radix hexadecimal /P1_SUB_tb/mDataIn
add wave -noupdate /P1_SUB_tb/PCout
add wave -noupdate /P1_SUB_tb/Zin
add wave -noupdate /P1_SUB_tb/Zhighout
add wave -noupdate /P1_SUB_tb/Zlowout
add wave -noupdate /P1_SUB_tb/HIin
add wave -noupdate /P1_SUB_tb/LOin
add wave -noupdate /P1_SUB_tb/HIout
add wave -noupdate /P1_SUB_tb/LOout
add wave -noupdate /P1_SUB_tb/Yin
add wave -noupdate /P1_SUB_tb/IRin
add wave -noupdate /P1_SUB_tb/present_state
add wave -noupdate -radix decimal /P1_SUB_tb/DP/R1/q
add wave -noupdate -radix decimal /P1_SUB_tb/DP/R2/q
add wave -noupdate -radix decimal /P1_SUB_tb/DP/R3/q
add wave -noupdate -radix decimal /P1_SUB_tb/DP/PC/q
add wave -noupdate -radix hexadecimal /P1_SUB_tb/DP/IR/q
add wave -noupdate -radix decimal /P1_SUB_tb/DP/Y/q
add wave -noupdate -radix decimal /P1_SUB_tb/DP/Z/qH
add wave -noupdate -radix decimal /P1_SUB_tb/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 248
configure wave -valuecolwidth 78
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
WaveRestoreZoom {0 ps} {256389 ps}
