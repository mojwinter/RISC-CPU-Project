module MDR #(parameter DATA_WIDTH_IN = 32, DATA_WIDTH_OUT = 32, INIT = 32'h0)(
	input clear, clock, enable, read,
	input [DATA_WIDTH_IN-1:0]FromBus, input [DATA_WIDTH_IN-1:0]FromMemory,
	output wire [DATA_WIDTH_OUT-1:0]BusMuxIn, output wire [DATA_WIDTH_OUT-1:0]mDataOut
);

reg [DATA_WIDTH_IN-1:0]q;
initial q = INIT;
always @ (posedge clock)
		begin 
			if (clear) begin
				q <= {DATA_WIDTH_IN{1'b0}};
			end
			else if (enable) begin
				if (read) begin
					q <= FromMemory;
				end
				else begin
					q <= FromBus;
				end
			end
		end
	assign mDataOut = q[DATA_WIDTH_OUT-1:0];
	assign BusMuxIn = q[DATA_WIDTH_OUT-1:0];
endmodule
