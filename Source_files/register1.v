module regIF_ID(
    input clk,
    input rst,

    input [31:0] instr,
    input [31:0] pcF,
    input [31:0] pcplus4F,

    input stallD,
    input flushD,

    output reg [31:0] instrD,
    output reg [31:0] pcD,
    output reg [31:0] pcplus4D
);

always @(posedge clk)
begin
    if(rst || flushD)
    begin
        instrD   <= 32'b0;
        pcD      <= 32'b0;
        pcplus4D <= 32'b0;
    end
    
    else if(!stallD)
    begin
        instrD   <= instr;
        pcD      <= pcF;
        pcplus4D <= pcplus4F;
    end
    
    else
    begin
        instrD   <= instrD;
        pcD      <= pcD;
        pcplus4D <= pcplus4D;
    end

end

endmodule
