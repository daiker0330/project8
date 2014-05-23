module reg_W ( D_RD_EXT_M , alu_out_M , pc_4_M , WD_ADD_M , HI_M , LO_M , ins_M , npc_M , RD1_M ,
				D_RD_EXT_W , alu_out_W , pc_4_W , WD_ADD_W , HI_W , LO_W , ins_W , npc_W , RD1_W , 
				clk , rst ) ;
	input		[31:0]		D_RD_EXT_M ;
	input		[31:2]		pc_4_M ;
	input		[31:0]		alu_out_M ;
	input		[4:0]		WD_ADD_M ;
	input		[31:0]		HI_M ;
	input		[31:0]		LO_M ;
	input		[31:0]		ins_M ;
	input					clk ;
	input					rst ;
	input		[31:2]		npc_M ;
	input		[31:0]		RD1_M ;
	output		[31:0]		D_RD_EXT_W ;
	output		[31:2]		pc_4_W ;
	output		[31:0]		alu_out_W ;
	output		[4:0]		WD_ADD_W ;
	output		[31:0]		HI_W ;
	output		[31:0]		LO_W ;
	output		[31:0]		ins_W ;
	output		[31:2]		npc_W ;
	output		[31:0]		RD1_W ;
	
	reg			[31:0]		D_RD ;
	reg			[31:2]		pc_4 ;
	reg			[31:0]		alu_out ;
	reg			[4:0]		WD_ADD ;
	reg			[31:0]		LO ;
	reg			[31:0]		HI ;
	reg			[31:0]		ins ;
	reg			[31:2]		npc ;
	reg			[31:0]		RD1 ;
	
	assign D_RD_EXT_W = D_RD ;
	assign pc_4_W = pc_4 ;
	assign alu_out_W = alu_out ;
	assign WD_ADD_W = WD_ADD ;
	assign HI_W = HI ;
	assign LO_W = LO ;
	assign ins_W = ins ;
	assign npc_W = npc ;
	assign RD1_W = RD1 ;
	
	always @ ( posedge clk )
	begin
		if( rst == 0 )
		begin
			D_RD = 0 ;
			pc_4 = 0 ;
			alu_out = 0 ;
			WD_ADD = 0 ;
			HI = 0 ;
			LO = 0 ;
			ins = 0 ;
			npc = 0 ;
			RD1 = 0 ;
		end
		else
		begin
			D_RD = D_RD_EXT_M ;
			pc_4 = pc_4_M ;
			alu_out = alu_out_M ;
			WD_ADD = WD_ADD_M ;
			HI = HI_M ;
			LO = LO_M ;
			ins = ins_M ;
			npc = npc_M ;
			RD1 = RD1_M ;
		end
	end
	
endmodule