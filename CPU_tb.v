`timescale 1ns/10ps
module CPU_tb();
reg clock;

reg doneInit = 0;
reg [3:0] present_state;

wire runOut;
wire [15:0] hexDisplays;

reg [7:0] switches;
reg resetButton, stopButton;

CPU DP(
	clock, resetButton, stopButton,
	switches,
	runOut,
	hexDisplays
);

parameter init0 = 4'd1, init1 = 4'd2, init2 = 4'd3, init3 = 4'd4, init4 = 4'd5, T0 = 4'd6, T1 = 4'd7, T2 = 4'b1000, T3 = 4'b1001, T4 = 4'b1010, T5 = 4'b1011;
initial begin 
	clock = 0; 
	present_state = 4'd0;	
end

always #10 clock = ~clock;
always @ (negedge clock) present_state = present_state + 1;
	
always @(present_state) begin
	resetButton <= 1;
	stopButton <= 1;
	if (doneInit == 0)  begin
		case(present_state)
			init0: begin
				switches = 8'h80;
				resetButton <= 0; stopButton <= 0;			
			end
			init1: begin
				resetButton <= 1;
			end
			init2: begin
			end
			init3: begin
				stopButton <= 1;
				doneInit <= 1;
			end
		endcase
	end
end
endmodule
