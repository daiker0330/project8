module reg_E ( RD1_D , RD2_D , ext_out_D , rt_D , rd_D , pc_4_D , j_D , s_D , HI_D , LO_D , ins_D ,
		RD1_E , RD2_E , ext_out_E , rt_E , rd_E , pc_4_E , j_E , s_E , HI_E , LO_E , ins_E , 
		clk , rst , stop_E ) ;
		
	input		[31:0]		RD1_D ;
	input		[31:0]		RD2_D ;
	input		[31:0]		ext_out_D ;
	input		[20:16]		rt_D ;
	input		[15:11]		rd_D ;
	input		[25:0]		j_D ;
	input		[10:6]		s_D ;
	input		[31:2]		pc_4_D ;
	input		[31:0]		HI_D ;
	input		[31:0]		LO_D ;
	input		[31:0]		ins_D ;
	input					clk ;
	input					rst ;
	input					stop_E ;
	output		[31:0]		RD1_E ;
	output		[31:0]		RD2_E ;
	output		[31:0]		ext_out_E ;
	output		[20:16]		rt_E ;
	output		[15:11]		rd_E ;
	output		[25:0]		j_E ;
	output		[10:6]		s_E ;
	output		[31:2]		pc_4_E ;
	output		[31:0]		HI_E ;
	output		[31:0]		LO_E ;	
	output		[31:0]		ins_E ;
	
	reg			[31:0]		RD1 ;
	reg			[31:0]		RD2 ;
	reg			[31:0]		ext_out ;
	reg			[20:16]		rt ;
	reg			[15:11]		rd ;
	reg			[25:0]		j ;
	reg			[10:6]		s ;
	reg			[31:2]		pc_4 ;
	reg			[31:0]		LO ;
	reg			[31:0]		HI ;
	reg			[31:0]		ins ;
	
	assign RD1_E = RD1 ;
	assign RD2_E = RD2 ;
	assign ext_out_E = ext_out ;
	assign rt_E = rt ;
	assign rd_E = rd ;
	assign j_E = j ;
	assign pc_4_E = pc_4 ;	
	assign s_E = s ;
	assign HI_E = HI ;
	assign LO_E = LO ;
	assign ins_E = ins ;
	
	always @ ( posedge clk )
	begin
		if( rst == 0 )
		begin
			RD1 = 0 ;
			RD2 = 0 ;
			ext_out = 0 ;
			rt = 0 ;
			rd = 0 ;
			j = 0 ;
			pc_4 = 0 ;
			s = 0 ;
			HI = 0 ;
			LO = 0 ;
			ins = 0 ;
		end
		else if ( stop_E )
			;
		else
		begin
			RD1 = RD1_D ;
			RD2 = RD2_D ;
			ext_out = ext_out_D ;
			rt = rt_D ;
			rd = rd_D ;
			j = j_D ;
			pc_4 = pc_4_D ;
			s = s_D ;
			HI = HI_D ;
			LO = LO_D ;
			ins = ins_D ;
		end
	end
	
endmodule