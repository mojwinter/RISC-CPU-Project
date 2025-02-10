onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_MFLO/clock
add wave -noupdate /P2_MFLO/clear
add wave -noupdate /P2_MFLO/IncPC
add wave -noupdate /P2_MFLO/Gra
add wave -noupdate /P2_MFLO/Grb
add wave -noupdate /P2_MFLO/Grc
add wave -noupdate /P2_MFLO/Rin
add wave -noupdate /P2_MFLO/Rout
add wave -noupdate /P2_MFLO/BAout
add wave -noupdate /P2_MFLO/MARin
add wave -noupdate /P2_MFLO/MDRout
add wave -noupdate /P2_MFLO/MDRin
add wave -noupdate /P2_MFLO/memRead
add wave -noupdate /P2_MFLO/ramEnable
add wave -noupdate /P2_MFLO/PCin
add wave -noupdate /P2_MFLO/PCout
add wave -noupdate /P2_MFLO/ADD
add wave -noupdate /P2_MFLO/Zin
add wave -noupdate /P2_MFLO/Zhighout
add wave -noupdate /P2_MFLO/Zlowout
add wave -noupdate /P2_MFLO/HIin
add wave -noupdate /P2_MFLO/LOin
add wave -noupdate /P2_MFLO/HIout
add wave -noupdate /P2_MFLO/LOout
add wave -noupdate /P2_MFLO/Yin
add wave -noupdate /P2_MFLO/IRin
add wave -noupdate /P2_MFLO/Cout
add wave -noupdate -radix hexadecimal /P2_MFLO/InPortData
add wave -noupdate /P2_MFLO/InPort_Out
add wave -noupdate /P2_MFLO/present_state
add wave -noupdate -radix hexadecimal /P2_MFLO/DP/R7/q
add wave -noupdate -radix hexadecimal /P2_MFLO/DP/LO/q
add wave -noupdate -radix hexadecimal /P2_MFLO/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_MFLO/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199915 ps} 0}
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
