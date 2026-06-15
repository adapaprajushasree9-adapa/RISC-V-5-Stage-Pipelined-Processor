module registerfile(
    input clk,
    input [4:0] rs1D,
    input [4:0] rs2D,
    input [4:0] rdW,
    input we3,         //regwriteW
    input  [31:0] wd3,  //resultW

    output  [31:0] rd1,
    output  [31:0] rd2     
);
reg [31:0] rf [31:0];

integer i;

initial begin
    for(i=0;i<32;i=i+1)
        rf[i] = 0;
end


assign rd1 =
    (we3 && rdW!=0 && rdW==rs1D) ? wd3 :
    (rs1D!=0) ? rf[rs1D] : 32'b0;

assign rd2 =
    (we3 && rdW!=0 && rdW==rs2D) ? wd3 :
    (rs2D!=0) ? rf[rs2D] : 32'b0;


always @(posedge clk)
begin
    if(we3 && rdW!=0)
    rf[rdW]<=wd3;
end
endmodule
