module control_top (
    input clk,
    input reset,
    input rx,

    output note_on,
    output note_off,
    output [6:0] note,
    output [6:0] velocity
);

control_path cp (
    .clk(clk),
    .reset(reset),
    .rx(rx),
    .note_on(note_on),
    .note_off(note_off),
    .note(note),
    .velocity(velocity)
);

endmodule
