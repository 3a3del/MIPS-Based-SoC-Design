
module JR_Control(inst_in,JRControl);

input[15:0];
output JRControl;

assign JRControl = (inst_in[5:0]==6'b001000)?1:0;

endmodule