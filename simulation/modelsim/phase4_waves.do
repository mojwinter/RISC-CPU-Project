onerror {resume}
quietly virtual function -install /CPU_tb/DP/mdr -env /CPU_tb { &{/CPU_tb/DP/mdr/clear, /CPU_tb/DP/mdr/clock, /CPU_tb/DP/mdr/enable, /CPU_tb/DP/mdr/read, /CPU_tb/DP/mdr/FromBus, /CPU_tb/DP/mdr/FromMemory, /CPU_tb/DP/mdr/BusMuxIn, /CPU_tb/DP/mdr/mDataOut, /CPU_tb/DP/mdr/q }} MDR
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_tb/clock
add wave -noupdate /CPU_tb/DP/clock
add wave -noupdate /CPU_tb/DP/count
add wave -noupdate /CPU_tb/resetButton
add wave -noupdate /CPU_tb/stopButton
add wave -noupdate /CPU_tb/runOut
add wave -noupdate /CPU_tb/switches
add wave -noupdate -radix hexadecimal /CPU_tb/hexDisplays
add wave -noupdate /CPU_tb/DP/run
add wave -noupdate /CPU_tb/DP/reset
add wave -noupdate /CPU_tb/DP/stop
add wave -noupdate /CPU_tb/present_state
add wave -noupdate -radix hexadecimal -childformat {{{/CPU_tb/DP/R0/q[31]} -radix decimal} {{/CPU_tb/DP/R0/q[30]} -radix decimal} {{/CPU_tb/DP/R0/q[29]} -radix decimal} {{/CPU_tb/DP/R0/q[28]} -radix decimal} {{/CPU_tb/DP/R0/q[27]} -radix decimal} {{/CPU_tb/DP/R0/q[26]} -radix decimal} {{/CPU_tb/DP/R0/q[25]} -radix decimal} {{/CPU_tb/DP/R0/q[24]} -radix decimal} {{/CPU_tb/DP/R0/q[23]} -radix decimal} {{/CPU_tb/DP/R0/q[22]} -radix decimal} {{/CPU_tb/DP/R0/q[21]} -radix decimal} {{/CPU_tb/DP/R0/q[20]} -radix decimal} {{/CPU_tb/DP/R0/q[19]} -radix decimal} {{/CPU_tb/DP/R0/q[18]} -radix decimal} {{/CPU_tb/DP/R0/q[17]} -radix decimal} {{/CPU_tb/DP/R0/q[16]} -radix decimal} {{/CPU_tb/DP/R0/q[15]} -radix decimal} {{/CPU_tb/DP/R0/q[14]} -radix decimal} {{/CPU_tb/DP/R0/q[13]} -radix decimal} {{/CPU_tb/DP/R0/q[12]} -radix decimal} {{/CPU_tb/DP/R0/q[11]} -radix decimal} {{/CPU_tb/DP/R0/q[10]} -radix decimal} {{/CPU_tb/DP/R0/q[9]} -radix decimal} {{/CPU_tb/DP/R0/q[8]} -radix decimal} {{/CPU_tb/DP/R0/q[7]} -radix decimal} {{/CPU_tb/DP/R0/q[6]} -radix decimal} {{/CPU_tb/DP/R0/q[5]} -radix decimal} {{/CPU_tb/DP/R0/q[4]} -radix decimal} {{/CPU_tb/DP/R0/q[3]} -radix decimal} {{/CPU_tb/DP/R0/q[2]} -radix decimal} {{/CPU_tb/DP/R0/q[1]} -radix decimal} {{/CPU_tb/DP/R0/q[0]} -radix decimal}} -subitemconfig {{/CPU_tb/DP/R0/q[31]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[30]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[29]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[28]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[27]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[26]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[25]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[24]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[23]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[22]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[21]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[20]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[19]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[18]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[17]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[16]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[15]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[14]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[13]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[12]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[11]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[10]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[9]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[8]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[7]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[6]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[5]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[4]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[3]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[2]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[1]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[0]} {-height 15 -radix decimal}} /CPU_tb/DP/R0/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R1/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R2/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R3/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R4/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R5/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R6/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R7/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R8/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R9/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R10/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R11/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R12/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R13/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R14/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/R15/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/MAR/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/mdr/q
add wave -noupdate -radix decimal /CPU_tb/DP/PC/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/IR/q
add wave -noupdate -radix decimal /CPU_tb/DP/Y/q
add wave -noupdate -radix decimal /CPU_tb/DP/Z/qH
add wave -noupdate -radix decimal /CPU_tb/DP/Z/qL
add wave -noupdate -radix decimal /CPU_tb/DP/HI/q
add wave -noupdate -radix decimal /CPU_tb/DP/LO/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/InPortData
add wave -noupdate -radix hexadecimal /CPU_tb/DP/OutPortOut
add wave -noupdate /CPU_tb/DP/CON
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {4260160 ps}
