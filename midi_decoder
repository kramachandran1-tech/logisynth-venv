module midi_decoder (
    input clk,
    input reset,
    input [7:0] byte_in,
    input valid,

    output reg note_on,
    output reg note_off,
    output reg [6:0] note,
    output reg [6:0] velocity
);

reg [1:0] state = 0;
reg [7:0] status;

always @(posedge clk) begin
    if (reset) begin
        state <= 0;
        note_on <= 0;
        note_off <= 0;
    end else begin
        note_on <= 0;
        note_off <= 0;

        if (valid) begin
            case (state)
                0: begin
                    status <= byte_in;
                    state <= 1;
                end

                1: begin
                    note <= byte_in[6:0];
                    state <= 2;
                end

                2: begin
                    velocity <= byte_in[6:0];

                    if (status[7:4] == 4'h9 && velocity != 0)
                        note_on <= 1;
                    else
                        note_off <= 1;

                    state <= 0;
                end
            endcase
        end
    end
end

endmodule
