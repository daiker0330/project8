`include "head.v"
module led( ADD , DAT_I , Wr , BE , DAT_O , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , clk , mode , RST ) ;
	input		[31:0]	DAT_I ;
	input				Wr ;
	input				clk ;
	input		[3:0]	BE ;
	input 		[31:0]	ADD ;
	input				mode ;
	input				RST ;
	output		[31:0]	DAT_O ;
	output				A ;
	output				B ;
	output				C ;
	output				D ;
	output				E ;
	output				F ;
	output				G ;
	output				DP ;
	output				SEL1 ;
	output				SEL2 ;
	output				SEL3 ;
	output				SEL4 ;

	reg		[31:0]		count ;
	reg		[1:0]		fsm ;
	reg		[31:0]		register ;
	reg		[31:0]		present ;
	wire	[3:0]		num ;
	wire	[3:0]		led_num1 ;
	wire	[3:0]		led_num2 ;
	wire	[3:0]		led_num3 ;
	wire	[3:0]		led_num4 ;
	wire	[7:0]		led ;

	assign { SEL1 , SEL2 , SEL3 , SEL4 } = 	( fsm == `LED_FSM_1 ) ? 4'b1000 :
											( fsm == `LED_FSM_2 ) ? 4'b0100 :
											( fsm == `LED_FSM_3 ) ? 4'b0010 :
											( fsm == `LED_FSM_4 ) ? 4'b0001 :
																	4'b1010 ;
	assign led_num4 =  	( mode == `LED_MODE_0 ) ? present % 10 :
						( mode == `LED_MODE_1 ) ? present[3:0] :
						0 ;
	assign led_num3 =  	( mode == `LED_MODE_0 ) ? present / 10 % 10 :
						( mode == `LED_MODE_1 ) ? present[7:4] :
						0 ;
	assign led_num2 =  	( mode == `LED_MODE_0 ) ? present / 100 % 10 :
						( mode == `LED_MODE_1 ) ? present[11:8] :
						0 ;
	assign led_num1 =  	( mode == `LED_MODE_0 ) ? present / 1000 % 10 :
						( mode == `LED_MODE_1 ) ? present[15:12] :
						0 ;
	assign num = 	( SEL1 ) ? led_num1 : 
					( SEL2 ) ? led_num2 : 
					( SEL3 ) ? led_num3 : 
					( SEL4 ) ? led_num4 :
					0 ;
	assign led = { A , B , C , D , E , F , G , DP } ;
	assign { A , B , C , D , E , F , G , DP } = 	( num == `LED_NUM_0 ) ? `LED_0 : 
													( num == `LED_NUM_1 ) ? `LED_1 : 
													( num == `LED_NUM_2 ) ? `LED_2 : 
													( num == `LED_NUM_3 ) ? `LED_3 : 
													( num == `LED_NUM_4 ) ? `LED_4 : 
													( num == `LED_NUM_5 ) ? `LED_5 : 
													( num == `LED_NUM_6 ) ? `LED_6 : 
													( num == `LED_NUM_7 ) ? `LED_7 : 
													( num == `LED_NUM_8 ) ? `LED_8 : 
													( num == `LED_NUM_9 ) ? `LED_9 : 
													( num == `LED_NUM_A ) ? `LED_A : 
													( num == `LED_NUM_B ) ? `LED_B : 
													( num == `LED_NUM_C ) ? `LED_C : 
													( num == `LED_NUM_D ) ? `LED_D : 
													( num == `LED_NUM_E ) ? `LED_E : 
													( num == `LED_NUM_F ) ? `LED_F : 
													0 ;
	assign DAT_O = 	( ADD == `LED_ADD_1 ) ? register :
					( ADD == `LED_ADD_2 ) ? present :
					0 ;

	always @ ( posedge clk )
	if( RST == 0 )
	begin
		register = 32'b0 ;
		present = 32'd4321 ;
		count = `LED_COUNT ;
		fsm = 2'b00 ;
	end
	else
	begin
		//counter
		if( count == 32'b0 )
		begin
			count = `LED_COUNT ;
			fsm = fsm + 2'b1 ;
		end
		else
			count = count - 32'b1 ;
		//register
		if( Wr && ADD == `LED_ADD_1 )
		begin
			register[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
			register[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
			register[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
			register[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
			present = register ;
		end
		//present
		if( Wr && ADD == `LED_ADD_2 )
		begin
			present[7:0] = BE[0] ? DAT_I[7:0] : 8'b0 ;
			present[15:8] = BE[1] ? DAT_I[15:8] : 8'b0 ;
			present[23:16] = BE[2] ? DAT_I[23:16] : 8'b0 ;
			present[31:24] = BE[3] ? DAT_I[31:24] : 8'b0 ;
		end
	end
endmodule