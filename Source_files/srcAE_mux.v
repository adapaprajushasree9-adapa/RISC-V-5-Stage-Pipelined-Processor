module srcae_mux(
    input [31:0] rd1E,
    input [1:0] forwardAE,
    input [31:0] resultW,
    input [31:0] aluresultM,

    output reg [31:0] srcAE
);

always @(*)
begin
    case(forwardAE)

    2'b00 : srcAE = rd1E;
    2'b01 : srcAE = resultW;
    2'b10 : srcAE = aluresultM;

    default : srcAE = 32'b0;

    endcase
end
endmodule
