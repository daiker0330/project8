module reg_D( ins_i , pc_4_i , rs_D , rt_D , rd_D , imm_D , pc_4_D , j_D , s_D , ins_D , clk , rst , stop_D ) ;
	input		[31:0]		ins_i ;
	input		[31:2]		pc_4_i ;
	input					clk ;
	input					rst ;
	input					stop_D ;
	output		[25:21]		rs_D ;
	output		[20:16]		rt_D ;
	output		[15:11]		rd_D ;
	output		[15:0]		imm_D ;
	output		[25:0]		j_D ;
	output		[10:6]		s_D ;
	output		[31:2]		pc_4_D ;
	output		[31:0]		ins_D ;
	
	reg			[31:2]		pc_4 ;
	reg			[31:0]		ins ;
	
	assign pc_4_D = pc_4 ;
	assign rs_D = ins[25:21] ;
	assign rt_D = ins[20:16] ;
	assign rd_D = ins[15:11] ;
	assign imm_D = ins[15:0] ;
	assign j_D = ins[25:0] ;
	assign s_D = ins[10:6] ;
	assign ins_D = ins ;
	
	always @ ( posedge clk )
	begin
		if( rst == 0 )
		begin
			pc_4 = 0 ;
			ins = 0 ;
		end
		else if ( stop_D )
			;
		else
		begin
			pc_4 = pc_4_i ;
			ins = ins_i ;
		end
	end
endmodule
	
	