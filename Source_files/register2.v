module regID_E(
    input clk,
    input rst,
    input flushE,

    input regwriteD,
    input [1:0] resultsrcD,
    input memwriteD,
    input jumpD,
    input branchD,
    input [3:0] alucntrlD,
    input alusrcD,

    input [31:0] rd1D,
    input [31:0] rd2D,
    input [31:0] pcD,
    input [31:0] pcplus4D,
    input [31:0] immextD,

    input [4:0] rs1D,
    input [4:0] rs2D,
    input [4:0] rdD,
    input [2:0] funct3,
    
    output reg regwriteE,
    output reg [1:0] resultsrcE,
    output reg memwriteE,
    output reg jumpE,
    output reg branchE,
    output reg [3:0] alucntrlE,
    output reg alusrcE,

    output reg [31:0] rd1E,
    output reg [31:0] rd2E,
    output reg [31:0] pcE,
    output reg [31:0] pcplus4E,
    output reg [31:0] immextE,

    output reg [4:0] rs1E,
    output reg [4:0] rs2E,
    output reg [4:0] rdE,
    output reg [2:0] funct3E
  
);

always @(posedge clk)
begin
    if(rst || flushE)
    begin
         regwriteE     <= 0;
         resultsrcE    <= 2'b0;
         memwriteE     <= 0;
         jumpE         <= 0;
         branchE       <= 0;
         alucntrlE     <= 4'b0;
         alusrcE       <= 0;
         rd1E          <= 32'b0;
         rd2E          <= 32'b0;
         pcE           <= 32'b0;
         pcplus4E      <= 32'b0;
         immextE       <= 32'b0;
         rs1E          <= 5'b0;
         rs2E          <= 5'b0;
         rdE           <= 5'b0;
         funct3E       <= 2'b00;
    end

    else
    begin
         regwriteE     <= regwriteD;
         resultsrcE    <= resultsrcD;
         memwriteE     <= memwriteD;
         jumpE         <= jumpD;
         branchE       <= branchD;
         alucntrlE     <= alucntrlD;
         alusrcE       <= alusrcD;
         rd1E          <= rd1D;
         rd2E          <= rd2D;
         pcE           <= pcD;
         pcplus4E      <= pcplus4D;
         immextE       <= immextD;
         rs1E          <= rs1D;
         rs2E          <= rs2D;
         rdE           <= rdD;
         funct3E       <= funct3;
    end

end

endmodule


