module tb 
( 
); 
 
 
reg clk; 
reg reset; 
 
top single_cycle_processor 
( 
 
    .clk(clk), 
    .reset(reset) 
  
); 
   
initial 
 
 begin 
  
  clk = 1'b0; 
   
  reset = 1'b1; 
   
  #10 reset = 1'b0; 
 end 
  
  
always  
 
 #5 clk = ~clk; 
  
  
endmodule