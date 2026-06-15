module instrmem(
    input [31:0] pcF,

    output [31:0] instr

);

reg [31:0] mem[0:255];

initial
begin
mem[0] = 32'h00000093; // addi x1,x0,0
mem[1] = 32'h00100113; // addi x2,x0,1

mem[2] = 32'h002081b3; // add x3,x1,x2
mem[3] = 32'h00010093; // addi x1,x2,0
mem[4] = 32'h00018113; // addi x2,x3,0

mem[5] = 32'hff5ff06f; // jal x0,loop
end


assign  instr = mem[pcF[31:2]];

endmodule