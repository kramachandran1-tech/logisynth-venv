module byte_buffer (
    input clk,
    input reset,
    input [7:0] byte_in,
    input write_en,
    input read_en,
    output reg [7:0] byte_out,
    output reg empty
);

reg [7:0] fifo [0:15];
reg [3:0] wr_ptr = 0;
reg [3:0] rd_ptr = 0;

always @(posedge clk) begin
    if (reset) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        empty <= 1;
    end else begin
        if (write_en) begin
            fifo[wr_ptr] <= byte_in;
            wr_ptr <= wr_ptr + 1;
            empty <= 0;
        end

        if (read_en && !empty) begin
            byte_out <= fifo[rd_ptr];
            rd_ptr <= rd_ptr + 1;

            if (rd_ptr + 1 == wr_ptr)
                empty <= 1;
        end
    end
end

endmodule
