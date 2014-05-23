`include "head.v"
module coco_counter ( CLK_I , RST_I , ADD_I , WE_I , DAT_I , DAT_O , IRQ , BE ) ;
	input					CLK_I ;
	input					RST_I ;
	input		[3:2]		ADD_I ;
	input					WE_I ;
	input		[31:0]		DAT_I ;
	input		[3:0]		BE ;
	output		[31:0]		DAT_O ;
	output					IRQ ;		

	reg			[31:0]		ctrl ;
	reg			[31:0]		present ;
	reg			[31:0]		count ;

	always @ ( posedge CLK_I )
		begin
		//RST
		if( RST_I == 0 )
		begin
			ctrl = { 28'b0 , `COUNTER_RST_CTRL } ;
			present = `COUNTER_RST_PRESENT ;
			count = `COUNTER_RST_COUNT ;
		end
		//COUNT RST
		if( ctrl[2:1] == `COUNTER_CTRL_MODE0 && present == `COUNTER_PRESENT_0 )
			if( WE_I && ADD_I == `COUNTER_ADD_COUNT )
				begin
					present[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
					present[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
					present[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
					present[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
					// if( BE[0] )
						// present[7:0] = DAT_I[7:0] ;
					// if( BE[1] )
						// present[15:8] = DAT_I[15:8] ;
					// if( BE[2] )
						// present[23:16] = DAT_I[23:16] ;
					// if( BE[3] )
						// present[31:24] = DAT_I[31:24] ;
				end
			else
				begin
				ctrl[0] = 0 ;
				end
		if( ctrl[2:1] == `COUNTER_CTRL_MODE1 && present == `COUNTER_PRESENT_0 )
			present = count ;
		//WE
		if( WE_I && ADD_I == `COUNTER_ADD_CTRL)
			begin
				ctrl[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
				ctrl[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
				ctrl[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
				ctrl[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
				// if( BE[0] )
					// ctrl[7:0] = DAT_I[7:0] ;
				// if( BE[1] )
					// ctrl[15:8] = DAT_I[15:8] ;
				// if( BE[2] )
					// ctrl[23:16] = DAT_I[23:16] ;
				// if( BE[3] )
					// ctrl[31:24] = DAT_I[31:24] ;
			end
		if( WE_I && ADD_I == `COUNTER_ADD_PRESENT)
			begin
				present[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
				present[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
				present[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
				present[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
				// if( BE[0] )
					// present[7:0] = DAT_I[7:0] ;
				// if( BE[1] )
					// present[15:8] = DAT_I[15:8] ;
				// if( BE[2] )
					// present[23:16] = DAT_I[23:16] ;
				// if( BE[3] )
					// present[31:24] = DAT_I[31:24] ;
			end
		if( WE_I && ADD_I == `COUNTER_ADD_COUNT)
			begin
				count[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
				count[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
				count[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
				count[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
				// if( BE[0] )
					// count[7:0] <= DAT_I[7:0] ;
				// if( BE[1] )
					// count[15:8] <= DAT_I[15:8] ;
				// if( BE[2] )
					// count[23:16] <= DAT_I[23:16] ;
				// if( BE[3] )
					// count[31:24] <= DAT_I[31:24] ;
				ctrl[0] = 1 ;
			end
		//COUNT
		if( ~( present == `COUNTER_PRESENT_0 ) && ctrl[0] )
			present = present - 1 ;		
		end

	assign DAT_O = 	( ADD_I == `COUNTER_ADD_CTRL ) ? ctrl :
			( ADD_I == `COUNTER_ADD_PRESENT ) ? present :
			( ADD_I == `COUNTER_ADD_COUNT ) ? count :
			32'b0 ;

	assign IRQ = ( present == `COUNTER_PRESENT_0 && ctrl[3] ) ;

endmodule