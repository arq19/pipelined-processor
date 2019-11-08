module imem #(parameter N = 32)
				(input logic [5:0] addr,
				output logic [N-1:0] q);
				
	logic [N-1:0] ROM [64];
	
	initial begin
		ROM = '{default:0};
		ROM[0:13] = '{
				32'h8b0603e0, 	// add	x0, xzr, x6
				32'h8b1f03e2, 	// add	x2, xzr, xzr
				32'h00000000, 	// nop
				32'hcb010000, 	// sub	x0, x0, x1
				32'h8b010042, 	// add	x2, x2, x1
				32'h00000000, 	// nop
				32'hb5ffffa0, 	// cbnz	x0, c <loop>
				32'h00000000, 	// nop
				32'h00000000, 	// nop
				32'h00000000, 	// nop
				32'hf80003e0, 	// stur	x0, [xzr, #0]
				32'hf80083e2, 	// stur	x2, [xzr, #8]
				32'hf80003c0, 	// stur	x0, [x30]
				32'hf80083c2 	// stur	x2, [x30, #8]
			};
//		ROM[0:25] = '{32'hf8000000, 32'hf8008001,
//				32'hf8010002, 32'hf8018003,
//				32'hf8020004, 32'hf8028005,
//				32'hf8030006, 32'hf8400007,
//				32'hf8408008, 32'hf8410009,
//				32'hf841800a, 32'hf842000b,
//				32'hf842800c, 32'hf843000d,
//				32'hcb0e01ce,
//				32'h00000000, // NOP
//				32'h00000000, // NOP
//				32'hb400004e,
//				32'h00000000, // NOP
//				32'h00000000, // NOP
//				32'h00000000, // NOP
//				32'hcb01000f,
//				32'h8b01000f,
//				32'h00000000, // NOP
//				32'h00000000, // NOP
//				32'hf803800f};
//		ROM[0:12] = '{32'h8b0403e0, // add	x0, xzr, x4
//						  31'h00000000, // NOP
//						  31'h00000000, // NOP
//						  32'h8b040001, // add	x1, x0, x4
//						  32'hf80003e0, // stur	x0, [x31]
//						  31'h00000000, // NOP
//						  32'h8b040022, // add	x2, x1, x4
//						  32'hf80083e1, // stur	x1, [x31, #8]
//						  31'h00000000, // NOP
//						  32'h8b040043, // add	x3, x2, x4
//						  32'hf80103e2, // stur	x2, [x31, #16]
//						  31'h00000000, // NOP
//						  32'hf80183e3 // stur	x2, [x31, #24]
//						};
	end
							
	assign q = ROM[addr];
	
endmodule
