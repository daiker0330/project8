module alu_out(alu_in,alu_out,clk);
  input            clk ;
  input   [31:0]  alu_in ; 
  output  [31:0]  alu_out ;
  reg     [31:0]  alu_out ;
  
  always @ ( posedge clk )
    alu_out <= alu_in ;
  
endmodule

