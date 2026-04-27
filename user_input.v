module user_input (
    input clk,
    input reset,
    input rx,
    output [7:0] data_out,
    output valid
);

uart_rx uart_inst (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .data_out(data_out),
    .valid(valid)
);

endmodule
