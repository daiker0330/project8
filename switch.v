module switch ( DAT_O , DIPSW0 , DIPSW1 , DIPSW2 , DIPSW3 , DIPSW4 , DIPSW5 , DIPSW6 , DIPSW7 , DIPSW8 , DIPSW9 , DIPSW10 , DIPSW11 , DIPSW12 , DIPSW13 , DIPSW14 , DIPSW15 , DIPSW16 , DIPSW17 , DIPSW18 , DIPSW19 , DIPSW20 , DIPSW21 , DIPSW22 , DIPSW23 , DIPSW24 , DIPSW25 , DIPSW26 , DIPSW27 , DIPSW28 , DIPSW29 , DIPSW30 , DIPSW31 ) ;

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
	output		[31:0]		DAT_O ;

	assign DAT_O = 	{ DIPSW31 
					, DIPSW30
					, DIPSW29
					, DIPSW28
					, DIPSW27
					, DIPSW26
					, DIPSW25
					, DIPSW24
					, DIPSW23
					, DIPSW22
					, DIPSW21
					, DIPSW20
					, DIPSW19 
					, DIPSW18
					, DIPSW17 
					, DIPSW16 
					, DIPSW15 
					, DIPSW14 
					, DIPSW13 
					, DIPSW12 
					, DIPSW11 
					, DIPSW10 
					, DIPSW9 
					, DIPSW8 
					, DIPSW7 
					, DIPSW6
					, DIPSW5 
					, DIPSW4 
					, DIPSW3 
					, DIPSW2 
					, DIPSW1 
					, DIPSW0 } ;

endmodule
