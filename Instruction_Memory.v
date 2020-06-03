module Instruction_Memory(

input [63:0] Inst_Addr,
output reg [31:0] Instruction

);

reg[7:0] Array[15:0] ;


always @(*)
begin
	
	assign Instruction = {Array[Inst_Addr+3] ,Array[Inst_Addr+2], Array[Inst_Addr+1],Array[Inst_Addr]} ;
end

initial
begin
	Array[0]  = 8'b10000011;
    Array[1]  = 8'b00110100;
    Array[2]  = 8'b10000101;
    Array[3]  = 8'b00000010;
    Array[4]  = 8'b10110011;
    Array[5]  = 8'b10000100;
    Array[6]  = 8'b10011010;
    Array[7]  = 8'b00000000;
    Array[8]  = 8'b10010011;
    Array[9]  = 8'b10000100;
    Array[10] = 8'b00010100;
    Array[11] = 8'b00000000;
    Array[12] = 8'b00100011;
    Array[13] = 8'b00110100;
    Array[14] = 8'b10010101;
    Array[15] = 8'b00000010;
end

endmodule