module regfile(input logic clk, we3,
					input logic [4:0] ra1, ra2, wa3,
					input logic [63:0] wd3,
				  output logic [63:0] rd1, rd2);

	logic [63:0] regs [32] = '{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11,
									  12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
									  22, 23, 24, 25, 26, 27, 28, 29, 30, 0};

	always_ff @(posedge clk) begin
		if (we3 && wa3 !== 31)
			regs[wa3] <= wd3;
	end

	always_comb begin
		if (wa3 == ra1 && wa3 == ra2) begin
			rd1 = wd3;
			rd2 = wd3;
		end	else if (wa3 == ra1 && wa3 != ra2) begin
			rd1 = wd3;
			rd2 = regs[ra2];
		end else if (wa3 == ra2 && wa3 != ra1) begin
			rd1 = regs[ra1];
			rd2 = wd3;
		end else begin
			rd1 = regs[ra1];
			rd2 = regs[ra2];
		end
	end

endmodule
