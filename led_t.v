`include "head.v"
module led_t(sys_clk, A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , clk , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 , DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 ) ;
	input				sys_clk ;
	
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
	output				clk ;
	
	input				DIPSW0 ;
	input				DIPSW1 ;
	input				DIPSW2 ;
	input				DIPSW3 ;
	input				DIPSW4 ;
	input				DIPSW5 ;
	input				DIPSW6 ;
	input				DIPSW7 ;
	input				DIPSW8 ;
	input				DIPSW9 ;
	input				DIPSW10 ;
	input				DIPSW11 ;
	input				DIPSW12 ;
	input				DIPSW13 ;
	input				DIPSW14 ;
	input				DIPSW15 ;
	input				DIPSW16 ;
	input				DIPSW17 ;
	input				DIPSW18 ;
	input				DIPSW19 ;
	input				DIPSW20 ;
	input				DIPSW21 ;
	input				DIPSW22 ;
	input				DIPSW23 ;
	input				DIPSW24 ;
	input				DIPSW25 ;
	input				DIPSW26 ;
	input				DIPSW27 ;
	input				DIPSW28 ;
	input				DIPSW29 ;
	input				DIPSW30 ;
	input				DIPSW31 ;
	
	reg			[31:0]	PrAddr ;
	reg			[31:0]	PrWD ;
	wire		[31:0]	DEV0_RD ;
	wire		[31:0]	DEV1_RD ;
	wire		[31:0]	DEV2_RD ;
	wire		[3:0]	BE2 ;
	wire		[31:0]	PrRD ;
	wire		[31:0]	DEV0_WD ;
	wire		[31:0]	DEV0_Addr ;
	wire				DEV0_Wr ;
	wire		[3:0]	DEV0_BE ;
	wire		[31:0]	DEV1_WD ;
	wire		[31:0]	DEV1_Addr ;
	wire				DEV1_Wr ;
	wire		[3:0]	DEV1_BE ;
	wire		[31:0]	DEV2_WD ;
	wire		[31:0]	DEV2_Addr ;
	wire				DEV2_Wr ;
	wire		[3:0]	DEV2_BE ;
	
	wire		[31:0]	DAT_I ;
	reg					Wr ;
	reg					Wr2 ;
	wire		[3:0]	BE ;
	wire		[31:0]	DAT_O1 ;
	wire		[31:0]	DAT_O2 ;
	reg			[31:0]	temp ;				

	// initial
		// Wr = 0 ;
	
	// assign clk = 1'b1 ;
	// assign BE = 4'b1111 ;
	
	// always @ ( negedge CLK_OUT1 )
	// begin
		// Wr = ~ Wr ;
		// if( Wr )
		// begin
			// PrWD = temp ;
			// Wr2 = 1 ;
		// end
		// else
		// begin
			// Wr2 = 0 ;
			// temp = PrRD ;
		// end
	// end
	
	// always @ ( posedge CLK_OUT1 )
	// begin
		// if( Wr )
		// begin
			// PrAddr = `LED_ADD_2;
		// end
		// else
		// begin
			// PrAddr = `SWITCH_ADD ;

		// end
	// end
	
	// bridge U_BRIDGE( PrAddr , PrRD , PrWD , Wr2 , BE2 , DEV0_Addr , DEV0_RD , DEV0_WD , DEV0_Wr , DEV0_BE , DEV1_Addr , DEV1_RD , DEV1_WD , DEV1_Wr , DEV1_BE , DEV2_Addr , DEV2_RD , DEV2_WD , DEV2_Wr , DEV2_BE ) ;
	
	switch U_SWITCH( DEV1_RD , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 , DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 ) ;	
	
	CLK clk_fpga(sys_clk,CLK_OUT1);
	
	led U_LED( `LED_ADD_2 , DEV1_RD , 1'b1 , 4'b1111 , DEV2_RD , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , CLK_OUT1 ) ;

endmodule