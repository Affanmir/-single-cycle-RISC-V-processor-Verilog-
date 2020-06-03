module Instruction_parser(
    input [31:0] instruction,
	output reg [6:0] opcode,
    output reg [4:0] RD,
	output reg [2:0] funct3,
    output reg [4:0] RS1,
	output reg [4:0] RS2,
    output reg [6:0] funct7
);


 always@(*)
begin	
	assign opcode = instruction [6:0];
	assign RD = instruction [11:7];
	assign funct3 = instruction [14:12];
	assign RS2 = instruction [19:15];
	assign RS1 = instruction [24:20];
	assign funct7 = instruction[31:25] ;
end

endmodule