module ctrl ( OP , F , RT , RS , Zero , Sign , IntReq , EXLSet , NPCOp , PCWr , IRWr , WDSel , GPRSel , GPRWr , 
ExtOp , BSel , ALUOp , ALUMovOp , BESel , BExtOP , GPRR2Sel , LOWr , HIWr , CP0Wr , CP0CLRWr , DMWr , clk , RST ) ;
input    [5:0]   OP ;
input    [5:0]   F ;
input    [4:0]   RT ;
input    [4:0]   RS ;
input			RST ;
input        clk ;
input        Zero ;
input        Sign ;
input        IntReq ;
output    [2:0]  NPCOp ;
output    [2:0]  WDSel ;
output    [1:0]  GPRSel ;
output    [0:0]  ExtOp ;
output    [0:0]  BSel ;
output    [3:0]  ALUOp ;
output    [1:0]  ALUMovOp ;
output    [1:0]  BESel ;
output    [0:0]  BExtOP ;
output    [0:0]  GPRR2Sel ;
output     PCWr ;
output     IRWr ;
output     GPRWr ;
output     LOWr ;
output     HIWr ;
output     CP0Wr ;
output     CP0CLRWr ;
output     DMWr ;

output        EXLSet ;
reg   [2:0]  NPCOp ;
reg   [2:0]  WDSel ;
reg   [1:0]  GPRSel ;
reg   [0:0]  ExtOp ;
reg   [0:0]  BSel ;
reg   [3:0]  ALUOp ;
reg   [1:0]  ALUMovOp ;
reg   [1:0]  BESel ;
reg   [0:0]  BExtOP ;
reg   [0:0]  GPRR2Sel ;
reg     PCWr ;
reg     IRWr ;
reg     GPRWr ;
reg     LOWr ;
reg     HIWr ;
reg     CP0Wr ;
reg     CP0CLRWr ;
reg     DMWr ;

reg       LB ;
reg       LBU ;
reg       LH ;
reg       LHU ;
reg       LW ;
reg       SB ;
reg       SH ;
reg       SW ;
reg       ADD ;
reg       ADDU ;
reg       SUB ;
reg       SUBU ;
reg       SLL ;
reg       SRL ;
reg       SRA ;
reg       SLLV ;
reg       SRLV ;
reg       SRAV ;
reg       AND ;
reg       OR ;
reg       XOR ;
reg       NOR ;
reg       MULT ;
reg       MULTU ;
reg       DIV ;
reg       DIVU ;
reg       ADDI ;
reg       ADDIU ;
reg       ANDI ;
reg       ORI ;
reg       XORI ;
reg       LUI ;
reg       SLTI ;
reg       SLTIU ;
reg       BEQ ;
reg       BNE ;
reg       BLEZ ;
reg       BGTZ ;
reg       BLTZ ;
reg       BGEZ ;
reg       J ;
reg       JAL ;
reg       JALR ;
reg       JR ;
reg       MFHI ;
reg       MFLO ;
reg       MTHI ;
reg       MTLO ;
reg       ERET ;
reg       MFC0 ;
reg       MTC0 ;

reg   [2:0]   count ;
reg   [2:0]   next_count ;
reg           S1 ;
reg           S2 ;
reg           S3 ;
reg           S4 ;
reg           S5 ;
reg           S6 ;

// always @ ( RST )
// if( RST == 0 )
// begin
  // count = 3'd0 ;
  // next_count = 3'd0 ;
  // S1 = 1'b0 ;
  // S2 = 1'b0 ;
  // S3 = 1'b0 ;
  // S4 = 1'b0 ;
  // S5 = 1'b0 ;
  // S6 = 1'b0 ;

  // NPCOp = 3'b0 ;
  // ExtOp = 1'b0 ;
  // ALUOp = 4'b0 ;
  // ALUMovOp = 2'b0 ;
  // WDSel = 3'b0 ;
  // GPRSel = 2'b0 ;
  // BSel = 1'b0 ;
  // BESel = 2'b0 ;
  // GPRR2Sel = 1'b0 ;
  // PCWr = 1'b0 ;
  // IRWr = 1'b0 ;
  // GPRWr = 1'b0 ;
  // LOWr = 1'b0 ;
  // HIWr = 1'b0 ;
  // CP0Wr = 1'b0 ;
  // CP0CLRWr = 1'b0 ;
  // DMWr = 1'b0 ;

 // LB = 1'b0 ;
 // LBU = 1'b0 ;
 // LH = 1'b0 ;
 // LHU = 1'b0 ;
 // LW = 1'b0 ;
 // SB = 1'b0 ;
 // SH = 1'b0 ;
 // SW = 1'b0 ;
 // ADD = 1'b0 ;
 // ADDU = 1'b0 ;
 // SUB = 1'b0 ;
 // SUBU = 1'b0 ;
 // SLL = 1'b0 ;
 // SRL = 1'b0 ;
 // SRA = 1'b0 ;
 // SLLV = 1'b0 ;
 // SRLV = 1'b0 ;
 // SRAV = 1'b0 ;
 // AND = 1'b0 ;
 // OR = 1'b0 ;
 // XOR = 1'b0 ;
 // NOR = 1'b0 ;
 // MULT = 1'b0 ;
 // MULTU = 1'b0 ;
 // DIV = 1'b0 ;
 // DIVU = 1'b0 ;
 // ADDI = 1'b0 ;
 // ADDIU = 1'b0 ;
 // ANDI = 1'b0 ;
 // ORI = 1'b0 ;
 // XORI = 1'b0 ;
 // LUI = 1'b0 ;
 // SLTI = 1'b0 ;
 // SLTIU = 1'b0 ;
 // BEQ = 1'b0 ;
 // BNE = 1'b0 ;
 // BLEZ = 1'b0 ;
 // BGTZ = 1'b0 ;
 // BLTZ = 1'b0 ;
 // BGEZ = 1'b0 ;
 // J = 1'b0 ;
 // JAL = 1'b0 ;
 // JALR = 1'b0 ;
 // JR = 1'b0 ;
 // MFHI = 1'b0 ;
 // MFLO = 1'b0 ;
 // MTHI = 1'b0 ;
 // MTLO = 1'b0 ;
 // ERET = 1'b0 ;
 // MFC0 = 1'b0 ;
 // MTC0 = 1'b0 ;
// end
  assign EXLSet = IntReq & S6 ;
always @ ( * )
begin
 S1 = ( count == 3'h1 ) ? 1'b1 : 1'b0 ;
 S2 = ( count == 3'h2 ) ? 1'b1 : 1'b0 ;
 S3 = ( count == 3'h3 ) ? 1'b1 : 1'b0 ;
 S4 = ( count == 3'h4 ) ? 1'b1 : 1'b0 ;
 S5 = ( count == 3'h5 ) ? 1'b1 : 1'b0 ;
 S6 = ( count == 3'h6 ) ? 1'b1 : 1'b0 ;

  LB = ( OP == 6'b 100000  ) ? 1'b1 : 1'b0 ;
  LBU = ( OP == 6'b100100 ) ? 1'b1 : 1'b0 ;
  LH = ( OP == 6'b100001 ) ? 1'b1 : 1'b0 ;
  LHU = ( OP == 6'b100101 ) ? 1'b1 : 1'b0 ;
  LW = ( OP == 6'b100011 ) ? 1'b1 : 1'b0 ;
  SB = ( OP == 6'b101000 ) ? 1'b1 : 1'b0 ;
  SH = ( OP == 6'b101001 ) ? 1'b1 : 1'b0 ;
  SW = ( OP == 6'b101011 ) ? 1'b1 : 1'b0 ;
  ADD = ( OP == 6'b000000 && F == 6'b100000 ) ? 1'b1 : 1'b0 ;
  ADDU = ( OP == 6'b000000 && F == 6'b100001 ) ? 1'b1 : 1'b0 ;
  SUB = ( OP == 6'b000000 && F == 6'b100010 ) ? 1'b1 : 1'b0 ;
  SUBU = ( OP == 6'b000000 && F == 6'b100011 ) ? 1'b1 : 1'b0 ;
  SLL = ( OP == 6'b000000 && F == 6'b000000 ) ? 1'b1 : 1'b0 ;
  SRL = ( OP == 6'b000000 && F == 6'b000010 ) ? 1'b1 : 1'b0 ;
  SRA = ( OP == 6'b000000 && F == 6'b000011 ) ? 1'b1 : 1'b0 ;
  SLLV = ( OP == 6'b000000 && F == 6'b000100 ) ? 1'b1 : 1'b0 ;
  SRLV = ( OP == 6'b000000 && F == 6'b000110 ) ? 1'b1 : 1'b0 ;
  SRAV = ( OP == 6'b000000 && F == 6'b000111 ) ? 1'b1 : 1'b0 ;
  AND = ( OP == 6'b000000 && F == 6'b100100 ) ? 1'b1 : 1'b0 ;
  OR = ( OP == 6'b000000 && F == 6'b100101 ) ? 1'b1 : 1'b0 ;
  XOR = ( OP == 6'b000000 && F == 6'b100110 ) ? 1'b1 : 1'b0 ;
  NOR = ( OP == 6'b000000 && F == 6'b100111 ) ? 1'b1 : 1'b0 ;
  MULT = ( OP == 6'b000000 && F == 6'b011000 ) ? 1'b1 : 1'b0 ;
  MULTU = ( OP == 6'b000000 && F == 6'b011001 ) ? 1'b1 : 1'b0 ;
  DIV = ( OP == 6'b000000 && F == 6'b011010 ) ? 1'b1 : 1'b0 ;
  DIVU = ( OP == 6'b000000 && F == 6'b011011 ) ? 1'b1 : 1'b0 ;
  ADDI = ( OP == 6'b001000 ) ? 1'b1 : 1'b0 ;
  ADDIU = ( OP == 6'b001001 ) ? 1'b1 : 1'b0 ;
  ANDI = ( OP == 6'b001100 ) ? 1'b1 : 1'b0 ;
  ORI = ( OP == 6'b001101 ) ? 1'b1 : 1'b0 ;
  XORI = ( OP == 6'b001110 ) ? 1'b1 : 1'b0 ;
  LUI = ( OP == 6'b001111 ) ? 1'b1 : 1'b0 ;
  SLTI = ( OP == 6'b001010 ) ? 1'b1 : 1'b0 ;
  SLTIU = ( OP == 6'b001011 ) ? 1'b1 : 1'b0 ;
  BEQ = ( OP == 6'b000100 ) ? 1'b1 : 1'b0 ;
  BNE = ( OP == 6'b000101 ) ? 1'b1 : 1'b0 ;
  BLEZ = ( OP == 6'b000110 ) ? 1'b1 : 1'b0 ;
  BGTZ = ( OP == 6'b000111 ) ? 1'b1 : 1'b0 ;
  BLTZ = ( OP == 6'b000001 && RT == 5'b00000 ) ? 1'b1 : 1'b0 ;
  BGEZ = ( OP == 6'b000001 && RT == 5'b00001 ) ? 1'b1 : 1'b0 ;
  J = ( OP == 6'b000010 ) ? 1'b1 : 1'b0 ;
  JAL = ( OP == 6'b000011 ) ? 1'b1 : 1'b0 ;
  JALR = ( OP == 6'b000000 && F == 6'b001001 ) ? 1'b1 : 1'b0 ;
  JR = ( OP == 6'b000000 && F == 6'b001000 ) ? 1'b1 : 1'b0 ;
  MFHI = ( OP == 6'b000000 && F == 6'b010000 ) ? 1'b1 : 1'b0 ;
  MFLO = ( OP == 6'b000000 && F == 6'b010010 ) ? 1'b1 : 1'b0 ;
  MTHI = ( OP == 6'b000000 && F == 6'b010001 ) ? 1'b1 : 1'b0 ;
  MTLO = ( OP == 6'b000000 && F == 6'b010011 ) ? 1'b1 : 1'b0 ;
  ERET = ( OP == 6'b010000 && F == 6'b011000 ) ? 1'b1 : 1'b0 ;
  MFC0 = ( OP == 6'b010000 && RS == 5'b00000 ) ? 1'b1 : 1'b0 ;
  MTC0 = ( OP == 6'b010000 && RS == 5'b00100 ) ? 1'b1 : 1'b0 ;

  PCWr = S1 * ( 1'b0 )
     + S2 * ( J + JR + ERET )
     + S3 * ( BEQ + BNE + BLEZ + BGTZ + BLTZ + BGEZ + JAL + JALR + MFHI + MFLO + MTHI + MTLO + MFC0 + MTC0 )
     + S4 * ( SB + SH + SW + ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR + MULT + MULTU + DIV + DIVU + ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU )
     + S5 * ( LB + LBU + LH + LHU + LW )
     + S6 * ( 1'b0 + EXLSet )
;
  IRWr = S1 * ( LB + LBU + LH + LHU + LW + SB + SH + SW + ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR + MULT + MULTU + DIV + DIVU + ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU + BEQ + BNE + BLEZ + BGTZ + BLTZ + BGEZ + J + JAL + JALR + JR + MFHI + MFLO + MTHI + MTLO + ERET + MFC0 + MTC0 )
     + S2 * ( 1'b0 )
     + S3 * ( 1'b0 )
     + S4 * ( 1'b0 )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;
  GPRWr = S1 * ( 1'b0 )
     + S2 * ( JAL + JALR )
     + S3 * ( MFHI + MFLO + MFC0 )
     + S4 * ( ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR + ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU )
     + S5 * ( LB + LBU + LH + LHU + LW )
     + S6 * ( 1'b0 )
;
  LOWr = S1 * ( 1'b0 )
     + S2 * ( 1'b0 )
     + S3 * ( MULT + MULTU + DIV + DIVU + MTLO )
     + S4 * ( 1'b0 )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;
  HIWr = S1 * ( 1'b0 )
     + S2 * ( 1'b0 )
     + S3 * ( MULT + MULTU + DIV + DIVU + MTHI )
     + S4 * ( 1'b0 )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;
  CP0Wr = S1 * ( 1'b0 )
     + S2 * ( 1'b0 )
     + S3 * ( MTC0 )
     + S4 * ( 1'b0 )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;
  CP0CLRWr = S1 * ( 1'b0 )
     + S2 * ( ERET )
     + S3 * ( 1'b0 )
     + S4 * ( 1'b0 )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;
  DMWr = S1 * ( 1'b0 )
     + S2 * ( 1'b0 )
     + S3 * ( 1'b0 )
     + S4 * ( SB + SH + SW )
     + S5 * ( 1'b0 )
     + S6 * ( 1'b0 )
;

  NPCOp =      LB * S5 ? 3'd0 :
     LBU * S5 ? 3'd0 :
     LH * S5 ? 3'd0 :
     LHU * S5 ? 3'd0 :
     LW * S5 ? 3'd0 :
     SB * S4 ? 3'd0 :
     SH * S4 ? 3'd0 :
     SW * S4 ? 3'd0 :
     ADD * S4 ? 3'd0 :
     ADDU * S4 ? 3'd0 :
     SUB * S4 ? 3'd0 :
     SUBU * S4 ? 3'd0 :
     SLL * S4 ? 3'd0 :
     SRL * S4 ? 3'd0 :
     SRA * S4 ? 3'd0 :
     SLLV * S4 ? 3'd0 :
     SRLV * S4 ? 3'd0 :
     SRAV * S4 ? 3'd0 :
     AND * S4 ? 3'd0 :
     OR * S4 ? 3'd0 :
     XOR * S4 ? 3'd0 :
     NOR * S4 ? 3'd0 :
     MULT * S4 ? 3'd0 :
     MULTU * S4 ? 3'd0 :
     DIV * S4 ? 3'd0 :
     DIVU * S4 ? 3'd0 :
     ADDI * S4 ? 3'd0 :
     ADDIU * S4 ? 3'd0 :
     ANDI * S4 ? 3'd0 :
     ORI * S4 ? 3'd0 :
     XORI * S4 ? 3'd0 :
     LUI * S4 ? 3'd0 :
     SLTI * S4 ? 3'd0 :
     SLTIU * S4 ? 3'd0 :
     BEQ * S1 ? 3'd0 :
     BEQ * Zero * S3 ? 3'd1 :
     BNE * S1 ? 3'd0 :
     BNE * ~Zero * S3 ? 3'd1 :
     BLEZ * S1 ? 3'd0 :
     BLEZ * ( Zero | Sign ) * S3 ? 3'd1 :
     BGTZ * S1 ? 3'd0 :
     BGTZ * ~Sign * ~Zero * S3 ? 3'd1 :
     BLTZ * S1 ? 3'd0 :
     BLTZ * Sign * ~Zero * S3 ? 3'd1 :
     BGEZ * S1 ? 3'd0 :
     BGEZ * ( Zero | ~Sign ) * S3 ? 3'd1 :
     J * S2 ? 3'd2 :
     JAL * S2 ? 3'd0 :
     JAL * S3 ? 3'd2 :
     JALR * S2 ? 3'd0 :
     JALR * S3 ? 3'd3 :
     JR * S2 ? 3'd3 :
     MFHI * S3 ? 3'd0 :
     MFLO * S3 ? 3'd0 :
     MTHI * S3 ? 3'd0 :
     MTLO * S3 ? 3'd0 :
     ERET * S2 ? 3'd4 :
     MFC0 * S3 ? 3'd0 :
     MTC0 * S3 ? 3'd0 :
     3'b0 ;
  WDSel =      LB * S5 ? 3'd0 :
     LBU * S5 ? 3'd0 :
     LH * S5 ? 3'd0 :
     LHU * S5 ? 3'd0 :
     LW * S5 ? 3'd0 :
     ADD * S4 ? 3'd1 :
     ADDU * S4 ? 3'd1 :
     SUB * S4 ? 3'd1 :
     SUBU * S4 ? 3'd1 :
     SLL * S4 ? 3'd1 :
     SRL * S4 ? 3'd1 :
     SRA * S4 ? 3'd1 :
     SLLV * S4 ? 3'd1 :
     SRLV * S4 ? 3'd1 :
     SRAV * S4 ? 3'd1 :
     AND * S4 ? 3'd1 :
     OR * S4 ? 3'd1 :
     XOR * S4 ? 3'd1 :
     NOR * S4 ? 3'd1 :
     ADDI * S4 ? 3'd1 :
     ADDIU * S4 ? 3'd1 :
     ANDI * S4 ? 3'd1 :
     ORI * S4 ? 3'd1 :
     XORI * S4 ? 3'd1 :
     LUI * S4 ? 3'd1 :
     SLTI * S4 ? 3'd1 :
     SLTIU * S4 ? 3'd1 :
     JAL * S2 ? 3'd2 :
     JALR * S2 ? 3'd2 :
     MFHI * S3 ? 3'd3 :
     MFLO * S3 ? 3'd4 :
     MFC0 * S3 ? 3'd5 :
     3'b0 ;
  GPRSel =      LB * S5 ? 2'd0 :
     LBU * S5 ? 2'd0 :
     LH * S5 ? 2'd0 :
     LHU * S5 ? 2'd0 :
     LW * S5 ? 2'd0 :
     ADD * S4 ? 2'd1 :
     ADDU * S4 ? 2'd1 :
     SUB * S4 ? 2'd1 :
     SUBU * S4 ? 2'd1 :
     SLL * S4 ? 2'd1 :
     SRL * S4 ? 2'd1 :
     SRA * S4 ? 2'd1 :
     SLLV * S4 ? 2'd1 :
     SRLV * S4 ? 2'd1 :
     SRAV * S4 ? 2'd1 :
     AND * S4 ? 2'd1 :
     OR * S4 ? 2'd1 :
     XOR * S4 ? 2'd1 :
     NOR * S4 ? 2'd1 :
     ADDI * S4 ? 2'd0 :
     ADDIU * S4 ? 2'd0 :
     ANDI * S4 ? 2'd0 :
     ORI * S4 ? 2'd0 :
     XORI * S4 ? 2'd0 :
     LUI * S4 ? 2'd0 :
     SLTI * S4 ? 2'd0 :
     SLTIU * S4 ? 2'd0 :
     JAL * S2 ? 2'd2 :
     JALR * S2 ? 2'd1 :
     MFHI * S3 ? 2'd1 :
     MFLO * S3 ? 2'd1 :
     MFC0 * S3 ? 2'd0 :
     2'b0 ;
  ExtOp =      LB * S3 ? 1'd0 :
     LBU * S3 ? 1'd0 :
     LH * S3 ? 1'd0 :
     LHU * S3 ? 1'd0 :
     LW * S3 ? 1'd0 :
     SB * S3 ? 1'd0 :
     SH * S3 ? 1'd0 :
     SW * S3 ? 1'd0 :
     ADDI * S3 ? 1'd0 :
     ADDIU * S3 ? 1'd0 :
     ANDI * S3 ? 1'd1 :
     ORI * S3 ? 1'd1 :
     XORI * S3 ? 1'd1 :
     LUI * S3 ? 1'd1 :
     SLTI * S3 ? 1'd0 :
     SLTIU * S3 ? 1'd0 :
     1'b0 ;
  BSel =      LB * S3 ? 1'd0 :
     LBU * S3 ? 1'd0 :
     LH * S3 ? 1'd0 :
     LHU * S3 ? 1'd0 :
     LW * S3 ? 1'd0 :
     SB * S3 ? 1'd0 :
     SH * S3 ? 1'd0 :
     SW * S3 ? 1'd0 :
     ADD * S3 ? 1'd1 :
     ADDU * S3 ? 1'd1 :
     SUB * S3 ? 1'd1 :
     SUBU * S3 ? 1'd1 :
     SLL * S3 ? 1'd1 :
     SRL * S3 ? 1'd1 :
     SRA * S3 ? 1'd1 :
     SLLV * S3 ? 1'd1 :
     SRLV * S3 ? 1'd1 :
     SRAV * S3 ? 1'd1 :
     AND * S3 ? 1'd1 :
     OR * S3 ? 1'd1 :
     XOR * S3 ? 1'd1 :
     NOR * S3 ? 1'd1 :
     MULT * S3 ? 1'd1 :
     MULTU * S3 ? 1'd1 :
     DIV * S3 ? 1'd1 :
     DIVU * S3 ? 1'd1 :
     ADDI * S3 ? 1'd0 :
     ADDIU * S3 ? 1'd0 :
     ANDI * S3 ? 1'd0 :
     ORI * S3 ? 1'd0 :
     XORI * S3 ? 1'd0 :
     LUI * S3 ? 1'd0 :
     SLTI * S3 ? 1'd0 :
     SLTIU * S3 ? 1'd0 :
     BEQ * S3 ? 1'd1 :
     BNE * S3 ? 1'd1 :
     BLEZ * S3 ? 1'd1 :
     BGTZ * S3 ? 1'd1 :
     BLTZ * S3 ? 1'd1 :
     BGEZ * S3 ? 1'd1 :
     1'b0 ;
  ALUOp =      LB * S3 ? 4'd0 :
     LBU * S3 ? 4'd0 :
     LH * S3 ? 4'd0 :
     LHU * S3 ? 4'd0 :
     LW * S3 ? 4'd0 :
     SB * S3 ? 4'd0 :
     SH * S3 ? 4'd0 :
     SW * S3 ? 4'd0 :
     ADD * S3 ? 4'd0 :
     ADDU * S3 ? 4'd0 :
     SUB * S3 ? 4'd1 :
     SUBU * S3 ? 4'd1 :
     SLL * S3 ? 4'd2 :
     SRL * S3 ? 4'd3 :
     SRA * S3 ? 4'd4 :
     SLLV * S3 ? 4'd2 :
     SRLV * S3 ? 4'd3 :
     SRAV * S3 ? 4'd4 :
     AND * S3 ? 4'd5 :
     OR * S3 ? 4'd6 :
     XOR * S3 ? 4'd7 :
     NOR * S3 ? 4'd8 :
     MULT * S3 ? 4'd9 :
     MULTU * S3 ? 4'd10 :
     DIV * S3 ? 4'd11 :
     DIVU * S3 ? 4'd12 :
     ADDI * S3 ? 4'd0 :
     ADDIU * S3 ? 4'd0 :
     ANDI * S3 ? 4'd5 :
     ORI * S3 ? 4'd6 :
     XORI * S3 ? 4'd7 :
     LUI * S3 ? 4'd2 :
     SLTI * S3 ? 4'd13 :
     SLTIU * S3 ? 4'd14 :
     BEQ * S3 ? 4'd1 :
     BNE * S3 ? 4'd1 :
     BLEZ * S3 ? 4'd1 :
     BGTZ * S3 ? 4'd1 :
     BLTZ * S3 ? 4'd1 :
     BGEZ * S3 ? 4'd1 :
     4'b0 ;
  ALUMovOp =      SLL * S3 ? 2'd0 :
     SRL * S3 ? 2'd0 :
     SRA * S3 ? 2'd0 :
     SLLV * S3 ? 2'd1 :
     SRLV * S3 ? 2'd1 :
     SRAV * S3 ? 2'd1 :
     LUI * S3 ? 2'd2 :
     2'b0 ;
  BESel =      LB * S4 ? 2'd0 :
     LBU * S4 ? 2'd0 :
     LH * S4 ? 2'd1 :
     LHU * S4 ? 2'd1 :
     LW * S4 ? 2'd2 :
     SB * S4 ? 2'd0 :
     SH * S4 ? 2'd1 :
     SW * S4 ? 2'd2 :
     1'b0 ;
  BExtOP =      LB * S4 ? 1'd0 :
     LBU * S4 ? 1'd1 :
     LH * S4 ? 1'd0 :
     LHU * S4 ? 1'd1 :
     LW * S4 ? 1'd0 :
     1'b0 ;
  GPRR2Sel =      LB * S2 ? 1'd0 :
     BLTZ * S2 ? 1'd1 :
     BGEZ * S2 ? 1'd1 :
     MFC0 * S3 ? 1'd0 :
     MTC0 * S3 ? 1'd0 :
     1'b0 ;
end
  always @ ( posedge clk )                                   
  begin                                                      
  count = next_count ;                                       
  end                                                        
                                                             
  always @ ( negedge clk )                                   
  begin                                                      
  next_count = 3'd1 ;                                            
  case( count )                                              
		3'd0 :next_count = 3'd1 ;                                       
		3'd1 :next_count = 3'd2 ;                                     
		3'd2 :next_count = ( J + JR + ERET + 1'b0 ) ? 3'd6 : 3'd3 ;
		3'd3 :next_count = ( 
 BNE + BLEZ + BGTZ + BLTZ + BGEZ + JAL + JALR + MFHI + MFLO + MTHI + MTLO + MFC0 + MTC0 + BEQ + 1'b0 ) ? 3'd6 : 3'd4 ;
		3'd4 :next_count = ( 
SB + SH + SW + ADD + ADDU + SUB + SUBU + SLL + SRL + SRA + SLLV + SRLV + SRAV + AND + OR + XOR + NOR + MULT + MULTU + DIV + DIVU + ADDI + ADDIU + ANDI + ORI + XORI + LUI + SLTI + SLTIU + 1'b0 ) ? 3'd6 : 3'd5 ;
		3'd5 :next_count = ( 
LB + LBU + LH + LHU + LW + 1'b0 ) ? 3'd6 : 3'd6 ;
		3'd6 :next_count = 3'd1 ;                                     
      default:next_count = 3'd0 ;                                
    endcase                                                  
  end                                                        
endmodule
