`include "head.v"
module be ( BESel , ALUOut , BE ) ;
	input		[1:0]	BESel ;
	input		[1:0]	ALUOut ;
	output		[3:0]	BE ;
	
	assign BE = ( BESel == `BESEL_W ) ? 4'b1111 :
				( BESel == `BESEL_H && ALUOut[1] == 1'b1 ) ? 4'b1100 :
				( BESel == `BESEL_H && ALUOut[1] == 1'b0 ) ? 4'b0011 :
				( BESel == `BESEL_B && ALUOut == 2'b00 ) ? 4'b0001 :
				( BESel == `BESEL_B && ALUOut == 2'b01 ) ? 4'b0010 :
				( BESel == `BESEL_B && ALUOut == 2'b10 ) ? 4'b0100 :
				( BESel == `BESEL_B && ALUOut == 2'b11 ) ? 4'b1000 :
				4'b0000 ;
				
endmodule