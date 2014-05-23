module testbench_machine() ;
	reg						clk ;
	reg						rst ;
	reg						DIPSW0 ;
	reg						DIPSW1 ;
	reg						DIPSW2 ;
	reg						DIPSW3 ;
	reg						DIPSW4 ;
	reg						DIPSW5 ;
	reg						DIPSW6 ;
	reg						DIPSW7 ;
	reg						DIPSW8 ;
	reg						DIPSW9 ;
	reg						DIPSW10 ;
	reg						DIPSW11 ;
	reg						DIPSW12 ;
	reg						DIPSW13 ;
	reg						DIPSW14 ;
	reg						DIPSW15 ;
	reg						DIPSW16 ;
	reg						DIPSW17 ;
	reg						DIPSW18 ;
	reg						DIPSW19 ;
	reg						DIPSW20 ;
	reg						DIPSW21 ;
	reg						DIPSW22 ;
	reg						DIPSW23 ;
	reg						DIPSW24 ;
	reg						DIPSW25 ;
	reg						DIPSW26 ;
	reg						DIPSW27 ;
	reg						DIPSW28 ;
	reg						DIPSW29 ;
	reg						DIPSW30 ;
	reg						DIPSW31 ;
	wire					A ;
	wire					B ;
	wire					C ;
	wire					D ;
	wire					E ;
	wire					F ;
	wire					G ;
	wire					DP ;
	wire					SEL1 ;
	wire					SEL2 ;
	wire					SEL3 ;
	wire					SEL4 ;
	wire					test_A ;
	wire					test_B ;
	wire					test_C ;
	wire					test_D ;
	wire					test_E ;
	wire					test_F ;
	wire					test_G ;
	wire					test_DP ;
	wire					test_SEL1 ;
	wire					test_SEL2 ;
	wire					test_SEL3 ;
	wire					test_SEL4 ;
	
	mini_machine U_MINI( rst , clk , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 
, DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 
, DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , test_A , test_B , test_C , test_D , test_E 
, test_F , test_G , test_DP , test_SEL1 , test_SEL2 , test_SEL3 , test_SEL4 ) ;
	
	initial 
		begin
		clk = 1 ;
		rst = 1 ;
		
		{ DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10
 , DIPSW11 , DIPSW12 , DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 
 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 } = 32'h20 ;
		#1000
		rst = 0 ;
		#1000 
		rst = 1 ;
		#1000
		{ DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10
 , DIPSW11 , DIPSW12 , DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 
 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 } = 32'hfffa ;
		#50000
		$stop ;
		
		end
		
	always 
		#50 clk = ~clk ;
		
endmodule