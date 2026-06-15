module pctargetE(
    input [31:0] pcE,
    input [31:0] immextE,

    output [31:0] pctargetE
);

assign pctargetE = pcE + immextE;

endmodule
