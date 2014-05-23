`include "head.v"
module mips ( PrAddr , BE , PrDIn , PrDOut , clk , HWInt , rst , DEV_Wr , test , test_led1 ) ;
	input               	clk ;
	input               	rst ;
	input		[31:0]		PrDIn ;
	input		[7:2]		HWInt ;
	output		[31:0]		PrAddr ;
	output		[3:0]		BE ;
	output		[31:0]		PrDOut ;
	output					DEV_Wr ;
		
	//test	
	output		[31:0]		test ;
	output					test_led1 ;
		
	//增加RS选择器	
	wire		[1:0]  		NPCOp ;
	wire		[2:0]  		WDSel ;
	wire		[1:0]  		GPRSel ;
	wire		[0:0]  		ExtOp ;
	wire		[0:0]  		BSel ;
	wire		[3:0]  		ALUOp ;
	wire		[1:0]  		ALUMovOp ;
	wire		[1:0]  		BESel ;
	wire		[0:0]  		BExtOP ;
	wire		[0:0]  		GPRR2Sel ;
	wire		 			PCWr ;
	wire		 			IRWr ;
	wire		 			GPRWr ;
	wire		 			LOWr ;
	wire		 			HIWr ;
	wire		 			CP0Wr ;
	wire		 			DMWr ;
	wire					IntReq ;
	wire					EXLSet ;
	wire		[1:0]		GPR_RD1_Sel ;
	wire		[1:0]		GPR_RD2_Sel ;
	
	wire		[31:2]		EPC ;
	wire        [31:0]  	pc ;
	wire		[31:0]		pc_4 ;
	wire		[31:0]		pc_next ;
	wire        [31:0]  	ins ;
	wire        [5:0]   	OP ;
	wire        [5:0]   	F ;
	wire		[4:0]		RT ;
	wire		[4:0]		RS ;
	wire        [31:0]  	alu_b ;
	wire		[3:0]		be ;
	wire		[4:0]		gpr_2 ;
	wire		[31:0]		cp0_out ;
	wire					DEV_DM_Wr ;
	wire		[31:0]		DEV_IN ;
	wire		[31:0]		RD1_D ;
	wire		[31:0]		RD2_D ;
	wire		[31:0]		GPR_RD1_D ;
	wire		[31:0]		GPR_RD2_D ;
	wire		[31:0]		ext_out_D ;
	wire		[25:21]		rs_D ;
	wire		[20:16]		rt_D ;
	wire		[15:11]		rd_D ;
	wire		[15:0]		imm_D ;
	wire		[25:0]		j_D ;
	wire		[10:6]		s_D ;
	wire		[31:2]		pc_4_D ;
	wire		[31:0]		HI_D ;
	wire		[31:0]		LO_D ;
	wire		[31:0]		ins_D ;
	wire        [5:0]       OP_D ;
	wire        [5:0]       F_D ; 
	wire        [4:0]       RT_D ;
	wire        [4:0]       RS_D ;
	wire					PCWr_D ;
	wire					Zero_D ;
	wire					Sign_D ;
	wire		[1:0]		pcSel_D ;
	wire					R_D ;
	wire					I_D ;
	wire					L_D ;
	wire					S_D ;
	wire					B_D ;
	wire					J_D ;
	wire					JA_D ;
	wire					stop_D ;
	wire		[31:0]		RD1_E ;
	wire		[31:0]		RD2_E ;
	wire		[31:0]		ext_out_E ;
	wire		[20:16]		rt_E ;
	wire		[15:11]		rd_E ;
	wire		[31:2]		pc_4_E ;
	wire					Zero_E ;
	wire					Sign_E ;
	wire		[25:0]		j_E ;
	wire		[10:6]		s_E ;
	wire		[31:0]		HI_E ;
	wire		[31:0]		LO_E ;
	wire		[31:0]		HI_C_E ;
	wire		[31:0]		LO_C_E ;
	wire		[31:0]		HI_R_E ;
	wire		[31:0]		LO_R_E ;
	wire		[31:0]		alu_out_E ;
	wire		[4:0]		WD_ADD_E ;
	wire		[31:2]		npc_E ;
	wire		[31:0]		ins_E ;
	wire        [5:0]       OP_E ;
	wire        [5:0]       F_E ; 
	wire        [4:0]       RT_E ;
	wire        [4:0]       RS_E ;
	wire					PCWr_E ;
	wire					stop_E ;
	wire					R_E ;
	wire					I_E ;
	wire					L_E ;
	wire					S_E ;
	wire					B_E ;
	wire					J_E ;
	wire					JA_E ;
	wire		[31:0]		D_RD_EXT_M ;
	wire		[31:0]		RD1_M ;
	wire		[31:0]		RD2_M ;
	wire		[31:2]		pc_4_M ;
	wire					Zero_M ;
	wire					Sign_M ;
	wire		[31:0]		alu_out_M ;
	wire		[4:0]		WD_ADD_M ;
	wire		[31:2]		npc_M ;
	wire		[31:0]		HI_M ;
	wire		[31:0]		LO_M ;
	wire		[31:0]		D_RD_M ;
	wire		[31:0]		ins_M ;
	wire        [5:0]       OP_M ;
	wire        [5:0]       F_M ; 
	wire        [4:0]       RT_M ;
	wire        [4:0]       RS_M ;
	wire					PCWr_M ;
	wire		[2:0]		pcSel_M ;
	wire					stop_M ;
	wire					R_M ;
	wire					I_M ;
	wire					L_M ;
	wire					S_M ;
	wire					B_M ;
	wire					J_M ;
	wire					JA_M ;
	wire		[31:0]		RD1_W ;
	wire		[31:0]		D_RD_EXT_W ;
	wire		[31:2]		pc_4_W ;
	wire		[31:0]		alu_out_W ;
	wire		[4:0]		WD_ADD_W ;
	wire		[31:0]		HI_W ;
	wire		[31:0]		LO_W ;
	wire		[31:0]		WD_W ;
	wire		[31:0]		ins_W ;
	wire        [5:0]       OP_W ;
	wire        [5:0]       F_W ; 
	wire        [4:0]       RT_W ;
	wire        [4:0]       RS_W ;
	wire		[1:0]		pcSel_W ;
	wire		[31:2]		npc_W ;
	wire					R_W ;
	wire					I_W ;
	wire					L_W ;
	wire					S_W ;
	wire					B_W ;
	wire					J_W ;
	wire					JA_W ;
  
  assign OP_D = ins_D[31:26] ;
  assign F_D = ins_D[5:0] ;
  assign RT_D = ins_D[20:16] ;
  assign RS_D = ins_D[25:21] ;
  assign OP_E = ins_E[31:26] ;
  assign F_E = ins_E[5:0] ;
  assign RT_E = ins_E[20:16] ;
  assign RS_E = ins_E[25:21] ;
   assign OP_M = ins_M[31:26] ;
  assign F_M = ins_M[5:0] ;
  assign RT_M = ins_M[20:16] ;
  assign RS_M = ins_M[25:21] ;
   assign OP_W = ins_W[31:26] ;
  assign F_W = ins_W[5:0] ;
  assign RT_W = ins_W[20:16] ;
  assign RS_W = ins_W[25:21] ;
  
  assign PrAddr = alu_out_M ;
  assign PrDOut = RD2_M ;
  assign DEV_Wr = ( ( PrAddr[15:0] == `COUNTER_ADD_1 ) 
				|| ( PrAddr[15:0] == `COUNTER_ADD_2 ) 
				|| ( PrAddr[15:0] == `COUNTER_ADD_3 ) 
				|| ( PrAddr[15:0] == `SWITCH_ADD ) 
				|| ( PrAddr[15:0] == `LED_ADD_1 ) 
				|| ( PrAddr[15:0] == `LED_ADD_2 ) ) 
				? DEV_DM_Wr : 1'b0 ;
  assign DMWr = ( PrAddr[15:12] == `DM_ADD_1 || PrAddr[15:12] == `DM_ADD_2 || PrAddr[15:12] == `DM_ADD_3 ) 
					? DEV_DM_Wr : 1'b0 ;
  assign BE = be ;
  assign DEV_IN = 	( PrAddr[15:12] == `DM_ADD_1 || PrAddr[15:12] == `DM_ADD_2 || PrAddr[15:12] == `DM_ADD_3 ) 
					? D_RD_EXT_W : PrDIn ;
  assign pc[1:0] = 2'b0 ;
  
	assign BEFORE_ALU = RD1_D - RD2_D ;
	assign Zero_D = BEFORE_ALU ? 1'b0 : 1'b1 ;
	assign Sign_D = BEFORE_ALU[31] ;
  
  //S1
  
  //MUX_4_32_PC
  mux_4_32 U_MUX_6_32_PC( pcSel_D + pcSel_W , pc_4 , RD1_E , { npc_E , 2'b0 } , RD1_W , pc_next ) ;
  
  //pc
  pc  U_PC ( pc_next[31:2] , clk , rst , pc[31:2] , PCWr_D * PCWr_E * PCWr_M * ( ~ ( B_D + J_D + JA_D ) * L_E ) ) ;
  
  //pc_4
  pc_4 U_PC_4 ( pc , pc_4 ) ;
  
  //im
  im_4k  U_IM ( pc[31:2] , ins , clk , rst ) ;
  
  //reg_D
  reg_D U_REG_D( ins , pc_4[31:2] , rs_D , rt_D , rd_D , imm_D , pc_4_D , j_D , s_D , ins_D , clk ,
				rst * PCWr_D * PCWr_E * PCWr_M , ( B_D + J_D + JA_D ) * L_E ) ;
  
  //S2
  
  //ctrl_D
  ctrl_D U_CTRL_D( OP_D , F_D , RT_D , RS_D , PCWr_D , GPRR2Sel , ExtOp , NPCOp , Sign_D , Zero_D , pcSel_D ,
				R_D , I_D , L_D , S_D , B_D , J_D , JA_D , rst ) ;
  
  //mux gpr 2 address
  mux_2_5 U_MUX_GPR_2 ( GPRR2Sel , rt_D , 5'b0 , gpr_2 ) ;
  
  //gpr
  gpr U_GPR ( GPR_RD1_D , rs_D , GPR_RD2_D , gpr_2 , WD_W , WD_ADD_W , GPRWr , clk , rst ) ;
  
  //mux_6_32_gpr_rd1
  assign GPR_RD1_Sel = 	( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( R_E + I_E ) 
										&& ( rs_D == rd_E ) ) ? `GPR_BYPASS_ALU_E :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( R_M + I_M ) 
										&& ( rs_D == rd_M ) ) ? `GPR_BYPASS_ALU_M :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( L_M ) 
										&& ( rs_D == rt_M ) ) ? `GPR_BYPASS_DM_M :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( JA_E ) 
										&& ( rs_D == rd_E ) ) ? `GPR_BYPASS_PC_E :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( JA_M ) 
																&& ( rs_D == rd_M ) ) ? `GPR_BYPASS_PC_M :
						`GPR_BYPASS_RD ;
  mux_6_32 U_MUX_6_32_GPR_RD1( GPR_RD1_Sel , GPR_RD1_D , alu_out_E , pc_4_E , D_RD_EXT_M , alu_out_M , pc_4_M , RD1_D ) ;
  
  //mux_6_32_gpr_rd2
  assign GPR_RD2_Sel = 	( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( R_E + I_E ) 
										&& ( rt_D == rd_E ) ) ? `GPR_BYPASS_ALU_E :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( R_M + I_M ) 
										&& ( rt_D == rd_M ) ) ? `GPR_BYPASS_ALU_M :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( L_M ) 
										&& ( rt_D == rt_M ) ) ? `GPR_BYPASS_DM_M :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( JA_E ) 
										&& ( rt_D == rd_E ) ) ? `GPR_BYPASS_PC_E :
						( ( R_D + I_D + L_D + S_D + B_D + J_D + JA_D ) && ( JA_M ) 
										&& ( rt_D == rd_M ) ) ? `GPR_BYPASS_PC_M :
						`GPR_BYPASS_RD ;
  mux_6_32 U_MUX_6_32_GPR_RD1( GPR_RD2_Sel , GPR_RD1_D , alu_out_E , pc_4_E , D_RD_EXT_M , alu_out_M , pc_4_M , RD2_D ) ;
  
  //hilo
  hilo U_HILO ( HI_W , HIWr , LO_W , LOWr , HI_D , LO_D , clk ) ;
  
  //ext
  ext U_EXT( imm_D , ext_out_D , ExtOp ) ;
  
  //npc
  npc U_NPC ( pc_4_D , NPCOp , j_D , RD1_D , npc_D ) ;
  
  //reg_E
  reg_E U_REG_E( RD1_D , RD2_D , ext_out_D , rt_D , rd_D , pc_4_D , j_D , s_D , HI_D , LO_D , ins_D ,
				RD1_E , RD2_E , ext_out_E , rt_E , rd_E , pc_4_E , j_E , s_E , HI_R_E , LO_R_E , ins_E , 
				clk , rst * PCWr_E * PCWr_M * ( pcSel_M != `PCSEL_BJ ) , stop_E ) ;
  
  //S3
  
  //ctrl_E
  ctrl_E U_CTRL_E( OP_E , F_E , RT_E , RS_E , PCWr_E , BSel , ALUOp , ALUMovOp , LOSel , HISel ,
					GPRSel , R_E , I_E , L_E , S_E , B_E , J_E , JA_E , rst ) ;
  
  //mux_6_32_alu_rd1
  assign ALU_RD1_Sel = 	( ( R_E + I_E + L_E + S_E ) && ( L_M ) 
										&& ( rs_E == rt_M ) ) ? `ALU_BYPASS_DM_M :
						`ALU_BYPASS_RD ;
  mux_2_32 U_MUX_2_32_ALU_RD1( ALU_RD1_Sel , RD1_E , D_RD_EXT_M , ALU_RD1_E ) ;
  
  //mux_6_32_alu_rd2
  assign ALU_RD2_Sel = 	( ( R_E + I_E + L_E + S_E ) && ( L_M ) 
										&& ( rt_E == rt_M ) ) ? `ALU_BYPASS_DM_M :
						`ALU_BYPASS_RD ;
  mux_2_32 U_MUX_2_32_ALU_RD1( ALU_RD2_Sel , RD2_E , D_RD_EXT_M , ALU_RD2_E ) ;
  
  
  //mux alu b
  mux_2_32 U_MUX_ALU_B ( BSel , ALU_RD2_E , ext_out_E , alu_b ) ;
  
  //alu
  alu U_ALU( ALU_RD1_E , alu_b , s_E , ALUOp , alu_out_E , Zero_E , Sign_E , ALUMovOp ) ;
  
  //md
  md U_MD ( RD1_E , alu_b , HI_C_E , LO_C_E , ALUOp ) ;
  
  //mux hi
  mux_2_32 U_MUX_2_32_HI ( HISel , HI_C_E , HI_R_E , HI_E ) ;
  
  //mux lo
  mux_2_32 U_MUX_2_32_LO ( LOSel , LO_C_E , LO_R_E , LO_E ) ;
  
  //mux gpr write data address
  mux_3_5 U_MUX_GPR_WD ( GPRSel , rt_E , rd_E , `GPR_31 , WD_ADD_E ) ;
  
  
  //reg_M
  reg_M U_REG_M( Zero_E , Sign_E , alu_out_E , RD2_E , WD_ADD_E , pc_4_E , npc_E , HI_E , LO_E , ins_E , RD1_E ,
				Zero_M , Sign_M , alu_out_M , RD2_M , WD_ADD_M , pc_4_M , npc_M , HI_M , LO_M , ins_M , RD1_M , 
				clk , rst * PCWr_M * ( pcSel_M != `PCSEL_BJ ) ) ;
  
  //S4
  
  //ctrl_M
  ctrl_M U_CTRL_M( OP_M , F_M , RT_M , RS_M , PCWr_M , BESel , DMWr , BExtOP ,
					R_M , I_M , L_M , S_M , B_M , J_M , JA_M , rst ) ;
  
  //be
  be U_BE( BESel , alu_out_M[1:0] , be ) ;
  
  //dm
  dm_4k U_DM( RD2_M , be , alu_out_M[13:2] , D_RD_M , DMWr , clk , rst ) ;
  
  //be ext
  be_ext U_BEEXT( D_RD_M , be , BExtOP , D_RD_EXT_M ) ;
  
  //reg_W
  reg_W U_REG_W( D_RD_EXT_M , alu_out_M , pc_4_M , WD_ADD_M , HI_M , LO_M , ins_M , npc_M , RD1_M ,
				D_RD_EXT_W , alu_out_W , pc_4_W , WD_ADD_W , HI_W , LO_W , ins_W , npc_W , RD1_W , 
				clk , rst , stop_M ) ;
  
  //S5
  
  //ctrl_W
  ctrl_W U_CTRL_W( OP_W , F_W , RT_W , RS_W , WDSel , GPRWr , LOWr , HIWr , pcSel_W , 
					R_W , I_W , L_W , S_W , B_W , J_W , JA_W , rst ) ;
  
  //mux gpr write data
  mux_6_32 U_MUX_GPR_W ( WDSel , DEV_IN , alu_out_W , { pc_4_M , 2'b0 } , HI_W , LO_W , cp0_out , WD_W ) ;
  
  //cp0
  //cp0 U_CP0 ( pc[31:2] , A , HWInt , rd , CP0Wr , EXLSet , CP0CLRWr , clk , rst , IntReq , EPC , cp0_out ) ;

endmodule