module Register64 #(parameter DATA_WIDTH_IN = 64, DATA_WIDTH_OUT = 64, INIT = 32'h0)(
	input clear, clock, enable, 
	input [DATA_WIDTH_IN-1:0]D,
	output wire [31:0]BusMuxInHI, output wire [31:0]BusMuxInLO
);

reg [31:0]qH;
reg [31:0]qL;
initial qH = INIT;
initial qL = INIT;
always @ (posedge clock)
		begin 
			if (clear) begin
				qH <= {32'b0};
				qL <= {32'b0};
			end
			else if (enable) begin
				qH <= D[63:32];
				qL <= D[31:0];
			end
		end
	assign BusMuxInHI = qH;
	assign BusMuxInLO = qL;
endmodule
