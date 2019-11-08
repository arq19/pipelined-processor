module maindec( input logic [10:0] Op,
					output logic Reg2Loc, ALUSrc,
					output logic MemtoReg, RegWrite, 
					output logic MemRead, MemWrite, Branch,
					output logic [1:0] ALUOp);
	always_comb
		casez(Op)
				11'b111_1100_0010: // LDUR
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b011110000;
				11'b111_1100_0000: // STUR
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b110001000;
				11'b101_1010_0???: // CBZ
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b100000101;
				11'b101_1010_1???: // CBNZ
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b100000111;
				11'b1?0_0101_1000: // SUB - ADD
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b000100010;
				11'b10?_0101_0000: // ORR - AND
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b000100010;
				11'b100_1000_100?: // ADDI
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b010100010;
				default:
					{Reg2Loc, ALUSrc, MemtoReg, RegWrite,
					 MemRead, MemWrite, Branch, ALUOp} = 9'b0;
		endcase
endmodule

	