module Mux_2to1 (Input0, Input1, Output, Selector);
    input  Selector;
    input  [31:0]Input1, Input0;
    output [31:0]Output;

    assign Output = (Selector)? Input1: Input0;
endmodule