`include "head.v"
module md ( data_in1 , data_in2 , hi , lo , ALUOp ) ; 
	input		[31:0]	data_in1 ;
	input		[31:0]	data_in2 ;
	input		[3:0]	ALUOp ;
	output		[31:0]	hi ;
	output		[31:0]	lo ;
	
	reg signed	[31:0]	s_data_in1 ;
	reg signed	[31:0]	s_data_in2 ;
	
	reg		[65:0]	ans ;

	always @ ( * )
		begin
		s_data_in1 = data_in1 ;
		s_data_in2 = data_in2 ;
		//MULT
		if ( ALUOp == `ALU_MULT )
			ans[63:0] = s_data_in1 * s_data_in2 ;
		//MULTU
		else if ( ALUOp == `ALU_MULTU )
			ans = { 1'b0 , data_in1 } * { 1'b0 , data_in2 } ;
		//DIV
		else if ( ALUOp == `ALU_DIV )
			begin
			ans[31:0] = s_data_in1 / s_data_in2 ;
			ans[63:32] = s_data_in1 % s_data_in2 ;
			end
		//DIVU
		else if ( ALUOp == `ALU_DIVU )
			begin
			ans[31:0] = data_in1 / data_in2 ;
			ans[63:32] = data_in1 % data_in2 ;
			end
		else
			ans = 0 ;
		end
	
	assign hi = ans[63:32] ;
	assign lo = ans[31:0] ;
endmodule		