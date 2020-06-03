module Data_Memory(
input clk,MemWrite,MemRead,[63:0] Mem_Addr,[63:0] WriteData,
output reg [63:0] Read_Data
);
reg[7:0] Array[63:0] ;
integer i;

always @(posedge clk) begin
    if (MemWrite) begin
		Array[Mem_Addr] = WriteData[7:0];
		Array[Mem_Addr+1] = WriteData[15:8];
		Array[Mem_Addr+2] = WriteData[23:16];
		Array[Mem_Addr+3] = WriteData[31:24];
		Array[Mem_Addr+4] = WriteData[39:32];
		Array[Mem_Addr+5] = WriteData[47:40];
		Array[Mem_Addr+6] = WriteData[55:48];
		Array[Mem_Addr+7] = WriteData[63:56];
		end
end

always @( *)
begin
if (MemRead) begin
        Read_Data = {Array[Mem_Addr+7], Array[Mem_Addr+6], Array[Mem_Addr+5], Array[Mem_Addr+4],Array[Mem_Addr+3], Array[Mem_Addr+2],Array[Mem_Addr+1],Array[Mem_Addr]};
    end
end

initial begin
for (i=0 ;i<64 ; i = i + 1) begin
    Array[i] <= i;
end
end

endmodule