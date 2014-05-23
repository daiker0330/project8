`include "head.v"
module ctrl_E ( OP , F , RT , RS , PCWr_E , BSel , ALUOp , ALUMovOp , LOSel , HISel , GPRSel ,
				R_E , I_E , L_E , S_E , B_E , J_E , JA_E , rst ) ;
	input    		[5:0]   OP ;
	input    		[5:0]   F ;
	input    		[4:0]   RT ;
	input    		[4:0]   RS ;
	input					rst ;
	output					PCWr_E ;
	output					BSel ;
	output			[3:0]	ALUOp ;
	output			[1:0]	ALUMovOp ;
	output					LOSel ;
	output					HISel ;
	output			[1:0]	GPRSel ;
	output					R_E ;
	output					I_E ;
	output					L_E ;
	output					S_E ;
	output					B_E ;
	output					J_E ;
	output					JA_E ;
	
	reg						BSel ;
	reg				[3:0]	ALUOp ;
	reg				[1:0]	ALUMovOp ;
	reg						LOSel ;
	reg						HISel ;
	reg				[1:0]	GPRSel ;
	reg				[1:0]	pcSel_E ;
	
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
	
	assign R_E = ( ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR ) ? 1 : 0 ;
	assign I_E = ( ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU ) ? 1 : 0 ;
	assign L_E = ( LB + LBU + LH + LHU + LW ) ? 1 : 0 ;
	assign S_E = ( SB + SH + SW ) ? 1 : 0 ;
	assign B_E = ( BEQ + BNE + BLEZ + BGTZ + BLTZ + BGEZ ) ? 1 : 0 ;
	assign J_E = ( JR ) ? 1 : 0 ;
	assign JA_E = ( JALR ) ? 1 : 0 ;
	
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
		
		PCWr_E = 	( rst == 0 ) ? 1 : 
					( JAL + JALR ) ? 0 : 1 ;
		BSel =  	( rst == 0 ) ? 0 : 
					( LB + LBU + LH + LHU + LW + SB + SH + SW + ADDI + ADDIU + ANDI + ORI + XORI + LUI 
					+ SLTI + SLTIU ) ? `BSEL_EXT : `BSEL_B ;
		ALUOp = 	( rst == 0 ) ? 4'b0 :
					LB  ? `ALU_ADD :
					LBU  ? `ALU_ADD :
					LH  ? `ALU_ADD :
					LHU  ? `ALU_ADD :
					LW  ? `ALU_ADD :
					SB  ? `ALU_ADD :
					SH  ? `ALU_ADD :
					SW  ? `ALU_ADD :
					ADD  ? `ALU_ADD :
					ADDU  ? `ALU_ADD :
					SUB  ? `ALU_SUB :
					SUBU  ? `ALU_SUB :
					SLL  ? `ALU_SLL :
					SRL  ? `ALU_SLR :
					SRA  ? `ALU_SRA :
					SLLV  ? `ALU_SLL :
					SRLV  ? `ALU_SLR :
					SRAV  ? `ALU_SRA :
					AND  ? `ALU_AND :
					OR  ? `ALU_OR :
					XOR  ? `ALU_XOR :
					NOR  ? `ALU_NOR :
					MULT  ? `ALU_MULT :
					MULTU  ? `ALU_MULTU :
					DIV  ? `ALU_DIV :
					DIVU  ? `ALU_DIVU :
					ADDI  ? `ALU_ADD :
					ADDIU  ? `ALU_ADD :
					ANDI  ? `ALU_AND :
					ORI  ? `ALU_OR :
					XORI  ? `ALU_XOR :
					LUI  ? `ALU_SLL :
					SLTI  ? `ALU_SLT :
					SLTIU  ? `ALU_SLTU :
					BEQ  ? `ALU_SUB :
					BNE  ? `ALU_SUB :
					BLEZ  ? `ALU_SUB :
					BGTZ  ? `ALU_SUB :
					BLTZ  ? `ALU_SUB :
					BGEZ  ? `ALU_SUB :
					4'b0 ;
		ALUMovOp =  ( rst == 0 ) ? 2'b0 :
					SLL  ? `ALU_MOV_S :
					SRL  ? `ALU_MOV_S :
					SRA  ? `ALU_MOV_S :
					SLLV  ? `ALU_MOV_M_RS :
					SRLV  ? `ALU_MOV_M_RS :
					SRAV  ? `ALU_MOV_M_RS :
					LUI  ? `ALU_MOV_M_16 :
					2'b0 ;
		LOSel =		( rst == 0 ) ? 0 :
					MFLO ? `LOSEL_R : `LOSEL_C ;
		HISel =		( rst == 0 ) ? 0 :
					MFHI ? `HISEL_R : `HISEL_C ;			
		GPRSel =    ( rst == 0 ) ? 2'b0 :  
					LB  ? `GPRSEL_RT :
					LBU  ? `GPRSEL_RT :
					LH  ? `GPRSEL_RT :
					LHU  ? `GPRSEL_RT :
					LW  ? `GPRSEL_RT :
					ADD  ? `GPRSEL_RD :
					ADDU  ? `GPRSEL_RD :
					SUB  ? `GPRSEL_RD :
					SUBU  ? `GPRSEL_RD :
					SLL  ? `GPRSEL_RD :
					SRL  ? `GPRSEL_RD :
					SRA  ? `GPRSEL_RD :
					SLLV  ? `GPRSEL_RD :
					SRLV  ? `GPRSEL_RD :
					SRAV  ? `GPRSEL_RD :
					AND  ? `GPRSEL_RD :
					OR  ? `GPRSEL_RD :
					XOR  ? `GPRSEL_RD :
					NOR  ? `GPRSEL_RD :
					ADDI  ? `GPRSEL_RT :
					ADDIU  ? `GPRSEL_RT :
					ANDI  ? `GPRSEL_RT :
					ORI  ? `GPRSEL_RT :
					XORI  ? `GPRSEL_RT :
					LUI  ? `GPRSEL_RT :
					SLTI  ? `GPRSEL_RT :
					SLTIU  ? `GPRSEL_RT :
					JAL  ? `GPRSEL_31 :
					JALR  ? `GPRSEL_RD :
					MFHI  ? `GPRSEL_RD :
					MFLO  ? `GPRSEL_RD :
					MFC0  ? `GPRSEL_RT :
					2'b0 ;
	end

endmodule