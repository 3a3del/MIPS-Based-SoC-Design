
module ALU_control_block(inst_in,ALU_Op,ALUControl);

// generate the required signal for any instruction uses the alu

input[15:0] inst_in;
input[1:0] ALU_Op;
output reg[2:0] ALUControl;

always @(*) begin

// 000->add , 001->sub , 010->and , 011->or , 100->SLT , 101->XOR

	case(ALU_Op)
	0: ALUControl = 3'b000; // lw,sw -> add signal(000)
	1: ALUControl = 3'b001; // bne -> sub signal(001)
	2: begin
		case(inst_in[5:0])
		6'b100000: ALUControl = 3'b000;  //ADD
		6'b100010: ALUControl = 3'b001;  //SUB
		6'b100100: ALUControl = 3'b010;  //AND
		6'b100101: ALUControl = 3'b011;  //OR
		6'b101010: ALUControl = 3'b100;  //SLT
		6'b100110: ALUControl = 3'b101;  //XOR
		default: ALUControl = 0;
		endcase
	end
	default: ALUControl = 0;
	endcase
end

endmodule