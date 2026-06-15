module pcmux(
    input [31:0] pcplus4F,
    input [31:0] pctargetE,
    input pcsrcE,

    output [31:0] pcnext
);

assign pcnext = pcsrcE ? pctargetE : pcplus4F;

endmodule
