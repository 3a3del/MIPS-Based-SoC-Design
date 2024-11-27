module MIPS_32_Top_Part(clk, reset, Extension_out, PC_jr,
                        branch_control, jump_control, JR_control,
                        PC_out, Zero_flag);
    
    input  clk, reset;
    output [31:0]PC_out;

    //Signals coming from different parts:
    input  [31:0]Extension_out, PC_jr;
    input  branch_control, jump_control, JR_control, Zero_flag;

    //internal regs and buses:
    reg  [31:0]PC_current;
    wire [31:0]PC_next, PC4;
    wire [31:0]M1_out, M2_out;
    wire S1, S2, S3;
    wire [31:0]PC_28_out;
    wire [31:0]shifted_extension_out;
    wire [31:0]PC_bne, PC_j;

    //Shifters:
    Shifter_32 Inst1 (.Input(PC_current), .Output(PC_28_out));
    Shifter_32 Inst2 (.Input(Extension_out), .Output(shifted_extension_out));

    //Muxs:
    Mux_2to1 M1(.Input0(PC4), .Input1(PC_bne), .Output(M1_out), .Selector(S1));
    Mux_2to1 M2(.Input0(M1_out), .Input1(PC_j), .Output(M2_out), .Selector(jump_control));
    Mux_2to1 M3(.Input0(M2_out), .Input1(PC_jr), .Output(PC_next), .Selector(JR_control));
    
    //PC Current instruction:
    always @(posedge clk or posedge reset) begin
        if(reset)
            PC_current <= 32'd0;
        else 
            PC_current <= PC_next;
    end

    //Address of the next instruction (32 bit or 4 bytes)
    assign PC4    = PC_current + 32'd4;

    //Output of the second adder:
    assign PC_bne = PC4 + shifted_extension_out;

    //Flag coming from control unit and ALU:
    assign S1     = branch_control & ~(Zero_flag);

    //append shifted out with 4 MSB of PC: 
    assign PC_j   = {PC4[31:28], PC_28_out[27:0]};

    //Output to the instruction memory
    assign PC_out = PC_current;
endmodule