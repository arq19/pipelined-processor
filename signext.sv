module signext(input logic [31:0] a,
				  output logic [63:0] y); 
				  
	logic [10:0] opcode;

	always_comb begin
		opcode = a[31:21];
		casez(opcode)
			11'b101_1010_????: y = {{46{a[23]}}, a[22: 5]}; // CBZ - CBNZ
			11'b111_1100_00?0: y = {{56{a[20]}}, a[19:12]}; // STUR - LDUR
			default: y = '0;
		endcase
	end
endmodule