`timescale 1ns/100ps
`include "non_inverting_tristate_buffer.v"

module non_inverting_tristate_buffer_tb();
    reg in, outputEnable;
    wire out;

    non_inverting_tristate_buffer modBuffer(.in(in), .outputEnable(outputEnable), .out(out));

    initial
    begin
        $monitor("input=%b, outputEnable=%b ouput=%b,", in, outputEnable, out);
        $dumpfile("non_inverting_tristate_buffer.vcd");
        $dumpvars(0, non_inverting_tristate_buffer_tb);
        in = 0; outputEnable = 1; #1;
        in = 1; outputEnable = 1; #1;
        in = 0; outputEnable = 0; #1;
        in = 1; outputEnable = 0; #1;
        $finish;
    end
endmodule // non_inverting_tristate_buffer_tb
