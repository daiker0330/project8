module dm_4k (din,be,addr,dout,DMWr,clk,rst) ;
	input       [31:0]  din ;
	input		[3:0]	be ;
	input       [13:2]  addr ;
	input               DMWr ;
	input               clk ;
	input				rst ;
	output      [31:0]  dout ;
	wire		[3:0]	wa ;
	wire				clk_c;
	assign clk_c = ~ clk ;
	assign	wa = be & { DMWr , DMWr , DMWr , DMWr } ;
	DM U_DM(clk_c,wa,addr[13:2],din,dout);
	
	// reg         [31:0]  dout ;
	// reg         [7:0]   dm0[1023:0] ;
	// reg         [15:8]  dm1[1023:0] ;
	// reg         [23:16] dm2[1023:0] ;
	// reg         [31:24] dm3[1023:0] ;
	
	// integer n ;
	
	
	// always @ ( posedge clk )
	// begin
		// if( rst == 0 )
		// begin
		// for(n=0;n<1024;n=n+1)
			// begin
			// dm0[n] = 0 ;
			// dm1[n] = 0 ;
			// dm2[n] = 0 ;
			// dm3[n] = 0 ;
			// end
		// end
		// else if ( DMWr )
			// begin
			// if ( be == 4'b1111 )
				// begin
					// dm0[addr] = din[7:0] ;
					// dm1[addr] = din[15:8] ;
					// dm2[addr] = din[23:16] ;
					// dm3[addr] = din[31:24] ;
				// end
			// else if ( be == 4'b0011 )
				// begin
					// dm0[addr] = din[7:0] ;
					// dm1[addr] = din[15:8] ;
				// end
			// else if ( be == 4'b1100 )
				// begin
					// dm2[addr] = din[7:0] ;
					// dm3[addr] = din[15:8] ;
				// end
			// else if ( be == 4'b0001 )
				// begin
					// dm0[addr] = din[7:0] ;
				// end
			// else if ( be == 4'b0010 )
				// begin
					// dm1[addr] = din[7:0] ;
				// end
			// else if ( be == 4'b0100 )
				// begin
					// dm2[addr] = din[7:0] ;
				// end
			// else if ( be == 4'b1000 )
				// begin
					// dm3[addr] = din[7:0] ;
				// end
			// end
		// else
			// ;
	// end
	
	// always @ ( * )
		// begin
		// dout[7:0] = dm0[addr] ;
		// dout[15:8] = dm1[addr] ;
		// dout[23:16] = dm2[addr] ;
		// dout[31:24] = dm3[addr] ;
		// end
	
endmodule
