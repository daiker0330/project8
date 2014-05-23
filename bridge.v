`include "head.v"
module bridge( PrAddr , PrRD , PrWD , Wr , BE , DEV0_Addr , DEV0_RD , DEV0_WD , DEV0_Wr , DEV0_BE , DEV1_Addr , DEV1_RD , DEV1_WD , DEV1_Wr , DEV1_BE , DEV2_Addr , DEV2_RD , DEV2_WD , DEV2_Wr , DEV2_BE ) ;
	input		[31:0]		PrAddr ;
	input		[31:0]		PrWD ;
	input		[31:0]		DEV0_RD ;
	input		[31:0]		DEV1_RD ;
	input		[31:0]		DEV2_RD ;
	input					Wr ;
	input		[3:0]		BE ;
	output		[31:0]		PrRD ;
	output		[31:0]		DEV0_WD ;
	output		[31:0]		DEV0_Addr ;
	output					DEV0_Wr ;
	output		[3:0]		DEV0_BE ;
	output		[31:0]		DEV1_WD ;
	output		[31:0]		DEV1_Addr ;
	output					DEV1_Wr ;
	output		[3:0]		DEV1_BE ;
	output		[31:0]		DEV2_WD ;
	output		[31:0]		DEV2_Addr ;
	output					DEV2_Wr ;
	output		[3:0]		DEV2_BE ;

	//counter:7f00 7f04 7f08
	//switch:7f0c
	//8LED:7f10 7f14
	
	//DEV0
	assign DEV0_Wr = ( PrAddr[31:0] == `COUNTER_ADD_1 || PrAddr[31:0] == `COUNTER_ADD_2 || PrAddr[31:0] == `COUNTER_ADD_3 ) ? Wr : 1'b0 ;  
	assign DEV0_WD = ( PrAddr[31:0] == `COUNTER_ADD_1 || PrAddr[31:0] == `COUNTER_ADD_2 || PrAddr[31:0] == `COUNTER_ADD_3 ) ? PrWD : 32'b0 ; 
	assign DEV0_Addr = ( PrAddr[31:0] == `COUNTER_ADD_1 || PrAddr[31:0] == `COUNTER_ADD_2 || PrAddr[31:0] == `COUNTER_ADD_3 ) ? PrAddr : 32'b0 ; 
	assign DEV0_BE = ( PrAddr[31:0] == `COUNTER_ADD_1 || PrAddr[31:0] == `COUNTER_ADD_2 || PrAddr[31:0] == `COUNTER_ADD_3 ) ? BE : 4'b0 ;
	//DEV1
	assign DEV1_Wr = ( PrAddr[31:0] == `SWITCH_ADD ) ? Wr : 1'b0 ;  
	assign DEV1_WD = ( PrAddr[31:0] == `SWITCH_ADD ) ? PrWD : 32'b0 ; 
	assign DEV1_Addr = ( PrAddr[31:0] == `SWITCH_ADD ) ? PrAddr : 32'b0 ; 
	assign DEV1_BE = ( PrAddr[31:0] == `SWITCH_ADD ) ? BE : 4'b0 ;
	//DEV2
	assign DEV2_Wr = ( PrAddr[31:0] == `LED_ADD_1 || PrAddr[31:0] == `LED_ADD_2 ) ? Wr : 1'b0 ;  
	assign DEV2_WD = ( PrAddr[31:0] == `LED_ADD_1 || PrAddr[31:0] == `LED_ADD_2 ) ? PrWD : 32'b0 ; 
	assign DEV2_Addr = ( PrAddr[31:0] == `LED_ADD_1 || PrAddr[31:0] == `LED_ADD_2 ) ? PrAddr : 32'b0 ;
	assign DEV2_BE = ( PrAddr[31:0] == `LED_ADD_1 || PrAddr[31:0] == `LED_ADD_2 ) ? BE : 4'b0 ;
	//CPU
	assign PrRD = 	( PrAddr[31:0] == `COUNTER_ADD_1 || PrAddr[31:0] == `COUNTER_ADD_2 || PrAddr[31:0] == `COUNTER_ADD_3 ) ? DEV0_RD : 
					( PrAddr[31:0] == `SWITCH_ADD ) ? DEV1_RD : 
					( PrAddr[31:0] == `LED_ADD_1 || PrAddr[31:0] == `LED_ADD_2 ) ? DEV2_RD : 
					0 ; 

endmodule