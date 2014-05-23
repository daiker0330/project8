module im_4k (addr,dout,clk,rst) ;
	input         [31:2]  addr ;
	input					clk ;
	input					rst ;
	output        [31:0]  dout ;
	wire					clk_neg;
	//reg           [31:0]  dout ;
	//reg           [31:0]  im[1023:0] ;
	assign clk_neg = ~clk ;
	IM U_IM(clk_neg,addr[14:2] ,dout);
	
	// always @ ( rst )
	// if( rst == 0 )
	// begin
		// im[32'd0] = 32'h34057f00 ;
		// im[32'd1] = 32'h34067f04 ;
		// im[32'd2] = 32'h34077f08 ;
		// im[32'd3] = 32'h34087f0c ;
		// im[32'd4] = 32'h34097f10 ;
		// im[32'd5] = 32'h34187f14 ;
		// im[32'd6] = 32'h34140009 ;
		// im[32'd7] = 32'h3415FFFF ;
		// im[32'd8] = 32'h8d160000 ;
		// im[32'd9] = 32'h8d370000 ;
		// im[32'd10] = 32'h12d70001 ;
		// im[32'd11] = 32'had360000 ;
		// im[32'd12] = 32'h1000fffb ;
	
		// im[32'h0000_4180] = 32'h8f190000 ;
		// im[32'h0000_4184] = 32'h23390001 ;
		// im[32'h0000_4188] = 32'haf190000 ;
		// im[32'h0000_418c] = 32'hacb40000 ;
		// im[32'h0000_4190] = 32'hacf50000 ;
		// im[32'h0000_4194] = 32'h42000018 ;
	// end
	
	// always @ ( * )
		// dout <= im[addr] ;
		

		
endmodule

    