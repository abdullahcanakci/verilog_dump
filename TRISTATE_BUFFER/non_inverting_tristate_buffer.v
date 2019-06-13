module non_inverting_tristate_buffer(
    input in, 
    input outputEnable, 
    output out
);
    assign out = outputEnable ? in : 1'bZ;

endmodule // non_inverting_tristate_buffer