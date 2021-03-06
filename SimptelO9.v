module SimptelO9(CLOCK_50, HEX0, HEX1, HEX2, HEX3);
  input CLOCK_50;
  input [6:0] HEX0, HEX1, HEX2, HEX3;
	
  wire [5:0] opCode;
  wire PCWriteCond, IorD, MemWrite, MemtoReg, IRWrite, ALUSrcA, RegWrite, RegDst, PCWrite;
  wire [1:0] ALUSrcB, PCSource, ALUOp;
  
 wire reset;
 wire memread;

  control_unit cunit(.opCode(opCode[5:0]), 
			  .clk(CLOCK_50), .reset(reset),
                          .ALUOp(ALUOp[1:0]), 
                          .PCWriteCond(PCWriteCond), .ALUSrcB(ALUSrcB[1:0]), .PCSource(PCSource),
                          .PCWrite(PCWrite), .IorD(IorD), .MemWrite(MemWrite), .MemtoReg(MemtoReg), 
                          .IRWrite(IRWrite), .ALUSrcA(ALUSrcA), .RegWrite(RegWrite), .RegDst(RegDst));
    
  
  datapath dpath(
	.PCWriteCond(PCWriteCond),
	.PCWrite(PCWrite),
	.IorD(IorD),
	.MemRead(memread),
	.MemWrite(MemWrite),
	.MemtoReg(MemtoReg),
	.IRWrite(IRWrite),
	.PCSource(PCSource[1:0]),
	.ALUOp(ALUOp[1:0]),
	.ALUSrcB(ALUSrcB[1:0]),
	.ALUSrcA(ALUSrcA),
	.RegWrite(RegWrite),
	.RegDst(RegDst),
	.clk(CLOCK_50),
	.reset(reset),
	.opCode(opCode[5:0]),
	.HEX0(HEX0[6:0]),
	.HEX1(HEX0[6:0]),
	.HEX2(HEX0[6:0]),
	.HEX3(HEX0[6:0])
);

endmodule 


