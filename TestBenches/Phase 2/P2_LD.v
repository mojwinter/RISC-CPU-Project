`timescale 1ns/10ps
module P2_LD();
reg clock, clear, IncPC;

reg R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in; //These signals are for manually controlling register in/out
reg Gra, Grb, Grc, Rin, Rout, BAout;

reg MARin;
reg MDRout, MDRin, memRead;
reg ramEnable;

reg PCin;
reg PCout;
reg ADD;
reg Zin, Zhighout, Zlowout;
reg HIin, LOin, HIout, LOout;
reg Yin;
reg IRin;
reg Cout;
reg CONin;
wire CON;

reg [31:0] InPortData;
reg InPort_Out;
wire [31:0] OutPortData;
reg OutPort_In;

reg [5:0] present_state;

CPU DP(
	clock, clear, IncPC,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	Gra, Grb, Grc, Rin, Rout, BAout,
	MARin,
	MDRout, MDRin, memRead,
	ramEnable,
	PCin, PCout,
	ADD,
	Zin, Zhighout, Zlowout,
	HIin, LOin, HIout, LOout,
	Yin,
	IRin,
	Cout,
	InPortData,
	InPort_Out,
	OutPortData,
	OutPort_In,
	CONin,
	CON
);

parameter init0 = 6'd1, init1 = 6'd2, init2 = 6'd3, init3 = 6'd4, init4 = 6'd5, T0 = 6'd6, T1 = 6'd7, T2 = 6'b1000, T3 = 6'b1001, T4 = 6'b1010, T5 = 6'b1011,
				T6 = 6'b1100, T7 = 6'b1101, T8 = 6'b1110, T9 = 6'b1111, T10 = 6'b10000, T11 = 6'b10001, T12 = 6'b10010, T13 = 6'b10011, T14 = 6'b10100, 
				T15 = 6'b10101;
			 
initial begin 
	clock = 0; 
	present_state = 6'd0;	
end

always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; 
	R0in <= 0; R1in <= 0; R2in <= 0; R3in <= 0; R4in <= 0; R5in <= 0; R6in <= 0; R7in <= 0;
	MDRout <= 0; InPort_Out <= 0; OutPort_In <= 0; Cout <= 0; CONin <= 0;
	MDRin <= 0; Zin <=0; Yin <= 0; IRin <= 0;
	ramEnable <= 0; ADD <= 0;
	Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <=0;
	memRead <= 0; IncPC <= 0; PCout <= 0; MARin <= 0; PCin <= 0;
	Zhighout <= 0; HIin <= 0; HIout <= 0;
	Zlowout <= 0; LOin <= 0; LOout <= 0;
	clear <= 0;
	case(present_state)
		init0: begin
			//Initialize all registers to be used
			clear <= 1;
//			#15 clear <= 0;
		end
		init1: begin
			//Load R2
//			InPortData <= 32'hA;
		end
		init2: begin
//			R2in <= 1; InPort_Out <= 1; InPortData <= 32'hC; //For next step
//			#15 R2in <= 0; InPort_Out <= 0;
		end
		init3: begin
//			R0in <= 1; InPort_Out <= 1; InPortData <= -32'hF;
//			#15 R0in <= 0; InPort_Out <= 0;
		end
		init4: begin
//			R3in <= 1; InPort_Out <= 1;
//			#15 R3in <= 0; InPort_Out <= 0;
		end
		//Begin actual instruction
		T0: begin
			MARin <= 1; IncPC <= 1; PCout <= 1;
//			#15 MARin <= 0; IncPC <= 0; PCout <= 0;
		end
		T1: begin
//			InPortData <= 32'h01000095; //IR contents
			memRead <= 1; ramEnable <= 1; MDRin <= 1;
		end
		T2: begin
			MDRout <= 1; IRin <= 1;
//			InPort_Out <= 1; IRin <= 1;
//			#15 InPort_Out <= 0; IRin <= 0;
		end
		T3: begin
			Yin <= 1; Grb <= 1; BAout <= 1;
			#15; Yin <= 0; Grb <= 0; BAout <= 0;
		end
		T4: begin
			ADD <= 1; Cout <= 1; Zin <= 1;
			#15; ADD <= 0; Cout <= 0; Zin <= 0;
		end
		T5: begin		
			Zlowout <= 1; MARin <= 1;
			#15 Zlowout <= 0; MARin <= 0;
		end
		T6: begin
			memRead <= 1; MDRin <= 1; ramEnable <= 1;
			#15 memRead <= 0; MDRin <= 0; ramEnable <= 0;
		end
		T7: begin
			//Load MDR
			MDRout <= 1; Gra <= 1; Rin <= 1;
			#15 MDRout <= 0; Gra <= 0; Rin <= 0;
		end
		T8: begin
//			MARin <= 1; IncPC <= 1; PCout <= 1;
//			#15 MARin <= 0; IncPC <= 0; PCout <= 0;
			PCout <= 1; MARin <= 1; IncPC <= 1; PCout <= 1;
		end
		T9: begin
//			InPortData <= 32'h00100038; //IR contents
			memRead <= 1; ramEnable <= 1; MDRin <= 1;
		end
		T10: begin
			MDRout <= 1; IRin <= 1;
//			InPort_Out <= 1; IRin <= 1;
//			#15 InPort_Out <= 0; IRin <= 0;
		end
		T11: begin
			Yin <= 1; Grb <= 1; BAout <= 1;
			#15; Yin <= 0; Grb <= 0; BAout <= 0;
		end
		T12: begin
			ADD <= 1; Cout <= 1; Zin <= 1;
			#15; ADD <= 0; Cout <= 0; Zin <= 0;
		end
		T13: begin		
			Zlowout <= 1; MARin <= 1;
			#15 Zlowout <= 0; MARin <= 0;
		end
		T14: begin
			memRead <= 1; MDRin <= 1; ramEnable <= 1;
			#15 memRead <= 0; MDRin <= 0; ramEnable <= 0;
		end
		T15: begin
			//Load MDR
			MDRout <= 1; Gra <= 1; Rin <= 1;
			#15 MDRout <= 0; Gra <= 0; Rin <= 0;
		end		
	endcase
end
endmodule
