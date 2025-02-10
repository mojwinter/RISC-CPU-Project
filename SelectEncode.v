module SelectEncode(

	input [31:0]IR,

	//From control unit (In phase 3/)
	input Gra,
	input Grb,
	input Grc,
	input Rin,
	input Rout,
	input BAout,
	
	output wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, 
			 R9out, R10out, R11out, R12out, R13out, R14out, R15out,
			 
	output wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, 
			 R9in, R10in, R11in, R12in, R13in, R14in, R15in,
			 
	output [31:0] C_sign_extended

);

reg [4:0] opcode;
reg [3:0] Ra;
reg [3:0] Rb;
reg [3:0] Rc;

reg [3:0] decoderInput;

reg outSelect;

reg 	R0inReg, R1inReg, R2inReg, R3inReg, R4inReg, R5inReg, R6inReg, R7inReg, R8inReg, 
			 R9inReg, R10inReg, R11inReg, R12inReg, R13inReg, R14inReg, R15inReg;
			 
reg 	R0outReg, R1outReg, R2outReg, R3outReg, R4outReg, R5outReg, R6outReg, R7outReg, R8outReg, 
			 R9outReg, R10outReg, R11outReg, R12outReg, R13outReg, R14outReg, R15outReg;

reg [31:0] C_sign_extended_Reg;

always @ (IR, Gra, Grb, Grc, Rin, Rout, BAout) begin
	//Reset all signals to 0
	R0inReg = 0;
	R1inReg = 0;
	R2inReg = 0;
	R3inReg = 0;
	R4inReg = 0;
	R5inReg = 0;
	R6inReg = 0;
	R7inReg = 0;
	R8inReg = 0;
	R9inReg = 0;
	R10inReg = 0;
	R11inReg = 0;
	R12inReg = 0;
	R13inReg = 0;
	R14inReg = 0;
	R15inReg = 0;
	
	R0outReg = 0;
	R1outReg = 0;
	R2outReg = 0;
	R3outReg = 0;
	R4outReg = 0;
	R5outReg = 0;
	R6outReg = 0;
	R7outReg = 0;
	R8outReg = 0;
	R9outReg = 0;
	R10outReg = 0;
	R11outReg = 0;
	R12outReg = 0;
	R13outReg = 0;
	R14outReg = 0;
	R15outReg = 0;
	
		
	//Logic
	opcode = IR[31:27];
	Ra = IR[26:23];
	Rb = IR[22:19];
	Rc = IR[18:15];
	
	outSelect = Rout | BAout;
	
	decoderInput = (Ra & {4{Gra}}) | (Rb & {4{Grb}}) | (Rc & {4{Grc}});
	
	//Decoder
	if (Gra | Grb | Grc) begin
		case (decoderInput)
			4'h0 : begin
				if (outSelect)
					R0outReg = 1;
				else if (Rin)
					R0inReg = 1;
			end
			4'h1 : begin
				if (outSelect)
					R1outReg = 1;
				else if (Rin)
					R1inReg = 1;
			end
			4'h2 : begin
				if (outSelect)
					R2outReg = 1;
				else if (Rin)
					R2inReg = 1;
			end
			4'h3 : begin
				if (outSelect)
					R3outReg = 1;
				else if (Rin)
					R3inReg = 1;
			end
			4'h4 : begin
				if (outSelect)
					R4outReg = 1;
				else if (Rin)
					R4inReg = 1;
			end
			4'h5 : begin
				if (outSelect)
					R5outReg = 1;
				else if (Rin)
					R5inReg = 1;
			end
			4'h6 : begin
				if (outSelect)
					R6outReg = 1;
				else if (Rin)
					R6inReg = 1;
			end
			4'h7 : begin
				if (outSelect)
					R7outReg = 1;
				else if (Rin)
					R7inReg = 1;
			end
			4'h8 : begin
				if (outSelect)
					R8outReg = 1;
				else if (Rin)
					R8inReg = 1;
			end
			4'h9 : begin
				if (outSelect)
					R9outReg = 1;
				else if (Rin)
					R9inReg = 1;
			end
			4'hA : begin
				if (outSelect)
					R10outReg = 1;
				else if (Rin)
					R10inReg = 1;
			end
			4'hB : begin
				if (outSelect)
					R11outReg = 1;
				else if (Rin)
					R11inReg = 1;
			end
			4'hC : begin
				if (outSelect)
					R12outReg = 1;
				else if (Rin)
					R12inReg = 1;
			end
			4'hD : begin
				if (outSelect)
					R13outReg = 1;
				else if (Rin)
					R13inReg = 1;
			end
			4'hE : begin
				if (outSelect)
					R14outReg = 1;
				else if (Rin)
					R14inReg = 1;
			end
			4'hF : begin
				if (outSelect)
					R15outReg = 1;
				else if (Rin)
					R15inReg = 1;
			end
		endcase
	end
	
	//Sign extend the immediate value
	C_sign_extended_Reg = (IR[18] == 0) ? IR[17:0] : (({64'hFFFF_FFFF} << 18) | IR[17:0]);
end

assign C_sign_extended = C_sign_extended_Reg;

assign R0in = R0inReg;
assign R1in = R1inReg;
assign R2in = R2inReg;
assign R3in = R3inReg;
assign R4in = R4inReg;
assign R5in = R5inReg;
assign R6in = R6inReg;
assign R7in = R7inReg;
assign R8in = R8inReg;
assign R9in = R9inReg;
assign R10in = R10inReg;
assign R11in = R11inReg;
assign R12in = R12inReg;
assign R13in = R13inReg;
assign R14in = R14inReg;
assign R15in = R15inReg;

assign R0out = R0outReg;
assign R1out = R1outReg;
assign R2out = R2outReg;
assign R3out = R3outReg;
assign R4out = R4outReg;
assign R5out = R5outReg;
assign R6out = R6outReg;
assign R7out = R7outReg;
assign R8out = R8outReg;
assign R9out = R9outReg;
assign R10out = R10outReg;
assign R11out = R11outReg;
assign R12out = R12outReg;
assign R13out = R13outReg;
assign R14out = R14outReg;
assign R15out = R15outReg;


endmodule
		
	
	
	