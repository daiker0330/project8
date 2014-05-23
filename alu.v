`include "head.v"
module alu (DATA_IN1,DATA_IN2,S,ALUCtr,DATA_OUT,Zero,Sign,ALUMovOp) ;
	input     	[31:0]  DATA_IN1 ;
	input     	[31:0]  DATA_IN2 ;
	input     	[3:0]   ALUCtr ;
	input		[1:0]	ALUMovOp ;
	input		[4:0]	S ;
	output    	[31:0]  DATA_OUT ;
	output            	Zero ;
	output				Sign ;
	
	reg       	[31:0]  DATA_OUT ;
	reg			[5:0]	times ;
	wire              	Zero ;
	reg			[32:0]	temp ;
	
	always @ ( * )
	begin
		//ADD
		if( ALUCtr == `ALU_ADD )
			DATA_OUT = DATA_IN1 + DATA_IN2 ;
		//SUB
		else if( ALUCtr == `ALU_SUB )
			DATA_OUT = DATA_IN1 - DATA_IN2 ;
		//SLL
		else if( ALUCtr == `ALU_SLL )
			begin
			if( ALUMovOp == `ALU_MOV_S )
				times = S ;
			else if( ALUMovOp == `ALU_MOV_M_RS )
				times = DATA_IN1[5:0] ;
			else if( ALUMovOp == `ALU_MOV_M_16 )
				times = 5'd16 ;
			else
				times = 5'h1f ;
			DATA_OUT = DATA_IN2 << times ;
			end
		//SRL
		else if( ALUCtr == `ALU_SLR )
			begin
			if( ALUMovOp == `ALU_MOV_S )
				times = S ;
			else if( ALUMovOp == `ALU_MOV_M_RS )
				times = DATA_IN1[5:0] ;
			else
				times = 5'h1f ;
			DATA_OUT = DATA_IN2 >> times ;
			end
		//SRA
		else if( ALUCtr == `ALU_SRA )
			begin
			if( ALUMovOp == `ALU_MOV_S )
				times = S ;
			else if( ALUMovOp == `ALU_MOV_M_RS )
				times = DATA_IN1[5:0] ;
			else
				times = 5'h1f ;
			DATA_OUT = DATA_IN2 ;
			//repeat( times )
			//	DATA_OUT = { DATA_OUT[31] , DATA_OUT[31:1] } ;
			DATA_OUT = DATA_IN2 >>> times ; 
			end
		//AND
		else if( ALUCtr == `ALU_AND )
			DATA_OUT = DATA_IN1 & DATA_IN2 ;
		//OR
		else if( ALUCtr == `ALU_OR )
			DATA_OUT = DATA_IN1 | DATA_IN2 ;
		//XOR
		else if( ALUCtr == `ALU_XOR )
			DATA_OUT = DATA_IN1 ^ DATA_IN2 ;
		//NOR
		else if( ALUCtr == `ALU_NOR )
			DATA_OUT = ~ ( DATA_IN1 | DATA_IN2 ) ;
		//SLT
		else if( ALUCtr == `ALU_SLT )
			begin
			temp = { DATA_IN1 , 1'b0 } - { DATA_IN2 , 1'b0 } ;
			DATA_OUT = temp[32] ? { 31'b0 , 1'b1 } : 32'b0 ;	
			end
		//SLTU
		else if( ALUCtr == `ALU_SLTU )
			begin
			temp = {1'b0 , DATA_IN1 } - {1'b0 , DATA_IN2 } ;
			DATA_OUT = temp[32] ? { 31'b0 , 1'b1 } : 32'b0 ;
			end
		else
			DATA_OUT = 32'b0;
	end
	
	assign Zero = DATA_OUT ? 1'b0 : 1'b1 ;
	assign Sign = DATA_OUT[31] ;
	
endmodule 