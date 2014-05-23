`include "head.v"
module ctrl_W ( OP , F , RT , RS , WDSel , GPRWr , LOWr , HIWr , pcSel_W , 
				R_W , I_W , L_W , S_W , B_W , J_W , JA_W , rst ) ;
	input    		[5:0]   OP ;
	input    		[5:0]   F ;
	input    		[4:0]   RT ;
	input    		[4:0]   RS ;
	input					rst ;
	output 			[2:0]  	WDSel ;
	output					GPRWr ;
	output					LOWr ;
	output					HIWr ;
	output			[1:0]	pcSel_W ;
	output					R_W ;
	output					I_W ;
	output					L_W ;
	output					S_W ;
	output					B_W ;
	output					J_W ;
	output					JA_W ;
	
	reg   			[2:0]  	WDSel ;
	reg						GPRWr ;
	reg						LOWr ;
	reg						HIWr ;
	reg				[1:0]	pcSel_W ;
	
	reg       				LB ;
	reg       				LBU ;
	reg       				LH ;
	reg       				LHU ;
	reg       				LW ;
	reg       				SB ;
	reg       				SH ;
	reg       				SW ;
	reg       				ADD ;
	reg       				ADDU ;
	reg       				SUB ;
	reg       				SUBU ;
	reg       				SLL ;
	reg       				SRL ;
	reg       				SRA ;
	reg       				SLLV ;
	reg       				SRLV ;
	reg       				SRAV ;
	reg       				AND ;
	reg       				OR ;
	reg       				XOR ;
	reg       				NOR ;
	reg       				MULT ;
	reg       				MULTU ;
	reg       				DIV ;
	reg       				DIVU ;
	reg       				ADDI ;
	reg       				ADDIU ;
	reg       				ANDI ;
	reg       				ORI ;
	reg       				XORI ;
	reg       				LUI ;
	reg       				SLTI ;
	reg       				SLTIU ;
	reg       				BEQ ;
	reg       				BNE ;
	reg       				BLEZ ;
	reg       				BGTZ ;
	reg       				BLTZ ;
	reg       				BGEZ ;
	reg       				J ;
	reg       				JAL ;
	reg       				JALR ;
	reg       				JR ;
	reg       				MFHI ;
	reg       				MFLO ;
	reg       				MTHI ;
	reg       				MTLO ;
	reg       				ERET ;
	reg       				MFC0 ;
	reg       				MTC0 ;
	
	assign R_W = ( ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR ) ? 1 : 0 ;
	assign I_W = ( ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU ) ? 1 : 0 ;
	assign L_W = ( LB + LBU + LH + LHU + LW ) ? 1 : 0 ;
	assign S_W = ( SB + SH + SW ) ? 1 : 0 ;
	assign B_W = ( BEQ + BNE + BLEZ + BGTZ + BLTZ + BGEZ ) ? 1 : 0 ;
	assign J_W = ( JR ) ? 1 : 0 ;
	assign JA_W = ( JALR ) ? 1 : 0 ;
	
	always @ ( * )
	begin
		LB = ( OP == 6'b 100000  ) ? 1'b1 : 1'b0 ;
		LBU = ( OP == 6'b100100 ) ? 1'b1 : 1'b0 ;
		LH = ( OP == 6'b100001 ) ? 1'b1 : 1'b0 ;
		LHU = ( OP == 6'b100101 ) ? 1'b1 : 1'b0 ;
		LW = ( OP == 6'b100011 ) ? 1'b1 : 1'b0 ;
		SB = ( OP == 6'b101000 ) ? 1'b1 : 1'b0 ;
		SH = ( OP == 6'b101001 ) ? 1'b1 : 1'b0 ;
		SW = ( OP == 6'b101011 ) ? 1'b1 : 1'b0 ;
		ADD = ( OP == 6'b000000 && F == 6'b100000 ) ? 1'b1 : 1'b0 ;
		ADDU = ( OP == 6'b000000 && F == 6'b100001 ) ? 1'b1 : 1'b0 ;
		SUB = ( OP == 6'b000000 && F == 6'b100010 ) ? 1'b1 : 1'b0 ;
		SUBU = ( OP == 6'b000000 && F == 6'b100011 ) ? 1'b1 : 1'b0 ;
		SLL = ( OP == 6'b000000 && F == 6'b000000 ) ? 1'b1 : 1'b0 ;
		SRL = ( OP == 6'b000000 && F == 6'b000010 ) ? 1'b1 : 1'b0 ;
		SRA = ( OP == 6'b000000 && F == 6'b000011 ) ? 1'b1 : 1'b0 ;
		SLLV = ( OP == 6'b000000 && F == 6'b000100 ) ? 1'b1 : 1'b0 ;
		SRLV = ( OP == 6'b000000 && F == 6'b000110 ) ? 1'b1 : 1'b0 ;
		SRAV = ( OP == 6'b000000 && F == 6'b000111 ) ? 1'b1 : 1'b0 ;
		AND = ( OP == 6'b000000 && F == 6'b100100 ) ? 1'b1 : 1'b0 ;
		OR = ( OP == 6'b000000 && F == 6'b100101 ) ? 1'b1 : 1'b0 ;
		XOR = ( OP == 6'b000000 && F == 6'b100110 ) ? 1'b1 : 1'b0 ;
		NOR = ( OP == 6'b000000 && F == 6'b100111 ) ? 1'b1 : 1'b0 ;
		MULT = ( OP == 6'b000000 && F == 6'b011000 ) ? 1'b1 : 1'b0 ;
		MULTU = ( OP == 6'b000000 && F == 6'b011001 ) ? 1'b1 : 1'b0 ;
		DIV = ( OP == 6'b000000 && F == 6'b011010 ) ? 1'b1 : 1'b0 ;
		DIVU = ( OP == 6'b000000 && F == 6'b011011 ) ? 1'b1 : 1'b0 ;
		ADDI = ( OP == 6'b001000 ) ? 1'b1 : 1'b0 ;
		ADDIU = ( OP == 6'b001001 ) ? 1'b1 : 1'b0 ;
		ANDI = ( OP == 6'b001100 ) ? 1'b1 : 1'b0 ;
		ORI = ( OP == 6'b001101 ) ? 1'b1 : 1'b0 ;
		XORI = ( OP == 6'b001110 ) ? 1'b1 : 1'b0 ;
		LUI = ( OP == 6'b001111 ) ? 1'b1 : 1'b0 ;
		SLTI = ( OP == 6'b001010 ) ? 1'b1 : 1'b0 ;
		SLTIU = ( OP == 6'b001011 ) ? 1'b1 : 1'b0 ;
		BEQ = ( OP == 6'b000100 ) ? 1'b1 : 1'b0 ;
		BNE = ( OP == 6'b000101 ) ? 1'b1 : 1'b0 ;
		BLEZ = ( OP == 6'b000110 ) ? 1'b1 : 1'b0 ;
		BGTZ = ( OP == 6'b000111 ) ? 1'b1 : 1'b0 ;
		BLTZ = ( OP == 6'b000001 && RT == 5'b00000 ) ? 1'b1 : 1'b0 ;
		BGEZ = ( OP == 6'b000001 && RT == 5'b00001 ) ? 1'b1 : 1'b0 ;
		J = ( OP == 6'b000010 ) ? 1'b1 : 1'b0 ;
		JAL = ( OP == 6'b000011 ) ? 1'b1 : 1'b0 ;
		JALR = ( OP == 6'b000000 && F == 6'b001001 ) ? 1'b1 : 1'b0 ;
		JR = ( OP == 6'b000000 && F == 6'b001000 ) ? 1'b1 : 1'b0 ;
		MFHI = ( OP == 6'b000000 && F == 6'b010000 ) ? 1'b1 : 1'b0 ;
		MFLO = ( OP == 6'b000000 && F == 6'b010010 ) ? 1'b1 : 1'b0 ;
		MTHI = ( OP == 6'b000000 && F == 6'b010001 ) ? 1'b1 : 1'b0 ;
		MTLO = ( OP == 6'b000000 && F == 6'b010011 ) ? 1'b1 : 1'b0 ;
		ERET = ( OP == 6'b010000 && F == 6'b011000 ) ? 1'b1 : 1'b0 ;
		MFC0 = ( OP == 6'b010000 && RS == 5'b00000 ) ? 1'b1 : 1'b0 ;
		MTC0 = ( OP == 6'b010000 && RS == 5'b00100 ) ? 1'b1 : 1'b0 ;
		
		WDSel =     ( rst == 0 ) ? 3'b0 :
					LB  ? `WDSEL_DM :
					LBU  ? `WDSEL_DM :
					LH  ? `WDSEL_DM :
					LHU  ? `WDSEL_DM :
					LW  ? `WDSEL_DM :
					ADD  ? `WDSEL_ALUOUT :
					ADDU  ? `WDSEL_ALUOUT :
					SUB  ? `WDSEL_ALUOUT :
					SUBU  ? `WDSEL_ALUOUT :
					SLL  ? `WDSEL_ALUOUT :
					SRL  ? `WDSEL_ALUOUT :
					SRA  ? `WDSEL_ALUOUT :
					SLLV  ? `WDSEL_ALUOUT :
					SRLV  ? `WDSEL_ALUOUT :
					SRAV  ? `WDSEL_ALUOUT :
					AND  ? `WDSEL_ALUOUT :
					OR  ? `WDSEL_ALUOUT :
					XOR  ? `WDSEL_ALUOUT :
					NOR  ? `WDSEL_ALUOUT :
					ADDI  ? `WDSEL_ALUOUT :
					ADDIU  ? `WDSEL_ALUOUT :
					ANDI  ? `WDSEL_ALUOUT :
					ORI  ? `WDSEL_ALUOUT :
					XORI  ? `WDSEL_ALUOUT :
					LUI  ? `WDSEL_ALUOUT :
					SLTI  ? `WDSEL_ALUOUT :
					SLTIU  ? `WDSEL_ALUOUT :
					JAL  ? `WDSEL_NPC :
					JALR  ? `WDSEL_NPC :
					MFHI  ? `WDSEL_HI :
					MFLO  ? `WDSEL_LO :
					MFC0  ? `WDSEL_CP0 :
					3'b0 ;
		GPRWr = 	( rst == 0 ) ? 0 :
					( JAL + JALR + MFHI + MFLO + MFC0 + ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + 
					SRAV + AND + OR + XOR + NOR + ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU + LB + 
					LBU + LH + LHU + LW );
		LOWr = 		( rst == 0 ) ? 0 :
					( MULT + MULTU + DIV + DIVU + MTLO ) ;
		HIWr =		( rst == 0 ) ? 0 :
					( MULT + MULTU + DIV + DIVU + MTHI ) ;
		pcSel_W = 	( rst == 0 ) ? 2'b0 :
					( JAL ) ? `PCSEL_JAL : 
					( JALR ) ? `PCSEL_JALR : `PCSEL_PC_4 ;
	end

endmodule