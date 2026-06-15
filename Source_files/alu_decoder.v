module alu_decoder(
    input [1:0] aluopD,
    input [2:0] funct3,
    input [6:0] funct7,
    input [6:0] opcode,

    output reg [3:0] alucntrlD
);

always @(*) begin

    case(aluopD)

        // ADD operations
        2'b00: alucntrlD = 4'd0;

        // Branch instructions
        2'b01:
        begin
            case(funct3)

                3'b000,3'b001 : alucntrlD = 4'd1; // beq,bne
                3'b100,3'b101 : alucntrlD = 4'd5; // blt,bge
                3'b110,3'b111 : alucntrlD = 4'd9; // bltu,bgeu

                default : alucntrlD = 4'b0000;

            endcase
        end

        // R-Type / I-Type
        2'b10:
        begin
            case(funct3)

                // add/sub/addi
                3'b000:
                begin
                    if(opcode == 7'b0110011 && funct7 == 7'b0100000)
                        alucntrlD = 4'd1;   // sub
                    else
                        alucntrlD = 4'd0;   // add/addi
                end

                3'b001: alucntrlD = 4'd6;       // sll/slli
                3'b010: alucntrlD = 4'd5;       // slt/slti
                3'b011: alucntrlD = 4'd9;       // sltu/sltiu
                3'b100: alucntrlD = 4'd4;       // xor/xori
                3'b101:
                begin
                    if(funct7 == 7'b0100000)
                        alucntrlD = 4'd8;   // sra/srai
                    else
                        alucntrlD = 4'd7;   // srl/srli
                end

                3'b110: alucntrlD = 4'd3;       // or/ori
                3'b111: alucntrlD = 4'd2;       // and/andi

                default: alucntrlD = 4'd0;

            endcase
        end

        default: alucntrlD = 4'd0;

    endcase

end

endmodule

 