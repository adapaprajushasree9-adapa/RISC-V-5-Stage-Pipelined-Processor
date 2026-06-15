`timescale 1ns/1ps
module top_module_tb;
reg clk;
reg rst;

wire [31:0] resultW;

topmodule dut(.clk(clk),.rst(rst),.resultW(resultW));

always #5 clk = ~clk;

initial
begin
    $dumpfile("waveform.vcd");
    $dumpvars(0,top_module_tb);
    $monitor(
        $time,
        " pc=%h instr=%h x1=%d x2=%d x3=%d",
        dut.pcF,
        dut.instrD,
        dut.rf.rf[1],
        dut.rf.rf[2],
        dut.rf.rf[3]
    );
  
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #600 $finish;
end
endmodule                   
