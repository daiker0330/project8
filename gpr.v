module gpr (DATA_READ1,DATA_READ_ADR1,DATA_READ2,DATA_READ_ADR2,DATA_WRITE,DATA_WRITE_ADR,GPRWr,clk,rst) ;
	input 		[4:0]   DATA_READ_ADR1 ;
	input 		[4:0]   DATA_READ_ADR2 ;
	input 		[31:0]  DATA_WRITE ;
	input 		[4:0]   DATA_WRITE_ADR ;
	input 		        clk ;
	input				rst ;
	input 		        GPRWr ;
	output		[31:0]  DATA_READ1 ;
	output		[31:0]  DATA_READ2 ;
			
	reg   		[31:0]  regsiter[31:0] ;
	integer				n ;
	
	
	assign DATA_READ1 = ( DATA_READ_ADR1 == 5'b0 ) ? 32'b0 : regsiter[DATA_READ_ADR1] ;
	assign DATA_READ2 = ( DATA_READ_ADR2 == 5'b0 ) ? 32'b0 : regsiter[DATA_READ_ADR2] ;
	
	always @ ( posedge clk )
		begin
		if( rst == 0 )
		begin
		for(n=0;n<32;n=n+1)
			begin
			regsiter[n] = 0 ;
			end
		regsiter[29] = 32'h00002ffc ;
		regsiter[28] = 32'h00001800 ;
		end
		else if( GPRWr && DATA_WRITE_ADR !== 0)
			regsiter[DATA_WRITE_ADR] = DATA_WRITE ;
		end
	
endmodule
