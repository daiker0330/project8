module reg_M ( Zero_E , Sign_E , alu_out_E , RD2_E , WD_ADD_E , pc_4_E , npc_E , HI_E , LO_E , ins_E , RD1_E ,
				Zero_M , Sign_M , alu_out_M , RD2_M , WD_ADD_M , pc_4_M , npc_M , HI_M , LO_M , ins_M , RD1_M , 
				clk , rst , stop_M ) ;
	input		[31:0]		RD2_E ;
	input		[31:2]		pc_4_E ;
	input					Zero_E ;
	input					Sign_E ;
	input		[31:0]		alu_out_E ;
	input		[4:0]		WD_ADD_E ;
	input		[31:2]		npc_E ;
	input		[31:0]		HI_E ;
	input		[31:0]		LO_E ;
	input		[31:0]		ins_E ;
	input					clk ;
	input					rst ;
	input		[31:0]		RD1_E ;
	input					stop_M ;
	output		[31:0]		RD2_M ;
	output		[31:2]		pc_4_M ;
	output					Zero_M ;
	output					Sign_M ;
	output		[31:0]		alu_out_M ;
	output		[4:0]		WD_ADD_M ;
	output		[31:2]		npc_M ;
	output		[31:0]		HI_M ;
	output		[31:0]		LO_M ;
	output		[31:0]		ins_M ;
	output		[31:0]		RD1_M ;
	
	reg			[31:0]		RD2 ;
	reg			[31:0]		RD1 ;
	reg			[31:2]		pc_4 ;
	reg						Zero ;
	reg						Sign ;
	reg			[31:0]		alu_out ;
	reg			[4:0]		WD_ADD ;
	reg			[31:2]		npc ;
	reg			[31:0]		LO ;
	reg			[31:0]		HI ;
	reg			[31:0]		ins ;
	
	assign RD2_M = RD2 ;
	assign RD1_M = RD1 ;
	assign pc_4_M  = pc_4 ;
	assign Zero_M = Zero ;
	assign Sign_M = Sign ;
	assign alu_out_M = alu_out ;
	assign WD_ADD_M = WD_ADD ;
	assign npc_M = npc ;
	assign HI_M = HI ;
	assign LO_M = LO ;
	assign ins_M = ins ;
	
	always @ ( posedge clk )
	begin
		if( rst == 0 )
		begin
			RD2 = 0 ;
			RD1 = 0 ;
			pc_4 = 0 ;
			Zero = 0 ;
			Sign = 0 ;
			alu_out = 0 ;
			WD_ADD = 0 ;
			npc = 0 ;
			HI = 0 ;
			LO = 0 ;
			ins = 0 ;
		end
		else if ( stop_M )
			;
		else
		begin
			RD2 = RD2_E ;
			RD1 = RD1_E ;
			pc_4 = pc_4_E ;
			Zero = Zero_E ;
			Sign = Sign_E ;
			alu_out = alu_out_E ;
			WD_ADD = WD_ADD_E ;
			npc = npc_E ;
			HI = HI_E ;
			LO = LO_E ;
			ins = ins_E ;
		end
	end
	
endmodule
