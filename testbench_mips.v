module testbench_mips() ;
  
	reg                 clk ;
	reg                 rst ;
	/*
	wire      [31:0]    pc ;
	wire      [31:0]    npc ;
	wire      [31:0]    imm ;
	
	
	wire      [4:0]   DATA_READ_ADR1 ;
	wire      [4:0]   DATA_READ_ADR2 ;
	wire      [31:0]  DATA_WRITE ;
	wire      [4:0]   DATA_WRITE_ADR ;
	wire              RegWrite ;
	wire      [31:0]  DATA_READ1 ;
	wire      [31:0]  DATA_READ2 ;
	
	wire              zero ;
	wire              if_beq ;
	wire      [31:2]  beq_m ;
	*/
	wire      	[9:0]     	addr ;
	wire		[31:0]		dm0 ;
	wire		[31:0]		dm1 ;
	wire		[31:0]		dm2 ;
	wire		[31:0]		PrDOut ;
	wire		[3:0]		BE ;
	wire		[31:2]		PrAddr ;
	reg			[31:0]  	regsiter[31:0] ;
	reg			[10:0]		num ;
	reg			[7:2]		HWInt ;
	reg			[31:0]		PrDIn ;
	wire		[31:0]		eret ;
	
	
	mips U_MIPS( PrAddr , BE , PrDIn , PrDOut , clk , HWInt , rst ) ;
	
	initial begin
		num = 0 ;
		clk = 1 ;
		rst = 0 ;
		HWInt = 6'b0 ;
		$readmemh( "code.txt" , U_MIPS.U_IM.im ) ;
		#100 ;
		rst = 1 ;
		#100 ;
		rst = 0 ;
		#300 ;
		
		#30000 ;
		
		
		$stop ;
	end
  /*
  assign zero = U_MIPS.U_NPC.Zero ;
  assign if_beq = U_MIPS.U_NPC.IfBeq ;
  assign beq_m = U_MIPS.U_NPC.beq ;
  
  assign DATA_READ_ADR1 = U_MIPS.U_GPR.DATA_READ_ADR1 ;
  assign DATA_READ_ADR2 = U_MIPS.U_GPR.DATA_READ_ADR2 ;
  assign DATA_WRITE = U_MIPS.U_GPR.DATA_WRITE ;
  assign DATA_WRITE_ADR = U_MIPS.U_GPR.DATA_WRITE_ADR ;
  assign RegWrite = U_MIPS.U_GPR.RegWrite ;
  assign DATA_READ1 = U_MIPS.U_GPR.DATA_READ1 ;
  assign DATA_READ2 = U_MIPS.U_GPR.DATA_READ2 ;
  
  assign pc = U_MIPS.pc ;
  assign npc = U_MIPS.npc ;
  assign imm = U_MIPS.imm ;
  
  */
	assign addr = U_MIPS.U_IM.addr ;
	assign dm0 = { U_MIPS.U_DM.dm3[0] , U_MIPS.U_DM.dm2[0] , U_MIPS.U_DM.dm1[0] , U_MIPS.U_DM.dm0[0] } ;
	assign dm1 = { U_MIPS.U_DM.dm3[1] , U_MIPS.U_DM.dm2[1] , U_MIPS.U_DM.dm1[1] , U_MIPS.U_DM.dm0[1] } ;
	assign dm2 = { U_MIPS.U_DM.dm3[2] , U_MIPS.U_DM.dm2[2] , U_MIPS.U_DM.dm1[2] , U_MIPS.U_DM.dm0[2] } ;
	assign eret = U_MIPS.U_IM.im[96] ;
	
	always  
		begin
        #50 clk = ~clk ;
		//dm = { U_MIPS.U_DM.dm3[31:0] , U_MIPS.U_DM.dm2[31:0] , U_MIPS.U_DM.dm1[31:0] , U_MIPS.U_DM.dm0[31:0] } ;
		//regsiter = U_MIPS.U_GPR.regsiter ;
		end
  
	always @ ( U_MIPS.U_CTRL.count )
		if( U_MIPS.U_CTRL.count == 1 )
			num = num + 1 ;
  
endmodule





