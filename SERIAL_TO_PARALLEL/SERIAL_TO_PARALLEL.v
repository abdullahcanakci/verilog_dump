module SERIAL_TO_PARALLEL(
    input clock,
    input outputEnable,
    input dataIn,
    output dataOut,
    output [7:0] outputs
);
    reg [8:0]shifter;
    assign outputs[7:0] = outputEnable ? shifter[7:0]: 8'bZ;
    assign dataOut = shifter[8];

    initial
    begin
        shifter = 0;
    end

    always @(posedge(clock))
    begin
        shifter <= shifter << 1;
        shifter[0] <= dataIn;
    end

endmodule // SERIAL_TO_PARALLEL