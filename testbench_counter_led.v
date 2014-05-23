`include "head.v"
module testbench_counter(sys_clk,CLK_I , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , clk ,IRQ) ;

	reg					CLK_I ;
	reg		[3:2]		ADD_I ;
	reg					WE_I ;
	reg		[31:0]		DAT_I ;
	reg		[3:0]		BE ;
	output					IRQ ;	
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
	
	wire				DAT_O2 ;
	
	initial
	begin
		ADD_I = `COUNTER_ADD_PRESENT ;
		WE_I = 1'b1 ;
		DAT_I = 32'd1234 ;
		#1000
		ADD_I = `COUNTER_ADD_COUNT ;
		WE_I = 1'b1 ;
		DAT_I = 32'd1234 ;
		#1000
		WE_I = 1'b0 ;
	end
	
		CLK U_CLK
 (// Clock in ports
  .CLK_IN1(sys_clk),
  // Clock out ports
  .CLK_OUT1(clk10)
 );
	
	led U_LED( 32'h0000_7f14 , DAT_O , 1'b1 , BE , DAT_O2 , A , B , C , D , E , F , G , DP , SEL1 , SEL2 , SEL3 , SEL4 , sys_clk ) ;
	coco_counter ( sys_clk , 0 , ADD_I , WE_I , DAT_I , DAT_O , IRQ , BE ) ;
	
endmodule 