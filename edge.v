module jk_ff (q,j,k,clk);  
   input j,k,clk;
   output reg q;
   always @ (posedge clk)  
      case ({j,k})  
         2'b00 :  q <= q;  
         2'b01 :  q <= 0;  
         2'b10 :  q <= 1;  
         2'b11 :  q <= ~q;  
      endcase  
endmodule  

module EdgeDetector(e,pose,nege,in,clk);
    input in,clk;
    output e,pose,nege;
    wire inbar,q;
    jk_ff jk1(q,in,~in,clk);
    xor x1(e,in,q);
    and a1(pose,in,~q);
    and a2(nege,~in,q);
endmodule