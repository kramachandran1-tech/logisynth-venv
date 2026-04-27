module control_path (
    input clk,
    input reset,
    input rx,

    output note_on,
    output note_off,
    output [6:0] note,
    output [6:0] velocity
);

wire [7:0] uart_data;
wire uart_valid;

wire [7:0] fifo_out;
wire fifo_empty;

user_input u_input (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .data_out(uart_data),
    .valid(uart_valid)
);

byte_buffer fifo (
    .clk(clk),
    .reset(reset),
    .byte_in(uart_data),
    .write_en(uart_valid),
    .read_en(!fifo_empty),
    .byte_out(fifo_out),
    .empty(fifo_empty)
);

midi_decoder decoder (
    .clk(clk),
    .reset(reset),
    .byte_in(fifo_out),
    .valid(!fifo_empty),
    .note_on(note_on),
    .note_off(note_off),
    .note(note),
    .velocity(velocity)
);

endmodule
