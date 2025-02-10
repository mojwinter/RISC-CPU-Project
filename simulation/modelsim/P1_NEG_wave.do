onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P1_NEG_tb/clock
add wave -noupdate /P1_NEG_tb/clear
add wave -noupdate /P1_NEG_tb/IncPC
add wave -noupdate /P1_NEG_tb/R6out
add wave -noupdate /P1_NEG_tb/R7out
add wave -noupdate /P1_NEG_tb/R6in
add wave -noupdate /P1_NEG_tb/R7in
add wave -noupdate /P1_NEG_tb/MARin
add wave -noupdate /P1_NEG_tb/MDRout
add wave -noupdate /P1_NEG_tb/MDRin
add wave -noupdate /P1_NEG_tb/memRead
add wave -noupdate -radix hexadecimal /P1_NEG_tb/mDataIn
add wave -noupdate /P1_NEG_tb/PCout
add wave -noupdate /P1_NEG_tb/Zin
add wave -noupdate /P1_NEG_tb/Zhighout
add wave -noupdate /P1_NEG_tb/Zlowout
add wave -noupdate /P1_NEG_tb/HIin
add wave -noupdate /P1_NEG_tb/LOin
add wave -noupdate /P1_NEG_tb/HIout
add wave -noupdate /P1_NEG_tb/LOout
add wave -noupdate /P1_NEG_tb/Yin
add wave -noupdate /P1_NEG_tb/IRin
add wave -noupdate /P1_NEG_tb/present_state
add wave -noupdate -radix decimal /P1_NEG_tb/DP/R6/q
add wave -noupdate -radix decimal /P1_NEG_tb/DP/R7/q
add wave -noupdate -radix decimal /P1_NEG_tb/DP/PC/q
add wave -noupdate -radix hexadecimal /P1_NEG_tb/DP/IR/q
add wave -noupdate -radix decimal /P1_NEG_tb/DP/Y/q
add wave -noupdate -radix decimal /P1_NEG_tb/DP/Z/qH
add wave -noupdate -radix decimal /P1_NEG_tb/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {156639 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 188
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
WaveRestoreZoom {0 ps} {266260 ps}
