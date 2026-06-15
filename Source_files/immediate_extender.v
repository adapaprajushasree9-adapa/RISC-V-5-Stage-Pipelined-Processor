module immediate_extender(
    input [2:0] immsrcD,
    input [31:0] instrD,

    output reg [31:0] immextD
);
always @(*)
begin
    case(immsrcD)
    
    3'b000: immextD = {{20{instrD[31]}}, instrD[31:20]};   //I TYPE
    3'b001: immextD = {{20{instrD[31]}}, instrD[31:25], instrD[11:7]};  //S TYPE
    3'b010: immextD = {{19{instrD[31]}},instrD[31],instrD[7],instrD[30:25],instrD[11:8],1'b0};  //B TYPE
    3'b011: immextD = {{12{instrD[31]}},instrD[31],instrD[19:12],instrD[20],instrD[30:21],1'b0};  //J TYPE
    3'b100: immextD = {instrD[31:12],12'b0}; //U TYPE
    default: immextD = 32'b0;

    endcase
end
endmodule
