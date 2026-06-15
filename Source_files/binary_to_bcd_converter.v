module binary_to_bcd(
    input [31:0] binary,

    output [3:0] ones,
    output [3:0] tens,
    output [3:0] hundreds,
    output [3:0] thousands

);

assign ones = (binary % 10);
assign tens = (binary / 10) % 10;
assign hundreds = (binary /100) % 10;
assign thousands = (binary / 1000) % 10;

endmodule
