onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /P2_MFHI/clock
add wave -noupdate /P2_MFHI/clear
add wave -noupdate /P2_MFHI/IncPC
add wave -noupdate /P2_MFHI/Gra
add wave -noupdate /P2_MFHI/Grb
add wave -noupdate /P2_MFHI/Grc
add wave -noupdate /P2_MFHI/Rin
add wave -noupdate /P2_MFHI/Rout
add wave -noupdate /P2_MFHI/BAout
add wave -noupdate /P2_MFHI/MARin
add wave -noupdate /P2_MFHI/MDRout
add wave -noupdate /P2_MFHI/MDRin
add wave -noupdate /P2_MFHI/memRead
add wave -noupdate /P2_MFHI/ramEnable
add wave -noupdate /P2_MFHI/PCin
add wave -noupdate /P2_MFHI/PCout
add wave -noupdate /P2_MFHI/ADD
add wave -noupdate /P2_MFHI/Zin
add wave -noupdate /P2_MFHI/Zhighout
add wave -noupdate /P2_MFHI/Zlowout
add wave -noupdate /P2_MFHI/HIin
add wave -noupdate /P2_MFHI/LOin
add wave -noupdate /P2_MFHI/HIout
add wave -noupdate /P2_MFHI/LOout
add wave -noupdate /P2_MFHI/Yin
add wave -noupdate /P2_MFHI/IRin
add wave -noupdate /P2_MFHI/Cout
add wave -noupdate -radix hexadecimal /P2_MFHI/InPortData
add wave -noupdate /P2_MFHI/InPort_Out
add wave -noupdate /P2_MFHI/present_state
add wave -noupdate -radix hexadecimal /P2_MFHI/DP/R6/q
add wave -noupdate -radix hexadecimal /P2_MFHI/DP/HI/q
add wave -noupdate -radix hexadecimal /P2_MFHI/DP/PC/q
add wave -noupdate -radix hexadecimal /P2_MFHI/DP/IR/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {199342 ps} 0}
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
WaveRestoreZoom {71550 ps} {327550 ps}
