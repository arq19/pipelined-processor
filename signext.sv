module signext(input logic [31:0] a,
				  output logic [63:0] y); 
				  
	logic [10:0] opcode;

	always_comb begin
		opcode = a[31:21];
		casez(opcode)
			11'b101_1010_0???: y = {{46{a[23]}}, a[22: 5]};
			11'b111_1100_00?0: y = {{56{a[20]}}, a[19:12]};
			default: y = '0;
		endcase
	end
endmodule