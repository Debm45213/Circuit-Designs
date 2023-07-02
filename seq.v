module SequenceDetector(in,out,clr,clk,seq);
    input in,clk,clr;
    input [2:0]seq;
    output out;
    reg [2:0]q;
    always @(posedge clk or posedge clr)
        if (clr) q<=3'b000;  
        else q<={q[1:0],in};
    assign out=(q==seq);
endmodule
