module alu #(parameter N = 64)
			 (input logic [N-1:0] a, b,
			  input logic  [3:0] ALUControl,
			 output logic [N-1:0] result,
			 output logic zero);

	logic [N-1:0] res;
	
	always_comb begin
		case(ALUControl)
			4'b0000: res = a & b;
			4'b0001: res = a | b;
			4'b0010: res = a + b;
			4'b0110: res = a - b;
			4'b0111: res = b;
			4'b1100: res = ~(a | b);
			default: res = a;
		endcase
		
		result = res;
		zero = ~|res;
	end
		
endmodule