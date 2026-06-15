module regM_W(
    input clk,
    input rst,

    input regwriteM,
    input [1:0] resultsrcM,
    input [31:0] aluresultM,
    input [31:0] readdataM,
    input [4:0] rdM,
    input [31:0] pcplus4M,
    
    output reg regwriteW,
    output reg [1:0] resultsrcW,
    output reg [31:0] aluresultW,
    output reg [31:0] readdataW,
    output reg [4:0] rdW,
    output reg [31:0] pcplus4W

);

always @(posedge clk)
begin

    if(rst)
    begin

        regwriteW   <= 0;
        resultsrcW  <= 0;
        aluresultW  <= 32'b0;
        readdataW   <= 32'b0;
        rdW         <= 5'b0;
        pcplus4W    <= 32'b0;

    end

    else
    begin

        regwriteW   <= regwriteM;
        resultsrcW  <= resultsrcM;
        aluresultW  <= aluresultM;
        readdataW   <= readdataM;
        rdW         <= rdM;
        pcplus4W    <= pcplus4M;

    end

end

endmodule


    
