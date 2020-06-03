module top
( 
 
 input wire clk, 
 input wire reset 
 
); 
 
 
wire [63:0] Adder1_out; 
wire [63:0] PC_Out; 
 
wire [63:0] Adder2_out; 
 
wire [63:0] imm_data; 
 
 
wire Branch; 
wire MemRead; 
wire MemtoReg; 
wire [1:0] ALUOp; 
wire MemWrite; 
wire ALUSrc; 
wire RegWrite; 
 
wire [31:0] Instruction; 
 
wire [63:0] Result; 
 
 
wire Zero; 
wire [63:0] PC_In; 
 
 
wire [6:0] opcode; 
wire [4:0] rd; 
wire [2:0] funct3; 
wire [4:0] rs1; 
wire [4:0] rs2; 
wire [6:0] funct7; 
 
 
wire [63:0] ReadData1; 
wire [63:0] ReadData2; 
 
 
wire [63:0] mux2_out; 
 
 
wire [3:0] Operation; 

 
 
 
wire [63:0] Read_Data; 
 
wire [63:0] WriteData; 
 
 
 
 
 
Adder A1 
( 
 
    .a(PC_Out), 
    .b(64'd4), 
    .out(Adder1_out) 
  
); 
 
 
Adder A2 
( 
 
    .a(PC_Out), 
    .b(imm_data << 1),     //shift left 2 means multiplied by 2 
    .out(Adder2_out) 
  
); 
 
 
 
mux mux1 
( 
 
    .a(Adder1_out), 
    .b(Adder2_out), 
    .sel(Branch & Zero), 
    .out(PC_In) 
  
); 
 
 
Program_Counter PC 
( 
 
    .clk(clk), 
    .reset(reset), 
    .PC_IN(PC_In), 
    .PC_Out(PC_Out) 
  
); 
 
 
Instruction_Memory IM 
( 
 
    .Inst_Addr(PC_Out), 
    .Instruction(Instruction) 
  
); 
 
 
 
 
 
Instruction_parser IP 
( 
 
    .instruction(Instruction), 
    .opcode(opcode), 
    .RD(rd), 
    .funct3(funct3), 
    .RS1(rs1), 
    .RS2(rs2), 
    .funct7(funct7) 
  
); 
 
 
Control_Unit CU 
( 
 
    .Opcode(opcode), 
    .Branch(Branch), 
    .MemRead(MemRead), 
    .MemtoReg(MemtoReg), 
    .MemWrite(MemWrite), 
    .ALUSrc(ALUSrc), 
    .RegWrite(RegWrite), 
    .ALUOp(ALUOp) 
  
); 
 
 
IMD Immediate_Data 
( 
 
    .instruction(Instruction), 
    .imm_data(imm_data) 
  
); 
 
 
 
 
 
registerFile RF 
( 
 
    .WriteData(WriteData), 
    .RS1(rs1), 
    .RS2(rs2), 
    .RD(rd), 
    .ReadData1(ReadData1), 
    .ReadData2(ReadData2), 
    .clk(clk), 
    .reset(reset), 
    .RegWrite(RegWrite) 
  
); 
 
 
 
 
mux mux2 
( 
 
    .a(ReadData2), 
    .b(imm_data), 
    .sel(ALUSrc), 
    .out(mux2_out) 
  
); 
 

 
 
AlU_Control AC 
( 
 
    .ALUOp(ALUOp), 
    .Funct({Instruction[30],Instruction[14:12]}), 
    .Operation(Operation) 
  
); 
 
 
alux64  alu 
( 
 
    .a(ReadData1), 
    .b(mux2_out), 
    .aluop(Operation), 
    .aluout(Result), 
    .Zero(Zero) 
  
); 
 
 
 
 
Data_Memory DM 
( 
 
    .Mem_Addr(Result), 
    .WriteData(ReadData2), 
    .clk(clk), 
    .MemWrite(MemWrite), 
    .MemRead(MemRead), 
    .Read_Data(Read_Data) 
  
); 
 
 
mux mux3 
( 
   
    .b(Read_Data), 
    .a(Result), 
    .sel(MemtoReg), 
    .out(WriteData) 
  
); 
 endmodule