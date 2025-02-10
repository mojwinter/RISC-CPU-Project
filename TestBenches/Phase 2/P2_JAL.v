`timescale 1ns/10ps
module P2_JAL();
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
				T15 = 6'b10101, T16 = 6'b10110, T17 = 6'b10111, T18 = 6'b11000, T19 = 6'b11001, T20 = 6'b11010, T21 = 6'b11011, T22 = 6'b11100, T23 = 6'b11101,
				T24 = 6'b11110, T25 = 6'b11111, T26 = 6'b100000, T27 = 6'b100001;
			 
initial begin 
	clock = 0; 
	present_state = 6'd0;	
end

always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	//Reset signals every time
	R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; 
	R0in <= 0; R1in <= 0; R2in <= 0; R3in <= 0; R4in <= 0; R5in <= 0; R6in <= 0; R7in <= 0; R15in <= 0;
	MDRout <= 0; InPort_Out <= 0; OutPort_In <= 0; Cout <= 0; CONin <= 0;
	MDRin <= 0; Zin <=0; Yin <= 0; IRin <= 0;
	ramEnable <= 0; ADD <= 0; PCin <= 0;
	Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <=0;
	memRead <= 0; IncPC <= 0; PCout <= 0; MARin <= 0;
	Zhighout <= 0; HIin <= 0; HIout <= 0;
	Zlowout <= 0; LOin <= 0; LOout <= 0;

	case(present_state)
		init0: begin
			//Initialize all registers to be used
			clear <= 1;
			#15 clear <= 0;
		end
		init1: begin
			//Load R6
			InPortData <= 32'h100;
		end
		init2: begin
			R6in <= 1; InPort_Out <= 1;
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
			#15 MARin <= 0; IncPC <= 0; PCout <= 0;
		end
		T1: begin
			InPortData <= 32'hAB000000; //IR contents
		end
		T2: begin
			InPort_Out <= 1; IRin <= 1;
			#15 InPort_Out <= 0; IRin <= 0;
		end
		T3: begin
			R15in <= 1; PCout <= 1;
		end
		T4: begin
			Gra <= 1; Rout <= 1; PCin <= 1;
		end
	endcase
end
endmodule
