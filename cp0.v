module cp0 ( PC , DIn , HWInt , Sel , Wen , EXLSet , EXLClr , clk , rst , IntReq , EPC , DOut ) ;
	input		[31:2]		PC     ;
	input		[31:0]		DIn    ;
	input		[7:2]		HWInt  ;
	input		[4:0]		Sel    ;
	input					Wen    ;
	input					EXLSet ;
	input					EXLClr ;
	input					clk    ;
	input					rst    ;
	output					IntReq ;
	output		[31:2]		EPC    ;
	output		[31:0]		DOut   ;
	
	reg			[15:10]		im ;
	reg						exl ;
	reg						ie ;
	reg			[15:10]		hwint_pend ;
	reg			[31:2]		epc ;
	reg			[31:0]		prid ;
	reg			[31:0]		DOut ;
	
	wire		[5:0]			imp ;
	
	
	assign imp = ( HWInt[7:2] & im[15:10] ) ;
	assign IntReq = (|imp) & ie & !exl ; 
	assign EPC = epc ;
	
	always @ ( posedge clk )
		begin
		if( rst == 0 )
		begin
			prid = 32'hffff_3333 ;
			epc = 32'b0 ;
			im = 6'b111111 ;
			exl = 1'b0 ;
			ie = 1'b1 ;
		end
		if( Wen && Sel == 5'd12 )
			{ im , exl , ie } = { DIn[15:10] , DIn[1] , DIn[0] } ;
		if( Wen && Sel == 5'd13 )
			hwint_pend = DIn[15:10] ;
		if( Wen && Sel == 5'd14 )
			epc = DIn[31:2] ;
		if( Wen && Sel == 5'd15 )
			prid = DIn ;
		if( EXLSet )
			begin
			exl = 1'b1 ;
			epc = PC ;
			end
		if( EXLClr )
			exl = 1'b0 ;
		end
		
	always @ ( * )
		begin
		DOut = 	( Sel == 5'd12 ) ? { 16'b0 , im , 8'b0 , exl , ie } :
				( Sel == 5'd13 ) ? { 16'b0 , hwint_pend , 10'b0 } :
				( Sel == 5'd14 ) ? { epc , 2'b0 } :
				( Sel == 5'd15 ) ? prid :
				32'b0 ;
		end
endmodule