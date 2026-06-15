 module maindecoder(
    input [6:0] opcode,

    output reg regwriteD,
    output reg alusrcD,
    output reg jumpD,
    output reg branchD,
    output reg [2:0] immsrcD,
    output reg [1:0] aluopD,
    output reg [1:0] resultsrcD,
    output reg memwriteD
);

always @(*)
begin

    regwriteD  = 1'b0;
    alusrcD    = 1'b0;
    jumpD      = 1'b0;
    branchD    = 1'b0;
    immsrcD    = 3'b000;
    aluopD     = 2'b00;
    resultsrcD = 2'b00;
    memwriteD  = 1'b0;

    case(opcode)

        // R-Type
        7'b0110011:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b0;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            aluopD     = 2'b10;
            resultsrcD = 2'b00;
            memwriteD  = 1'b0;
            immsrcD    = 3'b000;
        end

        // I-Type ALU
        7'b0010011:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b1;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            immsrcD    = 3'b000;
            aluopD     = 2'b10;
            resultsrcD = 2'b00;
            memwriteD  = 1'b0;
        end

        // LOAD
        7'b0000011:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b1;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            immsrcD    = 3'b000;
            aluopD     = 2'b00;
            resultsrcD = 2'b01;
            memwriteD  = 1'b0;
        end

        // STORE
        7'b0100011:
        begin
            regwriteD  = 1'b0;
            alusrcD    = 1'b1;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            immsrcD    = 3'b001;
            aluopD     = 2'b00;
            resultsrcD = 2'b00;
            memwriteD  = 1'b1;
        end

        // BRANCH
        7'b1100011:
        begin
            regwriteD  = 1'b0;
            alusrcD    = 1'b0;
            jumpD      = 1'b0;
            branchD    = 1'b1;
            immsrcD    = 3'b010;
            aluopD     = 2'b01;
            resultsrcD = 2'b00;
            memwriteD  = 1'b0;

        end

        // JAL
        7'b1101111:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b0;
            jumpD      = 1'b1;
            branchD    = 1'b0;
            immsrcD    = 3'b011;
            aluopD     = 2'b00;
            resultsrcD = 2'b10;
            memwriteD  = 1'b0;
        end

        // JALR
        7'b1100111:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b1;
            jumpD      = 1'b1;
            branchD    = 1'b0;
            immsrcD    = 3'b000;
            aluopD     = 2'b00;
            resultsrcD = 2'b10;
            memwriteD  = 1'b0;
        end

        // LUI
        7'b0110111:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b1;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            immsrcD    = 3'b100;
            aluopD     = 2'b00;
            resultsrcD = 2'b00;
            memwriteD  = 1'b0;
        end

        // AUIPC
        7'b0010111:
        begin
            regwriteD  = 1'b1;
            alusrcD    = 1'b1;
            jumpD      = 1'b0;
            branchD    = 1'b0;
            immsrcD    = 3'b100;
            aluopD     = 2'b00;
            resultsrcD = 2'b00;
            memwriteD  = 1'b0;
        end

    endcase

end

endmodule
     
           
            
               
               





