// Ripple Carry Adder
module adder(input wire [31:0]A, input wire [31:0] B, output [31:0] Result);

reg [31:0] Sum;
reg [32:0] LocalCarry;

integer i;

always@(A or B)
	begin
		LocalCarry = 33'd0;
		for(i = 0; i < 32; i = i + 1)
		begin
				Sum[i] = A[i]^B[i]^LocalCarry[i];
				LocalCarry[i+1] = (A[i]&B[i])|(LocalCarry[i]&(A[i]|B[i]));
		end
end
assign Result = Sum;
endmodule
