module resultW_mux(
    input [1:0] resultsrcW,
    input [31:0] aluresultW,
    input [31:0] readdataW,
    input [31:0] pcplus4W,

    output  reg [31:0] resultW
);

always @(*)
begin

    case(resultsrcW)

    2'b00 : resultW = aluresultW;
    2'b01 : resultW = readdataW;
    2'b10 : resultW = pcplus4W;

    default : resultW = 32'b0;

    endcase

end

endmodule
