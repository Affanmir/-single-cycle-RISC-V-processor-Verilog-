module mux(
    input [63:0]a,
	input [63:0] b,
    input sel,
	output  reg [63:0]out
);
always@(*)
begin
assign out = sel ? b : a;
end

endmodule