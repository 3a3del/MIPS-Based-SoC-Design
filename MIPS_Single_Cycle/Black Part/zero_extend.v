
module zero_enxtend(inst_in,zero_enxtend_out);

// extend zero to the MS 16 bits

input[15:0] inst_in;
output[31:0] zero_enxtend_out;

assign zero_enxtend_out={{16{0}},inst_in};

endmodule