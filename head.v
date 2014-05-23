//ctrl
`define GPRR2SEl_R2_0 		1'b1
`define GPRR2SEl_RT 		1'b0
`define EXTOP_SIGN			1'b1
`define	EXTOP_ZERO			1'b0
`define BSEL_EXT			1'b1
`define BSEL_B				1'b0
`define ALU_ADD				4'h0
`define ALU_SUB				4'h1
`define ALU_SLL				4'h2
`define ALU_SLR				4'h3
`define ALU_SRA				4'h4
`define ALU_AND				4'H5
`define ALU_OR				4'h6
`define ALU_XOR				4'h7
`define ALU_NOR				4'h8
`define ALU_MULT			4'h9
`define ALU_MULTU			4'ha
`define ALU_DIV				4'hb
`define ALU_DIVU			4'hc
`define ALU_SLT				4'hd
`define ALU_SLTU			4'he
`define	ALU_MOV_S			2'd0
`define	ALU_MOV_M_RS		2'd1
`define	ALU_MOV_M_16		2'd2
`define LOSEL_C				1'b0
`define LOSEL_R				1'b1
`define HISEL_C				1'b0
`define HISEL_R				1'b1
`define GPRSEL_RT			2'd0
`define GPRSEL_RD			2'd1
`define GPRSEL_31			2'd2
`define NPC_BEQ				2'd0
`define NPC_J				2'd1
`define NPC_JR				2'd2
`define BESEL_B				2'd0
`define BESEL_H				2'd1
`define BESEL_W				2'd2
`define BEXTOP_SIGN			1'b0
`define BEXTOP_ZERO			1'b1
`define WDSEL_DM			3'd0
`define WDSEL_ALUOUT		3'd1
`define WDSEL_NPC			3'd2
`define WDSEL_HI			3'd3
`define WDSEL_LO			3'd4
`define WDSEL_CP0			3'd5
`define PCSEL_PC_4			2'd0
`define PCSEL_BJ			2'd1
`define	PCSEL_JAL			2'd2
`define	PCSEL_JALR			2'd3
`define GPR_BYPASS_RD		3'd0
`define GPR_BYPASS_ALU_E	3'd1
`define GPR_BYPASS_PC_E		3'd2
`define GPR_BYPASS_DM_M		3'd3
`define GPR_BYPASS_ALU_M	3'd4
`define GPR_BYPASS_PC_M		3'd5
`define ALU_BYPASS_RD		1'b0
`define ALU_BYPASS_DM_M		1'b1

//bridge
//dev address
//counter
`define COUNTER_ADD_1 		32'h0000_7f00
`define COUNTER_ADD_2 		32'h0000_7f04
`define COUNTER_ADD_3 		32'h0000_7f08
//switch
`define SWITCH_ADD 			32'h0000_7f0c
//led
`define LED_ADD_1 			32'h0000_7f10
`define LED_ADD_2 			32'h0000_7f14

//coco_counter
//reset value
`define COUNTER_RST_CTRL 	4'b1001
`define COUNTER_RST_PRESENT 32'h32
`define COUNTER_RST_COUNT 	32'h32
//reg address
`define COUNTER_ADD_CTRL 	2'b00
`define COUNTER_ADD_PRESENT 2'b01
`define COUNTER_ADD_COUNT 	2'b10
//count
`define COUNTER_PRESENT_0 	32'b0
//ctrl mode
`define COUNTER_CTRL_MODE0 	2'b00
`define COUNTER_CTRL_MODE1 	2'b01

//dm
//dm address
`define DM_ADD_1 			4'h0
`define DM_ADD_2 			4'h1
`define DM_ADD_3 			4'h2

//gpr
//gpr address
`define GPR_31 				5'h1f

//LED
//FSM
`define LED_FSM_1 			2'b00
`define LED_FSM_2 			2'b01
`define LED_FSM_3 			2'b10
`define LED_FSM_4 			2'b11
//COUNT
`define LED_COUNT 			8'h10
//NUM			
`define LED_NUM_0 			4'h0
`define LED_NUM_1 			4'h1
`define LED_NUM_2 			4'h2
`define LED_NUM_3 			4'h3
`define LED_NUM_4 			4'h4
`define LED_NUM_5 			4'h5
`define LED_NUM_6 			4'h6
`define LED_NUM_7 			4'h7
`define LED_NUM_8 			4'h8
`define LED_NUM_9 			4'h9
`define LED_NUM_A 			4'ha
`define LED_NUM_B 			4'hb
`define LED_NUM_C 			4'hc
`define LED_NUM_D 			4'hd
`define LED_NUM_E 			4'he
`define LED_NUM_F 			4'hf
`define LED_NUM_L 			4'h15
`define LED_NUM_O 			4'h19
//LED
`define LED_0 				8'b00000011
`define LED_1 				8'b10011111
`define LED_2 				8'b00100101
`define LED_3 				8'b00001101
`define LED_4 				8'b10011001
`define LED_5 				8'b01001001
`define LED_6 				8'b01000001
`define LED_7 				8'b00011111
`define LED_8 				8'b00000001
`define LED_9 				8'b00001001
`define LED_A 				8'b00010000
`define LED_B 				8'b00000000
`define LED_C 				8'b01100010
`define LED_D 				8'b00000010
`define LED_E 				8'b01100000
`define LED_F 				8'b01110000
`define LED_H 				8'b10010000
`define LED_L 				8'b11100010
`define LED_O 				8'b00000010
//MODE
`define LED_MODE_0 			1'b0
`define LED_MODE_1 			1'b1