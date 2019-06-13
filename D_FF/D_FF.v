`include "../TRISTATE_BUFFER/non_inverting_tristate_buffer.v"

module D_FF(
    input clk,
    input data,
    input outputEnable,
    input rst,
    output Q
);
    reg out;
    pullup(data);
    pullup(outputEnable);

    non_inverting_tristate_buffer buffer(.in(out), .outputEnable(outputEnable), .out(Q));

    always @(posedge(clk), negedge(rst))
    begin
        out <= rst ? data : 0;
    end

endmodule // D_FF