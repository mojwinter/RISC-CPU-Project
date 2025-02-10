module ALU_divider(input [31:0]_Q, input [31:0]_M, output [31:0] remainder, output [31:0] quotient);

reg [31:0] Q;
reg [32:0] A;
reg [32:0] M;
reg [32:0] subM;
reg [64:0] AQ;

integer i, qNegative = 0, mNegative = 0;

always@(_Q or _M)
	begin
		A = 32'b0;
		qNegative = 0;
		mNegative = 0;
		
		//Check for negatives and flip if so
		if (_Q[31] == 1) begin
			qNegative = 1;
			Q = ~_Q + 1;
		end else begin
			Q = _Q;
		end
		
		if (_M[31] == 1) begin
			mNegative = 1;
			M = ~_M + 1;
			M[32] = 0;
			subM = _M;
			subM[32] = 1;
		end else begin
			M = _M;
			M[32] = 0;
			subM = ~_M + 1;
			subM[32] = 1;
		end
		
		AQ[64:32] = A;
		AQ[31:0] = Q;
		
		for(i = 0; i < 32; i = i + 1)
		begin
			AQ = AQ << 1;
			
			//Add/sub M
			if (AQ[64] == 0) begin
				AQ[64:32] = AQ[64:32] - M;
			end else begin
				AQ[64:32] = AQ[64:32] + M;
			end
			
			//Fill in last bit
			if (AQ[64] == 0) begin
				AQ[0] = 1;
			end else begin
				AQ[0] = 0;
			end
		end
		
		//Check if A is negative and add another M if needed
		if (AQ[64] == 1) begin
			AQ[64:32] = AQ[64:32] + M;
		end
		
		A = AQ[64:32];
		Q = AQ[31:0];
		
		//Determine whether to 2's comp the result
		if (qNegative ^ mNegative == 1) begin
			Q = ~Q + 1;
		end
end

assign remainder = A; //Should automatically truncate
assign quotient = Q;

endmodule
