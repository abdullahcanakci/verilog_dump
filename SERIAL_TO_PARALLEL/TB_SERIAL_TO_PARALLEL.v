`timescale 1ns/100ps
`include "SERIAL_TO_PARALLEL.v"

module TB_SERIAL_TO_PARALLEL();
    reg clock, outputEnable, dataIn;
    wire dataOut;
    wire[7:0] outputs;
    integer i = 0;

    SERIAL_TO_PARALLEL serial_module(
        .clock(clock),
        .outputEnable(outputEnable),
        .dataIn(dataIn),
        .dataOut(dataOut),
        .outputs(outputs)
    );

    initial
    begin
        $monitor("outputs: %b", outputs);
        $dumpfile("module.vcd");
        $dumpvars(0, TB_SERIAL_TO_PARALLEL);

        outputEnable = 1;
        clock = 0;
        dataIn = 0;
        #2;
        dataIn = 1;#1;
        dataIn = 0;#2;
        dataIn = 1;#1;
        dataIn = 0;#1;
        dataIn = 1;#1;
        dataIn = 0;#1;
        dataIn = 1;#2;
        dataIn = 0;#2;
        outputEnable = 0;#1;
        #3;
        $finish;
    end
    always
    begin
        clock = ~clock;#0.5;
        clock = ~clock;#0.5;
    end
endmodule // TB_SERIAL_TO_PARALLEL