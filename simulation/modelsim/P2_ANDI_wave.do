onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_ANDI/clock
add wave -noupdate /P2_ANDI/clear
add wave -noupdate /P2_ANDI/Gra
add wave -noupdate /P2_ANDI/Grb
add wave -noupdate /P2_ANDI/Grc
add wave -noupdate /P2_ANDI/Rin
add wave -noupdate /P2_ANDI/Rout
add wave -noupdate /P2_ANDI/BAout
add wave -noupdate /P2_ANDI/MARin
add wave -noupdate /P2_ANDI/MDRout
add wave -noupdate /P2_ANDI/MDRin
add wave -noupdate /P2_ANDI/memRead
add wave -noupdate /P2_ANDI/ramEnable
add wave -noupdate /P2_ANDI/PCout
add wave -noupdate /P2_ANDI/ADD
add wave -noupdate /P2_ANDI/Zin
add wave -noupdate /P2_ANDI/Zlowout
add wave -noupdate /P2_ANDI/Yin
add wave -noupdate /P2_ANDI/IRin
add wave -noupdate /P2_ANDI/Cout
add wave -noupdate -radix hexadecimal /P2_ANDI/InPortData
add wave -noupdate /P2_ANDI/InPort_Out
add wave -noupdate /P2_ANDI/present_state
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/R3/q
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/R4/q
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/IR/q
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/Y/q
add wave -noupdate -radix hexadecimal /P2_ANDI/DP/Z/qL
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {160587 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 201
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
WaveRestoreZoom {74631 ps} {318719 ps}
