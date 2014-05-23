module ab(a_in,b_in,a_out,b_out,clk);
  input            clk ;
  input   [31:0]  a_in ; 
  output  [31:0]  a_out ;
  reg     [31:0]  a_out ;
  input   [31:0]  b_in ; 
  output  [31:0]  b_out ;
  reg     [31:0]  b_out ;
  always @ ( posedge clk )
  begin
    a_out <= a_in ;
    b_out <= b_in ;
  end
endmodule