lw $25,0($24)		//$25=LED_PRESENT_VALUE
addi $25,$25,1		//$25=$25+1
sw $25,0($24)		//LED_PRESENT_VALUE=$25
sw $20,0($5)		//COUNTER_CTRL=COUNTER_CTRL_VALUE=4'B1001
sw $21,0($7)		//COUNTER_PRESENT_COUNTER_PRESENT_VALUE=10^7
eret				//BACK
