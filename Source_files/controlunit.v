module controlunit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,

    output regwriteD,
    output [1:0] resultsrcD,
    output memwriteD,
    output jumpD,
    output branchD,
    output [3:0] alucntrlD,
    output alusrcD,
    output [2:0] immsrcD
);
wire [1:0] aluopD;

alu_decoder ad(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .aluopD(aluopD),
    .alucntrlD(alucntrlD)
);

maindecoder md(
    .opcode(opcode),
    .regwriteD(regwriteD),
    .jumpD(jumpD),
    .branchD(branchD),
    .immsrcD(immsrcD),
    .alusrcD(alusrcD),
    .aluopD(aluopD),
    .memwriteD(memwriteD),
    .resultsrcD(resultsrcD)
);

endmodule
