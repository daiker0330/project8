module ir(ins_in,ins_out,IRWr,clk);
  input             clk ;
  input             IRWr ;
  input   [31:0]    ins_in ; 
  output  [31:0]    ins_out ;
  reg     [31:0]    ins_out ;
  always @ ( posedge clk )
    if( IRWr )
      ins_out[31:0] = ins_in[31:0] ;
endmodule