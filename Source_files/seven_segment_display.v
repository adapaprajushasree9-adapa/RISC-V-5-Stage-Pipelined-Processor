module seven_segment(
    input clk,
    input rst,

    input [3:0] thousands,
    input [3:0] hundreds,
    input [3:0] tens,
    input [3:0] ones,

    output reg [6:0] seg,
    output reg [3:0] an
);

reg [1:0] refresh_counter;
reg [3:0] digit;

reg [19:0] refresh_clk;

always @(posedge clk or posedge rst)
begin
    if(rst)
       refresh_clk <= 0;
    else
       refresh_clk <= refresh_clk + 1;
end

always @(*)
begin
    refresh_counter = refresh_clk[19:18];
end

always @(*)
begin
    case(refresh_counter)

    2'b00:
    begin
        an = 4'b1110;
        digit = ones;
    end

    2'b01:
    begin
        an = 4'b1101;
        digit = tens;
    end

    2'b10:
    begin
        an = 4'b1011;
        digit = hundreds;
    end

    2'b11:
    begin
        an = 4'b0111;
        digit = thousands;
    end

    endcase
end

always @(*)
begin

    case(digit)

     4'd0: seg = 7'b1000000;
    4'd1: seg = 7'b1111001;
    4'd2: seg = 7'b0100100;
    4'd3: seg = 7'b0110000;
    4'd4: seg = 7'b0011001;
    4'd5: seg = 7'b0010010;
    4'd6: seg = 7'b0000010;
    4'd7: seg = 7'b1111000;
    4'd8: seg = 7'b0000000;
    4'd9: seg = 7'b0010000;

    default: seg = 7'b1111111;

    endcase

end

endmodule
 