module Shifter_32 (Input, Output);
    input  [31:0] Input;
    output [31:0] Output;

    assign Output = {Input[29:0], 2'b0};
endmodule