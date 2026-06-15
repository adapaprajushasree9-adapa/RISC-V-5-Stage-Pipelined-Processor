module final(
    input clk,
    input reset,

    output [6:0] seg,
    output [3:0] an
);

wire slowclk;
wire [31:0] resultW;

wire [31:0] fib_value;

wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;
wire [3:0] thousands;



clk_divider cd(
    .clk(clk),
    .rst(reset),
    .clkout(slowclk)
);

topmodule tm(
    .clk(slowclk),
    .rst(reset),
    .resultW(resultW),
    .fib_value(fib_value)
);

binary_to_bcd bb(
    .binary(fib_value),
    .ones(ones),
    .tens(tens),
    .hundreds(hundreds),
    .thousands(thousands)
);

seven_segment ssd(
    .clk(clk),
    .rst(reset),
    .ones(ones),
    .tens(tens),
    .hundreds(hundreds),
    .thousands(thousands),
    .seg(seg),
    .an(an)

);

endmodule
