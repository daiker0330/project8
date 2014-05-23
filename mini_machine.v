`include "head.v"
module mini_machine ( RST , sys_clk , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 
, DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 
, DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , test_A , test_B , test_C , test_D , test_E 
, test_F , test_G , test_DP , test_SEL1 , test_SEL2 , test_SEL3 , test_SEL4 , test_led ) ;
	input				RST ;
	input				sys_clk ;
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
	output				test_A ;
	output				test_B ;
	output				test_C ;
	output				test_D ;
	output				test_E ;
	output				test_F ;
	output				test_G ;
	output				test_DP ;
	output				test_SEL1 ;
	output				test_SEL2 ;
	output				test_SEL3 ;
	output				test_SEL4 ;
	output				test_led ;

	//bridge
	wire		[31:0]	PrAddr ;
	wire		[3:0]	BE ;
	wire		[31:0]	PrWD ;
	wire		[31:0]	PrRD ;
	wire				Wr ;
	wire		[31:0]	DEV0_Addr ;
	wire		[31:0]	DEV0_RD ;
	wire		[31:0]	DEV0_WD ;
	wire		[3:0]	DEV0_BE ;
	wire		[31:0]	DEV1_Addr ;
	wire		[31:0]	DEV1_RD ;
	wire		[31:0]	DEV1_WD ;
	wire		[3:0]	DEV1_BE ;
	wire		[31:0]	DEV2_Addr ;
	wire		[31:0]	DEV2_RD ;
	wire		[31:0]	DEV2_WD ;
	wire		[3:0]	DEV2_BE ;
	wire				IRQ ;
	wire 		[31:0] 	DEV2_RD2 ;
	wire		[31:0]	test ;
	wire				test_led ;
	wire				clk10 ;
	
	//CLK U_CLK(sys_clk,clk10);
	assign clk10 = sys_clk ;
	
	//mips
	 mips U_MIPS( PrAddr , BE , PrRD , PrWD , clk10 , { 5'b0 , IRQ } , RST , Wr , test , test_led ) ;
	 
	//bridge
	 bridge U_BRIDGE( PrAddr , PrRD , PrWD , Wr , BE , DEV0_Addr , DEV0_RD , DEV0_WD , DEV0_Wr , DEV0_BE 
	 , DEV1_Addr , DEV1_RD , DEV1_WD , DEV1_Wr , DEV1_BE , DEV2_Addr , DEV2_RD , DEV2_WD , DEV2_Wr , DEV2_BE ) ;
	 
	//counter
	coco_counter U_COCOCOUNT( clk10, RST , DEV0_Addr[3:2] , DEV0_Wr , DEV0_WD , DEV0_RD , IRQ , DEV0_BE ) ;
	
	//led
	led U_LED( DEV2_Addr , DEV2_WD , DEV2_Wr , DEV2_BE , DEV2_RD , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 
	, clk10 , `LED_MODE_1 , RST ) ;
	led U_LED_TEST( DEV2_Addr , { 16'b0 , DEV2_WD[31:16] } , DEV2_Wr , DEV2_BE , DEV2_RD2 , test_A , test_B , test_C , test_D , test_E , test_F , test_G , test_DP 
	, test_SEL1 , test_SEL2 , test_SEL3 , test_SEL4 , clk10 , `LED_MODE_1 , RST ) ;
	
	//switch
	switch U_SWITCH( DEV1_RD , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 , DIPSW13 
	, DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 
	, DIPSW29 , DIPSW30 , DIPSW31 ) ;
	
endmodule