module RAM6116(input writeEnable, chipSelect, input [8:0] address, input [31:0] dataIn, output [31:0] dataOut);

reg [31:0] RAM1[0:255];

reg loaded = 0;

initial
	$readmemh("phase4Sim.txt", RAM1);
//	$readmemh("phase4.txt", RAM1);
//	$readmemh("phase3.txt", RAM1);


reg [31:0] q = {32{1'bZ}};
always @ (writeEnable, chipSelect) begin
	if (chipSelect == 1) begin
		if (writeEnable == 1) begin
			RAM1[address] <= dataIn; //Write to RAM
		end else if (writeEnable == 0) begin
			q <= RAM1[address];
		end
	end
end

assign dataOut = q;
endmodule
