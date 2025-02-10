module ALU_multiplier(input [31:0]_Q, input [31:0]_M, output [63:0] result);

reg [63:0] product;
reg [33:0] sign_extended_Q;
integer i;

reg [63:0] full_M;
reg [63:0] neg_M;

always @(_Q or _M) begin
	product = 64'b0;
	
	sign_extended_Q = _Q;
	sign_extended_Q[32] = _Q[31];
	sign_extended_Q = sign_extended_Q << 1;
	
	full_M = (_M[31] == 0) ? _M : (({64'hFFFF_FFFF} << 32) | _M);
	neg_M = ~full_M + 1;

	for (i = 1; i < 33; i = i+2) begin
		case (sign_extended_Q[2:0])
			3'b001: product = product + (full_M << (i-1));
			3'b010: product = product + (full_M << (i-1));
			
			3'b011: product = product + (full_M << (i));
			3'b100: product = product + (neg_M << (i));
			
			3'b101: product = product + (neg_M << (i-1));
			3'b110: product = product + (neg_M << (i-1));
		endcase
		sign_extended_Q = sign_extended_Q >>> 2;
	end
end

assign result = product;

endmodule
