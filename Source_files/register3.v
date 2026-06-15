
module regE_M(
    input clk,
    input rst,

    input regwriteE,
    input [1:0] resultsrcE,
    input memwriteE,
    input [31:0] aluresultE,
    input [31:0] writedataE,
    input [4:0] rdE,
    input  [31:0] pcplus4E,

    output reg regwriteM,
    output reg [1:0] resultsrcM,
    output reg memwriteM,
    output reg [31:0] aluresultM,
    output reg [31:0] writedataM,
    output reg [4:0] rdM,
    output reg [31:0] pcplus4M

);

always @(posedge clk)
begin

    if(rst)
    begin
        regwriteM    <= 0;
        resultsrcM   <= 2'b0;
        memwriteM    <= 0;
        aluresultM   <= 32'b0;
        writedataM   <= 32'b0;
        rdM          <= 5'b0;
        pcplus4M     <= 32'b0;

    end

    else
    begin
        regwriteM    <= regwriteE;
        resultsrcM   <= resultsrcE;
        memwriteM    <= memwriteE;
        aluresultM   <= aluresultE;
        writedataM   <= writedataE;
        rdM          <= rdE;
        pcplus4M     <= pcplus4E;

    end

end

endmodule
