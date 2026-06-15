
module topmodule(
    input clk,
    input rst,

    output [31:0] resultW,
    output [31:0] fib_value
);

wire pcsrcE;
wire [31:0] pcnext;
wire [31:0] pctargetE;
wire [31:0] pcplus4F;

pcmux pcmux_inst(
    .pcnext(pcnext),
    .pctargetE(pctargetE),
    .pcplus4F(pcplus4F),
    .pcsrcE(pcsrcE)
);

wire stallF;
wire [31:0] pcF;

pc pc_inst(
    .pcF(pcF),
    .stallF(stallF),
    .clk(clk),
    .rst(rst),
    .pcnext(pcnext)
);


pcplus4F pc4_inst(
    .pcF(pcF),
    .pcplus4F(pcplus4F)
);

wire [31:0] pcE;
wire [31:0] immextE;

pctargetE pct_inst(
    .pcE(pcE),
    .pctargetE(pctargetE),
    .immextE(immextE)
);

wire [31:0] instr;


instrmem imem(
    .pcF(pcF),
    .instr(instr)
);

wire stallD;
wire flushD;
wire [31:0] instrD;
wire [31:0] pcD;
wire [31:0] pcplus4D;

regIF_ID if_id_reg(
    .clk(clk),
    .rst(rst),
    .instr(instr),
    .pcF(pcF),
    .pcplus4F(pcplus4F),
    .stallD(stallD),
    .flushD(flushD),
    .instrD(instrD),
    .pcD(pcD),
    .pcplus4D(pcplus4D)
);


wire [6:0] opcode;
wire [6:0] funct7;
wire [2:0] funct3;
wire [4:0] rs1D;
wire [4:0] rs2D;
wire [4:0] rdD;

instruction_decoder idec(
    .instrD(instrD),
    .rs1D(rs1D),
    .rs2D(rs2D),
    .rdD(rdD),
    .opcode(opcode),
    .funct7(funct7),
    .funct3(funct3)
);


wire regwriteW;
wire [31:0] resultW;


registerfile rf(
    .clk(clk),
    .rs1D(rs1D),
    .rs2D(rs2D),
    .rdW(rdW),
    .we3(regwriteW),
    .wd3(resultW),
    .rd1(rd1D),
    .rd2(rd2D)
);

wire [2:0] immsrcD;
wire [31:0] immextD;

immediate_extender immext_inst(
    .immsrcD(immsrcD),
    .immextD(immextD),
    .instrD(instrD)
);

wire flushE;
wire regwriteD;
wire memwriteD;
wire jumpD;
wire branchD;
wire [3:0] alucntrlD;
wire alusrcD;
wire regwriteE;
wire [1:0] resultsrcD;
wire memwriteE;
wire jumpE;
wire branchE;
wire [3:0] alucntrlE;
wire alusrcE;
wire [31:0] rd1E;
wire [31:0] rd2E;
wire [31:0] rd1D,rd2D;
wire [1:0] resultsrcE;
wire [31:0] writedataE;

wire [31:0] pcplus4E;
wire [4:0] rs1E,rs2E,rdE;

wire [2:0] funct3E;

regID_E id_ex_reg(
    .clk(clk),
    .rst(rst),
    .flushE(flushE),

    .regwriteD(regwriteD),
    .resultsrcD(resultsrcD),
    .memwriteD(memwriteD),
    .jumpD(jumpD),
    .branchD(branchD),
    .alucntrlD(alucntrlD),
    .alusrcD(alusrcD),

    .rd1D(rd1D),
    .rd2D(rd2D),
    .pcD(pcD),
    .pcplus4D(pcplus4D),
    .immextD(immextD),

    .rs1D(rs1D),
    .rs2D(rs2D),
    .rdD(rdD),
    .funct3(funct3),

    .regwriteE(regwriteE),
    .resultsrcE(resultsrcE),
    .memwriteE(memwriteE),
    .jumpE(jumpE),
    .branchE(branchE),
    .alucntrlE(alucntrlE),
    .alusrcE(alusrcE),

    .rd1E(rd1E),
    .rd2E(rd2E),
    .pcE(pcE),
    .pcplus4E(pcplus4E),
    .immextE(immextE),

    .rs1E(rs1E),
    .rs2E(rs2E),
    .rdE(rdE),
    .funct3E(funct3E)
);

controlunit cu(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .regwriteD(regwriteD),
    .resultsrcD(resultsrcD),
    .jumpD(jumpD),
    .branchD(branchD),
    .alucntrlD(alucntrlD),
    .alusrcD(alusrcD),
    .immsrcD(immsrcD),
    .memwriteD(memwriteD)
);

wire [31:0] aluresultM;
wire [31:0] srcAE;
wire [1:0] forwardAE;

srcae_mux ae(
    .rd1E(rd1E),
    .aluresultM(aluresultM),
    .srcAE(srcAE),
    .forwardAE(forwardAE),
    .resultW(resultW)

);

wire [1:0] forwardBE;

writedataE wde(
    .rd2E(rd2E),
    .aluresultM(aluresultM),
    .resultW(resultW),
    .forwardBE(forwardBE),
    .writedataE(writedataE)
);

wire [31:0] srcBE;

srcBE_mux bemux(
    .alusrcE(alusrcE),
    .srcBE(srcBE),
    .writedataE(writedataE),
    .immextE(immextE)
);

wire lt;
wire ltu;
wire zero;
wire [31:0] aluresultE;

alu alu_inst(
    .alucntrlE(alucntrlE),
    .srcAE(srcAE),
    .srcBE(srcBE),
    .aluresultE(aluresultE),
    .zero(zero),
    .lt(lt),
    .ltu(ltu)
);

wire [31:0] writedataM;
wire [4:0] rdM;
wire [31:0] pcplus4M;
wire [1:0] resultsrcM;
wire regwriteM;
wire memwriteM;

regE_M em_reg(
    .clk(clk),
    .rst(rst),
    .regwriteE(regwriteE),
    .resultsrcE(resultsrcE),
    .memwriteE(memwriteE),
    .aluresultE(aluresultE),
    .aluresultM(aluresultM),
    .writedataM(writedataM),
    .rdM(rdM),
    .pcplus4M(pcplus4M),
    .rdE(rdE),
    .writedataE(writedataE),
    .pcplus4E(pcplus4E),
    .regwriteM(regwriteM),
    .resultsrcM(resultsrcM),
    .memwriteM(memwriteM)
);

wire [31:0] readdataM;

datamem dm_inst(
    .clk(clk),
    .we(memwriteM),
    .a(aluresultM),
    .wd(writedataM),
    .readdataM(readdataM)
);

wire [1:0] resultsrcW;
wire [31:0] aluresultW;
wire [31:0] readdataW;
wire [4:0] rdW;
wire [31:0] pcplus4W;


regM_W mw(
    .clk(clk),
    .rst(rst),
    .regwriteM(regwriteM),
    .resultsrcM(resultsrcM),
    .aluresultM(aluresultM),
    .readdataM(readdataM),
    .rdM(rdM),
    .pcplus4M(pcplus4M),
    .regwriteW(regwriteW),
    .resultsrcW(resultsrcW),
    .aluresultW(aluresultW),
    .readdataW(readdataW),
    .rdW(rdW),
    .pcplus4W(pcplus4W)

);

resultW_mux rwmux(
    .aluresultW(aluresultW),
    .readdataW(readdataW),
    .pcplus4W(pcplus4W),
    .resultsrcW(resultsrcW),
    .resultW(resultW)
);


hazardunit hdu(
    .stallF(stallF),
    .stallD(stallD),
    .flushD(flushD),
    .rs1D(rs1D),
    .rs2D(rs2D),
    .flushE(flushE),
    .rdE(rdE),
    .rs2E(rs2E),
    .rs1E(rs1E),
    .pcsrcE(pcsrcE),
    .forwardAE(forwardAE),
    .forwardBE(forwardBE),
    .resultsrcE(resultsrcE),
    .rdM(rdM),
    .regwriteM(regwriteM),
    .rdW(rdW),
    .regwriteW(regwriteW)
);
wire takebranch;

assign takebranch =
       (funct3E == 3'b000) ?  zero :     // BEQ
       (funct3E == 3'b001) ? ~zero :     // BNE
       (funct3E == 3'b100) ?  lt   :     // BLT
       (funct3E == 3'b101) ? ~lt   :     // BGE
       (funct3E == 3'b110) ?  ltu  :     // BLTU
       (funct3E == 3'b111) ? ~ltu  :     // BGEU
       1'b0;
assign pcsrcE = (takebranch & branchE) | jumpE;

assign fib_value = rf.rf[1];

endmodule








