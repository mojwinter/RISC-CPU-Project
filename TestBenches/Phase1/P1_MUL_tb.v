// MUL R4, R5
`timescale 1ns/10ps
module P1_MUL_tb();
reg clock, clear, IncPC, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
reg R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
reg MARin;
reg MDRout, MDRin, memRead;
reg [31:0] mDataIn;
wire [31:0] mDataOut;
reg PCout;
reg Zin, Zhighout, Zlowout;
reg HIin, LOin, HIout, LOout;
reg Yin;
reg IRin;


reg [3:0] present_state;

CPU DP(
	clock, clear, IncPC,
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in,
	MARin,
	MDRout, MDRin, memRead,
	mDataIn,
	mDataOut,
	PCout,
	Zin, Zhighout, Zlowout,
	HIin, LOin, HIout, LOout,
	Yin,
	IRin
);

parameter init0 = 4'd1, init1 = 4'd2, init2 = 4'd3, init3 = 4'd4, init4 = 4'd5, T0 = 4'd6, T1 = 4'd7, T2 = 4'b1000, T3 = 4'b1001, T4 = 4'b1010, T5 = 4'b1011, T6 = 4'b1100;
			 
initial begin 
	clock = 0; 
	present_state = 4'd0;	
end

always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	case(present_state)
		init0: begin
			//Initialize all registers to be used
			clear <= 1;
			R0out <= 0; R1out <= 0; R2out <= 0; R3out <= 0; R4out <= 0; R5out <= 0; R6out <= 0; R7out <= 0; MDRout <= 0;
			R0in <= 0; R1in <= 0; R2in <= 0; R3in <= 0; R4in <= 0; R5in <= 0; R6in <= 0; R7in <= 0; MDRin <= 0; Zin <=0; Yin <= 0; IRin <= 0;
			memRead <= 0; IncPC <= 0; PCout <= 0; MARin <= 0;
			Zhighout <= 0; HIin <= 0; HIout <= 0;
			Zlowout <= 0; LOin <= 0; LOout <= 0;
			#15 clear <= 0;
		end
		init1: begin
			//Load R2
			mDataIn <= 32'd21; memRead <= 1; MDRin <= 1;
			#15; memRead <= 0; MDRin <= 0;
		end
		init2: begin
			R4in <= 1; MDRout <= 1;
			#15 R4in <= 0; MDRout <= 0;
		end
		init3: begin
			//Load R3
			mDataIn <= -32'd3; memRead <= 1; MDRin <= 1;
			#15; memRead <= 0; MDRin <= 0;
		end
		init4: begin
			R5in <= 1; MDRout <= 1;
			#15 R5in <= 0; MDRout <= 0;
		end
		//Begin actual instruction
		T0: begin
			MARin <= 1; IncPC <= 1; PCout <= 1;
			#15 MARin <= 0; IncPC <= 0; PCout <= 0;
			
		end
		T1: begin
			memRead <= 1; MDRin <= 1; mDataIn <= 32'h7a28_0000; //IR contents
			#15 memRead <= 0; MDRin <= 0;
		end
		T2: begin
			MDRout <= 1; IRin <= 1;
			#15 MDRout <= 0; IRin <= 0;
		end
		T3: begin
			Yin <= 1; R4out <= 1;
			#15; Yin <= 0; R4out <= 0;
		end
		T4: begin
			R5out <= 1; Zin <= 1;
			#15; R5out <= 0; Zin <= 0;
		end
		T5: begin
			Zlowout <= 1; LOin <= 1;
			#15 Zlowout <= 0; LOin <= 0;
		end
		T6: begin
			Zhighout <= 1; HIin <= 1;
			#15 Zhighout <= 0; HIin <= 0;
		end
	endcase
end
endmodule
