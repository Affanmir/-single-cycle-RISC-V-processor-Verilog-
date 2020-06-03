module alux64
(
    input [63:0] a,
	input [63:0]b,
    input [3:0]aluop,
	output reg Zero,
    output reg [63:0]aluout
	
);



always @(*)
begin
case (aluop)
	4'b0000 :  aluout = a & b;
	4'b0001 :   aluout = a | b;
	4'b0010 :     aluout = a + b;
	4'b0110:    aluout = a - b;
	4'b1100:    aluout = ~(a | b);
    
endcase
	if (aluout == 64'd0)
        assign Zero = 1'b1;
    else
      assign  Zero = 1'b0;
end



endmodule

