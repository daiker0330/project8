module testbench_counter() ;
	reg						clk ;
	reg						rst ;
	reg			[3:2]		ADD_I ;
	reg						WE_I ;
	reg			[31:0]		DAT_I ;
	wire		[31:0]		DAT_O ;
	wire					IRQ ;	

	coco_counter U_COUNTER( clk , rst , ADD_I , WE_I , DAT_I , DAT_O , IRQ ) ;
	
	initial 
		begin
		clk = 0 ;
		rst = 0 ;
		ADD_I = 0 ;
		WE_I = 0 ;
		DAT_I = 0 ;
		#100
		rst = 1 ;
		#100 
		rst = 0 ;
		ADD_I = 2'b10 ;
		DAT_I = 32'h5 ;
		WE_I = 1 ;
		#100
		ADD_I = 2'b00 ;
		DAT_I = { 28'b0 , 4'b1011 } ;
		#100
		WE_I = 0 ;
		#2000
		WE_I = 1 ;
		ADD_I = 2'b00 ;
		DAT_I = { 28'b0 , 4'b1001 } ;
		#100
		WE_I = 0 ;
		#1000
		$stop ;
		
		end
		
	always 
		#50 clk = ~clk ;
		
endmodule