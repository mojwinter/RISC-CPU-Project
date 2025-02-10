module ProgramCounter#(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'h0, INSTRUCTION_SIZE = 1)(
	input clear, clock, enable, inc,
	input [DATA_WIDTH_IN-1:0]D,
	output wire [DATA_WIDTH_OUT-1:0]BusMuxIn
);

reg [DATA_WIDTH_IN-1:0]q;
initial q = INIT;
always @ (posedge clock)
		begin 
			if (clear) begin
				q <= {DATA_WIDTH_IN{1'b0}};
			end
			else if (enable) begin
				q <= D;
			end
			else if (inc) begin
				q <= q + INSTRUCTION_SIZE;
			end
		end
	assign BusMuxIn = q[DATA_WIDTH_OUT-1:0];
endmodule