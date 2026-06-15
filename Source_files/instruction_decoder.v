module instruction_decoder(
    input [31:0] instrD,
    
    output  [4:0] rs1D,
    output  [4:0] rs2D,
    output  [4:0] rdD,
    output  [6:0] opcode,
    output  [6:0] funct7,
    output  [2:0] funct3
);
//a1=rs1D,a2=rs2D,a3=rdD

    assign rs1D = instrD[19:15];
    assign rs2D = instrD[24:20];
    assign rdD = instrD[11:7];
    assign opcode = instrD[6:0];
    assign funct3 = instrD[14:12];
    assign funct7 = instrD[31:25];

endmodule