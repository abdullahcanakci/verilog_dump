`timescale 1ns/100ps
`include "full_adder.v"

module full_adder_tb();

    reg a, b, cin;
    wire sum, cout;

    

    full_adder adder_module(
        .A(a), 
        .B(b), 
        .Cin(cin), 
        .S(sum), 
        .CarryOut(cout)
    );

    initial
    begin
        $monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b", a,b,cin,sum,cout);
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);

        a = 0; b = 0; cin = 0;#1;
        a = 0; b = 0; cin = 1;#1;
        a = 0; b = 1; cin = 0;#1;
        a = 0; b = 1; cin = 1;#1;

        a = 1; b = 0; cin = 0;#1;
        a = 1; b = 0; cin = 1;#1;
        a = 1; b = 1; cin = 0;#1;
        a = 1; b = 1; cin = 1;#1;
        $finish;
    end

endmodule