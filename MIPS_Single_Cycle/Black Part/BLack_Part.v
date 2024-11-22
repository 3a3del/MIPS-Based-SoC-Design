

module Black_Part(inst_in,ALU_Op,SignZero,sign_zero_mux_out,ALU_Control,JR_Control_sig);

input[15:0] inst_in;
input[1:0] ALU_Op;
input SignZero;
output[31:0] sign_zero_mux_out;
output[2:0] ALU_Control;
output JR_Control_sig;

wire[15:0] sign_extend_out,zero_enxtend_out;

sign_extend sign_extend(inst_in,sign_extend_out);
zero_extend zero_extend(inst_in,zero_enxtend_out);

assign sign_zero_mux_out = SignZero?sign_extend_out:zero_enxtend_out;

JR_Control JR_Control(inst_in,ALU_Op,JR_Control_sig);
ALU_control_block ALU_control_block(inst_in,ALU_Op,ALUControl);

endmodule