module be_ext ( data_in , BE , BExtOP , data_out ) ;
	input		[31:0]	data_in ;
	input		[3:0]	BE ;
	input				BExtOP ;
	output		[31:0]	data_out ;
	
	assign data_out = 	( BE == 4'b1111 ) ?  data_in :
						( BExtOP == 1 && BE == 4'b0011 ) ? {16'b0,data_in[15:0]} :
						( BExtOP == 1 && BE == 4'b1100 ) ? {16'b0,data_in[31:16]} :
						( BExtOP == 1 && BE == 4'b0001 ) ? {24'b0,data_in[7:0]} :
						( BExtOP == 1 && BE == 4'b0010 ) ? {24'b0,data_in[15:8]} :
						( BExtOP == 1 && BE == 4'b0100 ) ? {24'b0,data_in[23:16]} :
						( BExtOP == 1 && BE == 4'b1000 ) ? {24'b0,data_in[31:24]} :
						( BExtOP == 0 && BE == 4'b0011 ) ? 
							data_in[15] ? {16'hffff,data_in[15:0]} : {16'b0,data_in[15:0]} :
						( BExtOP == 0 && BE == 4'b1100 ) ? 
							data_in[31] ? {16'hffff,data_in[31:16]} : {16'b0,data_in[31:16]} :
						( BExtOP == 0 && BE == 4'b0001 ) ? 
							data_in[7] ? {24'hffffff,data_in[7:0]} : {24'b0,data_in[7:0]} :
						( BExtOP == 0 && BE == 4'b0010 ) ? 
							data_in[15] ? {24'hffffff,data_in[15:8]} : {24'b0,data_in[15:8]} :
						( BExtOP == 0 && BE == 4'b0100 ) ? 
							data_in[23] ? {24'hffffff,data_in[23:16]} : {24'b0,data_in[23:16]} :
						( BExtOP == 0 && BE == 4'b1000 ) ? 
							data_in[31] ? {24'hffffff,data_in[31:24]} : {24'b0,data_in[31:24]} :
						32'b0 ;
endmodule