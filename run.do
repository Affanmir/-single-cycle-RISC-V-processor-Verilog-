#compiling design modules
vlog Adder.v ALU_Control.v alux64.v Control_Unit.v Data_Memory.v IMD.v Instruction_Memory.v IP.v MUX.v PC.v regfile.v top.v tb.v 
#no optimization
vsim -novopt work.tb

#view waves
view wave

#Adding waves
add wave -r /*
run 500ns