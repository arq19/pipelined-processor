module execute #(parameter N = 64)
					(input logic AluSrc,
					 input logic  [3:0] AluControl,
					 input logic [N-1:0] PC_E, signImm_E,
					 input logic [N-1:0] readData1_E, readData2_E,
					output logic [N-1:0] PCBranch_E, aluResult_E, writeData_E,
					output logic zero_E);
	
	logic [N-1:0] SHIFT_OUT, MUX_OUT;
	
	adder #N ADD(PC_E, SHIFT_OUT, PCBranch_E);
	sl2   #N LSHIFT2(signImm_E, SHIFT_OUT);
	alu   #N ALU(readData1_E, MUX_OUT, AluControl, aluResult_E, zero_E);
	mux2  #N MUX(readData2_E, signImm_E, AluSrc, MUX_OUT);
	assign writeData_E = readData2_E;
				  
endmodule
