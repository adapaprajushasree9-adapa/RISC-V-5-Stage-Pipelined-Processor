module hazardunit(
       input [4:0] rs1D,
       input [4:0] rs2D,

       input [4:0] rs2E,
       input [4:0] rs1E,
       input [4:0] rdE,

       input pcsrcE,
       input [1:0] resultsrcE,
       input [4:0] rdM,
       input regwriteM,
       input regwriteW,
       input [4:0] rdW,

       output reg stallF,
       output reg stallD,
       output reg flushD,
       output reg flushE,
       output reg [1:0] forwardAE,
       output reg [1:0] forwardBE
);

always @(*)
begin

    stallF   = 1'b0;
    stallD   = 1'b0;
    flushD   = 1'b0;
    flushE   = 1'b0;
    forwardAE = 2'b0;
    forwardBE = 2'b0;
    
    // forward A
    if (regwriteM && (rdM != 5'd0) && (rdM == rs1E))
    begin
        forwardAE = 2'b10;
    end

    else if(regwriteW && (rdW != 5'd0) && (rdW == rs1E))
    begin
        forwardAE = 2'b01;
    end
    
    //forward B
    if(regwriteM && (rdM != 5'd0) && (rdM == rs2E))
    begin
        forwardBE = 2'b10;
    end

    else if(regwriteW && (rdW != 5'd0) && (rdW == rs2E))
    begin
        forwardBE = 2'b01;
    end
    
    //load use stall
    if(resultsrcE[0] && (rdE != 5'd0) && ((rs1D == rdE) || (rs2D == rdE)))
    begin
        stallF = 1'b1;
        stallD = 1'b1;
        flushE = 1'b1;
    end

    if(pcsrcE)
    begin
        flushD = 1'b1;
        flushE = 1'b1;
    end

end
endmodule

