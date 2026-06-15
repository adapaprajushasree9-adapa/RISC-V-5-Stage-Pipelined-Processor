module clk_divider(
    input clk,
    input rst,

    output reg clkout
);

reg [26:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 27'd0;
        clkout <= 0;
    end
    else
    begin
        if(count == 5_000_000)
        begin 
            count <= 0;
            clkout <= ~clkout;
        end

        else
          count <= count + 1;
    end
end

endmodule
