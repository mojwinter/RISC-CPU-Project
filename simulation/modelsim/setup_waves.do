onerror {resume}
quietly virtual function -install /CPU_tb -env /CPU_tb { &{/CPU_tb/R1out, /CPU_tb/R2out, /CPU_tb/R3out, /CPU_tb/R4out, /CPU_tb/R5out, /CPU_tb/R6out, /CPU_tb/R7out, /CPU_tb/R8out, /CPU_tb/R9out, /CPU_tb/R10out, /CPU_tb/R11out, /CPU_tb/R12out, /CPU_tb/R13out, /CPU_tb/R14out, /CPU_tb/R15out }} Register_out
quietly virtual function -install /CPU_tb -env /CPU_tb { &{/CPU_tb/R0out, /CPU_tb/R1out, /CPU_tb/R2out, /CPU_tb/R3out, /CPU_tb/R4out, /CPU_tb/R5out, /CPU_tb/R6out, /CPU_tb/R7out, /CPU_tb/R8out, /CPU_tb/R9out, /CPU_tb/R10out, /CPU_tb/R11out, /CPU_tb/R12out, /CPU_tb/R13out, /CPU_tb/R14out, /CPU_tb/R15out }} R_out
quietly virtual function -install /CPU_tb -env /CPU_tb { &{/CPU_tb/R0in, /CPU_tb/R1in, /CPU_tb/R2in, /CPU_tb/R3in, /CPU_tb/R4in, /CPU_tb/R5in, /CPU_tb/R6in, /CPU_tb/R7in, /CPU_tb/R8in, /CPU_tb/R9in, /CPU_tb/R10in, /CPU_tb/R11in, /CPU_tb/R12in, /CPU_tb/R13in, /CPU_tb/R14in, /CPU_tb/R15in }} R_in
quietly virtual function -install /CPU_tb/DP/mdr -env /CPU_tb { &{/CPU_tb/DP/mdr/clear, /CPU_tb/DP/mdr/clock, /CPU_tb/DP/mdr/enable, /CPU_tb/DP/mdr/read, /CPU_tb/DP/mdr/FromBus, /CPU_tb/DP/mdr/FromMemory, /CPU_tb/DP/mdr/BusMuxIn, /CPU_tb/DP/mdr/mDataOut, /CPU_tb/DP/mdr/q }} MDR
quietly virtual signal -install /CPU_tb/DP { (context /CPU_tb/DP )&{R15sig , R14sig , R13sig , R12sig , R11sig , R10sig , R9sig , R8sig , R7sig , R6sig , R5sig , R4sig , R3sig , R2sig , R1sig , R0sig }} RegIn
quietly virtual signal -install /CPU_tb/DP { (context /CPU_tb/DP )&{R15sel , R14sel , R13sel , R12sel , R11sel , R10sel , R9sel , R8sel , R7sel , R6sel , R5sel , R4sel , R3sel , R2sel , R1sel , R0sel }} RegOut
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_tb/clock
add wave -noupdate /CPU_tb/clear
add wave -noupdate /CPU_tb/DP/selEncoder/Gra
add wave -noupdate /CPU_tb/DP/selEncoder/Grb
add wave -noupdate /CPU_tb/DP/selEncoder/Grc
add wave -noupdate /CPU_tb/DP/selEncoder/Rin
add wave -noupdate /CPU_tb/DP/selEncoder/Rout
add wave -noupdate /CPU_tb/DP/selEncoder/BAout
add wave -noupdate /CPU_tb/DP/selEncoder/R0out
add wave -noupdate /CPU_tb/DP/selEncoder/R1out
add wave -noupdate /CPU_tb/DP/selEncoder/R2out
add wave -noupdate /CPU_tb/DP/selEncoder/R3out
add wave -noupdate /CPU_tb/DP/selEncoder/R4out
add wave -noupdate /CPU_tb/DP/selEncoder/R0in
add wave -noupdate /CPU_tb/DP/selEncoder/R1in
add wave -noupdate /CPU_tb/DP/selEncoder/R2in
add wave -noupdate /CPU_tb/DP/selEncoder/R3in
add wave -noupdate /CPU_tb/DP/selEncoder/R4in
add wave -noupdate -radix hexadecimal /CPU_tb/DP/RegIn
add wave -noupdate -radix hexadecimal /CPU_tb/DP/RegOut
add wave -noupdate /CPU_tb/MDRout
add wave -noupdate /CPU_tb/MDRin
add wave -noupdate /CPU_tb/memRead
add wave -noupdate /CPU_tb/Zin
add wave -noupdate /CPU_tb/Zhighout
add wave -noupdate /CPU_tb/Zlowout
add wave -noupdate /CPU_tb/HIin
add wave -noupdate /CPU_tb/LOin
add wave -noupdate /CPU_tb/HIout
add wave -noupdate /CPU_tb/LOout
add wave -noupdate /CPU_tb/Yin
add wave -noupdate /CPU_tb/present_state
add wave -noupdate -radix decimal -childformat {{{/CPU_tb/DP/R0/q[31]} -radix decimal} {{/CPU_tb/DP/R0/q[30]} -radix decimal} {{/CPU_tb/DP/R0/q[29]} -radix decimal} {{/CPU_tb/DP/R0/q[28]} -radix decimal} {{/CPU_tb/DP/R0/q[27]} -radix decimal} {{/CPU_tb/DP/R0/q[26]} -radix decimal} {{/CPU_tb/DP/R0/q[25]} -radix decimal} {{/CPU_tb/DP/R0/q[24]} -radix decimal} {{/CPU_tb/DP/R0/q[23]} -radix decimal} {{/CPU_tb/DP/R0/q[22]} -radix decimal} {{/CPU_tb/DP/R0/q[21]} -radix decimal} {{/CPU_tb/DP/R0/q[20]} -radix decimal} {{/CPU_tb/DP/R0/q[19]} -radix decimal} {{/CPU_tb/DP/R0/q[18]} -radix decimal} {{/CPU_tb/DP/R0/q[17]} -radix decimal} {{/CPU_tb/DP/R0/q[16]} -radix decimal} {{/CPU_tb/DP/R0/q[15]} -radix decimal} {{/CPU_tb/DP/R0/q[14]} -radix decimal} {{/CPU_tb/DP/R0/q[13]} -radix decimal} {{/CPU_tb/DP/R0/q[12]} -radix decimal} {{/CPU_tb/DP/R0/q[11]} -radix decimal} {{/CPU_tb/DP/R0/q[10]} -radix decimal} {{/CPU_tb/DP/R0/q[9]} -radix decimal} {{/CPU_tb/DP/R0/q[8]} -radix decimal} {{/CPU_tb/DP/R0/q[7]} -radix decimal} {{/CPU_tb/DP/R0/q[6]} -radix decimal} {{/CPU_tb/DP/R0/q[5]} -radix decimal} {{/CPU_tb/DP/R0/q[4]} -radix decimal} {{/CPU_tb/DP/R0/q[3]} -radix decimal} {{/CPU_tb/DP/R0/q[2]} -radix decimal} {{/CPU_tb/DP/R0/q[1]} -radix decimal} {{/CPU_tb/DP/R0/q[0]} -radix decimal}} -subitemconfig {{/CPU_tb/DP/R0/q[31]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[30]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[29]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[28]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[27]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[26]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[25]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[24]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[23]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[22]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[21]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[20]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[19]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[18]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[17]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[16]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[15]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[14]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[13]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[12]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[11]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[10]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[9]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[8]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[7]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[6]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[5]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[4]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[3]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[2]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[1]} {-height 15 -radix decimal} {/CPU_tb/DP/R0/q[0]} {-height 15 -radix decimal}} /CPU_tb/DP/R0/q
add wave -noupdate -radix decimal /CPU_tb/DP/R1/q
add wave -noupdate -radix decimal /CPU_tb/DP/R2/q
add wave -noupdate -radix decimal /CPU_tb/DP/R3/q
add wave -noupdate -radix decimal /CPU_tb/DP/PC/q
add wave -noupdate -radix hexadecimal /CPU_tb/DP/IR/q
add wave -noupdate -radix decimal /CPU_tb/DP/Y/q
add wave -noupdate -radix decimal /CPU_tb/DP/Z/qH
add wave -noupdate -radix decimal /CPU_tb/DP/Z/qL
add wave -noupdate -radix decimal /CPU_tb/DP/HI/q
add wave -noupdate -radix decimal /CPU_tb/DP/LO/q
add wave -noupdate /CPU_tb/DP/CON
add wave -noupdate /CPU_tb/CONin
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {244746 ps} 0}
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
WaveRestoreZoom {47053 ps} {313313 ps}
