module full_adder(
    input A, 
    input B, 
    input Cin, 
    output S, 
    output CarryOut
);

    wire ab;
    assign ab = A ^ B;
    assign S = ab ^ Cin;
    assign CarryOut = A && B || ab  && Cin;

endmodule