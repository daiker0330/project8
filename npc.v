`include "head.v"
module npc ( pc_4 , NPCOp , IMM , RD1 , NPC ) ;
	input 		[31:2]  pc_4 ;
	input 		[25:0]  IMM ;
	input		[31:0]	RD1 ;
	input 			    NPCOp ;
	output		[31:2]  NPC ;
			
	wire  		[31:0]  beq ;
	wire  		[31:2]  j ;
  
  assign beq = IMM[15] ? { 14'h3fff , IMM[15:0] , 2'b0 } : { 14'b0 , IMM[15:0] , 2'b0 } ;
  assign j = { pc_4[31:28] , IMM[25:0] } ;
  
  assign NPC = 	( NPCOp == `NPC_BEQ ) ? pc_4 + beq[31:2] :
				( NPCOp == `NPC_J ) ? j :
				( NPCOp == `NPC_JR ) ? RD1[31:2] :
				pc_4 ;
  // always @ ( * )
	// //if( rst == 0 )
	// //	NPC  <= {28'h0000300,2'b01} ;
	// //else
	// case( NPCOp )
		// `NPC_BEQ	:NPC <= pc_4 + beq[31:2] ;
		// `NPC_J		:NPC <= j ;
		// default:NPC <= pc_4 ;
	// endcase	
endmodule