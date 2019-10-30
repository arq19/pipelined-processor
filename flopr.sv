module flopr #(parameter N = 64)
	(input logic [N-1:0] d,
	 input logic clk, reset,
	output logic [N-1:0] q);
	
	always_ff @(posedge clk, posedge reset)
		if (reset) q <= '0;
		else q <= d;
		
endmodule
