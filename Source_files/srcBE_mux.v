module srcBE_mux(
    input [31:0] writedataE,
    input [31:0] immextE,
    input alusrcE,

    output  [31:0] srcBE
);
assign srcBE = alusrcE ? immextE : writedataE;

endmodule
