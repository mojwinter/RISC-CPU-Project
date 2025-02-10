module Register32R0 #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'h0)(
	input clear, clock, enable, BAout,
	input [DATA_WIDTH_IN-1:0]D,
	output wire [DATA_WIDTH_OUT-1:0]BusMuxIn
);
reg [DATA_WIDTH_IN-1:0]q;
initial q = INIT;
reg [DATA_WIDTH_IN-1:0]clearReg;
always @ (posedge clock)
		begin 
			if (clear) begin
				q <= {DATA_WIDTH_IN{1'b0}};
			end
			else if (enable) begin
				q <= D;
			end
		end
//Treat BAout signal seapartely so that it doesn't need to wait for the clock to affect the output
always @ (BAout) begin
	if (BAout) begin
		clearReg <= {DATA_WIDTH_IN{1'b0}};
	end else begin
		clearReg <= {DATA_WIDTH_IN{1'b1}};
	end
end
assign BusMuxIn = clearReg & q[DATA_WIDTH_OUT-1:0];
endmodule
