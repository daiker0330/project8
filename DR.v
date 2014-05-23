module dr(data_in,data_out,clk);
  input            clk ;
  input   [31:0]  data_in ; 
  output  [31:0]  data_out ;
  reg     [31:0]  data_out ;
  always @ ( posedge clk )
    data_out <= data_in ;
endmodule
