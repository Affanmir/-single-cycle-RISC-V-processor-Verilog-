module Program_Counter (

input clk,reset,  [63:0] PC_IN,
output reg [63:0] PC_Out

);

reg [63:0] PC_value;
reg reset_force;


always @( posedge reset or posedge clk )
 begin
 if (reset || reset_force)
 begin
        PC_Out = 64'd0;
		reset_force<=0;
		end
	else if (PC_IN >= 16)
		PC_Out = 64'd0 ;
	else
	begin
		PC_Out = PC_IN;
	end
	

end


initial
begin
 PC_value = 64'b0000000000000000000000000000000000000000000000000000000000000000;
end
always @(negedge reset)
 reset_force <= 1;


endmodule