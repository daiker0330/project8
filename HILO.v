module hilo(HIIn,HIWr,LOIn,LOWr,HI,LO,clk) ;
	input		[31:0]	HIIn;
	input		[31:0]	LOIn;
	input			HIWr;
	input			LOWr;
	input			clk;
	output		[31:0]	HI;
	output		[31:0]	LO;

	reg		[31:0]	hi;
	reg		[31:0]	lo;

	assign HI = hi ;
	assign LO = lo ;
	
	always @ ( posedge clk )
		begin
		if ( HIWr )
			hi = HIIn ;
		if( LOWr )
			lo = LOIn ;
		end
endmodule