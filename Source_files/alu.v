module alu(
    input [3:0] alucntrlE,
    input [31:0] srcAE,
    input [31:0] srcBE,
    
    output zero,
    output lt,
    output ltu,
    output reg [31:0] aluresultE
);

always @(*)
begin
    case(alucntrlE)

    4'd0 : aluresultE = srcAE + srcBE;                     // ADD
    4'd1 : aluresultE = srcAE - srcBE;                     // SUB
    4'd2 : aluresultE = srcAE & srcBE;                     // AND
    4'd3 : aluresultE = srcAE | srcBE;                     // OR
    4'd4 : aluresultE = srcAE ^ srcBE;                     // XOR
    4'd5 : aluresultE = ($signed(srcAE) < $signed(srcBE)) ? 32'd1 : 32'd0; // SLT
    4'd6 : aluresultE = srcAE << srcBE[4:0];              // SLL
    4'd7 : aluresultE = srcAE >> srcBE[4:0];              // SRL
    4'd8 : aluresultE = $signed(srcAE) >>> srcBE[4:0];    // SRA
    4'd9 : aluresultE = (srcAE < srcBE) ? 32'd1 : 32'd0;                  // SLTU
    4'd10 : aluresultE = srcBE;
    
    default : aluresultE = 32'b0;

    endcase
end

assign zero = (aluresultE == 32'b0);
assign lt   = ($signed(srcAE) < $signed(srcBE));
assign ltu  = (srcAE < srcBE);

endmodule