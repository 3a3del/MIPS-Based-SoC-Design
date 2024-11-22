
module sign_extend(inst_in,sign_extend_out);

//extends the MSB of the LS 16 bits to the remaining MS 16 bits

input[15:0] inst_in;
output[31:0] sign_extend_out;

assign sign_extend_out={{16{inst_in[15]}},inst_in};

endmodule