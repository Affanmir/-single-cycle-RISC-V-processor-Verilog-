module registerFile(

input RegWrite,reset,clk,
input [63:0] WriteData,
input [4:0] RS1,
input[4:0] RS2,
input [4:0] RD ,
output reg [63:0] ReadData1, reg [63:0] ReadData2

);

reg[63:0] Array[31:0] ;


always @(RS1 or RS2 or reset)
begin
	
	
	 if(reset)
	
	begin
	Array[0]=64'd0;
		Array[1]=64'd0;
		Array[2]=64'd0;
		Array[3]=64'd0;
		Array[4]=64'd0;
		Array[5]=64'd0;
		Array[6]=64'd0;
		Array[7]=64'd0;
		Array[8]=64'd0;
		Array[9]=64'd0;
		
		Array[10]=64'd0;
		Array[11]=64'd0;
		Array[12]=64'd0;
		Array[13]=64'd0;
		Array[14]=64'd0;
		Array[15]=64'd0;
		Array[16]=64'd0;
		Array[17]=64'd0;
		Array[18]=64'd0;
		Array[19]=64'd0;
		
		Array[20]=64'd0;
		Array[21]=64'd0;
		Array[22]=64'd0;
		Array[23]=64'd0;
		Array[24]=64'd0;
		Array[25]=64'd0;
		Array[26]=64'd0;
		Array[27]=64'd0;
		Array[28]=64'd0;
		Array[29]=64'd0;
		Array[30]=64'd0;
		Array[31]=64'd0;
	end
	else
	begin
	ReadData1 =  Array[RS1];
    ReadData2 =  Array[RS2];
	end
	
end

always @(posedge clk)
begin
	if  (RegWrite)
	
		Array[RD] = WriteData;
	
	
end
	


	initial
	begin
		Array[0]=64'd0;
		Array[1]=64'd0;
		Array[2]=64'd0;
		Array[3]=64'd0;
		Array[4]=64'd0;
		Array[5]=64'd0;
		Array[6]=64'd0;
		Array[7]=64'd0;
		Array[8]=64'd22;
		Array[9]=64'd21;
		
		Array[10]=64'd22;
		Array[11]=64'd0;
		Array[12]=64'd0;
		Array[13]=64'd0;
		Array[14]=64'd0;
		Array[15]=64'd0;
		Array[16]=64'd0;
		Array[17]=64'd0;
		Array[18]=64'd0;
		Array[19]=64'd0;
		
		Array[20]=64'd0;
		Array[21]=64'd0;
		Array[22]=64'd0;
		Array[23]=64'd0;
		Array[24]=64'd0;
		Array[25]=64'd0;
		Array[26]=64'd0;
		Array[27]=64'd0;
		Array[28]=64'd0;
		Array[29]=64'd0;
		Array[30]=64'd0;
		Array[31]=64'd0;
		
		
	end
endmodule