// This is the Verilog sample code for Method 1 for the Control Unit
`timescale 1ns/10ps

module control_unit (
    output reg Gra, Grb, Grc, Rin, Rout, BAout, // define the inputs and outputs to your Control Unit here
    Cout, OutPort_In, MDRin, MARin, Zin, Yin, IRin, PCin, CONin, LOin, HIin, RAin,
	 IncPC, PCout, MDRout, Zhighout, Zlowout, HIout, LOout, InPort_Out,
    memRead, ramEnable,
    ADD,
	 clear, run,
    input [31:0] IR,
    input clock, reset, stop, Con_FF
);

//these are all just a guess right now, im not sure
parameter reset_state = 8'b00000000, 
			 fetch0 = 8'b00000001, fetch1 = 8'b00000010, fetch2 = 8'b00000011,
			 //fetching operands, performing addition, storing result
          add3 = 8'b00000100, add4 = 8'b00000101, add5 = 8'b00000110,
			//fetching operands, performing addition, storing result 
			 sub3 = 8'b00000111, sub4 = 8'b00001000, sub5 = 8'b00001001,
			 //fetching operands, performing multiplication, storing result
			 mul3 = 8'b00001010, mul4 = 8'b00001011, mul5 = 8'b00001100, mul6 = 8'b00001101,
			 //fetching operands, performing division, handling overflow, storing result
			 div3 = 8'b00001110, div4 = 8'b00001111, div5 = 8'b00010000, div6 = 8'b00010001, 
			 //fetching operands, performing bitwise OR, storing result
			 or3 = 8'b00010010, or4 = 8'b00010011, or5 = 8'b00010100,
			 //fetching operands, performing bitwise AND, storing result 
			 and3 = 8'b00010101, and4 = 8'b00010110, and5 = 8'b00010111,
			 //fetching operands, performing SHIFT LEFT, storing result
			 shl3 = 8'b00011000, shl4 = 8'b00011001, shl5 = 8'b00011010, 
			 //fetching operands, performing SHIFT RIGHT, storing result
			 shr3 = 8'b00011011, shr4 = 8'b00011100, shr5 = 8'b00011101,
			 //fetching operands, performing SHIFT RIGHT ARITHMATIC, storing result
			 shra3 = 8'b01001101, shra4 = 8'b01001110, shra5 = 8'b01001111,
			 //fetching operands, performing ROTATE LEFT, storing result
			 rol3 = 8'b00011110, rol4 = 8'b00011111, rol5 = 8'b00100000,
			 //fetching operands, performing ROTATE RIGHT, storing result
			 ror3 = 8'b00100001, ror4 = 8'b00100010, ror5 = 8'b00100011,
			 //fetching operands, performing NEGATION, storing result 
			 neg3 = 8'b00100100, neg4 = 8'b00100101, neg5 = 8'b00100110,
			 //fetching operands, performing bitwise NOT, storing result 
			 not3 = 8'b00100111, not4 = 8'b00101000, not5 = 8'b00101001,
			 //fetching address, acessing memory, loading data, storing result
			 ld3 = 8'b00101010, ld4 = 8'b00101011, ld5 = 8'b00101100, ld6 = 8'b00101101, ld7 = 8'b00101110,
			 ldi3 = 8'b00101111, ldi4 = 8'b00110000, ldi5 = 8'b00110001, 
			 st3 = 8'b00110010, st4 = 8'b00110011, st5 = 8'b00110100, st6 = 8'b00110101, st7 = 8'b00110110, 
			 //fetching operands, performing addition with immediate value, storing result
			 addi3 = 8'b00110111, addi4 = 8'b00111000, addi5 = 8'b00111001,
			 //fetching operands, performing bitwise AND with immediate value, storing result
			 andi3 = 8'b00111010, andi4 = 8'b00111011, andi5 = 8'b00111100, 
			 //fetching operands, performing bitwise OR with immediate value, storing result
			 ori3 = 8'b00111101, ori4 = 8'b00111110, ori5 = 8'b00111111,
			 br3 = 8'b01000000, br4 = 8'b01000001, br5 = 8'b01000010, br6 = 8'b01000011,
			 //jump to address
			 jr3 = 8'b01000100,
			 //store return address, jump to address
			 jal3 = 8'b01000101, jal4 = 8'b01000110,
			 //store high part of result
			 mfhi3 = 8'b01000111,
			 //store low part of result
			 mflo3 = 8'b01001000,
			 //store input in register
			 in3 = 8'b01001001,
			 //send data to device 
			 out3 = 8'b01001010,
			 //no operation
			 nop3 = 8'b01001011,
			 //halt
			 halt3 = 8'b01001100; 

reg [7:0] present_state = reset_state; // adjust the bit pattern based on the number of states
reg [31:0] IRreg;

always @(posedge clock, posedge reset) // finite state machine; if clock or reset rising-edge
begin
    if (reset == 1) begin
        present_state = reset_state;
    end else begin
		if (stop == 0) begin
        case (present_state)
            reset_state: present_state = fetch0;
            fetch0: present_state = fetch1;
            fetch1: present_state = fetch2;
				fetch2: begin
						#1; // Need this small delay here to read from new IR contents
                case (IR[31:27]) // inst. decoding based on the opcode to set the next state
                    5'b00011: present_state = add3;
						  5'b00100: present_state = sub3;
						  5'b01111:	present_state = mul3;
						  5'b10000:	present_state = div3;
						  5'b00101:	present_state = shr3;
						  5'b00110: present_state = shra3;
						  5'b00111:	present_state = shl3;
						  5'b01000:	present_state = ror3;
						  5'b01001:	present_state = rol3;
						  5'b01010:	present_state = and3;
						  5'b01011:	present_state = or3;
						  5'b10001:	present_state = neg3;
						  5'b10010:	present_state = not3;
						  5'b00000:	present_state = ld3;
						  5'b00001:	present_state = ldi3;
						  5'b00010:	present_state = st3;
						  5'b01100:	present_state = addi3;
						  5'b01101:	present_state = andi3;
						  5'b01110:	present_state = ori3;
						  5'b10011:	present_state = br3;
						  5'b10100:	present_state = jr3;
						  5'b10101:	present_state = jal3;
						  5'b11000:	present_state = mfhi3;
						  5'b11001:	present_state = mflo3;
						  5'b10110:	present_state = in3;
						  5'b10111:	present_state = out3;
						  5'b11010:	present_state = nop3;
						  5'b11011:	present_state = halt3;
                endcase
            end
            
				add3: present_state = add4;
				add4: present_state = add5;
				add5: present_state = fetch0;

            addi3: present_state = addi4;
				addi4: present_state = addi5;
				addi5: present_state = fetch0;

				sub3: present_state = sub4;
				sub4: present_state = sub5;
				sub5: present_state = fetch0;

				mul3: present_state = mul4;
				mul4: present_state = mul5;
				mul5: present_state = mul6;
				mul6: present_state = fetch0;

				div3: present_state = div4;
				div4: present_state = div5;
				div5: present_state = div6;
				div6: present_state = fetch0;

				or3: present_state = or4;
				or4: present_state = or5;
				or5: present_state = fetch0;

				and3: present_state = and4;
				and4: present_state = and5;
				and5: present_state = fetch0;

				shl3: present_state = shl4;
				shl4: present_state = shl5;
				shl5: present_state = fetch0;

				shr3: present_state = shr4;
				shr4: present_state = shr5;
				shr5: present_state = fetch0;
				
				shra3: present_state = shra4;
				shra4: present_state = shra5;
				shra5: present_state = fetch0;

				rol3: present_state = rol4;
				rol4: present_state = rol5;
				rol5: present_state = fetch0;

				ror3: present_state = ror4;
				ror4: present_state = ror5;
				ror5: present_state = fetch0;

				neg3: present_state = neg4;
				neg4: present_state = fetch0;

				not3: present_state = not4;
				not4: present_state = fetch0;

				ld3: present_state = ld4;
				ld4: present_state = ld5;
				ld5: present_state = ld6;
				ld6: present_state = ld7;
				ld7: present_state = fetch0;

				ldi3: present_state = ldi4;
				ldi4: present_state = ldi5;
				ldi5: present_state = fetch0;

				st3: present_state = st4;
				st4: present_state = st5;
				st5: present_state = st6;
				st6: present_state = st7;
				st7: present_state = fetch0;
				
				andi3: present_state = andi4;
				andi4: present_state = andi5;
				andi5: present_state = fetch0;

				ori3: present_state = ori4;
				ori4: present_state = ori5;
				ori5: present_state = fetch0;

				jal3: present_state = jal4;
				jal4: present_state = fetch0;

				jr3: present_state = fetch0;

				br3: present_state = br4;
				br4: present_state = br5;
				br5: present_state = br6;
				br6: present_state = fetch0;

				out3: present_state = fetch0;

				in3: present_state = fetch0;

				mflo3: present_state = fetch0;

				mfhi3: present_state = fetch0;

				nop3: present_state = fetch0;

        endcase
		end
  end
end

always @(present_state) // do the job for each state
begin
	MDRout <= 0; InPort_Out <= 0; OutPort_In <= 0; Cout <= 0; CONin <= 0;
	MDRin <= 0; Zin <=0; Yin <= 0; IRin <= 0;
	ramEnable <= 0; ADD <= 0;
	Gra <= 0; Grb <= 0; Grc <= 0; Rin <= 0; Rout <= 0; BAout <=0;
	memRead <= 0; IncPC <= 0; PCout <= 0; MARin <= 0; PCin <= 0; RAin <= 0;
	Zhighout <= 0; HIin <= 0; HIout <= 0;
	Zlowout <= 0; LOin <= 0; LOout <= 0;
	clear <= 0;
		if (stop == 0) begin
			run <= 1;
		end else begin
			run <= 0;
		end
    case (present_state) // assert the required signals in each state
        reset_state: begin
				clear <= 1;
        end
        fetch0: begin
            PCout <= 1;
            MARin <= 1;
            IncPC <= 1;
        end
		  fetch1: begin
				memRead <= 1; ramEnable <= 1; MDRin <= 1;
		  end
		  fetch2: begin
				MDRout <= 1; IRin <= 1;
		  end
        add3: begin
            Grb <= 1; Rout <= 1;
            Yin <= 1;
        end
		add4: begin
			Zin <= 1; Rout <= 1; Grc <= 1;
		end
		add5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Addition with immediate value
		addi3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		addi4: begin
			Cout <= 1; Zin <= 1;
		end
		addi5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Subtraction
		sub3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		sub4: begin
			Zin <= 1; Rout <= 1; Grc <= 1;
		end
		sub5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Multiplication
		mul3: begin
			Yin <= 1; Gra <= 1; Rout <= 1;
		end
		mul4: begin
			Zin <= 1; Grb <= 1; Rout <= 1;
		end
		mul5: begin
			Zlowout <= 1; LOin <= 1;
		end
		mul6:begin
			Zhighout <= 1; HIin <= 1;
		end

		//Division
		div3: begin
			Yin <= 1; Gra <= 1; Rout <= 1;
		end
		div4: begin
			Zin <= 1; Grb <= 1; Rout <= 1;
		end
		div5: begin
			Zlowout <= 1; LOin <= 1;
		end
		div6: begin
			Zhighout <= 1; HIin <= 1;
		end

		//AND
		and3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		and4: begin
			Grc <= 1; Rout <=1; Zin <= 1;
		end
		and5: begin
			Zlowout <= 1; Gra <= 1; Rin <=1;
		end

		//OR
		or3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		or4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		or5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Shift Left
		shl3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		shl4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		shl5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Shift Right
		shr3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		shr4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		shr5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end
		
		//Shift Right Arithmatic
		shra3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		shra4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		shra5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Rotate Left
		rol3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		rol4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		rol5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Rotate Right
		ror3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		ror4: begin
			Zin <= 1; Grc <= 1; Rout <= 1;
		end
		ror5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end  

		//Negation
		neg3: begin
			Zin <= 1; Grb <= 1; Rout <= 1;
		end
		neg4: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		// NOT
		not3: begin
			Zin <= 1; Grb <= 1; Rout <= 1;
		end
		not4: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Load
		ld3: begin
			Yin <= 1; Grb <= 1; BAout <= 1;
		end
		ld4: begin
			ADD <= 1; Cout <= 1; Zin <= 1;
		end
		ld5: begin
			Zlowout <= 1; MARin <= 1;
		end
		ld6: begin
			memRead <= 1; MDRin <= 1; ramEnable <= 1;
		end
		ld7: begin
			MDRout <= 1; Gra <= 1; Rin <= 1;
		end


		//Load Immediate
		ldi3: begin
			Yin <= 1; Grb <= 1; BAout <= 1;
		end
		ldi4: begin
			ADD <= 1; Cout <= 1; Zin <= 1;
		end
		ldi5: begin
			Zlowout <= 1;  Gra <= 1; Rin <= 1;
		end

		//Store
		st3: begin
			Yin <= 1; Grb <= 1; BAout <= 1;
		end
		st4: begin
			ADD <= 1; Cout <= 1; Zin <= 1;
		end
		st5: begin
			Zlowout <= 1; MARin <= 1;
		end
		st6: begin
			MDRin <= 1; Gra <= 1; Rout <= 1;
		end
		st7: begin
			memRead <= 0; MDRout <= 1; ramEnable <= 1;
		end

		//And with Immediate Value
		andi3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		andi4: begin
			Cout <= 1; Zin <= 1;
		end
		andi5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Or with Immediate Value
		ori3: begin
			Yin <= 1; Grb <= 1; Rout <= 1;
		end
		ori4: begin
			Cout <= 1; Zin <= 1;
		end
		ori5: begin
			Zlowout <= 1; Gra <= 1; Rin <= 1;
		end

		//Branch
		br3: begin
			CONin <= 1; Gra <= 1; Rout <= 1;
		end
		br4: begin
			PCout <= 1; Yin <= 1;
		end
		br5: begin
			Cout <= 1; ADD <= 1; Zin <= 1;
		end
		br6: begin
			Zlowout <= 1;
			if (Con_FF) begin
				PCin <= 1;
			end
		end

		//Jump
		jr3: begin
			Gra <= 1; Rout <= 1; PCin <= 1;
		end

		//Jump and Link
		jal3: begin
			RAin <= 1; PCout <= 1; 
		end
		jal4: begin
			Gra <= 1; Rout <= 1; PCin <= 1;
		end

		//Move from High
		mfhi3: begin
			Gra <= 1; Rin <= 1; HIout <= 1;
		end

		//Move from Low
		mflo3: begin
			Gra <= 1; Rin <= 1; LOout <= 1;
		end

		//Input
		in3: begin
			Gra <= 1; Rin <= 1; InPort_Out <= 1;
		end

		//Output
		out3: begin
			Gra <= 1; Rout <= 1; OutPort_In <= 1;
		end

		//No Operation
		nop3: begin
		end

		//Halt
		halt3: begin
			run <= 0;
		end
    endcase
end

endmodule
