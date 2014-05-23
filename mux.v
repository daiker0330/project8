module mux_2_32(op,din0,din1,dout) ;
  input           op ;
  input   [31:0]  din0 ;
  input   [31:0]  din1 ;
  output  [31:0]  dout ;
  
  assign dout = ( op == 0 ) ? din0 : din1 ;

endmodule

module mux_2_5(op,din0,din1,dout) ;
  input           op ;
  input   [4:0]  din0 ;
  input   [4:0]  din1 ;
  output  [4:0]  dout ;
  
  assign dout = op ? din1 : din0 ;

endmodule

module mux_3_32(op,din0,din1,din2,dout) ;
  input   [1:0]  op ;
  input   [31:0]  din0 ;
  input   [31:0]  din1 ;
  input   [31:0]  din2 ;
  output  [31:0]  dout ;
  
  assign dout = op[1] ? din2 : 
                op[0] ? din1 :
                        din0 ;

endmodule

module mux_4_32(op,din0,din1,din2,din3,dout) ;
  input   [1:0]  op ;
  input   [31:0]  din0 ;
  input   [31:0]  din1 ;
  input   [31:0]  din2 ;
  input   [31:0]  din3 ;
  output  [31:0]  dout ;
  
  assign dout = ( op == 2'd3 ) ? din3 : 
				( op == 2'd2 ) ? din2 :
                ( op == 2'd1 ) ? din1 :
                ( op == 2'd0 ) ? din0 :
				32'b0 ;

endmodule

module mux_6_32(op,din0,din1,din2,din3,din4,din5,dout) ;
	input   [2:0]  op ;
	input   [31:0]  din0 ;
	input   [31:0]  din1 ;
	input   [31:0]  din2 ;
	input   [31:0]  din3 ;
	input   [31:0]  din4 ;
	input   [31:0]  din5 ;
	output  [31:0]  dout ;
  
	assign dout = 	( op == 3'h0 ) ? din0 : 
					( op == 3'h1 ) ? din1 : 
					( op == 3'h2 ) ? din2 : 
					( op == 3'h3 ) ? din3 : 
					( op == 3'h4 ) ? din4 : 
					( op == 3'h5 ) ? din5 : 
					0 ;

endmodule

module mux_3_5(op,din0,din1,din2,dout) ;
  input   [1:0]  op ;
  input   [4:0]  din0 ;
  input   [4:0]  din1 ;
  input   [4:0]  din2 ;
  output  [4:0]  dout ;
  
  assign dout = op[1] ? din2 : 
                op[0] ? din1 :
                        din0 ;

endmodule