module UniShiftReg(clk,clr,fn,q,lin,rin,parin);
    input [1:0]fn;
    input lin,rin,clk,clr;
    parameter N = 5;
    input [N-1:0]parin;
    output reg [N-1:0]q;
    parameter Hold = 2'b00, RShift=2'b01,LShift=2'b10,Load=2'b11;
    always @(posedge clk or posedge clr)
        if(clr)
            q<=0;
        else
            case (fn)
                Hold: ;
                RShift: q<={q[N-2:0],rin};
                LShift: q<={lin,q[N-1:1]};
                Load: q<=parin;
            endcase
endmodule