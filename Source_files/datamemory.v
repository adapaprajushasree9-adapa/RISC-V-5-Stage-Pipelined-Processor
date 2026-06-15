module datamem(
    input clk,
    input we,   //memwriteM
    input [31:0] a,  //aluresultM
    input [31:0] wd,   //writedataM

    output  [31:0] readdataM

);

reg [31:0] dmem[0:31];

assign readdataM = dmem[a[31:2]];

always @(posedge clk)
begin

    if(we) 
        dmem[a[31:2]] <= wd;

end

endmodule
