module pc(
    input clk,
    input rst,
    input stallF,
    input [31:0] pcnext,

    output reg [31:0] pcF
);

always @(posedge clk or posedge rst)
begin
    if(rst)
        pcF <= 32'b0;

    else    
       pcF <= (stallF) ? pcF : pcnext;

end

endmodule

