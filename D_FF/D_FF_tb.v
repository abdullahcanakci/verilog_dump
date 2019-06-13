`timescale 1ns/100ps
`include "D_FF.v"

module D_FF_tb();
    reg clk, data, outputEnable, rst;
    wire Q;

    D_FF dMod(.clk(clk), .data(data), .outputEnable(outputEnable), .rst(rst), .Q(Q));

    initial
    begin
        $dumpfile("D_FF_tb.vcd");
        $dumpvars(0, D_FF_tb);

        clk = 0;
        data = 0; outputEnable = 1; rst = 1;
        $display("Normal Operation");
        clk = ~clk; #1;
        clk = ~clk; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        data = 1; #1;
        clk = ~clk; #1;
        clk = ~clk; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        data = 0; #1;
        clk = ~clk; #1;
        clk = ~clk; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        data = 1; #1;
        clk = ~clk; #1;
        clk = ~clk; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        $display("Reset");
        rst = 0;#1;
        rst = 1;#1;
        rst = 0;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        $display("Output Control");
        outputEnable = 0;
        data = 0; clk = 0; #1;
        clk = 1; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);

        data = 1; clk = 0; #1;
        clk = 1; #1;
        $display("data=%b, outputEnable=%b, Q=%b,", data, outputEnable, Q);



        $finish;
    end

endmodule // D_FF_tb