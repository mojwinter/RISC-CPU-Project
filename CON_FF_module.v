`timescale 1ns/10ps

module CON_FF_module(input [31:0] IR, input [31:0] BusMuxOut, input CONin, output CON);

reg [3:0] Ra;
reg [1:0] C2;
reg brzr, brnz, brpl, brmi;
reg BusOR;
reg bit31;
integer i;
reg D;
reg CONout = 0;

always @ (IR, BusMuxOut) begin	
	Ra = IR[26:23];
	C2 = IR[20:19];
	brzr = 0;
	brnz = 0;
	brpl = 0;
	brmi = 0;
	BusOR = 0;
	
	//Decode IR
	case (C2)
		2'b00: brzr = 1;
		2'b01: brnz = 1;
		2'b10: brpl = 1;
		2'b11: brmi = 1;
	endcase
	
	//Determine input signals
	bit31 = BusMuxOut[31];
	for (i = 0; i < 32; i = i + 1) begin
		BusOR = BusOR | BusMuxOut[i];
	end
	
	//Logic
	D = (brzr & ~BusOR) | (brnz & BusOR) | (brpl & ~bit31) | (brmi & bit31);
end

always @ (posedge CONin) begin
	#2 //System delay (bus prop delay)
	CONout = D;
end

assign CON = CONout;

endmodule
