module CPU(
	input sysclock, resetButton, stopButton, //Buttons are active low
	input [7:0] switches,
	output run,
	output [15:0] hexDisplays
);

//Clock freqeuncy divider
reg clockValue = 0;
wire clock = clockValue;
integer count = 0;

always @(sysclock) begin
	count = count + 1;

	if (count == 1) begin
		clockValue = ~clockValue;
		count = 0;
	end
end

//Input buttons (active low)
wire reset = ~resetButton;
wire stop = ~stopButton;

//Misc. signals
wire clear;
wire IncPC;

//For SelectEncode
wire Gra, Grb, Grc, Rin, Rout, BAout;

//MAR signals
wire MARin;

//MDR signals
wire MDRout, MDRin, memRead;

//RAM signals
wire ramEnable;

//PC signals
wire PCin, PCout;

//ALU signals
wire ADD;

//Z Register signals
wire Zin, Zhighout, Zlowout;
wire HIin, LOin, HIout, LOout;

//Y register signals
wire Yin;

//IR signals
wire IRin;

//Immediate register signals
wire Cout;

//External port signals
wire InPortOutControl;
wire [31:0] InPortData = 32'h00000000 | switches;
wire OutPort_In;
wire [31:0] OutPortOut;

//CON FF signals
wire CONin;
wire CON;

//BusMuxIn Signals
wire [31:0] BusMuxInRZ;
wire [31:0] BusMuxOut;
wire [31:0] BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, BusMuxIn_R15; 
wire [31:0] BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_zHigh, BusMuxIn_zLow, BusMuxIn_PC, BusMuxIn_MDR, BusMuxIn_In_Port, C_sign_extended, AluIn_Y;
wire [31:0] ControlIn_IR, MemoryIn_MAR;
wire [31:0] mDataIn, mDataOut;
wire [63:0] AluOut;

//Register select signals
wire R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out;
wire R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in;
wire RAin;
wire R15sig = R15in | RAin; //Special signal for link register
wire InPort_Out;

//General purpose registers
Register32R0 R0(clear, clock, R0in, BAout, BusMuxOut, BusMuxIn_R0);
Register32 R1(clear, clock, R1in, BusMuxOut, BusMuxIn_R1);
Register32 R2(clear, clock, R2in, BusMuxOut, BusMuxIn_R2);
Register32 R3(clear, clock, R3in, BusMuxOut, BusMuxIn_R3);
Register32 R4(clear, clock, R4in, BusMuxOut, BusMuxIn_R4);
Register32 R5(clear, clock, R5in, BusMuxOut, BusMuxIn_R5);
Register32 R6(clear, clock, R6in, BusMuxOut, BusMuxIn_R6);
Register32 R7(clear, clock, R7in, BusMuxOut, BusMuxIn_R7);
Register32 R8(clear, clock, R8in, BusMuxOut, BusMuxIn_R8);
Register32 R9(clear, clock, R9in, BusMuxOut, BusMuxIn_R9);
Register32 R10(clear, clock, R10in, BusMuxOut, BusMuxIn_R10);
Register32 R11(clear, clock, R11in, BusMuxOut, BusMuxIn_R11);
Register32 R12(clear, clock, R12in, BusMuxOut, BusMuxIn_R12);
Register32 R13(clear, clock, R13in, BusMuxOut, BusMuxIn_R13);
Register32 R14(clear, clock, R14in, BusMuxOut, BusMuxIn_R14);
Register32 R15(clear, clock, R15sig, BusMuxOut, BusMuxIn_R15); //Link register has special in signal for jal

//Special registers
ProgramCounter PC(clear, clock, PCin, IncPC, BusMuxOut, BusMuxIn_PC);
Register32 IR(clear, clock, IRin, BusMuxOut, ControlIn_IR);
Register32 Y(clear, clock, Yin, BusMuxOut, AluIn_Y);
Register64 Z(clear, clock, Zin, AluOut, BusMuxIn_zHigh, BusMuxIn_zLow);
Register32 HI(clear, clock, HIin, BusMuxOut, BusMuxIn_HI);
Register32 LO(clear, clock, LOin, BusMuxOut, BusMuxIn_LO);

Register32 InPort(clear, clock, 1'b1, InPortData, BusMuxIn_In_Port);
Register32 OutPort(clear, clock, OutPort_In, BusMuxOut, OutPortOut);

//Memory registers
Register32 MAR(clear, clock, MARin, BusMuxOut, MemoryIn_MAR);
MDR mdr(clear, clock, MDRin, memRead, BusMuxOut, mDataIn, BusMuxIn_MDR, mDataOut);

//RAM Component
RAM6116 ram(~memRead, ramEnable, MemoryIn_MAR[8:0], mDataOut, mDataIn);

//ALU
ALU alu(AluIn_Y, BusMuxOut, ControlIn_IR[31:27], ADD, AluOut);

//Select encoder
SelectEncode selEncoder(ControlIn_IR, Gra, Grb, Grc, Rin, Rout, BAout, 
	R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, R10out, R11out, R12out, R13out, R14out, R15out,
	R0in, R1in, R2in, R3in, R4in, R5in, R6in, R7in, R8in, R9in, R10in, R11in, R12in, R13in, R14in, R15in, 
	C_sign_extended);
	
//Con FF Logic
CON_FF_module CON_FF_Logic(ControlIn_IR, BusMuxOut, CONin, CON);


//Control Unit
control_unit Control(Gra, Grb, Grc, Rin, Rout, BAout,
    Cout, OutPort_In, MDRin, MARin, Zin, Yin, IRin, PCin, CONin, LOin, HIin, RAin, 
	 IncPC, PCout, MDRout, Zhighout, Zlowout, HIout, LOout, InPort_Out,
    memRead, ramEnable,
    ADD,
	 clear, run,
    ControlIn_IR,
    clock, reset, stop, CON);
	 
//Hex Displays
Seven_Seg_Display_Out LSB(hexDisplays[7:0], clock, OutPortOut[3:0]);
Seven_Seg_Display_Out MSB(hexDisplays[15:8], clock, OutPortOut[7:4]);

//Bus
Bus bus(BusMuxIn_R0, BusMuxIn_R1, BusMuxIn_R2, BusMuxIn_R3, BusMuxIn_R4, BusMuxIn_R5, BusMuxIn_R6, 
BusMuxIn_R7, BusMuxIn_R8, BusMuxIn_R9, BusMuxIn_R10, BusMuxIn_R11, BusMuxIn_R12, BusMuxIn_R13, BusMuxIn_R14, 
BusMuxIn_R15, BusMuxIn_HI, BusMuxIn_LO, BusMuxIn_zHigh, BusMuxIn_zLow, BusMuxIn_PC, BusMuxIn_MDR, 
BusMuxIn_In_Port, C_sign_extended, R0out, R1out, R2out, R3out, R4out, R5out, R6out, R7out, R8out, R9out, 
R10out, R11out, R12out, R13out, R14out, R15out, HIout, LOout, Zhighout, Zlowout, PCout, MDRout, InPort_Out, 
Cout, BusMuxOut);

endmodule
