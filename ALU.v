module ALU (
  input wire [31:0] A, // signal A
  input wire [31:0] B, // signal B
  input [4:0] opcode, // opcode to select operation
  input ADD, //Add signal for non-mathematical instructions
  output wire [63:0] result
);

reg [63:0] q;
reg [63:0] longA;
wire [31:0] add_result;
wire [31:0] sub_result;
wire [63:0] div_result;
wire [63:0] mul_result;
wire [31:0] neg_result;

adder_subtractor adder_inst(A, B, 0, add_result);
adder_subtractor subtractor_inst(A, B, 1, sub_result);
ALU_divider div_inst(A, B, div_result[63:32], div_result[31:0]);
ALU_multiplier mul_inst(A, B, mul_result);
adder_subtractor neg_inst(0, B, 1, neg_result);
always @ (A or B or opcode or add_result) // sensitivity list for the always block, only need to update on add_result because all results change at the same time
	begin
    case (opcode)
		5'b01100,
      5'b00011: // ADD operation
			q <= add_result;
      5'b00100: // SUB operation
			q <= sub_result;
      5'b01111: // MULTI operation
        q <= mul_result;
      5'b10000: // DIV operation
        q <= div_result;
      5'b00101: // SHR operation
        q = A >> B;
      5'b00110: begin // SHRA operation
		  longA = (A[31] == 0) ? A : (({64'hFFFF_FFFF} << 32) | A);
        q = longA >>> B;
		 end
      5'b00111: // SHL operation
        q = A << B;
      5'b01000: // ROR
        q = A >> B[4:0] | A << (32 - B[4:0]); // combines left and right shift to ensure wrap around
      5'b01001: // ROL operation
        q = A << B[4:0] | A >> (32 - B[4:0]); // combines left and right shift to ensure wrap around
      5'b01101,
		5'b01010: // AND operation
        q = A & B;
      5'b01110,
		5'b01011: // OR operation
        q = A | B;
      5'b10001: // NEG operation
		  q <= neg_result;
      5'b10010: // NOT operation
        q = ~B;
      default:
        q = 64'b0; // default case, result is 0
    endcase
	 
	 if (ADD) begin
		q <= add_result;
	 end
  end
assign result = q;
endmodule
