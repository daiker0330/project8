`include "head.v"
module ext (DATA_IN,DATA_OUT,ExtOP) ;
	input		[15:0]	DATA_IN ;
	input             	ExtOP ;
	output		[31:0]  DATA_OUT ;
	
	wire		[31:0]  DATA_OUT ;
	
	assign DATA_OUT = ( ( ExtOP == `EXTOP_SIGN ) & DATA_IN[15] ) ? {16'hffff,DATA_IN} : {16'h0,DATA_IN} ;
endmodule
