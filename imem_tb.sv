module imem_tb();
	localparam N = 32;
	logic [5:0] naddr;
	logic [N-1:0] q;
	logic clk;
	
	imem dut(naddr, q);

	always #5 clk = !clk;
	
	always @(posedge clk) begin
		naddr = naddr + 1;
		if (naddr === 25) $stop;
	end
	
	initial begin
		clk = 0; naddr = 0;
	end
	
endmodule
