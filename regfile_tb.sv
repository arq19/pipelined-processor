module regfile_tb();
	integer i;
	logic clk, we3;
	logic [4:0] ra1, ra2, wa3;
	logic [63:0] wd3;
	logic [63:0] rd1, rd2;
	
	regfile dut(clk, we3, ra1, ra2, wa3, wd3, rd1, rd2);
	
	always #5 clk = !clk;
//	
//	always @(posedge clk) begin
//		if (ra1 == 31) $stop;
//		ra1++;
//	end
	
	initial begin
		clk = 0; we3 = 0; wa3 = 0;
		
		for(i = 0; i < 32; i = i + 2) begin
			ra1 = i; ra2 = i + 1; #10;
		end
		
		wd3 = 64'h0123_4567_89AB_CDEF; 
		we3 = 1; wa3 = 4; #10;
		ra1 = 4; #10;
		
		wd3 = 64'hFEDC_BA98_7654_3210; 
		we3 = 0; wa3 = 4; #10;
		ra1 = 4; #10;
		
		we3 = 1; wa3 = 31; #10;
		ra1 = 31; #10;
		
		$stop;
	end
	
endmodule
