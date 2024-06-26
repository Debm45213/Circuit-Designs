// `timescale 10ns/1ns
`include "ucontroller.v"
module MCU_tb;
    reg clk;
    reg rst;
    MicroController uut 
    (
        .clk(clk), 
        .rst(rst)
    );
    always #(20) clk=~clk;
    initial 
    begin
        $dumpfile("UC_tb.vcd");
        $dumpvars(0, MCU_tb);
    end 
    initial 
        begin
            clk <= 1'b0;
            rst <= 1;
            #100;
            rst <= 0;
            #2000;
            $finish;
        end
endmodule 