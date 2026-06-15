module writedataE(
    input [31:0] rd2E,
    input [31:0] resultW,
    input [31:0] aluresultM,
    input [1:0] forwardBE,

    output  reg [31:0] writedataE
);

always @(*)
begin

    case(forwardBE)

    2'b00 : writedataE = rd2E;
    2'b01 : writedataE = resultW;
    2'b10 : writedataE = aluresultM;

    default : writedataE = 32'b0;

    endcase

end
endmodule

