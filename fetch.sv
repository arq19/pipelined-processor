module fetch #(parameter N = 64)
				(input logic PCSrc_F, clk, reset,
				 input logic [N-1:0] PCBranch_F,
				output logic [N-1:0] imem_addr_F);

				 
	logic [N-1:0] ADDER_OUT, MUX_OUT, PC_OUT;
	
	mux2  #N MUX(ADDER_OUT, PCBranch_F, PCSrc_F, MUX_OUT);
	flopr #N PC(MUX_OUT, clk, reset, PC_OUT);
	adder #N ADD(PC_OUT, {{(N-3){1'b0}}, 3'd4}, ADDER_OUT);
	assign imem_addr_F = PC_OUT;
	
//	always @(negedge clk)
//		$display("A_OUT = %h, MUX_OUT = %h, PC_OUT =%h)", ADDER_OUT, MUX_OUT, PC_OUT);
	
endmodule
