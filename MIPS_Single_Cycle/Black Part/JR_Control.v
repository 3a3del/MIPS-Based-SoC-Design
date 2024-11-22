
module JR_Control(inst_in,ALU_Op,JRControl);

// What JR inst do is that it jumps to the inst. address stored in reg[rs].
// Knowing that JR is an R-Type inst it uses the ALUOp as its a decoder diffrentiate 
//between these (lw,sw,r-type,bne) for the alu to know if we have an R-Type instr and upon 

/*
ALU Signals:
00->lw,sw
01->beq
10->r-type
*/


input[15:0] inst_in;
input[1:0] ALU_Op;
output JRControl;

assign JRControl = ((ALU_Op==2)&(inst_in[5:0]==6'b001000))?1:0;

endmodule
